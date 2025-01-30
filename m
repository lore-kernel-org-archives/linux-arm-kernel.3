Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092A1C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 22:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4PhLkA2yH+xwVRJ4eRUYfsP78J3oAK3Sf/7oUAOMWE=; b=h/lAOaGcfvzsalKmCwc4500wbT
	5LtK4iKKEDc50B3Ay5zvEzr2DJ+OFnboijk1iAN/pi/W4nOwTEU/ZGUvnO5uPoyc0+hG1r7rnftKe
	Jgfj+nZa4Ir5tUbFxWVhVNBDevP9VmLXPrEO8EQB2g8ZwOH0PdvskRsmWbWEOs3itWOfVM8ugM5ov
	gHIkJB4sSZnUh6ptuvUkiXZ5zADBhMrKu/ku+3B7wQ2aBt/3C4FwhH2NRiYxaH+ntVjrK5bSRXJVe
	rYtI9ABozG90k7DrhcU61JX7JS/sfV+xGUVxyzUgGSkpq6N5SfaHWSDDb8D2yU6jpSlFmo8h4l7ZU
	ce7/eNRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdd7s-00000009j4N-1OYS;
	Thu, 30 Jan 2025 22:35:08 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdd6X-00000009iui-2vC6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 22:33:47 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-436281c8a38so9779015e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 14:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738276424; x=1738881224; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q4PhLkA2yH+xwVRJ4eRUYfsP78J3oAK3Sf/7oUAOMWE=;
        b=K5XjgZ/rrWAwtG5B7IrswQuFIVZIPkd91QB7PoaqistnXw02Il8Dm8m01dEGa46+Zc
         GI4h/xuTICUxzZYIUZp0KemXGrJdCD4LhZ8WpDU8Zb06280O/p05620ehC7pqof71xwY
         OTFb4un7mA2Va9M5wvKTCLZi6MMxbnKjWdgGHZAmNNCPI5Cswoe6XE8PEUHmyscZWpTV
         tf1e6kBN7V+3h/Jyv6LsgpsQPapmn9OgxwQ/XVTj+t1R8K0FJO8cRuKzCEogd2VTqlq8
         5h+08ZccOP9IlsZYvQh+NOlTytHILJnwbyBjqfhvLMe+etn9WriHKz9TOVjzOtokwFQB
         yHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738276424; x=1738881224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q4PhLkA2yH+xwVRJ4eRUYfsP78J3oAK3Sf/7oUAOMWE=;
        b=kjFOLJOPSAUgSMV7UNuPODZE2CcJSbRDPld9rkakrcR7eN3g6cVjPwavJPVHrkket+
         fqs4RJLRI2QpxRyUIkFQw1QoGC8yfqoEP3xwTr5F173oAgCCqYs/YJ3vHoO/ZgkS9cWF
         6hSJ5n85XGSqe0NiPeaSZYGIcVc5jtyv0Bp+PjsR5DzgnMTpcFwwYbqyrv5xR87U+76P
         QB75mOdXYUvi5gTgZVw0NCclX7Hpn6+CrOAN/j/yTicr6tuA2+onRiHEQPSxX9YqrQq4
         9NdE3NL+WNtwFQhVzKwIBPJS/HztlzW6T6v3C/I8DZI0wX6qvnuxV+3vryz8wbE/NTac
         feSA==
X-Forwarded-Encrypted: i=1; AJvYcCVhiVBkWZAikembXnb//FISUdxQYQx/l0rgZ6QBTBGsllhLaeD7XsHsSVmHOTLaiit5dSjfRXBvXBvZrivPn7Jr@lists.infradead.org
X-Gm-Message-State: AOJu0YxlpO6MkX4n2I8mK5pRfiXa7BepLGzD1kVq9lg55wDfh2CrCTv1
	PBW9UwkJvt2bYZJEUnTGPlL729k3VS6IkgPuS6jky/wkyLxVCejFKqMFjs/tO7A=
X-Gm-Gg: ASbGnctILw8cYO4K76vOeA/7yU5s4ZM9k0wFcAV1ia9byHmqLQzpB6qb/S/hjmAcuZK
	+zqeOJip5UUJxnTWVjrd7KkQp8/YCUYaYNQqJhJ0MXtXYp4AtrCu8B5iJCR5c+j3u2alBVjG24B
	eB/4OCZDp96ocSPyLBtWzn8PblxHRRRt2Ie4n18AxCivmATDUnHfRBC5qYk2+ar5eeoyWdHWcMQ
	hjey+h7i632ROFr0865lxunxflNzn1Gj7/Rjj1eccK4cAF7y/RFoKj5/lCtRDMjHmqBN2u/WZLv
	sOsOxgQRBaiQdbZhHwehdmttLpwzGgIFCvmbrgJLIOy9zpWoFteKTnE=
X-Google-Smtp-Source: AGHT+IEp+NL8KjaCqdJLkSqTmmab+u4WxdsC5LvvC6odn5b/wppdPeWMvLnufUZb2VnSyWDCxGmQVA==
X-Received: by 2002:a05:600c:3c98:b0:434:fb65:ebbb with SMTP id 5b1f17b1804b1-438dc3c38dcmr84375125e9.17.1738276423846;
        Thu, 30 Jan 2025 14:33:43 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438dcc8a59dsm73532705e9.40.2025.01.30.14.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 14:33:42 -0800 (PST)
