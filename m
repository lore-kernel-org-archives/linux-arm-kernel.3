Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD073C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 05:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBBnfsQ+/vg6cjSZvG+Kg56eu8vn625PDpD6taCDHRs=; b=Kn4GG8PMvOgR4m66l35RhyWzlX
	2a6mTHCfH19fmXJjATEIEUR/jk+JFieF/acNS8L3iuXPiGa9UFd1WXaX0tbeBAHs6AGZ7gFgjYzgf
	TrhMKwp8AAAof7IqDhHfh2cm2aNPav7+DYg2mWl+0h1/AACXMPnxgD1flmUFaK8wkQcjgsshrw2Um
	2fQtlTmQkN6ycAZOA1t95FJ1d33pYdCs8CdY1yCKAuarRiQ+Ga435xGU1RjZaBjSfDcTZRvF7zKdj
	XJW00y3oNuNUbkbpjTMD8Uxae4E+p68N8m7WiWgTes45IrqHn75SibwMOiI9yV1kmVReUB+jqnG8o
	742QtVOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7nTE-0000000FxTH-3eGP;
	Sat, 19 Sep 2026 05:18:40 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7nTC-0000000FxSt-1eMm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 05:18:39 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d3931so10073635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 22:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789795115; x=1790399915; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sBBnfsQ+/vg6cjSZvG+Kg56eu8vn625PDpD6taCDHRs=;
        b=TudYXoWSURmKB+KX32v18Cn8CCdvMUPIA0kK7PGKy6cJS6g6XhVxoqGeY8uXI8KDNt
         +GqOzEnHUXxWosedUGPV2z9M3cjcUP3A7oigBbhtOYxdfy4cIE4JtlXrHImsaEuggpKO
         c7lNwVQQvDPM69vB5Adp4RV1fOlRWKRNX8UqiQRa81ydVIBUuHIAiH+qrb+RJJG4yPAb
         c4X3jWLDL+03QtCmcC6QtmhDrTLYtKiNC814WocKqhEl3qCeNajkCqSqIed4/nJqMLlm
         8EbOZX54mk5UCB3OWY//Ilan0yfonhjKMGe4aaM/q78CmMPZC2SelOlA2rsKyPn5DNHs
         UTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789795115; x=1790399915;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sBBnfsQ+/vg6cjSZvG+Kg56eu8vn625PDpD6taCDHRs=;
        b=Bk0oGxTiVvKzYOGbTtE31iHRBeUFCMaOlfi5sEXedPVRwDKBGIIqMYjumCLg2onAN3
         yzQwHkfkhqY2szSON+1V5DBtObqgeTuAdN5yfb6XYWIqM8qHOHZMXQp+weM0fbXOKj6n
         vY21mu17nI1jqVm0+dzLezt5y3/J7P9rvTpFPUUB5d4OSlXy4bTkeOYJK8gvobn8kmTU
         oYq6/qrE+LnPHmyDD1xj6ejso5DtCsJIl5bfauAhfMvRHEWGDsEfVDfpDEcr36fWm/MY
         KfAPhFLEpGgOvzaHNyWAaAo/PfgZWxFSAYd5lmuf2wMoxkSIOIg05OHWOlKlQOo8C908
         V7cA==
X-Forwarded-Encrypted: i=1; AKwUvByDMzkDnPK0Zq6reqMlfXDFWZUkoCt5jTEpFf1hZYV91fbPkPLRP+JV/YMjT1xz7b6mkNagAA8DS7J5S8Khu3Y0@lists.infradead.org
X-Gm-Message-State: AFuF++kdBcyGqsSdsrRHQzU0Vwe0xBrZNWfZQCOtF706r76NwupEM6/I
	gb6ks6jdv9VxJ1UJ8y0YfMVg24km3WgoC+f17D/uDnX9USbmnxMnlsAj
X-Gm-Gg: AYBFou3dbHQJ+cp1Q4Owvpp5LO01rZKo6/uWzqqOouo/7W55Qm0J1aqMJJ8MyX+Q4kt
	VqZrR0FUjDJXHswn2bSQIGbm1XdnjiuReg/Kl1Fwadq39pPTdsd1soKB2xfUZ6fwRv604C5Tj6O
	ZThdfTll89/kmOax6OKz908c3kg7ZI3qbKEheHoZF+UG1Dt3BOhKGPMEI5yRHSluArM+u/gfPav
	Exx76RplFzlYu4LMK0gOeNmg7UPU4j3+6W9ZTLQfSCSb4/+ZScBAdEv9p8+Wmy+PXDfZd4BVQhj
	fbyCATyBYEx7l47mY0aslKm0cHgfZv3kkUzxeH8h4KsC37KdDQaZGcf/7Abtci1PeR7LAHGmlwM
	DeAyXUFY0fFdKpQpDm+eXPSsMMrip325adMIc1SGoSUW4P7CrSyt/1jwJhPrIJTO1THc2Axs094
	2EcfPZHs2/RX0LHSg9q7e3Si1BMo4ku8LjbzU3TmyiH1uYqBIPlklzRrP43Rnc3833oDobltkoJ
	Dfbt0OMLtfNuImE7FN86/J1g6vOKpg6MwcG/XHWIYagb/qmqLIpp+bFwpX1haRDHuWfm277MJjw
	ksaeLu5hSE9OWok3l0IO6q6a5f8yehE4mM6TOZX1TGatNCd7U26vBW0fQjodLZab9OveUYKeosr
	1riWOzvS6bfFwICg=
X-Received: by 2002:a05:600c:3f0b:b0:49b:d45:703e with SMTP id 5b1f17b1804b1-49fc56aa68amr61228495e9.8.1789795115151;
        Fri, 18 Sep 2026 22:18:35 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcda2140bsm30392735e9.1.2026.09.18.22.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 22:18:33 -0700 (PDT)
Date: Sat, 19 Sep 2026 07:18:32 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix AArch32 DBGBXVR<n> handling
Message-ID: <aq4awYi4eQwgcZ-E@gmail.com>
References: <20260810005616.13227-1-kmehltretter@gmail.com>
 <86qzk69x2j.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86qzk69x2j.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_221838_440812_E3DF6085 
X-CRM114-Status: GOOD (  13.42  )
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

On Mon, Aug 10, 2026 at 09:52:36AM +0100, Marc Zyngier wrote:
> > diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> > index 5d5c579d4579..2862df188155 100644
> > --- a/arch/arm64/kvm/sys_regs.c
> > +++ b/arch/arm64/kvm/sys_regs.c
> > @@ -889,6 +889,7 @@ static u64 *demux_wb_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd)
> >  	struct kvm_guest_debug_arch *dbg = &vcpu->arch.vcpu_debug_state;
> >  
> >  	switch (rd->Op2) {
> > +	case 0b001:
> >  	case 0b100:
> >  		return &dbg->dbg_bvr[rd->CRm];
> >  	case 0b101:
> 
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org
> 

Friendly ping on this patch. It already has a Reviewed-by.

Thanks,
Karl

