Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34F8CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DybTmKrBLOMD6vf+9QLzWDpmjWc+lV91VxrSnOsEhLY=; b=rDCbOTFn/qT5PnCFyc2XcoW4Si
	EVfMWYzEtmnLS5d02lS7uL8gH9oR2UsAjTnas42kLD4YvaeMPhIq3/iKVAE85Lq4jBEKGKSKvZO+/
	vYTcJ7q/nqGkw7q1HWOS27/oOHStgg57k3AAaZ2Dh63YgGdTJ9o73z9OXVu9Q0j+RKOzuNk+v5YJF
	R2A/Y2hYN1oj8v1hVuOLHRVuFWfbY0zFVVFvfVrSKniEN5qZIcKiseP5ZgUIE8ZpPnai5enIIivua
	7Jsh2Omgczlz0y2oUi8duBel8EPbaUQ95+3krX6kWR8cEa575ZBc0K4bUttqYERU+vLzbjWww01fQ
	QVDR7KLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bf6-00000009dTM-3Dmc;
	Mon, 22 Sep 2025 08:12:40 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bf1-00000009dQC-3n1A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 08:12:37 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3ee155e0c08so2487741f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 01:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758528754; x=1759133554; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DybTmKrBLOMD6vf+9QLzWDpmjWc+lV91VxrSnOsEhLY=;
        b=cdmD9zInDpfgdeZnLLVl0V+PG+4lHa+jIEWK5mmUzwYe143EKCgKSPy+fPfWm8EWC0
         24lA3+wMamYeAH5as5z3bYwQXBnYxQdRtgs7DEqoD+9epXfvkAqt7EmSzoys0SamEaSc
         P47wXPLQqWlGFroOE46awMFkEQwxJe31UNU9c4nAImegouiySVq4GnFwpdK3LtyUnVNK
         SVka5ZXHgWNUEwYBqRpXfU8Mhv99Qh+kDXKjWyOmVxfDUqG/v5/3Tk9dMkFVP9K2Tda8
         0A3wm7TXut4/vtC6NUDVkjp5lDyoImkLi5ffCT3L76pxELfJl2bhNOpZp82EsWQaj8ty
         +fHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758528754; x=1759133554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DybTmKrBLOMD6vf+9QLzWDpmjWc+lV91VxrSnOsEhLY=;
        b=duq10TQc2vOSwZJkT/gl75/rWnB3PDnZF8dP6/Xhkqt9Phg5dTsWkYKITxgBRxLd6g
         99hLdVReGBr8uL+94/IjVhTj8Zi8cTXabe5GYaTYGSjOLnFlIqFYzekV0dio4sX1eXOw
         qZ/6KLBmRRCRMuTwJw3fPPt7xkYYwZiVyWf4dj+Tl639qp1Tkc8SRqlYU8+YAeg6lW/S
         UiSc9vJ7FnKhFwkuiAqr4fySGmPqHlqlu6gi4b0W3uVALHHY1x9YnoJlCIn8IRJJbc3f
         wbXmCa3aYaUijJJcujw+1Zb2biM9UrNRgGmIWIQVfVpOvmClc9aCy0c5t/pmbVFHhf+x
         V35w==
X-Forwarded-Encrypted: i=1; AJvYcCUP8gfzvHF829SJl/h5mZqjbrGeKdZ81jB/UDoU1s2tOEX9Q63f2VX2de9IfcNy8lt350yvE6Bbb/Bpyc2RGIwV@lists.infradead.org
X-Gm-Message-State: AOJu0YxKwhwbNG0dLr7wUZe7kzagEUWtwE4S1D6swuXrw7xczvw26EmN
	72atpkQdOinTxdqKKUfjyY6VXQtp/31ywRBIlxcrB7psbtkYIp+sJdgG
X-Gm-Gg: ASbGncvUqAJz4iqd7EcRwxwoGMeqU0BAPpW6q6Vc+MdKqaQO+gR/Wq/x0ZgbuqXihqd
	ILyeySwXgTgdvjoLfmaOMgBIClej33/spvfhf7gTfpSKPv9T819+yeQlqmwQ6rfmy/w1rIZvMIn
	S3D8xVv/usbvZS53tr3Nwru+Cp+bg/WMSflvIaHLUxLgzPky58YtGKgDrDLwJXSnFgIQB42ty8+
	y7GJvyhwlCQ+TXSKNdt/40pPb0iC6xOYVpqk5kPZiAuxWM7SEdraEQNwRW4I0yrZ9z8/sUkH6OV
	m/oMfmVaKyvr1NlPpejoVgy6mEpw7fS3bUIqMt7h+ybct4Jf5BYuDALz0Xau/14VuTnyEeGfRE0
	E9v5YD4F2IZmKqTFGWKN6cspNBEziPnu7WTl9Ra2eqSlC3jNEvjX7oaAYhArDp0oBmCbnMZjVxw
	2YvtQLMuOrPaWdStgC
X-Google-Smtp-Source: AGHT+IG7fGN4H1P92BRx3rITJwG9FHeCws+SAhbbvZLAva6UiKbmxu9K+H7jexOc/3MevB0fxM8y9A==
X-Received: by 2002:a05:6000:2383:b0:3ee:15b4:8470 with SMTP id ffacd0b85a97d-3ee85e26b27mr11700859f8f.45.1758528753964;
        Mon, 22 Sep 2025 01:12:33 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net. [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee07412111sm18642688f8f.28.2025.09.22.01.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 01:12:33 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Mon, 22 Sep 2025 10:12:20 +0200
Subject: [PATCH v7 3/3] arm64: dts: st: set rcc as an access-controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250922-b4-rcc-upstream-v7-3-2dfc4e018f40@gmail.com>
References: <20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com>
In-Reply-To: <20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_011235_978263_5085BAAC 
X-CRM114-Status: UNSURE (   9.65  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

RCC now implements firewall access ops to check the access to
resources. Allow client nodes to query the RCC with one firewall ID.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 303abf915b8e..fbedf23def52 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1677,6 +1677,7 @@ rcc: clock-controller@44200000 {
 			reg = <0x44200000 0x10000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#access-controller-cells = <1>;
 			clocks = <&scmi_clk CK_SCMI_HSE>,
 				<&scmi_clk CK_SCMI_HSI>,
 				<&scmi_clk CK_SCMI_MSI>,

-- 
2.43.0


