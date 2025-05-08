Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98433C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 14:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CR4PczBsra6kxybGJwNm860UW43RxDUcM5S3Nxc0mBc=; b=B6aWOpyMqt8bk6jtKOtFqRE6d+
	fcfH+jyEHGy6mwyl7R6dlUcAxdOO93YQyuRVKfPRTilIH+uyC7y5pVkdmf0Q/t86dQzW2FTvFWMPQ
	upnRNbJA85vscAV2AqXFqwhILtvtqHPIxRe5pQ8wePbyPTovF5uyxUfgdaS1q7tuH343vTe5yn0GJ
	eu6ni3P1Af77SNpV4eP1yJdxRBqCr4tAbMagvH7Bm6NoashqA1c/mhsNfzxrINduAEnRIjmWFW8kO
	annMrsKmLybQqO5ghuEIZ+JssCjVrG4row7BiWgVAvRQSRV5AwOjlJGz19IYNQocdqiWzo8N4J20J
	EwP5TCYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2eU-000000010ai-3Cqy;
	Thu, 08 May 2025 14:55:10 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1y8-00000000rto-1Rj5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 14:11:25 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-326bd400027so6284411fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 07:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746713482; x=1747318282; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CR4PczBsra6kxybGJwNm860UW43RxDUcM5S3Nxc0mBc=;
        b=ZLBZZKlaA7YiqnteiQlhl3L1tSRcEkGdh11sz+3V65dNzUSJtjG6jy7kiesEhvHQ5Z
         5dkuTTGZOggcTjlqZ6s5X2D7yp2rBEPvyM2mwKOgfJcBmuFC3sVe5c3WEK7uc0gTo2no
         l0YNikg1qfk4fEpOAUeMz2fqVfE1/8tjODvzLRyEC1coxzHo0CBfqvWJ1RRIR1F59S0t
         BCQxXp2+eJA+jiz3rV7xc/A0Hp9ijrR65c3MDWskFcY8kxq0aPXrA9nPHHzoi6YKMzDA
         JghRxiu/IJ2/9ngrDTun3tDWMrNoPY9IUJVLdL6wuWQl+1faGyRM8KFDImiYnLOlbk2F
         p3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746713482; x=1747318282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CR4PczBsra6kxybGJwNm860UW43RxDUcM5S3Nxc0mBc=;
        b=FCifXLAJjnRPrKq4CT8prNFB4M58DTbDJNwAPOlGhjboBws+hiLPYTQcQShOKkV6Rj
         zCIQDNQVerEZZ89TUD1Isy2RTJRz7Fb4CmNbqAHkqaMhvTwNuUJKqcOxjbkRyEqMqTut
         cZRKOhFEKtEXHrYKmBWxktJnUfRsiPWFEjyUzOuzDfWVSgrH95dGABgmBBx9xx8iZV1C
         ftcqNQC49Sf2zpcXNuqdAaPT/neDBBEU00MLzwGrAu8W7UvVyz5oJGt1QDbhq/A+YqC1
         59osoXaYS8FAXR10aU+uiVAMaXrC4OHRuqbP678a1tuLfAKAwRCkJbGTQwbGXaUBiGdX
         sA1g==
X-Forwarded-Encrypted: i=1; AJvYcCW7maX/LvUS4joMp6r5nTL8nfVVMT1Qy9VDm1eBn1YVVePooQAKjVYW8YH0mN258nl9g1YcfooL2op6ZNkRKCXq@lists.infradead.org
X-Gm-Message-State: AOJu0YwTBkRSgthjidOuvNUq4fOOVu8VG4xw4x7AOIhr5qf6l5nG0htt
	dk7gosITfQ6Ta8FoLQUwHA7vq/pc5hHcINKkTH+kjnfLFRl+dTI8c9wdCg==
X-Gm-Gg: ASbGncuMh8nRP/S4iZoBMFY/umRojtB//ZkWmTuwJb40NPLEc650zEySexVKTDkqA7A
	1ph1TKSS7RV1wqxGKyhFCaN6T0y6GMyCOjaU02W5xpNMbea+34+tIGLKiTkv2vbqEn8UNgApuYL
	N7zFcK26908i3s4eliFKEAQ6MjL62wOBxcMp3FZ9kRsq+Qu/8LGj9tPEePJI2bEd+rpNAz8xjuB
	Cj14MTV6d5BkWQeswTB7KxxEOyOgK+QNIzhhEQkdEiJvGZ7c18b+RwWzUgcf5+fLS/24h/gF6lQ
	pSV8D/+V2nX5Fq0HodFk/ywLNpYCm7B0RHQbZ5zJOpp25GTac273sOh7bo2GR+vDvbkCJPZWqe3
	Ve+dd
X-Google-Smtp-Source: AGHT+IF58rFnax5T83l1FWUQdpx2s9mrRUcn2kqC9ShHzeZHEUblgjPJRAbYLkkAyxqQi1SZYioBMw==
X-Received: by 2002:a2e:ab1b:0:b0:30d:6a77:c498 with SMTP id 38308e7fff4ca-326b7570cb4mr16897161fa.4.1746713482148;
        Thu, 08 May 2025 07:11:22 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc91064692sm446390a12.49.2025.05.08.07.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:11:21 -0700 (PDT)
Date: Thu, 8 May 2025 16:11:19 +0200
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ARM: dts: qcom: msm8226-motorola-falcon: add I2C clock
 frequencies
Message-ID: <5a8191e3758e0df78b4213102f25ceadc28cd427.1746711762.git.stano.jakubek@gmail.com>
References: <cover.1746711762.git.stano.jakubek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746711762.git.stano.jakubek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_071124_389889_9CE5C847 
X-CRM114-Status: GOOD (  12.18  )
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

While the currently supported hardware works fine with the default clock
frequencies of 100000 on both I2C2 and I2C3, downstream sources list the
frequencies as 100000 for I2C2 and 400000 for I2C3. Update them as such.

Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
---
 arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts b/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
index c01becca3d56b..e2bf292159fa9 100644
--- a/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
+++ b/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
@@ -106,6 +106,7 @@ reserved@fb00000 {
 };
 
 &blsp1_i2c2 {
+	clock-frequency = <100000>;
 	status = "okay";
 
 	magnetometer@c {
@@ -135,6 +136,7 @@ accelerometer@19 {
 };
 
 &blsp1_i2c3 {
+	clock-frequency = <400000>;
 	status = "okay";
 
 	regulator@3e {
-- 
2.43.0


