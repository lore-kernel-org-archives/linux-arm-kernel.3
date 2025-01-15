Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0311EC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 16:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqI+5tYngrQZ8qcvDthiAqlsLEDhI5d+xlqNj7Uno+M=; b=Uo2XTv2E04Clbd30dRA2xhoLrC
	fVdcThXMBLAlM3OcIuDh9InqfrH1dUePoFsM5ww1p4aURljXmioKo5t9qlB4sHS7MTVJDrDQ0u+kK
	K9hchXwixZ5mRoV6fTEDvG8U4fqhWYPUVFQdgIdKb9m0rYZCcWql4NW18q++6spodUEFWtHtnPXHR
	K20KVa49Y8LQwdE3jDpijVIayMiCdOe+HBsyzcLjQvoeexnI72nS4L1UGdgJPdiX4tMaZU1n/LDQ2
	yrwQcf4aT2V3iH2Dy9nU2sLM2LSwmlVUeTkUC2dvjWt72s3sjhw+0G/0oBILDltOAt3WS1yIlRHwN
	V16JBsyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY5oZ-0000000CLs6-1wLe;
	Wed, 15 Jan 2025 16:00:19 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY5nG-0000000CLfx-0UWb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 15:59:00 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so49565045e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 07:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736956736; x=1737561536; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kqI+5tYngrQZ8qcvDthiAqlsLEDhI5d+xlqNj7Uno+M=;
        b=IxlyYJyscLxHqldz7IZZQl52TKDPinHQXCg39K2R8A5LO29d7bb6eE6GEPukkQj8pP
         wT9LOEXwoBcIc/VRNNwHG00aVSdBU8IGQEpqbNAePD9Yzbb4zaDv4NpScuMUrsiotr+4
         rDMZB4rCnhk5hxon2d744aNACSGL1e2EuNl8CpptU8V9rKc1FrJn0cRdLMgy72tTnP0i
         qYhJu2hOnTi92l9efKOMY0I1ezjxLUktxoAGE+fl+DPRe1g9lLfS/Fy02NjPXfz7JhWW
         Ch0wMacgq9rIqTk1lSMSFGV1yX1LL59u7J28/WEHr6J/OtD2y/kMO862jgJ2GWSTvn4O
         otTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736956736; x=1737561536;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqI+5tYngrQZ8qcvDthiAqlsLEDhI5d+xlqNj7Uno+M=;
        b=TIMh9R0lICpPohNIrZEz/+ULTFlyum7xa9goJqGgfRknoM89OlB2pnShXyEOMpyKbi
         WlZysSkLlUs5jTyjiVJGIHZS7/8GapJtLXX64IIFTIdi30jGIvTtuSraklrbw7JJqI9B
         J7N3BiE56etEqzyZWFiMKJSfxeHJRSJVFMnZUC8O/bEUJDxioRyvamh26PISLMoFY6Pg
         YRGNg3glRA1ZoLUQ+lHKCurjJdw88BSql3Hfk7jo4zkG320LuJPlrTz+ENnZDicztXVl
         hGHSMf7eiH3DHDZTt5Hm3iMWpZDX22Nf5V2RdeKKE0dCuAp/op1V477IED0JANAIyShE
         +Q/w==
X-Forwarded-Encrypted: i=1; AJvYcCVX2GPZAle9mYlv3PzrhVlqybbB2MhMcLeig19SJPOXPQX6lejLy8O93AqSHljPgRANN3+ZMJ8VU5Cy8C5gWS+p@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/xbgsYqqk01zZhdn4hlthbzGdBYa3ZdW/JNXmTuxetpDrnXWH
	PnEf5rOBlSN9Kd9AjtqOfg7lfoFjkDQJp+RPM0kwHkkSzbFJAHspk60IXvceE+c=
