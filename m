Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE939C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 09:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KojOIw0/7VKNeIbp9mqtjfjXLwzayJpBCU49qrDmgzw=; b=UAmJKa+o8PjNP0Sp/oK3rTrdZg
	+7vJmStTY//bcTh/U/F3JYJqf/cLdgjZDJ6d1o8ZeIrc4Jf0eq9Ywk5f4iGnLdfMoVEJ+qKewMciF
	hceRKAsE2pmOuVmJf+QcmPGG9KMum0fIAjVNqZW0sWJLstjSAFPJsFETjKl9X32XMeKel/jaBARb+
	eInTJ9RWAEXnpEGVAL/MdaZZE29eflPJWyDgdqYBrM59veDC6yb/BMahUQsfXfku/NOWYPivipf7y
	D8GyS60+VApX8JtTIAaPginGriJiB0PiyayDxRe1CN67+zosmucuuDam98rlpjXvzIArZ7mLVfLPq
	C+JzHtSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqja-00000007JDL-2EZG;
	Sun, 12 Jul 2026 09:44:26 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqjY-00000007JC9-1SJz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 09:44:25 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-381891a9525so2602378a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 02:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849463; x=1784454263; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KojOIw0/7VKNeIbp9mqtjfjXLwzayJpBCU49qrDmgzw=;
        b=hyawO//aYINS8a3KO+9yujkqdkiekmD/XNNREgklDPIltfyaK/N4EJgpKosDsf0NY2
         MdnDv0KmeLvB1K2+exaszqAbSLjCRZkx5D7CLlv2YyNovPuYS+xQ8iOB54DuvjHlLSiu
         ZdZDCwRJ9gxWbGg0MnjbrUjrIWtaiEatV36+QU/hp5v8y5RQzHI6vE7+1H2oI7qIHHNW
         2UV3Qo+08of1nrvUwO8bRf43Dn2jxxOWN2TITZvOEjnrAAllkt3lR8g9MOxPT7mQJY9Y
         vCh3IaUmyP+HmJc7M1eN+9EikpvCGA+7XasEHOJWeDexudtJshyJ9GHlWGj+pnbrvLSJ
         kVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849463; x=1784454263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KojOIw0/7VKNeIbp9mqtjfjXLwzayJpBCU49qrDmgzw=;
        b=qGB5fwFXveUx8SzXmGNdt3TEm0BLTXgLlBQMHv8j2E7i77iHQMO77/NVInsi9TfDzz
         57R7X2x+0CMybefpbBaJN6XmmONfbOGwRA0h3jpfOIYfTSvyeWpp4xcTIMG3g/8ATDe0
         msQQrSrAwq2zoEIcWMUHRHKYauUAwiDaQfp7POvpIhqRaSHDc8nDoklDF5YjKzCJqzdA
         +FMdS1qJue/XHc8G0CUelmtlkFDHT17WJk+yqEBF2gAdeGVVg7+dbsMyY0ORJJ891oGO
         z4SVz/Th8U1wPJYLV8bgc09dFxXs7PmUTvgeOvXD6aq8TPlEiRpIQJRE0mz9i6of0SR2
         6Yhw==
X-Forwarded-Encrypted: i=1; AHgh+Rp6exHUix3kFImWV1DmD2VeERJmkOklkzM8X2jOA7N/soi2XRWDgkAks+VFRPrhJ4me9euY4YHmT882t3/0Rf3n@lists.infradead.org
X-Gm-Message-State: AOJu0YxBdTqZUT8CzJdAsS/avNXtN+X/8trVWDdFkjnQx+0s+gbjhb0I
	0EOkvqr/0R8otMMzW8Jy7iJXob85iUNFK8eIIJw2z3RPzn4ejQOWToLM
X-Gm-Gg: AfdE7cnSXp+LqXA4Q2aRPftGhsqz45LdKZOJQeoL707Mp3ksBGflzf4uaJVZcc6fiGT
	2V5Bucata5Vsmk5DSNuZRH+64OIdhEqC7HsK+rBRQkYtHN0t3qNcYWKD+mEvWQvSleoTIBslEjR
	Twv8+1Yz/kBtE2obBN9ohIGjcvKL9n01lQ+xHrQeZQu7/ybbmfTzcBNQh+4Uy80kbEKcTOsuvtg
	7vayozJOKgxKPQwQ1Xh3pPewb8heBy1/PJ3EJS1QgDBzeC9gjcmn0cUVtNcHuRoLHJCev1cnDS4
	GoDeavHdKBJMqt7olMpB42GPmCntYaiMEy05zUQxJiZyh5c0bpdRiS5fXt4NoIHxC5Dlq69uxKs
	PU/hssmSO0dr0EzwYQqjcpOY/XiEVKcV61pbDMB/gp/Bo+DJHzq2giHY0gIZOzuKfOqCTv+pbfe
	LezG4esuwY+mvcWfdONHX2LvEb7JKxDdPe+2/dXUHbjzm4Rut3fI8soVzkAiSDhP7Iigu/MXENJ
	Q6X6q4UKydcXZADA94X/ulnKQ7Atz818mWQdrPAJU0PxCDhyx0nkrctp+xR+RgA
X-Received: by 2002:a17:90b:2802:b0:37f:9ce1:7364 with SMTP id 98e67ed59e1d1-38dc774cf00mr5465528a91.26.1783849463612;
        Sun, 12 Jul 2026 02:44:23 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:23 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:22 +1000
Subject: [PATCH 03/12] arm64: dts: apple: t600x: Add SMC hwmon node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-3-7763006d57c7@gmail.com>
References: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
In-Reply-To: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=679;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=V+frO5wk0tnXRPBZHabpKOBw5u16aJAV7l/JMbUCB+M=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU8sOyuevxZZl3o733i2iW7IseYJiSGud+YevHKgg
 Z1/4xuTjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFQzf2D4wy18fXJQyb23Mwun7bi07ZpFf6fL+eoLPxb+mNf11PrFVx5GhoXtL7R
 V05o13/tWFHFd1XpvXDRBUCD+ovra9uiOhfr+/AA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_024424_402206_6FE09B0B 
X-CRM114-Status: GOOD (  10.17  )
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

Add the SMC hwmon subdevice

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t600x-die0.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index f715b19efd16..17db8d7a850c 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -45,6 +45,10 @@ smc_reboot: reboot {
 				"boot_error_count", "panic_count";
 		};
 
+		smc_hwmon: hwmon {
+			compatible = "apple,smc-hwmon";
+		};
+
 		rtc {
 			compatible = "apple,smc-rtc";
 			nvmem-cells = <&rtc_offset>;

-- 
2.55.0


