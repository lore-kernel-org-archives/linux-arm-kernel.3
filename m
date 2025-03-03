Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE401C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 21:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xBOb7oGeYLEpXfq67SR7gONs2pzCSxu5VZhQZhEOe6c=; b=LZxmBGq+ozBn/6nL9AWju7oJMD
	lWafYTX9Q75KmFL82TnY6FPFkJistg2Joa3upQtPJDI1/poHrYHHPbByFPn80uXVqkmIw/bYTDZ+I
	C3mxQQiyDSsXc1nbso4BeekqnafWI8jjUUSNLLd+06UaS1kCluVzrMZWDSyDS+odtUGLvnNNXWBS5
	ugb0gOizpO13KbiLrqjRgC5Wc6MXKo/UyqjH2E81msHf/xscrACYBKnPYVJYn3Egj2WJOOz/Yh8LX
	dNf8r7ZBuY6iD1im2mgh0PsS48CEoDHH+jTUnpLvEq6FJK3aUj3Iq3k0FK1hjJ9ZahfS34woDsPf3
	0+7LZVyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpDkW-00000002P8W-2TWw;
	Mon, 03 Mar 2025 21:54:56 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpDiv-00000002P3B-3dnV;
	Mon, 03 Mar 2025 21:53:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B05120457;
	Mon,  3 Mar 2025 21:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741038791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xBOb7oGeYLEpXfq67SR7gONs2pzCSxu5VZhQZhEOe6c=;
	b=mCLyG6hBbbcmuyXpIbTsjYLroVo6Y073oLGc5iIpWunCG6SjJWBZ/AJoHMoWREdxC7S6Nk
	6GgGL/bUWpapqJdoccETbQhHWoy+6n7m1GncwhDEOdRrGasYG2WJe+4qvDbZHSfBctKoaR
	IsWpDs1zNJ66dPivtbwU9WO3bSShsk/t5nRXE+CxdN9MoZV2QXkJeHgCLP+0Y+5E89lNPN
	x7xpc6f0aQ5rlxWQkCn2x6oiITMkS1lzaWEcE6pA3lu1ceCWUEt6hzI3Igt6Ztrj/m386X
	L/bbEVEfh0VlN/Xzm4HV8DwbUkQ3aAwT8WvoX4t9X2Jf6TUfTDE+78Ek8ul8Pg==
Date: Mon, 3 Mar 2025 22:53:09 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>,
	Antonio Borneo <antonio.borneo@foss.st.com>
Subject: Re: [PATCH 0/7] rtc: Use devm_pm_set_wake_irq to simplify code
Message-ID: <174103876909.1106916.958645902819103595.b4-ty@bootlin.com>
References: <20250205-rtc-cleanup-v1-0-66165678e089@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-rtc-cleanup-v1-0-66165678e089@nxp.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddtvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepjeejrdduhedtrddvgeeirddvudehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepjeejrdduhedtrddvgeeirddvudehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopehmtghoqhhuvghlihhnrdhsthhmfedvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpt
 hhtoheptghonhhorhdrughoohhlvgihsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepuggrihhrvgdrmhgtnhgrmhgrrhgrsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepphgvnhhgrdhfrghnsehoshhsrdhngihprdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsthhmfedvsehsthdqmhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_135318_533030_5C4F2D22 
X-CRM114-Status: UNSURE (   7.89  )
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

On Wed, 05 Feb 2025 08:58:18 +0800, Peng Fan (OSS) wrote:
> This is a pick-up of patch 6-12 from patchset [1]
> 
> Since devm_pm_set_wake_irq is in 6.14, so resend the rtc parts.
> 
> R-b tags from Linus Walleij and Antonio Borneo are still kept.
> 
> [1] https://lore.kernel.org/all/CAJZ5v0jb=0c5m=FeA-W-aG30H4706Ay_xCHTsiC1S-7MuGxqTQ@mail.gmail.com/#r
> 
> [...]

Applied, thanks!

[1/7] rtc: stm32: Use resource managed API to simplify code
      https://git.kernel.org/abelloni/c/04572d18921d
[2/7] rtc: nxp-bbnsm: Use resource managed API to simplify code
      https://git.kernel.org/abelloni/c/6b296dee3eb7
[3/7] rtc: ds1343: Use devm_pm_set_wake_irq
      https://git.kernel.org/abelloni/c/5ad218f101e4
[4/7] rtc: pm8xxx: Use devm_pm_set_wake_irq
      https://git.kernel.org/abelloni/c/e8a0b6e62429
[5/7] rtc: ab8500: Use resource managed API to simplify code
      https://git.kernel.org/abelloni/c/ca36c9301117
[6/7] rtc: mpfs: Use devm_pm_set_wake_irq
      https://git.kernel.org/abelloni/c/d8690ce183bb
[7/7] rtc: pl031: Use resource managed API to simplify code
      https://git.kernel.org/abelloni/c/90e0bcc9392d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

