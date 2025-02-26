Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB3AC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 17:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjI2DTiQMlxYIRwQH9QR/Cwawyd3pO3A4ovumf0p0Ys=; b=oIqBWqdk5EICyHo2KVNpOdyj6b
	Vp6RFV6MEm1L1+pN3pCxq4/gyDoMuemdNiRN+WwLN5rYagDtrZgIN+9tb9QhxVcLwN1pK1gjopDZu
	fZidUAHbS34i/IbSt6OWu3OuXTo8SJJm6aBsaUO3ZtxOiy1J5HMShaJGnDDnjfOYYzvLZQyuPqHwt
	tJLOTTQGDx++SgFjQSbQkdwGf9s8anZkIa8x9Np7zE9r2X1jlsXNOtiLp+pNlgYx0te2HQnb+RzmX
	WWhQ3r02UaJhg78WUvTCo9IG2HsJ8/VHfjFVZ3OcbvR0zLZJ45aJDCB8hD8vbelsWrJsYJID8m3Dd
	6xoHNang==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnLAy-00000004irn-2Zku;
	Wed, 26 Feb 2025 17:26:28 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnL9R-00000004iiX-1Qhu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 17:24:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 35543443FD;
	Wed, 26 Feb 2025 17:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740590690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZjI2DTiQMlxYIRwQH9QR/Cwawyd3pO3A4ovumf0p0Ys=;
	b=SwhdyW2b5K5TWoop/kt3UewfglCdpJoJpl5wr3C5G3TDZD9QFVAvfOsKUPYGlddnhyUbe2
	KpOa9ApSOwxH9BQZnXGKeizn2nXiLjjR0++5eFAOZfesDIejdTMlJcYH6OtDqSCDs0oZWn
	AQfISdyJeUvfTkp4ndXf47y7Mbm6RsNUsbvI9DP1nJLCmj+E3hbuidMhcf/u9K1yflxx2A
	HzhXb+SLCvKa1y9V+1d2owClg409Jj4h7feXSfuvDd5mnhfpeiLldvXoYM654c5P9R4b4Y
	b0t2Ud4P9B6jAGggC3SgR9muV5LE5wGFVNz7heNSF/rGKSQRpTF4GP6QGwIFKA==
Date: Wed, 26 Feb 2025 18:24:49 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Horatiu Vultur
 <horatiu.vultur@microchip.com>
Cc: Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
 UNGLinuxDriver@microchip.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] reset: mchp: sparx5: Fix for lan966x
Message-ID: <20250226182449.61a126ea@bootlin.com>
In-Reply-To: <5cc5cd05e0a481773212fff0bce574dcfea3f74d.camel@pengutronix.de>
References: <20250226144645.1950451-1-horatiu.vultur@microchip.com>
	<5cc5cd05e0a481773212fff0bce574dcfea3f74d.camel@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekhedujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopehprdiirggsvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehhohhrrghtihhurdhvuhhlthhurhesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopefuthgvvghnrdfjvghgvghluhhnugesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhop
 egurghnihgvlhdrmhgrtghhohhnsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepfgfpiffnihhnuhigffhrihhvvghrsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_092453_508500_C834A758 
X-CRM114-Status: UNSURE (   7.03  )
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

Hi Philipp, Horatiu,

On Wed, 26 Feb 2025 17:32:22 +0100
Philipp Zabel <p.zabel@pengutronix.de> wrote:

...

> > Fixes: 0426a920d6269c ("reset: mchp: sparx5: Map cpu-syscon locally in case of LAN966x")
> > Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> > Tested-by: Herve Codina <herve.codina@bootlin.com>  
> 
> Is this still correct?

Yes, it is correct.

Reviewed this v3, saw Philipp's comments and I have nothing more to add.

Also tested this v3 and no regression were detected.

Best regards,
Hervé

