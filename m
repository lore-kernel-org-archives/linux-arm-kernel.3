Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0C8C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 09:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWoYWHyR7+TsWQTCalZOp3pZOOrnoTOaMnK3QTfKPhU=; b=cP+ydmdm46YACHWnbc9YEfElgH
	BNQI2ULR4Y0jrK2Q5RCKSD0lEKji5Kdgzs50GKmr4ZpEeYNOfyQmczIV5GeIDOPBUdFVvx4JODgC9
	eV8L5ChcPTiokqHfwpdASLMSW8yErx2NnD5esP3ZgQJffjDVw2NfM4mkn1yk20yN/7aYKF4iD2Ljn
	jDl5H6oJy7RgwNVkKYlALhkHboExSYoSFv/jbQKJaU5t1hw5JiWyKoGjlFbYdhaplhXfJgfeTdgCw
	kFBnC5eAr7gJpukXpfrZqKUHw0OxVkSE1KQ3O2QR7Q+RwswvRio45MwKSJOqGcqRoiXGrtYlSvvhU
	3YnQOnfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teswH-0000000F1HO-3LZV;
	Mon, 03 Feb 2025 09:40:21 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesr5-0000000F0ZL-43SB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 09:35:01 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so2114295f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 01:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738575298; x=1739180098; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fWoYWHyR7+TsWQTCalZOp3pZOOrnoTOaMnK3QTfKPhU=;
        b=SuYDvc5DnOyZs5UfihFY6COc+7PccX6RTvFyR5WVbfc4O8XqoUF1lNSnpwse0o88qc
         XH8dOnpoRV5Uj9Xhnzsy4U1LeGEY7NL4b+iruQoWk+u90eJGetj+QevOCSVoAkQ123CH
         8WN04OtR3rO5oKaDT0bpnGyCAf8EfkunpLP/IxwCdfoTAaMSrExdrF3GMdFEqoxg9a/3
         eFmttUqSbV5Gdo0KBEoOAzHNPkE2P9IH8X7ZQuqsNVEJ7qXYmou9G2XoM/uFjiTUye30
         xKBvhdbhwVcvt+91XgtIXJeRUuai6/csx2TEX3SJKj0TN6JdppfOcI/mmDgoXEds8271
         RY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738575298; x=1739180098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWoYWHyR7+TsWQTCalZOp3pZOOrnoTOaMnK3QTfKPhU=;
        b=emkmupF7Vjv4qZBysw00A2zBoWG8kjCZ1E7JmBXDDIDCwRW6Ud6T+RnhZiNL2DaMBy
         BYbccOkcU3ZrOIdsn3iFVMTmBLg9XApy/FmV2r4JW8LV/RvNuG4GsvVKsZ9A82hYSI+g
         x9Apv1JaHPokOKDl879UPlspxT7NJxs9wsBCE0ew15aGVTM53oihj5GHNPCJocBRkjSg
         ZIX30/ynN065SFaTGsiY/fhdlUahou+82ftBVLuXTk3Qcd/jqL3kFiwPYWCcsVVp08XJ
         GN86j/g0HnE9urPC0r17lUZJd23IDQ7+c1TOi9hdvGM0T4qQsd5SJWxm2ewX+mZoUFDu
         xj9g==
X-Forwarded-Encrypted: i=1; AJvYcCWhUhP1i1R03aPyaLvMk6Xra4YFH4CsEKNVIbADM8MZfMGU+PA1mFLZ9jmwUyoMdmZuYwnmuO+cYHwcUBp0Ufuy@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv/BlbhqGyHBxjDSj1+S0p1j2BF8mxe3eKe7kZBe7F/VB61vMd
	+v9+PPUFpybIKXQ+SoXl6JTX17nYm3Bqq2iZYMq2IOncoEfAY5ybclABBn8TGag=
X-Gm-Gg: ASbGnct3Xx1JuPE0666vN6v1hHj5DIAG78dBDWGWes31vO0ZdAEI/9/j/TDMZe3V+R4
	kqRtMLKdPT25globfwS4qwRvF0Jb53zlCTKskjSnGOAZKOOnGmxMCcmc0y2s7HxE1KxDRXJimIr
	oPXrtGyod1GXRXeuO2QAKCB2XjBxLdQhmmRA/9qJt7HfHNOjIMPOp+eki7G/hc9l4EbQJwwYhWB
	Llh9x1lu/1reAPLoGSTrXAS448zGhCTSRu6+UaI0T2yAneB4iD1rRttN11wD/dn4484M30Yxj9y
	FeDD87KUMm5Y
X-Google-Smtp-Source: AGHT+IHOWivSeEuzXEynCPDAfVYghr4uhGNZt2BHavq7Fng3NU5UTsswmBnk1lHximf7bX/n8I2h8Q==
X-Received: by 2002:a05:6000:1f87:b0:38a:624b:e37b with SMTP id ffacd0b85a97d-38c52097bbamr17750130f8f.53.1738575298184;
        Mon, 03 Feb 2025 01:34:58 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:f705:a3ac:14fe:4e1b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-438d75de282sm122561995e9.2.2025.02.03.01.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 01:34:57 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 03 Feb 2025 10:34:11 +0100
Subject: [PATCH 2/3] arm64: dts: ti: k3-am62a7-sk: Add serial alias
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-topic-am62-serial-aliases-v6-14-v1-2-f26d4124a9f1@baylibre.com>
References: <20250203-topic-am62-serial-aliases-v6-14-v1-0-f26d4124a9f1@baylibre.com>
In-Reply-To: <20250203-topic-am62-serial-aliases-v6-14-v1-0-f26d4124a9f1@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=645; i=msp@baylibre.com;
 h=from:subject:message-id; bh=xZcLWZQ4QsdglfRdxvaMevm12D+Ww9w5x3JcltngFEc=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNIX9C4PlmaeFNx4cFNOSuD9qtCZ4eLZFtXVs/4Il+r/U
 3RtSbTtKGVhEONgkBVTZLn7YeG7OrnrCyLWPXKEmcPKBDKEgYtTACYS/5iR4eg3haXHPrSHlT7a
 FuD3a4fHcsa+O0dzVF7KLhJTW9POUcfwP1mkqe/ecY7G0H2yNpPv7UnWrhQ68zdjkddHtz+XtqQ
 a8wMA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_013500_010173_38EA0F9E 
X-CRM114-Status: UNSURE (   9.54  )
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

Add alias for mcu_uart0.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index a6f0d87a50d8a7ebdb61e609e8071d6681dbec9a..174afe1ba4bcc01f7f67c50d65172d9f6cf6c6ff 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -18,6 +18,7 @@ / {
 
 	aliases {
 		serial0 = &wkup_uart0;
+		serial1 = &mcu_uart0;
 		serial2 = &main_uart0;
 		serial3 = &main_uart1;
 		mmc0 = &sdhci0;

-- 
2.47.2


