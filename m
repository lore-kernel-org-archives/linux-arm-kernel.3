Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1753DD49780
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 17:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYgi3gWsFZ6bxt2QyzESPfQwAyIPmeSWspE8fxXg91M=; b=HplYhFZRWo1Drb7JmYjSVeCAGv
	1YQ2eAEupEwERqgg+vKoL1vz3MLh2ZDCHgbySJULstkacL/kSsRFTu4Y04Wp02lVap3VdNNrrUWam
	Q6EcnT2a7R117BDGmtuwsh7GT+W87TcX9BA96YwHjpPCTf9TyVW3WDHZ01VvbRIVBpRN3KExuNfvJ
	9oFso6jvgFGoxm8heQpGwiEREvOFxQTb9S3nTk+IA9C6x5RZF8UPHUFlfBS2ppVwAmXt0P5VVCCiA
	iKUyyAMgv4pWNYRFyOypIe58hyOXGzUPfyEaalr07e0DjuDIq8YK3NqHhSP7s017ajxnlTMQZxqkL
	qdune0Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHo9C-000000049s5-3QrC;
	Sun, 01 Dec 2024 17:54:18 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHo2c-000000048TH-1bRy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 17:47:31 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso464536066b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 09:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075249; x=1733680049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYgi3gWsFZ6bxt2QyzESPfQwAyIPmeSWspE8fxXg91M=;
        b=KId+MDhsxsfluyAyVVe6t6sgb+g1joxIrQJS5RejW+pBYzPCjTsGhKfjY6nzZ835PG
         YmprEON+FMVFoSEbuoQzUfSwkvxYjMFoycSMatWB4dKGVT7GtRBqqD8IhktYVZH/htet
         zCSdQzdRxouL3uYk1H4DTmvzG0hpU9lSmN0Ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075249; x=1733680049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYgi3gWsFZ6bxt2QyzESPfQwAyIPmeSWspE8fxXg91M=;
        b=n2fbYLb1/6Lpdi6KMxuo3YSNhSG4xlx/0oG4c447ucos20E/Yqu8JlF8noNgUxOZ6x
         TW/5yRcdq3pCc0JZ9rFBQAzxrH8LDV9jKjLCy6J9hpyH//MHgjDH54wkIKLwLzIh8GmH
         l5KuvuvDFPXVG7JhlwKsKfpG08gDK6Jduuv3Nq6dtXNEcdgZoJPIjpFEk6LJvbOaBe6p
         I0PJmsw3qL6aUdyitYA7vOx6AisXNio/lzOFjAHBBNUc4Ax613mq2yfagwTkg291W4MN
         YkmOoOYIUBisOynCnveCrKsXqBPKuq+MIp7mDscXOUo+Fycn+tDsXgHVx4s5X/NGOiu6
         oOHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXRvN4faC9qmJLTl8jDA5KE/51LsZ7AHsBXI3167zKbFf+/D+xDYt7IVwFQ474EEbLYUskyrlHB5EOLSoJH6Jf@lists.infradead.org
X-Gm-Message-State: AOJu0YzK4Xm+GSrNv4yPOyEJYeJ5SAR5NNWv9mf79xwfTUIf6SmJ4h5P
	ETGrEGNlv5yk+bW5fUafhuRdp8tEXZF0feZpgmfGCDFzRidTUn7lNoNMpiOMQH8=
X-Gm-Gg: ASbGncsvTNj8QSBj9BI1zFa4nSsUtc3chWw+C0l8A6aK+4X54mB1CA1+o+4Rp5Feje3
	hUEs0ufyrF19FPJEwmv9dfqwck321jMic4kPQD31e/n+h9/8ZoQGp/JKrApPyq1DnvRCCXI+b0j
	JqginHjdnqIX+wWEURNcvoc+KQQdmfy5Mnd5T+t/2tLmG5CMqiyC3blhjFBG/ud3mVhW1cvmvme
	wR9JmQBjgeLE0OIzgfbCXIX73jjkoJ5dPBgeGRmjbdBJH1z6kQGtSgoVXjlEO5gSrly/yiTbjGh
	iIoBs3bMpSWIRvPkTRzOnbAlc+9TaBPZzsVPT7AAQqYc9UgzmnNXcxA9MzYjXrmQCHpnqmqZEJ4
	ygN4rrCUwt6JgVfvv
X-Google-Smtp-Source: AGHT+IFEnqfNEU+rcacBAMtddOncowvVosTxbTcww82LB9zIQkVF6gwcSPLsVyk8WzQcN3keRGes3Q==
X-Received: by 2002:a17:906:2932:b0:aa5:396a:c9e8 with SMTP id a640c23a62f3a-aa580f27899mr1226207466b.23.1733075248682;
        Sun, 01 Dec 2024 09:47:28 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:28 -0800 (PST)
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
Subject: [PATCH v4 06/18] arm64: dts: imx8mp: add anatop clocks
Date: Sun,  1 Dec 2024 18:46:06 +0100
Message-ID: <20241201174639.742000-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_094730_428077_EED2EC41 
X-CRM114-Status: UNSURE (   8.91  )
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

 - Added in v4

---

(no changes since v1)

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e0d3b8cba221..0b928e173f29 100644
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


