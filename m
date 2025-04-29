Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8213C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 17:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sc4+TzSowcDRl7hLIypowfP7AcQ7Rbov5yPrrWksHAo=; b=UwmvUpi1jnhcAh03f2Ebqu+fxH
	qzohVwRQzBftk7RT1AaY5UCCeezgmuYWX/JO5GZIMkkkNs5wnmO8Wdlejrg9ASBXQiuSfCJgJHaI4
	n2iMzCutA6Lj0FpKywj32FKPk2/sa+uJVIIaqAjj8jyKG9SmywYyoj/xDhpe9T8Gd4fbb7O3WbnBb
	cbNQebotqGxC1LOd5E5Vwta2SXjX2abf95+143GUo8HU6Nduc6XuXNA4n8t83pySszaEExqkNyhPz
	3XukRvkM83yVH1kXXbrEjjsKGusSY60osadrk+JtQFAbDKZEwNdWCZml1zoBKK/zbc9Blsw/2Xvni
	3TnSNcrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oqR-0000000AQA9-15ji;
	Tue, 29 Apr 2025 17:34:11 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9omk-0000000APgP-0sCG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 17:30:23 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so790500a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 10:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745947820; x=1746552620; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sc4+TzSowcDRl7hLIypowfP7AcQ7Rbov5yPrrWksHAo=;
        b=YvT9VeaavGgAVO+6rmtu/AZVIaWMqiEgrcyrRgVQ45fvFatxIO6/eEPUGaH/8pdlFP
         s5A525CurFRT1s+6dzqLe++w3JGarzU/ZgUSom1pLkGr0lCFB8pQePK8gMHci74xB+1L
         Wb7MHfcX4BSo/nZ+VpNbIbySUJ5QIJPnfArRhjGsteWuIXU4/4JhhYuviDRI0LtmJuDF
         zSNqxWKWFUzICSEF3EYmT5lEoUPYGQgl05gk21g5lHAXTAX6c1HBurb1OE4F58hyJXim
         9R4vieTfHs59rC4RFcA2/ZE1EakjTGCRxQE/0WBTr5LTH7dx0t4Jayhr3VxPecWBghP7
         eeyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745947820; x=1746552620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sc4+TzSowcDRl7hLIypowfP7AcQ7Rbov5yPrrWksHAo=;
        b=uOVEGc/Jlqixw06uajev36Wrtms+8/XHK+SSJVPVvtbjOs9GNV/Q1p16g2016cfMSP
         MtfuFxVAXtDcXKv01648ozIjqW5696nRbQ6/uZ3gv8ytGZFlCcffUs8ItvbZWVxeUIpT
         pICBLZh+VVenlBzM1TfMHDShq2WtkjtfbAF7r4ceCdF3n6pQHb3wVb2790v7BUjLWIHJ
         adv0Xls4QXRJvBfxQEeM6R9i+SDGHQ5mc7YW7ZGjIQAghbua9Vk4C8F2jN6PAdL4JfDx
         3OGuNR1/OGZpvgdPtGXzcYEMwuGboDoqe8E6sQ980V3prpIAUBalFpL5VdCsM/CdfnFT
         Ovng==
X-Forwarded-Encrypted: i=1; AJvYcCVohxQh60F9GMKXmJqDt+2YMYlf9ag+Z95Enl1oswnk/KhLCaRje2S/TDoYV7cETIPsJSZvhYChBjaq292FCUj1@lists.infradead.org
X-Gm-Message-State: AOJu0YzmVSOSym2MEEf/gycjGkC/Fze4UO+yOK4QS6bEaG1kNDdXWBh5
	OYyXBQG/fmO/299N6HmvjSjUx8OxxrspsVL83V7p+E+rcga94ruIl9OWgOrDBdCIZ24DnCKWcuk
	b5uTd9O+AX9IhVbxgU6Etn3yniWkrUf/6psw/Ig==
X-Gm-Gg: ASbGnctmmafjUuNh+Tkz+fJDg78wHyDzZ7r3hvuB6PU7ZbNh5OKrGhwiQXnrJvNvcEp
	BSt2Ut0xDIlbtyF/mJzEN0D7zKz2YdKBWY+ur+B7/a9kTI9Rj5UKT0kQOnWuGhNzk23TFT3r3JK
	evABDe32BKNu5Msa8yrGCMlXm2+fSObP+avvNoSzjyV5fT9vXmUefg+Cc9
