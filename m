Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70480CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 21:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1PFOqUngE3WRT3vXoG+nn2/r+9Vx7zz/vfzR0o6Iog=; b=ROdHD/r65U7PRO165g/gKVJp9C
	5qdKG59TtVYt/IW5QJ3XDA0ZiiFyB99U6dXHFSuudpqcg89uhP6oL9jv2XKLsLbW9R8jw/azTkUEt
	xGspuEVHfGRfcuvu0shB+yl8W/bfTSfb7GfwpWVn0RpoZD5oAwmbVfFZPRn7gRDJrf+Iqesr8tZkn
	0QUdqA9m0CH1dsu+U2WAiFR4QFQjgrObsVRclHtqBoQ5xnrPNVZTr40hAOuWSitUrtjaRKzNWdNEQ
	GqRlqBgUNPKrl+cT2811YMPvdpWJB7dBwVcjjw2dBS6VR0DMLIm5+bRXnZqZYurCaoUAi17yzubWU
	satSJtbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzKK-0000000Ekgi-32W3;
	Wed, 17 Sep 2025 21:04:32 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzKD-0000000Ekaz-2oao
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 21:04:26 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8275237837fso19134685a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 14:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758143064; x=1758747864; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1PFOqUngE3WRT3vXoG+nn2/r+9Vx7zz/vfzR0o6Iog=;
        b=Oer/iO0AKeH6T+Kp8YcJWh7XXKqoqjAEf1cvf9aIm6vBj6U6FLieVh6ZvE3kxeU5sO
         maCxfH+RpnyT+PSeb7PHUJ5mFbyWu66S0Kygkek0N9lxjYrrTpJH/IZaGKfe4zFB37or
         3WBpCxqoo2AR5K+bUI1dD8fI43JfD3+2VL3G4evw5fMSpsUf4oQlFZMO8OSTz0QZGZlx
         fWuZCsLC8s9Pg0H0v8SV+ykbAM3miovnwIrmCxXVKGU7f3yXThzG/INIndXVqX3tPbQi
         w4nf6QArZGSoCdSOKKEjgxEGBLu9vMdaccvC1OEBxJQu0YsgVl54LMwbvOmosXwyqnkD
         yFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758143064; x=1758747864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1PFOqUngE3WRT3vXoG+nn2/r+9Vx7zz/vfzR0o6Iog=;
        b=LqSmP2nwHERibWYrrSMI2qmUSbt/AXw3Wvntj4bg+NmhyayCqO9WspulivUkrXGf66
         UyDzTXEZPyzo5Wu3tS3VVWZNCq9TihBTFlJC7IgsMNyKPtHXpI9Fza8auWNxxJ49aKyn
         VnK2cafKYfqkHSptCVeNi/X34DwdPLHjGG2hgh2/rlb1Xo+Sa9BOZ6TOFXBgWjlqlYMh
         2KH2HdSf1teuKVYHLLJdSkqDiuC25iYzLw8glUr/cNz2LFUoTMom6MDTWGnmCnyNvOwn
         6ywJR5yvCed6iFPFkQsBVnA6yDEKPizj75pRfUu3Vw0X15HEC2KNsOWS8mDO9y43y7rq
         pWIg==
X-Forwarded-Encrypted: i=1; AJvYcCUvdx+kmJZF3v6kutoMp5xB79vafN88x1ekE5SPBpT+P2BMKLwACD/ErVY4rp2a6EoBv4HP1huoK/MNXjuxGvXm@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy2bxwNN7WWSS1lAKpFTtBgldQ8Od631S6jx65Xw3/GMTPvRyM
	ojaSgSXsaJADuNMaaZgKeih52mWAGrqskW/4iTzFMnqSHYsqXkAHBOEO
X-Gm-Gg: ASbGncuonhD+oFewCZCtuFzyJy89yf4XtxWtYTRpqUxMTSBzn7m0/CvF6b5C5cfuId3
	lLmsMDA+qIWcy9m1lXoe+SGbTFFs1/AcutBIr2SGy67SG29U60sufXTBjSlzLpHjpxzJ+nVu8gt
	GxTUxS0Rf9WPkUZfW+hFhcPqh3NJY0FG4zcn3BVLmfrY/yDb1mJlcMNM2jdZFGg7Kpi0kLawR8s
	azYtHmKv4vIAx4uoBSekUR26x1gcyYyJKmgsX2i/Wtn4Nbtdg+lqkXQYHX/6l00LKL3AHt5YPSU
	ut/5Dc+4b3jjKWhEXq2CKVUJ29dxFPUZ3jUi3u0aNVW/DmaEkQngkvZaJrFAxvFw87DGr+/BtL1
	orFDEafSC4dIgC46XK6nkwAn9eHOIJ1KcEVYvWwvZrYQT
X-Google-Smtp-Source: AGHT+IEFvNOShzKL68uD+NxZ49K1VTzvBYDXSCZdxnB+s1jOD/P17yqwToxMfbv19rJqIh6/MPoAXQ==
X-Received: by 2002:a05:620a:2a07:b0:822:f45b:a5ef with SMTP id af79cd13be357-8310a6416admr415410285a.29.1758143064276;
        Wed, 17 Sep 2025 14:04:24 -0700 (PDT)
Received: from [127.0.0.1] ([51.8.152.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-793543ffae5sm1897226d6.53.2025.09.17.14.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 14:04:23 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Wed, 17 Sep 2025 21:04:21 +0000
Subject: [PATCH v3 1/7] dt-bindings: soc: samsung: exynos-sysreg: Add
 Exynos990 PERIC0/1 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-perics-add-usinodes-v3-1-a3629e4666ef@gmail.com>
References: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
In-Reply-To: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758143062; l=1475;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=XU1ekLOUNIJuvyNVZ49DfP0GKjHnS4C5v3J1EnzRwMc=;
 b=qoi9lCpJ8AkWkqZ81/EvZO508mjaU6R+Gk9C1QakipPbjB8q7Q823odRC/wj3PM0v3lQ7YSMD
 4IM/iE8VhokCRIYYXwA20VgPFybc4sLeVrGugmXaVCYx7xAp7nD6t6s
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_140425_720236_92D39031 
X-CRM114-Status: UNSURE (   9.32  )
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

Add compatible strings for Exynos990 PERIC0 and PERIC1 system register
controllers.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index d8b302f975474a87e4886006cf0b21cf758e4479..173c51b17d9684113bb8254ee0c83e8e74de2fca 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -30,6 +30,8 @@ properties:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos990-peric0-sysreg
+              - samsung,exynos990-peric1-sysreg
               - samsung,exynosautov920-hsi2-sysreg
               - samsung,exynosautov920-peric0-sysreg
               - samsung,exynosautov920-peric1-sysreg
@@ -93,6 +95,8 @@ allOf:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos990-peric0-sysreg
+              - samsung,exynos990-peric1-sysreg
     then:
       required:
         - clocks

-- 
2.50.1


