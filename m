Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C102C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 20:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMFVi6kMs2GlW3FqbZ+c8W0mX4h+96g36QjGWqU5rnM=; b=znjEWAijWEPHEpHCTRbui475tl
	MLQxiXZeXQfzGYCLhb8/0dZC3GvLwFVGt3mFNc5YfesYdY+AdwKjbXcicw0sVIwQWCWgKRdBgHRKC
	ui2UbM9/lEWl9sy03uaHi8oIeZsaUSJO6Ya3T54cTZoRyc6M3ei62C80zcWksnudvc6yyHpmF5Yrx
	V0+Vw6IfcPv4aMEQ4UIeo9W1Ayart9MB47CGjyQWEJ2Ry7FyBTIop+bMpZWj9wWkQK4tEJPim2irg
	N6dJAf438Ap+cj/SXxX1oirK9GsOcMmz3UoL9nS07OswY+5BKcBsdmlmwZ7IGH/yYXDf4WlKhVIRs
	NUo8N7ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8lwx-00000002TQ3-0l9I;
	Sat, 26 Apr 2025 20:16:35 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8lv5-00000002TI0-0fav
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 20:14:40 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso6628615a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 13:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745698476; x=1746303276; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iMFVi6kMs2GlW3FqbZ+c8W0mX4h+96g36QjGWqU5rnM=;
        b=eipx2g2bOaNeLoHMv138h3Y+OHPADg5PFgM+kbwvJdr+Pa+kuPj5633Wo3r4dYgbA6
         7DBZ1nmHfJL5Aor2A0vXESdlNvpGJy6DBf/B6eJ/HRAENq98qCIGKZ/ypFSaQdvMS7x+
         SKL2Tq7d+mbrCOPVmtp2pW1e7mzgf+1miWkqkHz+6AsuDzAWI5VKYwgVtygItSLvi7eg
         FMl0/VcYebywNdx1sSs8Q4WPjuJ2TRk9FcW6ef9RUaE9vS+dNTV5bDyC4EdFZchK9h+F
         yzmRyrzRmDBUh+E18CYqHom3IoZVNjxI+u2dJYrwpfsuyaZY+8zGrkJ/6SBawHYzTedk
         sjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745698476; x=1746303276;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iMFVi6kMs2GlW3FqbZ+c8W0mX4h+96g36QjGWqU5rnM=;
        b=a5zjabbApOWG5Zez66STkNFrFKh2YLXrV4sub6zm0Zuk56GDCaSClm7begzQj875Qh
         GyE4zINGqbhjaiTmCpZD6qdC4yHW/2mr/JsXoi3fnAprbfar/xAO6f/zIH8GZb7NG/mQ
         ad2CCCYeP4IGqUizLnakkzRil9Nh/Ebos/DDHbeM9kf6QD4pi20UBov6+7B7Y+dBFV5x
         1KhBpY0dW+BJtbOXROOEs/TSSf/7iYgUMbGOOzhsaA3+7r29u03gZoYlRlyv7Sz6Yq+x
         BXMrMetgZA+8FSbwuXCqef3NEfkgnJsHZ0e0EnWFwACHa+p/2lGcpEmJOlFmHpXraGpq
         JnNA==
X-Forwarded-Encrypted: i=1; AJvYcCXu2OBtkc2n06jh480VKabsBN59D/fKayQG0/8JPDXDWZel4WZWBJ/GloOqig0R++H9yVYcFoST7g2igsP5l8Ip@lists.infradead.org
X-Gm-Message-State: AOJu0YyeLbrSXDEicpZCcTf0qIii7C3wO2RNFBb0G5wlznAkPGfA5clH
	kVdHhJRmse4EY64yOBYw8lhK2b786VCRAiqaAVK0NbugX080+zwjAnid2pkXXl/kv537NDJQKhY
	tGtIu7P9jcBOKQS/XhezpN/jjal38U5YBvbQteA==
X-Gm-Gg: ASbGncu0yjzfPWFHOiXp41rkY+Atr9cOyoFuNA2JrbnLBTUl0K/w/Avl5oVPnxhwnnv
	ugKwPSQhzqdJdwxH8vk+L3TfjhX2slSN1zZLSABxe4yBUkh2/iaxMhCU9E9l+MZPyhzZSsnMY/3
	Mo2b7Puzv4T7mSSpHLan1+Cai622zTtMR+BYwohxQBm6O5/1oMbXWi+JbC
X-Google-Smtp-Source: AGHT+IFzAcYkrWSpLnALMz4IOmWDHGW3c3A0BJ5sxt15g5Kcfu+Hi0BvKk6p41FqxLu0PhKfP/bQOHVtQB7bKF8yLXM=
X-Received: by 2002:a05:6402:274c:b0:5ec:fb3d:f51f with SMTP id
 4fb4d7f45d1cf-5f72269088bmr5668937a12.10.1745698475929; Sat, 26 Apr 2025
 13:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250426065348.1234391-1-xiaolei.wang@windriver.com>
 <20250426065348.1234391-2-xiaolei.wang@windriver.com> <20250426131804.GA13806@nxa18884-linux>
 <12b34414-94cc-4f84-ae63-0ecc38bf5efb@windriver.com>
