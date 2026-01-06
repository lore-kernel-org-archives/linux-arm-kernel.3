Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFC7C47BC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 09:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zUmJx583wbIqbI/LnTq2qTUX5b+XpJNoiwxn1/rffoo=; b=a29u1+TU4n0bppPxWuKllcEIQU
	yXDdr8/oGDOxoalJE4OdZw4wDuU0T9FfRlnyXts80RPa38tqIV6eduVGB00z1rYo6v5O0Y+ikf4th
	8jIMPeK2vUFop+PXYYt/EVRO6CiiuU+WMeIDAKX73yP+vHwUBrDX3mKO+xB7ZId3WdqTAmuPlhBIQ
	EgSo9/v4PM4/x2zbWebMQ4VZr8UV83FCEbobk6lZB0LnyxVgp/8hjqqiz4NBOtBXS5TxOjRCqDZ7+
	RN291G4FV0NMa6a7n2rfq9SFChZWO73yzzo62U7UWEETqLG5NejAkwuxGkZOdzVXvVzAPcRrgCnd2
	IkVcp8Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2vP-0000000Cevm-1iQt;
	Tue, 06 Jan 2026 09:00:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2vM-0000000Ceuu-1KIm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 09:00:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QJqG3271888
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Jan 2026 09:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zUmJx583wbIqbI/LnTq2qTUX5b+XpJNoiwx
	n1/rffoo=; b=dJnxGMIAyzB4PbZ6MmAJk5BnLsOhqj3GNT0QhtWZwCRCaqKJRyo
	6gq39vnXnOoszTprusZdSQL7N/GxoWO5RS9W5SnB2Z9bxmRCpjhCoC9moTOqLTr6
	Fe2SeWLCLC4YJ02HHKQZAmM1d3akRT4yENG52WyILRPHnGuOwmnTbyiMAmNiUD7j
	ieO4CHSTVkN358A4ndSushtRNHzpfeV2LqwAvWZQB1/6ejtK+iUYwPu6UCD7CNyQ
	br1CenYNR/qi9jiaduj5bezt5X6D66XZmWNnEbWiKkciWL7JMa82Li/zAFek3qMV
	BEIbxe3e8DaH/hDao5i2C070EB0MFnYmgyQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv02nmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 09:00:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee09693109so14786751cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 01:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690019; x=1768294819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zUmJx583wbIqbI/LnTq2qTUX5b+XpJNoiwxn1/rffoo=;
        b=j4xosgwvOB+rArkJCzBDa/vZEGTb9+3QapwT4i46DMO8UM1Bw22IJuemBd+sEPa2Ia
         Qqp1Metvww39CTpdG1xzU55QPFcS00P3QZ1YXxFXfMZzU081ZAirRYrtuKzfPv8Jkzr4
         kRa6T/PsmTxjrL73RixZS2JZWCzzl9vmEdcUguJtpXOxlryQ/yTV3Ut0XGQ/kmo1da15
         vp5FIYMfBswXOo4ZNyzsx0jt0B0T3dY5Ni0FYhquwMiqaocqWYP9FGAuszzCaQzebsjC
         JlkSQVoTBEV6lWZkmNQpLozCEHN1cWjtV973PtY4zvoha3Ib5lrUIb706eYQXm1xMxrc
         zB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690019; x=1768294819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUmJx583wbIqbI/LnTq2qTUX5b+XpJNoiwxn1/rffoo=;
        b=Bw7XbmIAEM2I8DhaRKl3/Ux4Y7YoEs+xTGy/yuobnD6nlQg3DK/1mgBOt4eienbtiE
         3K/cjRWGAOVR7j5jNWJA9vy2UzBj2v8L/z8LWY7b9dq46zG1ydqsG5+WsPHd4wvHdgrJ
         NC5tzwWQ9GMUayZK5ipeWYlyhZT4B/lvrgeOcNuBO7RE09cYEm1ydYUEcxKllGF5ZSUh
         zzLxhf1KkAIpnVynrymHJK8A8fCOMqx6fqN6ABH7L5Ia+C8Mw7VR2c2VlkD11rA2I/Ax
         EKX0KqEk40KD8X4Dpe1wfYJOH7Vn9HaTU2TrFjU1jHL/dKoWJn+zn2Mak3Eg5h5U49V0
         rEAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZt6RrNb26QMIsN4n+PFtr26xnyjT89EWeXZ1pJgDMdWNT8J5yLTjmtoXHJlrsoFEvi6tk/MmYVcYeVoJNNkv0@lists.infradead.org
