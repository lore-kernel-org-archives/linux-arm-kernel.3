Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755D9FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 17:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxZGUpn4MvoHBLfisdbbKtNH3JEOoB45Qqjjg7y6hXk=; b=kXDhxvx2QMvAmm754Nm4AMdHxZ
	vqyR+ScCwTWiZgBQMduD28A5uDnhSsWgzHi/RUhrwx95ZumTS1bpl5Tw9lOBz3q8oPbkee/82Ap0F
	T4TeYR8Q0kPiC4f9qtDaWkK6GGjb659XyZpt4mNkNMqL4oaJLgplZYwXcFAm4UQQAee+Nu8RLncN7
	nWQaujBJWHlMPCjtsIL2h1eJEXPGWx4dseK9EZV9jxSYa/ErO9zxbuC5nMSeuf3/lVw7rPOYZqiqw
	g72qf8+QFZjlTyAnGganx2r/iv4JArqazeUR50DRO2TRE3/4pQAj1TduCiCDIoBz7TAmqO+tb6fIl
	lgsXNRmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHQ84-0000000HWBP-2JQX;
	Mon, 27 Apr 2026 17:52:20 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHQ81-0000000HWAl-1aZm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 17:52:18 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-82cebbdbdccso6571154b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777312336; x=1777917136; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qxZGUpn4MvoHBLfisdbbKtNH3JEOoB45Qqjjg7y6hXk=;
        b=tUXDaG4upy132umBFksO0Jpc89HMIl6GQRfBkxResXq8XBKEZed7u9glpyUTyIJAe1
         /KyIvMCzc5XOQ4B7RiyHjPIOs9HlZ6AkEDR4sVx+QTxhHgb2kAm1ad5f1bNqhvVd2bTj
         FBXJ7neZFigAFoXecZXWOnmA3Q0hYq389bFA/jyhC1B8sqtUePzP2Z+ONguFa9yzU9EV
         8+9ig4KVhcHqJUiBAAy8QimpaDe5IzNRHVpicQCAlf1zFgOBgdhjUmT8eQOCn2cLoy1M
         ikmeg/LtypsG85Pe8Fa9skMPeyOoN3J81IwqDPNzpNL5IPcDmsWlGS413GQOZJ24TxUl
         sRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312336; x=1777917136;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qxZGUpn4MvoHBLfisdbbKtNH3JEOoB45Qqjjg7y6hXk=;
        b=dU/r08J49Ed4y3YU53FFu4J27Hng4dC3dBT30Uw2zMjhvAjRpfgVltOQhOkBTaV8jA
         8pNi4LrtNs7jkafW4RsUhrz8y1ChRDZWsDu8it7uyIkHZObr4RZcYQoVz4YqEzY+dRg5
         rDP/5Np1YLlgZRioZJeHNqrXDpydRl77YdRe/q+x6lE3yl+Fcbfn7uQHid6CfcaX0586
         o43jhr/+0jphinccVGQd98MQ3iNVlOl2ZYPvUaRq8qQpiaB37+WYTT+vWQVz2aPCL/VM
         nSQmO6YrD84cjNgjh7Wdfi9H+Z8orWbru/++TqBI1fI0BmgjYTWTePKV0SOrVCI+XJni
         wfeA==
X-Forwarded-Encrypted: i=1; AFNElJ9OSqXaLtSz273by5O9NR8HRSbNGzh+hyMFjFDM9cMCDS1iRBvkosnFDzZ0JQEInPNpNTkalBPpmfRlic0ZLem7@lists.infradead.org
X-Gm-Message-State: AOJu0YyoaHNdPqDPuVWtdJN3ABqNcxAywqHm6r3HpgdGbtTaiWvgIycg
	spmxx7csTihgkdB5IKRq9fhPjSRbiKh488zRj8zs7k77qGlpaZpohuptQOu7o4303Qw=
