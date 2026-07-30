Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15E4C5516C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 07:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSyY+XJ+vex+b5WS1ha+pHt3rgbtzPLgz50hKTgc/ws=; b=HnPlHdplkrEpU5FKJ3vaI9BfOy
	4GrjrzvQM2dIUlLS6OM6lhX5qnvFyEtBwPWR754LVCaKwRmXXi7/TnBFU7sb+9l4p25YNzEYqFD6z
	Q37sd2oJfpNs35dbSovP+kENYgRG5PETtGQj4w3r/+p/I/6ic6w9FA8qaQTfElYRXIgbzUPqn3yVR
	k6ueicv80fpjeTX0jTmR/jcpmwYItvpGI60f36eH4yZRGtcITFaG4JHOg+Hf6maGYgMdq3bVIM4Ev
	fxGXDZDzun8u3L2Bn+7VYtcE13l68fjCgONxWREW4J0euqE7SDf3yiezbJECfingvqLleVyvmf4pW
	v3wb8V3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKvZ-00000009ggc-0qbW;
	Thu, 30 Jul 2026 07:11:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKur-00000009gN1-1oJy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 07:10:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 35DF64051E;
	Thu, 30 Jul 2026 07:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BBE41F0155A;
	Thu, 30 Jul 2026 07:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785395453;
	bh=iSyY+XJ+vex+b5WS1ha+pHt3rgbtzPLgz50hKTgc/ws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ac+uGqriQl3sWUIwg9xLwe3IxcFPvWlgGzq2R95IfpdJpBjt+oJ4gQv0MTAhK2ZyL
	 in28UU48cc8AcyMpzuRCwv8WMDISOMYlGON2DuHXZc1orYJE2i0YhS5oCF+xikiJnf
	 a5BEydrD8U/Rwi/ai8T8BpEoFy6Rn+KlyIfBRvLwyGs8fb+bpHxm9i6/vyoWqLUJH4
	 LDi3rsSwfWf2sbL1Y/cC8Ir2fO4wcRy/jEzT3KNNP3Sz3EJ4Qbi+f94m96OmGuUM53
	 EmdICX6zDxfKvml7XNt4xvtzhefqd/JrRYzcvkAJWlpdU0aNAaPlFA2M71PzCB+DcR
	 Yn6PaY942c8Ug==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wpKup-0000000AOpW-1jsT;
	Thu, 30 Jul 2026 07:10:51 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>
Subject: [PATCH v4 14/29] arm64: sysreg: Add HCRX_EL2 bits related to FEAT_NV3
Date: Thu, 30 Jul 2026 08:10:07 +0100
Message-ID: <20260730071022.296811-15-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730071022.296811-1-maz@kernel.org>
References: <20260730071022.296811-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, yaoyuan@linux.alibaba.com, weilin.chang@arm.com, vladimir.murzin@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

FEAT_NV3 introduces 4 new HCRX_EL2 control bits. Describe them
in the sysreg file.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 42839d2b15ae4..67d013b376a3c 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -4548,7 +4548,12 @@ Fields	ZCR_ELx
 EndSysreg
 
 Sysreg	HCRX_EL2	3	4	1	2	2
-Res0	63:27
+Res0	63:35
+Field	34	NVnTTLBOS
+Field	33	NVnTTLBIS
+Field	32	NVnTTLB
+Res0	31:28
+Field	27	NVTGE
 Field	26	SRMASKEn
 Res0	25
 Field	24	PACMEn
-- 
2.47.3


