Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB17C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 14:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZXFa7Uj+1Gvv26a7pIq8NFyLVUfkGuLwgcw0ui9q90=; b=03vvbFqDBy3aSwvmr5tDJGvM5a
	Pp/HWp9btWQe0PxeDAMjqvW6ahojjLlahNtUAYcm62A1V+GEc7YvCSx1cAVg7Wbl8u2vbj4nxcMiL
	HUVDFY3KTK8vUJN4WBqzLtpVxL4PjaBUQq39Y+EibhKgg+FNgGQcieKE6d4HKoebcJsWvjNTWn8jT
	lM+C9Jmz6XkJXMu/Os2CbO9q3n2c+2boKIXXZ+8Ssogc0ZRRPGn1B2e74fG7XNjTXcwQC3iUKPLag
	32Dni6ORH0EvtMcK6lBckJJxf2upH6DuouAZN7y5MICvOBrZNCGWtrXPZPnFEbHSIpQW6x8+qWABR
	i882QF6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqYj9-0000000ESuX-2ncj;
	Fri, 07 Mar 2025 14:31:03 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqYhW-0000000ESfT-3DAp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 14:29:23 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-abf5e1a6cd3so354710866b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 06:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741357760; x=1741962560; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rZXFa7Uj+1Gvv26a7pIq8NFyLVUfkGuLwgcw0ui9q90=;
        b=g1o5MQJ4fBvW3jh7n+jwuiC2hwvjZMnI85WhM+Yw5mlXIVODWdbkTxImAuPRckYVg1
         Up++2M1ZDButWHvN1idpe9RtBL1dxB5+xLhgsbFfIEjQmGgjm5MmQOe0v3OpJUsgcfyy
         kEGjI8vRaPOgDyEi69bZrH06GFN6V0gG8jTi7yMrkic/L18TkcgUJSeWhrNdLRKZ2s8s
         5jG7ZiopXV5NVk5rI3cMFrzcLkcIUcp7dkGF68sMe2hYivK1AhXibEWoyJXFL9BhmWQI
         GO6nIZiz1ysZeVSJRuehV/fEAWRroUV+lrgUAoZge+iGqzjUlBvSeoXt3fpFv3YIbz83
         LWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741357760; x=1741962560;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rZXFa7Uj+1Gvv26a7pIq8NFyLVUfkGuLwgcw0ui9q90=;
        b=PQtfTEJoFNflevDNtbVZbrZTvH7MYLhhrqt8LDHGKEvuLE+tFl8aceomc4YJPPgrte
         TkISwsHV2NFDHFiBxI7sOFjqfBfRu/EWgkNYWvZP/PosAB76+auIwbKUipMQvwYrj/Pj
         LUmr62HEE6eTfcrFoOoomKPUvIqtrhhSMDqVxgxbszBjaRi92Xm9k7ke255zIVzpWgZ9
         QenYmMjHpSoA2IfdUv4g0MJQlHHVO4/rDZROn335nA0LM73l1ryWcmxTCPd37ep1olna
         3Jft7Wmm2cGGbD+ocgRDinwR3sPl+svtuTqvKr/VqPOwX6Vgl4g72lTmHLLAm5ioemqy
         MDbg==
X-Forwarded-Encrypted: i=1; AJvYcCV0S+xDiC54sgKlrfRHZdHIxGkyh7K0G5/75Jtkfpseanu2xFW5USL7pJOSGx2RklDeGW6iz2Gjc0q6tOhEBwTN@lists.infradead.org
X-Gm-Message-State: AOJu0YzLlBFEEJv+2uhQ7XcCjLpTcZqoNEldOBCN047Iyk5z43dsXCSJ
	pqDU1zFAbhyfsEIoG8mLvyAdYoUWBY6BA/q30a1UsMo5JC9rUmPK6zjggi3h4aY=
X-Gm-Gg: ASbGncvxUg/eJI7C90Ts1zWta6CNNGcUIJfUHQILnnY6EaqWHVd0J+EoDnDYCOtlvc5
	BTjfFbQ0ANTEPcRd7+six2XV7G3MXCHgRCE8sCzq5a0eWZTygOrRumuyg7ExcLbYqT1dxYVRgvx
	I5xCmk9jdKaf9mJbBdJrXrRGPVjk7XRly85nvNZS0i7+Wshle7o0cX1Bx7oJGHbJ7rccezZnDmK
	KcsZJY9q5BgvRxjtJdM2hDfR3Nt6SWso8jrI3Mmtw7NhDHqKHKsuU6VRP0zUlDyOQ92HACi7T1Q
	PZ9VUZkboTzME5YZJyfD9RWg9gi63HS6MPeNk8XuMGuM3F8W
X-Google-Smtp-Source: AGHT+IF49kYpg5RPGwJy8i9yjwRINb0kt0IyAlxaMk/9eqprhpCXQ6RH2p+TtJmUmzITNA8l5Eqp+g==
X-Received: by 2002:a17:907:1581:b0:ac1:e14a:19d6 with SMTP id a640c23a62f3a-ac252111787mr295629366b.0.1741357760246;
        Fri, 07 Mar 2025 06:29:20 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2394fd5e6sm280834666b.80.2025.03.07.06.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 06:29:19 -0800 (PST)
