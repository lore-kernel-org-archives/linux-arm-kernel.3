Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84120C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AzKbft0Av4+PkH9aVIXn9viIteKtaJ1aX/6MVhkBfwo=; b=cFiOvSFi0bJMpXht88GyP8UxtN
	p/QNn6hp4DewDGrNDOkMG6XP67Wb8AAD4fHqUO2fx81NnUCKueRGBbWAXnMckhJmO9HctxOjpfjyl
	yohM3O/WM7gLs/aBrVReVfxdDP1aVrgno4dSSizWotqbANoMhdohjCDs/j9+CapqBU2yCqZOVJld9
	O3K4Sp3AxB7vmD5D6xyQvSJy+PGm+It+c6bVwzZyfxMqucdgIQVOlJeZxx5kGsI5No7MPs0IZvVFA
	zdEpi9xDSyZe4iOke6h+iiBUlnzbkkDvllDBSAHzjEao1V6NMol2yqrzl+HGSaQdDph55KXjVRQAW
	tx30vRKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7v7r-0000000DvA4-2Img;
	Thu, 24 Apr 2025 11:52:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sEy-0000000DOjZ-3olw
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:47:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=AzKbft0Av4+PkH9aVIXn9viIteKtaJ1aX/6MVhkBfwo=; b=jrLg0wAkA8RIi2bLt4o3mGzQbA
	BaAhkfEnXXtqDja1k/e3deFROLILvLw125qbiAygxTAo5SMyHKdKThQBHILNDchWDHRzUmELPwbxK
	Jhpyam0w++jN/LIEH+O3AK7nEXJKRApTSbUpcS9KCyYcFdsu7S+fN+/vpaJfx4BCosvl+jCaMRfwK
	t4GZeP9fQ5qdnJGqzNUo7Vw8nH1iWepL+NaSuE2qDqG31YymUVA7ZFyePSNq6KgCd7LdrkN/A2cQ8
	WUWp88VVbuVTXgrKQTp+7WiEUoD1leAM25PWg+MEBtYC1gW0ZWJGxO/ij+QpqpcKwSSTF5RRlXomM
	m9AKiBHA==;
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7sEv-0000000BdqG-46R1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:47:27 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-acb94bf784bso9839066b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 01:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484444; x=1746089244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AzKbft0Av4+PkH9aVIXn9viIteKtaJ1aX/6MVhkBfwo=;
        b=EsM9UYJcb3v2lsEbv7bq1y5rAcESNpvZoWNkd5zdwas41gPSZIL52SpCJ1nT7hmEIi
         4jBqiPb5FNxQv/v9H/Gu0kcchq18yaeOaQ4xt4MwIBzT8myRsYV1RcyK9zHEASpAfNaN
         FRKq9LPv2iwUifMwuaz5+YeUmTwlYx9nrWXssTefQ2Kkhd3JJtzrjdL3b7GLDeAnLe1J
         EgP9uVPxuULv9hmD9cJF2lh098tJvtRmMN5j7PWfji78FLKe0Cbs0ImjApSjaUw2K/X/
         2YZwFXrD0G8QGbRt84/TdUYQubGzgS+RtZJprg5FAORDwJOGMHZLBNv11hZtxRmV/vMy
         tecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484444; x=1746089244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AzKbft0Av4+PkH9aVIXn9viIteKtaJ1aX/6MVhkBfwo=;
        b=qiO5nkmKgoMbzNQjhf7RjFihMMztNuO6hPfTd8GvdKFItdjSQKMY6kQqkxRSz+cHb+
         SOd8Ua/2zbsLS1ZFjCiVfXwfG9ilJTcj6SkQwBttgWaB5JVMS7pWfwLnpfZVQsJW1ZNr
         1SFY9qivgNRaVmVqK0nJWWfgoDHG8I05+dSoJaqsVsEFG0iOKwnI2p6nPOZU3g9fRZiR
         kr1F/LS6dftUxkuGo5PJE629cskM4QRHEW83a3CYWN6apx9nU6VmNH8yTfUVAZd3J4yB
         pvVkh1D+WlBrHCka/1eJ0RlUXapCI48QFGuPd2gDm2sQxnuO5yDiHFZRq9/3NspuaGTf
         ejxA==
X-Forwarded-Encrypted: i=1; AJvYcCUfoQobckLvdPfkBq4nzyrTD3jB6gQrN566/2aRjFGf60i1Ba2LoSciGpRpEzfaRO1ISqWrR155QSZawJNhVh6P@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtc7H86zdz+rRoKTDtdA8pUWCnZPcfnOY4AWzMHFaAw7wRvs6t
	iuTMYOSVfZkWo5WCExNJHrfq01r0baUe/WDhMRwr8WCrMJJiVHKhLTzKBmaSp+8=
X-Gm-Gg: ASbGnctYTvMP1Kigi2y6etmErFbF836yeyEAUjqpwdL1GDhYFqLJP83lUulTZcko3Ly
	onCFNEOdS82aIOOMWA2yl1UuCI/DolWWc9CdtIkozJ9ju+eFygD0lbA4PBOhBVMeZyKROkybIDp
	WcEteMAAZvgNCmMZIPNHGsWZzpWUeYy4/SSfQHB04ghAZN4dooWqAfSarvpSan5jKy72uDfNaYB
	Ei/A7zrWWfpRFq4PGCsC0mT7WTqgURfIGaJQRktSeXJKTokGlgopaCZW2m/Ht8NyTM3m0sGUI/f
	9ap6nSTQ09GuUNdZhfimZ6UDzq4C8G59DkW62vnkgoi2B5qc6g==
X-Google-Smtp-Source: AGHT+IGFDaepY4la+CBTucmeGZBrlMkFUgpMj6E1x8ks6fo/36DTs1K5XFkEMFO750OFGsNEb8G5FQ==
X-Received: by 2002:a17:907:c13:b0:aca:9de1:f88c with SMTP id a640c23a62f3a-ace573b33d6mr52851166b.10.1745484443690;
        Thu, 24 Apr 2025 01:47:23 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59c25de8sm70417666b.135.2025.04.24.01.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:47:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: amlogic: Align wifi node name with bindings
Date: Thu, 24 Apr 2025 10:47:21 +0200
Message-ID: <20250424084721.105113-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_094726_142920_3924491B 
X-CRM114-Status: GOOD (  10.54  )
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

Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
wireless-controller.yaml schema"), bindings expect 'wifi' as node name:

  meson-gxm-rbox-pro.dtb: brcmf@1: $nodename:0: 'brcmf@1' does not match '^wifi(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
index ecaf678b23dd..9d5a481b309f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
@@ -217,7 +217,7 @@ &sd_emmc_a {
 	vmmc-supply = <&vddao_3v3>;
 	vqmmc-supply = <&vddio_boot>;
 
-	brcmf: brcmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};
-- 
2.45.2


