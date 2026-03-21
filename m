Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512D31094486
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 15:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sG4XhuqDJEdIQMND5WpkEc5bLbq0ERYW/OUxAG8RzSw=; b=M93ce0WCJE8PsFk1wM3Rj20Pix
	qpMu2AWkzGIypR+y4xBibjHHrJIo5hVYYUNBeMtHk2kmYbZ2AciYIlLt6rFf9rhgP79w6DVGOdfyK
	k2kArTTZFeYe1REeT+C2wZ3eqKJmaJKHXXqQs4rcP4O+faBZ6GrOrLSWRcaucgwW20wt+ZUqqaUyi
	BZMldgPcze4i8tjf46Y8mSnPGbkTDvGE54/FyoYPxsNKIBfQdZ9rkeONswe016tZVhOPfjZ+zi8o3
	Fr5td9H7I+eFVSHTB0ax+IokCJ/DDjbTRXx/JzsyGzokgOixJfotq8siAuvCAs3Jr1eubB5Lr7UR8
	HsFFM7qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ybz-0000000EcCx-3gqc;
	Sat, 21 Mar 2026 15:51:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3yby-0000000EcCn-1P19
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 15:51:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F1EA60097;
	Sat, 21 Mar 2026 15:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C045C19421;
	Sat, 21 Mar 2026 15:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774108297;
	bh=iJK6gXRLy8snWp9xWdLSHDh/M81apV4w9OBDnP6so3c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=S615ZWhJmxbdpU+bgacRtU8dgRb16UnPmsyiRB3L6XZW+D+RcW/f/dzvmE92oVsXX
	 do7A2ayfRyx3Gx2wPKf31th8IWvMlFRWxVAhgzm8t2cYvWYEg1Pe5kQZVY3Sfd4Iuq
	 9fwlxfE9ycpiUsNH2c4xej/TemgNxyF+fctZdo35/e8YaGAbKOCobDHUymeNrfykPc
	 SJ5ZD23GsrUVCNhXe7K1tVkg7HrXSmETfmXQWi1eTU/ZLBxoSLPYxPjQH5iAZjT/JC
	 mAHEQOoLvWi07QJYHamGlARrG2vRz6P0MP6FVjMLXL68o8a+fiJGHB3t7n5nChdg4o
	 6RHej1iQmb4dg==
Date: Sat, 21 Mar 2026 15:51:27 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, morris_mao@aspeedtech.com
Subject: Re: [PATCH v3 4/4] iio: adc: aspeed: Reserve battery sensing
 channel for on-demand use
Message-ID: <20260321155127.3e63fa47@jic23-huawei>
In-Reply-To: <ab0ifBMNuY4BwqA5@ashevche-desk.local>
References: <20260320-adc-v3-0-bc0eac04ef7c@aspeedtech.com>
	<20260320-adc-v3-4-bc0eac04ef7c@aspeedtech.com>
	<ab0ifBMNuY4BwqA5@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-pc-linux-gnu)
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

On Fri, 20 Mar 2026 12:33:32 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Fri, Mar 20, 2026 at 01:46:38PM +0800, Billy Tsai wrote:
> > For controllers with battery sensing capability (AST2600/AST2700), the
> > last channel uses a different circuit design optimized for battery
> > voltage measurement. This channel should not be enabled by default
> > along with other channels to avoid potential interference and power
> > efficiency issues.
> > This ensures optimal power efficiency for normal ADC operations while
> > maintaining full functionality when battery sensing is needed.  
> 
> 
> ...
> 
> > +			/*
> > +			 * After enable a new channel need to wait some time for ADC stable  
> 
> Missed period at the end. And you probably wanted to say
> "...for ADC to stabilize."
Tweaked and tidied up line wrap.

Series applied to the togreg branch of iio.git.

thanks,

Jonathan

> 
> > +			 * Experiment result is 1ms.
> > +			 */
> > +			fsleep(1000);
> > +		}  
> 


