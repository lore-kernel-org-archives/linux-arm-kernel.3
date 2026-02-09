Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98CFE7E0C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 11:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hyJpfMLiM1wKpMBA2O+7vpAMxxFPZoy9mfo7m5xJgDI=; b=BPMvcyBgg09xtyzIYJplCbp7fA
	YlD8V5hzqM8n/QoRl6bAKbM3KdogMORE+k57v/JqkEvBMkDLapT8G32Z3zmR7ttSfSvD5HxPUhJVk
	ufVBeY2hqD08R8iW1Kf1ZiK1Pc2Q+b6Jw0sCIEdp1EvvFNvkI2U6ADI1ZrkdHGfQV5eCnfpTTSwtH
	KqvjI1KwB9q9tgIgUN+Wg527LII9Dn9mib3zJs6xMcsXyvXVMNGCPnEcYydfzVe2NsNaDB5/jO/d0
	YwRkCMg8RrS/WfFAh863biHOPrkYleb5Uc6EXXkuTCNeb3gxd5g8Sq631d6uX+YXxXJlW1q+QEagm
	O8E+fDTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPEK-0000000FHWR-1gdz;
	Mon, 09 Feb 2026 11:15:00 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPEG-0000000FHVx-46SC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 11:14:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hyJp
	fMLiM1wKpMBA2O+7vpAMxxFPZoy9mfo7m5xJgDI=; b=k8VPT7hvskJ17pNTGk/p
	OMUecbFTEQv8Q3W4Co99Lq0BZhs/NomreXe6Xrlxk2T42voNhbTUQl1jNoHJns8j
	ehXryUyaUi3lJ+B4WVkq3K9s8XVt6QJlmVYeD4ngmlSojEp7lsJ/PLJsF4MsKDNj
	bEve9pBnnmEn2pnjaOVhCUjCSXae0BJZYfhm7nu05rYE1vYq6Qh4hrmR9COFayUX
	1YhnGJcKfaoMR00FaNv1ZG+r8cg5D2kUGIF2gBX+fqnYI2l0XrEAhOtfOgFIvAIG
	0eybVyRgjShP2dHKMGSbwAQmGYaTB9ay5AXzTWOeEqOVDh94mir23iNibMod6Z+J
	Nw==
Received: (qmail 1143365 invoked from network); 9 Feb 2026 12:14:53 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Feb 2026 12:14:53 +0100
X-UD-Smtp-Session: l3s3148p1@2nmBP2JKPNgujnuv
Date: Mon, 9 Feb 2026 12:14:52 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-renesas-soc@vger.kernel.org,
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
Message-ID: <aYnBrN0JRCf9-UjB@ninjato>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
 <aXc7DxsqiCGdfzxi@smile.fi.intel.com>
 <aXc-Zxw05XQLb1Dy@ninjato>
 <aXdAB2bLTy6u8G8c@smile.fi.intel.com>
 <aXdCBu6kzdw1NWay@ninjato>
 <aXikZ5wc6bvgRqF6@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXikZ5wc6bvgRqF6@ninjato>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_031457_382248_D77A1DF3 
X-CRM114-Status: GOOD (  16.69  )
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

Hi Bjorn, Baolin Wang,

> > > > Providers need it, especially the 'priv' member. Consumers won't see it.
> > > 
> > > But can't we make it opaque?
> > > 
> > > We may have getters and setters for the priv member...
> > 
> > I think we could do that.
> > 
> > Two drivers use the bank member, but only for the device
> > (lock->bank->dev). That can probably be refactored away, I'd guess.
> 
> I am willing to develop this series in the above direction. Before
> though, I'd like to know from hwspinlock maintainers if they agree to
> this refactoring in general.

Moving maintainers from CC to To ;) Do you, in general, approve this
change to the headers? I think it is more modern and e.g. the mailbox
subsystem has a similar structure, a header for the client and a header
for the controller. And do you also prefer an opaque 'priv' member?

Happy hacking,

   Wolfram


