Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AC2CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 06:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAZjNYlYoUxbND97FHyJPKGZ9OtZP5oe5PR+eT/X57o=; b=0Ji1ni3lqJJ6sLSu/MDL3dnPIR
	dTHwAMEudYrMYZ+AAWiCgTUF3rksPoBzWXyZieIlgJcgeKysWUHKJOK1B2vVr9uKVf4SAuAmbcQfE
	Jl2SPrJkFS32O7iGmGFPay4D6vubGHMBUHL6N8DTdCpGY2f1lMJpJdk7nESD4PgqG+5lY8dpPp8Oo
	7VJLvpSB+SBHqgudT3hFrjSTExqy35cF698E3pUo5whP/gIj5BFK9rB7p7/0+TcUhZXx1Puj3HqWu
	EwkMLWyeMK+eMarEpkAms3o1/rJjRXpXoYUwLtBUde2ZlVL4qRU6sS0ukXvUKwedFzc/4ePfPEVra
	MyrB0EwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyh1-0000000FwiE-47Rv;
	Thu, 21 Aug 2025 06:22:35 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyWM-0000000FvJf-0E49
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 06:11:35 +0000
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E129D1400057;
	Thu, 21 Aug 2025 02:11:32 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 21 Aug 2025 02:11:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1755756692; x=
	1755843092; bh=GAZjNYlYoUxbND97FHyJPKGZ9OtZP5oe5PR+eT/X57o=; b=o
	IOyJiKLgOucJBtq7FFGsyqDg9sdK9DoMd+FAu1fyQ26x1nDtZuLzjiD3QuBV/9Xg
	C5W+QSlVH4ytQM8LUIJA38zkPJJFU2m55m2lB9kalYH4b7AooMSX6/JnoS3er45n
	eMOCDhKfPXA4pE/qxrDS5r03pYnfGXfqcQtBKD9Odn5pYQoEQIZonFhbvvoSBHwN
	6SMZ6K7st/ZDMhRtcGbDt4C7Wd0LiNxK2NMtZWYtLd9smSPWaGN+yAgW441Css4z
	C9090UMtPIv/g8U8Gp56BtvJ5d1MLD4i4sxi7CS1QBK0nVOTWM+2DArxPbEhoqEl
	SJt188LZ9DhlE7EzIj2Mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1755756692; x=1755843092; bh=G
	AZjNYlYoUxbND97FHyJPKGZ9OtZP5oe5PR+eT/X57o=; b=Ac/78oHKHPxGpfgSU
	7PCSjEBKFMnM/URsMY9+TDjtCcfhjg4kdqsQMiA/VZEXdR9ykaDwNCIsfeSaIh9q
	ilXBTzwWjxuz2n1LCGI6HKJUzVQzOSV6LZSW3kPNTJv5/CWeYimkxXyn37RPdEWP
	PlQSSs1JKMldxP545nxcCwBpZWGf9IbiiGjN2R4EzEhorZdzZIZlDSOch8DvRnuL
	DH0TNyL0odx6P1s9uR9wncFrLQTKAI/uJmYJlwGPqbaJw5MMiby0FPyjm7vk1xRJ
	LBAm0CLt5Uir2PPiMHUIYITgAFfq/qkZ15QiO7IIDPm4c2SL36nVB2VO4UboPSPl
	P4Ycg==
X-ME-Sender: <xms:lLimaF_Hx7JGsuFNCDWxszHj9kEq20f4IjMNDcVBl_Zy0bmRBgtF2w>
    <xme:lLimaAeOhkxLl6Yjqf3yHZvzs-AfiLE4aWb5xbtiDnbNKIU8NWcKfwnYtiZzvwdox
    aeA9ZZP3BZGn4GJ6Rw>
X-ME-Received: <xmr:lLimaEyjDKxw-jEmX1h3rf7lWiTs3haXdUVa-ilEfypSQH4iCbZ7c2bUnyONYwVQoBY-iK3eib4Sud4fK2RKti6v3nmrVxIGOzOn87igzV312BJThpKqYzVGlzK9xy2XM2k7z-hejxlBH71VSaLxcJP4dHE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduiedtgeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrthhhvgif
    ucfotgeurhhiuggvuceomhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdrrghuqeenucggtf
    frrghtthgvrhhnpefhffeuheetudekveejvdeiveffheejieethefhfeekheegffelfeel
    jedukefgveenucffohhmrghinhepthhrrghvvghrshgvrdgtohhmrdgruhenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghtthesthhrrghv
    vghrshgvrdgtohhmrdgruhdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouh
    htpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhrii
    hkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlvggvsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruh
X-ME-Proxy: <xmx:lLimaFKkRZXtOops8bSwVVMAwbxALyWA0d1c8hc1UKrGskBGIQNWvg>
    <xmx:lLimaGFYbcUFQPmQha2CgiA7LWH4JvVUxMY8S4zgm7Bgp4kE8CFtvQ>
    <xmx:lLimaB_34WWuVo_0_vNAAfMVc-qh3Zwn5GZ5cJ2WdJjt7UwpoKeaew>
    <xmx:lLimaGLIcSlZj_qtsfBTRtUGezX9jnX2UhqDnBsGId_rMSp5BkKbLA>
    <xmx:lLimaL2JUkdcbE1J_wsw1Ej16bm3cB2BAMx6iEmYnDE8xkOP9DKqgCKo>
Feedback-ID: i426947f3:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Aug 2025 02:11:29 -0400 (EDT)
From: Mathew McBride <matt@traverse.com.au>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Mathew McBride <matt@traverse.com.au>
Subject: [PATCH v3 2/2] arm: dts: freescale: ten64: add board controller binding
Date: Thu, 21 Aug 2025 16:11:15 +1000
Message-ID: <20250821061115.18254-3-matt@traverse.com.au>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20250821061115.18254-1-matt@traverse.com.au>
References: <20250813023435.27776-2-matt@traverse.com.au>
 <20250821061115.18254-1-matt@traverse.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_231134_162799_EFA5568B 
X-CRM114-Status: UNSURE (   9.00  )
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

The board (micro)controller[1] is responsible for functions such as
power supply sequencing, SoC reset as well as serial/MAC address storage,
bootcount and scratch registers.

There is currently no Linux kernel driver for this controller, however,
there is a driver in U-Boot which utilises this binding.

[1] https://ten64doc.traverse.com.au/hardware/microcontroller/

Signed-off-by: Mathew McBride <matt@traverse.com.au>
---
 arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
index 3a11068f2212f..71765ec91745e 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
@@ -253,6 +253,10 @@ usbhub: usb-hub@2d {
 		reg = <0x2d>;
 	};
 
+	uc: board-controller@7e {
+		compatible = "traverse,ten64-controller";
+		reg = <0x7e>;
+	};
 };
 
 &i2c2 {
-- 
2.45.1