X-Gm-Message-State: AOJu0YwEPy/w/gTlEGHBaeXLdV/0xSjr/FbAeg+y6G1uRl9MX1WCHSqW
	B8q2kZNPKLL3U+qymL04Bee5yQ7zNYOQ0Cnx+jBgvYGCVK2P1PTs5j5/NJ5gIhGbv1Smy/jzxH7
	mZLNSTcp/RSlR/awTKJXx7h0cJFrvzT/YZlTeWD2Q2neRunviMVXvUGbfAgPOmdsJTL+L+YMNd/
	1t3A==
X-Gm-Gg: AY/fxX7y668GwpE9o8Hnij8Nv8zhoBc2CbiNqhxWfgnQmhD54+Tn9dEE1P3aFAA9Ccp
	ct1BdwkDoIMeXlabeiaIpKgVJMh078LSSj16NGacjZqujOuTmBXmMHthL6r1k+A2Qv8cf6zxm82
	g0d2o22yv+ovzJHqeKjKTGivAFLLc8ugGjo6G3a0VAOeAX6hLRcLLm0Cuc3KysjHiy2Mlwwwk2k
	zzRC6wvZtFOTqOPnyO352b4yset2f/5ga+c8GzlFaLj39ROJT21X1yHBWB5f2f9CGCFcFoSt0iV
	y5GbguEfi615kJsebPaqQT6xK5LnBvjFC2QrprKa//JnHB/ql8t2agPBNrFTJIdsRAIjonDU5hb
	3B4d2vXh4w+swe50pEbnZDggqhcQk3fY3uZSmoXM=
X-Received: by 2002:a05:622a:4d98:b0:4f1:b398:551f with SMTP id d75a77b69052e-4ffa77f6136mr26639871cf.68.1767690018469;
        Tue, 06 Jan 2026 01:00:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiDIRIh0uRsi01LsmTGYlRfJRiytQ0H19Dw+EIaGym4rEAY4QFPoKpFGj+0y75JD3JHMf/gg==
X-Received: by 2002:a05:622a:4d98:b0:4f1:b398:551f with SMTP id d75a77b69052e-4ffa77f6136mr26639491cf.68.1767690018029;
        Tue, 06 Jan 2026 01:00:18 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a1e5:bc32:d004:3d67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3196825f8f.43.2026.01.06.01.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:00:17 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
Date: Tue,  6 Jan 2026 10:00:11 +0100
Message-ID: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695ccf23 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8
 a=EUspDBNiAAAA:8 a=-jpIsuwBRm6Qzzl2v0IA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: IThKIhCwQojk7VWzlWWwobpTPB5TMsOz
X-Proofpoint-ORIG-GUID: IThKIhCwQojk7VWzlWWwobpTPB5TMsOz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NiBTYWx0ZWRfX2WaZqZC+pNcY
 JkBabTvCi95XPUwkbDGHd9rMmMLPWexlSet+3893hGrVZeNlswvz+FuqcAj1Hf2KGhGRqdA8PqE
 svTd2GnCKprv+EB7Ar/AZ5LPaOb1BbCpBU+dFIxrR8wvIowr3O1KUPLrociG2x3isdAE3R71GF6
 EkDclDjBFMTNhEurF8QWoAgkzc3eIWVtPHkLqP8A0WwR7MoYUWTBZJWv90nKijMByPW5PPQpDWx
 tvV7317KNmanPQOrgflqgpP/ZhOOIR7+8Xtk9SXJ5hjD2glDtdZ5nZsFSczEeTVY/XRhifKctyA
 W4LlhnW6iqdiEK4obzVkKeq0dZgLCPZy1lEiBWfFQRerFrIvNUDvDH71QCd21aGFhlu3XKirpuy
 MkXCI6KwdAwYcDBF/jXLQ1hQ3y9gzdF5xC7xwvy4M2tYmxpVpXjWafFOM7xHNV5dMQxCNCfIJEI
 zMgwwX/dNSm6zEXVCQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_010020_388931_9A93781F 
