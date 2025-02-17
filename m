Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C50C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 12:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/ZhgPBjClgEl9+b+IC1PjnWgyy3zDmTVNq6IYfIaPY=; b=pTOwA4Kf5ot9Vbk1MuERwJiX/X
	h1t/QY3YYI+h/AcFF3PjwARN0MDEndgcO6SILO7TQij5qc3QJJNMqDPatEcdG1GKz6nxHJ3BAVg3Y
	gRf+W9L0395zsMaXT5CglP0Ui+XmmGTtrgZo4mwEd5IQQCKRrYOW/9QXH70wZhq3cEtA+1wsbAn8X
	bSHA2emOnYYc0TBziHBfSqe+sdAfQKkkf0bITtdZXYFSHQxCZyFLkoRIh77Ezb7+G9xeSJlt0xI8M
	cG0DlyB/NZ3w5oFK9cJzzgLvalKgCEPzH917DFK5CD2ba1gsyewFTiaXqVqsoYAVkwXfnxjgr0RAT
	OsAWDcMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0GU-00000004TCD-1Yms;
	Mon, 17 Feb 2025 12:30:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzpE-00000004P9X-2kF3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 12:02:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 534711692;
	Mon, 17 Feb 2025 04:02:28 -0800 (PST)
Received: from [10.1.35.42] (e127648.arm.com [10.1.35.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DE173F5A1;
	Mon, 17 Feb 2025 04:02:06 -0800 (PST)
Message-ID: <3e79d92a-6ec9-4c7a-a836-1306678c2bef@arm.com>
Date: Mon, 17 Feb 2025 12:02:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: sdhci-esdhc-imx: improve imx8mq emmc/sd read
 performance
To: Lucas Stach <l.stach@pengutronix.de>, ziniu.wang_1@nxp.com,
 adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc: imx@lists.linux.dev, s32@nxp.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, haibo.chen@nxp.com, kernel@pengutronix.de,
 festevam@gmail.com, linux-arm-kernel@lists.infradead.org
References: <20250217110623.2383142-1-ziniu.wang_1@nxp.com>
 <ab721b4a96495516f5149e91f3e4764014e39ba6.camel@pengutronix.de>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <ab721b4a96495516f5149e91f3e4764014e39ba6.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_040212_741392_1010D7E8 
X-CRM114-Status: GOOD (  12.28  )
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

On 2/17/25 11:58, Lucas Stach wrote:
> Hi Luke,
> 
> Am Montag, dem 17.02.2025 um 19:06 +0800 schrieb ziniu.wang_1@nxp.com:
>> From: Luke Wang <ziniu.wang_1@nxp.com>
>>
>> Compared with kernel 6.1, imx8mq eMMC/SD read performance drops by about
>> 30% with kernel 6.6.
>>
>> The eMMC/SD read thread will be put to sleep until the hardware completes
>> data transfer. Normally, the read thread will be woken up immediately
>> when the data transfer is completed. However, due to a known ic bug, if
>> imx8mq is in cpuidle, it will take a long time (about 500us) to exit
>> cpuidle. As a result, the read thread cannot immediately read the next
>> data block, affecting the read performance.
>>
> Is this really a problem with the upstream kernel? i.MX8MQ upstream
> does not use the deeper PSCI idle states, but only uses WFI, so I doubt
> that upstream is affected by this issue.
> 
> Regards,
> Lucas

Furthermore if that were to be the case the correct solution would probably
to have that reflected in the dts, too?


