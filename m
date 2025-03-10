Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF24C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 20:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDpy8cHTTyPMJ5z8pOAMdegfLlLiRDbRJg4PxFwxHHE=; b=SUT5fbFD82yZ1sp6n90F3M488S
	t21GVRHkscP4iXptFrE+G54+1qA9XbXNaDSguLcamCeSzqLeiOv5JnfwaahsZCVjOExcuEBOZuZAK
	YKFObr6/PxdRM+38k2I4G+LXfm42f/yhDLpPyepM2jXvXPky2IVLqNYYEEeb7lOcdaSVr4n311cO0
	xtGpiUR9YuiZ30WE5Sw6LkC03Clp/njoKfa1SlWz3KF7JwwmFJbP7/XwKClbALTOLzf7BhHCLMM/1
	Q0ddZIJ7vYQRfvByQKTFl4tjrjb5SBtDBnuHKPeWhPOpH03TQX+H173rAy96cRuSCVkGUoWZSyeuE
	KkSnQHTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trjwU-00000003u41-3xbv;
	Mon, 10 Mar 2025 20:41:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trjfN-00000003rwI-3j7u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 20:24:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CEC2EA460BC;
	Mon, 10 Mar 2025 20:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C01D8C4CEE5;
	Mon, 10 Mar 2025 20:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741638240;
	bh=sq3tp2C/z+PwR1TZ4bdV2KWewzPYR6PQ99UJocfqnhs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ff962vS6QLSAGYunnX6sNMVzzr1ezNh9RHM592d2Bjc7ulYjOhc8oA01HDJFZYO2V
	 GIhh8bBhajxZv+CvRx/XyaXuc5qGlIIkPSsev35FKBD5V3B0g2NaVN2Fg1YnPw1wQH
	 uimYPoPykKlP40bykArBTzA3Lla7Mj4iC+emSM+KRUzPZaN0ZVsS4mW5Vj+m4AT0OV
	 xd5BbxBwZ4M4IHxNPUvkrxxEQ98L5zrcmpG41cyQdXdX3939vU6Qbnxy8srLWQTloA
	 45vM3UBGzmp5rJPJlkBwPa14UfTDRGARyEH6dirnwVWzqvLTY0JMOpR9qKQFAyTlgq
	 k3AnZu79BZ25g==
Date: Mon, 10 Mar 2025 20:23:50 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Nuno Sa
 <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>, Javier
 Carrasco <javier.carrasco.cruz@gmail.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Guillaume Stols <gstols@baylibre.com>,
 Dumitru Ceclan <mitrutzceclan@gmail.com>, Trevor Gamblin
 <tgamblin@baylibre.com>, Matteo Martelli <matteomartelli3@gmail.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v6 05/10] iio: adc: sun20i-gpadc: Use adc-helpers
Message-ID: <20250310202350.043d1c34@jic23-huawei>
In-Reply-To: <06e8f4f84731df9fc5d6f324e74fbd1bf83a81d5.1741610847.git.mazziesaccount@gmail.com>
References: <cover.1741610847.git.mazziesaccount@gmail.com>
	<06e8f4f84731df9fc5d6f324e74fbd1bf83a81d5.1741610847.git.mazziesaccount@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_132402_003518_55551BBD 
X-CRM114-Status: UNSURE (   7.21  )
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

On Mon, 10 Mar 2025 14:56:35 +0200
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> The new devm_iio_adc_device_alloc_chaninfo() -helper is intended to help
here as well.  I'd have just fixed these up if applying but seeing as
you seem to be heading for a v7, good to tidy these up in that!

