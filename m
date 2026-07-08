Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DA1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 01:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PuWChsb4E1cC29lK7Elvpm/ZqbcvbK/u7X5aWPVhl78=; b=zw6RS5peqgeEfsY6/wySxu+ZYm
	/mUTHIjJHZ4/OpCx3vw14uT9t22dOQ+dvlsYRpf1UzFoYDIqik9dHBLZMhkrb5UsK0LXAPzoxfGt5
	wlbzvjeeahc77VeYJortdnAWBWaTIICU8ros0wzuy8lHast0lvjMxVXuzfym0B94F870sAETDifoc
	Jf1IltaITPfHR1PP2QheDaFRHhFIBpdRe1FWIs76TWW0/+ogfIrvXjoRG6e1X+5F4uU0zZTYhaXXb
	D2fWvlUST2ExEm1cjxa+K26aslGAz4Kv1uECPgsuQwiF5AwEKXGOF0+Z/P7BOV94puHqeM9b+sf4W
	+CauUHrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whH33-0000000G6FS-1Qlw;
	Wed, 08 Jul 2026 01:26:01 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whH30-0000000G6Ep-16li;
	Wed, 08 Jul 2026 01:25:59 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gw0ly2RnBzKmyK;
	Wed, 08 Jul 2026 03:25:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adamthiede.com;
	s=MBO0001; t=1783473950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PuWChsb4E1cC29lK7Elvpm/ZqbcvbK/u7X5aWPVhl78=;
	b=Cs8ehjxWZTm6YQKo5RjJY0pYmJZL9egmgNuBv+FZ3+yoXhvLMJN06rjHtXpjrtH0Uwab7y
	1V8Io12Juoe8wIw1Eo0beU78PvwVwSv8k9pGzKo6It81Lnz5i+ruT2dPJw82DV3uOi3esZ
	+dJCVLU5H46DAfqINzQ/A1kTJSdjRJBljEB/PxuJE1gUetMlYNByqdwzE32bgqO6IFncth
	590JilTLXjMtD4yiDt+OKub9gxqI7faWK/LRNmE8TyHyJQc1oP9OD/rXH6Zjl4hRvNUbiW
	QcP4Y0oG10vL6efjqKIcliQYi43ac9q8Jzye3/CqIHHOxth4x/MRkdAMigQNPA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of me@adamthiede.com designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=me@adamthiede.com
Message-ID: <dbc251f2-0c67-4970-a101-c19129055082@adamthiede.com>
Date: Tue, 7 Jul 2026 20:25:41 -0500
MIME-Version: 1.0
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "bisson.gary@gmail.com" <bisson.gary@gmail.com>
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
 <42607fa4-485d-4142-b31c-7bfac71118d2@adamthiede.com> <ajka2220depklK1_@owl5>
 <bac79214-050d-448b-be63-0586d45c807d@adamthiede.com>
 <f0d99b1a-e383-4d14-adb1-4ccab46efddb@leemhuis.info>
 <5baeb90d2c3736df67ad075ede4ac765bfeaed2d.camel@mediatek.com>
 <84233951-ee22-4980-9f17-2af1df51fdbf@leemhuis.info>
 <6fed12a6-0c94-477f-8a2e-466c33ea2e29@collabora.com>
