Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56537C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 17:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1l9FecZC20se1cRT+U2yFyGnQU1PHlnfgdsZtd2O88c=; b=a2rH1NdN3E4/kRQ/5O+00aGAsI
	3PgIwMpA0b/c39kcbZamjW0AlY0Yq2GskNth3yW5OLBmigfI7EATJp678vWHJmbwP8GM2cZSGwmSx
	/6W+w7L7y3Z5LQ8DnFXLteJDF0gl9zX8P+Ngkx1lq92SYmBzNL8Lm+Mmf2Qta8nvmalKWyaDlw2Ao
	HU98wT8p1cCASuHX+6FD+P1/1aSyWe7PQ99Vfkia2rco5TLiMI8/QoH3l5PfmmtsScEvCA7sBKaaE
	N+fA6jNfybHVh5jcCAJg2RClEXQGEnamP7LTz71KZofCIgl9D8+qtIwo4c1Xcf6XvM7/KafY36NFB
	rwtS2ykQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cqh-0000000FEgW-3rOV;
	Fri, 18 Sep 2026 17:58:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cqd-0000000FEd0-1V1I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 17:58:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8645A6057A;
	Fri, 18 Sep 2026 17:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C6E61F000FF;
	Fri, 18 Sep 2026 17:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789754286;
	bh=1l9FecZC20se1cRT+U2yFyGnQU1PHlnfgdsZtd2O88c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nFMZj+mJxhvA4HWpVg8jsWxsjw/8Tku/xdTQdIfmCtvNrKQzG71Pq6lO5l7ogAmu3
	 xSxmkOGz51hepFCStCNGeCu/+Ze5Hd4Fn69/4WxiIoM3QKK7tKKDKmxELKSqW0X9Fp
	 MSTVj0C6gLx6vnYO7pvWlRDtUefL9itkMCiphZ2iVsKY/0rWOf1+NOr2bwnqdQFuqD
	 u4KKWJz30R6brUDDVRIhYk63gWXR7L+QGUw8mSwfkwLZv0Zl8ZKiK8/3yrzQjZv775
	 XHh3z5QI+9nuenRHdEA4MblSnGphwadG3ucTl6ozc2y0hmaoE+g5hdfUnPX3Cuxxd0
	 awqMuDYbtnpEA==
Date: Fri, 18 Sep 2026 23:28:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH v2 7/7] dmaengine: Remove deprecated
 dma_request_slave_channel()
Message-ID: <aq17qvmxF6nwclkR@parshuram>
References: <20260918113727.1898998-1-andriy.shevchenko@linux.intel.com>
 <20260918113727.1898998-8-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918113727.1898998-8-andriy.shevchenko@linux.intel.com>
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

On 18-09-26, 13:34, Andy Shevchenko wrote:
> No more users.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I thought I had acked earlier one. Here is it again


Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

