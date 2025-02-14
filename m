Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88166C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 04:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TS5Knb7XMjcuFKIBATQ7nHoTfU5um3mKBC4QXOJc2lY=; b=WZGdt6rfHa9glCfzlQSSrU6tr4
	rRYGf56ttIqpDT8Ix11y5k7njMPxjJYtrSx17k1bIzz5QJpebr8XTkkRU3vGWj4Qy5TQy3JpyuaZC
	d8ACyJNXYbpiGFI9S9meVYCf5994ITEdJZ4fYAytj5QvMKeIKqw38Jee2Z6Pw30FphrJL3Emqst1M
	kS8fP2yOQBkPA7XDHfAibCHFM9QDppnLfGbKXYUGCD/Vcq2vawEQZYF/MM+fxyRmPGDk3ueSjsKqx
	JU8Q9sby1Wo7dkBAigVhQWdAMUK1oEMGol0pOzQFtAYlU/kMTx5Jg73b21OyNZ9IAXo0VzSv9BnoH
	obggCaEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tinRc-0000000DcAT-2Lyj;
	Fri, 14 Feb 2025 04:36:52 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tinOr-0000000Dblr-0wAI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 04:34:02 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-8671441a730so523664241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 20:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739507640; x=1740112440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TS5Knb7XMjcuFKIBATQ7nHoTfU5um3mKBC4QXOJc2lY=;
        b=HDdyor4PboDFBN0tdan948+yphZ8GaECiYmfXH/12GfYvvuaSn3znsvkV7Jo/fUMK7
         FxjUGUpCrNpeNMWTML/mZ+8PL8dUJJGeNNnsN/IvhQMVv4KgWbNh3V3++8LWrmiH6jGD
         XGJrXMA9nPn5iIZwLU9OH+uY+Wenw9lkQERyff1+Lwt7oxN4WP92iXb3NYv21zB22DBk
         BRa3ZeU4fvpx52zPU5FTog2Q89pEQBXicVVj7ihI9g691yiX6l/Js4E4Vgbc60uCWmzN
         DDrc2dsxh16TqJq1f+S1HkTYHykVYo3OpDmah2h44tUN51UJKurS8JTh9Dvb0T5hQtn3
         GtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739507640; x=1740112440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TS5Knb7XMjcuFKIBATQ7nHoTfU5um3mKBC4QXOJc2lY=;
        b=hgYCEYRws/e7MwhkK+xUBCYMOKYCbFbNy94hXfqfP3uCOr6Eu95Viq3d/QScmBBI7i
         fkZDMt4jqOl9ZlByhLWiOwhmtPiYZAE2cbb7EaOsTy/3ydDtnBEjhGK6KrosjHdNeLGu
         X2nUdn5HtlUV0hTuQkiFbsi8qiOz7ZztLR7WLx4SxX+uFMzy5MM34yQ4cilK5DCoqNtW
         HxQR26ID3y4yvex+n0tPzEoWhRlhn6cyto888zK/AlWdiy1VYiS9s+uamOd3xxbYeh7H
         hQ/fBddXUfIyPjWcgaXA8JjRosbAtuI7UmPMTaaiU0WxIbNoxni3j+zQ6eFtO1rut3Co
         hOYg==
X-Forwarded-Encrypted: i=1; AJvYcCV5y8oMm0qmrV1aqQAhUT79FDpYJ3gB99o8J8KA0FVdq6Y+qXrvKcIKBGD7pwqoeiEVC/3ctrT3c1WXvQPqxJRu@lists.infradead.org
X-Gm-Message-State: AOJu0YzhtGZqpUhTwd3Ah9iooZ2h2UIsSrbu6Mnhym8dhs9WStTZA2o8
	mSz8oDpE1bfGt/XtVomADoZTvIklxRhoOVQs1NiDNQ5Vya6kmJgW
X-Gm-Gg: ASbGnctv1r2TmyGOrFBLPd9lE3ete0qRYd9yuP12db4NOGnejwTLmjBzIzI3YDLtziR
	CAG3CRz7zct8B0E86swjwjpQHWrB6Lpzb+764cPgHsbeRS9aZmeSlc4MJmNeojQBz7IyHmCBph+
	E4ytMpuJnM/JCdMNVfV6E/Tbtr9iwP+S6s9ZGFqfv0f03VGhsKr4WkUuj9Rv7uiIkuRaOmV7g96
	zhmzDe/7KpHq9VkTdniJ5J685WCRMPh2zNzXDVsGNHIxxJJpMRDtvLSIOOLGCMZtRd9sunOxSP3
	axS5PalIkMFdM0Vg1jEndPLg0BX43/we/22v3uP4qG/lRzHjXhSjeKfnDdV4jJ3hXUxT9nms8zy
	jjA==
X-Google-Smtp-Source: AGHT+IGu2yT+6b55ONIteFeW+9c3gw8B023b8z/MN7APmsValfKFvdqzpCJHgJPqR1gvD0CzamOr1Q==
X-Received: by 2002:a05:6102:e13:b0:4ba:9a20:dcf8 with SMTP id ada2fe7eead31-4bbf231943fmr9155562137.21.1739507640049;
        Thu, 13 Feb 2025 20:34:00 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-868e857f2desm422800241.10.2025.02.13.20.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 20:33:59 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: andi.shyti@kernel.org,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v3 1/3] spi: dt-bindings: samsung: add samsung,exynos990-spi compatible
Date: Fri, 14 Feb 2025 04:33:41 +0000
Message-Id: <20250214043343.263-2-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250214043343.263-1-wachiturroxd150@gmail.com>
References: <20250214043343.263-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_203401_254165_F68D10C4 
X-CRM114-Status: UNSURE (   9.48  )
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

Add "samsung,exynos990-spi" dedicated compatible for the SPI controller
on Exynos990 SoC. This ensures proper representation of the hardware
in the device tree.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 Documentation/devicetree/bindings/spi/samsung,spi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/samsung,spi.yaml b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
index 3c206a64d..1d3c95bd2 100644
--- a/Documentation/devicetree/bindings/spi/samsung,spi.yaml
+++ b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
@@ -24,6 +24,7 @@ properties:
           - samsung,exynos4210-spi
           - samsung,exynos5433-spi
           - samsung,exynos850-spi
+          - samsung,exynos990-spi
           - samsung,exynosautov9-spi
           - tesla,fsd-spi
       - items:
-- 
2.48.1


