Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10A9CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 18:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ngCoUCdLUTbdrymHOsCev6X6hH5iQoI3DmGS6ubV2s=; b=zekaBUurAJp6dGeflsFwoFcFGk
	HFUzvf4wTr35fmvqPQ/3+/YKRv0TlGRFJcgDwrt9U+cZjopEpDc3mBsIqGz400lalzS1c02eu5jQU
	BR7B8uc/rCKKZ1+7RG4uG4CrnC31idAbmVWBOuvWl6Ak70vs77PyYpBDgjhdHAqL23+OkAXSOzmHL
	vV3CZG14DfL468LACa4nm0Fp/F3oW7zhu9ZIoAtDaCNKYym3T3HWu+jJR90ayJCdQCEH7FUisM1Wx
	f0yVRY9k7P2+6OD/ub1Jp3n2ASu3iFl1JxIKzuWnCc7p+upUE+3BZipx05zwz+BS1vHgnDWqYRpGK
	R+sP7aaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRwGn-00000002pfT-3yxN;
	Tue, 26 May 2026 18:12:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRwGn-00000002pf5-07sh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 18:12:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CA36460018;
	Tue, 26 May 2026 18:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C74F1F000E9;
	Tue, 26 May 2026 18:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779819167;
	bh=5ngCoUCdLUTbdrymHOsCev6X6hH5iQoI3DmGS6ubV2s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=j/tm/PMK6+xds8mCajlHkpjxIdln5XEF/6vMWcOztxsauj1YR3ATmxVMine3MbaIr
	 18ADqFnZ5vyMr3g2fI2ATHMYtCdy6BpHvi3j6IqhI0isnTMraXyFLlQyOaeDiDCo2X
	 gf1tys8RZWGoVuqNvkA4fesqF1kf6vFx/4mS1N2ATGABncvcZPrLCFwzynRAb1Yv10
	 wNnQW7AQFUY6vBX6t9C38qNM+9ouImx91LGPOKrQRb9Uha1kyyPzncAClj2O77Pkc1
	 BwaSViJRG/pCvr8LOwbOfuanKixf9gGBp4LquqcbtG+ToBhBdML4N2BbF8SnontwTb
	 +23XpWM/w0rrg==
Date: Tue, 26 May 2026 19:12:35 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Jyoti Bhayana <jbhayana@google.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Benson Leung <bleung@chromium.org>, Guenter
 Roeck <groeck@chromium.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] iio: pressure: cros_ec_baro: simplify timestamp channel
 definition
Message-ID: <20260526191235.0a01be62@jic23-huawei>
In-Reply-To: <3c12da03-6c62-4045-b831-e7b07c0ecb5d@baylibre.com>
References: <20260525014654.2399354-1-dlechner@baylibre.com>
	<3c12da03-6c62-4045-b831-e7b07c0ecb5d@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sun, 24 May 2026 20:49:11 -0500
David Lechner <dlechner@baylibre.com> wrote:

> On 5/24/26 8:46 PM, David Lechner wrote:
> > Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
> > manually filling in the struct iio_chan_spec fields. This makes the code
> > less verbose and mistake-prone.
> >   
> FYI, there was a server error when doing b4 send, so this last patch
> didn't get sent with the rest. I missed the [PATCH v2 9/9] when editing
> it manually to send again.
> 
> 

New and exciting way to confuse b4 :)  Anyhow easy to work around
with a -v 2 for the first lot and then it thinks this one is v3 anyway.

Applied.

Thanks,

Jonathan

