Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298B7C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 19:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XRyr85wv+Jt7zIzz+tfragSxhfwzZtVzqMybKiCgq0E=; b=s0uxH7UOL+AFQIT5WE9rVwegYo
	XQixEzVwzuP7y8jz0a4NLUuPugmzpOwmZTECPZq90ZIu9EeV7tzn8B0OPxxpypjXiV7WQHuaHqC/w
	OR75jrviB9qXb3n7L2Rs3UWayIhpZpNNzlmYhqw4ADkRYByzB3s7g9owgCobTDWC0N0AmFMTTgq6g
	BwraakUg8QusXcABkypfLMemBZ8lXmF22kSbxAHvKIOdwn7rGgQqYZY8C4QfGc6TooCFW46xQblKh
	7cc75Yo8uCQPBTQHWvdzxUoksejlnij+oP4SrbVfL4DYeglJuU0vUV2bDCWXwXy+lUSOBUn0Ln1wI
	d3HQPlkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMsy-000000057Tq-3qPQ;
	Wed, 26 Feb 2025 19:16:00 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMkc-000000055u5-1qKg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 19:07:23 +0000
Date: Wed, 26 Feb 2025 14:07:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1740596840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XRyr85wv+Jt7zIzz+tfragSxhfwzZtVzqMybKiCgq0E=;
	b=JJk9cBYafeuuqFYmvkxzOTIOX6ShEumbs1jZ6lZY7mK8Pd0v9urG7IjetG7mAsote6mFnI
	kVn5mrO1Ix7c4hbSKWrAl/vCyh9QuMvFVtmkotz6/ed/o0tpHmake+CYbsLOx49WizBhPy
	XTEtoHsjDdSwXJjrcih6oIPZiJxNxrGyWX2/iJep5Z+zlquJQ4mf9P8ZQ5XVBC75fp952K
	M79COiW2UQi+Jbijlk2FgMViuaV7gk9fkHoyHQv7E/1+ZLtrAdAufG1TNxojpW87INiFh5
	dPDdG8A+zl73p54uD/dIE52z0jQ4ntwHHjxv3zyuylQZxh/u+HnHeaCQ3G67xQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 2/4] soc: apple: rtkit: Implement OSLog buffers
 properly
Message-ID: <Z79mYrxWDSpaRPyX@blossom>
References: <20250226-apple-soc-misc-v2-0-c3ec37f9021b@svenpeter.dev>
 <20250226-apple-soc-misc-v2-2-c3ec37f9021b@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250226-apple-soc-misc-v2-2-c3ec37f9021b@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_110722_622793_7048CFD5 
