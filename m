Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1F4CF6BFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 08:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sO93H+QFa37P7vkvoHhZpkzVYY5lod2ZRIVKd4EtCKM=; b=FAeiTaI02eFEBTrJg4SSffQ8kx
	QP/ObJKfdgLDXGy62htZxTXaow9JHF5KqGGaiWSLTOH54/3lOpcrn6L52ke9BMfXOHphXXp75GQE6
	qVpbEVPD3ULccijv3I1oJXA/d3FtIlApR247SUHQkBst5bqYVuCw5GQJ9HeAbQen4BgP64i3uzl8R
	ENUccPirR4hUCPWJEYuXXK0lzF4evfCI1FuCQ13COGQmBm7owHmAaBTSMZ4f5kYdMmOazNkOs2QJE
	c6HGl5n4Tk4Ll6cTYKcaJ6EeTV2bZkNORuXhj1UKbsxIip2Hx1SOZvRCJKKDgjhqxrK2nWyX6KdlU
	CsUz8PAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOx6-0000000EQ9T-2YON;
	Wed, 07 Jan 2026 08:31:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOx3-0000000EQ7t-0LFK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 08:31:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6078QmFq1269802
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Jan 2026 08:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sO93H+QFa37P7vkvoHhZpkzVYY5lod2ZRIVKd4EtCKM=; b=YAf3ePHDs3CaRRWl
	db3WyP0IRzXYAKProK7DkpioG0z/c1Ec3mPHK3x0oIpzV3ugmxYMq46Op6nciCp1
	FgvXVcV87pUwboJc+pseSupjohRijHuJedKtmp/aPxEBw5/9SBSHeW6NBgxk7qxY
	CPe1MfwMN+ZHfxi3xR2VSvN5WP/QYod1slvq6/GM0CCvxBU+s36zLnjcimzfuqX6
	zKOrj/9/wtaMxXBoEt+j6ZRA/qc9ablPUG5GoSZKnud6heFuyor9gvra/PVlmeak
	Ja6o6C+XBt40qpMTHdccdW4Mxk6EndKBM8Xc04kIirgoHUe8OVnfKPEtcX94Pu5o
	cnNQQQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh660tgt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 08:31:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1d7ac8339so77551021cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 00:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767774692; x=1768379492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sO93H+QFa37P7vkvoHhZpkzVYY5lod2ZRIVKd4EtCKM=;
        b=fDxR96/ERJJJdaMyhftsi124Uo1JIUN+Lho4LenMe6cwxO8OJ7FNeu3+cwkEKutUvP
         FNDSpYVCPHThder1MHuHSMg8d4AO+vUhJE7x2m5D8tOttSePhJj+4LXCO7NFbyLgC0dJ
         2qynnviUvcEAH0MNqCgDsw7MP+Y6H0U+c4DsA2C3crY4iVm25Y5PQJwXIz3S+SGK9SpV
         iJGIn7gtvL3rGmJnnyaGNF08MUkRK07QgvrVNsgl+dUhiqbycQUPa2pkrHLWBojUS6iu
         adPVyN1e4Il2wvJxhQivNzV8Pwl66VBR3klL2lDEfHFpB2vqxZwDtQZUY+klsu23SMhb
         eDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767774692; x=1768379492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sO93H+QFa37P7vkvoHhZpkzVYY5lod2ZRIVKd4EtCKM=;
        b=aJgh03AJdpqk8ReFpznxP+70GaixR7XST25vCIABiMJPtgpMXr7zg7mVtb4gCqTDak
         5kQwGz43ka5vyXNS9fNMSgFOZCTn/PXpNq4BNziHjYGilJ6pRi6z7Nr8a+l+Gd6X6AXx
         tAivWD6KlqbKYOxDniwWZNbPd/q82/PH0mKrGs7l2TwMw7X/mBIVCPcCgoPm1ba75n5n
         Ft0tbM0q3JF3C78uVet7cZqg9vhH7yDltM8A6palv6mFten+UXm5UGtWY2SB+J65oSfm
         SVrYtLMf+MMOvyTyr10KTyc5Jy6RV8SVECrCFcjlZxGmHGnII1kXTFz2ttuoAzWczWGh
         eMUg==
