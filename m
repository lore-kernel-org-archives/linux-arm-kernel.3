Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E64C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 13:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J4KUE5PwbLuRO17xX3E9IBzNHOEezC89N05pYrN0JM8=; b=UhpukSYAH4gFEDKay0EoVlbYPy
	QUPS05PdKKCsK+Hrl1nt7J+x6B6/MPVqM1hLXyIxDRqaWZl1KQychrO82Y4Cv9pWD2N7PHBE5X2xx
	nv57yZoVEiemC78NkuQ9XLPg1yaI27bK6qX76FwVr1SCfzKYUp3OgzIEt44LgS01alaD/28jpyLDI
	eoVKRY3l/K8AwBL8Xp1wOiUYHS5MuiZhOA4+8I7yxz5lKvFzG2QV13Ty9CAxHs213LKTGhoxNnd+e
	JzkOND4bfStQ7rq+zDsXoTDdHhAO1Q+OBX9pTASVqmhPBRkhPpCWH2XQgSoGHY3rWSHk4hga3n/pj
	GHK/ZY9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEpG4-0000000CQzs-0fwj;
	Tue, 13 May 2025 13:01:20 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEpDw-0000000CQeA-38xY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 12:59:09 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso37276145e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 05:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747141147; x=1747745947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J4KUE5PwbLuRO17xX3E9IBzNHOEezC89N05pYrN0JM8=;
        b=SHonaC0XYZRErNXpAgiYuJmsY6ESFyqad4/lpVLPyqDu9L+JpKs90SChB7vwM6/4yU
         TRcy4s0MFFsaf/i5Lgz2DyqLxztMs4D1dI9BX0EnJgGCa3D3iCi6E9Atw+6rtY/P0LIP
         8UJ5eIVajJkRkF4ihHAgFnq7ZeT11BC2V7vL8mctV89zesiV/2y3IY4pxIqNq60Ss9lo
         TiAkW6eZXGYfHd3L9XJhaiJN5aaKPdFLBHt6MN6wT+HUcmOOLXH7qhFeqf0rTNxDU+Re
         Gt48K4UOEEueEhrBXuztghLyvy8J6nZfQ7af0w/sAhZ1rW2fLaAxNeRM5fp/ipkOuc9S
         eTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747141147; x=1747745947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4KUE5PwbLuRO17xX3E9IBzNHOEezC89N05pYrN0JM8=;
        b=BG+YQqYhcbrqyYAyivZ9pK12RTJntWe12kRAFun+WFI4PsWAV89LnJoqME4HIXFtSo
         b2hQHnxLgC/o3YaM96ssADmzO9RJerXd2Dyr4lWH/+HGPQ9vf7UeO5RWxgNa4bTpF48V
         nns6d0uba9mAEUkimA7D7mltZlvis9vBtuCTzqacAXrZqJgXcAeO+Z8AQs4fPOZnHLsT
         p6nuutWVlS3VYgQo8sIMf5nih8p6rav5kYITlpl8XLSXdJE0DxNjq6qnKFbD1+b3iYzh
         VSgFMQnh2O5oznL06yLHeCXbfnP7dSKvZSi0lOGy3ohH/KCn5iH2zmW7umqcp/Qj1ys+
         36xQ==
X-Gm-Message-State: AOJu0YwgWGp7xnQ6EuhuZ3IH6Hlt5dI1RHbey7u3znpljFSjmy0VmBH8
	jmUg2cuPI5vfIsPc/JSo3DkIeCGykXONfIoOQzKZ26M5xTuGUDKf
X-Gm-Gg: ASbGnctlWbfukjUw6P0/8CalVRFt4nvyv0IouxbphL2hkjh6JBRa6h4uxGPCvpPv/lA
	jeCz+CHETTEnQvHgVYIgaz6xF3T3FYzRiFx03b/30JjCOsa7PtOnaxbecUf/wFZC6+iMRJoDRP+
	GrGhRw9l1H2Gwl16HM3xf6XndFTlPPh1kY489HEYT6eJL4mMu9DwN07fxeWf0JPpkJZxPmjDhxD
	/61UjvOxI25pCMUgeDm3s+BbO8qYoeab0uJqqWmm87jsum92/h1yr2C2DeVhQYymF9iVfxqTGAw
	8Km0v/a8FQXJc8pgRdsf14pIlA8jA03J30/i3crUa1zSHO58AnewULivg9DxcRXm5yxlrX/SVKn
	ZKqVwLRDTnv5RA8qNYJBE
X-Google-Smtp-Source: AGHT+IGrGbY/B7j0dC6au6j3G/+LoFZKy9rhzDsTGCOWgRKsnjHyUXuPtdByxPNlg8XArd2DgLvsrw==
X-Received: by 2002:a05:600c:8212:b0:442:d5dd:5b4b with SMTP id 5b1f17b1804b1-442d6de0e29mr175513075e9.31.1747141146338;
        Tue, 13 May 2025 05:59:06 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c996:6219:e8d3:1274])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3aeca5sm215741905e9.26.2025.05.13.05.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 05:59:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: defconfig: Enable RZ/V2H(P) USB2 PHY controller reset driver
Date: Tue, 13 May 2025 13:58:58 +0100
Message-ID: <20250513125858.251064-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_055908_787458_32C29543 
X-CRM114-Status: GOOD (  10.20  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the `CONFIG_RESET_RZV2H_USB2PHY` option in the arm64 defconfig to
support the USB2 PHY controller reset driver on the Renesas RZ/V2H(P) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 38d1c2ff3aa9..457dc12f35d7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1550,6 +1550,7 @@ CONFIG_RESET_IMX7=y
 CONFIG_RESET_QCOM_AOSS=y
 CONFIG_RESET_QCOM_PDC=m
 CONFIG_RESET_RZG2L_USBPHY_CTRL=y
+CONFIG_RESET_RZV2H_USB2PHY=m
 CONFIG_RESET_TI_SCI=y
 CONFIG_PHY_XGENE=y
 CONFIG_PHY_CAN_TRANSCEIVER=m
-- 
2.49.0