X-Gm-Gg: AeBDiesvcAjlwcJ03Vi5LGh2/4j3TlGxDsqaND7VaaergKCM1OFivQNy40DPYsusn3i
	FkBnRG7a/Pwxhl4ZxFwP1LSzr+cDzXTpC/7RM9WdqFoZgWoRX8NbiBR5+WjytcAB0mGvIEmKDTb
	76T/xPgyi+hyddf/AwZ2EqhOzFqUxgI+bjpMngDNe+jp7r2l5ox2WTLvQJwRv7Oseem64VaPb3a
	WqAvPP5RHUYvaPWx7nXhp3wTnSZEhSPjRyLUJiZ5lSgXfuVFdUR20jumVBaicSYHdBHyTbTaNYL
	rcovfQDrM5XhnBzcDidG0t/4u5DjYQDbxM4gMLlxsR9femYoaeZYcIzNI9VDhnj9lEnBs+UiP2t
	5DnGIYlEErLdAa2tyU/3h96Xk/vI2eBXCseaoU0T1N8igps7JJqEbh/3wNuzLQi7wSGrrjuaH9d
	nAEvKbym4wO097P/eY9lvlcaU4u68O8i6MDsjP
X-Received: by 2002:a05:6a00:a254:b0:82f:6c51:a246 with SMTP id d2e1a72fcca58-834daecf158mr106298b3a.2.1777312335449;
        Mon, 27 Apr 2026 10:52:15 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9a8:9d0b:56bb:d830])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834daf79e5bsm65718b3a.56.2026.04.27.10.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:52:14 -0700 (PDT)
Date: Mon, 27 Apr 2026 11:52:12 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: tanmay.shah@amd.com
Cc: "Padhi, Beleswar" <b-padhi@ti.com>, michal.simek@amd.com,
	andersson@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] remoteproc: xlnx: check remote node state
Message-ID: <ae-iTAk0KvtPvMSB@p14s>
References: <20260425030231.3145225-1-tanmay.shah@amd.com>
 <93ea5065-b8a4-49db-91b3-71170905fa15@ti.com>
 <5aabddce-eeee-43de-be30-115bc58040dc@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5aabddce-eeee-43de-be30-115bc58040dc@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_105217_434294_D0C12427 
X-CRM114-Status: GOOD (  49.74  )
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

Good morning

On Mon, Apr 27, 2026 at 11:15:29AM -0500, Shah, Tanmay wrote:
> Hello Beleswar,
> 
> Thanks for reviews. Please find my answer below:
> 
> On 4/24/2026 10:51 PM, Padhi, Beleswar wrote:
> > Hi Tanmay,
> > 
> > In $subject-line, s/remote node/remoteproc
> > 
> 
> Ack. 'node' is platform management firmware term, which might not be
> right here. subject line already contains remoteproc so no need to have
> it again. Instead, will replace 'node' with 'core'. new subject:
> 
> remoteproc: xlnx: check remote core state.
>

Much better.
 
