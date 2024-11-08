Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCD9D5E14D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 10:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTIHfF+UH1Xa7DK8o/xh7XL9H7nZTNldWgZ8nJ8rQE0=; b=g/7MSpB7g+XQg/Ome49mUGV8SI
	1Sg10VdMPxA4wDvk4dIWDoT/JrTs83DI1oU9vTKUmFGhq0nvdEokZ17XqIQITH2bkQoi+SNuWfx2E
	70gEPnh8iXWW+XailIIv2KEpt8DlyybixwIUMkWexdEi7SsfnUezPgnB0DYpnh3/5xDSmOGMFARJf
	1TM1wo7jJ2Rd0Wr6QJZGclermLOUbMLUDGJ8eDIpV7bpz0ZtytW2ZcoUvXhkd2FINYNgARH9QoJFF
	sEyR1MRQbLax2SQOkwMcyEfw9FTEGdIhWDz9S51fUh5mP/tBuvgRvFofHbPnyYP+JnU0DmajM9Tpj
	/Rbdsthg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Lv1-0000000A44U-3twj;
	Fri, 08 Nov 2024 10:08:43 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Llr-0000000A2LZ-1hAH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 09:59:17 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so15901195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 01:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731059953; x=1731664753; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eTIHfF+UH1Xa7DK8o/xh7XL9H7nZTNldWgZ8nJ8rQE0=;
        b=fBAfOh22nVHn9RFgdF4ibdQUl7TGFA/c3RoVykySeVvWwzS4LOm/vKMn7I48IC/+oN
         hKnGXGf5EXRIPCrqYXnxmrvOq96aGo4nbg+Irj879eu4ry+FYcaVBES4W1fmI+dnsByJ
         ON/Bs1oXhT20B8LUp0kVObUZQFhbxIxBt9AsCM6HRrAnVO75+zD18uOHAzkzZYfxpyKi
         ztj44hqPvCjvOPuwlVVjlqtMRaLzFqHpPwLdTkaU4T7scvWW6xhCeoUq/Hvqto32lNbv
         vNMycPvW/vGoVXrLqNkV5jCd0qf5OFUY5QLIoxdLnzsD5QYoRcFTLpgKGMwN6lf7tADn
         cJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731059953; x=1731664753;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eTIHfF+UH1Xa7DK8o/xh7XL9H7nZTNldWgZ8nJ8rQE0=;
        b=ICBhQZGEGiRY9Gl7/I4XRXRZqUMIKPNh/BYdTMoC83xqhjJvUlrFi57I/pgQj6mjMa
         TYPzFLyOD7W01qmWpu+buxkEOKBVxkVPwToTIjKTegWhbEGl11RQn95v49aYNVvzMGgg
         esGYqEH0gFyq1hUf9XLx5PfsfMZ4mbCm/lfKfmf+cAsRM7ZY4LCz8mL9/mJ3wLo785wZ
         BeEeYq1KcqSi3+DLVHCqS+OqwXnzlxbuIl1S1jJjgmLs0NNvRjFiwLjOXA/4IF9RxV5V
         orFGvAdDmvBD8AuTpAD/RAZxNmrYKQbG1tVJyWoXVCzZMHbytGk/gs2k0hBy9R2UKa+A
         dB/A==
X-Forwarded-Encrypted: i=1; AJvYcCUUaT/c3Cckn4PU1FXwyOlU1NST6MS56xD6/YMsh26SAHfcugmrsdIdUvy6l9s5OCxUHs28K+ZpYw2r9QCAJdGW@lists.infradead.org
X-Gm-Message-State: AOJu0YzaAsyd+FXdZy5EY467alkYo3HHMf08uuqOq8vxTfLTBC3ZzwXm
	vpSwoqURU3a1BTTvMjMr6k3agCrFDBq6j47HoAdLKvNEYGvU6nA5lk9i0QB6ing=
X-Google-Smtp-Source: AGHT+IE52uNEd1M4kmQsGgrrxZ5e+HBgRbQ6hYCN5h70Y/Y7u6ZLc+ouQ9mgPck15oFzZ/AUamay2Q==
X-Received: by 2002:a05:600c:4f87:b0:431:5ed4:7e7d with SMTP id 5b1f17b1804b1-432b7508053mr18099615e9.18.1731059953350;
        Fri, 08 Nov 2024 01:59:13 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:ecfd:9f8d:62a3:6ba8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b0530599sm58205685e9.1.2024.11.08.01.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 01:59:12 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Stephen Boyd <sboyd@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH] clk: core: refine disable unused clocks