X-CRM114-Status: GOOD (  15.20  )
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

The GPIO controller is configured as non-sleeping but it uses generic
pinctrl helpers which use a mutex for synchronization.

This can cause the following lockdep splat with shared GPIOs enabled on
boards which have multiple devices using the same GPIO:

BUG: sleeping function called from invalid context at
kernel/locking/mutex.c:591
in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 12, name:
kworker/u16:0
preempt_count: 1, expected: 0
RCU nest depth: 0, expected: 0
6 locks held by kworker/u16:0/12:
  #0: ffff0001f0018d48 ((wq_completion)events_unbound#2){+.+.}-{0:0},
at: process_one_work+0x18c/0x604
  #1: ffff8000842dbdf0 (deferred_probe_work){+.+.}-{0:0}, at:
process_one_work+0x1b4/0x604
  #2: ffff0001f18498f8 (&dev->mutex){....}-{4:4}, at:
__device_attach+0x38/0x1b0
  #3: ffff0001f75f1e90 (&gdev->srcu){.+.?}-{0:0}, at:
gpiod_direction_output_raw_commit+0x0/0x360
  #4: ffff0001f46e3db8 (&shared_desc->spinlock){....}-{3:3}, at:
gpio_shared_proxy_direction_output+0xd0/0x144 [gpio_shared_proxy]
  #5: ffff0001f180ee90 (&gdev->srcu){.+.?}-{0:0}, at:
gpiod_direction_output_raw_commit+0x0/0x360
irq event stamp: 81450
hardirqs last  enabled at (81449): [<ffff8000813acba4>]
_raw_spin_unlock_irqrestore+0x74/0x78
hardirqs last disabled at (81450): [<ffff8000813abfb8>]
_raw_spin_lock_irqsave+0x84/0x88
softirqs last  enabled at (79616): [<ffff8000811455fc>]
__alloc_skb+0x17c/0x1e8
softirqs last disabled at (79614): [<ffff8000811455fc>]
__alloc_skb+0x17c/0x1e8
CPU: 2 UID: 0 PID: 12 Comm: kworker/u16:0 Not tainted
6.19.0-rc4-next-20260105+ #11975 PREEMPT
Hardware name: Hardkernel ODROID-M1 (DT)
Workqueue: events_unbound deferred_probe_work_func
Call trace:
  show_stack+0x18/0x24 (C)
  dump_stack_lvl+0x90/0xd0
  dump_stack+0x18/0x24
  __might_resched+0x144/0x248
  __might_sleep+0x48/0x98
  __mutex_lock+0x5c/0x894
  mutex_lock_nested+0x24/0x30
  pinctrl_get_device_gpio_range+0x44/0x128
  pinctrl_gpio_direction+0x3c/0xe0
  pinctrl_gpio_direction_output+0x14/0x20
  rockchip_gpio_direction_output+0xb8/0x19c
  gpiochip_direction_output+0x38/0x94
  gpiod_direction_output_raw_commit+0x1d8/0x360
  gpiod_direction_output_nonotify+0x7c/0x230
  gpiod_direction_output+0x34/0xf8
  gpio_shared_proxy_direction_output+0xec/0x144 [gpio_shared_proxy]
  gpiochip_direction_output+0x38/0x94
  gpiod_direction_output_raw_commit+0x1d8/0x360
  gpiod_direction_output_nonotify+0x7c/0x230
  gpiod_configure_flags+0xbc/0x480
  gpiod_find_and_request+0x1a0/0x574
  gpiod_get_index+0x58/0x84
  devm_gpiod_get_index+0x20/0xb4
  devm_gpiod_get_optional+0x18/0x30
  rockchip_pcie_probe+0x98/0x380
  platform_probe+0x5c/0xac
  really_probe+0xbc/0x298

Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
Cc: stable@vger.kernel.org
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/d035fc29-3b03-4cd6-b8ec-001f93540bc6@samsung.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-rockchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 47174eb3ba76..bae2061f15fc 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -593,6 +593,7 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
 	gc->ngpio = bank->nr_pins;
 	gc->label = bank->name;
 	gc->parent = bank->dev;
+	gc->can_sleep = true;
 
 	ret = gpiochip_add_data(gc, bank);
 	if (ret) {
-- 
2.47.3


