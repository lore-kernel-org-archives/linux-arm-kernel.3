Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707AFE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oL8eR/tz3ZIpCfja0LO2ssPcqKhJCh2en92mW/OWpZE=; b=RqEMqot8CiwQ4vuZWui0kZHt9f
	tuJ57Wc74qbjFRbphyEYUg2gZ74J3BOXxB/vGqQ3pWjSZDlzrHvNoAsfseOW5lEd9BGPld2FgOSYd
	stXIDfeKqdYctV+7rds32aUtpQw9eNqsf6XTsharTwhXIblQwzZ1zddoyIyEEBsL6StBpFPYvooiP
	PyCExx/3XbC5f2B+TzXOG308uUpF0Aqq7/fYvUXxdHNPf5OMdaCumjEYOI9CGMTwEMjn0TbjB7aS9
	1dMgh7OZaTnXxrqYmt220aPGacVdThgE2K4W00aRINATcOuwY4ZVyPYwsbxcU4ltRWzoMdTyBAHkt
	TlvE0QIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmbQ-0000000166T-3irN;
	Thu, 12 Dec 2024 17:03:52 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlcS-00000000rza-40Oh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 16:00:54 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-385df53e559so642306f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 08:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734019251; x=1734624051; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oL8eR/tz3ZIpCfja0LO2ssPcqKhJCh2en92mW/OWpZE=;
        b=zKKuqSERCvW2bdHBEa96U0fklXzUDGaCG6dlquCIUdEIcxa/s/iFOULk9IhEH5M8UX
         iunqUUGInefU6iRZfan0knxmsclxXZT7IIsNqOKFF/vTQyC1o4fWlyk8Fu3cJ8LvxMq0
         nJ53+J0+YzZerxKsnx4LVMKahGwdgRgiYRn8P54juWv6z3m+nzEcs8BwDya2xm5WlNPW
         c43J9BY1qST8JmjnT5GNoI6oF0qb9WijPx29zwv58anLIYRCcIAPZUy/VRAWrcAs/JJx
         0303/xHMBBbKITS0Oq1Mpt9FlOcNpK0VfbPRR+odX9NniyNe39Ei4wDfvI9OsEQjArip
         IpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734019251; x=1734624051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oL8eR/tz3ZIpCfja0LO2ssPcqKhJCh2en92mW/OWpZE=;
        b=gWHzGvS+GHscFi+Gf7c3RbruTG05EGkOV54Krp8P+IxDwPx9W7FnOoDbJ3beHsOp0Q
         egaURHgK3gFY2Lm/55uwKeA4ejS6c5YX8iKeQAnLH5iNv3tiDVqMNlfVjeNUd7DcQGaM
         1lCFy1zDpkOMCkEWrek8hYTb9weBJkiQAt9TzxNF2Dh4NXiHcqoC5mH9EZyej2liYj7I
         9Q7Fo7bFj8Mj9JCPvXnVGsZ7+mirpf2LI8EJEYFx47ykGYki2XseBFCYnscu5HX+gi2w
         9W6RHwF0/kMLpmWh9SuIrj+/6XNnWbjax+Rkrqzfni0WFyES/MlH36hd3RIf9VErlsDn
         Jckg==
X-Gm-Message-State: AOJu0Yx2Ez9fc7A06eXos/AWV8Y4aPUIUCjsrZPn6cwVFDko0ssWWdTr
	R3a9p7RkPRPbelyN7JjJQcvcv32wJdET1sNgheHwbzKgJsKmnIudlINAd4dC4ys=
X-Gm-Gg: ASbGncsdyMxlgMwMJ+45ajfOKN0PxxG2oYXojTL07FE5xO2g6v8SiHUhIQJdAGnLq+3
	bLNmTazv6RKCNyEI1lGsKo8lDaBZNuTuH00TT7iXLK/4eZv9krQJkQ80qAQlt+SabiPrBOmnJ/v
	ErT4Znq5e7TTx7fAa18ilkzI4WuGMG628HEQAmD1kLiEjYOEb2igOFTGSiwOTTTJvV7QdGeqFuQ
	Md0hwOKBRMr+/6ETxgKu4kN7fdKanA6F5aTKQiHCiO2q1ZeSaBcgike7Vr65HRcaC5615LsRrz5
	GBnjJHXi+uhUCAm8HPQvNkXIddnDSCP4aw==
X-Google-Smtp-Source: AGHT+IELIxGohPpZyWs+kDS3Jy7c+lDT9602oSXSeH7EbGUTFSeHBff+tDxvNYOauQEuqumTsB12pg==
X-Received: by 2002:a05:6000:186b:b0:386:4a24:1916 with SMTP id ffacd0b85a97d-387877c2690mr3555724f8f.55.1734019248941;
        Thu, 12 Dec 2024 08:00:48 -0800 (PST)
Received: from ta2.c.googlers.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514d35sm4462941f8f.74.2024.12.12.08.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:00:48 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 12 Dec 2024 16:00:38 +0000
Subject: [PATCH v2 1/4] arm64: dts: exynos: gs101: add SRAM node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-b4-acpm-v4-upstream-dts-v2-1-91b7a6f6d0b0@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734019247; l=979;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=g9Y6c/Lu4XdnwvVgrnVv9tKSFGDPtKMBC9QqU0RCKUw=;
 b=pe7nkbrj20qSYnrPkOzt+GqPA7lDUyR+IOiNPFAd4WlYXzbH8ZVMKRBtJ2AJ6BEWj54kNiXY8
 XhWrSTkps7uBOgZLxbruYT2X/DmIRHZ7qF4C+mnzBjagKE9cPO7q4Im
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_080052_997618_3AC30AC6 
X-CRM114-Status: GOOD (  10.00  )
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

SRAM is used by the ACPM protocol to retrieve the ACPM channels
information, which includes the TX/RX rings among other channel
configuration data. Add the SRAM node.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 302c5beb224a..1441e9a252c2 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -269,6 +269,14 @@ bldr_log_hist_reserved: bldr-log-hist-reserved@fd900000 {
 		};
 	};
 
+	apm_sram: sram@2039000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0x2039000 0x40000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x2039000 0x40000>;
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;

-- 
2.47.0.338.g60cca15819-goog


