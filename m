Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15480C55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 00:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BmI2BSPKkdMcg/nayOQ4AjhLl7Z2u5hmFWIS92Fm8K8=; b=CVeZ6HNPiWVIbaIkR5KZvSm6y6
	NrjqafYv7fkfvz5s1KuMcbX8pyeuQFGr/Tl9kwJAQQYs/YWdut1HKRVQCDafWWY+HC+HC6fNwr3nf
	eVAUG5CGERePnPCQxi/lZAftebzIBN3Fjnr5qtd7O9r2Jvx22HtU5W+lsOggNNK2H0V+UCXBii3Wy
	s7fpv9jG7YTJRgFJ0zclZTw57yqU7pfCH1Nh+RYKSF5O+2lbcmedpuxJvZNpuKUJMLuaUtot7/YxU
	rOJlXtpLZYkw5UfQDJ1P2JMGEDmYg4zi6uS1i5yXbIhm4jaAqa79r4ArqbDSwHasckp7GkxTT/pGn
	krwE0xHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpxhO-0000000Dlg4-1tIK;
	Sat, 01 Aug 2026 00:35:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpxhM-0000000DleH-3MqG;
	Sat, 01 Aug 2026 00:35:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E30F0600DA;
	Sat,  1 Aug 2026 00:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83DD6C2BCB9;
	Sat,  1 Aug 2026 00:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785544531;
	bh=kFNPUf3nnfqfZfQU98wSE0rwkKlsgeL32eAvFj3Eywc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Uak10O1kfSVvtmCusuqvW/oOAlsYMUTh42Wh8PRirDS7eP4/9DJoVeHxHsw+sh4p6
	 JAZImJZbuTjzmaQmz9NODgbEtnkE8R+hPr67ku2l/Q4ngZXBTDeCC0YRW5v/xiCTpV
	 rtg+/sbyNBrYfAvUFm6Q9U5ZqseRWR3/dEe1GET0CY1BxawhhjETAggtLsSfiLSjgD
	 YueJHoXU8sbHqRIrq9dGjh5KvNPCNbxQsNoQ2ayyYKdB2w3D2dBKNIWduXYNRnx5vM
	 V1Vx0jxVWxnl129w96ZEF7+QE1NOGmjv/Z37nApi+v6MiCoB+TldwrYYth7AgCl6/P
	 jic/3/GSPA9Vw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E8A9C55172;
	Sat,  1 Aug 2026 00:35:31 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/4] Dongwoon DW9714 - correct vcc/vdd supply voltage
Date: Sat, 01 Aug 2026 02:35:19 +0200
Message-Id: <20260801-pp-pro-camera-v1-0-7b4d90788f9f@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqEMAxA0atI1gZaFZG5yuAitlEjqCVVEcS7T
 0eXb/H/BZFVOMInu0D5kCjrkmDzDNxIy8AoPhkKU9SmMRZDwKArOppZCclW3lJfNaXzkJqg3Mv
 5/L7t67h3E7vtP4H7/gHafm74cQAAAA==
X-Change-ID: 20260801-pp-pro-camera-a14d1af483cd
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Ondrej Jirman <megi@xff.cz>, 
 Olivier Benjamin <olivier.benjamin@bootlin.com>, 
 Manuel Traut <manut@mecka.net>, 
 Alexander Warnecke <awarnecke002@hotmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Martin Kepplinger <martin.kepplinger@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 phone-devel@vger.kernel.org, imx@lists.linux.dev, 
 David Heidelberg <david@ixit.cz>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=kFNPUf3nnfqfZfQU98wSE0rwkKlsgeL32eAvFj3Eywc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqbT9RB78Gi5Ef6RsTjwbROwWR0JA3cAkM3fw24
 7XS9hPcL9+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCam0/UQAKCRBgAj/E00kg
 crkRD/9UmsyBi/RwaU1Vjh8viYNgJJWAcIj+wICF7ZXkmcfaWQDJppVmp1ssckklT5/WM1j3DHN
 mTDmszRzZ+jz0kYiF9kyc5mnk9+fQKcLKp+m3o9z70bpShyY7kqN5VxmuyK9n2XqOMKGN+jVNFc
 GuZ8EmzC0ebIYPzmfD2woBO3I5o9xobiljACx5iWwmlRsGGX0vPD8OvrFOYPooy39at8p/tJalV
 cwPOgvz7VN3oSIbRfMS2eJ2d6kKBRUq9ssjieIAR+AOI/fOyYpWafxUOpIt92EBozLE546tS5O/
 movPjfaWv4oE3jj8ETBQSzPekesMgb3b6x3lSVJm8brFyx/a3cpQw4STJ0/KkMVTzMMpfQ7mZ/J
 bCPG9Av/0lzUssfmFG5PoPoZH5L71skTRft/XZZheeDgv1QkxsnhFu5e6scKJsKy1gbajcSGuV8
 a3833Jn8j7e8UPsnCJ4raXKgNSYY2uO/u8SVqv1kJafYVLVU/G47No9MpBH6YP3hTdU6pwfo5d3
 nsQGpF9PzEdcEySihLXoVkvpAyMwoCC7uOUiYldqUZn33kGial16lPxVrWMf3jxJxg2ypEhYlJa
 0dmMESW99y+cHGyU+6nmpKc3LwZZAtcGE0sHo3QBz3/f3gSHGnnltifwyok79NHoWZlcNSW2Xux
 YoDzD8cdfv6beMw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

So much mess, as people defines 1.8V i2c level shifters instead of VDD.

I don't pocess any of these devices, so please test carefully,
you may need to in addition to this change put regulator-always-on to
the 1.8V which was previously abused instead of VDD. Careful about
combination when camera which pulls in 1.8V (usually iovdd) as a byproduct
takes care of i2c supply for the coil.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (4):
      media: dt-bindings: dongwoon,dw9714: Example shouldn't imply 1.8 V
      arm64: dts: rockchip: rk3399-pinephone-pro: DW9714 coil requires higher voltage
      arm64: dts: rockchip: rk3566-pinetab2: DW9714 coil requires higher voltage
      arm64: dts: imx8mq-librem5: Dongwoon DW9714 coil requires higher voltage

 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml | 4 ++--
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi                | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts            | 2 +-
 arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi                | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
---
base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
change-id: 20260801-pp-pro-camera-a14d1af483cd

Best regards,
--  
David Heidelberg <david@ixit.cz>