In-Reply-To: <12b34414-94cc-4f84-ae63-0ecc38bf5efb@windriver.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Sat, 26 Apr 2025 14:14:24 -0600
X-Gm-Features: ATxdqUEm-fDJNLvyvlQsgTBEC97JqhRG-_wf6f2Ng6j5VajbYKC45hcbu2ANAzk
Message-ID: <CANLsYkzNE-Z8LwEtpXrmnWLLDNvzjFYaFHVePE_mSkmWVdQ6Zg@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] remoteproc: imx_rproc: release carveout under
 imx_rproc after rproc_attach() fails
To: xiaolei wang <xiaolei.wang@windriver.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, andersson@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_131439_209124_E268ED5B 
X-CRM114-Status: GOOD (  23.35  )
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

On Sat, 26 Apr 2025 at 07:46, xiaolei wang <xiaolei.wang@windriver.com> wrote:
>
>
> On 4/26/25 21:18, Peng Fan wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender and know the content is safe.
> >
> > On Sat, Apr 26, 2025 at 02:53:47PM +0800, Xiaolei Wang wrote:
> >> When rproc->state = RPROC_DETACHED and rproc_attach() is used
> >> to attach to the remote processor, if rproc_handle_resources()
> >> returns a failure, the resources allocated by rproc_prepare_device()
> >> should be released, otherwise the following memory leak will occur.
> >>
> >> Therefore, add imx_rproc_unprepare() to imx_rproc to release the
> >> memory allocated in imx_rproc_prepare().
> >>
> >> unreferenced object 0xffff0000861c5d00 (size 128):
> >> comm "kworker/u12:3", pid 59, jiffies 4294893509 (age 149.220s)
> >> hex dump (first 32 bytes):
> >> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
> >> 00 00 02 88 00 00 00 00 00 00 10 00 00 00 00 00 ............
> >> backtrace:
> >> [<00000000f949fe18>] slab_post_alloc_hook+0x98/0x37c
> >> [<00000000adbfb3e7>] __kmem_cache_alloc_node+0x138/0x2e0
> >> [<00000000521c0345>] kmalloc_trace+0x40/0x158
> >> [<000000004e330a49>] rproc_mem_entry_init+0x60/0xf8
> >> [<000000002815755e>] imx_rproc_prepare+0xe0/0x180
> >> [<0000000003f61b4e>] rproc_boot+0x2ec/0x528
> >> [<00000000e7e994ac>] rproc_add+0x124/0x17c
> >> [<0000000048594076>] imx_rproc_probe+0x4ec/0x5d4
> >> [<00000000efc298a1>] platform_probe+0x68/0xd8
> >> [<00000000110be6fe>] really_probe+0x110/0x27c
> >> [<00000000e245c0ae>] __driver_probe_device+0x78/0x12c
> >> [<00000000f61f6f5e>] driver_probe_device+0x3c/0x118
> >> [<00000000a7874938>] __device_attach_driver+0xb8/0xf8
> >> [<0000000065319e69>] bus_for_each_drv+0x84/0xe4
> >> [<00000000db3eb243>] __device_attach+0xfc/0x18c
> >> [<0000000072e4e1a4>] device_initial_probe+0x14/0x20
> >>
> > Fix Tag?
>
> I will add it
>
> >
> >> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> >> ---
> >> drivers/remoteproc/imx_rproc.c | 14 ++++++++++++++
> >> 1 file changed, 14 insertions(+)
> >>
> >> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> >> index 74299af1d7f1..c489bd15ee91 100644
> >> --- a/drivers/remoteproc/imx_rproc.c
> >> +++ b/drivers/remoteproc/imx_rproc.c
> >> @@ -595,6 +595,19 @@ static int imx_rproc_prepare(struct rproc *rproc)
> >>        return  0;
> >> }
> >>
> >> +static int imx_rproc_unprepare(struct rproc *rproc)
> >> +{
> >> +      struct rproc_mem_entry *entry, *tmp;
> >> +
> >> +      rproc_coredump_cleanup(rproc);
> >> +      /* clean up carveout allocations */
> >> +      list_for_each_entry_safe(entry, tmp, &rproc->carveouts, node) {
> >> +              list_del(&entry->node);
> >> +              kfree(entry);
> >> +      }
> >> +      return  0;
> > Could "rproc_resource_cleanup(rproc);" be used here?
>
> Thanks for your suggestion, I will try it

Before sending another revision, please detail the steps needed to
reproduce this problem.

>
> thanks
>
> xiaolei
>
> >
> > Regards,
> > Peng

