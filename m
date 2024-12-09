Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36701E77181
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YALQ/5d5xwJu+LceFpjWJMU1LIe6WE2pCNsHkacRTcI=; b=LdV5Vn2mrTdyEj+g5olFME9Bbd
	4XFndV6dwrco8VxpztnMQJ/VwLbwoakTlacXlVDIjciIDciz5ikD8NXLL0MPuFv/qQkgH5YvU4Y5r
	rdVBJxf/U0F6oNYkSt0mv0FuZ460etaSuoZaM4TxixULauyjWvibPHh1RdPQh6s1M+/sPIm8wv9Lu
	GHD6BBSXN3Sog4pV06CT+yxc+v2o7rVRb38IQcTt4+wV36v6ExkaU5teF9rendv+wxR3Xqu8GrCe6
	KQ2rr3QUsq3wS246eCPfP7yXLSi3LrKWhGpvj2dY5EkZOlnPn4GX1qmEYQ+c8KBbmjH1l/1vAISIN
	uBYrCmRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdVJ-00000007sfY-1Xfr;
	Mon, 09 Dec 2024 13:08:49 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdBf-00000007mdK-2V6d;
	Mon, 09 Dec 2024 12:48:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YALQ/5d5xwJu+LceFpjWJMU1LIe6WE2pCNsHkacRTcI=; b=B2ScI27/o23d0xltBjPie1Ue+t
	5XtAHemGGtwCU4r6Kw0aUPIQD/3gXCT7f1etTJxip3qhzWcqwfw4JXmXyLata74X+iJwHGqLwKa35
	Nsd1CRZa4iw5OSl1D/JJ2ykK/4Lhc6MWwuc3LANeJWXxROWIri8EAGM0W5W6wQBQ3EvnsHzYSD1mt
	0joyVgYhvrm/vdVBRbOVXBRMMOhfFEqjbGpFySbSEGgtfYppDM1xZwd4TSHOu8y61wQNkR15i7U5m
	H7+bIm3oEyj2kB3K5ikDYec5gCiDvo1hNBIHz4HbHxHJ2D2OX0emZVllTYnSxCB05IAnB9+Rf6M4W
	k43Bx9+g==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tKdBK-00088z-7p; Mon, 09 Dec 2024 13:48:10 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 Shijie Qin <shijie.qin@nxp.com>, Michael Tretter <m.tretter@pengutronix.de>,
 Emil Velikov <emil.velikov@collabora.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [RESEND PATCH] media: dt-bindings: trivial white-space and example
 cleanup
Date: Mon, 09 Dec 2024 13:48:08 +0100
Message-ID: <9635159.2WqB4rESCP@diego>
In-Reply-To: <20241209113405.74226-1-krzysztof.kozlowski@linaro.org>
References: <20241209113405.74226-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_044831_629050_B99F3536 
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

Am Montag, 9. Dezember 2024, 12:34:05 CET schrieb Krzysztof Kozlowski:
> Minor cleanups without funcitonal impact:
>  - There should not be an empty blank line after SPDX tag,
>  - Convention is to indent DTS examples in coding style with 2- or
>    4-space indentation (4 is preferred),
>  - Drop unused labels in DTS examples.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

(even looked at the whole patch and not only the Rockchip parts :-) )



