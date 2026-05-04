Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25E6CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 17:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gm7TSTvSP/HRTmiDQoXbmwTBkNYAkkRSd/YDya8DYlw=; b=Du07y/NcEtDjXAmDE++gK4nNPy
	qtkMlK2XbveqwiNTAxbLjbRghyERCrh+9FCOb3YWk5UAyNk49J3ZEk6PN2+7yH6emEmCroP1ANWBH
	AajegZbPnSILW+4+8E4HF3q0BIvPeTPXGSwhyxSsaVS9h/Jgq0p7h1Hl4GJc1iBXXzKRTRiiI6p71
	vBGE6O4a0oTmZYdDKoh/l1LOaImPSDQgY/I7NvPz0xmBe/k+VB4hpj29iGioR6o3lhIeUifUzsW+f
	KanszLHZc7tEFM2B/hoKJoI9/sKnWmWq2eIlLnMeN3/MaGuU6fN8gWiqUFNa8EmnUzrRQeyF57Jy3
	aJNRbMfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJx6C-0000000Dqy3-3qbN;
	Mon, 04 May 2026 17:28:52 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJx69-0000000Dqxa-31Zu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 17:28:51 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id E63BEEC02EF;
	Mon,  4 May 2026 13:28:48 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 04 May 2026 13:28:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777915728;
	 x=1778002128; bh=Gm7TSTvSP/HRTmiDQoXbmwTBkNYAkkRSd/YDya8DYlw=; b=
	jMHsXegICy9pjmFcp5P2tiRavDgFo5sTAEtFdJ0RUUGdWYi5AWcOM1FhCUvx/+66
	KHmrDCJoOURcz+KREx579n64M7BYLjomlxpOxctPcc/j3hKCnVxU6pnK+gYKtLYf
	Ledrrux5J/z/DkX6XgG0IWRSrkrz5KWnd196oZRyiS0Uq0Y3P4nzLQ3LfyhPcS79
	B26Uy65HbIIyDJSVQNBJM7RA2C7WVDOzaFdhKAXRsMxcjAnBndgNyE60LQgL2aXV
	7qNQWifuLdy20963X/ExKrdisVvP+G2E7zkxWOFVab0atf8VEIC3rT3hf/MrogqU
	wW3aEUm1JBfUsaQcEiBaaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777915728; x=
	1778002128; bh=Gm7TSTvSP/HRTmiDQoXbmwTBkNYAkkRSd/YDya8DYlw=; b=u
	xdhum8LkdxL7i3pbiSSJbtyXzQaphCMXoosCURMasqgGdEIC3eQUvB8oqrb2Q2PN
	SgLUS1YFE+9rBNekUWyPaNvyWhn8br2qlgOlJ39H8gJ97c2VKC18VbV2uiUo02eT
	VU1wfz1rJxNK3qU9toMhMrWL6Ssyk427QyLaPt6jdLaUfeyNj5pJKpMoCvYL6AUo
	xQmw9QLBa8nbM2Ux3NdUFfkLdNhEa7KUEv24w5rV5+nlSbEQJLE7TBGJsy5Qze0i
	idirfOVwnMDcmUSa1nSnfetEw44PFUB8GawyR33FIwvBJjdycDPsvTJ76pghGpK8
	SMvrYb34Ll0dKeFAoueIg==
X-ME-Sender: <xms:UNf4aQdUxjhjU7nUZ-TZ9b6o4wNZb9f0sjcR-hhNwBkqt6N-D19cmg>
    <xme:UNf4adDk8r93CLJXy9qcumkGUzcS27SolOUJHihujqRm96Oyn82vGCGGcrAdd1H8q
    8FYhYbZcxqkA0nInmIvlXjE6rgPDBh7E__xqPk_HnY0Xrj0CghO0k4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelleeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedujedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepnhhunhhordhsrgesrghnrghlohhgrdgtohhmpdhrtghpthhtoheprg
    guuhhrvghghhgvlhhlohessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepughlvggt
    hhhnvghrsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehsfhhkihhnghesfhgufi
    gutgdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhs
    rdhsthdrtghomhdprhgtphhtthhopehmtghoqhhuvghlihhnrdhsthhmfedvsehgmhgrih
    hlrdgtohhmpdhrtghpthhtoheprghnghgvlhhosehkvghrnhgvlhdqshhprggtvgdrohhr
    ghdprhgtphhtthhopegrnhguhieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhitg
    dvfeeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:UNf4aWBA7jMTsgcxkwQhgZRTrmwgIMhxumlZGLZywTAMAFR61Hi7kQ>
    <xmx:UNf4aZRE8F_w98hkds6vvfEplo9U0VZXhqhKXaYqZLDCWeridPO4aA>
    <xmx:UNf4aYRK-ZEymYOKu-ndestvH63s1ZSBPJOjENdgRRIqe_Ug2QlgOQ>
    <xmx:UNf4aXLp4atYBtwihUVFj8Y7Z_x7P6NiQh39LCnPJhjOWOlyy-sI4g>
    <xmx:UNf4aYVGSufHwaLWZxvk004RbaBVDbrS1Ii7zi-rO300XGeE0EM-2ogD>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7DA46700065; Mon,  4 May 2026 13:28:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AV3Os5nlAIEw
Date: Mon, 04 May 2026 19:28:28 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Angelo Dureghello" <angelo@kernel-space.org>,
 "Greg Ungerer" <gerg@linux-m68k.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Steven King" <sfking@fdwdc.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Jonathan Cameron" <jic23@kernel.org>,
 "David Lechner" <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>
Cc: "Greg Ungerer" <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 "Angelo Dureghello" <adureghello@baylibre.com>
Message-Id: <ef773bbd-1cf2-4cc2-96a8-fccd3355d6b1@app.fastmail.com>
In-Reply-To: <20260504-wip-stmark2-dac-v1-8-874c36a4910d@baylibre.com>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
 <20260504-wip-stmark2-dac-v1-8-874c36a4910d@baylibre.com>
Subject: Re: [PATCH 08/10] m68k: stmark2: add mcf5441x DAC platform devices
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_102850_611455_B59F87A3 
X-CRM114-Status: UNSURE (   8.99  )
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

On Mon, May 4, 2026, at 19:16, Angelo Dureghello wrote:
> @@ -94,8 +94,42 @@ static struct platform_device dspi_spi0_device = {
...
> +static struct resource dspi_dac1_resource[] = {
> +	[0] = {

This looks like the name has a copy-paste error: this is not
related to the 'dspi' controller at all but is just the dac, right?

      Arnd

