Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0955C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 16:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Azq+DaVA//EhU0oOCgPNA2FLamSCcJm54Ub5++OHsas=; b=qDoKHjyL5GV38eJ5FUpJiXjMKj
	vYz50djiX5YE8xt4XDXg6p57JIeFmAm+12MrWmCI4VO49bb3LwYL0PDg5qRW7J11bdNY1yMhRRvQN
	oBxw8+vt2itY+kkEyF1pt9SqG07KFB08YC4eIpg/PzN+d8tMnKOZR1TOBK/2tkycSr3qVBnVAXLdE
	dv+mZahswpbm4bzT8i4SMXdrr7YpKUPsiKUniejOb30uCZ42Db28Jhe1GdV5sz4Sej/OltX0YIPTg
	0Xs78n1rqgv2lP8I8doEd5HRdQMp6n/9V8e/4DQGKywMaCYbQIAZjlLPxv0hVCBZ1RYfddRqtawBJ
	/Uiz5F1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNBz-00000005p8u-2Xu3;
	Mon, 13 Jan 2025 16:21:31 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMh1-00000005ieu-2Prx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 15:49:33 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso31597605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 07:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736783370; x=1737388170; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Azq+DaVA//EhU0oOCgPNA2FLamSCcJm54Ub5++OHsas=;
        b=xUC3oP0p8ITnNkLWxqp50l0U2D12MbtVz8iMCZwf3KTuITQhVsMRga2QYKDVkG1+z2
         iJBShjTl6es7PEkjYyQXkt/9FZICjbSC8wLjlKAfOsbCP4P0sScxvvWIKxR4nGZxfyPc
         w5rEreOqxEKWxRLflWUfFo1IQMRVU5Y95MOjJop05U1r+sr0+W9YlSu1eIv6kY888wNL
         dgbGY61tCuQKeGgg3DwDi8hjgicI9sbLZDTkd1tW4tBph1rLDJmR8qxPInKtua2QrUYt
         LKhyTUXl2q+QLTmODRlyyujv86HOQv4uRmq8l7Izt1evdRODqnR/D1n2wI7EZ+9zW89N
         TgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736783370; x=1737388170;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Azq+DaVA//EhU0oOCgPNA2FLamSCcJm54Ub5++OHsas=;
        b=xVWzZ5a4rz9eH1ioL66R2LEDruMs+X6D7mxsBs6mK8smkjlbZF44cXPHbzAficJyY2
         S0gUTqJXwPnHt2F3PiIl9YoAjKrok7n213aM0OERpIos5RpvFgsS9XO6GBL3PTfdU+Mu
         U+e6zSfFfbuROKpSBqUToou/W16WFAPwFD6EXltQzm3RfVOPar1eGk3eqCfxvvW5C2pn
         o9Hs97ZNlk5o0EhBaYVzHG/71NknVNxR4B3s2OxvBehQj0nEJwuXGxyRsUoKbxFfORUs
         31U/XP6LVioYkJNB0q0lmdVSFwa3momtqR0tAlvYooZ1indfllagBAvB1rEufviEA+mO
         3X4w==
X-Forwarded-Encrypted: i=1; AJvYcCWKurLg9VKsxl9VVRCSd0WU4kALC2gUid2pdD0PQITANwsWCSPDD7km36QJe6XK5kYx+wpuTXQIYF0pK7trWEom@lists.infradead.org
X-Gm-Message-State: AOJu0YzCoL7b59ZEj7+i66ifai4q77aw8CARsN4zeRkrw4ueWP/JzKhV
	+fhRY2669MMugRdS3vZ8GVAi0lCYNLM+pVcSNMqHQspvolOL8RmWiHCwwfAwHLg=
X-Gm-Gg: ASbGncvhpF7pqbgRaCIopTunyG3r6oXpWzXeSdF3Mh97upto/1PrAH6+YIkspZwVQ6s
	mOFPaDmcKb8x3qFT4r3rRONAXE158Wq/ndp65F9PaoTlfiWNk4o9Uk5Gx4NbnoGR1VQsZ2OF2EO
	qNsSrjhL3z6N2/TujfcRrxLTXfaRS73ry6bUtITksqDysvsyuCEG3OEbr6q4VAupPxrYaFRvg0/
	bgGHh+k7fqfSDbERWa7FzursYfiYsdsKcScrqW4diTDhv3oi+fB/0Un
X-Google-Smtp-Source: AGHT+IF09k926b51tgNC96zHwr2fNP9lLjmS+3CaIX3Evh6rq9eXJgioLCN7Rbq+LYTF7EgYPM9XXg==
X-Received: by 2002:a05:6000:1446:b0:385:f47a:e9d1 with SMTP id ffacd0b85a97d-38a872dec76mr17354805f8f.17.1736783369675;
        Mon, 13 Jan 2025 07:49:29 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:9d2d:28cc:aafd:8429])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e384054sm12552709f8f.36.2025.01.13.07.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 07:49:29 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Chuan Liu <chuan.liu@amlogic.com>,  Chuan Liu via B4 Relay
 <devnull+chuan.liu.amlogic.com@kernel.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: amlogic: c3: Limit the rate boundaries of clk_hw
In-Reply-To: <af501f2e-2dd6-4182-872d-76260edba973@linaro.org> (Neil
	Armstrong's message of "Mon, 13 Jan 2025 15:46:39 +0100")
References: <20250110-limit-rate-range-of-clk-v1-0-dd618adc4aa8@amlogic.com>
	<20250110-limit-rate-range-of-clk-v1-2-dd618adc4aa8@amlogic.com>
	<1j34hqai39.fsf@starbuckisacylon.baylibre.com>
	<2578a79d-1e24-4336-9859-e384c8f69269@amlogic.com>
	<1jr05693nn.fsf@starbuckisacylon.baylibre.com>
	<af501f2e-2dd6-4182-872d-76260edba973@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 13 Jan 2025 16:49:28 +0100
Message-ID: <1ja5bu90jb.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_074931_809907_48DD793A 
X-CRM114-Status: GOOD (  16.31  )
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

On Mon 13 Jan 2025 at 15:46, Neil Armstrong <neil.armstrong@linaro.org> wrote:

>>>
>>> I think that the clock configuration exceeding the timing constraints
>>> is a hidden danger that all chips have and face, but this hidden danger
>>> is not easy to be exposed?
>>>
>>> For instance, if the routing of a clock network is close to the clock
>>> or data bus of other modules, and this clock network is wrongly
>>> configured to a frequency beyond the constraints, causing crosstalk
>>> that affects the normal operation of other modules. If such a situation
>>> occurs, it will be very difficult to troubleshoot. How should this
>>> situation be handled more reasonably?
>> Fix your consumers drivers if you need to. Set range if you must.
>> Those are not clock provider constraints. Those are use-case ones. It
>> does belong here and CCF already provides the necessary infra to deal
>> with ranges.
>
> I kind of disagree here, if the vendor has the data and is willing to share
> the range for each clock path of the system, I think it should be welcome!
>
> Usually those ranges are not disclosed, so we don't set them, but CCF will
> certainly use all those range to make an even better decision on the lock
> routing.

I did not say you should not use them, I say that a platform
use-case, which is what this is, should not be hard coded within the
clock provider driver.

This is no different than an assigned-rate, and like any other platform
description, it belong in DT.

We've already seen how these ranges may depend on what else you choose
to do on the system or even what package a particular SoC variant is
using.

>
> Neil
>
>> 

