Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F515CCF9EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kb+oCJFy28PNmi6e8yrO96eaDIYbCEFfqpsOTMY4zgQ=; b=KowVi33P0Vl7IHSO/hSdPT53Hn
	8l8T4M/u7u8gi9qcOcMVtc3hwX7GLmOW+WawpxsIf4zUAFH7AVA8K7bFXljCnDHfmZCPFpqRqc39g
	4RGXWk1uMwQLbUa34KGkWUdKyJo58jjbDs2o9SA0vE1g6LrvyOrYp6C94uinSfEWRJ+hXtU6wInb/
	Crs7noAbB6jTT25Jr2auorqXXLZQBP0W5HIl+2KClCUL8aWw1HreYuSgSpq+9DnxUsfFEcFT7sOt5
	ziH3BIu6eplj9CkqJPgHLo38X7Es9hO75LiXZvX0bf+/oJG9hfUS6Njr98+fDX55hbHL3kTZW4eOo
	hz25fqIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJab-0000000DXwN-1b87;
	Mon, 27 Oct 2025 09:32:33 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJaX-0000000DXtN-2exf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 09:32:30 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so832770466b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 02:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761557548; x=1762162348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kb+oCJFy28PNmi6e8yrO96eaDIYbCEFfqpsOTMY4zgQ=;
        b=Q+72OkvTQj4YtqNc+ElO1Sw6ZmIBJ3c+OIxUX7JQm9QmmnP7ysifz/onV4Gf+Hjux6
         WM+SHd9lxXiwzIYQUX3n1QUbH3y9+U3/W1enyKGDJBFlNRbXQzzZnGT3Uqhr+DPR4d2s
         SVNy/R5HrE0p1mHeDkzGWluM1jP9rGuV8UUMzdbs8SXCztHNGU2eBmuP9ev8jch3ydLp
         ILE/k/nm6eygpQR2n/USr1KkjKYrUtlne/I85Jd6EjLfCmVwWtzSKftdzLbEI4r1mWDQ
         zz+q3x81fwZvsMfMcvnYlzIzGyrE//4QqX1Qc4JOw7CNgQ63rmdQx39Y3aY7t9+bMepX
         Q0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761557548; x=1762162348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kb+oCJFy28PNmi6e8yrO96eaDIYbCEFfqpsOTMY4zgQ=;
        b=BKfXBBYCNo+XjFCL952q8j1pY2k+pKXfVo+PaxY7Xnss4gsSiGQboYFwxgj6XmFJZ5
         9TErvpKKSIpX1eXu2gm5AAVheEcC8ilPVf4zOYNK0qaIVP0UeLReKN8yjFzpCjxoPhUA
         Eai8In+ZrN+30a4FFT4JWBhmZgbA2RzpilVkfdnWuZ0nMyTRMXCBLgfk83GamAIvKXMt
         FwZL+rePHBi6wf7fw+i2HJhlll1DSsYAXHqdFhkIzh1ccaTPcsT70k3ABFuJ2OSmIXm5
         /agELSXx9Y9VfrxGjfOFgbBU0zOFwlOYnScfdWYwdrrHDSo+y+ETpDAix3YyLNxt8DRp
         qYZw==
X-Forwarded-Encrypted: i=1; AJvYcCX0yiPF1dKD+4DuicVrLVBiZ/PIidbcNZ22cMaoQpobxPouZob0YmxsNkdVsf02NsjNljBlpO4hJoFiq0wxCaRI@lists.infradead.org
X-Gm-Message-State: AOJu0YwNGlRrUlfyXOzDrnFZ0HuN5uhl6ZCtFM/ZAfiYxN1DOgaDozuW
	xWz9G7khQC0FPEeGfDBL9GYKr57sAtvWrHuHB3UubTuMtNJEaX1wDc0J
X-Gm-Gg: ASbGncv3fwerRKNG76LDA4Iix+4ieUq2nnXKOnQsp7HMe9Kk/lusdln0YBjlubJGxBM
	5tI15QfiUBPItV+IAZs7yTaZiIwJxaKOr6I+ZUQDHwnLhVFUPQnp4RlX3xT0LhRlnjbR63H1Q0M
	UNEg9rG19/ulApdkCv88V3fzT3RcDRpX9c8oFtqlv6c+sECjG2LGpMtCGC8uC7rV9z7trRpWTyX
	7nqn1GZ6M43c5GmYs4qfwrgdD9XAJYRJZzjT4eiFK9hQHLCaGCnHZkd1pcyEEg7m5X4+qhe0q+K
	LNXe7Zi3UrUH7OhV83tkUxoq3ntAueQ7kiHffW5UiPAZ1yVzIehbKcC6OIqe6y7sIxbHFXgWMRn
	JYaWwKDjXrDKQfreFsWmn6a28aexnX3irKRpBT61xiO+7f00R4916TJv9DaR0eH/WfF6M9jqQWN
	TC6wfRZkgbBLF9UtMq5lDemHid98TJbL5zxwZq1WSpzvRoQoDky0SDzyHYXQsVKmxSB0hXKixpC
	mIYBLAm/mUbKI1Q
X-Google-Smtp-Source: AGHT+IHTgGv4G/+wFJOtkWMD7ZAhCWVQTDxphKQmll9bPxy5C1Umq1JWKsBdZD1UJY74GedfpKzDzw==
X-Received: by 2002:a17:907:da1:b0:b6d:5e64:c36b with SMTP id a640c23a62f3a-b6d6fe9fac7mr988112866b.29.1761557547697;
        Mon, 27 Oct 2025 02:32:27 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef6be28sm5681014a12.2.2025.10.27.02.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 02:32:27 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/5] arm64: dts: imx8-apalis: rename wifi regulator
Date: Mon, 27 Oct 2025 10:30:10 +0100
Message-ID: <20251027093133.2344267-5-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20251027093133.2344267-1-max.oss.09@gmail.com>
References: <20251027093133.2344267-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_023229_690100_E27BD939 
X-CRM114-Status: GOOD (  13.16  )
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

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Rename the wifi regulator to what is the net name in the schematic.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---

 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index abf6d543380c..4234289d4012 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -77,7 +77,7 @@ reg_module_wifi: regulator-module-wifi {
 		gpio = <&lsio_gpio1 28 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
-		regulator-name = "wifi_pwrdn_fake_regulator";
+		regulator-name = "Wi-Fi_POWER_DOWN"; /* Wi-Fi module PDn */
 		regulator-settling-time-us = <100>;
 	};
 
-- 
2.42.0


