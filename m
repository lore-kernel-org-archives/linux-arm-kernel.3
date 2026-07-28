Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D459C54EFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 09:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVYEtk0Fsl/xm62f6qIKmBvKUDRO9X4B5IUMFICX51g=; b=X+JiNAWvcpyWle3Pnq1zE3DZ4/
	P8FFcLEcdp5EyEtdtuMVLitnWs3gGEXYx0cU+SaVSb0uwONe1pdW3H5Nu0VnGNyGGeTc/BAumo5IA
	w+scHzHsyOQ7M4aO7jPD+rxY5tjjzgcM6FHbBkQLcxjKH1DYchKv8wGe5A4DrpcaxjQ6qyWtgnGSF
	KCF9Xc3ANa1fWJOAAJg5WnYAYJFCvgaabptPUOI/cA0p0+jpChAIPS9gGkIRAITBGFg6U/9WrsERy
	ZbL/tSH4ftwFkMi+8Ca2VHt6wtjHENhQ5ZyWmES0gCPszAZBAqETUo0Bfw8aVgOlIqku7FOlDqN9u
	kxupY/vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeAU-00000004piZ-2qda;
	Tue, 28 Jul 2026 09:32:10 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeAN-00000004pg7-1ROx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 09:32:05 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47f707e5d75so2448606f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 02:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785231120; x=1785835920; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVYEtk0Fsl/xm62f6qIKmBvKUDRO9X4B5IUMFICX51g=;
        b=FT3efRvzDoF6TxsjHp4gG/ohM70mfCaw74szswpF6nzA3bk5UBg5H8TnG4yrIUMoKS
         Psjyepcj8vSYcSACOLN8U+VsMc19FjUqMMja+0ac5dGYCDKBazOVoHje1Ki92j5AFV+L
         s1S5iVFiUkCipUGUxF7MjlJR21d2KhxA6JWjgWM/cxwgJYuYNCoal7T6oabWhyiFSWUt
         2deTtbYHdDJkKHuYiIBtBt/+9UzXleAoUXXDqPfpUp1WZQ4gfN0qWe7CBkGW5Hh/Ux2A
         uMjHT6cdy3sxBQojME68rMZquQ2mUbLWKyx6QEX6k1hI4r9TK/oW/05/sLcnMeSVsbZl
         kaag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231120; x=1785835920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cVYEtk0Fsl/xm62f6qIKmBvKUDRO9X4B5IUMFICX51g=;
        b=d1f+eov+6KLqtGzlzT99jOfS9tqpaSb0ofssh37qcurVMb0fgnnvHO98H34VFBKZx7
         ZaDBy6zsMOOQBXIcUZkOqt6Oc4Iq7jvZTMZF3BY18Ob7t1I9Q0VfRiGoWmUdWcH1MKg3
         Wt94l7yuCg5fRyoPpUUgjDXkbIoQvWabcZyMoqUzPOc+wX/zpdoh+uFuxrpElvlskNWj
         DzQTXtcASvOT2a2d0KA9G3b6baAuzxrlnLFfSqQQr+y9XOtjCNlf/sLhb3849t7TAe6W
         JpyntEZDOicJTNiajSpHOv2K/kkHYvJQZ5s8CIDZW6Owkhau84E4XJwfZYkwuYFQhdh3
         MvgQ==
X-Forwarded-Encrypted: i=1; AHgh+RoBGKvfAk8pnygQCLuLPNFero5uVO8BMMiLZqzevlVN9xjKVEe3MeqgcTgWK5IPEtBWMWGPtvjuajAuQx5ijQfn@lists.infradead.org
X-Gm-Message-State: AOJu0YxhTkGrAE0/+2trLtN6hlzlvjsHWBhw/Xvr3C1REXmH4Zh3Ze3C
	Bz8i8JWWrTrMLqki44JUD3m+DneJz/J6k3QTPICkf3kJ9k8LVcUFXFW92MgMBM94WfI4HAtb9WW
	pg2jN
