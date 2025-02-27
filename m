Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94FEC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 08:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iOauLP0ELqLr6qyOysf0Ro17F/zd6+Uf/b2CaRN4fKo=; b=YzcLDYwiT4Hw4w/pURVY2W/qdX
	X/c0sfvlNSA4COmhDwuCho+T0jZO48J5QSWoEcvCJSDAb1II1mOnhhYvR8UE/ewtvKOqcbWA1E+Mz
	+adGsV1DUKGZF9AYA4iy/c1nj1c21AGnf/HUdW18cwas47gzl80SMR0Vr3V8oO6qYHZ9jtxCu/skx
	znCf0rwWML7lIgfLC4pE78yL83cxGCvyUpe/Py5VHn3HFR8JF8VYs0gCJYipSnEeBZjIjcJ381/5y
	GczJgmVBlBThgRLsHmOBWL3b22F8tqIsRUYw3ia4zEyethJYxxQz6nY1+oWoz7v9uFzLbIiQsVR1T
	3qtprsmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZdf-00000006m0R-16YO;
	Thu, 27 Feb 2025 08:53:03 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZc7-00000006lqd-0Eh2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 08:51:28 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38f5fc33602so455498f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 00:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740646285; x=1741251085; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iOauLP0ELqLr6qyOysf0Ro17F/zd6+Uf/b2CaRN4fKo=;
        b=epUCuceQdUmnxcYFfmJ7UDWQcl7gJT1zlKvzF5tfRsTS8DNVBiN/8geZ3HZ53WFMDw
         iQdmuVq1Q3CZPqbUcrCeOOK8KdcyOAh7X81kcURZ1mt48x6zdzeNI4LbwfOG7s/iJTZc
         gUx/dmI6+8E2WzLto/ndiYTVELvrXCsY4HigTPVZCueKM23n5wOtIXC02QI1k2rU5KjU
         YkuSm5re4Shl3KIybC/b9DhuABxhCsQoje0QGSAU7B+kXQeGEMCL276FH5mOLHaaAeCt
         DrH2pqQ3e9ckX4formNdlrSzKYCoIseNbWoEph1kuK9Amw0tRQLGg2vKhqoyMlnXab3y
         Wykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740646285; x=1741251085;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOauLP0ELqLr6qyOysf0Ro17F/zd6+Uf/b2CaRN4fKo=;
        b=MH1Ix3Cq/gt7P0Luz122QwgA60HJatESeGyUUE2JhdFXzimS4JtrUQ9+1Di0OUqxIk
         1E+X6dpW6QWBQvbx+khFy7uu3BmjeftlH7shtU97vajFnn71SaG7RQ13lG4xS/tpYObf
         PoKquu/qx3qOw2In9qCgXj6PGhpXwmY7UUFYJicgdFa4MQo4tfHg0CwSFmOhkF/LPjoI
         1QvW1CqcUKb+nSAOYq6+BuLH4MtkDkMFCdtHtXroP2WXpe/nAea1/zFFBZlDkM4njO5p
         P22IUkDEBu8x1kfvaENirFm5a9zz9jE31Ncgc5lrEXSkHP+FQbQfACJDQtvrAgqlP7Rm
         byRQ==
X-Gm-Message-State: AOJu0YwUCxDOtxGBbR8bmNU7y5PDEEK1OduqSZpcdUTczBPlMCEfolgD
	GU0KUPUs0cJPEQ/aAW8AEdNh9Hcz2P+Jp7xwqq1/Pcrs2eri6EqTNXGKA0TxJsbKU/q8RldrdSr
	7
X-Gm-Gg: ASbGncuYrS08xBJbdGbIjI9V+jr4FoVvY04fa8fcBuVSHkejRNSKb5QlmVbdBjfNm71
	iXCAENXaZLyhccPmOgh1I1sRSZ2avo97uSwjMPiyFqtJGrM9/AiZZZd4NpCp+S3A5X4/86LzoMa
	Z/vmDS3Qu066OheGOveJc3W54Vid+FBJEaLmhnBjVO+83Yv9fuwRo6Cw/1OdwD7Z1R3ndc/rbdx
	pFtoYba9Pe7mt4gsnblNFDfia0UjMOCDJfDRRodi1ArO/0e0PVl/zkYeoICslAikoElmOPvIK4i
	NjVsqOffkTKpZ0mEFcDL1R8bmfPdaqx0oJ23emZ0VBt9e+k=
