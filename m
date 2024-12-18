Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3720FE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 16:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GWL8MpK/A54u33kex8nRT7rr2EU7sES308qXPlrvcM=; b=TPfx9ITfbVVuMKqTxNHDxtt98L
	LMgET9Rbu5iseSFR8cCYWoHfZsgCZJE01Dl9RF0C6upA+WsgvjmT/kMqKNKCMUMMTMJrOODStKdH2
	f8lkPaQDZYI+zh2dbXp7pA+ehZFWRVvNmt+/kZkE81V9aq3A0tjluz5pKEX0ZYpkxiVHsJ9DiYoHa
	6Nve4mvnlnkIelPOc7qQkKBVrstqMCCRQY6l9RzQJR5llR023n4cKIbg+MzXm3LMfKjMQhXIiDYfw
	t1ztvgH72dBxuU1y6YF7TZMt4BuLCznHy2D/QLc/DeYuww4S7YDctviv2+Wuo0+qTTSoHpvfmx9YU
	ub4Iuciw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwbV-0000000H8ZP-23Sp;
	Wed, 18 Dec 2024 16:08:53 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwaM-0000000H8Rg-2hRH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 16:07:43 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3862a921123so5007743f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 08:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734538061; x=1735142861; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7GWL8MpK/A54u33kex8nRT7rr2EU7sES308qXPlrvcM=;
        b=Da8kexZFgB4KulCr2UuFidPdhANBXA0PIwVRciXMHSrV4CHJgXcwp3Svst13oJa4s0
         9Uu+qZ00tSU6czGTTAC1pSSubhAL9/qEHHNlRXRnl467pZErq9yOHBOqFcwfD/6d/JZ0
         maH4cWWEyg3kJQ5Wnv+L3KEEnbq9u7mdKAkweZ7EJaafVBDWl6cP8S2p0gXbeW9v1cw3
         0jEYYPACzlI7YMv4JuiQgD6aZEnB4kHuAfNdelbTISqUeWkdED43aQ7i672twhZ+QFhj
         1epqClmrJVIUlUsiFwHo+1I6iTLQYdIJ58KgDQgs3CthgU4SFGVeruVz1ZxWcjajnPZi
         vK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734538061; x=1735142861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7GWL8MpK/A54u33kex8nRT7rr2EU7sES308qXPlrvcM=;
        b=IHIdaAfnejV1z3kRh6hWisJ4owMu3f4wlM2YbW/9S63t6vZcoDCEbwdHuT9PnZUkuj
         oveJnzbHNerlVfjF3C+B+3p0HGIam2XDlnLXaCw0DiGstIzrt+KMjYvZXujO6YM2rlp4
         PySWs18ykoUuU82qh0uU+hCmqcNYacQ9KIDGpDV2IX8YCauTzfeJPWpXTM1JdphjxKOC
         iXWZhE7JjzNPhliJIkBZrOTPRsaUx620FZDwY4ayyBslYGuNN95+G81MQnj2E4Myqfh1
         PxcnM9U6h8H7Wtzop1bUUaQDZ+66LGB7tK0BrcDcfjSwMHqQ9kjxeVjgCN6QZRuNFZM0
         +Bdw==
X-Forwarded-Encrypted: i=1; AJvYcCXnpZSK3dr57QfE9DBReOMDiTCt+T/Uaut0QGmqrAvTuDzuP7u2XvD/uoxB/gQT3NFxLbCIJhSiMeKoaw6UNK1o@lists.infradead.org
X-Gm-Message-State: AOJu0YwNUIeeJOBEgS6ga8BhfABMzcBFZ6+oDhTeCTQfJEX+sLQaezuC
	1e5PEjv8QPYEA0dNjnzcZZqxwoMt4rWwF6Sg1IdzXrdkYfsDdkViRCppMj4X/pk=