Content-Language: en-US
From: Adam Thiede <me@adamthiede.com>
Autocrypt: addr=me@adamthiede.com; keydata=
 xsBNBF+n+90BCAC2ZRLVcvdXDgfY7EppN05eNor3U7/eeiNCCEIWZkYLhikUEP1ReLGBkXpK
 Pc70hfnKAKkCoth3IwhDty9WXMNU+iLNei4ieb2luW+UqluR6xIUIA+txahMU9YcjVaQTKf/
 yZWO4yl6pfBPCxC2UdPZKBAdGoi5NnE0ABFNbhBETQhhBic533lZn33ByupfI3acECnQdjgQ
 llCUpDbw4I+S/N1iFiEHcbMXH7ZB00e3IYNorZ1E9v7p++5rDY1fQ9gXpieg1vFKwSq1NJWo
 9xx336YjaTUbX0EwrdKd9l8AktA3yRjckaK5TAcwSQaDtHvhpbl4ebvPhtwHh699MroXABEB
 AAHNH0FkYW0gVGhpZWRlIDxtZUBhZGFtdGhpZWRlLmNvbT7CwI4EEwEIADgCGwMFCwkIBwIG
 FQoJCAsCBBYCAwECHgECF4AWIQQtG9pGQ7sz3tf8M/kC7fV9o/vRzgUCZL1HxQAKCRAC7fV9
 o/vRzgyRB/wLqRCvvWhQCMgvzeKvru9wcXquhb77K8H/ByLbfiT8YBuP3lZFVh0IQhgO9Ylk
 fIoOJE4V+jjxyOnO2d9xjGbvAmmR6yT0gfLzSVWqrC4k+V9MWLv43nrNzxt41dvo5j824FAl
 X+zaiRZCdO8Jtxg5Elpiop2SKLi1utX1Z8i6YZh+ccJZlchUBAGUTk+D4UjK7vUcjLWT96ya
 CtdtTfXyw36CvGOPEWfc6++Kkl/5sgej1i7biPYzu/r0vssaQYTXKSrv6Cfa3Maa89ASiTtv
 q4qmhLnJeCrPxWlRAf6LEizeBEkOasYni2u8sp4wBezEq45Ozu45sfPkqLpPolG7zsBNBF+n
 +90BCADBRt+vrToRBEG580n77S99qSEkbKD+oJtCVyovnjMNkg0K9UG68LIeCX/ezngiV1M8
 JISvw5iFOuUFqGX/1hLl9wgt/YpuIrgWOp8XxkotavTCloLDvQmufJPO1L8bnnA+WgP2YgVZ
 5MJTj/t4DI+yQgysEjsH8aurHO2uuqgJE+xK+2dy6Cl/wskuGxObksSPmmFH5PH0Joziwrtl
 61ouLE2XwKbkMgIGEKkbFgbfwz3/QuLZGBni+OOtLzXeZ9wNTW/AHUPy6S9U4F+5z6/09fVT
 tTH0cvrgAGjbASlYx2VqGONXAsxCfjulq6ryJBFlPLp949c/JTTgOojukCSbABEBAAHCwHYE
 GAEIACACGwwWIQQtG9pGQ7sz3tf8M/kC7fV9o/vRzgUCZL1H0gAKCRAC7fV9o/vRzlamCACs
 vHw+0heTm+BfC3S8DUST6889gidIIwdqBep1ByzetCph7Bq8Y8BlT5YTX0u/bSKkxCzFgeTm
 vC341Q09ST2XjLAl1ZTdzGhH9gcgYyOw34pr5fPQRJLB392mPzD8YReRzciNbhWzj+DLgeVe
 ouyfGajd6jDjkf4FEq+trQLGZhpfsKn3JnDbzBUs945D50l/vz9q/QN3qZO+H4F6g8ZeMnqo
 FOEFN26xVtdEDr+0DNFsbgKmEzs675kdAY78ZZdbEetX/FSknxJ+FK1ZW3J7Yswwulj34AXP
 LB49Mk8Ot7fo6mdt0DkV11JS9LmKxKvpY+KTlrKG+i7pVCSZvVUx
In-Reply-To: <6fed12a6-0c94-477f-8a2e-466c33ea2e29@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4gw0ly2RnBzKmyK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_182558_472725_EB5A1E2E 
X-CRM114-Status: GOOD (  30.08  )
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

