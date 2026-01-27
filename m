Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB30D2F000
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 11:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjft8BNeQcJsJ7Q11OQxvOD2FcnLqb+zVi7vsmsrKrA=; b=MuFtMXg4WyxXVlIfiO3Mf3Ka+z
	TLvtqwAEzysO+s3fuOFwQfPKH1S91Da5r0GRjL4+SKn8yqZvlaxoKZA+0NwpQ6SSdwdwD6MT/+FEn
	5krUvvMX1abZB2Y2TlBvzi+ENfkn8CGcldxaq1ZT0h2Z/rbah58dLeHM8UTJaK3Y667dLQmR5r6qp
	Esv6xVOuv3CMQpe5f/4qKGgzdO+uViC8KjXjz9cLRExDWzoeIl+WC/FWhZPTmyuzySux594Qs3BjU
	g8RpXAM0cVgO8rPFBadKw4jfSdz5or/TYX0nIuUrT1vExmUgbH3jaiFYZe1feBzQc+bvwJwG16wE6
	UzH2w7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhS2-0000000EAyQ-1ZzS;
	Tue, 27 Jan 2026 11:41:42 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhRx-0000000EAxQ-1WpQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 11:41:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=jjft
	8BNeQcJsJ7Q11OQxvOD2FcnLqb+zVi7vsmsrKrA=; b=HMKf9MJHWxg4cDoC0MI5
	PucL2VvzlUC0YI8iulenVBfr4MKGN1Ebz/YS1t187Hww6Lia4sqg0KTw3F3qaA8d
	fVpnblfy4xEeohABEyTM7oqNa6BOGfLVxxr8rmkvMhfQK1nrI0ib+mawvB2j67eb
	escveoPg+49prmLwiAVDxa5Olq9jqrb6Oy2VLTS9slta+ejYZ8tAxILuEUEqjzd2
	B497UTAZnMHLfG99P4I4tAefPug2NI2ICiFMumiJtdHcDFX8eRFkkgXPgVb3IwCd
	FkzdQ2TxXtfOYU07f71N22Yc46fbmeUV+2jRLzGsvUZzhJUb6Bnj7QG1Sfroih7i
	Vg==
Received: (qmail 3194881 invoked from network); 27 Jan 2026 12:41:27 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jan 2026 12:41:27 +0100
X-UD-Smtp-Session: l3s3148p1@x4iaGl1JPqYujnvZ
Date: Tue, 27 Jan 2026 12:41:27 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-renesas-soc@vger.kernel.org,
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
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH 0/4] hwspinlock: refactor headers into public
 provider/consumer pair
Message-ID: <aXikZ5wc6bvgRqF6@ninjato>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
 <aXc7DxsqiCGdfzxi@smile.fi.intel.com>
 <aXc-Zxw05XQLb1Dy@ninjato>
 <aXdAB2bLTy6u8G8c@smile.fi.intel.com>
 <aXdCBu6kzdw1NWay@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXdCBu6kzdw1NWay@ninjato>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_034138_297499_9AF6DAED 
X-CRM114-Status: GOOD (  14.08  )
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

Hi all,

> > > Providers need it, especially the 'priv' member. Consumers won't see it.
> > 
> > But can't we make it opaque?
> > 
> > We may have getters and setters for the priv member...
> 
> I think we could do that.
> 
> Two drivers use the bank member, but only for the device
> (lock->bank->dev). That can probably be refactored away, I'd guess.

I am willing to develop this series in the above direction. Before
though, I'd like to know from hwspinlock maintainers if they agree to
this refactoring in general.

Thanks and happy hacking,

   Wolfram


