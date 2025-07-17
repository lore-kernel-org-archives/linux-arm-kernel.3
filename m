Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D57DC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 16:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SEjYoBcwqDptwkNDt9J1x/LYBRGTVclbAUkgXREtLhI=; b=EC+oXiOqsfXDzs6Xov0fjeC+Zw
	VYYXghvCYWpgbbtpnVxH7E4Y8ANNngsHWlFwVp2ukDHBjNNbzfvljVuZYR+OT4XATvGK58QRAOwU6
	JG/0q75fBeuGFPH9M+GyusQNMGjkL7mQmG9OevkaN0WYj0R1Ix+WfhpxoL1fNKgtjuZCoTlWfWLc/
	Mybr1uhmU6ZciO1coyxuuBdHJjprSawkf83ukQ9dMAGW6uSj8P2ey/VqcuoSnpR+hzPcaNcEj1ggq
	NKA32nFsOpfvxuDXXd7CGWOrQN+jQ0PJ0SKZRhgX0JuTsRPacWvG1xURoKYBIJAMP8QZcUGSw9qAs
	e1Z6gLxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRq0-0000000AhOu-31v1;
	Thu, 17 Jul 2025 16:52:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQFs-0000000ATqb-0PzC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 15:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752765038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SEjYoBcwqDptwkNDt9J1x/LYBRGTVclbAUkgXREtLhI=;
	b=G4Ssq28fSYZAG8Gse4+K+v/Gc/KZOYIOFOuMbEtpY59Ul30A6KrTgFG91ByUYZidHvfLvE
	plAgZpbZenSisl+z79UupA3L4OBGojqY6mrjC55ELKxaMOTVbX1sWK+oPmo6GXMvcgxah5
	QnRSkrb0PDHZDRSvFz6pPE/C6xCPZdc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-g82Rpxt_Nk-8BPyOY4qHlw-1; Thu, 17 Jul 2025 11:10:35 -0400
X-MC-Unique: g82Rpxt_Nk-8BPyOY4qHlw-1
X-Mimecast-MFC-AGG-ID: g82Rpxt_Nk-8BPyOY4qHlw_1752765034
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-456013b59c1so6172265e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 08:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752765034; x=1753369834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SEjYoBcwqDptwkNDt9J1x/LYBRGTVclbAUkgXREtLhI=;
        b=NIlmoc4AJ644KMm8qcVhj41Cv1Z8+LFfreK7SEd2ltIFbGyTzw5XEt2PYmLiil4jdL
         HocOthKjQrfkRvb/BaFt7qOANIGv1JCxxyN4bsyDsYZ0Lm1ctxE3ObZZOK5kAeJx7MhH
         BxcbxQSpMIHT+OY8c1elyec0WAZu2HGipiwNgQQ4gMA2bvyTTrShL2zSRAkqdmfy1oih
         h8IYQq/haNIU2P00EHIVQX5Gv0MDHF9n1dsWFwUP+s3GFfu8JBpmczicwcJp/s/cowEs
         aICKJwoZy7+HlbX4XeC0MCD9HBcOWu7JlJt3cB1LcRM57862wR6zeSwT8LDBw6u5yRVU
         5pAA==
X-Forwarded-Encrypted: i=1; AJvYcCWcY4L0E2kTTfH6HdisKY77X/QtbR4lCBphNrxirBu6ra1wnj27UvyMetkUfI6DtjNwVy6O351dJxm+e6oIvucG@lists.infradead.org
X-Gm-Message-State: AOJu0YwfBnWP5sOnAmy2PUla3DbZKOeTsR2cA5hce7vQ6S9JEWCR3124
	h/nBNKLOsxvZskq1AKi7MXbN6lCK4/Ye+GiadC3/S+KNmGpDC7pYi9Jes50av/eL2fj3OJKAIqA
	8dxCWpi7XBa7jiBN3RE79K7fIF4f0RGyVo4fNgjS7NUZZhQzXYPICVsNzH9/wMNKam0a2DKopPr
	v3uytfbR3NZuWhjri0ts++Zg/Ce3fxaZomu/DCx8rjyWYgbu/0kn0=
X-Gm-Gg: ASbGnctl6SUoMocRWgTuLhLEZIOkafU93eEnTrDKwUrSS7pXN69NnCo4ifnsWctMaKE
	qUHL/r53rIn3MHqHOvxQc4CSr9BR2be5rXSOQbPFSdILoRoQzIumrGT5xtgweCG2I32Pk+xaVVP
	lLxV4+XenyzPdqQEBPSYex
X-Received: by 2002:a05:600c:8206:b0:456:1ac8:cac8 with SMTP id 5b1f17b1804b1-456389d8648mr20322705e9.15.1752765034259;
        Thu, 17 Jul 2025 08:10:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqFKu12WNYkyuv+EBrH40VIjm3DSpAGBvOZK5BRr1yGNQvSYPEChTjgLpLHbHmtfrETxQh9JFrb2OtUf6QmQA=
X-Received: by 2002:a05:600c:8206:b0:456:1ac8:cac8 with SMTP id
 5b1f17b1804b1-456389d8648mr20322395e9.15.1752765033769; Thu, 17 Jul 2025
 08:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250711084835.2411230-1-maz@kernel.org>
In-Reply-To: <20250711084835.2411230-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 17 Jul 2025 17:10:21 +0200
X-Gm-Features: Ac12FXzzA7dEcA7kGiq4t8H3V98DgvDEFcCmXVWP7oItkogbslxByYn5IOuKZ9c
Message-ID: <CABgObfbEXvmbSFdku=bRKaB+1Pe9g_7ZuVmy-vmgJwUczA99cg@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 6.16, take #6
To: Marc Zyngier <maz@kernel.org>
Cc: Ben Horgan <ben.horgan@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -ErjuwfbkLP7odWQ1dssw9f47asZFUy39PXrgjjsASg_1752765034
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_081040_208983_994F7021 
X-CRM114-Status: GOOD (  12.71  )
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

On Fri, Jul 11, 2025 at 10:49=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrot=
e:
>
> Paolo,
>
> Here the (hopefully) last fix for 6.16, addressing what can adequately
> be called a brain fart in dealing with the sanitisation of the number
> of PMU registers in nested virt.
>
> Please pull,
>
>         M.
>
> The following changes since commit 42ce432522a17685f5a84529de49e555477c0a=
1f:
>
>   KVM: arm64: Remove kvm_arch_vcpu_run_map_fp() (2025-07-03 10:39:24 +010=
0)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kv=
marm-fixes-6.16-6
>
> for you to fetch changes up to 2265c08ec393ef1f5ef5019add0ab1e3a7ee0b79:
>
>   KVM: arm64: Fix enforcement of upper bound on MDCR_EL2.HPMN (2025-07-09=
 13:19:24 +0100)

Pulled, thanks.

Paolo

> ----------------------------------------------------------------
> KVM/arm64 fixes for 6.16, take #6
>
> - Fix use of u64_replace_bits() in adjusting the guest's view of
>   MDCR_EL2.HPMN.
>
> ----------------------------------------------------------------
> Ben Horgan (1):
>       KVM: arm64: Fix enforcement of upper bound on MDCR_EL2.HPMN
>
>  arch/arm64/kvm/sys_regs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>


