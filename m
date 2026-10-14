Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685B3CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 12:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKgGfNoWXQV4tpIVxLenRclK7vXKxa8R7Z63ZilMkDY=; b=CL8LvqdURDPnj2h419ajOioPrl
	hVpNl9auwlsU3/sQF1YgRvzyBQCQA+vBAdw81xPM3HfSoBaIdNUEeQDf0cb63M5zFF6lsc/zgBL5R
	i7KWZnaQ411ULhuWdiWYtRIvJbsk1K3qp6u8Up+/yVV/GOorQiJ/aGq9FysD6n52EAjnK8RalYDQV
	89yIi0pxENryWOeaPjS9+dS80PTydnf49dRozeHiEsBypVAPK+rjNpphoco5BIOz1z4vDAQBd0zdW
	yN86tw/ld95ujmPfeTcytDt+oLwDP8l6Di69L1ysQwGtzTd4mapR+POUpAQ8/r/j90gQ4ajZIPRoy
	4dN+cY8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyD5-0000000FRJd-2PPW;
	Wed, 14 Oct 2026 12:35:55 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyD1-0000000FRIM-1eyx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 12:35:54 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48c411d6615so2954850f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 05:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791981350; x=1792586150; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GKgGfNoWXQV4tpIVxLenRclK7vXKxa8R7Z63ZilMkDY=;
        b=ooTFNpVdVDI+g/krzJsv0Q9mB70fGm0Hfa9odri8x2BYCA2PezMkUPMPoaWiFrzyVt
         IT3P7L1/GkvpOjS8sy8rwOc6fLwJKRNVjRJWSvM4i5Fov1eBy5zPRFc43+69nj2LdaqT
         g+y3jyG0jsFRKpnYsfp6iZaRHeAaMizfhYsWjSNSX4sqAllpYYFoXF8I0HO1b0g+e63b
         GrUdHW0ZEsgl/EOZ2SQPzzXvJQlF5fGQwqJ8X3vjNDIHCkvEtfm7Q5GvCYFk+PpvSaHB
         HVsP73DHOZeB655o9gGz+Ass2gcBCSmn4dNBaB94khkzhyprskI7P2GsB9UEBRZb/vTE
         T21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981350; x=1792586150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GKgGfNoWXQV4tpIVxLenRclK7vXKxa8R7Z63ZilMkDY=;
        b=Atr1ZsuDOzMQ7mEShhvxzF0ooYw4fbA3lv6r896gk1FZpHX5DR+8typkrbaqDFmzkU
         M1V+Jyvs8qu0BGA3ER7rkNDxzDkmn+jfXzTA+fuxn8KK51sbZS6hZ8e+RtvJqtWmLz5F
         o+CHxoorfVBa36zwD4+Yy8o6O2Lf5r7Bzek26ds5q/w/zSzIdVf/gXQ2ychtC1O+y6U4
         BDChsFuBz6Ayhb8NbId3Vqb9WkP3kMnfIiY1/DI04wot1llqG4PVsa6yYUkvq4wjoJuG
         qvrose0vBiGe7qT/HZk0t+rPtzYtxlXewCaFX6lA4J4CfybjVW2RmmFUZEu0fq1TYfDo
         FpuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEYoT3YR1qF5C/A6xcSiBmeN+0XVqovqiQkeCibCE836bUmNslInM533usze9VNVqf+Lbwea8wMc146n3er4cn@lists.infradead.org
X-Gm-Message-State: AFq9FYK3rXNAyr7UgbHQaZILswXXXjnxT3s139N8tUs7rh0unCoCgdN+
	Nm8KB5uwAsYAl0xg1vS2XcaYe/XA3eDA0U+9YSnwjGnTduS9VoguNBHI
