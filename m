Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093DCCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 02:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCkMu2OlunXt2/h65JJeSiauQOK/EUbcwxkLr5+FeRM=; b=XjxlocfpcmxbucYpcXiAq9pbLF
	lAXmJCPMJ8g8y/ke8409LCWTljLt2iyA43Bymo8Dzem3KKxBpS0FD2iaBF2ZYyHJ6RErJMCOzlxmQ
	307TnARbf+zMBywpkJQSpgvH4fHW0tEKLk8QKExMhrBdriTq1iIhx/fj/L5Zdi5JotKV7VYT7kCZ3
	uVtUuh2KAbBrKweUQDm7xyYhmpkDmjhDSC08i2o3JyRjF+HxkSeiPBWdOzs1sIs7pLbVeeqVtXacK
	uPbDInTH6S3a8u8nWm7NY0/WQieKwl0MMGNbC4q+zX4RqwujV13DJBypu/yZK0yJuRYWhjfxcGhVU
	b98S5hlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1Rv-0000000CQVP-1YRx;
	Wed, 13 Aug 2025 02:42:47 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1KP-0000000CPxX-0Tcr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 02:35:02 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 624BD1D000A3;
	Tue, 12 Aug 2025 22:35:00 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 12 Aug 2025 22:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1755052500; x=
	1755138900; bh=nCkMu2OlunXt2/h65JJeSiauQOK/EUbcwxkLr5+FeRM=; b=C
	WsgO10E5+0YrdemrVxphIKzpz0v8ITf3dmGTU9n30X+0Ovdt6uKFSUyl/Cl8g+hE
	d6Ki2uXgRbL6doXcoKxQOQOSSEyeXr4JPkMypBA0ePXrmj2SUUvsUyqsoPUH6738
	b8fc4fp2hRKuyezm8Hvgzxc75r3AoPMsJh1XmA8FpPfpIRZoQB9XC5623CYmmGFS
	warEw+/a48z70Sk402nehEQNj8c3JHy7q2FngLsiCk4yeQgVj/F5/LkBaSwvxGCr
	FPpFecdqPhd0HpfcDtBxksT44UFKfFbJe+fte0RVFyf4L4qFniID7i0Kl0+xrEqN
	+OIrqBe58fo1KXNX7aufw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1755052500; x=1755138900; bh=n
	CkMu2OlunXt2/h65JJeSiauQOK/EUbcwxkLr5+FeRM=; b=aGycj9c7WBYmKF2a8
	uEAQxjM1ZdF1WQA4ZJthcHIl9P7JY93KXc3Mlmb8u8dTUnLv+0n4xbKRpWVC3mGE
	dSbm+Q3SRjv3+tiF1T+YxXyLWa8hxtU8Y5Rrv4X2nRscKw/KbxxEtAdFSuGN0FJ+
	b5NXeNm8BEE5XzXC3q3t6v5htU+qU1tRxIHd2I4kaBoaq9q1IQ7dSmIlO+wsZ0oX
	FIqABKYGyIInOHI05cGNOd2gca3fSzIBRU7NmOsAUgOAOXGD601qDaluaprTkVPL
	h4VdNJX3U4jy+yJ5JaDzdcPURwcgFoEGoFPDXP7lYNOY5dhGeOqhHCd4EfS52eul
	ggQJw==
X-ME-Sender: <xms:1PmbaA-brvfSLiwLPx__ZDGnl_D5mDLJxT9fgIXvk3R4Jmc_nKLfRg>
    <xme:1PmbaPfPPss2GoDzgnS2pF-Jmnr_wpXPWAm3cU2VdEgmUspb2sA4znSiUWqotlKFV
    bkMVJEcNVMNnBulPvg>
X-ME-Received: <xmr:1PmbaHxW_hRmE6x2ZXuOrvqdH4SkS3VkhbUkV2WP0DWcRsTS_O5ibqa-BVoojSxF3LNVU_LXgvQFG3drG67eHl6s8HnXyH4G4tAfaSZM5ThYUJfA3wS-pbZgdpW3WxGZmjT8yni3NalU1UXkSEq0jk26-fQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeejtdefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:1PmbaMIPbDuJBohz0bYA9TyyRkbhuhSlCNqBP-wIM4zAEhG_9SkLSA>
    <xmx:1PmbaBG3jzOWXbD68tgbHmT_IpB0yOlQHVgtTRZyJn8qkJa1tOGEsg>
    <xmx:1PmbaA9o1hXmh2vICzAjbBIQQH-IOC523unAL9qGph3v0UxUXiQEYQ>
    <xmx:1PmbaJJ-Pe_wPck-2PdNo5Hb5o_3KNnJ23Q_uMQHf81KQq8oaS2Acw>
    <xmx:1PmbaO0i-jkKkpwFShX6EVAVTnYe5unVrEv0I6VcYjYVUBQsIqHrDExA>
Feedback-ID: i426947f3:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Aug 2025 22:34:57 -0400 (EDT)
From: Mathew McBride <matt@traverse.com.au>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Mathew McBride <matt@traverse.com.au>
Subject: [PATCH v2 2/2] arm: dts: freescale: ten64: add board controller binding
Date: Wed, 13 Aug 2025 12:34:35 +1000
Message-ID: <20250813023435.27776-3-matt@traverse.com.au>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20230501064727.8921-1-matt@traverse.com.au>
References: <20230501064727.8921-1-matt@traverse.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_193501_209941_A2FC3D9B 
X-CRM114-Status: UNSURE (   8.97  )
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

The board (micro)controller[1] is responsible for functions
such as power supply sequencing, SoC reset as well
as serial/MAC address storage, bootcount and scratch registers.

There is currently no Linux kernel driver for this
controller, however, there is a driver in U-Boot
which utilises this binding.

[1] https://ten64doc.traverse.com.au/hardware/microcontroller/

Signed-off-by: Mathew McBride <matt@traverse.com.au>
---
 arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
index 3a11068f2212..71765ec91745 100644
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
2.43.0


