Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F720C88E6E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vgpXzQkqjRG72pPUcA2DdlErwsGiqbABsm7Ki31FHJ0=; b=cdh46gn+x4/q1gnmO2jjAcTVWP
	IfuVYidTKShgJi8k2J/mGjEw+L+JjUywHzprdzMnbjzQiaHxOGQc/0gM5VxuLyD9B/kkKCsl1BxY1
	6SFB/mLRQsFaLIPso2I9ZgrF1fQbNL7uUWTiGyCHAnLjWLWLKnduUS9+IXry1dCNMoBFrKxleJuZ9
	N2xL+G8mNaVMAup3CQwMAgESX/t+6N1+zQntrP3eCBDEivG47l3Wr8491IJsYkVyJBBzHlz3Y7/f9
	G/EqgGLpfcuf57EArX04ImVqwK0oW4ThqTvfsoo3MBsbTQxDcCZjSKKKr8Txg1pnWwr8RfADLJ/IP
	npHc6nlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62Fv-00000002nPg-0vZZ;
	Mon, 14 Sep 2026 08:41:39 +0000
Received: from out-120.mta0.migadu.com ([2001:41d0:1004:224b::78] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62Fq-00000002nJv-2s9y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 08:41:36 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=kq8ONLBCKhnRKMHSTGyauq/vhUxAF/qU9WrtB+UmJdE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789375291; v=1; x=1789980091;
 b=UfLYXqtfip7XgTjBPINJHtZcClck2724WJbpvCYjSrFLSFnjKTVZaIPdBd0TuqO3b8XErYWN
 VeLpOi4gSHMjQZ9dlunBQvV/7QJqMBPIrWcapmHocOupyylbG6zz97YXFximfbmQrv2dxm8Sa5W
 QdL+k1btm+sp7y1zmQ0IlfwE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 37541fc12060837a;
	Mon, 14 Sep 2026 08:41:31 +0000
X-Mizu-Trace-ID: 37541fc12060837a
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b78e073980so5929e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 01:41:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxuTXtGC7Uu06TXyrOaowTZnJb0FBDyuScjRvDGip/a6B+U9jcOlT5jwh/KqfbCqj8lukMbJqsgI0AM0+43APxI@lists.infradead.org
X-Gm-Message-State: AFuF++lkBwTiTMB2AfiFK4nbXM88q9b8ORtoiFP5EfkfLpa/qmYDNz3Z
	sHNtouNRSLGLU+KlN1YjhBktfRxKOqhF5fSltwTVP8t6TmfM7iOz3F6vkA/DzOya/3Pgn9xQRDD
	fhM4rQ1yYAk18StO3FCryiXT5o0PB/JYQSXgE8n5+
X-Received: by 2002:ac2:5681:0:b0:5ae:b1b3:145a with SMTP id
 2adb3069b0e04-5b8ae4c4829mr34163e87.6.1789375286167; Mon, 14 Sep 2026
 01:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260914075839.4019904-1-vdonnefort@google.com> <864ifs6xn4.wl-maz@kernel.org>
In-Reply-To: <864ifs6xn4.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 14 Sep 2026 09:40:49 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzo0CkWn71u5oUu+7N5rJPSqQet=ZOX0NiDeCCS5_WmKg@mail.gmail.com>
X-Gm-Features: AcwNN1WueFHNfiNwCU61DH-wtI4voCuC5YQoJp8Lcgui_VK5ffKNHoGcfiMKeZA
Message-ID: <CA+EHjTzo0CkWn71u5oUu+7N5rJPSqQet=ZOX0NiDeCCS5_WmKg@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: Fix protected VM fault on system with
 pages larger than 4K
To: Marc Zyngier <maz@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_014135_694857_863F9772 
X-CRM114-Status: GOOD (  10.24  )
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

On Mon, 14 Sept 2026 at 09:32, Marc Zyngier <maz@kernel.org> wrote:
...

> It is a bit annoying that neither gmem nor pkvm are using
> kvm_s2_fault_vma_info, which has the ability to reports all the
> important stuff, as it would avoid this sort of bugs.

That's on my list of things to tidy up, fwiw.

/fuad

>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

