Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FD6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 23:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQEymWMUNRG8sk5hn2KrPQ1InsJmesUG9Pbivjtz/Rc=; b=oAhsbyEKkGU7awXzcXxs/0mBdL
	o7bqYEkr8wzHhCllWpNrcLC0/01ApF1Q4qR9lAR7/7LSCduilnfSXknBKJ1vMVvKCsnCbrRQD+QtP
	4U2VA9B/XTZXoss0jxzjNJq4D5wQPXXup3ELSi12HFf5hvByxoHnmF6X/Fe5l1PVUS+5VzCKOLny4
	AJdZ39Lgo5uL8joPeAUGe9vARzBKVNOuulxpDJZto7mx04E/243gOvWi/HYpXtccR3tbKGcr8fb1T
	Yx4Fo/X8fKEEu2PttiVexxf985RdgwtgM2B7oIwzvBP69RKP4bd4GmT568Qj7d1VHruXY4uVAOrvR
	fUB7XTJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wei2i-00000000Mhv-0bHv;
	Tue, 30 Jun 2026 23:39:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wei2g-00000000Mhp-2aMR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 23:39:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E0746001D;
	Tue, 30 Jun 2026 23:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BED91F000E9;
	Tue, 30 Jun 2026 23:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782862740;
	bh=FQEymWMUNRG8sk5hn2KrPQ1InsJmesUG9Pbivjtz/Rc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=i/mSlnvRLI51lq3+IdKnmLxkaSgHfFb6k43864AA0ByJMaAae3tZu74voced2ZHfB
	 rfeMtZ3ErngKoRQqnjxGSbBB7m354oT2C9n+5yM/SD71gyeogFd5ogIS2rWiprvdaD
	 DtTGTm1lY2SMWVTPCfM1inwVGbA2keBNVo0Q1Fy5Mbvs8T13rQU6vXW0UDbuU+lp3/
	 ofRdYPt1aSKFFfMkAHwsSp+HYmFHhA+dIjbc5bgDlJzJWyoHZfH0ei69aH6mtTh22M
	 eJpec/EdRDCAThUVEzszfIYEyjT9ZYglzOFCViOAhLQSFlWCmGCc+k2LaBwV00fFM8
	 PKDnbvpNmGI/Q==
Date: Wed, 1 Jul 2026 00:38:53 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: <ehristev@kernel.org>, <dlechner@baylibre.com>, <nuno.sa@analog.com>,
 <andy@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <srini@kernel.org>, <marcelo.schmitt@analog.com>,
 <jorge.marques@analog.com>, <mazziesaccount@gmail.com>,
 <Jonathan.Santos@analog.com>, <jishnu.prakash@oss.qualcomm.com>,
 <antoniu.miclaus@analog.com>, <duje@dujemihanovic.xyz>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 03/13] iio: adc: at91-sama5d2_adc: rework temp
 calibration layout handling
Message-ID: <20260701003853.2a44477c@jic23-huawei>
In-Reply-To: <20260630093603.38663-4-varshini.rajendran@microchip.com>
References: <20260630093603.38663-1-varshini.rajendran@microchip.com>
	<20260630093603.38663-4-varshini.rajendran@microchip.com>
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

On Tue, 30 Jun 2026 15:05:53 +0530
Varshini Rajendran <varshini.rajendran@microchip.com> wrote:

> Extend support to handle different temperature calibration layouts.
> 
> Add a temperature calibration data layout structure to describe indexes
> of the factors P1, P4, P6, tag, minimum length of the packet and the
> scaling factors for P1 (mul, div) which are SoC-specific instead of the
> older non scalable id structure. This helps handle the differences in the
> same function flow and prepare the calibration data to be applied. Add
> additional condition to validate the calibration data read from the
> NVMEM cell using the TAG of the packet.

Last bit smells like an AND in a commit message.
I.e. should be in as separate patch as it is making a functional change,
whereas the rest is refactoring only.


