Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DE6CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 14:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUwMeqcEfoa+UhA6Poo9oYBXifJqH1s4dgYVK+G4bjs=; b=nLMvrAWDo5qNApZu0/aq2gB6Qw
	DE7DuuTVWdpFPJrT5OABfoqGqd4K7EODIBbJeVfLBMyBc05X0mlFL1wVXEMIXbzt0XN1CV74MqWun
	npRbCQcS894eR9QNyK3YQT0fnFSRNN6wi2zgKlovaKWPPD9DuPUL1SgGp/NF4KOM9cvJ3xSrcG8pn
	Ws74XKqGKq7VPQZtfxgeG6fnOP+VXpNZjwk/PuBfvFfdVWV1KXhw6i73xFqyH+CdsdL/rIkhN6wI1
	Dom63PNGgaXBzKNVgSaEy+hZUW1pPj+L224ak/72zfYBKAvDlWz07B6NVcs7qJ6dwjyIGTS0Nchd+
	bvCojE/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQz0-0000000B97r-2UYh;
	Fri, 22 May 2026 14:36:14 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQyx-0000000B977-19yx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 14:36:12 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-67c2d57a5ceso11719827a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 07:36:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779460569; cv=none;
        d=google.com; s=arc-20240605;
        b=Ymx4nEa0Ln89gWQIvyvcoWwkLx6thkl2+ajaX1T2Q5VO6dbq3ZLXqI/5qrB3bJ9714
         /+56VYNzYtj6DZR/RTkKaGuOiOeafyyNtAjoSNQIM0UWDn/iL4A1PtxB5haVJGouV70A
         mFrlbQd+m408EmOddCWbHO4eP1RO36xMI7TT5Io+YT25maiyHGxPeKQDM4OqIVB07RhR
         346jI/XE32i1QAYMX6wT68xAyt15QvGlpUcZY5Y6fxmHO+ny3T+Tgs8inpXFvCpQTNxt
         GhhpLXi00xfZjmTco2URpqsWcrtOpSymrKAHZ0gVy4Q5WlHTkJeX2Hu4by3sMTDt2mRZ
         I79w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iUwMeqcEfoa+UhA6Poo9oYBXifJqH1s4dgYVK+G4bjs=;
        fh=/1O3GvXRaJMTPDW9gKV0fiUD4goMH7nGv22QevX66so=;
        b=g9b0BpoeQGFav2P9Hcpwa5tgOP/ZJ+SxjUsZl6qHSYGrK7fp9jotYp51fOPYSFzg7t
         P/dmaeWDM0uKdESadZoqyW1xXCteOOJ2avAvTVoIxa8j24b/CJNljIejOI2YeNGKQtCN
         6GtS3NzOLMJyzKvJN8z2DwgkjtIx0TQv9NmN4YKE0qQeZj3O4t0vJgqkHTGpBuVOHHsz
         0/8If5d5I5NEdRLDw0FVaLWIJBbED40f5SQyGp+IfbLQnQpnQxlQz9F6qdNOSj/8oyHw
         LXPCPvyPMZO01wYK0i81Ji1e9ywKcXgi66sNc9JNunke5c7b+Edd430+mXweeEYEMkHW
         8wAg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779460569; x=1780065369; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iUwMeqcEfoa+UhA6Poo9oYBXifJqH1s4dgYVK+G4bjs=;
        b=gB+MLkc8Rlqa6VzIfUhWfzHajK4KgOehqjHqfeZJnzelFlBXKO5Tbjdo8WvHQXD9W2
         4TEVeOB+dYgTW1tx6bY54wn5I3O8o+ybb7nVMzgyk+mkqw0dh90UL3Ux1DdDFW+aZg4d
         nmD+lk2s+qtounGd0l9JiXMU7KrvvKF+aLD3gdUtnlHCppPCKxEdwDbVFgvKmSg/+Qd4
         YYLIi9g8e1y2N9W6KXDhMlw1t8tqcWYRy2D7Q1IjnR3PIfDHkX0f/CSrIqMS0RplBRk/
         quHpRIFYSFyVzH7SO6841PyqnC8Gy5VeYiIiONJYMNKApY7RbUDR3Birrr4uKjsp9Otj
         yOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779460569; x=1780065369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUwMeqcEfoa+UhA6Poo9oYBXifJqH1s4dgYVK+G4bjs=;
        b=NezXzZCX6IdSITy1cCi1ssDdnaVZLCYwtqfEmyK4A1ijSJEABEQvyOKC5ngTwD7Bx2
         5pq8egtcL3dTbNZKqOsU9WK72CaZi3wCyc6vSavZL9o+tiGMX2802cx5wA4GWd67OgOM
         /4pkzXBr3a2zgxDC+JQztkSX4fh5SvGbRxeBHpjQzX+UIUmXT32kS9edBC9yOnb7NQ/V
         HEgJpoNt1DQ8u+MHxXtdt1bT18OEDMT6rfdI/htRnrgjdq4U9f3KDOr7HECkRf1P30EW
         YNGAeuczoDGbbcgERrT8WrCT/iF06xJBQh9mWBGhI4EFS212dz3tIf6olA0kvKbZU3G5
         0LgA==
