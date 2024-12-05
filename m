Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61165E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 18:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPhM//wJrXG51ke59zvjjRItTECJ1az2JzHOCc8Yads=; b=4eA4NWYWqBiAcampBvJiEj/Far
	oQy2dwmn+RWKLrNe3JlJCMZC0Gq8w/9uA6GTYUnaU6Ekv4WkyC4VxQRNKWpFAbVOF7TDZDNLPZZJm
	HCK1KtEQVpXzQRkAh8gN1mubz0UsVKI5fD9xZkhI1d+/TBv0ovlx0Oxf78Utb80Zf8a1tYbAL/sjj
	YEs94RhtDbg1k+bkB8NlzkwUBIIac0t/WzFgGUH0LAldhCf7DDH0FIEX5+L1xSHbCO3n2kOJhn49m
	KDFfsTAqLXP9adRXUt3XzX410JkvR6E9zFz5w33HWjhCvu2F2hx0ZDuZicKyzZTqRK1Q7O/N5KkeJ
	k2EqiCqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGEv-0000000H3xw-2Vmy;
	Thu, 05 Dec 2024 18:06:13 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGAx-0000000H2yd-148f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 18:02:08 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-432d86a3085so8635705e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 10:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733421726; x=1734026526; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPhM//wJrXG51ke59zvjjRItTECJ1az2JzHOCc8Yads=;
        b=jVzP94ZmyahYiG+PgjRUi04CvicoNyBZG/XgGTWQPkWtPxaObGnb9eeOJNjGzSs8zC
         LUjmlniKZZkY7Txo4pBcADH4HVeAkolQmFhR9WY9We5FLzsuCkkwYsCmLl7N5pYZHFFJ
         xXTxqKQLZgyxE66KavHlPz96R8pzxdogAK1Dj4B3cqthGaJEI1nmzEO2xonr9XsPrmOS
         sLnpmIPm2udgkK/idqFRbkUNmQmYiBO/v7b940YXuK8tIPVboB+f/haY2figa9QYg9Lh
         sbDPw4N43hRnbKt+LfzlB9fK84sSmrOQrmbu6GF1b1nXhntRuRBJiAYmJUvAXksgot/o
         iqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733421726; x=1734026526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPhM//wJrXG51ke59zvjjRItTECJ1az2JzHOCc8Yads=;
        b=ufydrdABBLxsBClsgF0885ImgBPZo8AzmhjcObumcHKUnkjfclB5HfYtyqGlqMH6hV
         Y+wVZH8WUWEY5IZE3fgNCv8c474gE5OW13GkfmuY1r5Wqi9hqDT86pA2gE+pKA0/D5Kr
         yajJwynoDuLYXZtSoyh1f6SQiw+gzZnoCxPmRV071dKA+nMKUcfcEA64nr9+bP985Udq
         ThTF/gK61xeLk0CLMu6vJnBTwOqXQ3ILglhCk4+/RMQ2BDy9+ZyMoBRwaFiblxxp802V
         tlp6CUFPVYVmSgi2hGToD9Zi19QLo7NXRmn2Xy8U96zRNk/LzTXuzyZ1w0y0IioSCLMk
         10qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNpvybm220yKwgEPActzH8ahdlJRX+3JSvUnpxL/3aFjQwAo/BGchc49iCQM68oGXUa5f7iibuISxxOrnC89j+@lists.infradead.org
X-Gm-Message-State: AOJu0YzmVd4q/9VvvUTsaxWztGK58Am66/vlLtkqlnYzrf+VY86HMYEU
	bDFdIfKQf5TsQ0mPm+mcfB0aO2legcPW9eucADW9JiipvTGz+rCUH/fGNnp/x64=
X-Gm-Gg: ASbGnctOdYp0MjwATXc9QAvPWC6GtxrdV9lHXpmvDVaEooCcXVtuKD3ptQyipZ1/TIt
	6uJwhhK+Uvp6hc+l0urfKvwdEyUpmREBWFXp3xOrOgUfuaZLwpZ1dfNaAgqqX+BtEvNras5rrLK
	HRyIuTX7DC9vH0fGDuDR6pavj+0HHzoJwtuEu6d1PiOy/j5A5jWWcZi+tLTxAuKGqVi5osA0gCx
	oCbYiWPHDU+1IrLcmDxcqOYWDhcx6q4RqXJlzk3/s87p3X8Hr37+5ps44tKq22pvkEhxdiI/k4j
	f2HFcMbwW7ALv33vY4r6LAfUpsiq9DSg
X-Google-Smtp-Source: AGHT+IHxrmKnYhkbCeS29d3k6ksOUL+fr3q/QtXJQ6fFRSknvcyUZjZ0xuVckzybtdhQNCwqXZo+yA==
X-Received: by 2002:a05:600c:4fd6:b0:434:a9a8:ad1d with SMTP id 5b1f17b1804b1-434ddea64a2mr2257205e9.7.1733421725765;
        Thu, 05 Dec 2024 10:02:05 -0800 (PST)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386219098d3sm2618228f8f.70.2024.12.05.10.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 10:02:05 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	peter.griffin@linaro.org,
	javierm@redhat.com,
	tzimmermann@suse.de,
	daniel.lezcano@linaro.org,
	vincent.guittot@linaro.org,
	ulf.hansson@linaro.org,
	arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 3/4] arm64: dts: exynos: gs101: add ACPM protocol node
Date: Thu,  5 Dec 2024 18:01:59 +0000
Message-ID: <20241205180200.203146-4-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241205180200.203146-1-tudor.ambarus@linaro.org>
References: <20241205180200.203146-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_100207_288303_E11FB565 
X-CRM114-Status: UNSURE (   8.95  )
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

Add the ACPM protocol node. ACPM protocol provides interface for all
the client drivers making use of the features offered by the
Active Power Management (APM) module.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 0970f6fc1ef5..ed9815194f65 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -277,6 +277,29 @@ apm_sram: sram@2039000 {
 		ranges = <0x0 0x0 0x2039000 0x40000>;
 	};
 
+	firmware {
+		acpm_ipc: acpm_ipc {
+			compatible = "google,gs101-acpm-ipc";
+			mboxes = <&ap2apm_mailbox 0
+				  &ap2apm_mailbox 1
+				  &ap2apm_mailbox 2
+				  &ap2apm_mailbox 3
+				  &ap2apm_mailbox 4
+				  &ap2apm_mailbox 5
+				  &ap2apm_mailbox 6
+				  &ap2apm_mailbox 7
+				  &ap2apm_mailbox 8
+				  &ap2apm_mailbox 9
+				  &ap2apm_mailbox 10
+				  &ap2apm_mailbox 11
+				  &ap2apm_mailbox 12
+				  &ap2apm_mailbox 13
+				  &ap2apm_mailbox 14>;
+			shmem = <&apm_sram>;
+			initdata-base = <0xa000>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.47.0.338.g60cca15819-goog


