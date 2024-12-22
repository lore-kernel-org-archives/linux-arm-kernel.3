Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B791AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=; b=MZ6g1+SOyL3IEOu0cUTVb9bmqK
	lY5H29Am/VYgIs1VNBzsnRTHQg3YqQ350CyxSbEArR656q/xB5TqgZ63/RfBQdLNi81fMx1uGroZr
	w/H8ky1Q1aWCs08jd7mHz0Lt/CVJMxriUsgIbu9dL4DXlW6reGUZXgPvomLSWy/DPQZuJHAwL5AE+
	3qf9ElfIqaxg/ojDGgwzPpIZDM7UeJoZNO5gUSNP/0YySQcQ0dDOa/UlG4PaD5m2FOq2tfmPiQJWE
	2Jmse3E90sonslVxlLbQmw62eH9OgOuqT4ZwJhhrNnOdhgmvPm9l1XH+tyNlJeREQrLp/xSwKbDfI
	oOiIze0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPWh-00000008ZDO-2jiU;
	Sun, 22 Dec 2024 17:13:59 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPOo-00000008Xpt-28za
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:05:51 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-aa68b513abcso688784166b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887149; x=1735491949; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=UbxM6+WyEc5UpgIjgtnaDJEGHE84FV3BvS5Hwg9umRCbGeq5hfKUVrepQXu/G/Ar0K
         JYpTYjZgIclHCPK1IKeT9yu2GwobLhCenevC1+cE6euy6FOkkt5yZF1fqExBLFinXDYW
         0WofLxrB5PU4OEXlZUkxL9NwbFyyUvL/F7j4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887149; x=1735491949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=ePiiumWTR2ARgOSIEqMcu/T+Q3nXuW4JQlRv6ouuWgmNusrO3jh7pKT0MFSJ/+Qm+O
         9hv+SAX5ObWW7qfsLsTPjYJpqNIzUEcjBNq/QORtf13WBN00ThdJmAcz6F6Qpt1wCqFp
         ZzZAQrID3oBJpRUlUbC7gqkkmPP4OtJqpbO8gx9DMzaS5jylaLM/Ry7Rv1QiKXK38k5b
         PRXcIXfxAVT9li0kAJDriGxZ0jSEEwjJn+O8GF3Kn+U6mkQ3JrtNFUvD9zQnPTk66Yki
         KqWG8a5GO711uIOnwT9rri9IkD9pRw5wr2ZR3C1Ubn7GG5uCEjTk1/Iobmgotl6PSDDV
         4yGg==
X-Forwarded-Encrypted: i=1; AJvYcCUPRsNxAjSzwQo5lgAz8vehxwKFZFowerj7z2OKoCoPdNPced2iNtPSOiri5+mbwqNJQEJ3qBDt4WA/q6r+NK6i@lists.infradead.org
X-Gm-Message-State: AOJu0Yym3ZFCvYZm7suknOsTbNXOKIb6wpHxxZfCmY2XzdN4AwzD63E0
	LOoICsn2+DNO/NOidadb+/6+6MSyyr1RUyxiQfBKyqYPkniESI806sPeEl3SGQQ=
X-Gm-Gg: ASbGncvUVy2ggTO90WbCN9dWn4DHmcWw//AWknLPOEpaNOeDpmiEyRRmcAbeWbkIjy/
	4iNhYt+lZBEOBxKDXPUGmQSXDHPYZ+8xwP8CWkxQkyqJt+XBAKzjWkxmzwXahOjLgll6sB8k7nv
	sLBOX9zQkL21mlJE+LqfFmicx+Y8q7HrFypC3ClEhDa7kAlkWQYp+n4l2/HRO9tkHMHgdHtA0UX
	HaZ/miQrBfkAAG8DszItyK4wKBaERz7D86Px5K9VMckpzyXaZNlHYl+wTf4WRDdp1qd68vu31fz
	ssPbUbbte8kdAilbL6kVL9O8bEfigOD6wf49hhuRMRwmmg==
X-Google-Smtp-Source: AGHT+IGSlHwq4B58SjzQGkgABUjEiVbfFXilvkHQNYopTfPmITsuLQgwRjnV1F5sR2WhlM27g0eCtw==
X-Received: by 2002:a17:907:2da1:b0:aa6:730c:acf with SMTP id a640c23a62f3a-aac2adc603fmr930499466b.13.1734887149146;
        Sun, 22 Dec 2024 09:05:49 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:05:48 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 06/18] arm64: dts: imx8mm: add anatop clocks
Date: Sun, 22 Dec 2024 18:04:21 +0100
Message-ID: <20241222170534.3621453-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_090550_620248_04BD8DBA 
X-CRM114-Status: UNSURE (   9.64  )
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

Add the bindings definitions for the anatop node. The patch is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 4de3bf22902b..597041a05073 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -600,6 +600,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