X-Forwarded-Encrypted: i=1; AFNElJ9snrxYJuEO4Oh39ikc0QgD2H8SYWSOsup7i57LdvyMt/p62QDrLb2hIdVUIn5oAs8e1ZOwC/f9ljGir4XuMkaz@lists.infradead.org
X-Gm-Message-State: AOJu0YwaEk7jbbzFWipW8LCLrO7k9mMqCTUt71KNm78/mjk3CqpBlc8X
	Vcxe6U85hPPEN+f0LixGr32QX1WgLGXxBeg+EjwMMHcO+Jk1wKqZzGsLnG/KoFjbMjylP7TwUev
	OwDljDi8Tqd0OhimM1RFXpTmKKaP0iNspQU1CaNE2nw==
X-Gm-Gg: Acq92OEsQFyXd1xBulO1tJKhrQsY+DM4xn3x7TFrczMJPmNn9OrgDNu9WdafXGAgtOO
	FLD65Ho88MzbUw6fwTdRDwQnFSDV7ehBuzn6teEPEKyZ8UdcZuip8j9QdQvYiGclBP5nrFtVaa8
	+n32CgrpSfhhbKhqZ3sDPaG1SCpbJ//cfghL6t3sGwvtQKdP6cQvRzivuk08BUk5czApk89cQqG
	JdyG9iApSJMp/4jEE2gA81tU0ujDfGapMBwZUp4nNJi3ue5WUM8LLFoJdGhpQ7M+MSwjX996aVN
	S71KvF4ZgnvqpW540e64vQUjrxb9D1cVTd15lfw9
X-Received: by 2002:a05:6402:4302:b0:678:edab:6f40 with SMTP id
 4fb4d7f45d1cf-6889c422bfemr2167605a12.4.1779460568984; Fri, 22 May 2026
 07:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260501143707.1591110-1-tanmay.shah@amd.com> <20260501143707.1591110-3-tanmay.shah@amd.com>
 <ag9FcXeIIiJWdld7@p14s> <cbd418a3-1585-4592-8e86-b0750e19ec0f@amd.com> <be63e9a0-e325-46eb-9c03-54dc22878ed6@amd.com>
In-Reply-To: <be63e9a0-e325-46eb-9c03-54dc22878ed6@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 22 May 2026 08:35:57 -0600
X-Gm-Features: AVHnY4LtwSS30HSBRhVWgPEV2L1wcvx433tVw1FA3kjt7ZBX0HcUlAqaB0u01-U
Message-ID: <CANLsYkwqx38oafrjbFmKMhQ7Nat8X3W1GSY76BjN=Q+mavAE5w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] remoteproc: xlnx: enable auto boot feature
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, michal.simek@amd.com, ben.levinsky@amd.com, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_073611_409893_2CBF0756 
X-CRM114-Status: GOOD (  58.88  )
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

