Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7372BD637B3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 22:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ooOYMKF+H2KmYqWB5Ili55QDSI+uZ+QcC5rU+1Qm5GE=; b=h1ExahuI1l051wuyO1ZiCW/1bO
	8S4PK3cMx4akxQcmMAwCwVVdYeQjEyXFi5gzg4ex0YneM7h/ZwPYhFw/LgRPlEsB0rqZNDnCA/P3N
	RJgA7CXnpUZ2OFGWdFhLt9kNzQIW4nK1pAwg8Chk3DOTLcJAHf1tOZSeoq00NrE9NA1ABm2WXWLS0
	zVKm3M0YPB32tWWBaGSfxLRdybyNB0ZnupoNBKzbhRMpcS76zxBnw45EtutdHDdcp/Uo+1naEu6Q0
	KRXxUX6aR+rxdHkvmru7AwGkPIuiLeWRS52tORN7rhOI1dff93SaSaVDrMpGwsurOz4QjLq5unhee
	kXNGUEgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVdzg-00000005vBA-323C;
	Tue, 16 Dec 2025 22:58:12 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVdzd-00000005vAM-0ldR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 22:58:11 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-450be85b7d9so3247425b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 14:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765925887; x=1766530687; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ooOYMKF+H2KmYqWB5Ili55QDSI+uZ+QcC5rU+1Qm5GE=;
        b=1u21u3cyVxS4qms3CBT07jenk+J7FuBxWg9EG+kKvCx0ps2VEfQsIu60uBpHr4uQyd
         EtzG1fNMohh2qUvNYmqkiGhDwrIobVQXkwNX2VWcYzeEGJlgFZaH/eJIInMIRwGkDtgm
         +b3R1pzf3ppYrUnq4FBfY+5wFC1QITHvmHuqRkCKigHrSSV70rJtTithKitxx7CjmCb0
         7/bzoeZJ1Vu/R/72+56NxY0UQofvxjzwmeDYkynawTMTuP6sRd4A7PZtZOQdCwHU4lUn
         58KbP39Aj8fXMnqGRHZuQEMCmbixAkAdjGJdWp1Bk1yJux7G8mRs0fi7luMOFKo7ol2r
         8zpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765925887; x=1766530687;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ooOYMKF+H2KmYqWB5Ili55QDSI+uZ+QcC5rU+1Qm5GE=;
        b=FeTjAadObGvn0Kxho0XHHxwxxpvfPMs50facXdwIxcjUiweeCdDkF9MhobvVGXFmNO
         2Soi6gkRb9LIEj7NHL0ZbBXr65D0MMzpxBOcBT8hC6lMTRxDMfiNR6ZeewEJ9tQ/w+wl
         JubBrk7p5aizqSv4w9e67cZdVDzAwLcWxEoZaGPKJrHhkmzzIxQo+eykfNyWXUD2ENS5
         DAV7ksJgB58OWAWWrkEaNohAB8sJt20Kq7ozXXfWSuQvQBxl+kbA9bzcXN3BuQASr+2e
         idD1AQ3+t9Anx7tacCMWU9lFLkyiCN6E+vxwhEoKcWSeGKRsg69OcNnrK/wcHRBrcnmJ
         yOxw==
X-Forwarded-Encrypted: i=1; AJvYcCXpJh6FBgd3MSoNNMr00TbhVRqgoXkvun2lWXnBsJU21XXJjXgAXGGA3Xk2NxAVWdteGSJnPqfVsvxcpoGmOZe7@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj/ZmVL1t2QYNaMwbzuC1hZd54IbFycr5QiIBbErPTKlj3whqM
	SR+KH9aeDn8p3mSOffaAoSpmWVI44423Qpc+PgO7tuYqJHnxneKJDU0LYApJZEzCDxQ=
