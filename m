Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5450ED10F58
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZoRQ3dL555osdSJb1s0nMs9MLW05ZpSRNz02yMFreI=; b=XSRcvjRZVJfL2km29pKHZBPoVY
	oQtEFZtWPjZuRTxeU9kwbIXv2NImaiNW7KDpLaniT0v4hD3rEXFwgc2gJfGf6cBx0/EBg4hCxLSjb
	QPb3EchBRBX1p52+b9r0AQ1UszWRh1irvNB+qCZ40qvNYOc14v7xlMrGln0V2IYmK45IQb1B0Vipx
	lhvguf5Donp8GlmkE8pHrNzQytgaCg9RdTpwQB+a0n07P+yOkae7iuaSWi+IdNtYsI7ftQ7kEFZPg
	Sb8RUPg/sVJEqnXyKhbNDnor9mz1klAxAFf1F3avJUZSi+HC6cihpW0LmdsUQN5I8wRqgnlqwuBYO
	THcErskA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIMV-0000000FIhq-30Tl;
	Wed, 26 Nov 2025 16:27:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIMS-0000000FIhK-1NSC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:27:22 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQB2gHH2122068
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 16:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kZoRQ3dL555osdSJb1s0nMs9
	MLW05ZpSRNz02yMFreI=; b=iKxa+4mozzr9M9IzGqkuT4ikrUfH4djQMg+dBqms
	5UAKBEo7/GNAohsq9sjkO95WemiQH91b7kxlb27N++zAB37K1LpqkxSZajRsHIfa
	XCJCYHWASSNLsyRpEHiFoXZDI4mYY69nRM+4TBSgd7DD6FTlNCEzUbZGS017/bsv
	3xXl/HNags+q1urH99IlqvS8L/rWcUY8rtcvrUdIQohuYNbvRvY6CGlZ4UXXH8xH
	tCKyzqrA6cAL+J1+QK21uhhSzRFebpHu9Ef8Gne/lnzfciqG6nXPfNNzQ7aMTsdK
	kMogsHztVSPdnEFaIjNydK5jWvOKqdADpHMiZAlPxK3nfA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0b30vk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 16:27:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2194e266aso1529996085a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 08:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764174437; x=1764779237; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kZoRQ3dL555osdSJb1s0nMs9MLW05ZpSRNz02yMFreI=;
        b=TlW5WW2SWhw+gHV1AWmNPvaFPXHY6ugZj4GtZDCGk9+jBIT5BDv8T86b1W8iHd/Cez
         dl3pQaVckjBSiCfuHEpDeYJKLk1VGjkkHkCPIOFD24xN54PvmUYPvJGk3PxmGX8gJ0pB
         tADf8Uuly+73ZMHVlhFREfmTD5d8hMwjah7Gplb7tBuCvKk6OcmP8c4YRVItPIKGsHQQ
         HeqxMtcMGfkPigfrV46Kfi49i/0m4oorjI58TZez9j8xzqjcaE/ekgP2QfnRWmC3b/hB
         lkYVH2rdykQzTkENQ7qVCglZdv0zSY0AS35afAkx4qd4bBMUOGhJW6hjAKj6AHNW78AT
         DiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764174437; x=1764779237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZoRQ3dL555osdSJb1s0nMs9MLW05ZpSRNz02yMFreI=;
        b=tfOLkBRvmkDRu8JCnSa2j5y6z6FhBsxek/H3tamoXYnvhYfCofpsrSoviUVQqCrgr6
         Frzm/sTWrCqyBgHgOwflDIWRHU/6U+uleVYHMISWwk95xYZR7CYOlM9vvFVkPtpxrig7
         SmycLOK4rNLtsj+YbBhX/tD6iTVtRfoRPXCLrAMnMojHufbQrMUkD8943OA8RJXUZGdR
         vFqrJaQ4TgQdhV6COVW6CcvKJeo7i+4mdxOhi1rvak21WGFlaUlyEg6GWeKWJesrotQi
         AoPhAsnHIN9fJgS8Oq/lRU6zM2lQKNsarh9lEnfOA51HmcYsbiYvTFLmUqrGKcPCKfOR
         vb4w==
X-Forwarded-Encrypted: i=1; AJvYcCV13DhBRNuTXkJmdSC0K+PhXDmf7pxc5DgtAW9hQgI3qoaGGbGyjgvyc8PEhPTUuhGiuMwzkUV/RAxlv38J+tzu@lists.infradead.org
X-Gm-Message-State: AOJu0YyOtHxpHagaFO+r9GG3d54Wk4BgBZdsvhT0PvAfS30JU9eGjXBB
	bNnKVg2p7aHJGJ7IErQ17Nn9IL1tzKF8KYvTl0dCZlWQcbS5oJOW2FbF3yVxhTXk/Wk4vp/ETPm
	eRClAPn+MDeuLCJaOKo3A7BSWsimtKEib4Rtn4EP/8LWeZGfkfdSrTKJXJAreNuwQuhRdizbHoD
	/XPw==
