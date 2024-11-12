Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9595ED41D6E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 08:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MXKM1Sqb74I8ZQpKiaye137tCtqvkpww9vx9BtZ+wc=; b=S6tVTdqzxfcsa68zyoM9071JjF
	OEgcotbPc/KBKF3509uGti5nd6lYXbsmK+/CNtUp80mLcQRoBS2r34bEAGKWlB3ns44+NwKxffB7Y
	LwFPHJP86YRHSC9c5+UO9beUpggsiAI3oMveo/p+4PmKfkhksDTtj1tKmXjgkvB7Gtq9yWgkIh1fY
	7sApKcn1deHLz62MF81Azfq8wYxTdSMCSHIFn8bVDDoVpy/bbXGc9dEpd5AyKKXeDEK2q0yGPvCqz
	BC1dWOZaxBHIV/2o978RgKOiakBMrUh2zz10zGRktpilMntB6evwjczCSwYQ3VUyq+wAr/u3IJNf7
	bug7stOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmWK-00000002gcD-1bbR;
	Tue, 12 Nov 2024 08:45:08 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmO3-00000002ene-2f7p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 08:36:37 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-37d495d217bso4929053f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 00:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731400594; x=1732005394; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/MXKM1Sqb74I8ZQpKiaye137tCtqvkpww9vx9BtZ+wc=;
        b=d6x3ezWhB6Agexri1a20I/DMBo/iZApEkGryS4ia2+TW55LV9Ax+6OeWlDSzIKYTuf
         8m3y730Ph5jBVM/zJEUkCMoxexcZJcThDCBaPmmNjsOeUb6cqYiA82Cmzlb/AJ3ha1Gs
         Uzgbs/wDLraR3Ei/P/3SIeY+LxFF7CmJGqgmW/JL+bhEIUm+GfIqpg66Xl+uloKrTRcy
         4KaSzuDZ91AJGtgF5fO9rF3N3LQhxz6oAc9sS1TlbO3AhN6c1sCHlSu5JfStGgoluCu1
         S//nct/h2YdAlEQNdvXWzrkM4QWGbMSGL9Xqcp5km7Fl6oloeK6+PUyxM6ci7Zec1vGT
         d8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731400594; x=1732005394;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/MXKM1Sqb74I8ZQpKiaye137tCtqvkpww9vx9BtZ+wc=;
        b=ttuvh3YzWwIZg7ILoQcjdG0CeghxM7jdl887MXoM5y6fJR9pN2AkwVoE5cVkY6vAdd
         5MX50gP7pWTruP/u79CKbD5mee4ciqpz/MaM/hOBOh98P8Xic2yPrWrgUBvs59kdSJkB
         SPifqJlBdumQHuaskK6UrkYZPf+bHewOpF9h87mG4MdniHruUaiYKRN5cusR/ZKCj89X
         MQw6WAVX6lhPH2f3dVmZORFEMT6dwJLe3Ai+UxqZ+sSB0G9HJV7g7A81On/UFD6zxVRn
         OPC05P8pf1sKAZgWYfIXBwB0H5Jk7ZC/La2q91bnV10lDZE+rDZ6CkzbUy8HOhkTq0ZV
         3Vyg==
X-Forwarded-Encrypted: i=1; AJvYcCVt1k6lpbTh3zujAvPBXPwjKszX3WTgHQD2FLew88oLrr6ZkRkwHmg4nkaImcOtHsVDmU467DfTiK6ffU4fZhyT@lists.infradead.org
X-Gm-Message-State: AOJu0YwzuEdL7Iap3CQ4jrzzFgAHUgoTLuvCW+7SN10VMyJcEikucSRB
	AG+/WxsIl08X1yHvBPc9zJnGJ2OI6Mc5JvDmSnhH/nRcSMKPMXBUideOWWsBB1w=
X-Google-Smtp-Source: AGHT+IH8yunZYqyZqpSqETzBCKEoRJ1QIodl+MOpYN4uXnicVv8QU+PV+QjD7NHinPY4E5kCPs85PQ==
X-Received: by 2002:a05:6000:1fa1:b0:37d:3e6d:6a00 with SMTP id ffacd0b85a97d-381f1884805mr15336017f8f.47.1731400593801;
        Tue, 12 Nov 2024 00:36:33 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:50f9:1df6:c2b9:a468])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed997320sm14968695f8f.47.2024.11.12.00.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 00:36:33 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Stephen Boyd <sboyd@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH] clk: core: refine disable unused clocks
In-Reply-To: <5eb12197-330c-4f55-82f7-d13ea458ba43@amlogic.com> (Chuan Liu's
	message of "Fri, 8 Nov 2024 19:49:59 +0800")
References: <1jcykltj7g.fsf@starbuckisacylon.baylibre.com>
	<20241004133953.494445-1-jbrunet@baylibre.com>
	<07594a59-c999-4592-84b8-4e163d3edba4@amlogic.com>
	<1jttci2k8k.fsf@starbuckisacylon.baylibre.com>
	<85aae140-5c9b-4ff9-a522-549009f62601@amlogic.com>
	<1jcyj62gi7.fsf@starbuckisacylon.baylibre.com>
	<5eb12197-330c-4f55-82f7-d13ea458ba43@amlogic.com>
