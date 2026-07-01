Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF954C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 20:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9r7V4xxqwcAsYX7tRzKjXAt0hIG9LvsN2CbJq3Hl88s=; b=xBpxuzNtkVNYJtp/uqwKAVdm0r
	pSpyIQGDSPJzjT+MTbzcfL4ars5ApUB0xWa9Ir65e5UHJdGCfv6Tw4QMDfe6onQedwi3lF6Dam1VD
	zYYkfcABQqNwcrKVCzghnF9V7AYc7CQx49vvOVE/i7aS8nRDwpD57OouvRaPFwnArsMq3sIVaAFgn
	Egwj5VZG5ZSfsM0HhJndQcYf89uo/oWKpTSJ8bBSXmqFISwcakMSBXM+RUhAlRsbwBlGOY2+Nkq/6
	cR6RrCDg0xaSvUwnK0+dk9I2zyHVqrWakavpR4GbjLih5iVc9L3rKBqRWancu2lWEK5VeoK9OLfmn
	WkvonOJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1mg-00000002zHK-1XDH;
	Wed, 01 Jul 2026 20:43:50 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1mc-00000002zEf-0Gln
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 20:43:47 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-485fdae1db3so1161026b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 13:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782938624; x=1783543424; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9r7V4xxqwcAsYX7tRzKjXAt0hIG9LvsN2CbJq3Hl88s=;
        b=emUbzLaLmHdJztqH42AOh3T2lnn4t7d4MJ1jLVLCT5Da3dpkCFtNytR2wx8Vmivsuh
         m73vJ+yMtBnDZFGjyIcqwmGBr0pJeD8MYVS81Tl3g15H431eYH5FCjH4BkTv10zPLX2j
         OQu0GZngpC8EJQxD6zdqIS/lu/N0ibunPG1RiH16A8PQDPxZE+c9/w4Uza/LW5x2zkml
         qODupVU5jzQtrc8yUg9sz/fCJ3xhet2n77+lFuzyrvXTU/Cc6CqEnPgXHnbRyNu/6yQN
         7kKU5+LhHhKotpZpn2TERa+j06iejMVkNUNPatglZ3hgtPLCbC5uinnS3zkrzW1g8b3h
         ljfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782938624; x=1783543424;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9r7V4xxqwcAsYX7tRzKjXAt0hIG9LvsN2CbJq3Hl88s=;
        b=m0RdkZrXGMq/EGmPHRdaiUpYAi/6842yg+lD9ONlOcTrFC88bk2Q2fpG/c6w4Bl2JU
         YAVKMXx1btvrg+s0wP2JGnieOyPWY0xZbFD8QPnccaYJlcYusCNPDb6STc2BigUsGgL2
         wHWEitXgFiEwqZ22NJPjHaUBY3RlJTV4j6LruzJckeAH8E/tnCmdgN9zC5oA32bNSdzH
         pVmyKJubhXtOVLg3EpHMXcbCS9RPQL19p8CIJaXVMlOdq3iyjZlgcL2EF7SsAjH/K0/4
         axJsAfVusBfaR9i6MvVRTEGSbW2kgqWGxo+SGq2sJN+mj31pc/Mw09CV9crKWyTbXlDf
         pV6g==
X-Forwarded-Encrypted: i=1; AFNElJ9XFcLQnNO7ICGx3EROrh8aTp5e5MAjbYjRFhJKe8JHxuBM8n+XifV/VEabRaBO/f8/Vf5rQf4KOsFBwWHjM9Yz@lists.infradead.org
X-Gm-Message-State: AOJu0YxWBpNdzQfXdFO6lUnxUpbZZu3Qa/a8iIt3uvg855qvSHrh4QlU
	7BukzkRTNhOFDmmbsZashCct3dnt9JzpMdMDs76cYyobPFVZhgNfGMCsGBaGKlzANpvbkd4s1h/
	tzPsGJOvq3oYvtIdLr2bvtXyzuA==
X-Received: from iohg8-n2.prod.google.com ([2002:a05:6602:a648:20b0:996:4a61:aebf])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:320e:b0:495:e54a:dbcf with SMTP id 5614622812f47-4960ef97c18mr2326318b6e.31.1782938624299;
 Wed, 01 Jul 2026 13:43:44 -0700 (PDT)
Date: Wed,  1 Jul 2026 20:43:38 +0000
In-Reply-To: <20260701204342.2654385-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260701204342.2654385-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260701204342.2654385-2-coltonlewis@google.com>
Subject: [PATCH 1/5] arm64: sysreg: Add layout for ID_AA64MMFR4_EL1
From: Colton Lewis <coltonlewis@google.com>
To: stable@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Miguel Luis <miguel.luis@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_134346_132199_F289029F 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

From: Marc Zyngier <maz@kernel.org>

[ Upstream commit cfc680bb04c54e61faa51a34d8383a0aa25b583f ]

ARMv9.5 has infroduced ID_AA64MMFR4_EL1 with a bunch of new features.
Add the corresponding layout.

This is extracted from the public ARM SysReg_xml_A_profile-2023-09
delivery, timestamped d55f5af8e09052abe92a02adf820deea2eaed717.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Miguel Luis <miguel.luis@oracle.com>
Link: https://lore.kernel.org/r/20240122181344.258974-5-maz@kernel.org
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/tools/sysreg | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 76ce150e7347e..f7180d391f829 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1669,6 +1669,43 @@ UnsignedEnum	3:0	TCRX
 EndEnum
 EndSysreg
 
+Sysreg	ID_AA64MMFR4_EL1	3	0	0	7	4
+Res0	63:40
+UnsignedEnum	39:36	E3DSE
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+Res0	35:28
+SignedEnum	27:24	E2H0
+	0b0000	IMP
+	0b1110	NI_NV1
+	0b1111	NI
+EndEnum
+UnsignedEnum	23:20	NV_frac
+	0b0000	NV_NV2
+	0b0001	NV2_ONLY
+EndEnum
+UnsignedEnum	19:16	FGWTE3
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+UnsignedEnum	15:12	HACDBS
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+UnsignedEnum	11:8	ASID2
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+SignedEnum	7:4	EIESB
+	0b0000	NI
+	0b0001	ToEL3
+	0b0010	ToELx
+	0b1111	ANY
+EndEnum
+Res0	3:0
+EndSysreg
+
 Sysreg	SCTLR_EL1	3	0	1	0	0
 Field	63	TIDCP
 Field	62	SPINTMASK
-- 
2.55.0.rc2.803.g1fd1e6609c-goog


