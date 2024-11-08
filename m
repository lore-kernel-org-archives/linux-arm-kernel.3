Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8753DD5E145
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 08:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJPKigWx81+Bm6PKRO3KqD8RhIP7gO2pTb9qdyrOl1k=; b=xkfzQXxdzwl5EEJMpbJhkI4Fmg
	p5RlaiVlVCbwE+OilpKg+HXIhqJ48tTVFhyxOcbnhH31QOgxSoWr5i7tpyH200BwjonUQH80Cwv0e
	VZkOXWa+XrtCtJW4izWBqeCyfkyrIb/0O5nFGUwwx5weQhT0UlnWiE9231XMTjmBkk2xHuMeqLKEh
	I9rPv0fdHkEfH47XqXltLR6VjvwmAKRKHoG4v8O6DaAg3apiilxmxSYOHkNBkk/m78sT1dv5LuOw0
	jC0I8LR6MQon+X6p/S3TpC59uPrPQ9rQU/9orm7G6QcScFP6FAmsmvLY7krgbfHWajOhm/JhBzBqP
	usJOS2yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KhY-00000009qNK-013l;
	Fri, 08 Nov 2024 08:50:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KVr-00000009oEE-0hcE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 08:38:41 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4316cce103dso21867435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 00:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731055117; x=1731659917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJPKigWx81+Bm6PKRO3KqD8RhIP7gO2pTb9qdyrOl1k=;
        b=VbjTFM9Z2hmtJCxp7wNb2BXRbFrvn0Ik9mjwADHEycmcUUqShY2kuBd5P7ORb65xvK
         p5mSKhfcIa2+SkI9E7X4Kn8pBXUVvO/lTYxbUZRMcpU08DZUHYpeu70K6ZCkayWzgkWl
         uWrGMnv8XKvyS8hNXB9Kcopi4ok3B2mhrPmgvJnCBEVrNbteOqRcXZ2/uY7wXoe9pvBW
         N84HEbyN8HtMhhk4JspiLM+GCEJbJa+o6b2km8o/07UGK9ZDt3a3UkL9hTU4q2GU/c0D
         NOAu3MJSxNkmSAkHMWHtz79R7MJHwfvdAU5aDnRXhkmCxXjd0jb2DPTlFMBvdj5bB7dY
         VwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731055117; x=1731659917;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJPKigWx81+Bm6PKRO3KqD8RhIP7gO2pTb9qdyrOl1k=;
        b=YRXJEFHQYTclZjAntFF/crmbGUNQkT4FLlSAJgYsF+Qb8VNPRFZEHV+EeanUmWxqyy
         kC/FvXbdcdUTuqdV+z43WUM+yCtnekwUY5LVVyiKLXw5mHT1fTDLU4i4gz58fRBEmxMX
         54PiouBDGo2vhe72GiJhQm7B30i5fdSqabLso1+mHJAkSuUGA05iMOWQIDG7GfYR5Blv
         oaY8vOgZk3DfiE7KnsVlOn834Nlqj8unt6jg5IXsUOYJl7/DqeB98JOCJI4derMbLFwQ
         FwDV2EuMIAPhQ1udkLjE1yJrtX24wkNRDqeI1yA2vJ/rfSSC+Orbau/Ay7ZFLgKIjCqT
         hwrw==
X-Forwarded-Encrypted: i=1; AJvYcCXIryVUMtiESxUYhBoIE11223Gxk0VSVxh9qcBza9oGqxWT8fqGG7j2xYtIV78be0cIzWKtKZOJMuucyZ9dtZiQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxkcTZHByB7C4FARIzs5r9Ov4S0ldHUrwmSnrWvTc9xIg/czT1i
	P4KqjqA7HiBlQz7hDmBUaOyemKYcJLlZIV762VyDzr+AGUcTHsoG87qn2BuRFJA=
X-Google-Smtp-Source: AGHT+IG+dpyBpBdR+FT66n2a2IW5JPY+pZuJblPHBprC2qQv77X/mv3FdHl7bLc9o7ADckUNC0pp6w==
X-Received: by 2002:a5d:6f02:0:b0:37d:4319:f8c6 with SMTP id ffacd0b85a97d-381f1866ed9mr2004601f8f.7.1731055116940;
        Fri, 08 Nov 2024 00:38:36 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:ecfd:9f8d:62a3:6ba8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b05c2161sm54749155e9.31.2024.11.08.00.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 00:38:36 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Stephen Boyd <sboyd@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH] clk: core: refine disable unused clocks
In-Reply-To: <07594a59-c999-4592-84b8-4e163d3edba4@amlogic.com> (Chuan Liu's
	message of "Fri, 8 Nov 2024 15:59:44 +0800")
References: <1jcykltj7g.fsf@starbuckisacylon.baylibre.com>
	<20241004133953.494445-1-jbrunet@baylibre.com>
	<07594a59-c999-4592-84b8-4e163d3edba4@amlogic.com>
Date: Fri, 08 Nov 2024 09:38:35 +0100
Message-ID: <1jttci2k8k.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_003839_452320_7B9F8448 
X-CRM114-Status: GOOD (  38.59  )
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

