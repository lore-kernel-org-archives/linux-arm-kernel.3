Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF3AE77182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHOVK7hLZe7Wh/344MswWZk1I6BpgHguWKa4xSWa9kM=; b=BUTQsaoRyWSxMgWX07QcCHsnT6
	kRFr6tWzniUSrTwibSuX9YDZYjufwdyR9BWNYzUZv8D80bDqtsDbVWSNjdcvL17qMoCJDyT+7wbYG
	BD6Cy6ua/xfq+u3hJan5IbB2ps/fx3xLavcIZj/6DNloa3hwe5Oca7iqDSdptkTFxRKOgHubcTsmp
	4zreJ8bepyzxUj+bBuJQCfuhRfLMyX/RzV6wLC9K4kJDW0E2akETFbypYMikAARDmMaQ8ul0ROEcZ
	hH5PYL2dh3B0Zi6HlXscJ9TgfKAEIePVxCSizsJ6JhiiCkC9wdT98vck0GAR9BdPZi5700WWaRgnM
	h/HsC46g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmaN-000000015u6-15Eo;
	Thu, 12 Dec 2024 17:02:47 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlcS-00000000rzD-2wU0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 16:00:53 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3862d6d5765so518106f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 08:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734019251; x=1734624051; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHOVK7hLZe7Wh/344MswWZk1I6BpgHguWKa4xSWa9kM=;
        b=lgYrzWI1OlIdzgGyb8RM8FTsAQUhG8mBB5Znd1nBaIjWwsjxaYtvS4kWmt1dLOuTzQ
         NichYV1fwPMF9P/A9r7dfnKaOj9bDGcMX6xZ5Nql902VdwS3WODieUcxmM+QiJpYhmdo
         InQjb092b1eK1UGFLtIHSPswIB1YXhWWG9U67q7wng6vY7TYWEw1QzF9GhwdUBhSQp3I
         evrmcJT9+oLiHwH76YnREyKeO4MHos1//pG2ZPml0fD4h+p2t4DL5Jk+0xKg56nxg4Hh
         9y3uiBOY/xTace9v9TchXzlkFkIzRRCBi9xsSuRMcTOiGK7whUXsv1vLEbIPmUdWV7w6
         dIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734019251; x=1734624051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHOVK7hLZe7Wh/344MswWZk1I6BpgHguWKa4xSWa9kM=;
        b=HAsKPO2Qt/2jt7uVCEUijpClSdpS/Sp/vzim9cvIgUr6sQcNr/xRCyIZsweXdkEpL7
         81jr6PEaGrw47RGME1ghlxmb20657dX18W+ZryP93faqoyNQyhu80ArkOGi3Xr52EEjd
         TRXxxY5Un+vKQLYeRNLcaIUIEVVu52L0uGbS1ZCI5nk5eeBmIl3fp4+KJzwKeCfxzkqQ
         xy7OF8cfsV8eDSrSF8fyAD1frTYfZkRaLhF9k7uynWarK8QUtqwPZw5vDCS7hhUu1uB1
         rBT2lKBsWNzhC1MbbKb95qZno5+V5VYWTPR8Qss2RO7BRhHWkTpl4lYADcLx+1Omx/vU
         QmjQ==
X-Gm-Message-State: AOJu0YyYZKQYwtR8/Oj7QuZL1W/7CZw3nKMran9e7I1XmcSvHIvDkO1k
	egzHnAXrlgrEeXRpHvDi0eIF9G3K0nJz1UMVVLKBoNjKBgKZJuuw8nci3PZ5kIA=
X-Gm-Gg: ASbGncu1vb8DtLEDuMLhVMuM1rrAJg9ia9uQqgwxnhMwuilKo3/hujw1/ScueqhPTLL
	cRLClzAgesBBD95zk/ymxp1UGro9anHJ/PXWpUMLXTdKyQ3YV9f1/13Km28t8lULQiJ1ZonKD4n
	1UXIw/czWOFJuA1eApOoZQEh7PRordMPwJYjpIqGTqR/WT2nAh86YlGmD65tWSbbeI1HuZPeNyQ
	w3FJ98sh4P82j3JDKj0yBsGK5cj55H5qBAo77ZubcjEh9+oFG4H1AL1QT8eLQlrgtq4Aw94WCf0
	P/B1xtj7vl6roiBYmxhTvCGuRgdgA+3Eyw==
X-Google-Smtp-Source: AGHT+IFlK2IZ26AyokS8CKojybaVhLvxESDWWONU+RNmiG7Oe5YQFYwn5cnnv2vcSKdLM5Z3BlTwtQ==
X-Received: by 2002:a05:6000:2ae:b0:386:4a16:dad7 with SMTP id ffacd0b85a97d-3864ce495c9mr7671034f8f.10.1734019250289;
        Thu, 12 Dec 2024 08:00:50 -0800 (PST)
Received: from ta2.c.googlers.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514d35sm4462941f8f.74.2024.12.12.08.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:00:49 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 12 Dec 2024 16:00:40 +0000
Subject: [PATCH v2 3/4] arm64: dts: exynos: gs101: add ACPM protocol node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-b4-acpm-v4-upstream-dts-v2-3-91b7a6f6d0b0@linaro.org>
References: <20241212-b4-acpm-v4-upstream-dts-v2-0-91b7a6f6d0b0@linaro.org>
In-Reply-To: <20241212-b4-acpm-v4-upstream-dts-v2-0-91b7a6f6d0b0@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734019247; l=1371;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=XbnGi70yp2CGKe3dsPZc/woxkOlnLt94ojsF7pP5ut8=;
 b=6Wl14vGUhIl14sU0fLxYuasLnwizMnpBV5iAByDdT3MnW5mXwH8MpxKGJEZzeAVdW7DCLd8pW
 2kFiuaCUJuwCk2Ic62bVSRZuULxkx7xGKuE0/uFY1uEUXnBwY8i7iw5
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_080052_755197_94753597 
X-CRM114-Status: UNSURE (   9.94  )
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
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 04561e15b96c..8c3f07371912 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -277,6 +277,28 @@ apm_sram: sram@2039000 {
 		ranges = <0x0 0x0 0x2039000 0x40000>;
 	};
 
+	firmware {
+		acpm_ipc: power-management {
+			compatible = "google,gs101-acpm-ipc";
+			mboxes = <&ap2apm_mailbox 0 0
+				  &ap2apm_mailbox 0 1
+				  &ap2apm_mailbox 0 2
+				  &ap2apm_mailbox 0 3
+				  &ap2apm_mailbox 0 4
+				  &ap2apm_mailbox 0 5
+				  &ap2apm_mailbox 0 6
+				  &ap2apm_mailbox 0 7
+				  &ap2apm_mailbox 0 8
+				  &ap2apm_mailbox 0 9
+				  &ap2apm_mailbox 0 10
+				  &ap2apm_mailbox 0 11
+				  &ap2apm_mailbox 0 12
+				  &ap2apm_mailbox 0 13
+				  &ap2apm_mailbox 0 14>;
+			shmem = <&apm_sram>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;

-- 
2.47.0.338.g60cca15819-goog


