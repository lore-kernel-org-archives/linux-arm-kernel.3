Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11A6CE8D68
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 18:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IcyJn1tkb82n/VdxROnhkF76zhV/W1b00Lj77nCarw0=; b=JfHd5MX4HVuriuwv9fc100q7MB
	0TLyEydKAGUUZ+PwR+trK404K1OAvSZ5a6ky2gCAgPK5D+WMlfSpoR0zOH+6cVXzdeLR1HohXDMPm
	Aq3qu0VgWn7nwEG8/zmNWjvDNPoQkNE09qmprJGYdZvlIzWBjiYrnX+A76AyggBO652qBwXl84PmD
	riqT4Y1PiNpoTfWs60uJ/mDqdfzWOC6ywKIR8cXG92p0Rxs+ATWfxsPktVkyDAdqtL50PKJCJNBWf
	UzJyCTVE89Sx9iTadDOqp368WU9Av7doSE5HqcGbgTDBO2EpfcrvCh50uIRo9bDfvH9+VFrUOMcVu
	C4Xh+a4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyAY-0000000CvV6-1ISR;
	Fri, 14 Nov 2025 18:05:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyAV-0000000CvUV-1Y6U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 18:05:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5291A1063;
	Fri, 14 Nov 2025 10:04:58 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D3E43F5A1;
	Fri, 14 Nov 2025 10:05:05 -0800 (PST)
Date: Fri, 14 Nov 2025 18:05:03 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 13/13] coresight: docs: Document etm4x timestamp
 interval option
Message-ID: <20251114180503.GM3568724@e132581.arm.com>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-13-165ba21401dc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-james-cs-syncfreq-v4-13-165ba21401dc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_100507_445934_D33296A4 
X-CRM114-Status: GOOD (  21.42  )
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

On Wed, Nov 12, 2025 at 03:22:19PM +0000, James Clark wrote:
> Document how the new field is used, maximum value and the interaction
> with SYNC timestamps.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  Documentation/trace/coresight/coresight.rst | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
> index 806699871b80..80b5ed09d69b 100644
> --- a/Documentation/trace/coresight/coresight.rst
> +++ b/Documentation/trace/coresight/coresight.rst
> @@ -613,8 +613,19 @@ They are also listed in the folder /sys/bus/event_source/devices/cs_etm/format/
>       - Session local version of the system wide setting: :ref:`ETM_MODE_RETURNSTACK
>         <coresight-return-stack>`
>     * - timestamp
> -     - Session local version of the system wide setting: :ref:`ETMv4_MODE_TIMESTAMP
> -       <coresight-timestamp>`
> +     - Controls generation and interval of timestamps.
> +
> +       0 = off, 1 = maximum interval .. 15 = minimum interval.

I am struggling to understand the "maximum" and "minimum" usage here.

Seems to me, you are saying:

    1 = maximum frequency .. 15 = minimum frequency

> +
> +       Values 1 - 14 use a counter that decrements every cycle to generate a
> +       timestamp on underflow. The reload value for the counter is 2 raised to
> +       the power of timestamp interval - 1. If the value is 1 then the reload
> +       value is 1, if the value is 11 then the reload value is 1024 etc.

I saw your replying to Randy, yeah, the formula would be much clear.

> +
> +       Setting the minimum interval (15) will disable the counter generated
> +       timestamps, freeing the counter resource, leaving only ones emitted when
> +       a SYNC packet is generated for every 4096 bytes of trace.

"every 4096 bytes" is not always true.

Isn't this defined in TRCSYNCPR.PERIOD?  Maybe just say "... for every
period of trace defined in TRCSYNCPR.PERIOD", or even more general
"... for every period of trace".

Thanks,
Leo

> +
>     * - cc_threshold
>       - Cycle count threshold value. If nothing is provided here or the provided value is 0, then the
>         default value i.e 0x100 will be used. If provided value is less than minimum cycles threshold
> 
> -- 
> 2.34.1
> 