On Fri 08 Nov 2024 at 15:59, Chuan Liu <chuan.liu@amlogic.com> wrote:

> hi Jerome:
>
> =C2=A0=C2=A0=C2=A0 Tranks for your REF. I looked at your patch and there =
are some parts
> that I don't quite understand: The original intention of
> CLK_OPS_PARENT_ENABLE was to solve the issue of "parents need enable
> _during _gate/ungate, set rate and re-parent" when setting a clock. After
> setting the clock, it can still be disabled. However, from what I see in
> your patch, the handling logic seems more like "parents need _always _ ga=
te
> during clock gate period"?

As explained in the description, the problem with CLK_IGNORE_UNUSED and
CLK_OPS_PARENT_ENABLE is that you'll get cycle of enable/disable, which
will disable any parent clock that may have a been enabled and expected
to be ignored.

IOW, the CCF changes the state of the tree while inspecting it.
This change solves that.

>
> On 10/4/2024 9:39 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> As it as been pointed out numerous times, flagging a clock with
>> CLK_IGNORE_UNUSED does _not_ guarantee that clock left enabled will stay
>> on. The clock will get disabled if any enable/disable cycle happens on it
>> or its parent clocks.
>>
>> Because enable/disable cycles will disable unused clocks,
>> clk_disable_unused() should not trigger such cycle. Doing so disregard
>> the flag if set for any parent clocks. This is problematic with
>> CLK_OPS_PARENT_ENABLE handling.
>>
>> To solve this, and a couple other issues, pass the parent status to the
>> child while walking the subtree, and return whether child ignored disabl=
e,
>> or not.
>>
>> * Knowing the parent status allows to safely disable clocks with
>>    CLK_OPS_PARENT_ENABLE when the parent is enabled. Otherwise it means
>>    that, while the clock is not gated it is effectively disabled. Turnin=
g on
>>    the parents to sanitize the sitation would bring back our initial
>>    problem, so just let it sanitize itself when the clock gets used.
>>
>> * If a clock is not actively used (enabled_count =3D=3D 0), does not have
>>    CLK_IGNORE_UNUSED but the hw enabled all the way to the root clock, a=
nd a
>>    child ignored the disable, it should ignore the disable too. Doing so
>>    avoids disabling what is feading the children. Let the flag trickle d=
own
>>    the tree. This has the added benefit to transfer the information to t=
he
>>    unprepare path, so we don't unprepare the parent of a clock that igno=
red
>>    a disable.
>>
>> * An enabled clock must be prepared in CCF but we can't rely solely on
>>    counts at clk_disable_unused() stage. Make sure an enabled clock is
>>    considered prepared too, even if does not implement the related callb=
ack.
>>    Also make sure only disabled clocks get unprepared.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>
>>   This is sent as an RFC to continue the discussion started by Chuan.
>>   It is not meant to be applied as it is.
>>
>>
>>   drivers/clk/clk.c | 92 ++++++++++++++++++++++++++++++-----------------
>>   1 file changed, 60 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index d02451f951cf..41c4504a41f1 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -332,17 +332,6 @@ static bool clk_core_is_enabled(struct clk_core *co=
re)
>>                  }
>>          }
>>
>> -       /*
>> -        * This could be called with the enable lock held, or from atomic
>> -        * context. If the parent isn't enabled already, we can't do
>> -        * anything here. We can also assume this clock isn't enabled.
>> -        */
>> -       if ((core->flags & CLK_OPS_PARENT_ENABLE) && core->parent)
>
> This judgment of CLK_OPS_PARENT_ENABLE seems redundant. According to
> normal logic, if the parent is disabled, its children will also be
> forced to disable. This seems unrelated to whether CLK_OPS_PARENT_ENABLE
> is configured.=F0=9F=98=B3

It's removed.

