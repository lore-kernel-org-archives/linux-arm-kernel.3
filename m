Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6486C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 06:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HjH/2kqdCORlSdLYP6r4xpoVlQIwGobZVf64uO8zUM4=; b=Nw2Xbxoz/bP7QLn8ytFvCa+UzS
	ytUfNsJJk8/v/ihz1JFAyFWTNnqc+sIblZgCOEEuLwS7TcmIklbGF6GVcl9hVob6o8tU68JlKrXtW
	VZ9cuypp0NPX45b+DNsM3xl9LxcIotlHFMVqCKQW4eHxQRTcJDkQPdWosqdWn00H5WxeDTKJUV+uO
	DctRaQVZt3zeuKc+FvZq1keH2dS8Qa3M3oyI0wVGM0mqzZzbCNIKbNS3B+o/bkGl1TLgxAN7NuLkX
	lon2cJDjpUjUmQEMZszI4GZkkA3LrYKSUMkf4DaUwWXwKj6mSkuBwXbWdA1jEKxWzENg00AmIiTOy
	guu7OrMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TU1-00000009KXv-13aQ;
	Wed, 23 Apr 2025 06:21:21 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TCP-00000009Hcj-33hy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 06:03:10 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so9195583a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 23:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388188; x=1745992988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjH/2kqdCORlSdLYP6r4xpoVlQIwGobZVf64uO8zUM4=;
        b=fmDgmAfkBcysWhstU6PyA0pO+SjbJ+Dqqt54SMZGYnaaMKWuNkmcuPDSgjvSViZH4i
         ylwU04u8gAj4nJM4Z++8jsT0pqbXmNhI8/XZexMGfE+d9VWf6w41iQC67fbpPiGNJUd9
         gf2KDI1tzTJA9KrDMEZmDE5oV65pIGBwjS294=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388188; x=1745992988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjH/2kqdCORlSdLYP6r4xpoVlQIwGobZVf64uO8zUM4=;
        b=vznS7l/qeoSiNSBViwEkdrYIVLXle/kqfHNiJcYd/BCmJDTg5ImukdHrBzt5iJQlpk
         vLj8W/9Lk+pZENre7w0JtpQT7Q5gCg52udhLfx5iM1Kjog8bJnZOmSpyD/O4T7KrfhU6
         e6JCj9hfKq7y//ORQ3KOzCC3lbkZG4HsqcoiBt9AKjYHRIpkXrBUmEvuzDSD6qgLtKb1
         Gk5MMTJ16dQ7jY4jQVAhWSD0Qfoy+NuNCPHA4/SLnrIzZZopzru+hQyAyOQfeRbOJ5WT
         hmNTy8nFaa9Ub6at58NvNENnI2zP5VnUddfQxnlI5qdu0mKSZhf2nn+0TywYyLUlXNWw
         RzpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVanzr3rMD+36ugMjenZASLGYkoLlwd7DDcMCfsgl1udr4nsXaw/aEcnAxCx3ZCuBjFTBgh4D4+1tlqEeXR6ZVU@lists.infradead.org
X-Gm-Message-State: AOJu0YzE3KPbptVHYSiC6C/L5TwyW7HRxHaLiTjC6aAeX+/qlLJQZoju
	9cX4ldtCDNxeIjTYNOsCOmdwwCvETc08syr0J/f4OyNK+YgLggH8e4TTzL+EeGA=
X-Gm-Gg: ASbGncuKM9ozyaSq6uWlWzh5SmqWsAva8PIdvUzQk7arZcP8e1puoQgHZNqm0NA35F/
	6f0pgqCOkn35HCFC1FvfWfkXMfPajTZjzNxEHUYD89nfXg6DQaBdssKs3QA5MZetms1E4dQOW0u
	6JT6AYZgv5fLwssocZ3cNKw0H0zTPG/YbQMPtIuFjuPwOSU1YvTE9q2b2qLbhICA/q/8LIJlFU7
	dKWKsNGDBJBgJfF8KJqbtXBof4EB9VaT2ijoiMlAhbUpRS/M2TRBNcM28IAK/8S1jgYyFANAHuF
	ARuWGiD1bfGpBAI7iZOhsXO6ozlbmwaJCZDl/iQNI9lcejpLEo93JG1b8FIjt1Dj9CdqODT9Ysa
	sicD3
X-Google-Smtp-Source: AGHT+IELsWvXw7F5FZt767HR+UyBJn9wcMcKkXhJc6P2zEo6Q4Ars/jQw/zuDlIzWD0FzCHnIL24gA==
X-Received: by 2002:a17:907:9708:b0:ac2:9ac:a062 with SMTP id a640c23a62f3a-acb74b38943mr1561283466b.23.1745388187989;
        Tue, 22 Apr 2025 23:03:07 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v11 08/18] arm64: dts: imx8mp: add anatop clocks
Date: Wed, 23 Apr 2025 08:02:25 +0200
Message-ID: <20250423060241.95521-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_230309_765460_15A69FEE 
X-CRM114-Status: UNSURE (   9.45  )
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

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ce6793b2d57e..78d71aacd0a5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -709,6 +709,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