On Thu, 21 May 2026 at 12:48, Shah, Tanmay <tanmays@amd.com> wrote:
>
>
>
> On 5/21/2026 1:38 PM, Shah, Tanmay wrote:
> > Hello,
> >
> > Thank you for the reviews, please find my comments below:
> >
> > On 5/21/2026 12:48 PM, Mathieu Poirier wrote:
> >> Good morning,
> >>
> >> I don't recal reviewing the first revision of this set.  Can you provide a link
> >> to it so that I can read the comments that were provided?
> >>
> >
> > Here it is:
> > https://lore.kernel.org/linux-remoteproc/20260422202558.2362971-1-tanmay.shah@amd.com/
> >
> > The device-tree bindings needed rework in v1, so I sent v2, before we
> > ever reviewed the driver part.
> >
> >
> >> On Fri, May 01, 2026 at 07:37:07AM -0700, Tanmay Shah wrote:
> >>> remoteproc framework has capability to start (or attach to) the remote
> >>
> >> The remoteproc framework...
> >>
> >
> > Ack.
> >
> >>> processor automatically if auto boot flag is set by the driver during
> >>> probe. If remote core is not started before the Linux boot, and linux is
> >>> expected to start the remote core then it uses "firmware-name" property
> >>> to load default firmware during auto boot.
> >>>
> >>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >>> ---
> >>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 48 +++++++++++++++++--------
> >>>  1 file changed, 34 insertions(+), 14 deletions(-)
> >>>
> >>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >>> index 45a62cb98072..652030f9cea2 100644
> >>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> >>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >>> @@ -899,17 +899,18 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
> >>>  };
> >>>
> >>>  /**
> >>> - * zynqmp_r5_add_rproc_core() - Add core data to framework.
> >>> - * Allocate and add struct rproc object for each r5f core
> >>> + * zynqmp_r5_alloc_rproc_core() - alloc rproc core data structure
> >>> + * Allocate struct rproc object for each r5f core
> >>>   * This is called for each individual r5f core
> >>>   *
> >>>   * @cdev: Device node of each r5 core
> >>>   *
> >>>   * Return: zynqmp_r5_core object for success else error code pointer
> >>>   */
> >>> -static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> >>> +static struct zynqmp_r5_core *zynqmp_r5_alloc_rproc_core(struct device *cdev)
> >>
> >> Why is there a need to change the function's name?
> >>
> >
> > Before, the function was actually adding the rproc core by calling
> > rproc_add() function, but now it only allocates the memory by calling
> > rproc_alloc(). For auto boot to work it's important to add rproc core
> > after all the other hw is initialized (such as mbox, tcm, sram,
> > power-domains etc). More details below [1].
> >
> >>>  {
> >>>     struct zynqmp_r5_core *r5_core;
> >>> +   const char *fw_name = NULL;
> >>>     struct rproc *r5_rproc;
> >>>     int ret;
> >>>
> >>> @@ -918,10 +919,15 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> >>>     if (ret)
> >>>             return ERR_PTR(ret);
> >>>
> >>> +   ret = rproc_of_parse_firmware(cdev, 0, &fw_name);
> >>> +   if (ret < 0 && ret != -EINVAL)
> >>> +           return ERR_PTR(dev_err_probe(cdev, ret,
> >>> +                                        "failed to parse firmware-name\n"));
> >>> +
> >>>     /* Allocate remoteproc instance */
> >>>     r5_rproc = rproc_alloc(cdev, dev_name(cdev),
> >>>                            &zynqmp_r5_rproc_ops,
> >>> -                          NULL, sizeof(struct zynqmp_r5_core));
> >>> +                          fw_name, sizeof(struct zynqmp_r5_core));
> >>>     if (!r5_rproc) {
> >>>             dev_err(cdev, "failed to allocate memory for rproc instance\n");
> >>>             return ERR_PTR(-ENOMEM);
> >>> @@ -932,6 +938,11 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> >>>     r5_rproc->recovery_disabled = true;
> >>>     r5_rproc->has_iommu = false;
> >>>     r5_rproc->auto_boot = false;
> >>> +
> >>> +   /* attempt to boot automatically if the firmware-name is provided */
> >>> +   if (fw_name)
> >>> +           r5_rproc->auto_boot = true;
> >>> +
> >>
> >> What happens when a firmware name needs to be provided in the DT but you don't
> >> want to automatically boot the remote processor?
> >>
> >
> > I think that use case is not needed. If the user/system-designer doesn't
> > want auto-boot, then having firmware-name in the device-tree serves no
> > purpose. User can always load the firmware via sysfs once kernel boots.
> >
> >>>     r5_core = r5_rproc->priv;
> >>>     r5_core->dev = cdev;
> >>>     r5_core->np = dev_of_node(cdev);
> >>> @@ -941,13 +952,6 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> >>>             goto free_rproc;
> >>>     }
> >>>
> >>> -   /* Add R5 remoteproc core */
> >>> -   ret = rproc_add(r5_rproc);
> >>> -   if (ret) {
> >>> -           dev_err(cdev, "failed to add r5 remoteproc\n");
> >>> -           goto free_rproc;
> >>> -   }
> >>> -
> >>
> >> I'm not sure why there is a need to move this to zynqmp_r5_cluster_init()?  Is
> >> it simply to make the error path easier to handle?  If so, please do that in a
> >> separate patch.
> >>
> >
> > [1] This was moved to make auto-boot work. The remote core can auto-boot
> > only after other hardware is initialized. The zynqmp_r5_core_init()
> > initializes sram, TCM and power-domains of the core. Also, mailbox is
> > requested before zynqmp_r5_core_init() as well. We can't auto-boot core
> > directly without all this. So, I had to move rproc_add() at the end of
> > the cluster init, and rename above function from
> > zynqmp_r5_add_rproc_core to zynqmp_r5_alloc_rproc_core.
> >
> > If you prefer, I will add above explanation in the commit text, or as
> > comment right before rproc_add().
> >
> >
> >
> >>>     r5_core->rproc = r5_rproc;
> >>>     return r5_core;
> >>>
> >>> @@ -1280,6 +1284,7 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
> >>>                     if (zynqmp_r5_get_rsc_table_va(r5_core))
> >>>                             dev_dbg(r5_core->dev, "rsc tbl not found\n");
> >>>                     r5_core->rproc->state = RPROC_DETACHED;
> >>> +                   r5_core->rproc->auto_boot = true;
> >>
> >> I thought this was done in zynqmp_r5_add_rproc_core() - what am I missing?
> >>
> >
> > That function is now zynqmp_r5_alloc_core() as mentioned above. Also,
> > until now, auto_boot was set to 'false' only to show that it is
> > disabled. It is actually used and enabled now.
> >
>
> "I thought this was done in zynqmp_r5_add_rproc_core() - what am I missing?"
>
> I probably misunderstood this comment. Here is the correct explanation:
>
> The auto_boot setting in the zynqmp_r5_alloc_core() is done if the
> 'firmware-name' property is present in the device-tree.
>
> Here it is done, if the remote core is already running. This is to
> support attach-detach use case.
>
> So, auto_boot is possible in two cases: 1) If firmware-name property is
> available (Linux boots the remote), 2) If firmware is already loaded and
> remote was started by the boot loader. (Linux attaches to the running
> remote).
>
> This is the second use case.
>

