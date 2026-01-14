Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D34D37E33
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 14:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uDx8GJwGFtxKfvZU7MLXX1ujE0p+LvEQKHj4ysnyPoQ=; b=gvVsARDmK+oMebsWpcl1ZtmpMJ
	RHS3NZVsoELxzqapCqMxkqHl3bwXtoKkW7l3VEuct8eJvZYoEalSMAL9FEweqmZoQl9+r5ZhiGcX2
	8jwqsdfefDfTTKlVOuvPKcRAeZCbhq9zNtSr3mHX8K5ujv6irZlIPnnCpJgs2f0l5dCC+2MNZYSdn
	CvokW5Q5Ypx4kmDt2lTQuUHJNvjWN08XscbUkCaNjaSq8e9dqlt/DQxq2pfFkP2tyfvEEch6ym3vS
	dIvZy5EyQubt6+IystaZWjZ69ST1V0ht5ltrOI8COXO+9wyR+0rMAJNyXAKnSRakFuUS7Oee3mw0R
	G+HSsDkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1gY-00000009UTp-0z2T;
	Wed, 14 Jan 2026 14:17:22 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1gV-00000009UOz-06Tw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 14:17:20 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so65165755e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 06:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768400237; x=1769005037; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDx8GJwGFtxKfvZU7MLXX1ujE0p+LvEQKHj4ysnyPoQ=;
        b=lfLq5oT4r/5y/fgAFSrCuJmGwjOsuLyC8Sys51dOvOy2D5bAHAS8I95zo8wI9k935x
         vinM5rIR5f6LaDJ3dp8y+DaZT0w4lvyv99ibgJRc1BTjmkKxur/8OQP3qNXO9HGpMK85
         i1+4A39mXmwOYQJ6Zoz6sqNd+LSa5K55EHf6J+lSYmdRpahc7/uFaG73574MLPBSejxe
         SmmeNUD1Hl2cTxAnDIK2CBpUoIxEhKkbXHfQJLDgSkj0IUs3/+QessMQI//v4wxoxdHE
         cX5F+ZybvfKDLkI+asZ3rLVWNwHaenznY2J0yu5bpnhGOLqdmqBfWs4rHpFKik+/R0ea
         39DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400237; x=1769005037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uDx8GJwGFtxKfvZU7MLXX1ujE0p+LvEQKHj4ysnyPoQ=;
        b=pUVuPZ/cnCFpdJensWD+6e+OFCkmbh/2BTN9da800EGugiETDTI5WB4B6aDy9oIeav
         4sC7RFgp9RRnFMtLOOANgxRFwwKEczuR9FkM+IvePCf/H4p39W0FtL8xdNt6FwfDPMJg
         htkB7NvIOiTPhap+sFezDCzEfNtmTjdfBj37E/OVVHDo1PDc/cxmlYaMm1soNAV4NCzW
         hiNinSaekGWKvL3TzjwZerM08L+47IvJLudEob2SudtHuuVDPRa5au1jj2fp094kLonB
         FafBiGBcgof93Bll7gAigWLkWAYXiPAEdSmAAHtH7JxUEWBNcSYa7oh+o4R/uqr3RUNn
         ZdPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwDxfbSs4K8ItBzRXLK4XXKwLCOVNXc3Dmm7YWoeeQ0oWgX7fzjfYUc0Zzcev5g5hAj0+21J385M1W43cVfIrR@lists.infradead.org
X-Gm-Message-State: AOJu0YyJblQzHuU1zj+vZmc+a5g3yfrvwWtYvYp9CwncPv9pBOzUWeyq
	yH65fME+VOdC4Zch7NEI96a1reZkM65eNs8P6NLd+iLie/ouY1HOYI/2N21vk1v6pjU=
X-Gm-Gg: AY/fxX4cpWRVoKyGNBtGdsZv3VB7wZDYGSDj0Km6wGjxmbRKFdZijA9t0MZs5jGkbDi
	2z5W0h6z2PvsJrjIUb5YhAMzrY1/UDbpZaDuXizdrz/LX44h6W86XDITeT9rFM2dxIHesJPiFB/
	l7znzZ0NDndg0yUrKvhwzLknITaBq5PbJ/RLTWlGaMfmlqU6fhzw7yPbN1nQZwbwyW1shT4Hqnl
	Ve6PuiBq/THeQYtaXOIZpPfWOe1BuqKLcfjY2xFdBKEPM+LTaTv5hcXrFUhBTyZL6j1SVrPnF8j
	fJFmNp/Ta81tHafy8ZZ7alSBKV+3TpQ26v8cMczfjdKVLag0vtvgtDafZ+Xq46+OhxllLnHZhSc
	pORVJguzi08HWSURB8JOEGnDV4NEjLY+FPrLWuIvNQ+JAXX8/hZS3o3PlBPucXXfsaEoGGpDMGc
	CVI/gnlyT78VLDgzLFjkr/NzHNCNJjBn87GTwZvBFZ03pVKjJUaNxPwBXAVlL19YX3hNTTpKBRj
	M3eRgua
X-Received: by 2002:a05:600c:4e4d:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-47ee331937emr30654025e9.7.1768400237015;
        Wed, 14 Jan 2026 06:17:17 -0800 (PST)
Received: from ta2.c.googlers.com (164.102.240.35.bc.googleusercontent.com. [35.240.102.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee57a2613sm29595445e9.6.2026.01.14.06.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 06:17:16 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 14 Jan 2026 14:16:34 +0000
Subject: [PATCH 6/8] MAINTAINERS: Add entry for Samsung Exynos ACPM thermal
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-acpm-tmu-v1-6-cfe56d93e90f@linaro.org>
References: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
In-Reply-To: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768400224; l=971;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=7HVJFrG3U/QwDFKx95QyYbsMuRfAm1hbMd+GcbM229I=;
 b=pUkUka+ewej0krIsviJjojhdqN6KPY64IUp5KIuBVVECn9qSsLgLN4eTbUtjxiRCJF+4NmjV0
 aVbDoNVDAOlDzQjkDBwgjyH42sK2PdrvjnCTG1nPFaq9xixN3Ygv0sh
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_061719_121562_35CBD71E 
X-CRM114-Status: GOOD (  10.04  )
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

Add a MAINTAINERS entry for the Samsung Exynos ACPM thermal driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9de1e9e43f63787578edd8c429ca39..ab44f2de8e8e03ad9bb022ebdf1b6c0058fb0425 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23171,6 +23171,14 @@ F:	drivers/clk/samsung/clk-acpm.c
 F:	drivers/firmware/samsung/exynos-acpm*
 F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
 
+SAMSUNG EXYNOS ACPM THERMAL DRIVER
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
+F:	drivers/thermal/samsung/acpm-tmu.c
+
 SAMSUNG EXYNOS MAILBOX DRIVER
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-kernel@vger.kernel.org

-- 
2.52.0.457.g6b5491de43-goog


