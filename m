Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB539C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 11:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0N8WD8ywfUvrU/d+2liuajqPtuWQTIU1VEjQw4mowcs=; b=ngTxV1T18ph0LVOW/un8CttDTC
	8zoRNDp9R9LaUtz+9SUARgv709yhVkyR6CQuKRLZ/jFAlb2WELetSa4ZSsEIJ8gOQ+gRBq2nkliYW
	NpxrR7MF/e4jvubWIzaSMkRrToGGSp/CvMLpJ51qJ78VStJ0nU8DC3FwCxxjVwWnYtvORXTA4DevT
	1dxXjAlctmyTSQgVPNRhHQuUuJLMAM0LYP+DQIFRDyjBHVRqAHYW82rct6ZYpR1l3CXLoO67OuB9i
	JBUYyaOCv4sZAjcFt3qYyDDK6ICvh5FtJEinLvP470zZIjyLcvtPIUcLSHHQZTyd6gEBib6tRq4Zv
	OdVaeX7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4eZm-00000005ZMM-2vQN;
	Tue, 15 Apr 2025 11:35:38 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4drM-00000005PGd-1AJH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 10:49:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06B7C43A00;
	Tue, 15 Apr 2025 10:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744714181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0N8WD8ywfUvrU/d+2liuajqPtuWQTIU1VEjQw4mowcs=;
	b=MDUgUrep2bya+Ae2MY+P/jZfBTqS7MKtncABP9KbI61wHb8SCV4zPpY0DoaX9hDHLNSPdg
	LWM33hudSBVhbw9c0d00bDgWOf+n0/eXmpeclVKQFWjiWjsstNLNtsqFnV+KsE55ZtBb3Q
	BFb6E1CuVjsBprIrd7dL0bOGQWC20Mq830LB1ZD9/55O1RGyMKsElp27ox9aV1wPiewDYL
	DPa1HikV2EZwytaSFasTSwQUsq4NGIpkkf4sxQJvbYmVJED0daDrM5/WuYyXiCFF6TyQqT
	a1o2/qXVvAuJ6V6fs6CfS14pQV2P3KbTb28ytX83Rji3KKHiCqfSzBDDFbTE1w==
Date: Tue, 15 Apr 2025 12:49:38 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: intel: remove unnecessary setting
 max_speed
Message-ID: <20250415124938.3e4682bb@fedora.home>
In-Reply-To: <E1u4dIh-000dT5-Kt@rmk-PC.armlinux.org.uk>
References: <E1u4dIh-000dT5-Kt@rmk-PC.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheprhhmkhdokhgvrhhnvghlsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgto
 hhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_034944_466045_467AB633 
X-CRM114-Status: UNSURE (   8.43  )
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

On Tue, 15 Apr 2025 11:13:55 +0100
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Phylink will already limit the MAC speed according to the interface,
> so if 2500BASE-X is selected, the maximum speed will be 2.5G.
> Similarly, if SGMII is selected, the maximum speed will be 1G.
> It is, therefore, not necessary to set a speed limit. Remove setting
> plat_dat->max_speed from this glue driver.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


