Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602D8C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 21:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o59WfcN7Dr9R3QoV0+k2kms8MbYLWT5vLgXKAPpDZh8=; b=sRJhmHWGCd/tIjAKXAySmPELwy
	xw9zztl9/KRmoRA6uzFkIZehqLAez77/SyGwo08GDrL6rGjYYlNzhib4C4Rd326JSgFvEkZpBJf+s
	zyJxYPeakPkcRqV6jWjarN9kKwZepl7NVDd88wfGJm1KMD8STpLQNE5S+HHhDuX3YvFvtFyGXASnc
	laHGfR37KKNBzo4/CWg3IB6KXUdQUDvwYBq5tZICbFNAiR9fptzWpUx7x42wgIAaZV8U0XNZl7HUo
	mVptszzb0n1qpBLeidGEO/DZqiOA7sIXj5tc5oXkBn79cNxBHEymCZRXRuXC8t+1OSJE0wOJDuZer
	CrEDHpAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJJ0g-00000007iSW-23xz;
	Sun, 25 May 2025 21:35:58 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJIyR-00000007iIv-1t4a
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 May 2025 21:33:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 633FB41CFD;
	Sun, 25 May 2025 21:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748208813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o59WfcN7Dr9R3QoV0+k2kms8MbYLWT5vLgXKAPpDZh8=;
	b=Aogj0u2EtKl1En3kLPuByUlDfhFQ7RKZW8e+m60OrisH/QXsw06oGg0HWF2FBHRaz3F4Jn
	skfd097EDEXJn8NJulIsSknZ3/Go+ySdONotmypX+11IAKs6bLI0FztMKML3HGOCBAQ6Ks
	CELTdCgNyIMsPgt8SeKSf27w+pEUAgqxweoDCnUh5yqjGsn2QhgWisu5wpzfoXZRCPQw/f
	4Lv2VI2NcMIpxdJseMm1UqCgZTR5rqfMNx4GeqVceqozB7QeVZr1NO0m6yni0amfq7Hb6g
	GYawFACBLVAVBjkgH69QfK1avdcmfXBCweCJawLovGCU7dMzJV7slogt79xCZA==
Date: Sun, 25 May 2025 23:33:31 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux <s32@nxp.com>, imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>
Subject: Re: (subset) [PATCH v9 0/4] add NXP RTC driver support for
 S32G2/S32G3 SoCs
Message-ID: <174820879984.1463153.5925371724421505055.b4-ty@bootlin.com>
References: <20250403103346.3064895-1-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403103346.3064895-1-ciprianmarian.costea@oss.nxp.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduheejudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdpr
 hgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghiphhrihgrnhhmrghrihgrnhdrtghoshhtvggrsehoshhsrdhngihprdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_143340_254655_653FCE00 
X-CRM114-Status: GOOD (  10.82  )
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

On Thu, 03 Apr 2025 13:33:42 +0300, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> This patch series add support for the NXP RTC hardware module present on
> S32G2/S32G3 SoCs.
> 
> RTC tracks clock time during system suspend. It is used as a time-based
> wakeup source for the S32G2/S32G3 SoCs.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
      https://git.kernel.org/abelloni/c/8568d8b4daec
[2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
      https://git.kernel.org/abelloni/c/818b6709e1cb

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

