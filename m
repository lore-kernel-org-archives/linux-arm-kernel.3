Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9ECC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 09:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyvrkTEX8gg8MffaShVtSJAUi6pWJubSIpFntBYoA74=; b=t3alPz0PXZJvhek7h/zgWkAPkh
	a408HK/Lm9ILOesaWvws1DeNqwEWSidpz7db7tiJ4KvTVWEzM+yWCLJ4OChDvweSvnYJ6E/Z1IyKC
	RU+I0bfliE4MUtOa9KUaP2xUNfpto3Bij705+QSpJHfJB44HaSnP2UC6fk8BLmhM4ACu86lL4MDmq
	tBbshtP2CEwUukoj1nzWLdbXyDsLKRWXtB05j4F3CmMQnHjp0ecMMt8ikU5N7CNKkxQZxoe+2I31B
	Uzp+tJJTLp5po2HVyt7RKq76KxjX48I5aou+SRu7ajagXzx8ETsmwgxfAO5qrvchShdFW2WT4WGUv
	fHz8Xp/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeAU-00000004pj0-3G2h;
	Tue, 28 Jul 2026 09:32:10 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeAN-00000004pgA-3kFO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 09:32:05 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-493b966dd74so22564015e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 02:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785231121; x=1785835921; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wyvrkTEX8gg8MffaShVtSJAUi6pWJubSIpFntBYoA74=;
        b=pYcTNMgBo5ViEH+iGPxSinFS9w8AbgQ0BSRLmvY4m4Msp9E1py7h0xGGPf6SJdYKdV
         J0T4IoBGrVoTlWvP1swPlvqAnkCPcYJK/X1Fubm1W8hFawMVBqBujukS8KGTJez1MwmH
         32B/K7ZfY9BIF0BbGGXVV8BNFMRFBJTdnIalrAH9WvHvFSoplI0iVgu+qjqaKtNEWQQg
         1gHsaALhZ6BCxa2rhwzEa8/cfg7Z/AgRJ6AjacTasm+anPcmrqdWygyb0KcRSg4Luthn
         tw/oyH3oaKPJaPq6gU+s118Kvmuzd56ZBtnkRtGZQog83o0j24asl3S2SPxdKsXAEnNX
         XjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231121; x=1785835921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wyvrkTEX8gg8MffaShVtSJAUi6pWJubSIpFntBYoA74=;
        b=I3Jgb1FujK1/TJCv5PrKARibRp4iwROW+PxuiEFe/TxgZwO7KQT7Kw3aiS4s+9DlkJ
         9N60mzirHw5mKRrqddVYzNNtUq1RdvsWYOFqwSsKwdxh/Tn49IrjcN+LLbc997hQdeB/
         VqUcxuEeBl3/YJQAXGBi4d0N5KbHHTHqInpK6uR2FLvorOCgKHAiYEO5X7R3CeD4gvMm
         YNlbAI56ey/sa+HAwUuvdiVqpM8abJZZgIWyK4INpr8OzZJ1WTEpUFINen7JEOH9Ov5u
         vTKhMJR/N5z+bfePPgS7b950jcH01o5ZbeMKXFUp3Xp+HRfsYOFNY9AxVZqSHyciR+PN
         9Sdg==
X-Forwarded-Encrypted: i=1; AHgh+RoLV81/gDyiQVdYUQcKZz+Lxuit8cqTr8Ng/3ox3eKrJIw61rlO/lqQjFUHsNGV8kzVoY2xd9dbeYeHdBYEUxlZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0VZWzsIa21nGsAvX1D8mN3AeWjfbx/raVZdL4TbZX9IUAXoq8
	cZuZ1GU1njWKdr4/vXGJWfngUhEcBj0+72iXJM0qPZMxcG6nFywV+YfIkQatELkbQI0=
