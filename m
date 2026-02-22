Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7682AC636B3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 18:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IdT3HvcTwWWVD2tq+TXx7dbOWtZlAvH4HrFRuvwA1jA=; b=MtU05jpxGbN+XzlWz1Z6tpnarJ
	kgxiED68B9RRmKQcOX0IJcFVmDifkvX3oERazbG4emChccv9njB5gICxnnFvLLMuovquPwR7PmSsW
	t5ogLJ2PL7M4hrBlZLqBZ1AWc2RAKWrNXXixHkamOekB9C2CcpqudODtOOJb2RxrGueK6fefrzwXK
	sBcCw92S9Zv+jdJD/pshQB9adCcwmWs4bvJW7LxCSbQP4J3NS6r8tRTeudCvyRFH/ktoal+L3Oar5
	tfnAinihQnBA9e4WFVMB+qsXTMtsEsUx42RrgZ5HFi1Jn87T6CRtFSd4Yd9+jR5wWW9Y8Xh3gFjWc
	ADwhuXgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuEfv-0000000GsZ6-1DpO;
	Sun, 22 Feb 2026 18:59:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuEft-0000000GsYx-2Sve
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Feb 2026 18:59:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D8D86001D;
	Sun, 22 Feb 2026 18:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 963ABC116D0;
	Sun, 22 Feb 2026 18:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771786762;
	bh=CVy4Tj2u5H4VFaJURPYOOEa0YyV2n450PQLCt8qncCM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Uvb2fFZ2D0HCE4xtvx6tg1yCNbr1yDnLvLn+5qeG+PGrq1ynau1okHlnWAzKZfch5
	 y+eHj8kg3oTYcZofd37TGR+82cQHkqcvAIPRgU/XZXgwjJ+cubER1mix88j62Gwbw7
	 C6H96KE5JRK4rUxIk1yfzB5XxWC/XVt1fNaUKIWu8mlmKGDuESx3minvwybXpSD6Ip
	 DhYK9arWJax4r6Fb2adLesIKzCrh0L2RQEpFhmdy3722WrdVvKT0EYnK+otoLmrYDx
	 b5rebWdCnVbxq6mZNZ+957WdKMql2RI+Lf9ynBfImX0K61FlIsnIOk5e8HrPeT2Vvi
	 mh0bHG/xMehSA==
Date: Sun, 22 Feb 2026 18:59:13 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: adc: at91_adc: change at91_ts_sample to return
 void
Message-ID: <20260222185913.75670523@jic23-huawei>
In-Reply-To: <01eb6fc5-4a71-4877-8a62-ef397a1036c9@baylibre.com>
References: <20260202115733.21382-1-antoniu.miclaus@analog.com>
	<01eb6fc5-4a71-4877-8a62-ef397a1036c9@baylibre.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
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

On Mon, 2 Feb 2026 09:11:58 -0600
David Lechner <dlechner@baylibre.com> wrote:

> On 2/2/26 5:57 AM, Antoniu Miclaus wrote:
> > The return value of at91_ts_sample() is never checked by its caller.
> > Change the return type to void to make this explicit. The error
> > conditions are already logged via dev_err() which provides sufficient
> > visibility into hardware issues.
> > 
> > Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> > ---  
> Reviewed-by: David Lechner <dlechner@baylibre.com>
> 

Applied. Thanks,