X-Gm-Gg: ASbGncs9EfvPbxFlUjjUDBthPxuc6CgQ6YhKxCaLc9/zeXwy9+rTqH2gPrw8Kqc/VOE
	oSBkhmOgy558j4T05xYiGQv/8zRspQYymLJ2sIBN4SinFpCVsvYBrNYY4dYzuGf2FQYl7nEzcMK
	/KqKp5MCcgQs7rNMWEbznN0uoekkOnK1fVpyLR8P8D6JmsOnNaY2uysGh7ThyA05i7mtGb1B38Y
	hcIw/5mVNTeYGO8pLiQmtpCPNZwE5pG4fjIz2hUCNp5bF9x3HSQ1e12SYpmLHCEua5Mz6uR348p
	L/97hUU6vw26a/A9gkdRd6EsNHkWbHgTpCN60aZ32VblFCe6JS59nmxD++ZP/ESLE2Ap/OzbMKk
	Oh74wdYBq52nSuKKigBGvw8EQ6Kf+sezPLYu7MijPmonaeeSi06boaGyyvZDaJF8+/8CU3EqQje
	dLYPI26KofUhrl1mlvUdO5NXQ=
X-Received: by 2002:a05:620a:1729:b0:8b3:3879:7dfb with SMTP id af79cd13be357-8b33d269d2bmr2578657885a.49.1764174436576;
        Wed, 26 Nov 2025 08:27:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmZXuhJpba0kOn7F9VG2XhqFGVBU5lcEz+GffpO5CCXMqQUJqKTSsGd0yM6bjITMdSrlIU2g==
X-Received: by 2002:a05:620a:1729:b0:8b3:3879:7dfb with SMTP id af79cd13be357-8b33d269d2bmr2578650485a.49.1764174435900;
        Wed, 26 Nov 2025 08:27:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6baf9f1sm42841561fa.29.2025.11.26.08.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:27:15 -0800 (PST)
Date: Wed, 26 Nov 2025 18:27:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andy@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
Message-ID: <fimuvblfy2cmn7o4wzcxjzrux5mwhvlvyxfsgeqs6ore2xg75i@ax46d3sfmdux>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
X-Authority-Analysis: v=2.4 cv=E+XAZKdl c=1 sm=1 tr=0 ts=69272a66 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=Y0DP8l_jY6Bw9BWxY00A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzNCBTYWx0ZWRfX2ULezgEhStT+
 7E9uiNRUFbATzqMXogOYIlm0VxoOedyj0eZF0f1CbR398lrCLG4e5o6SYsd6vLlIXxeXVwDRwtE
 Jqz4nRntEJxFxURrUXZPPHUqlZaLrGHek5K+xfSyZh1oHOh6R106XDVj8oRKVLywUWdjF0AgiAp
 kjF36vS0ecHD8TIx3j41iczO0GVtsfrA1Z727Macg3enc1wnpkbC6GaU1qMBBdVoG2zhjzgJTp8
 sZu+a+xsDN2PgtF65HYeg9IiN9x/lrJaMoA1t9mvkJlqnSsJhxsVRLBfYUzxRaZ7YcwEOuKCszn
 OdSucrg++niQxy/P75kQR2RqCnxCK4T5JFn1IHJz7IsTSs7c32CkL2zuKt0kD6xE71e/F5dbrAC
 SGN+FUbbM+ULmDcERGyAGeggoGd28w==
X-Proofpoint-ORIG-GUID: sUIJC3gWlgt97WnpjK2fpJ5bnR4fGCKT
X-Proofpoint-GUID: sUIJC3gWlgt97WnpjK2fpJ5bnR4fGCKT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_082720_529222_B4CFE240 
X-CRM114-Status: GOOD (  42.77  )
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

