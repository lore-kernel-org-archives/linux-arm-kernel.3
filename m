Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4A1C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMNFpvzy5MfR1oz3Xik6QKGfu+2zB21OUn6rfuSU1is=; b=ys8hqJgFdB9er0yI1r4lMkpd6g
	Fls6vF02MfTKsvUKS1MaeIwuc5A8FHsyM2ptGBm8E1tma3P7lE4zHRoOO1sELpJQ9W24YehXmT/yV
	Cn8FhcCCZ8FJNXWemvOsfhUwzHxzVTIjhT6ByGKzZG33kls5OPElVjWUsXyRI+LeMGCczywLdyZUQ
	76S8AgGVBtt4WVmGPmknkiVz7QUkwTgjSaOxCNJ35yL/qjhv4U6NpJ/AYCNRMzziWEeGGN+0UREDW
	KqrwkffcocIgpeIYGCfRPFH5KCFfFq2pKbnCW82HnSqDmT1+qlrqGVbuXrQ16WwOV6tPudqduVDuK
	husDs8Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojwJ-00000005g9Y-3tQ8;
	Tue, 28 Jul 2026 15:41:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojwB-00000005g7w-47TV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:41:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785253305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rMNFpvzy5MfR1oz3Xik6QKGfu+2zB21OUn6rfuSU1is=;
	b=IkNORlI5snKxZnFiEST/omcfbm96Roiow+IzHAMufjxng1vO+QHjXAX0tyaOkgIVpiwqQw
	2D4iRBqr1hoqQd+vAtqxFXvxzWCTDc+riK50BJvP0hPfQrmVX2a2qLMzaebQ5yM0zJsifT
	h3FtWYsZAecctawipfZt9+o9AuAM/V0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-MhvfTzKqMXeuZuuHQpivzw-1; Tue, 28 Jul 2026 11:41:44 -0400
X-MC-Unique: MhvfTzKqMXeuZuuHQpivzw-1
X-Mimecast-MFC-AGG-ID: MhvfTzKqMXeuZuuHQpivzw_1785253303
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47f83450a8eso18307f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 08:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253303; x=1785858103;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rMNFpvzy5MfR1oz3Xik6QKGfu+2zB21OUn6rfuSU1is=;
        b=aKnX4Ahdg9xHO1CeCLNjujqEKSe3s+AIfitmtc/psTp1clnUfYtmom+aU8wE8Ma3zY
         +hhJu9bH2V2z84zJuv2gwv3FDBq/N9cnCfmvEJITAizhIzqx0EN5ym9DYa7du4IBRWvG
         aAn4/Q2W5336ZJZ6IBdrlw66z7jjNGRPg5WTJg1Gi3zQRtBJ40CAoBKFc/QCOYPmC2ER
         5zDtNucRk1h649rEILcFCeAZZ5XQkaqw9ON2cBhgrbv2YirWWAzf8DyWYkhuRQFMq9bR
         WJPNo7+eamlNZRzADpdnL7BXsJdEZnoXdUJ2fzA1ZHp3xRcY/Ci0jqhEIyjLhBdpECyF
         Q+OA==
X-Forwarded-Encrypted: i=1; AHgh+Rq4Af4vfqvgkfvcyxZtnoFp3f2wTSFbcUCaYmGQZQ0LGVkALmJ4KaOne8IeignPKck2nH4oL9MzP0+W6qic5tvm@lists.infradead.org
X-Gm-Message-State: AOJu0YxcrvZ5VMIxldfp3qW2VcR3Zw8/w4kDazHcvYp+iZfKuO05RtgH
	qoAZrBIq/7MxxLiNPcjB5JxPZNi38dWClek9N6gVQsqfHfXbGpCbEOHib41BJ+917HkyzsNa+F0
	4dtCtSNnzDlNYgKLbJfPdNwDo6J+dSzfSG3Dh/Gf3JxIGE61Pe+2Gf7dIPPV5mlqgzDapnbP2kO
	ZNPwrsWJaFSko2WzspJqA3KSCVc+D/v6qpqGmdRI5CtP3M0QV8spFE6rbvZss=
X-Gm-Gg: AR+sD11P4gEREMyE/+aNOIchGRemqy7bfv79g06RUaJQCec67JjY6tD1DGk/ujk163y
	OLZyv5Xg79ZddyQj9nQHxYU+jy6mPT8WS9HiDLF1XQJJO2sUbUOuixixzqdwHAv/63C7RGWusDG
	lxB7mjx7qXnmZWJuKhTXT+rXYSM68Is42n+JGpY686y84VsRlaVYJVGYPoenrq15SnPb9li3c0h
	JTwgM3PBUgaa1H0muYNisudh9TTSrAtw6e4uwLOywv8Ij1f341l1tphCkjUpg==
X-Received: by 2002:a05:600c:4744:b0:495:40f0:e77 with SMTP id 5b1f17b1804b1-496c6415054mr33062415e9.5.1785253302860;
        Tue, 28 Jul 2026 08:41:42 -0700 (PDT)
X-Received: by 2002:a05:600c:4744:b0:495:40f0:e77 with SMTP id
 5b1f17b1804b1-496c6415054mr33062185e9.5.1785253302495; Tue, 28 Jul 2026
 08:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260724084742.3358321-1-maz@kernel.org>
In-Reply-To: <20260724084742.3358321-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 28 Jul 2026 17:41:30 +0200
X-Gm-Features: AUfX_mxhUuq42c31F7OP6DNvw1uz5kBf-VSuqSgDiWSNEUPnMa8_Yyxglsm-09o
Message-ID: <CABgObfbvvYDC6gyhw_FBPi7Bo35WPuaSyyVDkz7HA1M6wdx5vA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 7.2, take #3
To: Marc Zyngier <maz@kernel.org>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>, 
	D Scott Phillips <scott@os.amperecomputing.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Vincent Donnefort <vdonnefort@google.com>, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: INbBXY2CyBZ9QpO5vm_01TN7A_N2LtlS4-Iamptsq6k_1785253303
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_084148_090840_5E6DB621 
X-CRM114-Status: GOOD (  10.09  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Jul 24, 2026 at 10:47=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrot=
e:
>
> Paolo,
>
> Here's another set of KVM/arm64 fixes for 7.2. A bunch of fixes for
> AI-discovered issues, with two main areas of activity:
>
> - plugging annoying LPI mapping races
>
> - fixing corner cases in the EL2 tracing management
>
> The rest is a heady mix of CPU errata workaround, API tidy up and low
> impact fixes.
>
> Please pull,
>
>         M.
>
> The following changes since commit 1590cf0329716306e948a8fc29f1d3ee87d398=
9f:
>
>   Linux 7.2-rc4 (2026-07-19 13:54:41 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kv=
marm-fixes-7.2-3

Pulled, thanks.

Paolo


