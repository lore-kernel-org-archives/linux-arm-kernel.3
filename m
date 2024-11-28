Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6A7D6911B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 15:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJcLS7Y+TNZg8kTiOzR+IwHTehRXvL7IIhIVM5JxoUs=; b=kY60ogthewpttls06ZWhSFE37B
	IDxnRkfTl0MOlMXe7IujKbkL0kUF4gAxWZZA7ZPn+cGdl7LrnVHlyqm2Vpj+X0QAV+cz9Kt+TqTQV
	gT+oRb3X3pxQF0yG/qlm2o5xt13dvX21UjQT/lOQOJqJSvtNJjG4Iv3GMUbTbjXNyt98lwNG7Tuv0
	lX+P/rFMrJDhNCtHzVNGZDqsBpw52rEaKyXtnLQBmqFpWvQ97GfCGE+p9MzBeKkrihkN/hpcmuI+D
	K7iqw9sJ4idJ60ZOsF1uSwVNnrQ5DyoUYf8FNiOU65tXcX9tvfgZv41O/GcD/md32ZuixfCFVEjMR
	QKxDsl0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgrA-0000000FwRe-2tMj;
	Thu, 28 Nov 2024 15:55:04 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgpw-0000000FwIB-0V3w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 15:53:50 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-434a83c6b01so8520625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 07:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732809227; x=1733414027; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qJcLS7Y+TNZg8kTiOzR+IwHTehRXvL7IIhIVM5JxoUs=;
        b=HybmXqW3YmL6uRqRthG79sVzHyatclqD77X0TBMeFsAvGlBo9y990DyBdqLWAa98pz
         7wujkxLxUldrwJJbmrUpCoLyedgsKAbJx6QgDczzb2mnzoVAdzOMyc9RFU4sr3nFEId/
         DRTn1VqWpvlVJs7zGj4PoYWYv4hVaD9xuUH8SLntM6TCIRDIaIJWzreIPJoKt3rTp74R
         azE9VqL9pigzvUzgK0Ro9dKoWgXBA3vY/FQNffHFcm3KFcDM8nh8acZe++3ZVCUyocmy
         0eV7Vo2VOXM2ZM5kZE1Mem6kbVXqabvA8246BH4mIy3MuvXizVtPnfiSiYx6WTCFlJq2
         RH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732809227; x=1733414027;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJcLS7Y+TNZg8kTiOzR+IwHTehRXvL7IIhIVM5JxoUs=;
        b=LyB7tyYFbOvoTkMeUTHwgG2qhFMvYh51v9yaOuCOl/Ra+EhsvfTt6i4tzIEnD+Pb6x
         0UA8RIRk8Ps3kx+hCbGfWaw3128i4rBZi8tsuqKxJKHUhjCk+BbHoMiFtHKJmV6xtHJM
         luOL5vlLpvaWoPSYLHR5bLWG/qvh6O0DevQA12hCmry4XKOIjVH5R3ehwF9sjg9KwQEs
         PA5ClQp1JpuM4/G8jGyPDFQpklkhqgDtFTRaFZsKn1cVq8lbDTNyAi0wbqahvbtRPoyy
         V6UNjn8FPdZvhr3xWwghVzSGICXk/FwjiZS6/VtvHN18ry+bIO6Zr+Unk80poc03Yc9I
         k3YQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs4Ob1Qv0g1hFRNLcSSgsEupq/ihlS+RqECian86JF5ZdmdkPUdhROFC7iC5FA/owk/mXbJ3OxtPhcru+VH/VN@lists.infradead.org
X-Gm-Message-State: AOJu0YxNpHYJw1rhsZHsy3F79GkUDVwU87FNxHMTu0ZC2Jv2U/XH/Y7d
	QHtzPw02uYT9j4gPl/mQALmnr2d7EUZyv9uX6O3Ru68p8/ogfwY16S7TRyBk2ws=
X-Gm-Gg: ASbGncsXrcXDupxmoeOiSJ4vrzEL5uBLwHmMSZcrNVabV/Iwl76kWn/yXlaPZssXu8E
	bK5XLlc02Hf/7vRal2DJWP+/15ad4NPaHiOUsupmZKXLA5MGHK5EtCbtwlJDV6EitfubP2atq0C
	SF9dGJWLDT3NfYHk1U6T28i4i2Fntf6lnrof9FJDXTDEbmPrqq+ZiX6LVWubqUeVNgQy7fKxlC3
	ffPtf3AQ238W8ssh7RpMQjj7A1mvsGQ2rlNQVF4FYiCzbNDfA==