On 7/7/26 05:38, AngeloGioacchino Del Regno wrote:
> On 7/7/26 10:51, Thorsten Leemhuis wrote:
>> On 7/7/26 04:20, CK Hu (胡俊光) wrote:
>>> On Mon, 2026-07-06 at 12:16 +0200, Thorsten Leemhuis wrote:
>>>> On 6/22/26 15:23, Adam Thiede wrote:
>>>>> On 6/22/26 06:22, Gary Bisson wrote:
>>>>>> On Thu, Jun 18, 2026 at 04:06:28PM -0500, Adam Thiede wrote:
>>>>>>> On 1/20/26 05:36, Gary Bisson wrote:
>>>>>>>> Some bridges, such as the TI SN65DSI83, require the HS clock to be
>>>>>>>> running in order to lock its PLL during its own pre-enable 
>>>>>>>> function.
>>>>>>>>
>>>>>>>> Without this change, the bridge gives the following error:
>>>>>>>> sn65dsi83 14-002c: failed to lock PLL, ret=-110
>>>>>>>> sn65dsi83 14-002c: Unexpected link status 0x01
>>>>>>>> sn65dsi83 14-002c: reset the pipe
>>>>>>>> [...]
>>>>>>>
>>>>>>> This commit was part of 7.1 and caused a problem for me.
>>>>>>> I'm running postmarketOS (basically Alpine Linux) on a Lenovo C330
>>>>>>> chromebook with a Mediatek MT8173 processor.
>>>>>>> The problem: when the display on my laptop powers off (via 
>>>>>>> suspend or
>>>>>>> idle,
>>>>>>> like xset dpms off) the picture does not come back when the display
>>>>>>> powers
>>>>>>> back on (from resume). The display backlight comes on and 
>>>>>>> brightness is
>>>>>>> adjustable but there is no picture. The only fix is to reboot.
>>>>>>>
>>>>>>> Reverting this commit and applying it as a patch on top of 7.1
>>>>>>> addresses the
>>>>>>> issue for me.
>>>>>>>
>>>>>>> You can view the config I'm using here:
>>>>>>> https://urldefense.com/v3/__https://gitlab.postmarketos.org/ 
>>>>>>> postmarketOS/pmaports/-/__;!!CTRNKA9wMg0ARbw! 
>>>>>>> jrsPDtSEUdaINzLlq92Li8gmsEBkTOxZ6WUzNHjvIN6CyOJjHiHkNSOhIRPXFTLPlaYlxU2uvryVkwjUAN9bmax5$
>>>>>>> merge_requests/8819
>>>>>>>
>>>>>>> Is there any sort of testing or other debugging info I can 
>>>>>>> provide to
>>>>>>> help
>>>>>>> address this issue?
>>>>>>
>>>>>> Thanks for reporting the issue, could you share some logs? Is the 
>>>>>> driver
>>>>>> saying anything during resume? Also, what type of panel is used on 
>>>>>> that
>>>>>> chromebook?
>>>>>
>>>>> The curious thing is that there are no real logs in dmesg or /var/log/
>>>>> messages about this. This picture just fails to come back. If there 
>>>>> are
>>>>> some kernel params I can set to get deeper logging, that would 
>>>>> help, but
>>>>> I'm not aware of any.
>>>>>
>>>>> I think the panel is a "BOE NV116WHM-T00" - I used this command to get
>>>>> info: cat /sys/class/drm/card0-eDP-1/edid | edid-decode
>>>>>
>>>>> Output: https://urldefense.com/v3/__https://termbin.com/8nbd__;!! 
>>>>> CTRNKA9wMg0ARbw! 
>>>>> jrsPDtSEUdaINzLlq92Li8gmsEBkTOxZ6WUzNHjvIN6CyOJjHiHkNSOhIRPXFTLPlaYlxU2uvryVkwjUAJooSyqL$
>>>>
>>>> This looked stalled. If I'm mistaken here, please let me known; but if
>>>> no solution is in sight, should we maybe just revert the change until a
>>>> proper was found?
>>>
>>> It's welcome anyone to provide a revert patch,
>>> but I would still wait for the fixup patch until 7.2-rc4.
>>> If no fixup patch exist, then apply the revert patch.
>>  From my understanding of things the position in the devel cycle doesn't
>> matter much in a case like this. To quote Linus statements from
>> https://www.kernel.org/doc/html/latest/process/handling- 
>> regressions.html#on-how-quickly-regressions-should-be-fixed
>>
>> """
>>  From 2026-01-22:
>>
>>   But a user complaining should basically result in an immediate fix -
>>   possibly a "revert and rethink".
>>
>> With a later clarification on 2026-01-28:
>>
>>   It's also worth noting that "immediate" obviously doesn't mean "right
>>   this *second* when the problem has been reported".
>>
>>   But if it's a regression with a known commit that caused it, I think
>>   the rule of thumb should generally be "within a week", preferably
>>   before the next rc.
>> """
>>
>> Adam reported the problem about three weeks ago, so we are way past the
>> "rule of thumb" timeframe Linus set.
>>
>> Ciao, Thorsten
> 
> This is a kind of odd situation here. The fix from Adam is actually 
> correct, as in,
> the SN65DSI83 bridge gets broken without...
> 
> ....but then, there's some more oddness going on: I tried to reproduce 
> this on my
> MT8173 Elm device, but there I can resume the system just fine, and the 
> display is
> up and running like normal?
> 
> I'm not sure what to advice here at this point - just adding some info.
> 
> Cheers,
> Angelo
Angelo, would you mind sharing your config, and the details of what 
you're running? It might be a configuration difference.
Thanks!