X-Forwarded-Encrypted: i=1; AJvYcCUOQ1Z1gc/d1TqVKsPCOy+kVJJux0xvuNLjugNJBZO2IGILdv1ICyjnx8+r3cYl/vz/oNWhjCheZ5zggAxqUlWR@lists.infradead.org
X-Gm-Message-State: AOJu0YwYGWOdvZc5kMZ387VuJd173cbpZw9z4Y0lzkpIR00thpVVOV8g
	tivZmt0deQ5vhgrNCaAXhtdiJU92yIMGB5mFv9GslF5BsxXpKEU7QTQRYmkIk0b2AiCSJWVr1W6
	6drK2AVcCV2dOlUi6bD9vV1vT/YXYOFEaEU64xKF4EwLeKMjSDxEI8EJXFidk3e+w0dA516zRXX
	FGRg==
X-Gm-Gg: AY/fxX6+tfIqHzzsOyrSue2/ZzFkEBi8FGL6BLAfAgorovAxHPBaWhsTSX+328/jHsl
	Y64zK1oUjQPrhAJZKmflHMAssj4yh5r7sSYRt28KYRiBVyx/pvD7twUwET3XGspnmGBL7Ww3G5c
	1HldRYduXhfBTeKNd2IJcDwRAxVC7H5hfXvFE0hicHhZ9vO3FNQhYkQJJH3DJO2zQHaDEEIa41o
	NP2UUEl3AROqKwJrl4YI/XhzJ7PaKP8eKXIWs/LzrdzMratwe8LeEz7J5QYU/Qs6yP1e5L36kT4
	rCgvyi+EsSbQeLwB3S3cNzxy8vCukUmPmMlFc6aNGZFzGwvWdWAPrbeewLUetOnYZmvPubG8paX
	zBMsuhUGx52TUq6bvOye6Ypq+tbEhBVEOkylJEg==
X-Received: by 2002:a05:622a:5c8e:b0:4ee:26bd:13f3 with SMTP id d75a77b69052e-4ffb484a739mr17380041cf.8.1767774691658;
        Wed, 07 Jan 2026 00:31:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6IltAcpMqDUqZxq1/vVtnQVTIeTGNYCG+LcMYOkprAjPOhqleDalrgIZfMVCirRonr53pXQ==
X-Received: by 2002:a05:622a:5c8e:b0:4ee:26bd:13f3 with SMTP id d75a77b69052e-4ffb484a739mr17379801cf.8.1767774691272;
        Wed, 07 Jan 2026 00:31:31 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b90b:ec1:e402:4249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f703a8csm84793845e9.13.2026.01.07.00.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:31:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
Date: Wed,  7 Jan 2026 09:31:26 +0100
Message-ID: <176777468354.15022.5475399715540988905.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MNptWcZl c=1 sm=1 tr=0 ts=695e19e4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=R-3ehz3GvOBFeWroKLcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 5v2paGeoUAiyZuxVKXOtYGYyVVpYx8jy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA2NyBTYWx0ZWRfX4hesVsmdGrd0
 yFD0tSnp+dDsmfzvmc4FmPoW8WLUz/q2+daPyBnVeMoeDqI6HvJrk7UrcsVwiwHc9o1uvhRmGuN
 adWJ5LTRzsL3UxTMao73hzz1Ecicog83jv/Gh5mQaHABPsRXI8cu5EGndWvgBP4LOlDz1hcna65
 6IbL/sbuqyPe3HPUH85zaNG+jjR5FviE2P/09QpGBXoelko2g4EhdK30lvLtnEOol5HtlZHnHXO
 G+DjegrVOJE6EuymDJLNzJsdF0akFCVrFK5rfGjBk7jE58vv7y11Bv3Sm1mFX43y4bwXO1Eq/5D
 Kdi91kUXzbypQot1LuX7NO+4ktHPRkTNgyRNFg9xxH+cQexexp/IK+12XWlnMpC4QyiwD7UE+2b
 Ny041QomhaxGeBmpyeLqRRifkScLquEiVLhU3VlbF7rdUxEdVe48iQc8U2Q5ENQnVu8PUWJzd5Q
 p5ZRE1lelMgErcjUYHw==
X-Proofpoint-GUID: 5v2paGeoUAiyZuxVKXOtYGYyVVpYx8jy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_003133_125232_D7BB3C1E 
X-CRM114-Status: GOOD (  16.03  )
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


