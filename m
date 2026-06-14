Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9BCCD98DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 16:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tv4trLugC2C4NI3RAbn0dCrrthQRiHhpJKIFLbS3QSY=; b=WASiM9MCotm37Qte8njzrA1Fyj
	rnZXDIm8CDAiVMgvUyNoffretcE4+wdvsBooomfimf4w9MjFmz5dG79hmC3WjRyqactPPKZT6jcSs
	wsBvacOb0arMqtW7qnpTcYDlj5O97sipN+ii/C9shYh1oYXr8mF2I+Y6BcSG75aqr4PaJiGoOxDYM
	23YxU5qGPlQ3Je/UL/dFENzXBCKVq8JzShPKryS2CRgAvKcsX01TRBKupvoeQTONHeRx3AIp+8rDN
	TvFUVM2benPbzBugAtH3g9jpdqr2zugUxeT0vvoi0syTo4xvgvq0bxRp/Fex8rqwZrbOLop4hU/Jh
	pZ7SnVWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnmV-0000000DAox-40f9;
	Sun, 14 Jun 2026 16:33:55 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnmN-0000000DAjT-49qN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 16:33:49 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490bae3a39bso23205085e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 09:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781454826; x=1782059626; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tv4trLugC2C4NI3RAbn0dCrrthQRiHhpJKIFLbS3QSY=;
        b=ojfu7uMriBcwpIincjMgyWbg10Syk6Z0L4wTvhmaHQpw1AVvVU9BeqOGmjRjjEpAO4
         97VU3QkZCN1M2szrKAGSgOtgt+NY5DNGeYCi7MPlM47406RMxYLyFBE/t8tTKXKej5Sh
         2YSvCLjHh08jmL6F9ReQ6ftUH1tsYLsZe332840OvCpBJcVmo6VT1x82eJPTA64WMGN2
         7Vxlbwv/vO03RhHCjjAqa2It00qOcQ4jGocglVwde6D5aj0CWqWgbWDtF33y3558tCLa
         9hPFM+cYTGDymj6Qsvw7ORXYPcLObghNP1N+cMOBfkrDZSlyLpLf7Ct2mUPPiKvLtp8s
         5/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781454826; x=1782059626;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tv4trLugC2C4NI3RAbn0dCrrthQRiHhpJKIFLbS3QSY=;
        b=UP9hjHrPwGPUo4pyw+VfoerwDaONxrIlqx4+Sq6YRRt96DJ0LuX1859j/dT2tnx5RA
         onD9rucHXsVQsFoiiY+Zow97/ZdXhQFJOoa+ZjNb65YAnZ8RmcnzpvLHrUBSxUwQK155
         kRatTB75zFiVApLYw1JlKj/cNVmSPvy1gFfWOnxPxeMOc8TEAN0cBsQ2asmD5ib4WjmG
         gTupQNWMJ75OLlE8hUshwHcsf44seNblPKJ6EeyGZXVFA0YkuHNHN8d7plK7XzE9Y5nG
         wIst/BHfISNwGwrMEzZpN0zZa08q6xnEkJhHKJy7M6NCeXmx8byBiNfhql7qv3uyMKXM
         8KdA==
X-Forwarded-Encrypted: i=1; AFNElJ/A6Bjn85c9BSM4u/LAj8OdsWA1OL8Wd986YRbaqHilnVhl2mFlJBRIqKV77aaprzovn5PcEmGem43O50GoeJmb@lists.infradead.org
X-Gm-Message-State: AOJu0YzFC+3iz8xsdXyC45ibN/3l6wcPFMknlgRCD5I/z9l+/8KHR0i4
	t/mxfFQZeF/JQulnMpCjfukW1YhoixL+OHLZpWr4yaxlF8eTj45mrMvM9hULSlkpfWK2VACQTQ5
	TWQ==
X-Received: from wmjq15.prod.google.com ([2002:a7b:ce8f:0:b0:490:7e29:9cea])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:8494:10b0:490:c7dd:de3e
 with SMTP id 5b1f17b1804b1-490ec521187mr96160565e9.31.1781454825642; Sun, 14
 Jun 2026 09:33:45 -0700 (PDT)
Date: Sun, 14 Jun 2026 17:33:36 +0100
In-Reply-To: <20260614163336.3490925-1-tabba@google.com>
Mime-Version: 1.0
References: <20260614163336.3490925-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260614163336.3490925-8-tabba@google.com>
Subject: [PATCH 7/7] KVM: arm64: Set IL in fake ESR for pKVM memory sharing exit
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sascha Bischoff <Sascha.Bischoff@arm.com>, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_093348_037900_B4EA3B17 
X-CRM114-Status: GOOD (  11.35  )
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

__pkvm_memshare_page_req() constructs a fake DABT ESR_EL2 to exit to
the host without setting IL. The ESR has ISV=0, so IL must be 1 per the
architecture. The host does not read IL on this path, but the
constructed syndrome should still be architecturally valid.

Set ESR_ELx_IL.

Fixes: 03313efed5e2 ("KVM: arm64: Implement the MEM_SHARE hypercall for protected VMs")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index eb1c10120f9f..c982a3a04c37 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -1054,7 +1054,8 @@ static u64 __pkvm_memshare_page_req(struct kvm_vcpu *vcpu, u64 ipa)
 
 	/* Fake up a data abort (level 3 translation fault on write) */
 	vcpu->arch.fault.esr_el2 = (ESR_ELx_EC_DABT_LOW << ESR_ELx_EC_SHIFT) |
-				   ESR_ELx_WNR | ESR_ELx_FSC_FAULT |
+				   ESR_ELx_IL | ESR_ELx_WNR |
+				   ESR_ELx_FSC_FAULT |
 				   FIELD_PREP(ESR_ELx_FSC_LEVEL, 3);
 
 	/* Shuffle the IPA around into the HPFAR */
-- 
2.54.0.1136.gdb2ca164c4-goog