X-Gm-Gg: AR+sD130mJqjDMwrtJiLgkCaK7bZ8oE3eyXwOiLM95fxf97b13DbuV8XiNOuS66BiTx
	1MNKTa3GDO+ojH7YvvDHUCPhVTIvJf+krpuUkTRgf7o3XFyW+9WOhZr9zdek58p+xPQXrwles6M
	xh4SILt7iISMiC0fVhVylIEE895GKLBT7XygwfIE7VOEEU3IPVft3Z5bInrySVYKrOp6rKvxe3h
	DSQAWs9oEG0pjf9gsDNRqqNa80T8gqOJ3Fd37XVIHDBorhNgYa8D4wjE0HxM7iwpiUB0i7dzzLB
	EDmEM7QhlxndJye9k1GKaQMzNNPD9m0qtVMZuhU2AaSCKD/2MAwTCN0YwOeh+uqb4nL9lCKYTeb
	8oIdrGSr+SdHZzuRt0kGcJV3MsHegLmDtUZhR1RVMQ+NsxLbvtIW2d34wpvOceoMQhfkAVR6JI2
	v/rEj56k6IVQje3vZuuA5lquc=
X-Received: by 2002:a05:6000:1842:b0:47f:9759:7f0e with SMTP id ffacd0b85a97d-47fb1e5cf35mr1811410f8f.7.1785231119621;
        Tue, 28 Jul 2026 02:31:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm62389384f8f.1.2026.07.28.02.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:31:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 28 Jul 2026 11:31:56 +0200
Subject: [PATCH 1/3] arm64: defconfig: enable the SGM3804 regulator driver
 as module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-v1-1-49e3ac1c8ff4@linaro.org>
References: <20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-v1-0-49e3ac1c8ff4@linaro.org>
In-Reply-To: <20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-v1-0-49e3ac1c8ff4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=721;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=QkAQArlDCgge7Yn3Fw0ePWELfay666Rr/KRC6eTwNLE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqaHcMmh2oKYipCU4ePc+D11GXsnRUwgtyYCVmU/b/
 OCElg4qJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamh3DAAKCRB33NvayMhJ0dkDD/
 4sSt6rPo/7A67airdzHzVKGinRHGEmtYZs5QoU7mzWLu/Q5SG2IrXvfCJ/41koV15TGMkoRgQzYcbE
 SHWpZoIdPrbA/r0kcPAuj2jkbQOVTOQUixjnLz83G2tHyrTt+ZmirrUoUpgSRtqvAuSTjShZHXVRa/
 PWG2C7pKsDlrI4QCvcJZHpVbeZ/TiFuELBss6dAf5gN7oyYtjRTkM1/Fa2pFlGXJlO8UA0jVHbjA/s
 pyJ/yD/SvydgS5epsfQ3wsuQkZ624uAYxYFGUsLV312v1UpNW1DDyQHka44j77J3px5lWrLJc+iQtf
 SMReyU6ZO9JJcC2Q1mxEH60YwxQZwtji2DGD8JEon+sySVjnFOgltitjmv7x3A6T2+lp+UmyvdbXNR
 2snUfq/3ODzbcF5/UlYBxDHezDdV7Iy4n8Owz1HB5O6FMkrN77jUXAZ4aQO0Kz9S2x9ZCSBmnKIaPl
 5C+I50qdLAOEIFoiQBljvlWGG3ch5USJMsy8yK9hQrabbR/zV3YcP9491KGjTE6zVjimCrzFd0wd4v
 uBfHt9tbYU93bbHNjuKHesrZB4RPnfMzWTizfgnXWErKsrncMGfrPULXGht5ybz6ePstj2/MWtaQUw
 Et7ZtCM1t+UVnjle6dx9e4BN5WfdUozMm18dizTLe1w359KXfdoGu0XqtILQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_023203_407000_738E6391 
X-CRM114-Status: UNSURE (   9.50  )
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

Enable the SGM3804 regulator driver as module since it's
used by the Ayaneo Pocket S2 board as Display voltage regulator.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..97a51c238f55 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -895,6 +895,7 @@ CONFIG_REGULATOR_QCOM_USB_VBUS=m
 CONFIG_REGULATOR_RAA215300=y
 CONFIG_REGULATOR_RK808=y
 CONFIG_REGULATOR_S2MPS11=y
+CONFIG_REGULATOR_SGM3804=y
 CONFIG_REGULATOR_TPS65132=m
 CONFIG_REGULATOR_TPS65219=y
 CONFIG_REGULATOR_VCTRL=m

-- 
2.34.1