Message-ID: <01cdf3a68e120d30bdcf4fc225bb236dba47fdff.camel@linaro.org>
Subject: Re: [PATCH RFC/RFT 00/12] clk: samsung: Use platform_driver_probe()
 to avoid __refdata
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Krzysztof
 Kozlowski	 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi	 <cw00.choi@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko	
 <semen.protsenko@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 07 Mar 2025 14:29:18 +0000
In-Reply-To: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
References: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_062922_816592_E643CE49 
X-CRM114-Status: GOOD (  10.66  )
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

Hi Krzysztof,

Nice idea!

On Wed, 2025-03-05 at 22:43 +0100, Krzysztof Kozlowski wrote:
> RFT/RFC because testing needed. I tried to do the same on exynos5-subcmu
> and it caused weird oopses which even KASAN did not narrow. Probably
> because of multiple exynos5-subcmu devices?

I've tried this on top of next-20250225, and it doesn't work on gs101
either and OOPSes several times during boot in different places, but
I can not dig deeper right now.

[   11.502919][   T58] Unable to handle kernel paging request at virtual ad=
dress ffffbfe2ab25cc30
[   11.503128][   T58] Mem abort info:
[   11.503202][   T58]   ESR =3D 0x0000000096000007
[   11.503295][   T58]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[   11.503419][   T58]   SET =3D 0, FnV =3D 0
[   11.503498][   T58]   EA =3D 0, S1PTW =3D 0
[   11.503579][   T58]   FSC =3D 0x07: level 3 translation fault
[   11.503695][   T58] Data abort info:
[   11.503769][   T58]   ISV =3D 0, ISS =3D 0x00000007, ISS2 =3D 0x00000000
[   11.503896][   T58]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
[   11.504058][   T58]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
[   11.504288][   T58] swapper pgtable: 4k pages, 48-bit VAs, pgdp=3D000000=
008208c000
[   11.504570][   T58] [ffffbfe2ab25cc30] pgd=3D0000000000000000, p4d=3D100=
0000082a58003, pud=3D1000000082a59003, pmd=3D1000000082a5d003,
pte=3D0000000000000000
[   11.505079][   T58] Internal error: Oops: 0000000096000007 [#1] PREEMPT =
SMP
[   11.505346][   T58] Modules linked in:
[   11.505495][   T58] CPU: 6 UID: 0 PID: 58 Comm: kworker/u32:1 Tainted: G=
                T  6.14.0-rc4-next-20250225+ #12
[   11.505902][   T58] Tainted: [T]=3DRANDSTRUCT
[   11.506061][   T58] Hardware name: Raven (DT)
[   11.506230][   T58] Workqueue: events_unbound deferred_probe_work_func
[   11.506477][   T58] pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSB=
S BTYPE=3D--)
[   11.506768][   T58] pc : __device_attach_driver+0x18/0x254
[   11.506978][   T58] lr : bus_for_each_drv+0xfc/0x154
[   11.507168][   T58] sp : ffff8000803abc00
[   11.507321][   T58] x29: ffff8000803abc10 x28: ffff00ed403363d0 x27: fff=
f00ed40336400
[   11.507620][   T58] x26: 0000000000000000 x25: ffff00ed4002380d x24: fff=
f00ed40028000
[   11.507919][   T58] x23: ffffbfe2aba26000 x22: 0000000000000000 x21: fff=
f00ed409f8400
[   11.508219][   T58] x20: ffff8000803abca8 x19: ffffbfe2a9a4cf4c x18: 000=
0000000000040
[   11.508518][   T58] x17: 0000000000000001 x16: 0000000000000001 x15: 000=
0000000000010
[   11.508817][   T58] x14: 0000000000000010 x13: 0000000000000093 x12: 000=
0000000000002
[   11.509117][   T58] x11: ffffffffff6070d2 x10: 0000bef56a420260 x9 : 000=
0000100000000
[   11.509416][   T58] x8 : 0000000100000000 x7 : ff7f7f7f7f7f7f7f x6 : 455=
242436f53531d
[   11.509715][   T58] x5 : 1d53536f43425245 x4 : 0000000000000000 x3 : e8c=
6e6e4bec6c65a
[   11.510015][   T58] x2 : 0000000000000062 x1 : ffff8000803abca8 x0 : fff=
fbfe2ab25cc28
[   11.510315][   T58] Call trace:
[   11.510436][   T58]  __device_attach_driver+0x18/0x254 (P)
[   11.510644][   T58]  bus_for_each_drv+0xfc/0x154
[   11.510819][   T58]  __device_attach+0x100/0x1cc
[   11.510996][   T58]  device_initial_probe+0x14/0x20
[   11.511182][   T58]  bus_probe_device+0x94/0x100
[   11.511359][   T58]  deferred_probe_work_func+0xa0/0xfc
[   11.511558][   T58]  process_scheduled_works+0x194/0x2c4
[   11.511761][   T58]  worker_thread+0x28c/0x394
[   11.511930][   T58]  kthread+0x1c0/0x204
[   11.512081][   T58]  ret_from_fork+0x10/0x20
[   11.512248][   T58] Code: a9017bfd f90013f5 a9034ff4 910043fd (f9400408)=
=20
[   11.512506][   T58] ---[ end trace 0000000000000000 ]---