X-Google-Smtp-Source: AGHT+IFehYf0d8PpH1R2BJB2r7eFTKl8u51pe/GzhtkLgjZNrelsbpFr//PxWWkACriX1/8jtoRJQERGiEtx1uS0LIQ=
X-Received: by 2002:a05:6402:40d3:b0:5e5:bdfe:6bfb with SMTP id
 4fb4d7f45d1cf-5f83885f55bmr4196335a12.16.1745947819729; Tue, 29 Apr 2025
 10:30:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250426065348.1234391-1-xiaolei.wang@windriver.com>
 <20250426065348.1234391-3-xiaolei.wang@windriver.com> <09bab7ab-badd-4a7d-9ba5-5dd7181f6a6f@windriver.com>
In-Reply-To: <09bab7ab-badd-4a7d-9ba5-5dd7181f6a6f@windriver.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 29 Apr 2025 11:30:08 -0600
X-Gm-Features: ATxdqUGGH1oEM35wjSVapCU_wc_NAw2TKa6cQrQ2zmSrZZbypcsXceaQ3lXxPSI
Message-ID: <CANLsYkynk4wogcEAvVQ-MTyCGRF3CyqSjxaKUS4eYCbGsL7+Kg@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] remoteproc: core: release rproc->clean_table after
 rproc_attach() fails
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_103022_256205_CB4873D5 
X-CRM114-Status: GOOD (  20.06  )
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

On Mon, 28 Apr 2025 at 20:20, Xiaolei Wang <xiaolei.wang@windriver.com> wrote:
>
>
> On 4/26/25 14:53, Xiaolei Wang wrote:
> > When rproc->state = RPROC_DETACHED is attached to remote processor
> > through rproc_attach(), if rproc_handle_resources() returns failure,
> > then the clean table should be released, otherwise the following
> > memory leak will occur.
> >
> > unreferenced object 0xffff000086a99800 (size 1024):
> > comm "kworker/u12:3", pid 59, jiffies 4294893670 (age 121.140s)
> > hex dump (first 32 bytes):
> > 00 00 00 00 00 80 00 00 00 00 00 00 00 00 10 00 ............
> > 00 00 00 00 00 00 08 00 00 00 00 00 00 00 00 00 ............
> > backtrace:
> >   [<000000008bbe4ca8>] slab_post_alloc_hook+0x98/0x3fc
> >   [<000000003b8a272b>] __kmem_cache_alloc_node+0x13c/0x230
> >   [<000000007a507c51>] __kmalloc_node_track_caller+0x5c/0x260
> >   [<0000000037818dae>] kmemdup+0x34/0x60
> >   [<00000000610f7f57>] rproc_boot+0x35c/0x56c
> >   [<0000000065f8871a>] rproc_add+0x124/0x17c
> >   [<00000000497416ee>] imx_rproc_probe+0x4ec/0x5d4
> >   [<000000003bcaa37d>] platform_probe+0x68/0xd8
> >   [<00000000771577f9>] really_probe+0x110/0x27c
> >   [<00000000531fea59>] __driver_probe_device+0x78/0x12c
> >   [<0000000080036a04>] driver_probe_device+0x3c/0x118
> >   [<000000007e0bddcb>] __device_attach_driver+0xb8/0xf8
> >   [<000000000cf1fa33>] bus_for_each_drv+0x84/0xe4
> >   [<000000001a53b53e>] __device_attach+0xfc/0x18c
> >   [<00000000d1a2a32c>] device_initial_probe+0x14/0x20
> >   [<00000000d8f8b7ae>] bus_probe_device+0xb0/0xb4
> >   unreferenced object 0xffff0000864c9690 (size 16):
> >
> > Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> > ---
> >   drivers/remoteproc/remoteproc_core.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index b21eedefff87..6226e2d12a97 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1656,6 +1656,7 @@ static int rproc_attach(struct rproc *rproc)
> >   unprepare_device:
> >       /* release HW resources if needed */
> >       rproc_unprepare_device(rproc);
> > +     kfree(rproc->clean_table);
> >   disable_iommu:
> >       rproc_disable_iommu(rproc);
> >       return ret;
>
> Hi Mathieu
>
> For this patch, if I use devm_kmemdup() instead of kmemdup()

I don't think using devm_kmemdup() would work in this case since the
memory is only free'd when rproc->dev is released.  So if you have
Attach()->detach()->attach(), we'd only keep accumulating memory that
is no longer used.

>
> in rproc_set_rsc_table() function, is it better? Also delete
>
> kfree(rproc->clean_table) in rproc_set_rsc_table()
>
> thanks
>
> xiaolei
>

