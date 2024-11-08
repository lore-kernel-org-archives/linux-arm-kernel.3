Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE61BD5E140
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 06:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cn/Nc5RaHVF/e/nAEApB7fYMyWr4MBPCDZJyTNa0js8=; b=TZbwc+/xLoS/sb8j4hg0i6P1Uq
	9jn4dbDn+mN7pDau9EKuwsOIk0X4lOe+nCJfuNpE6rtSj/rHDQ4t2IFmakVBR5lOXhIvVqNj851fy
	s/LCNZgWzRVdl3pxflNwhEJpCSUpRyrPq4ob/EyhRYmoMmlhgjxTgaTvkDfURNcf+w8n0vcrViQfM
	8YtCXQ/3Q9PKKgIL7A3NYl5fNDAx4kcOq1ZuGcnf+KiE1Ux56fyp0yKp/RdLPhJkJn9rvN5mH5vJL
	SYqZ9zb3RwWntp1myAjGTUUOe/uConCF4A8eLcBbNV5BCSjDKMJ8oMxFms0cWSvtsbH3+xXShT60W
	CJy6MAvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Ipw-00000009YFF-0Hl4;
	Fri, 08 Nov 2024 06:51:16 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Iln-00000009XCu-1WDt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 06:47:00 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-29066daf9e2so930849fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 22:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731048418; x=1731653218; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cn/Nc5RaHVF/e/nAEApB7fYMyWr4MBPCDZJyTNa0js8=;
        b=J10uTYX/oeFxzPM8hjjORM0BjNb9KdpRnASpuuKnB4xb+IrthilyTcyPcEY9S5KsOP
         XVKEgiNIJuVQsaF+Hn+ZY8u9Yk5YK3i5YzJsZHb9IWOz8c1Q+6jwzCP+4vskML5z6fmm
         AWbzXP59SmnpnluGSRRTQ+3CtufjpCw7cV/Ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731048418; x=1731653218;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cn/Nc5RaHVF/e/nAEApB7fYMyWr4MBPCDZJyTNa0js8=;
        b=q0dwHF2BmYJiXJCR0v+OxprJaIjcED+CeplB4veW9KNjyJ/qTYwPPlGtmLiLmDY9FC
         AMQsT+ylRuZdRCtqCdqUj3GgFWgMUZlMaszdVytYRPuFZjvQ11y8ZrdpUEfDXCieT0fY
         +RUr4QV4MvOSW2uMVZ2m2PhfcrKPWnfpbsyo5IxsGEdi8b7/isxUHlrVLkJA5YIeYzgM
         0/7IAdSVkLJaICS1MsZY0fNnipb3MD4qY6W3OMfIn0HtsmRpehz5yjUFaEAZJT6/WlSR
         tkzpUnKl3sj60lDXdQYMEuidHkINby14QNZRWEFjL0X/ItZCDkKKtszRUGJj2eMDTfhx
         nXUA==
X-Forwarded-Encrypted: i=1; AJvYcCUzTanP63HMr1DIcqo6fDu9O6fxptjYdTEPFpU9iSKb5N26sZwYNNu/zPPexzQ+verx9VNbZh9AjGs51rsQ1jcS@lists.infradead.org
X-Gm-Message-State: AOJu0YyB+CHkpCmwrwnL/iTJs0jPvnqXjwbZDh1iQpGK1FWydWn1fpPe
	V4g1YENGRSmuymFWlgsieVwLHQiU8uzQ3wX0881bOfdFX1iz+MpJRHHCEuUDtw==
X-Google-Smtp-Source: AGHT+IGIj8ppTDiKoQ1Ac0ZjCZ1batJcTJQ8Mib+/ozEVFfkH5rl/YxpGzi3ZzRXz5pAIQ9//uSnvQ==
X-Received: by 2002:a05:6870:344c:b0:261:211:9d0d with SMTP id 586e51a60fabf-295603b7595mr1814461fac.40.1731048417707;
        Thu, 07 Nov 2024 22:46:57 -0800 (PST)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724079aa8fasm2863065b3a.97.2024.11.07.22.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 22:46:57 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 08 Nov 2024 06:46:53 +0000
Subject: [PATCH] thermal/drivers/mediatek/lvts_thermal: Switch to
 IMMEDIATE_MODE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-lvts-v1-1-eee339c6ca20@chromium.org>
X-B4-Tracking: v=1; b=H4sIANyzLWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQwML3ZyykmLdNPOk1CRjs9S0ZFNLJaDSgqLUtMwKsDHRsbW1AICiAJZ
 WAAAA
X-Change-ID: 20241108-lvts-f7beb36efc59
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_224659_452806_C7C31595 
X-CRM114-Status: UNSURE (   9.61  )
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

Currently, MT8192 cannot suspend with FILTERED_MODE. Switch to
IMMEDIATE_MODE will fix this.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 drivers/thermal/mediatek/lvts_thermal.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 1997e91bb3be94a3059db619238aa5787edc7675..daad52f14fc03d0c4131f2ffdf3eb6b49a4a43d0 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -1541,7 +1541,6 @@ static const struct lvts_ctrl_data mt8192_lvts_mcu_data_ctrl[] = {
 		},
 		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset = 0x0,
-		.mode = LVTS_MSR_FILTERED_MODE,
 	},
 	{
 		.lvts_sensor = {
@@ -1552,7 +1551,6 @@ static const struct lvts_ctrl_data mt8192_lvts_mcu_data_ctrl[] = {
 		},
 		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset = 0x100,
-		.mode = LVTS_MSR_FILTERED_MODE,
 	},
 	{
 		.lvts_sensor = {
@@ -1567,7 +1565,6 @@ static const struct lvts_ctrl_data mt8192_lvts_mcu_data_ctrl[] = {
 		},
 		VALID_SENSOR_MAP(1, 1, 1, 1),
 		.offset = 0x200,
-		.mode = LVTS_MSR_FILTERED_MODE,
 	}
 };
 

---
base-commit: 906bd684e4b1e517dd424a354744c5b0aebef8af
change-id: 20241108-lvts-f7beb36efc59

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