X-Google-Smtp-Source: AGHT+IGniJq3jqV+EYYIMc2ZyU15P38lX7DI3pP8iwwIHzl+aDRDGlHZnT2XwseXds/67vDoiz4FKQ==
X-Received: by 2002:a05:600c:4747:b0:434:a07d:b709 with SMTP id 5b1f17b1804b1-434a9dfc3d4mr61829395e9.29.1732809226700;
        Thu, 28 Nov 2024 07:53:46 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b89d:29e9:7047:2d6f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa76b52bsm57165365e9.18.2024.11.28.07.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 07:53:46 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>,  "Michael Turquette"
 <mturquette@baylibre.com>,  "Stephen Boyd" <sboyd@kernel.org>,  "Kevin
 Hilman" <khilman@baylibre.com>,  "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  "Mark Brown" <broonie@kernel.org>
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
In-Reply-To: <ce67e512-a15b-4482-8194-b917096f4eeb@app.fastmail.com> (Arnd
	Bergmann's message of "Thu, 28 Nov 2024 16:34:46 +0100")
References: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
	<12f29978-c8ce-4bee-a447-dcd086eb936d@app.fastmail.com>
	<1ja5dk2y5l.fsf@starbuckisacylon.baylibre.com>
	<f8de4a2a-776f-4c10-b75e-e845bcc38dde@app.fastmail.com>
	<1j4j3r32ld.fsf@starbuckisacylon.baylibre.com>
	<306b0b30-5a32-4c7c-86b4-57d50e2307e8@app.fastmail.com>
	<1jy1131kxz.fsf@starbuckisacylon.baylibre.com>
	<c06317c6-b2b2-4b6d-96e4-0c2cfc6846de@app.fastmail.com>
	<1jplmf1jqa.fsf@starbuckisacylon.baylibre.com>
	<ce67e512-a15b-4482-8194-b917096f4eeb@app.fastmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 28 Nov 2024 16:53:45 +0100
Message-ID: <1jjzcn1hiu.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_075348_425966_79B61EBB 
X-CRM114-Status: GOOD (  28.06  )
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

On Thu 28 Nov 2024 at 16:34, "Arnd Bergmann" <arnd@arndb.de> wrote:

> On Thu, Nov 28, 2024, at 16:06, Jerome Brunet wrote:
>> On Thu 28 Nov 2024 at 15:51, "Arnd Bergmann" <arnd@arndb.de> wrote:
>>> On Thu, Nov 28, 2024, at 15:39, Jerome Brunet wrote:
>>>> On Thu 28 Nov 2024 at 15:11, "Arnd Bergmann" <arnd@arndb.de> wrote:
>>>> Eventually that will happen for the rest of the reset implemented
>>>> under drivers/clk/meson.
>>>>
>>>> It allows to make some code common between the platform reset
>>>> drivers and the aux ones. It also ease maintainance for both
>>>> Stephen and Philipp.
>>>
>>> I don't understand how this helps: the entire point of using
>>> an auxiliary device is to separate the lifetime rules of
>>> the different bits, but by doing the creation of the device
>>> in the same file as the implementation, you are not taking
>>> advantage of that at all, but instead get the complexity of
>>> a link-time dependency in addition to a lot of extra code
>>> for dealing with the additional device.
>>
>> My initial rework had the creation in clock (note: that is why I
>> initially used 'imply', and forgot to update when the creation moved to
>> reset).
>>
>> I was asked to move the creation in reset:
>> https://lore.kernel.org/r/217a785212d7c1a5b504c6040b3636e6.sboyd@kernel.org
>>
>> We are deviating a bit from the initial regression reported by Mark.
>> Is Ok with you to proceed with that fix and then continue this discussion
>> ?
>
> I really don't want to see those stray 'select' statements
> in there, as that leave very little incentive for anyone to
> fix it properly.
>
> It sounds like Stephen gave you bad advice for how it should
> be structured, so my best suggestion would be to move the
> the problem (and the reset driver) back into his subsystem
> and leave only a simple 'select RESET_CONTROLLER'.

Okay, though I don't really understand why that select is okay and not
the the proposed one. There is apparently a subtility I'm missing I'd
like to avoid repeating that.

>
> From the message you cited, I think Stephen had the right
> intentions ("so that the clk and reset drivers are decoupled"),
> but the end result did not actually do what he intended
> even if you did what he asked for.
>
> Stephen, can you please take a look here and see if you
> have a better idea for either decoupling the two drivers
> enough to avoid the link time dependency, or to reintegrate
> the reset controller code into the clk driver and avoid
> the complexity?

If I may,

* short term fix: revert both your fix and the initial clock
  change that needed fixing. That will essentially bring back the reset
  implementation in clock.

* after that: remove the creation part from driver/reset and bring back
  something similar to what was proposed in the initial RFC for the
  creation and finally switch the clock driver back to it.
  That should provide the proper decoupling your are requesting I think.

>
>       Arnd

-- 
Jerome

