Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548D4CD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 05:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3B5y+sYm5sP4UrSKiyKYVoarVxgUD9FR3ci7tWNg9ZI=; b=pJ2ZZ8ZwWOHsix99Nj/2ZGdM5z
	28Mr04cKPOKCgkDq+ilYVEDOglD+s0lqKIMETY4IDngdTT3n4XjieC6qXlfXwzhWin34lINs0vJsg
	rQQ6HW7Q9F4sKCe1vhZ1mGGcOQ9XIW57jZfETCHxCXmuQ3lahcHNRd5Pm2EvzzaLNG4k68BTdame8
	6Zt05oExXRrAAQZhuCHhOj8RruqB6D/8ttlNbtf2M4K3Jv+hBS42h7UtndYHwnU2QaMSzfAEL+XDE
	6oalh1eDD+f86ejMkZxNSYfOKPAUPFTQkmIuvEWeeX2PzHYtn/Po/oEjUXWv9yCzDZS0pideTd6b2
	Lk2IcJPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJlwt-0000000BZrt-3Ic6;
	Fri, 14 Nov 2025 05:02:15 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJlwr-0000000BZrS-3zdC;
	Fri, 14 Nov 2025 05:02:13 +0000
Message-ID: <0eb1a2b7-8064-4ac5-bcf8-b4898a8b5ac7@infradead.org>
Date: Thu, 13 Nov 2025 21:02:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] coresight: docs: Document etm4x timestamp
 interval option
To: James Clark <james.clark@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-13-165ba21401dc@linaro.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251112-james-cs-syncfreq-v4-13-165ba21401dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
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



On 11/12/25 7:22 AM, James Clark wrote:
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
> +
> +       Values 1 - 14 use a counter that decrements every cycle to generate a
> +       timestamp on underflow. The reload value for the counter is 2 raised to
> +       the power of timestamp interval - 1. If the value is 1 then the reload
> +       value is 1, if the value is 11 then the reload value is 1024 etc.

	  value = 11: 2^11-1 = 2047

Maybe add some parens?


-- 
~Randy


