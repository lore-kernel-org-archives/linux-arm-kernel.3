Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88CFCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 10:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4EVdxV8Se2LiyuEjyoag3giBCPKNVKgEYji5bgopuUQ=; b=QFNm5H0TwvoEW/wUmxIRxsqt4n
	fTKhsmX3lifWhKei5CzUERr3tyj6gSYQA4nB5FmB1ws2r9N/TFkqasZzp4ULyrYlD1IzL9HiPnVCc
	X23Sn/JxgrIH8eLnfXpMZ4csIXFHLuGObTNjiyoZwq4S4jbm0uO6AajZKbypJGbdLEaz8xlhzvQdS
	Ql4ywD/uHLEunL31RXdtbG8TC97PdNHwHDdsnLSjuidZmQThkpWHcJsUMXm4Rb4qGkUKBC2nWL2D/
	BKlfqhQXzeKG0s4v+Qs0B21XzVtfLKo9KTM/DYsQUgHuLsfla9xS5EKb57k324mjimr5ppf5OYjwa
	SnpSH3ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMO75-0000000D8ut-1hRH;
	Mon, 11 May 2026 10:43:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMO73-0000000D8tN-2x5z
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 10:43:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4EVdxV8Se2LiyuEjyoag3giBCPKNVKgEYji5bgopuUQ=; b=RWrpbenTJcEPVfpXmz4RShZf/k
	/OeV3awtsHvpiyXhuXG4zBWwM1N/wtUvYmdx0oYZ1cF7r+CVYfHqybDWEjJWefFQUFfCbNGv6N5Cu
	0XitSg0sza1V0XOTFIBEV4WyhlYq3AOsW4NwHfN+0rchUcqt9QSipGaHHnpzVAhrrZxWLcoHPtZTh
	oi8Ljqn4hsc5JAEPzKy9J0QryVAYiMoqeASuQTSDvwKje20gusose2ah/siv5+2i5FLF1MlKPql1o
	j1jV9HLUdDGvT60EBvvVw5/4aZAkQ84Md1OvwiSebE9t1TUO9M2/Nc4yHserr/vQzohT+YRv7SxpR
	Z4UBUTqw==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMO70-000000080q1-3e4L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 10:43:48 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-362e30526f8so1956162a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 03:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496224; x=1779101024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EVdxV8Se2LiyuEjyoag3giBCPKNVKgEYji5bgopuUQ=;
        b=me88JnVGDmFE0WdJrDW88F95cIX9GsYpE+526padhkEtsrtwcbelGzqATfArhsYWFb
         KHW8xXuF26Pb96qPvMGLFqOhAJSprcCTsSLj9X14wJLesfbj8Cwzbk1WD5grCCIw+T1a
         VcDZsV/iWe1pD1TnXdMtpshkNoCuAwLnqU7YjVUITfejc5j8vSAJHokKHZ+eWS+WRCQ8
         2FTCt+oiRnUepFlh5nyk9a4b0OF/Gyx3h6r0jHXro1TE+n3h7Ybrwv+NQ7QGgFu3v8XQ
         RhAUv29KqNK7QHtw2rYezNshfiv93r/tw9tAFbrtvrIKKoyvpcwfquc/3SJpDCe3eBhy
         Brxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496224; x=1779101024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4EVdxV8Se2LiyuEjyoag3giBCPKNVKgEYji5bgopuUQ=;
        b=B8elW+NaAeKJ+RCRfPNN2e2srzE6R02VPGtuDOSPxcSt+swKH5WQ6X3nDeTWorxKNA
         tCSEyZAzrQsJ/0ut/y1JN+VarMn024WZhswnfvz37c48Ecs/M/HTv3jfeEVpwx7damf+
         zCxzd5fjzRfuc32pBwf1vrEpA7rhoW4qa7rVdWGiY0fOQ6s+OwtGU9Eo2Io5+n5kUGrO
         WBUnsl8+55ZqPE5o+cLV2ATG8Pe3g1wLsOC4f8HFS1dUeMnGDI01HmrRtCa7Y4a6EIK4
         7Q3bhBm8iWEWNMcdqEv09DZU5sF1NbbTwS9RxclW3q+j6VlhVR/2RfNt42+NRfMP0ZFk
         g72w==
X-Forwarded-Encrypted: i=1; AFNElJ/XmkAsq5lwZHfyWUsokK8QlZqstT3vpSxFk593M/INKh63YAjpED4EbNYa4fNEZNBGxiehnq3k3JoS0RnfPpUU@lists.infradead.org
X-Gm-Message-State: AOJu0YwofDHRXu17kKIy80eZtwTB0RyiSH+E7d+UvefBB1qnQ44kEmym
	XUen/A/ZHsVCShul39rZSNc3PUpfseZs2e1CyFeS3Kr0ArUBBLT9+Prg
X-Gm-Gg: Acq92OGeZ585SNQ3hWl4avHglmfruAMYuTtLu42MGCMW8CDI8c2Fc6RihgDLnLHSPD/
	NkpdtezSXt+NFMG7NqpWZhKb9F9EGggbmHSxUYsdIBK5kx0WsZlkTt06H1bIFFDEYTwol7vNdMf
	Q+0nWDMgkqYZuXBRscoDsXzqYcL8xv88V6D0bu1tfVstbMrfbwyhgMVTM7/0Jc8dHi1hfnJvKU4
	uTr9URLXXKYx/gnK64gkCjJFbifH0v0TqReHtFkQdEpSOUw5L8Bm9AKZRn9/6x5oYG3h/+QimOn
	VwJkGa9Qw90s/nseFJZRWXumlSLlH4iEzgv8dSUlDx/3UNCHfktFc+2Lj6jkLZy67eexOCKTEvZ
	xDurr5Fa2QUNGQJryGMZW7EE2+MrW+DLTM54cCt2ZpyS/NE29ft97tp+6lHj+7bpeghFeif48VE
	lrIBkSH45upGnyKKjoOXg5KyF90dTP9pLY8uwBHgY=
X-Received: by 2002:a17:90b:57e5:b0:367:b9ed:665f with SMTP id 98e67ed59e1d1-367b9ed8035mr11528030a91.13.1778496224312;
        Mon, 11 May 2026 03:43:44 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d684009esm7533423a91.11.2026.05.11.03.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:43:43 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v4 5/5] arm64: dts: imx8mq-librem5: Correct link frequency list
Date: Mon, 11 May 2026 18:39:27 +0800
Message-ID: <20260511103927.279550-6-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511103927.279550-1-mitltlatltl@gmail.com>
References: <20260511103927.279550-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_114346_975327_AA40076A 
X-CRM114-Status: GOOD (  11.08  )
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

According to the hi846 datasheet and the register lists, they are

mclk / prediv * multiplier / post_div1 / post_div2 =
25Mhz / 3 * 90 / 1 / {1,2} = 187.5Mhz, 375Mhz

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index f5d529c5baf3..cc5604172192 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1122,7 +1122,7 @@ port {
 			camera1_ep: endpoint {
 				data-lanes = <1 2>;
 				link-frequencies = /bits/ 64
-					<80000000 200000000 300000000>;
+					<187500000 375000000>;
 				remote-endpoint = <&mipi1_sensor_ep>;
 			};
 		};
-- 
2.54.0


