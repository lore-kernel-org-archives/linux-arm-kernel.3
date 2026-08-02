Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCC1C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 02:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yP//XZWU/wam33jmY64c/D2Purb8/lgGfb2RqvHbImk=; b=a6CC261UskT4AN7thgXdWDNsk8
	IX6D2KAgAExvpFueHiqLmSATWWRWJtDclpkP8ogAYaKpW10XMsmfTlNNpZSbpiV/s3ixCozEmDzzS
	DaO5sSkSfS8s6PWyT5bDYtj7+LH44xoAw+Vt5yIQgmGA8ECaG/yQjPS+1s5YpsBYnxDJZll47j973
	U10J35merxYxjT8cskdxfUzsm1MSgpnydbUyhNDXMUqBMK631iF1thO+rshNp77UW6MPOoCN1sy/m
	wS5PyFPxh9AoQrbjQ9dpmMTCqWj8TqRdYfKs3lZM2tlq2zcvW8wGqNW7j3CCO1gppFc5GXE5N5KdJ
	giQ0wC0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqLam-0000000FGpZ-1MOd;
	Sun, 02 Aug 2026 02:06:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqLak-0000000FGpT-2EAX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 02:06:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0AB7C400EA;
	Sun,  2 Aug 2026 02:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE731F00AC4;
	Sun,  2 Aug 2026 02:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785636377;
	bh=yP//XZWU/wam33jmY64c/D2Purb8/lgGfb2RqvHbImk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=NBrorHX6yC0XB9s4ldhhiPekP+dmM6FpcmAsvJ9WC2+QgobXirBV19XRbK9YUWqYv
	 QTRNcN/iUB2YIUiwz4RxWx2z1wq1QPFc8wySSWloanb4idmiqkuy2Wadzt+rRIrgIn
	 U++90KXMtyVRHNueIneB+FC2QHvFSbTWliEthLHtCrZrO2K1b82NJ1+l6vv3tJwj4K
	 rfnqKpvb7empFEYeTTtUsrYwscCeQ3luhA3v10HIb2BY9KQNyThYmR7zkZZ1VAIBF5
	 22VWT+yQCpD57cZn/eGDInOC/JdM15VMFzPJbyz4AJPZWiXoFVaM24dWAFuEHJGQp4
	 tbVA+TVDwgHJA==
Date: Sun, 2 Aug 2026 03:06:11 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: mdshahid03@gmail.com
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Joshua Crofts
 <joshua.crofts@broadcom.com>, Broadcom internal kernel list
 <bcm-kernel-feedback-list@broadcom.com>, David Lechner
 <dlechner@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Ray Jui <rjui@broadcom.com>, Scott
 Branden <sbranden@broadcom.com>
Subject: Re: [PATCH v4 0/3] iio: adc: bcm_iproc_adc: Simplify probe error
 handling
Message-ID: <20260802030611.363c6aee@jic23-huawei>
In-Reply-To: <20260801090953.61603-1-mdshahid03@gmail.com>
References: <20260801090953.61603-1-mdshahid03@gmail.com>
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

On Sat,  1 Aug 2026 14:39:50 +0530
mdshahid03@gmail.com wrote:

> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> Hi,
> 
> This series simplifies the probe error handling in bcm_iproc_adc.
Hi Mohammad

See comments on v3 + slow down. It wastes your time and that of reviewers
if you post new versions too quickly.

Jonathan

> 
> Changes in v4:
> - Move the redundant iproc_adc_enable() error message removal into the
>   cleanup patch as suggested by Joshua Crofts.
> 
> Mohammad Shahid (3):
>   iio: adc: bcm_iproc_adc: Remove redundant probe error messages
>   iio: adc: bcm_iproc_adc: Introduce local device pointer
>   iio: adc: bcm_iproc_adc: Convert probe error handling to
>     dev_err_probe()
> 
>  drivers/iio/adc/bcm_iproc_adc.c | 54 +++++++++++++++------------------
>  1 file changed, 24 insertions(+), 30 deletions(-)
> 


