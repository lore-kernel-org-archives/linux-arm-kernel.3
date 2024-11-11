Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88380D3ABF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 21:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Date:References:In-Reply-To:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aJ7+7tAZ00QWBqGIx3TLXHhs8RBVJf18eC8WQggc1I=; b=IwifRYLYpq0tqjgLna89Ggt/jy
	GZk81zb4+THb41BO1EFBcKnQ67kxI9C+OGwTjAUHqRImKhmYLTcKHSrjkbcLEg95OGjTIHSs6mts0
	yl2FbUidjR7EeNy9Y/ZsTm4RlWFb18H8ezE1DRFj4eHaO/mWQV34ejhbJlBO/t+Ir2J1lg9OW7Und
	LgPICFgmS5CjugJ/LsiSAIGaGTo8W67JgW8MvMbpYvz5Z9XOQI4okv3Vm2o3TAVL6jYbbuLdu4SP/
	SgwPbXm2zIp+k1VPiWJ+2V4fWAT0MzWjUAYZ+IRQeE7Lcbd0RLMAQLjcPDkVvvtTNuGY92oQewuF0
	gkPghQTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcBw-00000001OiD-1S6w;
	Mon, 11 Nov 2024 21:43:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcAA-00000001OPp-3G9h;
	Mon, 11 Nov 2024 21:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Date:
	References:In-Reply-To:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
	bh=6aJ7+7tAZ00QWBqGIx3TLXHhs8RBVJf18eC8WQggc1I=; b=W0xcLwgQQZxQEet6iiCqRKkxv5
	QOUA/L5eVvcpRrCTtQL+7xfA+Fq0Q5EAqfcmbgj2tnHKw+wAFiRerb9ckslD4aItysVG4ANv85paI
	9hYVnB5TMV2bZn6L9L+9Ym38b8nl0ypAUz4kU3DbEtomSy2uE4Y9OwtCkZ9v6VVOZYzHUyDNmS/jt
	phulTgLdFqpAzW0BFNBf9YCkSZKUCr32+wQgn2yDcwO1Fpmv+SOJHFdnh6g3GDINS76pJKGPNj4zI
	BNQ5C0ptloSScFdG/Zx+qCZRRzjQD37MADxZCnlxQx4wOkVQJbfPs3fvaitw1qaOCZFBjr68Jhsu+
	asSO6NnA==;
Received: from mout.gmx.net ([212.227.17.21])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcA6-0000000Cvm2-14gX;
	Mon, 11 Nov 2024 21:41:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1731361279; x=1731966079; i=frank-w@public-files.de;
	bh=6aJ7+7tAZ00QWBqGIx3TLXHhs8RBVJf18eC8WQggc1I=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:In-Reply-To:References:Date:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JakcHvMDEcpFlELbXSTKoXlcb5SwyEHL0MxwTh+Z/5lArev21g99vCVHIKJVKack
	 wVGZNxyhco+frD3tEdR/Tb27phfJjAL/lOjK2a3R0UTOgz1m9Tqc1l3Gu7lm6fbK9
	 KLzJzWeYTEiEENUG8eLQuqkXmFVrslUzL01S5U20PDqwEOdI/6dq7pjN+As3Uw7SJ
	 KY94cHFUFy2txQWC4lfIgp5SGT0HxtOqF0JA6y9WCOhx/Vs+1YD0yAAD9IHUts403
	 CLoPotKo3JiKLJ4SovYkGtc0TNVfiHfRDfs7qGmUuXA/QS3kVujmKJYa0IOQheWQm
	 muFvbbsfYxAP/RMeKA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.144.196] ([217.61.144.196]) by
 trinity-msg-rest-gmx-gmx-live-67cd9ff8f8-qxw8q (via HTTP); Mon, 11 Nov 2024
 21:41:19 +0000
MIME-Version: 1.0
Message-ID: <trinity-57bdaab7-5f4f-463d-9657-377ccfe7df25-1731361278993@trinity-msg-rest-gmx-gmx-live-67cd9ff8f8-qxw8q>
From: Frank Wunderlich <frank-w@public-files.de>
To: robh@kernel.org, linux@fw-web.de
Cc: broonie@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 leilk.liu@mediatek.com, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Aw: Re: [PATCH] dt-bindings: spi: add compatibles for mt7988
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20241111203803.GA1917413-robh@kernel.org>
Importance: normal
References: <20241109105029.52748-1-linux@fw-web.de>
 <20241111203803.GA1917413-robh@kernel.org>
Date: Mon, 11 Nov 2024 21:41:19 +0000
Sensitivity: Normal
X-Priority: 3
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:lhWuv2tYMHpt7DO7Z/Dm56Q7NZVx3nihPbPFXJJSEf5DPtX75eGDbSyV4XaE9W5I2YcGW
 WKtcggTre7VQtvMYnR0+UCnrmrQqQ4YDQglMCWGW0SLXrWdy0kNMJqDC8k2ifbJmS6+Aiw42glBb
 z88/SvPlEczxqExLblIRyHVbcn9fPdCDh7zMIG3OFQKqUjJufbGxQl/jVL2LZwbFd1nRejHbCcPP
 myMMaooIhnQZZjzPlOpCrf5jc+WwQ2Kvve7SGPImdsQqzVSYYUUT5aWX/CmTaW9npY63ELcrMwfu
 jRG5SbNgmAWLsy9JZImnJh43koRoozoCZ0Z7vVBrYArvOeMMjdFlUcJs5VeXi6IEXc=
