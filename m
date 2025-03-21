Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38DAC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 17:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGn88oPkGY52kMYyELFbKZ2t+jeQDt845yU5wPNCV7I=; b=voogyrpaTAgmem859VUJ1ci2l+
	cMkPC4WxA9SuPe2PYGhDUz7DJS02e1C8NUmTefA9qJwCRqi7ySYnTAV7L9mXQHahdOlbnN+YE3lTs
	b93WdOZMMhknTU2QqDub++2/QLlJnryY+kw2cufHdgD17POCZTgcdf5fV8SyyU8CEOZV1l0Axsqvb
	buHnMsK5wRWSqUvVTSsANznr19auS1n1wvB+1ua/AzFRNTDLd8eY2lDGU1D+qbCJP//fPaJihOzEC
	e1I4ADno2xyQf/QNhmxcidNgOBTT7d/Mbx/3hjCv7kxS2TR0LDdGFBTTi6wevWTZiz6Dm9h0521D3
	O1BDUJNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfsP-0000000Fduq-0fK2;
	Fri, 21 Mar 2025 17:09:45 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfon-0000000FdIl-336B;
	Fri, 21 Mar 2025 17:06:02 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2235189adaeso44034555ad.0;
        Fri, 21 Mar 2025 10:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742576760; x=1743181560; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DGn88oPkGY52kMYyELFbKZ2t+jeQDt845yU5wPNCV7I=;
        b=IKnC/l0Pq/QyOb1jbMlpzg3oCpWaF9iprIacBDARVoUNcqUOfqH/IvqNlvOMnLSrex
         /Wgn+1LTj6WBwN2Y07SXbIyBBEK83nUuJX4qmlU0nv241+rN1QF1i179w23KkJVPNad5
         CfIYx8Oe3Ei1uUAscv5pns3W3OlwWQcnEJydwz+BsgiCJyJaw9Dnx5XBCkcwWxgrghKa
         f3+AwZECL7UCVbPQyNgGUHOCT1AmoVCBo+X03MZIK8W62ik48eKQ8TdmRFBjL/iY48MS
         T2XibJhwDBd1wk+CqazWszUb9RMnV0dDGMeci/Y005pfrtEt1fYr5sOeDbmVcHxptNoi
         IkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742576760; x=1743181560;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGn88oPkGY52kMYyELFbKZ2t+jeQDt845yU5wPNCV7I=;
        b=Ug936O49pnJkQRwRY2x/KQi7SVDjtw0M7A1EHYFgFBCwk7qiXW+ZBJzwz/WcdjkIa4
         fO4QqsPS8W6BPsJSHD+XgECJeMvE74dYLpmL+K4i93OO2P8xtrtwYRUq+Z3GusAuGnfb
         U3mWdyzdudcg/tHWbAPB5KbdWV4J2NtnK/HRmHm0IVelpMTPaVEF2SIVw9ujL+r1+Wye
         OpM1h+Cn7v322ps9T8BPD8x40G2MyfSkuuvGFrTMKUqWxB0IcpbYtXvBVCLnKs/WBKy4
         e73M3jkspXuAVbyFDUzwk2MY17nEcKsAf5m2IKIfcqbqoScD+YBiMyOj0CMY8H+YCctC
         leSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqOWULdUagPuREN3YN/fl6B41u29wfCsGWzObgpY3TY4sPvT2gO3/qsKEtsisYOqfynTfwPr4vHK046nI=@lists.infradead.org, AJvYcCWoacuX+UoXXgUb/Q0f+E5UOH8JLVQNgVkKD5L/y3PdN88c/IpD7w6kc1otfn2QAroz2TXaG9Eh51rBhozsIdN6@lists.infradead.org
X-Gm-Message-State: AOJu0YwppsjdQV2jAk8vAFlxMuesdHuNJ5QDp9KMI9gVsmnI4YdbI5RT
	nI86WhKYxv1hQOZOpFfODZWWR/Z5tD7tXxcp37a67l/tADUp3twt
