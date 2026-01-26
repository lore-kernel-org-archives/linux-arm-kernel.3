Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2665CCF65CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJniA+7mtqd+T2ckN/JR/8Xw3cbywiTK+2rTfmY54To=; b=FEpX4V+94X0wk9O8vJzPLQNZcC
	dzn7m8vo8D6iWwWmaXeUU+iafrScgx+4dTYsSncImjVmSh6o97/1bG1Adv9QEqoXVIQs9D1EDyHpq
	GTsdp4tX9xQLybscukLN6TsPuPKas2ocZsnt+0m5sb01UQYBQn3WrKgO6uKT0z3/t+Coj+o57wUEb
	MOYcJt30fmO0KpvSuz6KibMrHF7ibxCaTXpjnzn+a0YP/YQXpxMg/5ubN1b13h1upC8fBckkFy7Lo
	MUW5YTlEFiufjHszbhm+TD6uDXOqCIAJztyaMTzdsDin26+tvkvfmjpfWvHgM7764TCNotqx8BbVp
	BGDImzjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJeK-0000000CGNX-1T2U;
	Mon, 26 Jan 2026 10:16:48 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJeH-0000000CGN1-0ccS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=aJni
	A+7mtqd+T2ckN/JR/8Xw3cbywiTK+2rTfmY54To=; b=crwXK+AsGfSv2yCVxPH0
	pZmwvGK9TVs/dpCMF5DDZXl/rKoCfMRa6pWWFbpVr8FgJhyH8SgAFLgRQwPJ+KXw
	oE/8vzv6gsqP5fBmUVYiVUDe3V4OdQYklAKK3H5ra/FiPiHgcBv2xqMepClGaI2K
	zH8eVVkJlxdVGHd+8l9UQwVQ/3Puexv2GfqR2JWVRmV8d5YQqtFDAAdH7fb0ZQgI
	Y0OSb/dLYL9eBDPZ5lzY9g+2xVNLKfXq5gFgLCd/wFxFlxKCKaXz3oG97Y117hjJ
	HNgFFZ8cI3G7C9ET9WnsPS3vbRs+6w/NJChfna7Sl0Qdzs5ZWuNOxDznae6t2PKX
	2Q==
Received: (qmail 2705781 invoked from network); 26 Jan 2026 11:16:41 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jan 2026 11:16:41 +0100
X-UD-Smtp-Session: l3s3148p1@swKezUdJzpAujnvz
Date: Mon, 26 Jan 2026 11:16:41 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-renesas-soc@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH 0/4] hwspinlock: refactor headers into public
 provider/consumer pair
Message-ID: <aXc_CcoiXlqE5WPU@ninjato>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
 <aXc7DxsqiCGdfzxi@smile.fi.intel.com>
 <20260126111440.67394323@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126111440.67394323@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_021645_461620_90AC6859 
X-CRM114-Status: UNSURE (   7.67  )
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


> wrote the sun6i hwspinlock driver. Currently it is impossible to write external
> (out-of-kernel-tree) drivers because of internal structures. And it was a pain

Although my use case is more "out-of-directory" than "out-of-tree" ;)


