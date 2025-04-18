Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186C3C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 15:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17wIM38z/BjNxPpuwiFO3XcX73EFXC4cpPnudUb4QFU=; b=XVNRQp1/2tK/v9p6U6thbKNE2B
	wIdcMpVDzNQs/qLN2iAQqt0EE8nqMD6Anjx1Cxkm5en/80E7KR3ZjBK0dx1Hm2Vl0s3dxFozEcf84
	HjJpN1I3LJ6EsHhgsGyMXsA2pLqYW+3oAodtUt2k8a6CJdyk6Xh8Q7TSnartZ0mF25lvRZeJF0XZ1
	yV7w9bFoJQ6gCuIJe54bCSbEifJpQN9h24eM3OZmQc49+2N+kf4FHeqGTFpJx8iBtV3x/RjDDK7Qg
	aFI8ziHYKHk32Cd0GqHuzzwZMha5/2Q9ogtbz0gsU90j3GSTtftD75ATWs+HBccKHj6JoCKUeIA7a
	Z5l3KxoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5nFs-0000000GZcV-2VIb;
	Fri, 18 Apr 2025 15:03:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n9v-0000000GY27-0f7E;
	Fri, 18 Apr 2025 14:57:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 14BA8A4B4F7;
	Fri, 18 Apr 2025 14:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA5C9C4CEE2;
	Fri, 18 Apr 2025 14:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744988257;
	bh=oTujeQS8sarIls3zP15tI7er8VCZ7VJRqM5QzlZPIFY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=by2Ul9l2z5ymQ17ajZmbp9iqGHpbsHrnzPyg65f/C0hBFCh0xGEmIRcftdss7w3I0
	 EETLSE8Rh3oOzQaGv1t9e8tYDdBo2IFDZAIZg+4h3FDBdHFpsZsWXR/FbEw7a6MqRu
	 Z2rbb8DT3dR/1mLnvY+PkYB//AdUMcZ3HqJ65fPaVjo/NKnWEpHOXLLcbEcg0uC7fz
	 H4jt51kGuWIskAvsEAtVciLkPly/Icj+hrKkfc61c1w30Wa3bR9iMwLeSKo2z6rFOO
	 +OspogI21J7VVLxRJVxoB5MPAFVaCG9Gh1CMcROf6I6PGpFNcb/EHgbT8kyIQjKq6M
	 3oETvyrsirg4w==
Date: Fri, 18 Apr 2025 15:57:27 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Cosmin
 Tanislav <cosmin.tanislav@analog.com>, Tomasz Duszynski
 <tduszyns@gmail.com>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, Andreas Klinger <ak@it-klinger.de>, Petre
 Rodan <petre.rodan@subdimension.ro>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/8] iio: more timestamp alignment
Message-ID: <20250418155727.21f65050@jic23-huawei>
In-Reply-To: <aAFC9FsTRNya6eDU@smile.fi.intel.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
	<aAEz2ZD0Ipd1Xuy6@smile.fi.intel.com>
	<20250417184716.000044bb@huawei.com>
	<aAFC9FsTRNya6eDU@smile.fi.intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_075739_309167_4A278CD9 
X-CRM114-Status: GOOD (  11.98  )
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

On Thu, 17 Apr 2025 21:05:40 +0300
Andy Shevchenko <andy@kernel.org> wrote:

> On Thu, Apr 17, 2025 at 06:47:16PM +0100, Jonathan Cameron wrote:
> > On Thu, 17 Apr 2025 20:01:13 +0300
> > Andy Shevchenko <andy@kernel.org> wrote:  
> > > On Thu, Apr 17, 2025 at 11:52:32AM -0500, David Lechner wrote:  
> 
> ...
> 
> > > > Signed-off-by: David Lechner <dlechner@baylibre.com>    
> > Also no need to sign off on cover letters as they don't end up in git.  
> 
> It depends if you use `b4 shazam` or not. I like that feature.
> 
Definitely don't add what you did here though in a reply!

That adds: 

    + Link: URL [1] :-)