X-Gm-Gg: ASbGncteIjNZiUTaH9VdXOmKQ5fcMyd0RjOSiBtbEK2n4CESwIUS1DU5HCpxZQJ4rtV
	Xa0Fn6Hss/FwLliX0rBXhRnLh7uom4nlKcaBK6jUoAysI7g/Rb89PTi+Njd3KdGnMNnwJonq82Q
	411+otqov7nnXWkEp29n/7rFLy6rASeFn+BOfrPgOooKCqmvplQ4cZWJZtwAKtfv0fJYgRUNfYa
	Z1kzxdi6m1Gq1BLypiF+cKw2OVBQWK8RuE1X4q2mAHjxWXdwnGUzrTHfY6qClhyiVI=
X-Google-Smtp-Source: AGHT+IG7PH92qkXLnxnwTh4P5KXDXefz0jppOmCFCBUnCWQQf4IzPY3VZ+Qw7p7HiBifkF8x6w6IOw==
X-Received: by 2002:a5d:47a1:0:b0:385:e37a:2a56 with SMTP id ffacd0b85a97d-388e4d97485mr3090764f8f.52.1734538060580;
        Wed, 18 Dec 2024 08:07:40 -0800 (PST)
Received: from [192.168.68.163] ([145.224.66.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801233asm14838301f8f.9.2024.12.18.08.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 08:07:40 -0800 (PST)
Message-ID: <5e89efa7-6780-404b-977f-76e96602e298@linaro.org>
Date: Wed, 18 Dec 2024 16:07:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 8/9] coresight: tools: Add configuration table test
 tools
To: Mike Leach <mike.leach@linaro.org>
Cc: coresight@lists.linaro.org, Suzuki K Poulose <Suzuki.Poulose@arm.com>,
 Leo Yan <leo.yan@arm.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20241127134256.2254851-1-mike.leach@linaro.org>
 <20241127134256.2254851-9-mike.leach@linaro.org>
 <9cb1ef5e-eb61-4177-a039-4049850196a5@linaro.org>
 <CAJ9a7VhG0Mxo=66JpGkPYDBLwo_fmv6BbLx2jPLeDd76f2gfCQ@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAJ9a7VhG0Mxo=66JpGkPYDBLwo_fmv6BbLx2jPLeDd76f2gfCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_080742_719265_8D852E35 
X-CRM114-Status: GOOD (  63.28  )
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



On 12/12/2024 12:03 pm, Mike Leach wrote:
> Hi James
> 
> On Tue, 3 Dec 2024 at 14:25, James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 27/11/2024 1:42 pm, Mike Leach wrote:
>>> Add an example config table generator to test loading configuration
>>> tables.
>>>
>>> Provides a table buffer writer function that can be re-used in other
>>> userspace programs.
>>>
>>> Table write format matches that expected by the corresponding reader
>>> in the configfs driver code.
>>>
>>> Generates tables and outputs in form of binary files.
>>>
>>> Add a config table file reader and printer. Takes in config table files
>>> and prints the contents. Uses table reader source from kernel driver.
>>>
>>> Signed-off-by: Mike Leach <mike.leach@linaro.org>
>>> ---
>>>    MAINTAINERS                                   |   1 +
>>>    .../coresight/coresight-config-table.h        |   5 +
>>
>> Hi Mike,
>>
>> Isn't there some convention about maintaining a copy of kernel headers
>> in the tools? Especially as you wouldn't rebuild the tools after
>> updating the kernel headers so breakages might go unnoticed.
>>
> 
> Not sure - perf keeps a copy and has a check script on build to ensure
> the copy matches the kernel version.
> Keeping two copies of the same thing always strikes me as poor
> practice, so I went for copying over.
> 
> Both methods risk breakages when something in the kernel changes.
> 

You might want to check tools/include/uapi/README which goes over it in 
more detail. I don't think it claims that it's perfect, but just better 
than alternatives. It would make sense to follow it for consistency more 
than anything.

>> [...]
>>
>>> +
>>> +/*
>>> + * sets of presets leaves strobing window constant while varying period to allow
>>> + * experimentation with mark / space ratios for various workloads
>>> + */
>>> +static u64 afdo_set_a_presets[AFDO_NR_PRESETS][AFDO_NR_PARAM_SUM] = {
>>> +     { 2000, 100 },
>>> +     { 2000, 1000 },
>>> +     { 2000, 5000 },
>>> +     { 2000, 10000 },
>>> +     { 4000, 100 },
>>
>> The comment above here looks like its for example1, this one does vary
>> the window size.
>>
>> Probably only example2 is enough, I assumed they were different but
>> example2 is basically the same as example1 with an extra preset list. We
>> could comment that the second preset list is optional and delete
>> example1. Saves people reading more and wondering what the difference is.
>>
> 
> Yes - perhaps both examples were not necessary - but the point was you
> can have two configs in a single loadable table.
> 
>> I tried to make an example that doesn't use an existing feature by
>> reacreating afdo from scratch which I thought would be a good example.
>> It's pasted at the end. I had to copy paste the ETMv4 macros and
>> constants though, I couldn't include them in the userspace generator
>> because of this error:
>>
> 
> The updated ETM config set that is to follow addresses this issue -
> the macros are split off into a separate file  (and adds in a whole
> lot of validation - ensuring a configuration cannot specify and
> allocate more resources than are available.)
> This is also the reason that the examples provided were very simple.
> More complex ones are to follow!
> 
> This set was focused on loading tables so that the next patchsets
> dealing with resource validating ETM configs and CTI configs had an
> easy to use test platform.
> 
> 
>>     coresight-config.h:10:10: fatal error: linux/coresight.h: No such
>> file
>>     or directory
>>      10 | #include <linux/coresight.h>
>>
>> I also got this error when loading it:
>>
>> Unable to handle kernel NULL pointer dereference at virtual address
>> 0000000000000008
>>
>> cscfg_reset_feat (drivers/hwtracing/coresight/coresight-config.c:64
>> coresight-config.c:124) coresight
>> cscfg_load_config_sets
>> (drivers/hwtracing/coresight/coresight-syscfg.c:217
>> coresight-syscfg.c:262 coresight-syscfg.c:492 coresight-syscfg.c:610)
>> coresight
>> cscfg_dyn_load_cfg_table
>> (drivers/hwtracing/coresight/coresight-syscfg-configfs.c:294) coresight
>> cscfg_cfg_load_table_write
>> (drivers/hwtracing/coresight/coresight-syscfg-configfs.c:799) coresight
>> configfs_release_bin_file (fs/configfs/file.c:415)
>> __fput (fs/file_table.c:432)
>> __fput_sync (fs/file_table.c:517)
>> __arm64_sys_close (fs/open.c:1568 fs/open.c:1550 fs/open.c:1550)
>> invoke_syscall (arch/arm64/kernel/syscall.c:?
>> arch/arm64/kernel/syscall.c:49)
>> el0_svc_common (include/linux/thread_info.h:127
>> arch/arm64/kernel/syscall.c:140)
>> do_el0_svc (arch/arm64/kernel/syscall.c:152)
>>
> 
> I'll go back to my tests to check I was testing what I thought I was -
> and didn't accidentally change something after testing and before
> sending the patchset.
> 
>>
>> So I'm wondering if we can do the same thing by setting values via
>> individual files rather than one binary blob which would avoid some of
>> these issues. From what I understand the feature params can already be
>> set directly this way via
>> /sys/kernel/config/cs-syscfg/features/strobing/params/period/value
>>
> 
> 
>> We'd have to add a way to add new configs with a mkdir, then the same
>> things can be configured without needing an additional tool. Links
>> between features and configs can be done with symlinks which is also
>> mentioned in the configfs docs.
>>
>> Something like this would be a bit like the current version:
>>
>>    # ls /config/cs-syscfg
>>    configurations
>>    features
>>
>>    # mkdir /config/cs-syscfg/features/my_config
>>    # ls /config/cs-syscfg/features/my_config
>>    description
>>    matches
>>    regs_desc
>>    params
>>
>>    # mkdir /config/cs-syscfg/features/my_config/regs_desc/TRCRSCTLRn0
>>    # ls /config/cs-syscfg/features/my_config/TRCRSCTLRn0
>>    type
>>    offset
>>    val
>>    mask
>>
> 
> This is precisely what I wanted to avoid. Doing it this way is both
> time consuming for the user and ends up reproducing most of the sysfs
> files in configfs.
> 

I thought I'd suggest the alternative in case Christoph's previous 
comment about not loading a binary blob was a hard nack. I understand 
your counter points about why the blob is better automatically, but I 
don't think any of them are completely unsolvable or blocking with the 
alternate implementation.

For the point about being time consuming, personally I found it quite 
time consuming to use the compiler and write in C. Rather than a pasted 
bash script that just lists each config element:

   echo "12" > /config/cs-syscfg/features/my_config/TRCRSCTLRn0
   echo "11" > /config/cs-syscfg/features/my_config/TRCRSCTLRn1
   ... etc ...

> Parameters are there to allow a limited amount of relevent runtime
> adjustment. Parameter values may also only populate part of a hw
> register depending on use case.
> 
 > The resource approach allows us to define certain bitfields e.g.> 
Branch broadcast - as user configurable - but omit anything users are
> not allowed to meddle with.
> 

This sounds like a mask file along side each register could be used to 
determine which bits to populate for a specific use case. And there 
could be kernel and user provided masks to limit which bits are written.

> The table load is atomic - it is validated and succeeds or fails
> completely. The load mechanism prevents the new configuration from
> becoming visible until it is loaded. The configfs per file method has
> an issue in deciding when the configuration is "complete". If you look
> in the configfs docs/source there was at one time  a  "commit"
> methodology proposed, but this never came to fruition.
> 

Yeah I was going to suggest some kind of "commit" file or "active" flag. 
Or by creating a symlink into an "active" folder at which point the 
config becomes write only (or writes are cached until the next use of 
the config which Suzuki suggested for another sysfs change on the list 
at the moment).

For validation, each field would be validated on write whether the 
config is already active or not. So presumably a script writing a list 
of config values would fail before reaching the "activation" or "commit" 
step.

> Table load  re-uses the same mechanisms as the built-in and loadable
> module methods for adding configurations, but without the need for
> re-compiling the kernel / compiling against a specific kernel -
> meaning loadable tables are dependent only on the hardware available,
 > not the kernel version.

Isn't this the same as with the file approach? Even with the binary blob 
you can't configure a device that the kernel doesn't know about. And 
plain text files can be written to and reconfigured without recompiling 
or using a specific kernel version.

> Adding a per file option means that the new
> configurations would be different from the current load methods
> upstream
> 

This is true, but this binary blob compiler also felt quite different, 
and I wasn't able to blindly copy paste the existing autofdo config into 
it. It needed just as much work to get it to compile as it would have 
been to write the equivalent bash script echoing the config values.

 > - and appear differently in configfs.

I don't think that my suggestion requires that it appears differently at 
the point of use though. After a successful activation the configs could 
appear for use in the same way as the existing module loaded configs.

With all of that said both mechanisms accomplish the same thing, so I 
can't really say to definitely not to it the binary way. Just that it 
feels a bit unusual. Apart from the ACPI example, which is more of a 
firmware thing than something that's controlled by a user at runtime, 
I'm not sure if there is an example of a configfs interface like this?

James

>> But another way could be to enumerate all possible regs for each device.
>> This would remove the need to have all the #defines in whatever tool is
>> making the config (avoiding the #include issue from above):
>>
>>    # mkdir /config/cs-syscfg/features/my_config
>>    # ls /config/cs-syscfg/features/my_config/regs_desc
>>
>>    regs_desc is initially empty, but specify what device it's for to make
>>    all the properties appear (or the mkdir could be done in an etmv4
>>    folder):
>>
>>    # echo "SRC_ETM4" > matches
>>    # ls /config/cs-syscfg/features/my_config/regs_desc
>>    TRCRSCTLRn0
>>    TRCRSCTLRn1
>>    TRCRSCTLRn2
>>    ... etc ...
>>
>>    Now type and offset don't need to be set:
>>
>>    # ls /config/cs-syscfg/features/my_config/regs_desc/TRCRSCTLRn0
>>    val
>>    mask
>>    save
>>
>> Don't we already have the full list of parameters in
>> etm4_cfg_map_reg_offset(), so we can expose this to users via configfs
>> directly rather than needing any tooling. And doesn't any new device
>> that's supported by the config mechanism need to know about all its
>> parameters, so it wouldn't remove any flexibility?
>>
> 
> Mike
> 
> 
>>
> 
> 
> 
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK


