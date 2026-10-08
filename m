Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674FECA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 12:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O691HEb1i0PbxPa/8NUD4nwZxk8xL+VfyRsy8lod+UA=; b=MKfDLB9esmtC0sjRu3kUJTRQvc
	rby5ymo7wsrAs4gREYda0+0SLr/zTlilgVQwH3uh1ri/MnEcAUiG3uv1isauOQfaoIRxzwrzGDrb/
	yLO0SrBf7ATW8Bu1f5H1x5ew+cECGzJSMrYCzo0DZsoCntG4/A0cFgIaT3q4qN5DYDOcaWqstd5S/
	1uHOD99nzu5E5yV0G/FRV/BF9h/A41emzcZ2m93d+wLWJhh3Rvsm8Lycuqg3ze1u1m8gwnobUY4pP
	K5bXdjzGPMIq1vFKsO2Aw9g23t4EM17RPCIxav4kb1kkr2L4sBCWFoca3JBOqM0L77PhtnILjmsRm
	iqwb2Jhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnC2-00000004LFk-3KKe;
	Thu, 08 Oct 2026 12:25:50 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnBz-00000004LEO-15Lx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 12:25:49 +0000
X-QQ-mid: esmtpgz12t1791462286t3d3cebb7
X-QQ-Originating-IP: dntKYlK6rW/Wxi0Fnkt8GxWBxdeEbJ3cwn8ue03XfWU=
Received: from [192.168.21.56] ( [111.8.45.130])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Oct 2026 20:24:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13193396850255337370
EX-QQ-RecipientCnt: 10
Message-ID: <5C3461E42FDA1F15+836b6b0d-e24f-47e2-bf04-59d02ca35a1b@kylinsec.com.cn>
Date: Thu, 8 Oct 2026 20:24:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: ftrtc010: fix negative offset handling and smatch
 warning
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Dan Carpenter <error27@gmail.com>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Deng Yingchao <dengyingchao@kylinsec.com.cn>,
 Qin Yungao <qinyungao@kylinsec.com.cn>, Luo Qiu <luoqiu@kylinsec.com.cn>
References: <0C8AEB5636132B0C+20261008113732.581825-1-liudalin@kylinsec.com.cn>
 <20261008115913bfd12cb4@mail.local>
Content-Language: en-US
From: liudalin <liudalin@kylinsec.com.cn>
In-Reply-To: <20261008115913bfd12cb4@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M3ziZXKDk+iOECg/2pUDzdLQDWA0HgClOpH5zmO/sr1ExRZq5zw+Orat
	o3Du0leuo3jrgq8zCMg8ZuK0g00jQVJ1JhDRk2MaIuuxMj8TP8Yt4sK5ZFm4FfOcNFUd9fa
	Rmtctit4atjCCma3muISqnJllepfxRO0Izmw7Kn0awXJWQwQOX2s7oEf8a8YM2grPiwvtGo
	BTyee9Ub9FEwkewYYO05sMzfT0cZVqcSHOrWeQfGYWM6XXtNAfC+vwFIwDxzgg3J8daUECk
	6yZt5Rw3Ze2jrn2OvkApEj30qVEgRpy5iUNefTjdTG1J+PR1nLeq6AyjowS1DXmfZc8xmZV
	05cXXk3GvZicH7ReFf0z72wu45QITxckBHYxz29DGPBFGsNfXig7hW9jcDuo4oZG409v1iN
	OhLK51eUsgaS3xsfH7LMvX5VVG4KgYSk3rt3k/JPn6t9qdDL05zfwZrnxg/qLYl/tnrsvOU
	ifOZpMGDGVSN+cWBoHSRXkKTOTIwIRnyEDcaqhMYhKgHYd5TYRwI7VAxcbVCdLFrIznam28
	cglMuM7YmRW5HUCksQhYNX4C8aymylcF85H3EK+G/Vzd/GjkxPXdDwtG2+iPra3AY4N0WZ0
	kuv4mEI8T5zZKlJo9g/HYLu3JNG48J61VlGC3bwkAlySAGEKt02d2YSMweiRwlKxH5HEoXg
	9v8JW5LLOz0lty8bvu+CJuQ/cko7IsDjyP2o5lQgP55a/BsDnnu6E9GrbgEv0Go8ku5X5S4
	alh0TfWAMmly5S+r2736/j3ixuyUAA2Xepx/VVkx5SPtIv4OdijhUsPgIUPfsRuV0q0dQ8v
	DQ8/xeWoHPqN7cP/YN8zvTTDxgwR6otBYQTX6gaLjqd67fltXNaGW1KZvuuOkSLr55hEOtW
	fxs8kwe0bH1HhO9yPoNeM1yASDOnKPEusO5PfGF2ItQP/qUSwbTW3iX9TS2S0mXq7lAVxzg
	X6/6dYfsMqBNYNLl2mui/ni8QSGEKfCQGzTXFoG3+zykTBMo9zB7OqWMkpSCiijOd82YpmY
	F+hoqBU9UDKFnDfXsuvziw2vkzW4FzMJhF+oQOKFChMY78FWOzie7JvmhEmnxM8lvGxarnC
	A==
X-QQ-XMRINFO: NS+P29fieYNwYjjdscdc6tBlmgA8e/Wkkg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_052547_694435_25B1C8C3 
X-CRM114-Status: GOOD (  11.81  )
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


在 2026/10/8 19:59, Alexandre Belloni 写道:
> On 08/10/2026 19:37:32+0800, Liu Dalin wrote:
>> A prior attempted to fix the 32-bit arithmetic overflow by turning
>> the implicit u32-to-timeu64_t cast into an explicit one. However,
>> all calculations still happen in u32, inheriting the existing
>> negative offset sign-extension bug, and the explicit cast triggers
>> smatch "cast after binop" warning.
>>
> AI is lying to you, offset will never ever be negative.

Agreed, Thanks for review!!

with rtc_dev->range_min = (u64)days * 86400 + hour * 3600 + min * 60 + sec;
         rtc_dev->range_max = U32_MAX + rtc_dev->range_min;

offset will never ever be negative.

>
>> The FTRTC010 RECORD register stores a signed 32-bit two's complement
>> offset exposed through readl() as a u32. Casting the whole u32
>> expression result to timeu64_t performs zero extension, so negative
>> offsets become huge positive values.
>>
>> Fix it by casting offset to s32 first to correctly interpret the
>> two's complement sign, then promote all operands to timeu64_t so all
>> calculations are done in 64-bit space. days/hour/min/sec are
>> non-negative hardware counters, so promoting them directly to
>> timeu64_t is safe.
>>
>> Fixes: 1d61d2592c1f ("rtc: gemini/ftrtc010: rename driver and symbols")
>>
>> Signed-off-by: Liu Dalin <liudalin@kylinsec.com.cn>
>> ---
>>   drivers/rtc/rtc-ftrtc010.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/rtc/rtc-ftrtc010.c b/drivers/rtc/rtc-ftrtc010.c
>> index b29c96be40f4..65fe1e872239 100644
>> --- a/drivers/rtc/rtc-ftrtc010.c
>> +++ b/drivers/rtc/rtc-ftrtc010.c
>> @@ -72,7 +72,8 @@ static int ftrtc010_rtc_read_time(struct device *dev, struct rtc_time *tm)
>>   	days = readl(rtc->rtc_base + FTRTC010_RTC_DAYS);
>>   	offset = readl(rtc->rtc_base + FTRTC010_RTC_RECORD);
>>   
>> -	time = (timeu64_t)(offset + days * 86400 + hour * 3600 + min * 60 + sec);
>> +	time = (timeu64_t)(s32)offset + (timeu64_t)days * 86400 +
>> +	       (timeu64_t)hour * 3600 + (timeu64_t)min * 60 + (timeu64_t)sec;
>>   
>>   	rtc_time64_to_tm(time, tm);
>>   
>> -- 
>> 2.43.0
>>