> > On 4/25/2026 8:32 AM, Tanmay Shah wrote:
> >> The remote state is set to RPROC_DETACHED if the resource table is found
> >> in the memory. However, this can be wrong if the remote is not started,
> >> but firmware is still loaded in the memory. Use PM_GET_NODE_STATUS call
> >> to the firmware to request the state of the RPU node. If the RPU is
> >> actually out of reset and running, only then move the remote state to
> >> RPROC_DETACHED, otherwise keep the remote state to RPROC_OFFLINE.
> > 
> > 
> > This is a good additional check. However, one thing to note is
> > remoteproc core
> > framework will load the firmware if the state is set to RPROC_OFFLINE. This
> > will override the existing firmware in the memory, I hope that is not
> > fatal for
> > your usecase?
> > 
> 
> That is expected. If remote core is 'offline' during driver probe then
> any firmware already in the memory becomes irrelevant and new firmware
> can be loaded.
> 
> >>
> >> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >> ---
> >>   drivers/firmware/xilinx/zynqmp.c        | 28 +++++++++++++++++++
> >>   drivers/remoteproc/xlnx_r5_remoteproc.c | 37 ++++++++++++++++++-------
> >>   include/linux/firmware/xlnx-zynqmp.h    | 21 ++++++++++++++
> >>   3 files changed, 76 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/
> >> xilinx/zynqmp.c
> >> index fbe8510f4927..af838b2dc327 100644
> >> --- a/drivers/firmware/xilinx/zynqmp.c
> >> +++ b/drivers/firmware/xilinx/zynqmp.c
> >> @@ -1450,6 +1450,34 @@ int zynqmp_pm_get_node_status(const u32 node,
> >> u32 *const status,
> >>   }
> >>   EXPORT_SYMBOL_GPL(zynqmp_pm_get_node_status);
> >>   +/**
> >> + * zynqmp_pm_get_rpu_node_status - PM call to request a RPU node's
> >> current power state
> >> + * @node:        ID of the RPU component or sub-system in question
> >> + * @status:        Current operating state of the requested RPU node.
> >> + * @requirements:    Current requirements asserted on the RPU node.
> >> + * @usage:        Usage information, used for RPU slave nodes only:
> >> + *            PM_USAGE_NO_MASTER    - No master is currently using
> >> + *                          the node
> >> + *            PM_USAGE_CURRENT_MASTER    - Only requesting master is
> >> + *                          currently using the node
> >> + *            PM_USAGE_OTHER_MASTER    - Only other masters are
> >> + *                          currently using the node
> >> + *            PM_USAGE_BOTH_MASTERS    - Both the current and at least
> >> + *                          one other master is currently
> >> + *                          using the node
> >> + *
> >> + * Return:        Returns status, either success or error+reason
> >> + */
> >> +int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
> >> +                  u32 *const requirements, u32 *const usage)
> >> +{
> >> +    if (zynqmp_pm_feature(PM_GET_NODE_STATUS) < PM_API_VERSION_2)
> >> +        return -EOPNOTSUPP;
> >> +
> >> +    return zynqmp_pm_get_node_status(node, status, requirements, usage);
> >> +}
> >> +EXPORT_SYMBOL_GPL(zynqmp_pm_get_rpu_node_status);
> >> +
> >>   /**
> >>    * zynqmp_pm_force_pwrdwn - PM call to request for another PU or
> >> subsystem to
> >>    *             be powered down forcefully
> >> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/
> >> remoteproc/xlnx_r5_remoteproc.c
> >> index 50a9974f3202..e2f25d94177d 100644
> >> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> @@ -948,16 +948,6 @@ static struct zynqmp_r5_core
> >> *zynqmp_r5_add_rproc_core(struct device *cdev)
> >>           goto free_rproc;
> >>       }
> >>   -    /*
> >> -     * If firmware is already available in the memory then move rproc
> >> state
> >> -     * to DETACHED. Firmware can be preloaded via debugger or by any
> >> other
> >> -     * agent (processors) in the system.
> >> -     * If firmware isn't available in the memory and resource table
> >> isn't
> >> -     * found, then rproc state remains OFFLINE.
> >> -     */
> >> -    if (!zynqmp_r5_get_rsc_table_va(r5_core))
> >> -        r5_rproc->state = RPROC_DETACHED;
> >> -
> >>       r5_core->rproc = r5_rproc;
> >>       return r5_core;
> >>   @@ -1210,6 +1200,7 @@ static int zynqmp_r5_core_init(struct
> >> zynqmp_r5_cluster *cluster,
> >>   {
> >>       struct device *dev = cluster->dev;
> >>       struct zynqmp_r5_core *r5_core;
> >> +    u32 req, usage, status;
> >>       int ret = -EINVAL, i;
> >>         r5_core = cluster->r5_cores[0];
> >> @@ -1255,6 +1246,32 @@ static int zynqmp_r5_core_init(struct
> >> zynqmp_r5_cluster *cluster,
> >>           ret = zynqmp_r5_get_sram_banks(r5_core);
> >>           if (ret)
> >>               return ret;
> >> +
> >> +        /*
> >> +         * It is possible that firmware is loaded into the memory, but
> >> +         * RPU (remote) is not running. In such case, RPU state will be
> >> +         * moved to RPROC_DETACHED wrongfully. To avoid it first make
> >> +         * sure RPU is power-on and out of reset before parsing for the
> >> +         * resource table.
> >> +         */
> >> +        ret = zynqmp_pm_get_rpu_node_status(r5_core->pm_domain_id,
> >> +                            &status, &req, &usage);
> >> +        if (ret) {
> >> +            dev_warn(r5_core->dev,
> >> +                 "failed to get rpu node status, err %d\n", ret);
> >> +            continue;
> >> +        }
> >> +
> >> +        /*
> >> +         * If RPU state is power on and out of reset i.e. running, then
> >> +         * assign RPROC_DETACHED state. If the RPU is not out of reset
> >> +         * then do not attempt to attach to the remote processor.
> >> +         */
> >> +        if (status == PM_NODE_RUNNING) {
> >> +            if (zynqmp_r5_get_rsc_table_va(r5_core))
> >> +                dev_dbg(r5_core->dev, "rsc tbl not found\n");
> > 
> > 
> > Do you still want to set state = RPROC_DETACHED if resource table is not
> > found in the
> > memory?
> > 
> 
> Yes. Not all the firmware that is running on remote core is expected to
> have the resource table. The firmware might not use RPMsg at all, and in
> that case resource table becomes irrelevant. However, we still need to
> make sure that running core is not reported as offline.

Please add the above explanation to the inlined comment.  Otherwise I'm good
with this patch but I'll need an RB from Michael before moving forward.  

Do you see this as a bug fix?  Is there a point adding this patch to the stable
kernels?

>
> Thanks.
> 
> > Thanks,
> > Beleswar
> > 
> >> +            r5_core->rproc->state = RPROC_DETACHED;
> >> +        }
> >>       }
> >>         return 0;
> >> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/
> >> firmware/xlnx-zynqmp.h
> >> index d70dcd462b44..7e27b0f7bf7e 100644
> >> --- a/include/linux/firmware/xlnx-zynqmp.h
> >> +++ b/include/linux/firmware/xlnx-zynqmp.h
> >> @@ -542,6 +542,18 @@ enum pm_gem_config_type {
> >>       GEM_CONFIG_FIXED = 2,
> >>   };
> >>   +/**
> >> + * enum pm_node_status - Device node status provided by xilpm fw
> >> + * @PM_NODE_UNUSED: Device is not used
> >> + * @PM_NODE_RUNNING: Device is power-on and out of reset
> >> + * @PM_NODE_HALT: Device is power-on but in the reset state
> >> + */
> >> +enum pm_node_status {
> >> +    PM_NODE_UNUSED = 0,
> >> +    PM_NODE_RUNNING = 1,
> >> +    PM_NODE_HALT = 12,
> >> +};
> >> +
> >>   /**
> >>    * struct zynqmp_pm_query_data - PM query data
> >>    * @qid:    query ID
> >> @@ -630,6 +642,8 @@ int zynqmp_pm_set_rpu_mode(u32 node_id, enum
> >> rpu_oper_mode rpu_mode);
> >>   int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode);
> >>   int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
> >>                     u32 *const requirements, u32 *const usage);
> >> +int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
> >> +                  u32 *const requirements, u32 *const usage);
> >>   int zynqmp_pm_set_sd_config(u32 node, enum pm_sd_config_type config,
> >> u32 value);
> >>   int zynqmp_pm_set_gem_config(u32 node, enum pm_gem_config_type config,
> >>                    u32 value);
> >> @@ -939,6 +953,13 @@ static inline int zynqmp_pm_get_node_status(const
> >> u32 node, u32 *const status,
> >>       return -ENODEV;
> >>   }
> >>   +static inline int zynqmp_pm_get_rpu_node_status(const u32 node, u32
> >> *const status,
> >> +                        u32 *const requirements,
> >> +                        u32 *const usage)
> >> +{
> >> +    return -ENODEV;
> >> +}
> >> +
> >>   static inline int zynqmp_pm_set_sd_config(u32 node,
> >>                         enum pm_sd_config_type config,
> >>                         u32 value)
> >>
> >> base-commit: 6f860d238b44da8ac57be25289b9f4410691c4e2
> 

