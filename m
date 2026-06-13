Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D91BCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 09:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAyKAjmkX6PvmXkxrw5YnaLQ/4sPrlWKfDdfdwHLY1Y=; b=za7NUqaf02O1DI2sBE5W01t+B5
	IcSn4kKendi3HOYwFozq1vVXkcdP1KMATUkxZ7gVxogq0m5sB8SFi4ZLjgTLwoC500ebUxAXZFwhn
	Cdfdw1F300uyho7mBGALCMckftv4g/K452r6awB/BN47Asf6krpIInp5AoZYYbfD0ngclbKzE851k
	DYEO8L1YQHjselUO3cMB0lNIgQiw/XKew9RsDbXJLfZb+H83dfuJ0XztPPczb5ltGiOInTQskfUta
	qVvWf+ZtdyGafzaDaDRbER4keX8LJRghe5dyFncK2wYB++Ik6UnBVNRPC90s48kJQG7Woo5pjSS6Y
	+3kgjS5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYKqI-0000000C82D-1PGg;
	Sat, 13 Jun 2026 09:39:54 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYKqF-0000000C80z-2bwB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 09:39:53 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c85d4b4245aso1255094a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 02:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781343591; x=1781948391; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vAyKAjmkX6PvmXkxrw5YnaLQ/4sPrlWKfDdfdwHLY1Y=;
        b=YzdXuEoLHVpvDJnr8GmGAQH18IjSbly8OaGWV+yC/F63gL2oJjNErG536Yd9kZZcEq
         wtUHX+Id0UIZLsZVnrEdslpdlcBOxs7m9K2CsTwOJvsBGWE/YJEXkMhbbHp9BAAbu6RG
         5WFTGSEI+9wzz+z3riN7G8/sDN9KsFCJrMX4aAtUJQ0ZAiPEHZ382BanW5tkM07KsB9L
         sYpfIAgt/ZsqNlu1zZxR/KgL8iy/LDGD4EZPYNhlTBNSUlnfSwIOQWBo1dIt4+rQuxGJ
         9kV3ehG7WOzZ0oD4l8IbSSV20jSBy4JwUqGzokzwIJuU9JWUqYtnF/+FN7B6+aMuIHDI
         s96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781343591; x=1781948391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vAyKAjmkX6PvmXkxrw5YnaLQ/4sPrlWKfDdfdwHLY1Y=;
        b=IAaor+jdXiMcI6Vf+f8mJNU7APUoG8ycUoryODPiRoeHxsgy1jr2EK7VuPSIdaLcaW
         Os5JqCprD6zFIAwhmm9G6314mRNhgcPxDkO86ZzKyEFu/Ni/iGWSa9s3tnFOQ5znUDUp
         UyqCyHgHQzUlmddCIyzZZyND/FwnTAhYromBavg7AhmygDX3kj94YuAUUmN695gbnsIb
         t0oCgunt5cFU9m7ounMXhgR2kEoVPT0zW/6coWiHCDBkwflT/XDFW3cl0KHLsiJfWfhX
         8hLIodxuN0UMCwKY02OrBQ50J0OQLx/gsZTK2xydq4pgl+EjItcGks1rDVHT28FrHft1
         8SSA==
X-Forwarded-Encrypted: i=1; AFNElJ8C0wk6wEEPRBDr+O5aee1A0m+zfcDEL1/T3bKsXwKvOpZmUTo+9Xxp9LhcFPmVwjRmolMK5gEklO4PptLPKl3P@lists.infradead.org
X-Gm-Message-State: AOJu0YyVtd5TJlaGxMqjdpkf7H8N/KpWQdxKyiNEdf6ZnZWFLtJ/7bc6
	ceXQesDzkAb4yrbCln/XX4+WZmkAwRQY0jIuM+RcEfHXSvDaehbO2yWWDUj3Qg==
X-Gm-Gg: Acq92OGx1AUcgACUT6521cMoP8KaNSb9CLioqyJ3cdVJjZvq2gisp4As8LOumTwki/A
	CrqXOTi0QJBvS1gRAIYmFFN+HdIRuR+b8Gwc0VFDJ/xcQ30IrCHXx4nno0I0HkEOJwZM7wVjYW/
	O02xM5S0fuKg6/2gyPqAZtJyKUMRLW7iqwxQmE9n9de7FYf6b6a+/FqOC7piGVlFRdEXsGdl0l3
	dZ9GTgMqDc6/7muk319F9MGhPNSklqacm1KTZkCQ6sgDdMKHPeI02ntkrW7FeQ73roDPIE1LYJx
	TB/PEe+1AJLy62JJd59shY6A7+OaZMr9FD1SqsVk06qo1RCuwMH237NJMlskrKdSmSpRpXk4HbX
	TABl95Ju5ewO20gugQAJV4u7/k1JuTSgl7LCi4vBxTEB9X8oPGRRgQbuUPJD+zKrML74RnXgjFk
	Vb7xAz7Mk8oXWstpnWODhGqEiFbd7zuKRd9+JZBm5H4oHJ
X-Received: by 2002:a05:6a20:4306:b0:3b4:857b:1ec with SMTP id adf61e73a8af0-3b795fc1499mr3511835637.0.1781343591072;
        Sat, 13 Jun 2026 02:39:51 -0700 (PDT)
Received: from Black-Pearl.localdomain ([49.207.61.84])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c8661a67603sm4155826a12.0.2026.06.13.02.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 02:39:50 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sat, 13 Jun 2026 09:39:39 +0000
Subject: [PATCH v4 1/2] arm: dts: st: align node patterns with established
 convention
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-st-mmc-v4-1-b3c385617c16@gmail.com>
References: <20260613-st-mmc-v4-0-b3c385617c16@gmail.com>
In-Reply-To: <20260613-st-mmc-v4-0-b3c385617c16@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_023951_668607_F56617DF 
X-CRM114-Status: GOOD (  11.49  )
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

Update ST MMC DTS node patterns to match established convention.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 arch/arm/boot/dts/st/stih407-family.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/stih407-family.dtsi b/arch/arm/boot/dts/st/stih407-family.dtsi
index 3e6a0542e3ae..08acba209c56 100644
--- a/arch/arm/boot/dts/st/stih407-family.dtsi
+++ b/arch/arm/boot/dts/st/stih407-family.dtsi
@@ -596,7 +596,7 @@ spi@9542000 {
 			status = "disabled";
 		};
 
-		mmc0: sdhci@9060000 {
+		mmc0: mmc@9060000 {
 			compatible = "st,sdhci-stih407", "st,sdhci";
 			status = "disabled";
 			reg = <0x09060000 0x7ff>, <0x9061008 0x20>;
@@ -611,7 +611,7 @@ mmc0: sdhci@9060000 {
 			bus-width = <8>;
 		};
 
-		mmc1: sdhci@9080000 {
+		mmc1: mmc@9080000 {
 			compatible = "st,sdhci-stih407", "st,sdhci";
 			status = "disabled";
 			reg = <0x09080000 0x7ff>;

-- 
2.54.0


