Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2848C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCKItQycxeia+cenpj/sZXV0+k+TPgXAs4fFmR/cfVE=; b=XhAtbZ+3MqH/sedvf2S+ClB8xV
	QIdB6Nf+2hTJGGgbdx9KvuOYnaXY6EW2YtEmCNrLxRg9PbMR0FPBkCK+XEjB6DQOlObTvhmBdBUfF
	H0LD2eRF6Cyl1iQzhpzg0KeR74gaOjojA4+2kuKe0WxmsHkcoA7OGrtrMMC5iClncOx+gfELGKlB3
	MB/LSnSCTbE3TrwSNDd4T/DphGA4UQJBE0xQiZZ2ahuJanFpgx4acvBZBFDeiCOcKOybZZFg9IfEA
	bX5lIt2zeEW53gUuwSSqbniGdgJKUylaqHj6nNcLQ9TEekspU5CwALsDluNC6Y6l6H3l8UIMZ/2X9
	cMkAZl9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Eg-00000005R17-2QyL;
	Tue, 22 Sep 2026 13:08:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90EZ-00000005Qya-3xmU
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 13:08:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UCKItQycxeia+cenpj/sZXV0+k+TPgXAs4fFmR/cfVE=; b=Go5ILdGX0x6rwIAwsl3MuV/HQr
	KL5ML5uNTmgVrdS27QknJ+G0QbDOwdHEXxQ+FPYjjeSvwA5Hpg4+NGSiJPLPIKKhOlKnBHttDm92T
	RlyRBicJwG51MuD74esrAAPpiUdtSA/IXR7oZgw9UEP/8QuRkmqcCUN4fupcPEwJJBdSI9JRTCLbf
	mJ82UtyCuFkDJpkdzF6wGHLwapEb35DMnbcP0cSSDVZAVjEmy5djbf8Zopl1xLdiGpt0ODRE4osBw
	nhc2FY/M92ODHQCoBRnXlVY1ArlaLvZgq3p2ua1tbkSICb0BJHAKc3DtKMVaK5Yxg3zedFUA3JviO
	Mkmtiqfw==;
Received: from mail-ed1-x547.google.com ([2a00:1450:4864:20::547])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x90EX-0000000DbBP-0iyB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:08:30 +0000
Received: by mail-ed1-x547.google.com with SMTP id 4fb4d7f45d1cf-6a615ab0c06so5294712a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082507; x=1790687307; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UCKItQycxeia+cenpj/sZXV0+k+TPgXAs4fFmR/cfVE=;
        b=f8e4EjHGB73kG8blk/tgjhBRn5kyhp2Kf4pH37+1h279oVWaxY87LrltIdgdeinSVM
         94vbwaayBs55eJOBw8xbidFgh0ENXD+up7CiXMShKY9IZpwCq0mRpsNUJ1irWHPs94pf
         R/aAacsC8TfkRSbZzPz8f5NnQpyFFfzOSbNW+NAX375en7lP27JRkPo8mP/ExyNXm9TW
         9+oerNGnvedlEkAD6ZOJQfrIsnvFUc+WGjffKoW76NvubA/HBSguNv1C6TRpV1lgDQjY
         I1+rxz+20fX0IRohD18ebDKkosiqHTbbWRp9+38/LSoCzyqNTQDDjqS6RWl5qoziOHr5
         9tUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082507; x=1790687307;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UCKItQycxeia+cenpj/sZXV0+k+TPgXAs4fFmR/cfVE=;
        b=m4HF63n9S+XmjDstMIfY4K1zP360T/wCycwUuD7K41tN2huA9emOUm80iBIqgzf3pc
         mY123XSDZvZYQoInb4KOO3faq6mluGeDTeIi897tlY0EVer2rD1oijBEzRaCyXY64Xsv
         zOhhSKrYcTzVpV0fgSASIA+JJnUTgKXWHnTX8Q5EaYqVANv7gZk+ntaYzmIkOWWteZow
         57Dl1bLllUVisky5mCjGfv85AwpwcErSnPN0oZzPyGhR7O3k99mWfCgTAuN8SVFT1/FI
         f5uRMwtZjKHJi2poKyb0SbB2iGom+nnDyaiz+fO1KJElmmoexUuEZ0Nvlnhyad4bZcqA
         EM0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwbq5+bKrHU1xWr7SUYZrzj9DaS5+QxIE2PmnLashkprh31soHE/EF7toCh1hTArfxHeCt4o6nkzEH1C0WdcN0g@lists.infradead.org
X-Gm-Message-State: AFuF++lGSx23klLP/pfCsOP/ix7McO+XxubUGVRLHBOK9N/UdPPuxqyJ
	EYxtmd/CNwGo5RFUdbXtFGy/0dhJ+ZvUe6LbRKc8CkBgQB6AsqHRgin10JjscxeaKYTd3Z6MHd/
	md6vhGSx8GgRHaBSdyYRV/Q==
X-Received: from edef27.prod.google.com ([2002:a05:6402:a31b:b0:6a6:53de:2717])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2790:b0:6a6:757d:6311 with SMTP id 4fb4d7f45d1cf-6aa5783b5c2mr12915738a12.9.1790082506857;
 Tue, 22 Sep 2026 06:08:26 -0700 (PDT)
Date: Tue, 22 Sep 2026 14:08:16 +0100
In-Reply-To: <20260922130821.1666713-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260922130821.1666713-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922130821.1666713-2-vdonnefort@google.com>
Subject: [PATCH v1 1/6] KVM: arm64: Fix MMFR0 TGRAN advertisement for pVMs
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_140829_321152_14BBBBE9 
X-CRM114-Status: GOOD (  11.81  )
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

Protected VM ID register emulation leaves unlisted fields at 0. This
creates two issues for TGRAN:

  * TGRAN16: 0 means non-implemented. It prevents 16KB protected VMs
    from booting even when the hardware supports it.

  * TGRAN4|TGRAN64: 0 means implemented. This may falsely advertise the
    feature even when the hardware does not support it.

Advertise all the TGRAN fields in pvmid_aa64mmfr0 so that the hardware
support is properly propagated.

Cc: stable@vger.kernel.org
Fixes: 6c30bfb18d0b ("KVM: arm64: Add handlers for protected VM System Registers")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 8758c6801776..ec469d96516a 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -121,6 +121,9 @@ static const struct pvm_ftr_bits pvmid_aa64mmfr0[] = {
 	MAX_FEAT(ID_AA64MMFR0_EL1, SNSMEM, IMP),
 	MAX_FEAT(ID_AA64MMFR0_EL1, BIGENDEL0, IMP),
 	MAX_FEAT(ID_AA64MMFR0_EL1, EXS, IMP),
+	MAX_FEAT(ID_AA64MMFR0_EL1, TGRAN4, IMP),
+	MAX_FEAT(ID_AA64MMFR0_EL1, TGRAN16, IMP),
+	MAX_FEAT(ID_AA64MMFR0_EL1, TGRAN64, IMP),
 	FEAT_END
 };
 
-- 
2.55.0.1082.g2b9226bbc0-goog