>
>> -               if (!clk_core_is_enabled(core->parent)) {
>> -                       ret =3D false;
>> -                       goto done;
>> -               }
>> -
>>          ret =3D core->ops->is_enabled(core->hw);
>>   done:
>>          if (core->rpm_enabled)
>> @@ -1454,22 +1443,39 @@ static void clk_core_disable_unprepare(struct cl=
k_core *core)
>>          clk_core_unprepare_lock(core);
>>   }
>>
>> -static void __init clk_unprepare_unused_subtree(struct clk_core *core)
>> +static bool __init clk_unprepare_unused_subtree(struct clk_core *core,
>> +                                               bool parent_prepared)
>>   {
>>          struct clk_core *child;
>> +       bool prepared;
>>
>>          lockdep_assert_held(&prepare_lock);
>>
>> +       /*
>> +        * Relying on count is not possible at this stage, so consider
>> +        * prepared an enabled clock, in case only .is_enabled() is
>> +        * implemented
>> +        */
>> +       if (parent_prepared)
>> +               prepared =3D (clk_core_is_prepared(core) ||
>> +                           clk_core_is_enabled(core));
>> +       else
>> +               prepared =3D false;
>> +
>>          hlist_for_each_entry(child, &core->children, child_node)
>> -               clk_unprepare_unused_subtree(child);
>> +               if (clk_unprepare_unused_subtree(child, prepared) &&
>> +                   prepared && !core->prepare_count)
>> +                       core->flags |=3D CLK_IGNORE_UNUSED;
>>
>> -       if (core->prepare_count)
>> -               return;
>> +       if (core->flags & CLK_IGNORE_UNUSED || core->prepare_count)
>> +               goto out;
>>
>> -       if (core->flags & CLK_IGNORE_UNUSED)
>> -               return;
>> +       if (!parent_prepared && (core->flags & CLK_OPS_PARENT_ENABLE))
>> +               goto out;
>>
>> -       if (clk_core_is_prepared(core)) {
>> +       /* Do not unprepare an enabled clock */
>> +       if (clk_core_is_prepared(core) &&
>> +           !clk_core_is_enabled(core)) {
>>                  trace_clk_unprepare(core);
>>                  if (core->ops->unprepare_unused)
>>                          core->ops->unprepare_unused(core->hw);
>> @@ -1477,27 +1483,50 @@ static void __init clk_unprepare_unused_subtree(=
struct clk_core *core)
>>                          core->ops->unprepare(core->hw);
>>                  trace_clk_unprepare_complete(core);
>>          }
>> +
>> +out:
>> +       return (core->flags & CLK_IGNORE_UNUSED) && prepared;
>>   }
>>
>> -static void __init clk_disable_unused_subtree(struct clk_core *core)
>> +static bool __init clk_disable_unused_subtree(struct clk_core *core,
>> +                                             bool parent_enabled)
>>   {
>>          struct clk_core *child;
>>          unsigned long flags;
>> +       bool enabled;
>>
>>          lockdep_assert_held(&prepare_lock);
>>
>> -       hlist_for_each_entry(child, &core->children, child_node)
>> -               clk_disable_unused_subtree(child);
>> +       flags =3D clk_enable_lock();
>>
>> -       if (core->flags & CLK_OPS_PARENT_ENABLE)
>> -               clk_core_prepare_enable(core->parent);
>> +       /* Check if the clock is enabled from root to this clock */
>> +       if (parent_enabled)
>> +               enabled =3D clk_core_is_enabled(core);
>> +       else
>> +               enabled =3D false;
>>
>> -       flags =3D clk_enable_lock();
>> +       hlist_for_each_entry(child, &core->children, child_node)
>> +               /*
>> +                * If any child ignored disable, this clock should too,
>> +                * unless there is, valid reason for the clock to be ena=
bled
>> +                */
>> +               if (clk_disable_unused_subtree(child, enabled) &&
>> +                   enabled && !core->enable_count)
>> +                       core->flags |=3D CLK_IGNORE_UNUSED;
>>
>> -       if (core->enable_count)
>> +       if (core->flags & CLK_IGNORE_UNUSED || core->enable_count)
>>                  goto unlock_out;
>>
>> -       if (core->flags & CLK_IGNORE_UNUSED)
>> +       /*
>> +        * If the parent is disabled but the gate is open, we should san=
itize
>> +        * the situation. This will avoid an unexpected enable of the cl=
ock as
>> +        * soon as the parent is enabled, without control of CCF.
>> +        *
>> +        * Doing so is not possible with a CLK_OPS_PARENT_ENABLE clock w=
ithout
>> +        * forcefully enabling a whole part of the subtree.  Just let the
>> +        * situation resolve it self on the first enable of the clock
>> +        */
>> +       if (!parent_enabled && (core->flags & CLK_OPS_PARENT_ENABLE))
>>                  goto unlock_out;
>>
>>          /*
>> @@ -1516,8 +1545,7 @@ static void __init clk_disable_unused_subtree(stru=
ct clk_core *core)
>>
>>   unlock_out:
>>          clk_enable_unlock(flags);
>> -       if (core->flags & CLK_OPS_PARENT_ENABLE)
>> -               clk_core_disable_unprepare(core->parent);
>> +       return (core->flags & CLK_IGNORE_UNUSED) && enabled;
>>   }
>>
>>   static bool clk_ignore_unused __initdata;
>> @@ -1550,16 +1578,16 @@ static int __init clk_disable_unused(void)
>>          clk_prepare_lock();
>>
>>          hlist_for_each_entry(core, &clk_root_list, child_node)
>> -               clk_disable_unused_subtree(core);
>> +               clk_disable_unused_subtree(core, true);
>>
>>          hlist_for_each_entry(core, &clk_orphan_list, child_node)
>> -               clk_disable_unused_subtree(core);
>> +               clk_disable_unused_subtree(core, true);
>>
>>          hlist_for_each_entry(core, &clk_root_list, child_node)
>> -               clk_unprepare_unused_subtree(core);
>> +               clk_unprepare_unused_subtree(core, true);
>>
>>          hlist_for_each_entry(core, &clk_orphan_list, child_node)
>> -               clk_unprepare_unused_subtree(core);
>> +               clk_unprepare_unused_subtree(core, true);
>>
>>          clk_prepare_unlock();
>>
>> --
>> 2.45.2
>>

--=20
Jerome