In-Reply-To: <85aae140-5c9b-4ff9-a522-549009f62601@amlogic.com> (Chuan Liu's
	message of "Fri, 8 Nov 2024 17:23:53 +0800")
References: <1jcykltj7g.fsf@starbuckisacylon.baylibre.com>
	<20241004133953.494445-1-jbrunet@baylibre.com>
	<07594a59-c999-4592-84b8-4e163d3edba4@amlogic.com>
	<1jttci2k8k.fsf@starbuckisacylon.baylibre.com>
	<85aae140-5c9b-4ff9-a522-549009f62601@amlogic.com>
Date: Fri, 08 Nov 2024 10:59:12 +0100
Message-ID: <1jcyj62gi7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_015915_523075_D678634F 
X-CRM114-Status: GOOD (  14.98  )
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

On Fri 08 Nov 2024 at 17:23, Chuan Liu <chuan.liu@amlogic.com> wrote:

>>>> -       if (core->flags & CLK_IGNORE_UNUSED)
>>>> +       /*
>>>> +        * If the parent is disabled but the gate is open, we should sanitize
>>>> +        * the situation. This will avoid an unexpected enable of the clock as
>>>> +        * soon as the parent is enabled, without control of CCF.
>>>> +        *
>>>> +        * Doing so is not possible with a CLK_OPS_PARENT_ENABLE clock without
>>>> +        * forcefully enabling a whole part of the subtree.  Just let the
>>>> +        * situation resolve it self on the first enable of the clock
>>>> +        */
>>>> +       if (!parent_enabled && (core->flags & CLK_OPS_PARENT_ENABLE))
>
> At first, I couldn't grasp the logic behind the 'return' here. Now it's
> clear. This approach is equivalent to completely giving up on
> handling clocks with CLK_OPS_PARENT_ENABLE feature in
> clk_disable_unused_subtree().
>

No. It's handled correctly as long as the tree is in coherent state.

What is not done anymore is fixing up an inconsistent tree, by this I
mean: A clock with CLK_OPS_PARENT_ENABLE, which report enabled from its
own registers but has its parent disabled.

In that particular case, clk_disable_unused_subtree() won't be turning on
everything to properly disable that one clock. That is the root cause of
the problem you reported initially. The clock is disabled anyway.

Every other case are properly handled (at least I think).

>>>>                   goto unlock_out;
>>>>
>>>>           /*
>>>> @@ -1516,8 +1545,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
>>>>
>>>>    unlock_out:
>>>>           clk_enable_unlock(flags);
>>>> -       if (core->flags & CLK_OPS_PARENT_ENABLE)
>>>> -               clk_core_disable_unprepare(core->parent);
>>>> +       return (core->flags & CLK_IGNORE_UNUSED) && enabled;
>>>>    }
>>>>
>>>>    static bool clk_ignore_unused __initdata;
>>>> @@ -1550,16 +1578,16 @@ static int __init clk_disable_unused(void)
>>>>           clk_prepare_lock();
>>>>
>>>>           hlist_for_each_entry(core, &clk_root_list, child_node)
>>>> -               clk_disable_unused_subtree(core);
>>>> +               clk_disable_unused_subtree(core, true);
>>>>
>>>>           hlist_for_each_entry(core, &clk_orphan_list, child_node)
>>>> -               clk_disable_unused_subtree(core);
>>>> +               clk_disable_unused_subtree(core, true);
>>>>
>>>>           hlist_for_each_entry(core, &clk_root_list, child_node)
>>>> -               clk_unprepare_unused_subtree(core);
>>>> +               clk_unprepare_unused_subtree(core, true);
>>>>
>>>>           hlist_for_each_entry(core, &clk_orphan_list, child_node)
>>>> -               clk_unprepare_unused_subtree(core);
>>>> +               clk_unprepare_unused_subtree(core, true);
>>>>
>>>>           clk_prepare_unlock();
>>>>
>>>> --
>>>> 2.45.2
>>>>
>> --
>> Jerome

-- 
Jerome

