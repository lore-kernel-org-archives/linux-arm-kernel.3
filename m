Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB0AC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 20:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUOyvQo9/EeP3DIU+h+yQywTeP4pomxjS3Y8EoD38FY=; b=KzPtdhG+yZCz4mwYW2rSckw359
	Q3AxgsuhM6VkU93JdLbInJk7eAeqySukCbAj3UNj32dWJ6gVObuS/kNlHDwXHIBHLsyQ26x0w5AZ2
	B1NwtcTMRZC4UAn41mNa2z2O6+K8xNRYrx36Bo1PtKV/7NX19LGQ8FdB08V5o8FyNc3rZuZkSzaUA
	jBKkEBY8QsKDM0Bzgrzm7q8Zl3T+3mfFcaZx1dPQXIvZJQ2RGhhBoXfrhzarSeJLhReJnoFWhtyMP
	6vpGL/4x19Q26GbLhHNL/WIzNPgg2fBccgQYgPCqtwM8nnN3sIXKl60fJWFH6ZuRHvlYMSR+1nUHR
	wNusLfpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIvrt-00000006GKI-1Y1D;
	Sat, 24 May 2025 20:53:21 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIvpm-00000006GCF-3c5j;
	Sat, 24 May 2025 20:51:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C35D43A81;
	Sat, 24 May 2025 20:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748119864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UUOyvQo9/EeP3DIU+h+yQywTeP4pomxjS3Y8EoD38FY=;
	b=eN2NJaAUm9dZUbijDMh09rQbJXrvEe02w9WScw7sU/2y6YgIdgDMWVkki0NAp6eklOoyWU
	EGgKUXso4XMJMaD+SwpePQ0ZHgF5lAilyY3MNxaRKME6Rk/0Vlr4bNrpCFVm7axKJmqgIa
	IuoZ4VFLrAlkKcVPCyEScwIKJZwygG82aEuYcOH8GtQ67qK6WBpNMRKRqAOEW+elJWR6+1
	87ooWs3iaNOn6G2U9EcBjUpQjEfQUymQwEyNX7U66OAmSvc+t4FjR50FpR4IpdiBSvM7IK
	AbeqwpBzXewLHSyn8hYcSFtkrjNc8JaOevkJgqTtfrI73zqMXBvsIW1y9Ge3YA==
Date: Sat, 24 May 2025 22:51:03 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: miquel.raynal@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	conor.culhane@silvaco.com, carlos.song@nxp.com
Cc: linux-i3c@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH V4 0/3] support different number of clocks for
 svc i3c controller
Message-ID: <174811981012.1255947.3023044294163637573.b4-ty@bootlin.com>
References: <20250427083230.3325700-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427083230.3325700-1-carlos.song@nxp.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduvdejtdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtoheprhhosghhs
 ehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_135111_538040_D28CF345 
X-CRM114-Status: UNSURE (   7.60  )
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

On Sun, 27 Apr 2025 16:32:27 +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> I.MX94 and I.MX95 I3C only need two clocks and legacy I3C needs three
> clocks. So add restrictions for clock and clock-names properties for
> different Socs. In driver, use the clk_bulk API to handle clocks to
> support different numbers of clocks more easily. Make the code cleaner
> and more flexible.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: i3c: silvaco,i3c-master: add i.MX94 and i.MX95 I3C
      https://git.kernel.org/abelloni/c/489c773a68de
[2/3] i3c: master: svc: switch to bulk clk API for flexible clock support
      https://git.kernel.org/abelloni/c/cd1a6a0c69e7

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