X-Gm-Gg: ASbGnctbs1TbxsqSDCT3wJkAJWfsW8ZPx+zVxeeOfZnUjLcx2GyoVF5UEDMuJoH5Pp+
	8bdISJwPvOlA6HY2cNycCGXP0LSGkq3WfiZxlITCyY7WsovF7X118Av8dVxl4soH2WmajCtOErM
	tOlsbt6l67DBKz88eIS5f7Ge3ksPuWZ6/8YrPOm34Ocse6FC945biMm/jeCMrUJ/zcTcGbh5q6k
	8ceHejN8A1lY+mDFqFVolvAIc/taD4faO8HO3DQE3kN/OK2NGg4SSoK
X-Google-Smtp-Source: AGHT+IGTWZcoa8XD12jSxjfVWwFjPhENVFnb3eU7ZCXjNrolCccgNcWPAZKi2S5+z1LypovQRe1hYQ==
X-Received: by 2002:a05:600c:4f42:b0:434:a4a6:51f8 with SMTP id 5b1f17b1804b1-436e2555edcmr291354455e9.0.1736956736615;
        Wed, 15 Jan 2025 07:58:56 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:e7b8:6186:fc23:f678])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c16610a0sm33309815e9.1.2025.01.15.07.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 07:58:56 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] clk: amlogic: drop clk_regmap tables
In-Reply-To: <697b634770d789ef8ff0e05cec9465f5.sboyd@kernel.org> (Stephen
	Boyd's message of "Tue, 07 Jan 2025 13:28:50 -0800")
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
	<20241220-amlogic-clk-drop-clk-regmap-tables-v1-2-96dd657cbfbd@baylibre.com>
	<9f1d69ebe1ddce5dfc170e986c9213f2.sboyd@kernel.org>
	<1ja5cp8f87.fsf@starbuckisacylon.baylibre.com>
	<88fe909ab182d1f17f6ef18161c7f064.sboyd@kernel.org>
	<1jfrlwb69r.fsf@starbuckisacylon.baylibre.com>
	<ed20c67e7d1a91d7fd8b921f156f56fb.sboyd@kernel.org>
	<1jmsg2adgu.fsf@starbuckisacylon.baylibre.com>
	<697b634770d789ef8ff0e05cec9465f5.sboyd@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 15 Jan 2025 16:58:55 +0100
Message-ID: <1j4j205ark.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_075858_421052_A32EB0A3 
X-CRM114-Status: GOOD (  18.46  )
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

On Tue 07 Jan 2025 at 13:28, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2025-01-07 06:46:41)
>> 
>> So, if it's OK, I'll resend this series with a temporary solution to
>> remove tables. Removing the table simplify the other clean-up I have
>> already line-up and avoid some unnecessary diffs. I'll circle back to
>> reworking the init_data afterward.
>> 
>
> Ok, sure. Let's see how it goes.


Hey Stephen,

While implementing a temporary solution I've been thinking about the
longer term one (I'd rather not end up stuck on a temporary one, so it
has been bothering me a bit)

I'll reformulate what I'm trying to acheive.

I'd like to register controller init hook to apply on all the clocks of
a particular type. The reason to do that is to drop the big clk_regmap
table that are a pain to maintain (in addition to be ugly). I hoped it
would also save a bit of memory.

The solutions we've been discussing so far feels like we are moving
around the problem, recreating the memory saved somewhere else,
perhaps in a more complicated way. I'd like to find something more
convinient to use, which does not scale the memory used with the number
of clock registered. The point is not a different hook for clk_hw after
all.

Here is an idea, how about list of hook identified by ops and controller ?

The node would look like this

struct clk_type_init_node {
       struct list_head	        entry;
       
       struct device_node	*of_node;
       struct device		*dev;
       const struct clk_ops	*ops;

       int (*init_hook)(struct clk_hw *hw);
};

The change would be minimal in core CCF, just searching the list for a
match in clk_register. On most platform the list would be empty so there
is virtually no penalty when it is not used.

From the controller, the usage would be very simple, just calling a
function before registering the clocks, something like:

int clk_type_register_dev_hook(struct device *dev,
                               const struct clk_ops *ops,
                               int (*init_hook)(struct clk_hw *hw))

or the 'of_node' equivalent.

I admit this is heavily inspired by how devres works :) but it does solve
the early clock controller problem and does not scale with the number of
clock registered.

Would you be ok with this approach ?

-- 
Jerome

