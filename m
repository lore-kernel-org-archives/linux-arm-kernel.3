Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E375CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 10:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ox+ASz/ygCGbDPlwbrM1KbYJZn86PmGYPGqT1vetcCo=; b=NWcyRtXRyRDfXJXgxok92aiowH
	bS/ODHjiq/3i9X14uu2LZjKupXkXi7g8wu+wHBDBLf8EmCzYWnhhC8POP3FJChZwwIxSccEQQUsGJ
	g0GNYN5vYYVVzEEmuRX5s3WynXolLThRDzE61WNB4S02rEYM45hu6GYhybCOfvbzWPdmFtzVpyCzi
	ZXGM6m4t08koUq3CdytDYz38c1KHGNaixa6e5LzKMkWPcW3D057HI0UVQDpzcTbSzw4NipNe6pOoI
	cs8Po6ifl605tdUgs3q+ZMEcZkl/TPOC7FwOy94QvNQQqdLSY6kymOycQYzYJWkmGCP+G0eJkDVZD
	yJ2T9WzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKwFC-00000003X84-0lIN;
	Thu, 07 May 2026 10:46:14 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKwF9-00000003X70-43kY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 10:46:13 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso4084435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 03:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778150770; x=1778755570; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ox+ASz/ygCGbDPlwbrM1KbYJZn86PmGYPGqT1vetcCo=;
        b=Dwzop05FBUeq1UcgSnLbBrABqjTcwP6vN5AgbijkuVf+kth6Uy+5mMXp4KXFbGeq1l
         FxzVodVXYttE+jEG1HDTYKZeyP84GSdVnwFkYkocyud6REMm6d/6q/sQSKZ79H46ol1Z
         db5Bpv1xEYc4/lgTDXE3jXgoYQ86+f0Sv15l3yCyCYOqVWB21zuyn89oAhAtrVcPm5f7
         CM3udCN8n/aExZ93siEYEtFrNlL77BsEcQN1et6oPEY1E/OCpjr+Zlt9AavHrEVWz00Q
         vGPE0aH3OtAzR3v8C9BL/JohiJO+QwI2P9cpic3zchH9LuG+KNiBMKvw+qVPbAH706zu
         pjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778150770; x=1778755570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ox+ASz/ygCGbDPlwbrM1KbYJZn86PmGYPGqT1vetcCo=;
        b=OmvYHttTy4uoCrGdSioTNlGhCC2d5HIo5Fw2lgs8IBj/Kl6ynDkcoVrGJPs5dh0lBg
         8ovDYjgSIHiziaGdP75zSm+vh8LwBPUsDFDInEHCKaZ7zdqdG9eT+lmHlhxSjl7ePgZ5
         uzrQb/rsNuY/MpPQCKFQ6GBwwoZX4WzqhFvjSpVkPkqPgEhvlqNSbHDumAglUuUp9qZZ
         nzC76zcPdODAW3fT2WU9H8XZhROocVvEoLn0uTSRLhy0EreNuKdRPbk9tSVJHWTTOyXQ
         05AEFI0FdLaIGcIaO7hEh5FCf5BRSP6jtRT3GqVb/EtBxXWdrn3RJhZb2kYYcqjr1+rQ
         cnuw==
X-Forwarded-Encrypted: i=1; AFNElJ9c1FFKSNHlqgqgCnvHKOH4GCKbvSo2+oaoaJcdGo+KNk77XyYDut34c2jD8ZilLjWBGIZbrUnyVKGXBmJYM4wq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/G43zUUH78zGL8pAsziqnQonzxdP3KEyooRfX75nvx8p2meZl
	j/t3Vuqpgtj37bKPrHb86/jf7vYazqiK+ykyWosy4elOqnHsNVX+pbZA
X-Gm-Gg: AeBDieuki0vr/CKroOtHX9sRFhenU7pdjZAQkmS8ztXfpKobZNKmqjkSZ3dPKRIGTHd
	ftE+WIXUfbmAdJc3cBVZ0iaJjJDMdsPC34VFPoWQoJoDU4u6ZEQNuRwSL084jvmIPoR7VQ7A9DO
	i+TVVPP+U88eFZlO9BoRF7aWsIiVMGLe+WbBEZguKm/V4Ar1jkhMYZq7YIP50KacxXiqlMs3G1m
	O8OXBzWDcoXJqlBlSppEyPRg6ha1eS7eLBtQiTujdtEYOCBPZ77cTMJ/RJlRQOOk0nw6xSG1c9q
	Xjy6Oq3c8ukF6rN9L2WWS2of9LxZbridqQd6GNVLTDay/Cdnlk9EDn+Fx52e75jaHDH51uf8cS/
	3Y1Ur4YSA0QGRNODb6h3fZoqYT+9H7oKPiOSqGwO6LiBUwpCuCff44TrY0ZFk46UJJwROLp6c6B
	mKWewY7IigN5bHkZEEJ0J5x/SR2UbN/DCo+72ECRZE0hb7T436ZstSmaNllU4R+F4OMDS+ggfFx
	bAAYzJFOiIyjwj2Mq83JxIHoXvTa63bqO0UiFGKeSkWzMGunAKHl69am6ARwCF5ZjpZmbyeWMr7
	xpLDfiQj
X-Received: by 2002:a05:600c:8b04:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-48e51f183demr114547455e9.5.1778150769818;
        Thu, 07 May 2026 03:46:09 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538b6e9bsm197646665e9.10.2026.05.07.03.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:46:09 -0700 (PDT)