X-Gm-Gg: ASbGncuRvXYWpFNDP467OWisRjyet5IiOt4AqKNew2nMFWlB+oMY3PAiVrlRHonNnHi
	JKIxBNjs08LojWzmh3tmtxgEe3fc+0E+PNHaBFqCZl4M8j7U+vNtdx4pOO2DeT2qu7ojAnazljo
	FXZVg55FafEMZ2GqcQXQ1PnQzT/8NmI+w9UjZJyCECk+T/bSpVFqJ2hCXp8xhm0HSiYhvTY7QZ5
	+ViueWoVbC5b2zNOvGGk2u1xvmNZzYK7WJQyzQ9M8SQUIUXU5DXCqxWzL1pyy5IaW6bcywnle0f
	4wHiPe/7L9PeYI1oaTbITkBLw9dkH5XwNdWSS9Xc3ZqruCFGsHJr67Vkh67O/St2FB+YIPCT4Fc
	4krP5tLJ3CldiXkUcfA==
X-Google-Smtp-Source: AGHT+IGlJ+Z2e1+BqNuKZjJeYaVTSO5uEIrxfNDx54p4mNFYbbGfGIs11ZjWWb6jUGSm+z6+aHdutQ==
X-Received: by 2002:a17:902:ce84:b0:223:fb95:b019 with SMTP id d9443c01a7336-2265e7a1b2emr136230625ad.24.1742576760001;
        Fri, 21 Mar 2025 10:06:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f45879sm19661595ad.65.2025.03.21.10.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 10:05:59 -0700 (PDT)
Message-ID: <b6bb68f0-7e93-4db2-9fe6-f615f06ddeb1@roeck-us.net>
Date: Fri, 21 Mar 2025 10:05:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/14] s390: Add support for suppressing warning
 backtraces
To: Alessandro Carminati <acarmina@redhat.com>,
 linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook <keescook@chromium.org>,
 Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard
 <mripard@kernel.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, x86@kernel.org,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-11-acarmina@redhat.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250313114329.284104-11-acarmina@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_100601_770877_AE664C74 
X-CRM114-Status: GOOD (  21.50  )
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

On 3/13/25 04:43, Alessandro Carminati wrote:
> From: Guenter Roeck <linux@roeck-us.net>
> 
> Add name of functions triggering warning backtraces to the __bug_table
> object section to enable support for suppressing WARNING backtraces.
> 
> To limit image size impact, the pointer to the function name is only added
> to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
> CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
> parameter is replaced with a (dummy) NULL parameter to avoid an image size
> increase due to unused __func__ entries (this is necessary because
> __func__ is not a define but a virtual variable).
> 
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> ---
>   arch/s390/include/asm/bug.h | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
> index c500d45fb465..44d4e9f24ae0 100644
> --- a/arch/s390/include/asm/bug.h
> +++ b/arch/s390/include/asm/bug.h
> @@ -8,6 +8,15 @@
>   
>   #ifdef CONFIG_DEBUG_BUGVERBOSE
>   
> +#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
> +# define HAVE_BUG_FUNCTION
> +# define __BUG_FUNC_PTR	"	.long	%0-.\n"
> +# define __BUG_FUNC	__func__

gcc 7.5.0 on s390 barfs; it doesn't like the use of "__func__" with "%0-."

drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.c: In function 'anx_dp_aux_transfer':
././include/linux/compiler_types.h:492:20: warning: asm operand 0 probably doesn't match constraints

I was unable to find an alternate constraint that the compiler would accept.

I don't know if the same problem is seen with older compilers on other architectures,
or if the problem is relevant in the first place.

gcc 10.3.0 and later do not have this problem. I also tried s390 builds with gcc 9.4
and 9.5 but they both crash for unrelated reasons.

If this is a concern, the best idea I have is to make KUNIT_SUPPRESS_BACKTRACE
depend on, say,
	depends on CC_IS_CLANG || (CC_IS_GCC && GCC_VERSION >= 100300)

A more complex solution might be to define an architecture flag such
as HAVE_SUPPRESS_BACKTRACE, make that conditional on the gcc version
for s390 only, and make KUNIT_SUPPRESS_BACKTRACE depend on it.

Guenter