X-Gm-Gg: AYBFou0jM1VAn/KDb523wqonuSBx0Mmw6hE6k0Gqzgz1/kKdPiCe/x/gMZE9RgkMCAS
	jXyMvu57zGPiJAjG7VUHiXsXa7ZCg3p5PxTirXpnWk46vB6OtVjyv73dfSFIpeWPffYMgspuVP6
	MGKAVrPQ5L7tOBmMbEJHeQU73IN6UVoMeKhxkLw8L9g/oTGuafHgK004GHSxgZD1kQ5jtUYtZFD
	aVazbAROiU/+/yAjcJZZR9O1I9h1k5E/xrEbczI+x4Nt0RyKXF1cjRYa4S4vcom8E0FXiT0S7Ab
	SY68Qxge6oW5cKsnjseT+Aum8NpalheGAFpEc/8idgXgMInI3QRfHwvWWIIx9so/bxRaxzGfnfc
	/NeHcFMtp6VPvNasYn+rlLcoV3e1idploijZUL8YsCQ9iWy6f9vmA7atWezZN0SiB/0jsTjOHny
	A9AyPPyMnlGCvwKI0nExXsrF8y6tbFROUbFOBVGeaYkRliLHoaW4LBtTt6gbFgQybRVK7VEoYVt
	BJUAbBkptJxDGhPEn3wQiQyHUgaQvhffAnZy1lCRRKV7jj4noVxw4WJGXjWQLY=
X-Received: by 2002:a05:6000:12c7:b0:48b:28e:2f13 with SMTP id ffacd0b85a97d-48dbacffdfdmr22882377f8f.52.1791981349373;
        Wed, 14 Oct 2026 05:35:49 -0700 (PDT)
Received: from nixos-office (29.pool92-59-2.dynamic.orange.es. [92.59.2.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48ded3874c6sm3003353f8f.18.2026.10.14.05.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:35:48 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	vsethi@nvidia.com,
	maz@kernel.org,
	sdonthineni@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v3 2/2] firmware: smccc: provide stubs when discovery is disabled
Date: Wed, 14 Oct 2026 13:35:39 +0100
Message-ID: <20261014123539.2259230-3-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014123539.2259230-1-julianbraha@gmail.com>
References: <20261014123539.2259230-1-julianbraha@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_053552_674831_D0D3883F 
X-CRM114-Status: UNSURE (   9.65  )
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

Add fallbacks for callers to avoid needing #ifdef guards when
HAVE_ARM_SMCCC_DISCOVERY is disabled (32-bit arm).

Fixes: 35727af2b15d ("irqchip/gicv3: Workaround for NVIDIA erratum T241-FABRIC-4")
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
Changes since v2:
- split out changes into two patches

Link to v2:
https://lore.kernel.org/all/20260823180832.1246363-1-julianbraha@gmail.com/

Changes since v1:
- remove select and dependency on ARM_PSCI_FW,
- make the HAVE_ARM_SMCCC_DISCOVERY 'select' conditional on arm64

Link to v1: https://lore.kernel.org/all/20260801212235.2692694-1-julianbraha@gmail.com/
---
 include/linux/arm-smccc.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 4de81848fe2e..75f9d3f1723b 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -324,6 +324,7 @@ enum arm_smccc_conduit {
 	SMCCC_CONDUIT_HVC,
 };
 
+#ifdef CONFIG_HAVE_ARM_SMCCC_DISCOVERY
 /**
  * arm_smccc_1_1_get_conduit()
  *
@@ -363,6 +364,12 @@ s32 arm_smccc_get_soc_id_version(void);
  * When ARM_SMCCC_ARCH_SOC_ID is not present, returns SMCCC_RET_NOT_SUPPORTED.
  */
 s32 arm_smccc_get_soc_id_revision(void);
+#else   /* CONFIG_HAVE_ARM_SMCCC_DISCOVERY */
+#define arm_smccc_1_1_get_conduit()	SMCCC_CONDUIT_NONE
+#define arm_smccc_get_version()		0
+#define arm_smccc_get_soc_id_version()	SMCCC_RET_NOT_SUPPORTED
+#define arm_smccc_get_soc_id_revision()	SMCCC_RET_NOT_SUPPORTED
+#endif	/* CONFIG_HAVE_ARM_SMCCC_DISCOVERY */
 
 #ifndef __ASSEMBLY__
 
-- 
2.55.0


