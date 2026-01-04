Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61235C2A06C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 15:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgHCr0IB5zh/cD9wVN0y3DsacG4hHar27s1zwzpwWhE=; b=Fnm55piQ2SnCvb0hmvwvbNDe9s
	Kv5jbEq3wv1IbEIk6yYvvbWloq5iiN5kmxNPTh4KYL/erP696BDZUjJ0EanVXixHgfoQvJhZ/j7Lk
	C3nRyFbfv+t/lma6/2CXU0tMIBhTeFXCxF1s/bvgIhJcHUvu7IE/zJ5UqRWu12DTQKHnHu7RQ7ieD
	64v4FEA9gdy/yL4DbAXaRrHyf1HF3kWrroo5mbRMmNrpv5i4tfzSW1K4HwFWCBZIjsg5Hxor5DXlY
	8b1c3Q9hXAxrGMHl8KneGWlz8JZA86Lht4fJr3HKPD5f5Vs9LZ8ddcbWwatq2mljal+Dn2doG8ATI
	a02CkQ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcPrY-0000000AJKE-18A9;
	Sun, 04 Jan 2026 15:17:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcPrV-0000000AJJQ-14L0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Jan 2026 15:17:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CF5F40A04;
	Sun,  4 Jan 2026 15:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0100C4CEF7;
	Sun,  4 Jan 2026 15:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767539864;
	bh=ilHTz00/ydutL7TWuctBmXtIkpvVMhcUPkVSQeqTSzc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nAUMOJ/eyXqjteFZhyToWEkWmGfYyugqGNZjnrNBCBEwQh6JjcUY6RQoLg5KBADu3
	 sEMqzu7Egr7Ks03o8HMpZNgNwLCbOJlY+Ec3KMA3dEwvgbxgomFHym73MquX6QYnfT
	 I0ktuPK4t0uw//2sNtOmsLhu6d8tfVIlnFE/uhEGXWIcHAR6PUKqfakJh4NchyNdcZ
	 Hw2l+JQ+kKC+tKnwSgbtuIL8PXBOQnwkwtKXsch6xNEq9P0mGvoIYvtsn+7/VD3+in
	 JnnquiiNzYCOwP9jpYxQsejqg/HmIggV9SrWYs87i6Wea6xf6OEt/bQIjPlsRCn1uo
	 A0lLSJUTdNJQg==
Message-ID: <04da9bc6-ebfb-4799-bace-c56a9537282e@kernel.org>
Date: Sun, 4 Jan 2026 16:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] soc: apple: rtkit: Support verison-specific app
 endpoint start
To: Nick Chan <towinchenmi@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
References: <20251223-rtkit-v10-v1-0-12b4783d6403@gmail.com>
 <20251223-rtkit-v10-v1-1-12b4783d6403@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20251223-rtkit-v10-v1-1-12b4783d6403@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_071745_337224_4891816B 
X-CRM114-Status: GOOD (  21.44  )
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

Hi,


On 23.12.25 15:13, Nick Chan wrote:
> Support for protocol versions where app endpoints starts at a
> different endpoint number will be added. Consumer drivers will also
> need to be modified to have them to work with such protocol
> versions.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>   drivers/soc/apple/rtkit-internal.h |  3 ++-
>   drivers/soc/apple/rtkit.c          | 42 +++++++++++++++++++++++++++-----------
>   include/linux/soc/apple/rtkit.h    | 10 +++++++++
>   3 files changed, 42 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/soc/apple/rtkit-internal.h b/drivers/soc/apple/rtkit-internal.h
> index b8d5244678f0100b72173fa9aca80bf9db1b4e5e..52ef7a202120eb8a56c149179389741ec0f5e358 100644
> --- a/drivers/soc/apple/rtkit-internal.h
> +++ b/drivers/soc/apple/rtkit-internal.h

[...]

>   
> +	/*
> +	 * The management endpoint is required to receive the HELLO message
> +	 * and infer the start of app endpoints so assume it is a system
> +	 * endpoint here and update this value when HELLO is received.
> +	 */
> +	rtk->app_ep_start = APPLE_RTKIT_EP_CRASHLOG;

The comment doesn't explain why you set this to APPLE_RTKIT_EP_CRASHLOG.


> +
>   	init_completion(&rtk->epmap_completion);
>   	init_completion(&rtk->iop_pwr_ack_completion);
>   	init_completion(&rtk->ap_pwr_ack_completion);
> @@ -851,6 +860,15 @@ int apple_rtkit_shutdown(struct apple_rtkit *rtk)
>   }
>   EXPORT_SYMBOL_GPL(apple_rtkit_shutdown);
>   
> +u8 apple_rtkit_app_ep_to_ep(struct apple_rtkit *rtk, u8 app_ep)
> +{
> +	if (!apple_rtkit_is_running(rtk))
> +		return 0;

Please don't just silently ignore errors.

> +
> +	return rtk->app_ep_start + app_ep;
> +}
> +EXPORT_SYMBOL_GPL(apple_rtkit_app_ep_to_ep);
> +
>   int apple_rtkit_idle(struct apple_rtkit *rtk)
>   {
>   	int ret;
> diff --git a/include/linux/soc/apple/rtkit.h b/include/linux/soc/apple/rtkit.h
> index 736f530180179bd144cf85eb0f0bd93844d7188a..423cf1022372b124c9b2728445f85a9b3067c707 100644
> --- a/include/linux/soc/apple/rtkit.h
> +++ b/include/linux/soc/apple/rtkit.h
> @@ -172,4 +172,14 @@ int apple_rtkit_send_message(struct apple_rtkit *rtk, u8 ep, u64 message,
>    */
>   int apple_rtkit_poll(struct apple_rtkit *rtk);
>   
> +/*
> + * Convert an endpoint number relative to start of app endpoint to an absolute
> + * endpoint number.


Is this conversion even true for other co-processors that are not SMC or 
does it just work by accident here? Maybe it makes more sense to drop 
this function and decide which endpoint to use in the SMC driver.

The documentation is also a bit confusing, please at least explain what 
"start of app endpoint" means and where/how you would use this function.





Sven