On Tue, 06 Jan 2026 10:00:11 +0100, Bartosz Golaszewski wrote:
> The GPIO controller is configured as non-sleeping but it uses generic
> pinctrl helpers which use a mutex for synchronization.
> 
> This can cause the following lockdep splat with shared GPIOs enabled on
> boards which have multiple devices using the same GPIO:
> 
> BUG: sleeping function called from invalid context at
> kernel/locking/mutex.c:591
> in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 12, name:
> kworker/u16:0
> preempt_count: 1, expected: 0
> RCU nest depth: 0, expected: 0
> 6 locks held by kworker/u16:0/12:
>   #0: ffff0001f0018d48 ((wq_completion)events_unbound#2){+.+.}-{0:0},
> at: process_one_work+0x18c/0x604
>   #1: ffff8000842dbdf0 (deferred_probe_work){+.+.}-{0:0}, at:
> process_one_work+0x1b4/0x604
>   #2: ffff0001f18498f8 (&dev->mutex){....}-{4:4}, at:
> __device_attach+0x38/0x1b0
>   #3: ffff0001f75f1e90 (&gdev->srcu){.+.?}-{0:0}, at:
> gpiod_direction_output_raw_commit+0x0/0x360
>   #4: ffff0001f46e3db8 (&shared_desc->spinlock){....}-{3:3}, at:
> gpio_shared_proxy_direction_output+0xd0/0x144 [gpio_shared_proxy]
>   #5: ffff0001f180ee90 (&gdev->srcu){.+.?}-{0:0}, at:
> gpiod_direction_output_raw_commit+0x0/0x360
> irq event stamp: 81450
> hardirqs last  enabled at (81449): [<ffff8000813acba4>]
> _raw_spin_unlock_irqrestore+0x74/0x78
> hardirqs last disabled at (81450): [<ffff8000813abfb8>]
> _raw_spin_lock_irqsave+0x84/0x88
> softirqs last  enabled at (79616): [<ffff8000811455fc>]
> __alloc_skb+0x17c/0x1e8
> softirqs last disabled at (79614): [<ffff8000811455fc>]
> __alloc_skb+0x17c/0x1e8
> CPU: 2 UID: 0 PID: 12 Comm: kworker/u16:0 Not tainted
> 6.19.0-rc4-next-20260105+ #11975 PREEMPT
> Hardware name: Hardkernel ODROID-M1 (DT)
> Workqueue: events_unbound deferred_probe_work_func
> Call trace:
>   show_stack+0x18/0x24 (C)
>   dump_stack_lvl+0x90/0xd0
>   dump_stack+0x18/0x24
>   __might_resched+0x144/0x248
>   __might_sleep+0x48/0x98
>   __mutex_lock+0x5c/0x894
>   mutex_lock_nested+0x24/0x30
>   pinctrl_get_device_gpio_range+0x44/0x128
>   pinctrl_gpio_direction+0x3c/0xe0
>   pinctrl_gpio_direction_output+0x14/0x20
>   rockchip_gpio_direction_output+0xb8/0x19c
>   gpiochip_direction_output+0x38/0x94
>   gpiod_direction_output_raw_commit+0x1d8/0x360
>   gpiod_direction_output_nonotify+0x7c/0x230
>   gpiod_direction_output+0x34/0xf8
>   gpio_shared_proxy_direction_output+0xec/0x144 [gpio_shared_proxy]
>   gpiochip_direction_output+0x38/0x94
>   gpiod_direction_output_raw_commit+0x1d8/0x360
>   gpiod_direction_output_nonotify+0x7c/0x230
>   gpiod_configure_flags+0xbc/0x480
>   gpiod_find_and_request+0x1a0/0x574
>   gpiod_get_index+0x58/0x84
>   devm_gpiod_get_index+0x20/0xb4
>   devm_gpiod_get_optional+0x18/0x30
>   rockchip_pcie_probe+0x98/0x380
>   platform_probe+0x5c/0xac
>   really_probe+0xbc/0x298
> 
> [...]

Applied, thanks!

[1/1] gpio: rockchip: mark the GPIO controller as sleeping
      commit: 20cf2aed89ac6d78a0122e31c875228e15247194

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