X-Google-Smtp-Source: AGHT+IH6UhR57ulZYuKyh09s5uYszlWMtP35nMK2waRENXknVY9Xjvy0uz9MTrTjTI3i0IEmvmMtYg==
X-Received: by 2002:a5d:6d0e:0:b0:390:e005:65b0 with SMTP id ffacd0b85a97d-390e164b43amr2112628f8f.3.1740646284792;
        Thu, 27 Feb 2025 00:51:24 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e484486bsm1329159f8f.65.2025.02.27.00.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 00:51:24 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 27 Feb 2025 09:51:21 +0100
Subject: [PATCH v2] arm64: defconfig: enable Qualcomm IRIS & VIDEOCC_8550
 as module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-topic-sm8x50-upstream-iris-defconfig-v2-1-13b490a4f402@linaro.org>
X-B4-Tracking: v=1; b=H4sIAIgnwGcC/5XNTQ6CMBCG4auYrh3TjpYfV97DsCgwwCTSkikSD
 OHuVm7g8v0W37OpSMIU1f20KaGFIwefAs8n1QzO9wTcplao0WpEC3OYuIE4FqvV8J7iLORGYOE
 ILXVN8B33UNssy9Dc8hq1SleTUMfrwTyr1APHOcjnUBfzW/8EFgMGCmdyQjLltS0fL/ZOwiVIr
 6p937+Lcqi82QAAAA==
X-Change-ID: 20250225-topic-sm8x50-upstream-iris-defconfig-b56662147b20
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1431;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=XRLC0F/OAsAwom1j0csoEiThelHrO4BRXhTdff3PTk8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnwCeLDum95n+pn0C1lqAR/CAGSzOjk7OzPoO2Ns42
 xhwYqq+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ8AniwAKCRB33NvayMhJ0TCYD/
 9MSTCXn+P8EBqr5oWbDRM6p8c0tAHYK5DyWCyhXAMuJQFGu/qWYfhzc5svdagvtEE7YQH4t++3wS+A
 tRo9lSEejUZ3BNY+YlPEtYaI5caz+FgeJI7krmOsS4ZtdiN11uuer1Jz8yKkS2yqH1vpZEEXmai/vG
 FSDIoYtM6y1YgaQKiFK1eBvizdpPYk/zRdutyT4nxRBacGyzkZrHOEqBd1qrxQeBsTkga6GTlu2htY
 deV9pjZXR72BPeNtptZfwOhTF1EiGeh6toBqpdaD+6qEYMAnIWXK1+EiY86KR8valmX6LrB475VPdh
 kNJ/8Kkvj7QmXRb2cmQpcT3vQFEd/rh68b5+xH6LY5w3/+FjhdVMb+n0q0DvER9OZjBuFZm14E3Aon
 rD/teM9SFkWBFnRvZoB27NsuWvHTvC9OQrF9+KxPZQinzKbsJRfW1SxNatp3ym6tMkrcONzHOyz6PZ
 al21RkGzNT6LUgMr9hsNeB7yPx6rNf6GwwA8yuz5xEqzG618deZHMN9mgf+sxilzqWoN638HNsuXJ3
 EDCPYe8wQPKvuUOQb2/HwkSYVUQo0tytIGCAwYCKZjPNcGNj3ipuIN6iewsS0Grw4CEMYdL3K+e6e3
 y8e7+L5j1bB28jfA8UtmCNSnFYYSB/ialrQTijo1zJJUsOBf6FLJLZ/Gq1qw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_005127_100892_97CE48C9 
X-CRM114-Status: UNSURE (   9.17  )
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

In order to support the Qualcomm IRIS driver on the Qualcomm SM8550
platform, enable the IRIS and the VIDEOCC_8550 dependency as modules.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Reorder iris before venus
- Link to v1: https://lore.kernel.org/r/20250225-topic-sm8x50-upstream-iris-defconfig-v1-1-8a17e2e193d9@linaro.org
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a1cc3814b09b31ee659536a64b7db704153d6fe9..9d51d5bfb8158b297be2ecf8e645ef829ca27661 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -846,6 +846,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_ISP=m
 CONFIG_VIDEO_RCAR_CSI2=m
@@ -1395,6 +1396,7 @@ CONFIG_SM_TCSRCC_8650=y
 CONFIG_SM_TCSRCC_8750=m
 CONFIG_SA_VIDEOCC_8775P=m
 CONFIG_SM_VIDEOCC_8250=y
+CONFIG_SM_VIDEOCC_8550=m
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y

---
base-commit: 0226d0ce98a477937ed295fb7df4cc30b46fc304
change-id: 20250225-topic-sm8x50-upstream-iris-defconfig-b56662147b20

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