UI-OutboundReport: notjunk:1;M01:P0:2iLa3uBn1KI=;niY7MlI2EUB5Nlxhv6aaM1TMYCo
 55wGD8AOhwrMB31IDL4MsTkyZk1d9UybNK9Z34MaSrpVRzXjE6VH7YrMG+UBgghcJc5zmK+Af
 4VgYUDbUQ3bMAmF4mBX5W1dZ7ugyfOcOYsdPoZvycG0k308wrinC/IloXV1/fBDiodJ0mtTK/
 SavEaYcVK9pyhEBo4jm7F4wVeazCuvCaArYi/trYAtCo4CPb8RsDYLmX2wmM9Tt3d4CAmpW0Q
 kqd0mR6GnsnLAvd3bm4Gu+wZLWXlIcFORGVwC1WIXFsh4PHqbPulLmVkqnVqmlzRFPV2ZzUpM
 z2ch847wRtPVyehjJajW7ofxfvPV/Twev297EDbF6jq3yEr01HYOIWrzB/PUB5SD/uBGlK49/
 UCDocskb7i9mpjTB78NA63q2pGop5l6JLhn0GLGulLEFYLEw9Yd3Lr8kvychbpQu9tYJo+d8s
 krnaQh1Lpc/I2fHYq+6T3Aqc2sTxhL7/NnBH0fIt1Duoiw0RfV6WgAwWs6GUwq2XbcypIIkZA
 h0c+6h0fjpaREmRQoV1VmoTyJ4J6bfkFP3Tx/eZhHApLduWQxSlPorx5vMdy0br0+TfNhqueV
 JiApG+yF5EUWqOc/DIkMJ4nVBOeKufHUeSW/1urz8s4j8y+nRyZUt9Szxy0fY7d25gyiy+xr+
 c/2j4p6lSFwRQB4S1HcTESkgSk0S1weiffTTgTUKUw==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_214130_655200_FFF2BA89 
X-CRM114-Status: UNSURE (   7.47  )
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

&gt; Gesendet: Montag, 11. November 2024 um 21:38
&gt; Von: "Rob Herring" <robh@kernel.org>
&gt; An: "Frank Wunderlich" <linux@fw-web.de>
&gt; CC: "Mark Brown" <broonie@kernel.org>, "Krzysztof Kozlowski" <krzk+dt=
@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Matthias Brugger" <ma=
tthias.bgg@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delr=
egno@collabora.com>, "Frank Wunderlich" <frank-w@public-files.de>, "Leilk =
Liu" <leilk.liu@mediatek.com>, linux-spi@vger.kernel.org, devicetree@vger.=
kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead=
.org, linux-mediatek@lists.infradead.org
&gt; Betreff: Re: [PATCH] dt-bindings: spi: add compatibles for mt7988
&gt;
&gt; On Sat, Nov 09, 2024 at 11:50:28AM +0100, Frank Wunderlich wrote:
&gt; &gt; From: Frank Wunderlich <frank-w@public-files.de>
&gt; &gt;
&gt; &gt; MT7988 has 2 different spi controllers. Add their compatibles.
&gt; &gt;
&gt; &gt; Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
&gt; &gt; ---
&gt; &gt;  Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml =
| 2 ++
&gt; &gt;  1 file changed, 2 insertions(+)
&gt; &gt;
&gt; &gt; diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-=
mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.ya=
ml
&gt; &gt; index e1f5bfa4433c..ed17815263a8 100644
&gt; &gt; --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.=
yaml
&gt; &gt; +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.=
yaml
&gt; &gt; @@ -35,6 +35,8 @@ properties:
&gt; &gt;            - enum:
&gt; &gt;                - mediatek,mt7981-spi-ipm
&gt; &gt;                - mediatek,mt7986-spi-ipm
&gt; &gt; +              - mediatek,mt7988-spi-quad
&gt; &gt; +              - mediatek,mt7988-spi-single
&gt; &gt;                - mediatek,mt8188-spi-ipm
&gt; &gt;            - const: mediatek,spi-ipm
&gt;
&gt; Does the fallback make sense for both? Is there some common subset of
&gt; functionality where they are the same?

currently they work only with the fallback compatible, but we see in SDK t=
hat there are 2 types...in SDK non-soc specific compatibles are used which=
 was rejected last time.

&gt; Rob
&gt; </frank-w@public-files.de></frank-w@public-files.de></leilk.liu@media=
tek.com></frank-w@public-files.de></angelogioacchino.delregno@collabora.co=
m></matthias.bgg@gmail.com></conor+dt@kernel.org></krzk+dt@kernel.org></br=
oonie@kernel.org></linux@fw-web.de></robh@kernel.org>

