Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29167E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 10:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1N7xFiNje9aCYN3xxdLskuws49Dt23SKU+L9bCwh3w=; b=4l9iR8IF6QAI1M2Ysg0uK4rTLp
	TBhRAbvBJs9FR1W+eKfRHX27oTQj/Q1/ImMPFfVUij8b0sClyB5z8pKV1Rs/3U85HEdOKhwZuCmup
	GVkZu7LOx1HglixGEpEt+/8PWeFHSF0uycDo5TdXDkpGnrfQg48FKgvCqbYSgDMjVCLzfOarcqB6G
	Mmt46nraswJ4QQlqISZntHyu1vi4f9i4Jg7/PqIetQLPgKHfC0bj6eXvfdCvjY4Z9HUTj7VIPNSdZ
	K/s+ZWSzjlwwk+zXu5SjhOPdXbW076CJpH2LtQy0m6SNkcBiaRkD7b2tBeGTRkSTi6Xcb6Lehoibh
	a26EnF1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeZ8-00000008AFl-18Sh;
	Tue, 14 Jan 2025 10:54:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeXq-000000089wa-48gM;
	Tue, 14 Jan 2025 10:53:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736851993;
	bh=VFBTkgvf44it03ebVdBglu18EVaUx1do0GtbExZwx4U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iDFd4VGCE5hZVZcE9/t6wovrVgJmwqegOxRghxqZTJpSB6vfyw+q0+HJvVg7zeZhY
	 5/iYq1kVtMcg5RFmGSwAlyKyG5YIrdY4bvO1d0wxW3LGeKunPvStLONg3+Oc3grqnt
	 yzKFSB8km/RuDvhV02jzlTJTRLdL+/7QCSSA7xZ8sMkIdffd/VgRF9lzhGdmc4Km4e
	 6Nh/1ME5t0ouwDlVcbD4HhUyu46oHBYOcFK3I8J4uJbeG67FkhHQYw0x3CDT1KJksT
	 jT/12vJZRkkM1gUmPQgS8j5YXkY8uMf9SHcJXC0Mn7uyJRT1CWY2CY+pcEBMXoQDS+
	 VYDXKmupSmVCQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B832717E0DB7;
	Tue, 14 Jan 2025 11:53:12 +0100 (CET)
Message-ID: <49b100ae-9b81-404d-b64c-93c60baa859f@collabora.com>
Date: Tue, 14 Jan 2025 11:53:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rtc: mt6359: fix year issue
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com>
 <20250109-enable-rtc-v1-2-e8223bf55bb8@baylibre.com>
 <202501091546387cff95fd@mail.local>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <202501091546387cff95fd@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_025315_190083_34A9207C 
X-CRM114-Status: GOOD (  19.51  )
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

Il 09/01/25 16:46, Alexandre Belloni ha scritto:
> On 09/01/2025 16:29:52+0100, Alexandre Mergnat wrote:
>> Removing the RTC_MIN_YEAR_OFFSET addition and subtraction has
>> introduced a regression.
>>
>> ~# hwclock -r --verbose
>> hwclock from util-linux 2.37.4
>> System Time: 1262312013.143552
>> Trying to open: /dev/rtc0
>> Using the rtc interface to the clock.
>> Assuming hardware clock is kept in UTC time.
>> Waiting for clock tick...
>> hwclock: select() to /dev/rtc0 to wait for clock tick timed out
>> ...synchronization failed
>>
>> Bring back the RTC_MIN_YEAR_OFFSET to fix the RTC.
>>
> 
> NAK, you'd have to investigate a bit more, I want to get rid of the
> RTC_MIN_YEAR_OFFSET insanity.
> 

If literally all currently supported MediaTek PMICs RTC are working fine (and
it's not just one), but the one that is introduced here has issues, clearly
the problem is *not* about the min_year_offset not being there, I'd say!

Btw:
"hwclock: select() to /dev/rtc0 to wait for clock tick timed out"
...is the WRTGR write failing? :-)

And no, Alexandre M, don't trust the regmap_read_poll_timeout() to return an
error, I'm not sure that the CBUSY gets set to zero for *literally all* failures...

In particular.... some RTCs are *locked* and need to be *unlocked*, and in that
case I'm not sure if the write just goes through but gets ignored or if CBUSY
stays set.

Anyway, check the RTC_PROT register for the unlocking mechanism :-)

Cheers,
Angelo

>> Fixes: 34bbdc12d04e ("rtc: mt6359: Add RTC hardware range and add support for start-year")
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   drivers/rtc/rtc-mt6397.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
>> index 55e75712edd4..9930b6bdb6ca 100644
>> --- a/drivers/rtc/rtc-mt6397.c
>> +++ b/drivers/rtc/rtc-mt6397.c
>> @@ -96,6 +96,12 @@ static int mtk_rtc_read_time(struct device *dev, struct rtc_time *tm)
>>   			goto exit;
>>   	} while (sec < tm->tm_sec);
>>   
>> +	/* HW register use 7 bits to store year data, minus
>> +	 * RTC_MIN_YEAR_OFFSET before write year data to register, and plus
>> +	 * RTC_MIN_YEAR_OFFSET back after read year from register
>> +	 */
>> +	tm->tm_year += RTC_MIN_YEAR_OFFSET;
>> +
>>   	/* HW register start mon/wday from one, but tm_mon/tm_wday start from zero. */
>>   	tm->tm_mon--;
>>   	tm->tm_wday--;
>> @@ -110,6 +116,7 @@ static int mtk_rtc_set_time(struct device *dev, struct rtc_time *tm)
>>   	int ret;
>>   	u16 data[RTC_OFFSET_COUNT];
>>   
>> +	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
>>   	tm->tm_mon++;
>>   	tm->tm_wday++;
>>   
>> @@ -167,6 +174,7 @@ static int mtk_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
>>   	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_AL_MTH_MASK;
>>   	tm->tm_year = data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK;
>>   
>> +	tm->tm_year += RTC_MIN_YEAR_OFFSET;
>>   	tm->tm_mon--;
>>   
>>   	return 0;
>> @@ -182,6 +190,7 @@ static int mtk_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
>>   	int ret;
>>   	u16 data[RTC_OFFSET_COUNT];
>>   
>> +	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
>>   	tm->tm_mon++;
>>   
>>   	mutex_lock(&rtc->lock);
>>
>> -- 
>> 2.25.1
>>
> 



