Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A15C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 19:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EYp1PH84CI/1BjGsz+Aop4wrRagREEsClZGhgLNu8YE=; b=RdmFQUWTnnfzssxDkl+tyoOGtQ
	DSmvrtZy2K8wUeGq5kooNpoY7IdIgnCYx0HxqPna5jny+iQtfoUcHjLZLvigDGNvB0d9y/DDTEs3C
	GZYORlNpIXbXPI82bKlw33qskJ36wYC5d2lkPpJhlCyE7Qxb+o6/NXsb+4cxSGUh3oWzR2xhiapBB
	qrY9OXTORIKKMW3OyehAwensn3TmOzDawtxjp2X76Hscb0lgda298wn1ve865L5nQGCGuGE7VvDGd
	s/SdIn2CK8n6Z1N4RYPaCPw3hjfdplf1jRoXXoe2tzeTz8JgKHQ8RoXV8SmRlYcGdFPTt2quDWX4O
	md0R2ApQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7JaN-00000008LUX-403I;
	Tue, 22 Apr 2025 19:47:16 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7G8d-00000007piw-0cpj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 16:06:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43304438C1;
	Tue, 22 Apr 2025 16:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745337980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EYp1PH84CI/1BjGsz+Aop4wrRagREEsClZGhgLNu8YE=;
	b=AcOXqpIj1Y5WHHcyuArtzMkdreDit/Ps1+jloEHY3T8+Dr2Exj7tcyzpHwaaA2YO+Ay+cu
	XxAKVq4fbXpCOOl28MCp4zejQRvHlKBGqVs97g/a+TWVn0Icll1gkDR7WuHnLFVpVcRMXg
	JV9+8FR/4BEsqO/ZYv5NtF1yZbZIsxMJ27keaFOwbWHZ8cPhxJyN8RG1u/VNYwGedA38TF
	DBMj1aOjXK8xP75F3tyJRltTrN7+6UhCOF3JhzpFY/vbrGHq3olR4PGXK6xtp3jVOe3DVd
	tbHXaIg96rp7ImtFUehKsx3cBRyjLoJIB0w7XvxLlY9WVLQJv9NoH7Kd4znQlQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Apr 2025 18:06:18 +0200
Message-Id: <D9DAOEKXJKQB.HHD75KOLKIW1@bootlin.com>
Cc: "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Richard Cochran"
 <richardcochran@gmail.com>, "Daniel Machon" <daniel.machon@microchip.com>,
 "Maxime Chevallier" <maxime.chevallier@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <netdev@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net 2/2] net: stmmac: fix multiplication overflow when
 reading timestamp
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250422-stmmac_ts-v1-0-b59c9f406041@bootlin.com>
 <20250422-stmmac_ts-v1-2-b59c9f406041@bootlin.com>
 <aAe2iULNthghEEEt@shell.armlinux.org.uk>
In-Reply-To: <aAe2iULNthghEEEt@shell.armlinux.org.uk>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefuhffvofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelkeehiefhfeehvefhtdegueelkeehffffffeuvdekkeekuddvueeguefgieeukeenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepmhgtohhquhgvlhhinhdrshhtmhefvdesghhmrghilhdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_090623_327612_01CCA370 
X-CRM114-Status: UNSURE (   8.77  )
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

Hello Russell,

On Tue Apr 22, 2025 at 5:32 PM CEST, Russell King (Oracle) wrote:
> On Tue, Apr 22, 2025 at 05:07:23PM +0200, Alexis Lothor=C3=A9 wrote:
>>  	ns =3D readl(ptpaddr + GMAC_PTP_ATNR);
>> -	ns +=3D readl(ptpaddr + GMAC_PTP_ATSR) * NSEC_PER_SEC;
>> +	ns +=3D (u64)(readl(ptpaddr + GMAC_PTP_ATSR)) * NSEC_PER_SEC;
>
> I'm not sure what the extra parens around readl() are actually trying to
> do. Please drop them if they're not useful.

They are indeed not specifically useful in this case, they will be dropped
in v2.

Thanks,

Alexis

--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


