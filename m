Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B672CD13D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+OFp+IPnKRa3v3OPLVGWcy+GrbtTT1voW5UO4BoVK5w=; b=UW+rMynx6Glkc9i+97OXNAJm7S
	hLYjVQwatzR/2kQMetBjo9siLUb09q77vXfEABwpuwRkly4qFuGuR7LkFQg6jc4nc3F5C/1UDMh/o
	9WIOpcxBN+2g2XkKuH2KF9KDt2jVgSFFfUy5zCCNsE/88dIxNE6YftJuZhMIxnOs1Yfi4b2qIj/iD
	prry4QxHq1oAC4PWahz01A8yq/CMDflZ07QnwkuN8/vXwC0mJY0vJUAXNHA8+0F7EZQ1+BYky1IKh
	UfKCemhA6bSyfH0IunHeRJg0s9qREUyHTXIVtuoVQwQWc2UAo70QbxpSx5TkAv1yhYjM4ET84KI1x
	9PVLpDGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6EG-00000008LKT-0H2C;
	Wed, 12 Nov 2025 08:29:24 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6EA-00000008LGw-3EVd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 08:29:19 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-477632b0621so3322265e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 00:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762936157; x=1763540957; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+OFp+IPnKRa3v3OPLVGWcy+GrbtTT1voW5UO4BoVK5w=;
        b=AJFKD4IJsNdbkPLsfXtPNMkJavmoTF4+VOgU09McnzVSuDJ3FbJ4OXYmwj1jwbq3FU
         Fbdy/16WwLRiyQ/M5pUvtU8568j+kLjSIoSozOCQw4KkE3t7qSuiHYHHk1SIESLgPXiQ
         m9XkFOrLZERVWlgU/lE1JQQjMTdK/k5+T9LkHbPS60rjYDHToZ9PH0Y6kC/qG6R/czcW
         H4oKfs/i5+KRNJ1lRNsmBqUnA7JyJEr73oQd5+ntRJRG1DpSXHZ/uc/NVmZnQ6Q3pX7o
         ntvlpJSBDCrVRz/Iw3N5Z29h1NcGqgIypYh/jY61mKLFJC91MFYyCbAxYfnd3h4BpTf/
         L2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762936157; x=1763540957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+OFp+IPnKRa3v3OPLVGWcy+GrbtTT1voW5UO4BoVK5w=;
        b=iz7tz3JJQBhY+IkMkAc8/ZTsj4fdW0jUsuqCpQ3k9Vv+yfHI8KD1Vo3tkxIm7LchcW
         oMvgBs1WBU9GqitBniAYtdq8f6CLTz1OcYvTuTzgvfL9+ae4RO7Rqm26yzpy7MWlwQU7
         8+IX+c6kC8c0ZalttrfreN+cerARb8wOL53QQYZUphFfhPXWdrBwvObV+x6gXjyatcx7
         m1+cs4HNZMNchFOuRKhnuysRqvY9eZ8JRJ6QDrHhSuHyAZ0qPEmMOB8L4bIVAzRq3O2+
         kShykEjf3b1W6gc5hnuy6X8WNl1a5/uBZPvtucFT7V50L+IZxZPM3t0fOViKSt1mpMrx
         L6yg==
X-Forwarded-Encrypted: i=1; AJvYcCUHI8JoQT29ibPGObvP7UuLHYRFallPsXaQjZBXFl+X4VgGczOtclpTtes1f4pDBT2gWMrehtM/jjGfsprRgr3h@lists.infradead.org
X-Gm-Message-State: AOJu0Yw15f9n6J4Oq1RdNhf+GgD3LYl/1ZRcQaiG3hSZXrC2W5/+WQoY
	tGciMOpTiZlnxKj+K50LqWOXBIcTRnaWUbUgS22YkNQa23CJbUKmnVitrCxKPYlQ1y8=
X-Gm-Gg: ASbGncsQ2gTa5ziYsQzlsaSOi5UeTsuw2b/CHwAwz+Qw13QJHk+qL0Pajl7cemqxTTY
	+Cx+sAuI5fHS8pcltSaen0sFgtyJ4BLATaMrUEwWkNdh+lLX4ziZ9xZKDgOmbKWHuD5Stmgfp9D
	LcrWuCy2OxM4LRqSKIAVGYlTVKvc4UbhcqPu00t6lgSbpEi/jqwMzXRJXt5ml/X3JTOaDabn1tR
	amvThGvL4d8grYzW9GEy1NWNK4OqIgIxhDABxeOXVWchyT4l4qg3e8uZivbiWFmPJOGFtz4dTnc
	blur8Nbty34TA4fW0auqkNUCS56RnhGow6epndzhAr9NHx0d7fCiGNkctipQLWy3kXFVHyOE/Se
	n8++SVOyVTLgrv/Ah84NVXeiN4NrTgM1vL9kX9YwUOBgtjJAEDjFDMO6I5QSK2Pf47IA3xR/l01
	JwycFLKTtilJLSRSleNRXu2eY4/Wur3ROl8uEdBh3stHYf+pYrKneFSyJV
X-Google-Smtp-Source: AGHT+IHlpapEj7ymskzF3Fjgqueu2gUV8vx50CAtQ/YTQGVKieu5QIoV5IAB8BvhUU3H0SWPp7ULVA==
X-Received: by 2002:a05:600c:1d0a:b0:477:fcb:2267 with SMTP id 5b1f17b1804b1-47787045055mr20227885e9.8.1762936156868;
        Wed, 12 Nov 2025 00:29:16 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm31571428f8f.35.2025.11.12.00.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:29:16 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 12 Nov 2025 08:29:08 +0000
Subject: [PATCH v2 4/5] arm64: defconfig: enable Samsung Exynos OTP
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gs101-otp-v2-4-bff2eb020c95@linaro.org>
References: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
In-Reply-To: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762936153; l=1050;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Y9wJNseX6YvW31AdnsD3g0WQa/woWSS4h+36pzpwGoo=;
 b=Z6fGWT6SoRfFw0zQdHsVBlO/Qbu1DkGHl4MU1QSzryZwNo9dsZbeiZgmfpnXbo2SEuMtYgsTG
 gs+W0LRj75xBnRKyv7cv0ou/7oI7kGsxjbMNCoT1WLvkuXJfdVlP/85
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_002918_834458_AC55CD69 
X-CRM114-Status: GOOD (  10.75  )
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

Enable the exynos-otp nvmem driver. The driver reads the product and
chip IDs from the OTP register space and register the SoC info to the
SoC interface.

The driver can be extended to empower the controller become nvmem
provider. The fuse block stores various system information (TMU, ASV,
etc.) which can be accessed by client drivers.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 646097e94efe7f1a18fb59d5b6dfc6268be91383..6433e3c0f88b892ce6f2ee190f866a6ab4889771 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1682,6 +1682,7 @@ CONFIG_ARM_CORESIGHT_PMU_ARCH_SYSTEM_PMU=m
 CONFIG_NVIDIA_CORESIGHT_PMU_ARCH_SYSTEM_PMU=m
 CONFIG_MESON_DDR_PMU=m
 CONFIG_NVMEM_LAYOUT_SL28_VPD=m
+CONFIG_NVMEM_EXYNOS_OTP=m
 CONFIG_NVMEM_IMX_OCOTP=y
 CONFIG_NVMEM_IMX_OCOTP_ELE=m
 CONFIG_NVMEM_IMX_OCOTP_SCU=y

-- 
2.51.2.1041.gc1ab5b90ca-goog