X-Gm-Gg: AR+sD12YQ4lFnUMtC1PZ1hLowQW8hGQIFP7TZ9T9ZglPg7/GdziyjBJ0uFpg1posND/
	bGt/NXe6TxSM3kPPi6Xe/Hg1WOZbCfCDTiyQMALPySMY6p8paCFKud6y8AIyI1AaHLvTj5pNXuy
	Kup6xVmBen6vqLbMnf9ea12Qu/0JSnvd5y2Of2hvCHcagi1LILli0FkPGFH7QQEc3xuTrrVaw2Z
	gBNsZo8otJze2xEKLPiCs3jMIKm3h9mhcxaBAVS4cJ0KRya+BcJ6nzzQAGcb8X4CrfDADt3Jzhp
	XdEVhrcSwrr8u7ifOV3r3Ue0PNpU3Z0zZOvkJ8nrVoCjf4m3J1upzQXQ++uEM3c0ZiQuJTXPl6z
	Vr887fthmUFtpFy5sHrCeb4ivLNRInizScS8ioeeoiFpzsg3nfITDdcN5R5v+9ErP0jeINqhWGg
	9VM9U8z6CTarMj426G5d9nYy8L81rhXjFJYw==
X-Received: by 2002:a05:600c:5486:b0:495:7040:c7e9 with SMTP id 5b1f17b1804b1-496c6414bddmr15782155e9.6.1785231121094;
        Tue, 28 Jul 2026 02:32:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm62389384f8f.1.2026.07.28.02.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:32:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 28 Jul 2026 11:31:58 +0200
Subject: [PATCH 3/3] arm64: defconfig: enable the Renesas 63419 panel
 driver as module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-v1-3-49e3ac1c8ff4@linaro.org>
References: <20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-v1-0-49e3ac1c8ff4@linaro.org>
In-Reply-To: <20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-v1-0-49e3ac1c8ff4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=693;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=JjYMe727moSW6eydoRmug1B3W1rHx22Xuo5S8BcfpRg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqaHcNvEg9FKSEskmsNfnAVoNdgaTw48R7NYY2c1Bs
 5GTAv9qJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamh3DQAKCRB33NvayMhJ0VUJD/
 0VpinGW//GB5TMg3yTAG7U0iv4ccidJP6YZvu+379Lb56v9guHbXKtrnYsTvyg8HIxbMpNGDGxjmRC
 xoLPoz1AFSqPcjR6flS5x2tZeuNMC2mFRoqjlrtQbyvMNBLjhSBT7sTbDACb/a90o4qBMM92/6/gdI
 S0A/G6oubcWsGGjXbC4UXW4OxzFG74NNCde29bO/W3oGs1efpEmdnrB1OBxfoKB/VpO8rQey0tNq3n
 Ni4Icw9Es1qZkra2QWI/G3mkohzaMO1z8ysYfY/qE8GugvsaS7Nj4R3GDHlhzQXya2UAcE6LEqWMC5
 JYU5CmrOLgi5q+7Bp7icHJwD/aFQMjcZS04aIKpK/i1n6Z3wTpPCRXLql2kDni4lPSy7idPQM9MXFS
 yv+FjKWo+XZ8O1V6i2YKxu/93wDpfFCDe0KlTJIm0nxqU/023hQzoaVv1wDExZpqhKg4ohaq5hWHUD
 XJ60n1154EB1sJzLUXAaBDXmRtNxJZYeMIZlqklklFJF9j+5uTmkgUVfFZj5fdrv66Kagy9Ht+V/oR
 npgZEC6KjhDH5xvmWZpwiAx5K3/WLX1m+EYu6MERv+/s8K+T/IPdTwcjOir/mqdItc02rjPhRkz53T
 aWxCMFgfQix7E0lYhlxOBEqnu4jDcsZKc1h2s6U4mFHnlnn+9XREA8LaeCQA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_023203_976783_834A14DE 
X-CRM114-Status: UNSURE (   9.91  )
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

Enable the Renesas 63419 panel driver as module since it's
used by the Ayaneo Pocket S2 board to drive the dual-DSI panel.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 90903bd082b2..98d4b7d2e8bd 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -964,6 +964,7 @@ CONFIG_DRM=m
 CONFIG_DRM_HDLCD=m
 CONFIG_DRM_MALI_DISPLAY=m
 CONFIG_DRM_KOMEDA=m
+CONFIG_DRM_PANEL_RENESAS_R63419=m
 CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_FSL_LDB=m
 CONFIG_DRM_I2C_NXP_TDA998X=m

-- 
2.34.1


