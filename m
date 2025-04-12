Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D84C369AE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 13:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+ZEGdaDrlpI7ybcpm99MUkO+O3iggRq0EbqBmFA4zE=; b=or8r7zhqUQn3KobFe5YUzg8Ma6
	33OTaPyQz9+YhsWGGKD/FX/cg+cR1v0RB958IyRiIdP4KrSQIofID6r/KVpdsJeleuwMzCXoVhjY2
	z6sBudNXQTvtRtYultJGLloku5JabkToP7tMBz0YrajSuC9oHmJ+/bkRvGkueOjDLu9ddGCvc3M4N
	9IdWwyB/jwakLE0Z+4Xvozg6bg1vj0hLEM8tl48h1ZTyOj5I3CU1PbPpctx0CGiqj+Sc7QylYobKr
	j72DcGIi+PvkIsgaIL2SrQhhIcWBL1GjIdSvSUTCf953vTM6x6Rt4KV8VujN5xWGVR4IpN7KSJ/6k
	c7JNlTDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3au3-0000000FwUa-3ReI;
	Sat, 12 Apr 2025 13:28:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3asE-0000000FwHD-1pQK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 13:26:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 398CC43CAB;
	Sat, 12 Apr 2025 13:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA9CFC4CEE3;
	Sat, 12 Apr 2025 13:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744464376;
	bh=1ALYRoSS13OMdV42CmJZDGrcuxFhf+AdPHTEVZVQj1w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UmjGC+SVrPZXCioxg+ooNogCzyH8KJb68+7bvldVTrKNG5l078qhhnOxjNOmVb91k
	 KWC0nvj5d66ngb+smsKNsbLLI6suFk2j17tEw1F+20344M4WMjpos0HBXk5LC8UWq1
	 6Fa1YvbZnulVM5cbbkwFvIl5q7w3gPuIKvGSUc2qnlmvO8bvUvxcDzmPeEc4xSrHQx
	 hFeB0lzsJZ+YO9vCUOtRGCDK0eowoCxmxE6LXVxWe4TrUsBUMXSKKuikGS59d006mq
	 u9pckEfFMG8Wu36R7kicT+YPq4KKH77QMtc0Z+R7Pg/cq3ZbvbsKi4B17FODJJB8B4
	 KGGJSot5+EMsA==
Date: Sat, 12 Apr 2025 14:26:06 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Fabrice Gasnier
 <fabrice.gasnier@foss.st.com>, <linux-iio@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] iio: adc: stm32: add oversampling support
Message-ID: <20250412142606.66673634@jic23-huawei>
In-Reply-To: <20250410135836.2091238-1-olivier.moysan@foss.st.com>
References: <20250410135836.2091238-1-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_062618_502816_F31FA04E 
X-CRM114-Status: GOOD (  16.37  )
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

On Thu, 10 Apr 2025 15:58:35 +0200
Olivier Moysan <olivier.moysan@foss.st.com> wrote:

> Add oversampling support for STM32H7, STM32MP15 & STM32MP13.
> STM32F4 ADC has no oversampling feature.
> 
> The current support of the oversampling feature aims at increasing
> the data SNR, without changing the data resolution.
> As the oversampling by itself increases data resolution,
> a right shift is applied to keep initial resolution.
> Only the oversampling ratio corresponding to a power of two are
> supported here, to get a direct link between right shift and
> oversampling ratio. (2exp(n) ratio <=> n right shift)
I rewrapped this description to 75 chars  (which is roughly the maximum
we should see in a commit message).

In general I'd prefer to keep comments in code to 80 char, but in this
particular case I left the formatting you have alone as it was really fiddly
to get it looking nice at a shorter length.

I had applied this but then noticed....

> 
> The oversampling ratio is shared by all channels, whatever channel type.
> (e.g. single ended or differential).
> 
> Oversampling can be configured using IIO ABI:
> - oversampling_ratio_available
> - oversampling_ratio
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
This SoB sequence isn't right.  What was Fabrice's role
in this patch?   Either I'd expect the from to be set to Fabrice
(on basis Olivier was posting some work of Fabrice) or
a Co-developed-by for Fabrice to indicate it was joint work
and Olivier was the one posting it.

