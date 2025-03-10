Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D9BC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 15:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pcjf/q8GOhh0QnIRascQPs5dvt067o8TXug5OHGtutY=; b=eZag3rWppr45wQPaxIZjy4nWBj
	7dc7MZ0VLrS41J4X7Tc8xF7pOwD5w6Ophlp9QsR5nX92F5Ae47ht1FQ26yAeWIW2ut3BXSOITDS7t
	84JFMsJPe6OiX5GJ4uLHw7aYmGobaqpjBGQt9r2FxIwT8zUvXF0dauYnQXAv7bV9ANADJBYM/hqlS
	+9ytNcDulsECm/9288XTnEhTfPysXmSiMz9Oa7Ot9Lj4EbJYm8NAauvqU3RXzODY4+AtNuIrUOIgf
	DJx3XqG8QcFWFHYpotw4R6zISBU/zKkTKUjObpJEpOr2mXgKDlV0yL+6DAdXR004HgJQ+IcG/vDo/
	iOroocfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trf0C-00000003Adc-2GDM;
	Mon, 10 Mar 2025 15:25:12 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trdzY-00000002uyG-0TSR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 14:20:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F8D420487;
	Mon, 10 Mar 2025 14:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741616423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pcjf/q8GOhh0QnIRascQPs5dvt067o8TXug5OHGtutY=;
	b=aPmiX69nCJQDGMo7eE5YBNro6eQyWrzFBEbRru7Q1v8yMVA8t9JmrdYoEh+wy86LuXDsR+
	Fu/sAkdiGACrLFT4+ZKEyLCmsGdUjA0axsE//cexrM+6BgJQAUwt0ZrunKYpMaK3W0eaSQ
	q510xmnA0KS3rEJQbfYrUDj+GGNt05zEuBoCSXjD8O5QT7eqgKvAzD+UHLdvzF3R3vnlZm
	A1NEmLnXaLA3Znei+OkqKDUl3aWDoFP0meO7GBkymzaV0RyKGSNBADMyLCyNfwRjoeJRQC
	Q/TsGFZMaSCnILqaK0z7WSfGlinc75Euq8/9nCVl7mr5qO128xOly7GwoQQz+Q==
Date: Mon, 10 Mar 2025 15:20:14 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v1 1/1] stmmac: intel: Fix warning message for
 return value in intel_tsn_lane_is_available()
Message-ID: <20250310152014.1d593255@kmaincent-XPS-13-7390>
In-Reply-To: <20250310050835.808870-1-yong.liang.choong@linux.intel.com>
References: <20250310050835.808870-1-yong.liang.choong@linux.intel.com>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudelheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdutdefvedtudegvefgvedtgfdvhfdtueeltefffefffffhgfetkedvfeduieeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeegiedrudekkedrvdefledruddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepgeeirddukeekrddvfeelrddutddphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohephihonhhgrdhlihgrnhhgrdgthhhoohhngheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoo
 hhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepmhgtohhquhgvlhhinhdrshhtmhefvdesghhmrghilhdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_072028_279427_B2841FD1 
X-CRM114-Status: GOOD (  11.05  )
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

On Mon, 10 Mar 2025 13:08:35 +0800
Choong Yong Liang <yong.liang.choong@linux.intel.com> wrote:

> Fix the warning "warn: missing error code? 'ret'" in the
> intel_tsn_lane_is_available() function.
>=20
> The function now returns 0 to indicate that a TSN lane was found and
> returns -EINVAL when it is not found.
>=20
> Fixes: a42f6b3f1cc1 ("net: stmmac: configure SerDes according to the
> interface mode")
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>

This patch is a fix it should go net instead net-next.
Could you resend the patch with net prefix?

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

