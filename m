Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C87D1088E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 03:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dugvu+kfXfd4GY/8CmBdh92vQ65gf2fojnnlSbzYn9o=; b=rCk4iAtrtRPIPDa33rxQ60tPXM
	gc2hqnbMiZ3jk0HZydxvGoKlDvsHaQ8pIZ4JzsNF9mrBPpksy5jVyezp6L0VKS6f+KL/mZXxwPaie
	zD82qEvs+cplwQx4Lo7lnu/HZ/rK4kMTWybPg10KtZAKcNKcAw6zfwTrUdDDUXG2iSIQLX79Qw0d5
	yxQs/siJQecDkp8dyuNgJcOn5ejr2KB8UKGYHlJOO7jg1zN6r2w8S3VL3vFww8imJJSLIxHUxVkx3
	DJOAYJ86DXO+6oYXDSVODbot6j24ch9mhCBhdoNommGsrYB7IKBa2IECAmGTjjxNgxN+JuuHPa8Am
	yHcXFtsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34SL-00000009rL1-3NGB;
	Thu, 19 Mar 2026 03:53:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34SE-00000009rIB-1rCV
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Mar 2026 03:53:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dugvu+kfXfd4GY/8CmBdh92vQ65gf2fojnnlSbzYn9o=; b=VNjLCJqyVwfhe1VGI7RyhTbO1k
	OPXJTMBDR169teNNZAESiQEFOh/LRs/uNtzOFsbeUvEthJD1u6if3MhKYPAeKhhEPBqMWb+j9PEjT
	pIMhihGCr//obBi5/A5xyAEdv1E3M/FfPygxhMByHJK41AUb/VZbprGrEAZgwWBJHgY2fuBREhwFO
	MC6NhOmrpQepDj6vKMyFTsGBIwjSwF3v4KM/vQVSsqPT0XfN1JqA7vmJBplXgC1OMGQapPy9nWC6z
	FmHSVzKla2tPeaRus6jAMzLLAJjeuq95VsZfINCKWYCcUs9OUU6e694u8/G2cArf8r6dOGRfoTcnB
	xT5yq1xw==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34SB-0000000CgGH-0TxS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 03:53:48 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-35691a231a7so353681a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 20:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773892424; x=1774497224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dugvu+kfXfd4GY/8CmBdh92vQ65gf2fojnnlSbzYn9o=;
        b=McLPXA3T7PgUuCoytvTxwQ1Aq/gKf0RPHup45JAj9yo3gmOiLK4huX4+9kPCr89uUd
         KRf9DGNe6Np43grFP5zRHmkilWAsc6VQxpzDG1sZMidJss1DBQCxgOYyLyP1x3Q8av8f
         aBKW0gMME3frH8Ytmp1nPz2qw3SuH5noU2pxVRHV/dvoN03wDOlctAuOj7Pc4rniUZ+P
         IARNqNeJVt/SxcT8mW3cHKXnPgoct124DyfHU8STwQN540OKsx3wfKM0DZaLWx3dRmBt
         DGIbCmlOA4+7z95zz3Rc96T6gs5A5LYiCw5Tj0IHjlKBS90eaI5dUb/Ga5nnZ3lw5yHp
         IY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773892424; x=1774497224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dugvu+kfXfd4GY/8CmBdh92vQ65gf2fojnnlSbzYn9o=;
        b=oZkgCg6PzhjZ7H/PEIjYbr7ZF05oPwWB+v7yKWLVnYmtNTrW0gTnQzfov3FpmVsYm5
         Jx2EendxcYXZjEo0P7DHX6puwjR/oDcnR+o/NYhRlLFP8NCeXFPQrReINUHf829EgIO/
         jQzhzLC8t76a885en8p4aXNRshTUgpr8rU1/BxvNAzMtIZvcZ5ilYwdWneTrxy2BiHo4
         77G8rLrw/Yphp6z2cUAA3eRI+ufgnteyq3q59Oy/6f1dOGBcC7ez+MOIFEP96kJI4Q+f
         EWNqxk27R3L0MhSJgpfJqB9ciHyMhj8goP4JsUuwuWmAepeCH8cH5QBqRbgRXO7z/3HI
         7JfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMm66Ri3dVWxSdCQH4S0m6xo/sg9rTUu9NGJn3PiAKtlJjz1frw85zZ4B79TjaUsRtaI3N2IZn9zWx88rkanSG@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo18x9I0iZ7s9V5okFZQ45uTY3rwZ6Vko1lWQwD8bwkaVFee60
	K4wZNzVQ2tJuZSxh8h7eHRG99/RFwNQu3blLrYTJIlqCOAC2hV8ZGrkc
X-Gm-Gg: ATEYQzy1hTEebwOUlnWyTghHc51Pwq0vOKXYlseG+lvB3v8+z0rYPIMeOU6/b7AQXlA
	hlMy0m9OBNjfqL6z397AvggLfP52P5MJWfmDoDFm+AVEBNwS6i0ScVKhoHKUBQMh2BdnYOUz9PL
	ec0kTr6Lv/GGMZddqKNB7RWmoekOI/waZApA3jQFNfa2+WcbBVDxhX7zOaUYOTjEoMQaky00onj
	14LXFBBBnAydqe+kFKMiYy8uN1+T7ztQyIEnq46uErb7X6ZyARZTkW2sfZPJDxB0aUwyfnsZ2UO
	3tnazUEG2h1FctjfnMVvMhOS9PBPbS3I9zMr9Jsb0JAkwEBVzvZN1XyZ/C3zkonuCiseZK7iR8G
	RwNKeRAZ8/pJTX0Z7upBN1DJUSjQ5EcFTf3vLEUE596WemH9Ts/7besIXYtLJFw1mU2vTBamihv
	zN9Jm3pc/qHmu5Q8DSHM71n0ySaxAy3pScu6fUzI+1B+SrAPlH/+wY3eA=
X-Received: by 2002:a17:90b:35c2:b0:32e:3829:a71c with SMTP id 98e67ed59e1d1-35bb9f2e0c4mr4631369a91.16.1773892423807;
        Wed, 18 Mar 2026 20:53:43 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc60ecb30sm1159145a91.12.2026.03.18.20.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 20:53:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/6] ARM: dts: BCM5301X: EA9200: add WiFi button
Date: Wed, 18 Mar 2026 20:53:19 -0700
Message-ID: <20260319035324.269905-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319035324.269905-1-rosenp@gmail.com>
References: <20260319035324.269905-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_035347_372396_26EF81E5 
X-CRM114-Status: GOOD (  10.02  )
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

Adds ability to configure the WiFi button.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
index 7c6ad7787945..dfbe16d9f354 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
@@ -40,6 +40,12 @@ button-wps {
 			gpios = <&chipcommon 3 GPIO_ACTIVE_LOW>;
 		};
 
+		button-rfkill {
+			label = "WiFi";
+			linux,code = <KEY_RFKILL>;
+			gpios = <&chipcommon 4 GPIO_ACTIVE_LOW>;
+		};
+
 		button-restart {
 			label = "Reset";
 			linux,code = <KEY_RESTART>;
-- 
2.53.0