Date: Tue, 12 Nov 2024 09:36:32 +0100
Message-ID: <1j4j4c3l2n.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_003635_706168_22D81EF8 
X-CRM114-Status: GOOD (  21.41  )
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

On Fri 08 Nov 2024 at 19:49, Chuan Liu <chuan.liu@amlogic.com> wrote:

> On 11/8/2024 5:59 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On Fri 08 Nov 2024 at 17:23, Chuan Liu <chuan.liu@amlogic.com> wrote:
>>
>>>>>> -       if (core->flags & CLK_IGNORE_UNUSED)
>>>>>> +       /*
>>>>>> +        * If the parent is disabled but the gate is open, we should sanitize
>>>>>> +        * the situation. This will avoid an unexpected enable of the clock as
>>>>>> +        * soon as the parent is enabled, without control of CCF.
>>>>>> +        *
>>>>>> +        * Doing so is not possible with a CLK_OPS_PARENT_ENABLE clock without
>>>>>> +        * forcefully enabling a whole part of the subtree.  Just let the
>>>>>> +        * situation resolve it self on the first enable of the clock
>>>>>> +        */
>>>>>> +       if (!parent_enabled && (core->flags & CLK_OPS_PARENT_ENABLE))
>>> At first, I couldn't grasp the logic behind the 'return' here. Now it's
>>> clear. This approach is equivalent to completely giving up on
>>> handling clocks with CLK_OPS_PARENT_ENABLE feature in
>>> clk_disable_unused_subtree().
>>>
>> No. It's handled correctly as long as the tree is in coherent state.
>>
>> What is not done anymore is fixing up an inconsistent tree, by this I
>> mean: A clock with CLK_OPS_PARENT_ENABLE, which report enabled from its
>> own registers but has its parent disabled.
>>
>> In that particular case, clk_disable_unused_subtree() won't be turning on
>> everything to properly disable that one clock. That is the root cause of
>> the problem you reported initially. The clock is disabled anyway.
>>
>> Every other case are properly handled (at least I think).
>
> name              en_sts            flags
> clk_a                1          CLK_IGNORE_UNUSED
>     clk_b            0                0
>         clk_c        1         CLK_OPS_PARENT_ENABLE
>
> Based on the above case:
> 1. When 'clk_c' is configured with CLK_OPS_PARENT_ENABLE, disabling
> 'clk_c' requires enabling 'clk_b' first (disabling 'clk_c' before
> disabling 'clk_b'). How can to ensure that during the period of
> disabling 'clk_c', 'clk_b' remains enabled?

That's perfect example of incoherent state.
How can 'clk_c' be enabled if its parent is disable. That makes no
sense, so there is no point enabling a whole subtree for this IMO.

>
> 2. 'clk_c' is not configured with CLK_IGNORE_UNUSED, it should be
> disabled later. However, here it goes to a 'goto' statement and then
> return 'false', ultimately resulting in 'clk_c' not being disabled?

We've discussed that 2 times already. This discussion is going in
circles now.

>
>>>>>>                    goto unlock_out;
>>>>>>
>>>>>>            /*
>>>>>> @@ -1516,8 +1545,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
>>>>>>
>>>>>>     unlock_out:
>>>>>>            clk_enable_unlock(flags);
>>>>>> -       if (core->flags & CLK_OPS_PARENT_ENABLE)
>>>>>> -               clk_core_disable_unprepare(core->parent);
>>>>>> +       return (core->flags & CLK_IGNORE_UNUSED) && enabled;
>>>>>>     }
>>>>>>
>>>>>>     static bool clk_ignore_unused __initdata;
>>>>>> @@ -1550,16 +1578,16 @@ static int __init clk_disable_unused(void)
>>>>>>            clk_prepare_lock();
>>>>>>
>>>>>>            hlist_for_each_entry(core, &clk_root_list, child_node)
>>>>>> -               clk_disable_unused_subtree(core);
>>>>>> +               clk_disable_unused_subtree(core, true);
>>>>>>
>>>>>>            hlist_for_each_entry(core, &clk_orphan_list, child_node)
>>>>>> -               clk_disable_unused_subtree(core);
>>>>>> +               clk_disable_unused_subtree(core, true);
>>>>>>
>>>>>>            hlist_for_each_entry(core, &clk_root_list, child_node)
>>>>>> -               clk_unprepare_unused_subtree(core);
>>>>>> +               clk_unprepare_unused_subtree(core, true);
>>>>>>
>>>>>>            hlist_for_each_entry(core, &clk_orphan_list, child_node)
>>>>>> -               clk_unprepare_unused_subtree(core);
>>>>>> +               clk_unprepare_unused_subtree(core, true);
>>>>>>
>>>>>>            clk_prepare_unlock();
>>>>>>
>>>>>> --
>>>>>> 2.45.2
>>>>>>
>>>> --
>>>> Jerome
>> --
>> Jerome

-- 
Jerome