Message-ID: <7d1bf72b-183a-429d-9a0c-10e1936a9abe@linaro.org>
Date: Thu, 30 Jan 2025 23:33:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] thermal: of: Export non-devres helper to
 register/unregister thermal zone
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: rafael@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, ulf.hansson@linaro.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com>
 <Z5pkUNNvsWPjRQvy@mai.linaro.org>
 <65a16c3f-456e-40ec-91b0-afb57269ed46@tuxon.dev>
 <Z5tPR_tv7vWDkUI7@mai.linaro.org>
 <6ed7d545-82d7-4bca-95ec-95447586bb58@tuxon.dev>
 <b496d933-3c57-4b02-ab65-0582a30939af@linaro.org>
 <98ddf1b6-1804-4116-b4e2-f54a62c27966@tuxon.dev>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <98ddf1b6-1804-4116-b4e2-f54a62c27966@tuxon.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_143345_742985_FAB7DEF3 
X-CRM114-Status: GOOD (  31.45  )
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

On 30/01/2025 21:53, Claudiu Beznea wrote:
> Hi, Daniel,
> 
> On 30.01.2025 19:24, Daniel Lezcano wrote:
>> On 30/01/2025 11:30, Claudiu Beznea wrote:
>>>
>>>
>>> On 30.01.2025 12:07, Daniel Lezcano wrote:
>>>> On Thu, Jan 30, 2025 at 11:08:03AM +0200, Claudiu Beznea wrote:
>>>>> Hi, Daniel,
>>
>> [ ... ]
>>
>>>>>> Would the IP need some cycles to capture the temperature accurately
>>>>>> after the
>>>>>> clock is enabled ?
>>>>>
>>>>> There is nothing about this mentioned about this in the HW manual of the
>>>>> RZ/G3S SoC. The only points mentioned are as described in the driver code:
>>>>> - wait at least 3us after each IIO channel read
>>>>> - wait at least 30us after enabling the sensor
>>>>> - wait at least 50us after setting OE bit in TSU_SM
>>>>>
>>>>> For this I chose to have it implemented as proposed.
>>>>
>>>> IMO, disabling/enabling the clock between two reads through the pm
>>>> runtime may
>>>> not be a good thing, especially if the system enters a thermal situation
>>>> where
>>>> it has to mitigate.
>>>>
>>>> Without any testing capturing the temperatures and compare between the
>>>> always-on
>>>> and on/off, it is hard to say if it is true or not. Up to you to test
>>>> that or
>>>> not. If you think it is fine, then let's go with it.
>>>
>>> I tested it with and w/o the runtime PM and on/off support (so, everything
>>> ON from the probe) and the reported temperature values were similar.
>>
>>
>> Did you remove the roundup to 0.5°C ?
> 
> I did the testing as suggested and, this time, collected results and
> compared side by side. I read the temperature for 10 minutes, 60 seconds
> after the Linux prompt showed up. There is, indeed, a slight difference b/w
> the 2 cases.
> 
> When the runtime PM doesn't touch the clocks on read the reported
> temperature varies b/w 53-54 degrees while when the runtime PM
> enables/disables the clocks a single read reported 55 degrees, the rest
> reported 54 degrees.
> 
> I plotted the results side by side here:
> https://i2.paste.pics/f07eaeddc2ccc3c6695fe5056b52f4a2.png?trs=0a0eaab99bb59ebcb10051eb298f437c7cd50c16437a87392aebc16cd9013e18&rand=vWXm2VTrbt
> 
> Please let me know how do you consider it.

Thanks for taking the time to provide a figure

Testing thermal can be painful because it should be done under certain 
conditions.

I guess there was no particular work load on the system when running the 
tests.

At the first glance, it seems, without the pm runtime, the measurement 
is more precise as it catches more thermal changes. But the test does 
not give information about the thermal behavior under stress. And one 
second sampling is too long to really figure it out.

In the kernel source tree, there is a tool to read the temperature in an 
optimized manner, you may want to use it to read the temperature at a 
higher rate. It is located in tools/thermal/thermometer

Compiling is a bit fuzzy ATM, so until it is fixed, here are the steps:

(you should install libconfig-dev and libnl-3-dev packages).

cd $LINUX_DIR/tools/thermal/lib
make
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LINUX_DIR/tools/thermal/lib

cd $LINUX_DIR/tools
make thermometer



Then change directory:

cd $LINUX_DIR/tools/thermal/thermometer


Run the tool:

./thermometer -o out -c t.conf -l DEBUG -- <my_command>


The content of the configuration file t.conf is:

thermal-zones = (
	      {	name = "cpu[0_9].*-thermal";
		polling = 100; }
       )

All the captured data will be in the 'out' directory

For 'my_command', I suggest to use a script containing:

sleep 10; dhrystone -t 1 -r 120; sleep 10

If you need the dhrystone binary, let me know.

The thermal zone device tree configuration should be changed to use a 
65°C passive trip point instead of 100°C (and the kernel setup with the 
step wise governor as default).

The resulting figure from the temperature should show a flat temperature 
figure during 10 seconds, then the temperature increasing until reaching 
the temperature threshold of 65°C, the temperature stabilizing around 
it, then followed by a temperature decreasing when the test finishes.

If the temperature does not reach the limit, decrease the trip point 
temperature or increase the dhrystone duration (the -r 120 option)

At this point, you should the test with and without pm runtime but in 
order to have consistent results, you should wait ~20 minutes between 
two tests.

The shape of the figures will give the immediate information about how 
the mitigation vs thermal sensor vs cooling device behave.

Additionally, you can enable the thermal DEBUGFS option and add the 
collected information statistics from /sys/kernel/debug/thermal/*** in 
the results.


Hope that helps






-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