X-Gm-Gg: AY/fxX6kjzBpNENeHlwZTh8beJtxeYfXSPvAL5yxovRRI7BdZlZm6m7UEXq43Fzb66G
	tRVAtyPLNWKUku0BL1f3wN34t7WMnMw9YvoqhzzdooHukCUwnpqV0XfPPOmzyit2hafWTJlMDo4
	BYfB0FlWH2lNDupMJ28ZSXMv+B5wBR6Yf5DwNkdZLv9gsI/717t0E/axaewqCN6xiQpTfLIJxlo
	jt1EKB7uDCdviMSNEAIInrGGoeY4HBhlL3qXuRXFrepe7MgKSCXEiYljW9Y8q8jfdkpOQxrCcxw
	Fn/jOZcw7tXvfhr1gai4IotOZ6RkrYVLoKnT5ymsMcHZGrKvjCtzliA84FtTP3eGn3qE47Wn0hL
	8gxJoFOGw8n2qqLfbgvjK3XY4tvf9oSICLr8vCig1Po1k6tnFiRUo2boQ/1QZuAAodjGT83zqNc
	nROoxL89WGnG1b2Q==
X-Google-Smtp-Source: AGHT+IGvIl3sZdeYyABXtNkH9gms15ySp/W+3mzb7VAalGLpvvkhDucsn104GfSkCZW78M7CnCL4DA==
X-Received: by 2002:a05:6808:4a54:10b0:455:eba2:9ede with SMTP id 5614622812f47-455eba2a67emr991795b6e.23.1765925887473;
        Tue, 16 Dec 2025 14:58:07 -0800 (PST)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:11a:676d:852f:9349])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45598cf191dsm8806668b6e.10.2025.12.16.14.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 14:58:06 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 16 Dec 2025 16:57:53 -0600
Subject: [PATCH] arm64: dts: mediatek: mt8365: fix infracfg_nao node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-mtk-fix-infracfg_nao-compatibile-v1-1-d339b151ac81@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQqDMBAAvyJ77oKJxqJfKSKbdKNLNZFESkH8u
 6HHgWHmhMxJOMNQnZD4K1liKKAeFbiFwswo78Kga22UVh1uxwe9/FCCT+T8PAWK6OK20yFWVkZ
 Lpm2eXe+N7aFk9sTF/y9e43XdpmBIOnIAAAA=
X-Change-ID: 20251216-mtk-fix-infracfg_nao-compatibile-ba543769f5b9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: Fabien Parent <fparent@baylibre.com>, 
 Julien Stephan <jstephan@baylibre.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1233; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=3b4ENHu/9j5dLIMx7Lb7rEQYQt3l9o0AQcUszqUwcQQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpQeP20JBd34+C400NYEMIY1MHpeh3e2Evyq63J
 dFtNazIPwqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaUHj9gAKCRDCzCAB/wGP
 wEWKCACNVAHidpy4BANZQcTr0S0Ws/oeGNHfWiH//n3PQZYZz7A0JeiGQEkUGjzS7EblzCkq/tg
 2RXNOhWTEb0b6E403ut78HghMj33dyOV+7yZU/gRKOu9Uus6VHMYkhgGV6aBNSivgdiaxF99SXW
 uwznzsHOAGISWnQ/zFuQPPvGaD1EGUY+TM9g2S0Kh3IQ6CBHg2K6n4ANRy9BQ2Yc93XAPyaET8U
 WqC89plhJkAlMlNaHSRhbHj2nPwuop8+6AxJoauJoqmHrXgvpKOd5CGq5fzJUEo9LJMedkz4x1l
 izZLPPFKx8EaI0Ey31Uo94B7iiygFnM47riGfvju5inPBm5m
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_145809_534371_61AF9A17 
X-CRM114-Status: GOOD (  11.63  )
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

Use correct compatible string for the infracfg_nao: node and remove
the #clock-cells property.

Likely this was copied from the similar infracfg: node. However,
infracfg_nao: is just a syscon node with it's own register definitions
and is not a clock provider.

Fixes: 6ff945376556 ("arm64: dts: mediatek: Initial mt8365-evk support")
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index a5ca3cda6ef3..4116f96c81a9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -537,9 +537,8 @@ iommu: iommu@10205000 {
 		};
 
 		infracfg_nao: infracfg@1020e000 {
-			compatible = "mediatek,mt8365-infracfg", "syscon";
+			compatible = "mediatek,mt8365-infracfg-nao", "syscon";
 			reg = <0 0x1020e000 0 0x1000>;
-			#clock-cells = <1>;
 		};
 
 		rng: rng@1020f000 {

---
base-commit: 6987d58a9cbc5bd57c983baa514474a86c945d56
change-id: 20251216-mtk-fix-infracfg_nao-compatibile-ba543769f5b9

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