X-CRM114-Status: GOOD (  23.33  )
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Wed , Feb 26, 2025 at 07:00:04PM +0000, Sven Peter via B4 Relay a écrit :
> From: Hector Martin <marcan@marcan.st>
> 
> Apparently nobody can figure out where the old logic came from, but it
> seems like it has never been actually used on any supported firmware to
> this day. OSLog buffers were apparently never requested.
> 
> But starting with 13.3, we actually need this implemented properly for
> MTP (and later AOP) to work, so let's actually do that.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  drivers/soc/apple/rtkit-internal.h |  1 +
>  drivers/soc/apple/rtkit.c          | 56 +++++++++++++++++++++++---------------
>  2 files changed, 35 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/soc/apple/rtkit-internal.h b/drivers/soc/apple/rtkit-internal.h
> index 27c9fa745fd5..b8d5244678f0 100644
> --- a/drivers/soc/apple/rtkit-internal.h
> +++ b/drivers/soc/apple/rtkit-internal.h
> @@ -44,6 +44,7 @@ struct apple_rtkit {
>  
>  	struct apple_rtkit_shmem ioreport_buffer;
>  	struct apple_rtkit_shmem crashlog_buffer;
> +	struct apple_rtkit_shmem oslog_buffer;
>  
>  	struct apple_rtkit_shmem syslog_buffer;
>  	char *syslog_msg_buffer;
> diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
> index be0d08861168..7e7b4f64ab17 100644
> --- a/drivers/soc/apple/rtkit.c
> +++ b/drivers/soc/apple/rtkit.c
> @@ -67,8 +67,9 @@ enum {
>  #define APPLE_RTKIT_SYSLOG_MSG_SIZE  GENMASK_ULL(31, 24)
>  
>  #define APPLE_RTKIT_OSLOG_TYPE GENMASK_ULL(63, 56)
> -#define APPLE_RTKIT_OSLOG_INIT	1
> -#define APPLE_RTKIT_OSLOG_ACK	3
> +#define APPLE_RTKIT_OSLOG_BUFFER_REQUEST 1
> +#define APPLE_RTKIT_OSLOG_SIZE GENMASK_ULL(55, 36)
> +#define APPLE_RTKIT_OSLOG_IOVA GENMASK_ULL(35, 0)
>  
>  #define APPLE_RTKIT_MIN_SUPPORTED_VERSION 11
>  #define APPLE_RTKIT_MAX_SUPPORTED_VERSION 12
> @@ -259,15 +260,21 @@ static int apple_rtkit_common_rx_get_buffer(struct apple_rtkit *rtk,
>  					    struct apple_rtkit_shmem *buffer,
>  					    u8 ep, u64 msg)
>  {
> -	size_t n_4kpages = FIELD_GET(APPLE_RTKIT_BUFFER_REQUEST_SIZE, msg);
>  	u64 reply;
>  	int err;
>  
> +	/* The different size vs. IOVA shifts look odd but are indeed correct this way */
> +	if (ep == APPLE_RTKIT_EP_OSLOG) {
> +		buffer->size = FIELD_GET(APPLE_RTKIT_OSLOG_SIZE, msg);
> +		buffer->iova = FIELD_GET(APPLE_RTKIT_OSLOG_IOVA, msg) << 12;
> +	} else {
> +		buffer->size = FIELD_GET(APPLE_RTKIT_BUFFER_REQUEST_SIZE, msg) << 12;
> +		buffer->iova = FIELD_GET(APPLE_RTKIT_BUFFER_REQUEST_IOVA, msg);
> +	}
> +
>  	buffer->buffer = NULL;
>  	buffer->iomem = NULL;
>  	buffer->is_mapped = false;
> -	buffer->iova = FIELD_GET(APPLE_RTKIT_BUFFER_REQUEST_IOVA, msg);
> -	buffer->size = n_4kpages << 12;
>  
>  	dev_dbg(rtk->dev, "RTKit: buffer request for 0x%zx bytes at %pad\n",
>  		buffer->size, &buffer->iova);
> @@ -292,11 +299,21 @@ static int apple_rtkit_common_rx_get_buffer(struct apple_rtkit *rtk,
>  	}
>  
>  	if (!buffer->is_mapped) {
> -		reply = FIELD_PREP(APPLE_RTKIT_SYSLOG_TYPE,
> -				   APPLE_RTKIT_BUFFER_REQUEST);
> -		reply |= FIELD_PREP(APPLE_RTKIT_BUFFER_REQUEST_SIZE, n_4kpages);
> -		reply |= FIELD_PREP(APPLE_RTKIT_BUFFER_REQUEST_IOVA,
> -				    buffer->iova);
> +		/* oslog uses different fields and needs a shifted IOVA instead of size */
> +		if (ep == APPLE_RTKIT_EP_OSLOG) {
> +			reply = FIELD_PREP(APPLE_RTKIT_OSLOG_TYPE,
> +					   APPLE_RTKIT_OSLOG_BUFFER_REQUEST);
> +			reply |= FIELD_PREP(APPLE_RTKIT_OSLOG_SIZE, buffer->size);
> +			reply |= FIELD_PREP(APPLE_RTKIT_OSLOG_IOVA,
> +					    buffer->iova >> 12);
> +		} else {
> +			reply = FIELD_PREP(APPLE_RTKIT_SYSLOG_TYPE,
> +					   APPLE_RTKIT_BUFFER_REQUEST);
> +			reply |= FIELD_PREP(APPLE_RTKIT_BUFFER_REQUEST_SIZE,
> +					    buffer->size >> 12);
> +			reply |= FIELD_PREP(APPLE_RTKIT_BUFFER_REQUEST_IOVA,
> +					    buffer->iova);
> +		}
>  		apple_rtkit_send_message(rtk, ep, reply, NULL, false);
>  	}
>  
> @@ -494,25 +511,18 @@ static void apple_rtkit_syslog_rx(struct apple_rtkit *rtk, u64 msg)
>  	}
>  }
>  
> -static void apple_rtkit_oslog_rx_init(struct apple_rtkit *rtk, u64 msg)
> -{
> -	u64 ack;
> -
> -	dev_dbg(rtk->dev, "RTKit: oslog init: msg: 0x%llx\n", msg);
> -	ack = FIELD_PREP(APPLE_RTKIT_OSLOG_TYPE, APPLE_RTKIT_OSLOG_ACK);
> -	apple_rtkit_send_message(rtk, APPLE_RTKIT_EP_OSLOG, ack, NULL, false);
> -}
> -
>  static void apple_rtkit_oslog_rx(struct apple_rtkit *rtk, u64 msg)
>  {
>  	u8 type = FIELD_GET(APPLE_RTKIT_OSLOG_TYPE, msg);
>  
>  	switch (type) {
> -	case APPLE_RTKIT_OSLOG_INIT:
> -		apple_rtkit_oslog_rx_init(rtk, msg);
> +	case APPLE_RTKIT_OSLOG_BUFFER_REQUEST:
> +		apple_rtkit_common_rx_get_buffer(rtk, &rtk->oslog_buffer,
> +						 APPLE_RTKIT_EP_OSLOG, msg);
>  		break;
>  	default:
> -		dev_warn(rtk->dev, "RTKit: Unknown oslog message: %llx\n", msg);
> +		dev_warn(rtk->dev, "RTKit: Unknown oslog message: %llx\n",
> +			 msg);
>  	}
>  }
>  
> @@ -729,6 +739,7 @@ int apple_rtkit_reinit(struct apple_rtkit *rtk)
>  
>  	apple_rtkit_free_buffer(rtk, &rtk->ioreport_buffer);
>  	apple_rtkit_free_buffer(rtk, &rtk->crashlog_buffer);
> +	apple_rtkit_free_buffer(rtk, &rtk->oslog_buffer);
>  	apple_rtkit_free_buffer(rtk, &rtk->syslog_buffer);
>  
>  	kfree(rtk->syslog_msg_buffer);
> @@ -916,6 +927,7 @@ void apple_rtkit_free(struct apple_rtkit *rtk)
>  
>  	apple_rtkit_free_buffer(rtk, &rtk->ioreport_buffer);
>  	apple_rtkit_free_buffer(rtk, &rtk->crashlog_buffer);
> +	apple_rtkit_free_buffer(rtk, &rtk->oslog_buffer);
>  	apple_rtkit_free_buffer(rtk, &rtk->syslog_buffer);
>  
>  	kfree(rtk->syslog_msg_buffer);
> 
> -- 
> 2.34.1
> 
> 