and

+ udevadm trigger '--action=3Dadd'
[  390.387986][  T394] Unable to handle kernel paging request at virtual ad=
dress ffffbfe2ab25cc28
[  390.388207][  T394] Mem abort info:
[  390.388282][  T394]   ESR =3D 0x0000000096000007
[  390.388378][  T394]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[  390.388506][  T394]   SET =3D 0, FnV =3D 0
[  390.388586][  T394]   EA =3D 0, S1PTW =3D 0
[  390.388669][  T394]   FSC =3D 0x07: level 3 translation fault
[  390.388787][  T394] Data abort info:
[  390.388862][  T394]   ISV =3D 0, ISS =3D 0x00000007, ISS2 =3D 0x00000000
[  390.388990][  T394]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
[  390.389137][  T394]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
[  390.389367][  T394] swapper pgtable: 4k pages, 48-bit VAs, pgdp=3D000000=
008208c000
[  390.389650][  T394] [ffffbfe2ab25cc28] pgd=3D0000000000000000, p4d=3D100=
0000082a58003, pud=3D1000000082a59003, pmd=3D1000000082a5d003,
pte=3D0000000000000000
[  390.390173][  T394] Internal error: Oops: 0000000096000007 [#2] PREEMPT =
SMP
[  390.390426][  T394] Modules linked in:
[  390.390580][  T394] CPU: 7 UID: 0 PID: 394 Comm: udevadm Tainted: G     =
 D         T  6.14.0-rc4-next-20250225+ #12
[  390.390969][  T394] Tainted: [D]=3DDIE, [T]=3DRANDSTRUCT
[  390.391153][  T394] Hardware name: Raven (DT)
[  390.391322][  T394] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSB=
S BTYPE=3D--)
[  390.391612][  T394] pc : dev_uevent+0x144/0x2d8
[  390.391785][  T394] lr : kobject_uevent_env+0x1e0/0x3a8
[  390.391985][  T394] sp : ffff8000810fbb40
[  390.392137][  T394] x29: ffff8000810fbb60 x28: 0000000000000002 x27: fff=
fbfe2aa859240
[  390.392437][  T394] x26: ffffbfe2aae1ca12 x25: 0000000000000000 x24: fff=
f00ed41167540
[  390.392736][  T394] x23: ffff00ed41070000 x22: ffff8000810fbbf8 x21: 000=
0000000000000
[  390.393035][  T394] x20: ffff00ed41070000 x19: ffff00ed41083010 x18: 000=
0000000000000
[  390.393335][  T394] x17: 0000000000000000 x16: 0000000000000000 x15: 000=
0ffffc7e40360
[  390.393634][  T394] x14: 00000000ffffffd0 x13: aaaaaaaaaaaaaaaa x12: aaa=
aaaaaaaaa0000
[  390.393933][  T394] x11: 0000000000000000 x10: 0000000000000004 x9 : 3bc=
04d1231e6a100
[  390.394233][  T394] x8 : ffffbfe2ab25cc28 x7 : 3d4d455453595342 x6 : 455=
4535953425553
[  390.394532][  T394] x5 : ffff00ed4107026b x4 : ffffbfe2aae64508 x3 : fff=
fffffffff0a00
[  390.394831][  T394] x2 : 0000000000000000 x1 : ffff00ed41070000 x0 : fff=
f00ed41083010
[  390.395132][  T394] Call trace:
[  390.395252][  T394]  dev_uevent+0x144/0x2d8 (P)
[  390.395425][  T394]  kobject_uevent_env+0x1e0/0x3a8
[  390.395610][  T394]  kobject_synth_uevent+0x3ec/0x440
[  390.395802][  T394]  uevent_store+0x28/0x64
[  390.395962][  T394]  dev_attr_store+0x18/0x2c
[  390.396128][  T394]  sysfs_kf_write+0x80/0xa0
[  390.396295][  T394]  kernfs_fop_write_iter+0xdc/0x178
[  390.396488][  T394]  vfs_write+0x344/0x3a0
[  390.396644][  T394]  ksys_write+0x7c/0xe8
[  390.396797][  T394]  __arm64_sys_write+0x1c/0x28
[  390.396973][  T394]  invoke_syscall+0x40/0xf8
[  390.397139][  T394]  el0_svc_common+0xac/0xdc
[  390.397306][  T394]  do_el0_svc+0x1c/0x28
[  390.397459][  T394]  el0_svc+0x34/0x9c
[  390.397602][  T394]  el0t_64_sync_handler+0x84/0x108
[  390.397791][  T394]  el0t_64_sync+0x1a4/0x1a8
[  390.397963][  T394] Code: aa1403e0 94232d4d f9403668 b40000c8 (f9400102)=
=20
[  390.398221][  T394] ---[ end trace 0000000000000000 ]---


Cheers,
Andre'


