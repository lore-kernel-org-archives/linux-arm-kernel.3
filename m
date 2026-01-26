Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F105D13C3F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 15:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIXpSCNOrp0DWZgyfFktniF0TTCUsb1B5skoWpa2uGI=; b=AxRXYIiAT6oIq3D/GrSU46rgzv
	rd/tBkAIz3aP0h1kFjlUwOJy/6BsB5EGQFXWYCfxyRE7C+IFRdME6JYbr3VjXmOffG2LP5eJ4niQZ
	35iH5wet4zTotmTrgSfpkCn1FzBwOwTVJToMZ+PgTR+/c01BLuKv7iTqOOhMG9CUkSlMpkf05NWn4
	FLWKCZCOuQpmH8FPRdDfWPy3do+nACn5ghgMdJ/RFt1oemDYZot+b7FlL9Dr8y/jNMXhViJo8PQx7
	Aio8JsqqU05y92hkCAklpEoDZVPkXkGI1fl66uPPTgf0k03wDlA3LX6o3Kl4DuuCxebH3tJ4OHAOs
	vZ4J1XZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkOpQ-0000000CnBO-21Qf;
	Mon, 26 Jan 2026 15:48:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkOpO-0000000CnB2-0VRY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 15:48:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C660C339;
	Mon, 26 Jan 2026 07:48:24 -0800 (PST)
Received: from [10.57.68.157] (unknown [10.57.68.157])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1C703F73F;
	Mon, 26 Jan 2026 07:48:29 -0800 (PST)
Message-ID: <062c51c2-082d-4771-83df-3e5bfa90927d@arm.com>
Date: Mon, 26 Jan 2026 15:48:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] coresight: Fix memory leak in
 coresight_alloc_device_name()
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260126-arm_coresight_refactor_dev_register-v2-0-b5a3c0441c15@arm.com>
 <20260126-arm_coresight_refactor_dev_register-v2-1-b5a3c0441c15@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260126-arm_coresight_refactor_dev_register-v2-1-b5a3c0441c15@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_074834_283225_3EDE723D 
X-CRM114-Status: GOOD (  19.12  )
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

Hi Leo

On 26/01/2026 13:52, Leo Yan wrote:
> The memory leak detector reports:
> 
>    echo clear > /sys/kernel/debug/kmemleak
>    modprobe coresight_funnel
>    rmmod coresight_funnel
> 
>    # Scan memory leak and report it
>    echo scan > /sys/kernel/debug/kmemleak
>    cat /sys/kernel/debug/kmemleak
>    unreferenced object 0xffff0008020c7200 (size 64):
>      comm "modprobe", pid 410, jiffies 4295333721
>      hex dump (first 32 bytes):
>        d8 da fe 7e 09 00 ff ff e8 2e ff 7e 09 00 ff ff  ...~.......~....
>        b0 6c ff 7e 09 00 ff ff 30 83 00 7f 09 00 ff ff  .l.~....0.......
>      backtrace (crc 4116a690):
>        kmemleak_alloc+0xd8/0xf8
>        __kmalloc_node_track_caller_noprof+0x2c8/0x6f0
>        krealloc_node_align_noprof+0x13c/0x2c8
>        coresight_alloc_device_name+0xe4/0x158 [coresight]
>        0xffffd327ecef8394
>        0xffffd327ecef85ec
>        amba_probe+0x118/0x1c8
>        really_probe+0xc8/0x3f0
>        __driver_probe_device+0x88/0x190
>        driver_probe_device+0x44/0x120
>        __driver_attach+0x100/0x238
>        bus_for_each_dev+0x84/0xf0
>        driver_attach+0x2c/0x40
>        bus_add_driver+0x128/0x258
>        driver_register+0x64/0x138
>        __amba_driver_register+0x2c/0x48
> 
> Change to use devm_krealloc_array() for allocation fwnode_list so that
> the device model can automatically release the memory when the module
> is unloaded.
> 
> Fixes: 0f5f9b6ba9e1 ("coresight: Use platform agnostic names")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index c660cf8adb1c7cafff8f85e501f056e4e151e372..ed304f292b7b02e89c59053d43f88fbf663cc993 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1546,7 +1546,7 @@ char *coresight_alloc_device_name(struct coresight_dev_list *dict,
>   	if (idx < 0) {
>   		/* Make space for the new entry */
>   		idx = dict->nr_idx;
> -		list = krealloc_array(dict->fwnode_list,
> +		list = devm_krealloc_array(dev, dict->fwnode_list,
>   				      idx + 1, sizeof(*dict->fwnode_list),

This is wrong. This would mean, the array gets released when the "dev" 
goes away and thats not good. This is a per-driver list, not a 
per-device list. Also, please remember that, we need to keep that node alive
when the device goes away, to make sure to allocate the same device name
when if/it comes back.  May be, you could release the  list and array, 
when the "driver" goes away.


Kind regards
Suzuki

>   				      GFP_KERNEL);
>   		if (ZERO_OR_NULL_PTR(list)) {
> 