On Wed, Nov 12, 2025 at 02:55:29PM +0100, Bartosz Golaszewski wrote:
> Bjorn, Konrad: I should have Cc'ed you on v1 but I just went with what
> came out of b4 --auto-to-cc. It only gave me arm-msm. :( Patch 7 from
> this series however impacts Qualcomm platforms. It's a runtime dependency
> of patches 8 and 9. Would you mind Acking it so that I can take it into
> an immutable branch that I'll make available to Mark Brown for him to
> take patches 8-10 through the ASoC and regulator trees for v6.19?
> 
> Problem statement: GPIOs are implemented as a strictly exclusive
> resource in the kernel but there are lots of platforms on which single
> pin is shared by multiple devices which don't communicate so need some
> way of properly sharing access to a GPIO. What we have now is the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> doesn't do any locking or arbitration of access - it literally just hand
> the same GPIO descriptor to all interested users.
> 
> The proposed solution is composed of three major parts: the high-level,
> shared GPIO proxy driver that arbitrates access to the shared pin and
> exposes a regular GPIO chip interface to consumers, a low-level shared
> GPIOLIB module that scans firmware nodes and creates auxiliary devices
> that attach to the proxy driver and finally a set of core GPIOLIB
> changes that plug the former into the GPIO lookup path.
> 
> The changes are implemented in a way that allows to seamlessly compile
> out any code related to sharing GPIOs for systems that don't need it.
> 
> The practical use-case for this are the powerdown GPIOs shared by
> speakers on Qualcomm db845c platform, however I have also extensively
> tested it using gpio-virtuser on arm64 qemu with various DT
> configurations.
> 
> I'm Cc'ing some people that may help with reviewing/be interested in
> this: OF maintainers (because the main target are OF systems initially),
> Mark Brown because most users of GPIOD_FLAGS_BIT_NONEXCLUSIVE live
> in audio or regulator drivers and one of the goals of this series is
> dropping the hand-crafted GPIO enable counting via struct
> regulator_enable_gpio in regulator core), Andy and Mika because I'd like
> to also cover ACPI (even though I don't know about any ACPI platform that
> would need this at the moment, I think it makes sense to make the
> solution complete), Dmitry (same thing but for software nodes), Mani
> (because you have a somewhat related use-case for the PERST# signal and
> I'd like to hear your input on whether this is something you can use or
> maybe it needs a separate, implicit gpio-perst driver similar to what
> Krzysztof did for reset-gpios) and Greg (because I mentioned this to you
> last week in person and I also use the auxiliary bus for the proxy
> devices).

Hi,

I'm sorry if this was already reported and fixed. On Qualcomm RB5
platform with this patchset in place I'm getting the following backtrace
(and then a lockup):

[    4.298346] gpiolib_shared: GPIO 130 owned by f100000.pinctrl is shared by multiple consumers
[    4.307157] gpiolib_shared: Setting up a shared GPIO entry for speaker@0,3
[    4.314604]
[    4.316146] ============================================
[    4.321600] WARNING: possible recursive locking detected
[    4.327054] 6.18.0-rc7-next-20251125-g3f300d0674f6-dirty #3887 Not tainted
[    4.334115] --------------------------------------------
[    4.339566] kworker/u32:3/71 is trying to acquire lock:
[    4.344931] ffffda019ba71850 (gpio_shared_lock){+.+.}-{4:4}, at: devm_gpiod_shared_get+0x34/0x2e0
[    4.354057]
[    4.354057] but task is already holding lock:
[    4.360041] ffffda019ba71850 (gpio_shared_lock){+.+.}-{4:4}, at: gpio_device_setup_shared+0x30/0x268
[    4.369421]
[    4.369421] other info that might help us debug this:
[    4.376126]  Possible unsafe locking scenario:
[    4.376126]
[    4.382198]        CPU0
[    4.384711]        ----
[    4.387223]   lock(gpio_shared_lock);
[    4.390992]   lock(gpio_shared_lock);
[    4.394761]
[    4.394761]  *** DEADLOCK ***
[    4.394761]
[    4.400832]  May be due to missing lock nesting notation
[    4.400832]
[    4.407802] 5 locks held by kworker/u32:3/71:
[    4.412279]  #0: ffff000080020948 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x194/0x64c
[    4.422650]  #1: ffff800080963d60 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x1bc/0x64c
[    4.432117]  #2: ffff00008165c8f8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x3c/0x198
[    4.440700]  #3: ffffda019ba71850 (gpio_shared_lock){+.+.}-{4:4}, at: gpio_device_setup_shared+0x30/0x268
[    4.450523]  #4: ffff0000810fe918 (&dev->mutex){....}-{4:4}, at: __device_attach+0x3c/0x198
[    4.459103]
[    4.459103] stack backtrace:
[    4.463581] CPU: 6 UID: 0 PID: 71 Comm: kworker/u32:3 Not tainted 6.18.0-rc7-next-20251125-g3f300d0674f6-dirty #3887 PREEMPT
[    4.463589] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
[    4.463593] Workqueue: events_unbound deferred_probe_work_func
[    4.463602] Call trace:
[    4.463604]  show_stack+0x18/0x24 (C)
[    4.463617]  dump_stack_lvl+0x70/0x98
[    4.463627]  dump_stack+0x18/0x24
[    4.463636]  print_deadlock_bug+0x224/0x238
[    4.463643]  __lock_acquire+0xe4c/0x15f0
[    4.463648]  lock_acquire+0x1cc/0x344
[    4.463653]  __mutex_lock+0xb8/0x840
[    4.463661]  mutex_lock_nested+0x24/0x30
[    4.463667]  devm_gpiod_shared_get+0x34/0x2e0
[    4.463674]  gpio_shared_proxy_probe+0x18/0x138
[    4.463682]  auxiliary_bus_probe+0x40/0x78
[    4.463688]  really_probe+0xbc/0x2c0
[    4.463694]  __driver_probe_device+0x78/0x120
[    4.463701]  driver_probe_device+0x3c/0x160
[    4.463708]  __device_attach_driver+0xb8/0x140
[    4.463716]  bus_for_each_drv+0x88/0xe8
[    4.463723]  __device_attach+0xa0/0x198
[    4.463729]  device_initial_probe+0x14/0x20
[    4.463737]  bus_probe_device+0xb4/0xc0
[    4.463743]  device_add+0x578/0x76c
[    4.463747]  __auxiliary_device_add+0x40/0xac
[    4.463752]  gpio_device_setup_shared+0x1f8/0x268
[    4.463758]  gpiochip_add_data_with_key+0xdac/0x10ac
[    4.463763]  devm_gpiochip_add_data_with_key+0x30/0x80
[    4.463768]  msm_pinctrl_probe+0x4b0/0x5e0
[    4.463779]  sm8250_pinctrl_probe+0x18/0x40
[    4.463784]  platform_probe+0x5c/0xa4
[    4.463793]  really_probe+0xbc/0x2c0
[    4.463800]  __driver_probe_device+0x78/0x120
[    4.463807]  driver_probe_device+0x3c/0x160
[    4.463814]  __device_attach_driver+0xb8/0x140
[    4.463821]  bus_for_each_drv+0x88/0xe8
[    4.463827]  __device_attach+0xa0/0x198
[    4.463834]  device_initial_probe+0x14/0x20
[    4.463841]  bus_probe_device+0xb4/0xc0
[    4.463847]  deferred_probe_work_func+0x90/0xcc
[    4.463854]  process_one_work+0x214/0x64c
[    4.463860]  worker_thread+0x1bc/0x360
[    4.463866]  kthread+0x14c/0x220
[    4.463871]  ret_from_fork+0x10/0x20
[   77.265041] random: crng init done


> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Changes in v4:
> - Collect tags
> - Extend Cc list
> - Link to v3: https://lore.kernel.org/r/20251029-gpio-shared-v3-0-71c568acf47c@linaro.org
> 
> Changes in v3:
> - Make strends() a static inline function
> - Use an empty release() callback for auxiliary devices
> - Refactor the code for finding the shared descriptors in the GPIOLIB
>   shared module, split it into several smaller functions
> - Use str_high_low() where applicable
> - Use non-atomic bit ops where atomicity is not required
> - Link to v2: https://lore.kernel.org/r/20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org
> 
> Changes in v2:
> - Fix a memory leak in error path in gpiolib-shared
> - Drop the gpio-wcd934x fix that already went upstream
> - Free resources used during scanning by GPIOs that turned out to be
>   unique
> - Rework the OF property scanning
> - Add patches making the regulator subsystem aware of shared GPIOs
>   managed by GPIOLIB
> - Link to v1: https://lore.kernel.org/r/20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org
> 
> ---
> Bartosz Golaszewski (10):
>       string: provide strends()
>       gpiolib: define GPIOD_FLAG_SHARED
>       gpiolib: implement low-level, shared GPIO support
>       gpio: shared-proxy: implement the shared GPIO proxy driver
>       gpiolib: support shared GPIOs in core subsystem code
>       gpio: provide gpiod_is_shared()
>       arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
>       ASoC: wsa881x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
>       ASoC: wsa883x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
>       regulator: make the subsystem aware of shared GPIOs
> 
>  arch/arm64/Kconfig.platforms     |   1 +
>  drivers/gpio/Kconfig             |  17 ++
>  drivers/gpio/Makefile            |   2 +
>  drivers/gpio/gpio-shared-proxy.c | 333 +++++++++++++++++++++++
>  drivers/gpio/gpiolib-shared.c    | 558 +++++++++++++++++++++++++++++++++++++++
>  drivers/gpio/gpiolib-shared.h    |  71 +++++
>  drivers/gpio/gpiolib.c           |  70 ++++-
>  drivers/gpio/gpiolib.h           |   2 +
>  drivers/regulator/core.c         |   8 +
>  include/linux/gpio/consumer.h    |   9 +
>  include/linux/string.h           |  18 ++
>  lib/tests/string_kunit.c         |  13 +
>  sound/soc/codecs/wsa881x.c       |   3 +-
>  sound/soc/codecs/wsa883x.c       |   7 +-
>  14 files changed, 1096 insertions(+), 16 deletions(-)
> ---
> base-commit: 96bf1bb63977b67d1a3e4a3645f857bc3fa03f48
> change-id: 20250908-gpio-shared-67ec352884b6
> 
> Best regards,
> -- 
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 

-- 
With best wishes
Dmitry