Thanks for the clarifications, I'll have another look at this set.

> Thanks,
> Tanmay
>
> >> Thanks,
> >> Mathieu
> >>
> >>>             }
> >>>     }
> >>>
> >>> @@ -1304,7 +1309,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
> >>>     enum rpu_oper_mode fw_reg_val;
> >>>     struct device **child_devs;
> >>>     enum rpu_tcm_comb tcm_mode;
> >>> -   int core_count, ret, i;
> >>> +   int core_count, ret, i, j;
> >>>     struct mbox_info *ipi;
> >>>
> >>>     ret = of_property_read_u32(dev_node, "xlnx,cluster-mode", &cluster_mode);
> >>> @@ -1390,7 +1395,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
> >>>             child_devs[i] = &child_pdev->dev;
> >>>
> >>>             /* create and add remoteproc instance of type struct rproc */
> >>> -           r5_cores[i] = zynqmp_r5_add_rproc_core(&child_pdev->dev);
> >>> +           r5_cores[i] = zynqmp_r5_alloc_rproc_core(&child_pdev->dev);
> >>>             if (IS_ERR(r5_cores[i])) {
> >>>                     ret = PTR_ERR(r5_cores[i]);
> >>>                     r5_cores[i] = NULL;
> >>> @@ -1435,16 +1440,31 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
> >>>             goto release_r5_cores;
> >>>     }
> >>>
> >>> +   for (j = 0; j < cluster->core_count; j++) {
> >>> +           /* Add R5 remoteproc core */
> >>> +           ret = rproc_add(r5_cores[j]->rproc);
> >>> +           if (ret) {
> >>> +                   dev_err_probe(r5_cores[j]->dev, ret,
> >>> +                                 "failed to add remoteproc\n");
> >>> +                   goto delete_r5_cores;
> >>> +           }
> >>> +   }
> >>> +
> >>>     kfree(child_devs);
> >>>     return 0;
> >>>
> >>> +delete_r5_cores:
> >>> +   i = core_count - 1;
> >>> +   /* delete previous added rproc */
> >>> +   while (--j >= 0)
> >>> +           rproc_del(r5_cores[j]->rproc);
> >>> +
> >>>  release_r5_cores:
> >>>     while (i >= 0) {
> >>>             put_device(child_devs[i]);
> >>>             if (r5_cores[i]) {
> >>>                     zynqmp_r5_free_mbox(r5_cores[i]->ipi);
> >>>                     of_reserved_mem_device_release(r5_cores[i]->dev);
> >>> -                   rproc_del(r5_cores[i]->rproc);
> >>>                     rproc_free(r5_cores[i]->rproc);
> >>>             }
> >>>             i--;
> >>> --
> >>> 2.34.1
> >>>
> >
>

