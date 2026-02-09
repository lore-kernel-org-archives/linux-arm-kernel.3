Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF75E7E0D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 19:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KT3vPAr9+jvW3mi9x8Y66vturr8FwJVBhekG/tpC6Zk=; b=kL8kxT7Bzg5/oDdGYtVNMMdH5v
	rBOdoB78dBxeTzqZiqdGBBgZvgEFXUfJz5RNh1Y+nfjRNuXnGfBjUEfbv6MG21GIcLnWPK6CroXpr
	Mmmro8UN75CJbXfsXKT/kQHFrwx/Tp3hem7M6NuKa+TonO5dX2m8Jca6bBRTsV/zm+rCjJXYpa9M6
	3SXRjHvL8pFEkXi8I0v5xxa2k4cfT4tbMnV6j+HB/64FsNOv3Zy8577jLYLsM3ugaJYwlwuurLfu9
	DJkZsLgQaV4Z5xHpanbPCQOleiSzpsiibpNUqwdDU1yI5S9tPeLNxj8ssQBfZGCq6GXUZDGH/254J
	95K4FihA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpXIb-0000000FwKF-2reh;
	Mon, 09 Feb 2026 19:51:57 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpXIX-0000000FwHZ-2tj3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 19:51:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KT3v
	PAr9+jvW3mi9x8Y66vturr8FwJVBhekG/tpC6Zk=; b=c8DMBDkxMXgjYFjg5hpl
	di8EsVNS7YfG/wjaG4AjbGVDMKBYDw/F0jtxz1N8dV1hw7uq4pHlU6Ohlhp+4BvD
	qhMtxNA/ZaXedTK6SvYQGoZMiGaDveLpLtUI3o33sUlK/C85dvD2YjO41B8DhvmO
	pADRlu/On51sYmfx+BtG5svy13expgCyNbZXBcxl9oQXI1rcs4LciDgwCp5bm9i4
	SbWspMzL8Nfs3Zy+Qy59J+2HEsehECs6xvPy0dvH5hDnlEFAiumfgWX3m4vJezU7
	OupUsVSileDb1YP07j1KmpxYDFQ6+eYo1RNTrWvWHCBuilb0So9QcHdPDwtpBiIN
	Qw==
Received: (qmail 1421036 invoked from network); 9 Feb 2026 20:51:47 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Feb 2026 20:51:47 +0100
X-UD-Smtp-Session: l3s3148p1@B1IbeGlKqNoujnuv
Date: Mon, 9 Feb 2026 20:51:46 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-renesas-soc@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
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
Message-ID: <aYo60vooftdem4Lt@ninjato>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
 <aXc7DxsqiCGdfzxi@smile.fi.intel.com>
 <aXc-Zxw05XQLb1Dy@ninjato>
 <aXdAB2bLTy6u8G8c@smile.fi.intel.com>
 <aXdCBu6kzdw1NWay@ninjato>
 <aXikZ5wc6bvgRqF6@ninjato>
 <aYnBrN0JRCf9-UjB@ninjato>
 <yl4bbbev7lgrmnqys2izkolo5egzg24faukvqar5eh26q5ra7p@42rcegfpqqt6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yl4bbbev7lgrmnqys2izkolo5egzg24faukvqar5eh26q5ra7p@42rcegfpqqt6>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_115154_600104_7867C9B1 
X-CRM114-Status: GOOD (  12.63  )
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

Hi Bjorn,

thanks for the reply!

> > Moving maintainers from CC to To ;) Do you, in general, approve this
> > change to the headers?
> 
> Certainly, I don't think we should force unnatural slicing of drivers
> across the source tree.

Cool, glad you like it.

> I've always found the current model unergonomic, resolving this part
> might very well have the side effect that Andy is looking for (and I'd
> welcome that).

Yeah probably, but frankly the task of redesigning hwlock-allocation is
a bit exceeding my bandwidth for this project. Can we make this a second
step on top of this series? And if so, would be this series acceptable
as-is then (modulo the better include-sorting mentioned by Andy)?

Hope you are well,

   Wolfram