Date: Thu, 7 May 2026 12:46:08 +0200
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, jun.li@nxp.com, 
	Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v3 3/3] usb: dwc3: imx8mp: disable auto suspend for host
 role
Message-ID: <k2sxmwhrv3tivustfnpz54ehuufkcrcruu2uuukuyugqtqljzl@5roxndm5fn5u>
References: <20260108081433.2119328-1-xu.yang_2@nxp.com>
 <20260108081433.2119328-3-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108081433.2119328-3-xu.yang_2@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_034612_038046_7AE787B8 
X-CRM114-Status: GOOD (  19.13  )
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

On Thu, Jan 08, 2026 at 04:14:33PM +0800, Xu Yang wrote:
> Do dwc3 core auto suspend enable for device and disable for host
> , this can make sure dwc3 core device auto suspend setting is
> correct all the time, the background of disable dwc3 core device
> auto suspend is to make its parent device suspend immediately
> (so wakeup enable can be enabled) after xhci-plat device suspended,
> for device mode, we keep the dwc3 core device auto suspend is to
> give some wait for gadget to be enumerated.
> 
> Note: It's a temporary solution until we switch to using the new
>       flatten model.
> 
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Hi Xu,

We have a kernel issue introduced by this patch on an iMX95, where we 
use the dwc3 usb as otg. This appears to be due to a race condition that
occurs during probe, when the parent attempts to access the driver data
from the dwc3 child. I saw your work on the new flattened model driver 
for the iMX SoCs and that it will soon be applied to the iMX95 as well. 
Does this mean that the issue shown below should no longer appear, as 
there will be no parent/child dependency?

Do you think there are any actions needed on this patch?

Here the warning with decoded trace:

[    6.905882] ------------[ cut here ]------------
[    6.910518] WARNING: drivers/base/core.c:1640 at device_del+0x2b4/0x384, CPU#4: 5/87
[    6.919309] Modules linked in: libaes(+) tcpci(+) ulpi tcpm phy_fsl_imx8mq_usb(+) gf128mul snd_soc_simple_card(+) ehci_hcd imx_pc4
[    6.964627] CPU: 4 UID: 0 PID: 87 Comm: kworker/u24:5 Not tainted 7.0.0-rc1+ #2 PREEMPT
[    6.972716] Hardware name: Aquila iMX95 on Aquila Development Board (DT)
[    6.979409] Workqueue: events_unbound deferred_probe_work_func
[    6.985247] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    6.992199] pc : device_del (drivers/base/core.c:1640 drivers/base/core.c:3882)
[    6.996028] lr : device_del (drivers/base/core.c:1634 drivers/base/core.c:3882)
[    6.999865] sp : ffff800080b339f0
[    7.003169] x29: ffff800080b339f0 x28: 0000000000000000 x27: 0000000000000000
[    7.010295] x26: ffff00008004ac28 x25: ffff0001ff067610 x24: ffff00008befdcc0
[    7.017427] x23: ffff000080ad8810 x22: 0000000004208060 x21: ffffa5bb53ea78f0
[    7.024560] x20: ffff00008befdc10 x19: ffff00008befdcb8 x18: 0000000000000000
[    7.031693] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[    7.038825] x14: 0000000000000004 x13: ffff000080129910 x12: 0000000000000000
[    7.045958] x11: ffff0000822ac0e8 x10: ffff0000822ac000 x9 : ffff000080129910
[    7.053090] x8 : ffff0000822ac028 x7 : 0000000000000000 x6 : ffff0000822af458
[    7.060223] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
[    7.067356] x2 : ffff00008253e580 x1 : 0000000000000003 x0 : ffff0000895d1400
[    7.074485] Call trace:
[    7.076923]  device_del (drivers/base/core.c:1640 drivers/base/core.c:3882) (P)
[    7.080754]  platform_device_del.part.0 (drivers/base/platform.c:794)
[    7.085458]  platform_device_unregister (drivers/base/platform.c:593 drivers/base/platform.c:835)
[    7.090164]  of_platform_device_destroy (drivers/of/platform.c:621 drivers/of/platform.c:607)
[    7.094950]  device_for_each_child_reverse (drivers/base/core.c:4048)
[    7.099922]  of_platform_depopulate (./include/linux/of.h:208 drivers/of/platform.c:644 drivers/of/platform.c:640)
[    7.104282] dwc3_imx8mp_probe (drivers/usb/dwc3/dwc3-imx8mp.c:291) dwc3_imx8mp
[    7.109588]  platform_probe (drivers/base/platform.c:1449)
[    7.113260]  really_probe (drivers/base/dd.c:583 drivers/base/dd.c:661)
[    7.116833]  __driver_probe_device (drivers/base/dd.c:803)
[    7.121199]  driver_probe_device (drivers/base/dd.c:833)
[    7.125385]  __device_attach_driver (drivers/base/dd.c:962)
[    7.129831]  bus_for_each_drv (drivers/base/bus.c:500)
[    7.133663]  __device_attach (drivers/base/dd.c:1035)
[    7.137494]  device_initial_probe (drivers/base/dd.c:1088)
[    7.141671]  bus_probe_device (drivers/base/bus.c:576)
[    7.145502]  deferred_probe_work_func (drivers/base/dd.c:125 (discriminator 14))
[    7.150035]  process_one_work (kernel/workqueue.c:3286)
[    7.154047]  worker_thread (kernel/workqueue.c:3352 kernel/workqueue.c:3439)
[    7.157791]  kthread (kernel/kthread.c:467)
[    7.161030]  ret_from_fork (arch/arm64/kernel/entry.S:861)
[    7.164610] ---[ end trace 0000000000000000 ]---

Best regards,

Franz

