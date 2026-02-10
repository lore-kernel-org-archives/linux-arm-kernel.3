Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E989EA3F3B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 10:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VtWNb7NUdO5bUCDMyQfroR5tgGFvHUsvicqnxM22+PI=; b=xu6fsI3Fqk4gJbFQ5AeKa9Kytx
	sdHyVs8HRVa5fplzTRhkBlcumtwJwcknnbDGchXLkNgreLYm22s/adZR6d+lCWXtfVMAxiRd3bW7p
	zzXRoTIOK5+8xQ6Ca869f0U2oLZahApgkNdEzxGDThbtAeO8FpOstzsZE6zFvZzzvCN/lapUtVH9H
	vT6X6wsgcOK9FobErbbMr6RY70ngOxG6ZQWvbnP4Bphh9ubXwCPGJrOteMP1Rf3hBRY+eoBrqvq3p
	JlY+BDoaxbEj20U+Zpe9hgORHd9up3SxtlC/TbUwqb7mNm83VL6iXn/YgHCvpMry2zd0tzt4Ba+sF
	D7pARWsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vplER-0000000Gqgy-1V1i;
	Tue, 10 Feb 2026 10:44:35 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vplEN-0000000Gqfj-2Y5V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 10:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=VtWN
	b7NUdO5bUCDMyQfroR5tgGFvHUsvicqnxM22+PI=; b=Ygj+nx5zicnCg4B/9Jjo
	ymkrXvds95xu+rHV423jWbmfMbIgr2ZgCTevfkAnWZ8IARilWWLpa4CK/wQVXM5x
	4w0A8FpsGIvoAQxpkqhXdmYRN0qT43xKzlQ1ykfgou4qtX6Lg9tcBT3ocv3L+8df
	n1pLf99ijj7d7hTzrn6bF6m7LtzBNM6u1fdqNKGnt5N+oJAYY99m8k/tzSvDYlQ4
	ieOIPOpbfZEiorpZhGkdg4dr/vXBFAROteKjLAN1o94Fw3Oi3TQpMAt45wXG+YrD
	sAp2VOd6rjRXGob9dobJIE+8tFEqCG9UtOAVzHE/ajBCVdIrcAnKfoW+0CsOnkMh
	kQ==
Received: (qmail 345109 invoked from network); 10 Feb 2026 11:44:25 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Feb 2026 11:44:25 +0100
X-UD-Smtp-Session: l3s3148p1@zQVt8HVKEroujnuT
Date: Tue, 10 Feb 2026 11:44:25 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
Message-ID: <aYsMCVf1qpLSCXTs@shikoro>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
 <aXc7DxsqiCGdfzxi@smile.fi.intel.com>
 <aXc-Zxw05XQLb1Dy@ninjato>
 <aXdAB2bLTy6u8G8c@smile.fi.intel.com>
 <aXdCBu6kzdw1NWay@ninjato>
 <aXikZ5wc6bvgRqF6@ninjato>
 <aYnBrN0JRCf9-UjB@ninjato>
 <yl4bbbev7lgrmnqys2izkolo5egzg24faukvqar5eh26q5ra7p@42rcegfpqqt6>
 <aYo60vooftdem4Lt@ninjato>
 <aYrcVE9HsDNAwqIB@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYrcVE9HsDNAwqIB@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_024432_527917_126176C2 
X-CRM114-Status: GOOD (  13.32  )
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

Hi Andy,

> > And if so, would be this series acceptable
> > as-is then (modulo the better include-sorting mentioned by Andy)?
> 
> *From my experience it's not the Q "will they or not?", the Q is "when?"
>  they start abusing it. I really prefer to hide as much as possible from

I totally agree with you on that.

>  day 1. Maybe the structure can be split to two? Currently IIO has a

I also thought that keeping some internal header might provide that
safety. When looking into it, I didn't see an obvious and somewhat
elegant way. Even more, I got a better picture of why Bjorn named the
current approach "unergonomic". I got some ideas which look doable in my
time frame. I will try going the full route, after all.

I'll start with some cleanup in some minutes.

Happy hacking,

   Wolfram


