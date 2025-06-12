Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBC4C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 00:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObgREgS2LbREVTVWt2meuQSNcQMFkiPDU2dHRlXpVkM=; b=cO8Sv9ZMkjUFPEI3O6ixvuw8Dd
	g20/31oQWimJ+2UKVLqCloMsNC45zwD5x4ltf3g0HmwQN81lzObkh7JpefKunoEFiRFxu9uvKTph/
	D/U0Pq0NwUxB2p9vn7Lw37sknEF0uOf18KckQhjNx0oIxWdW6YSaefn6W0XpCDwe5eaUS/djMT5Xh
	4dLsQwcevyFSR8lUJJGGosDWqmy/HvSwDG3sfB0h7XBtY8htBg9RK+e53mmWgfUa6bAYkG22tLrQy
	oJioc4/sjLbbn86n2Kym/Zi/P33nyar4rhbuE+fXryYS5EUWiamcICadUuL/cXP6tGH2QBl/0wsvt
	FBiknszQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPsDk-0000000Ews7-26FV;
	Fri, 13 Jun 2025 00:24:36 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPlKm-0000000E0OT-3mS0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 17:03:26 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-74865da80c4so856344b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 10:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749747803; x=1750352603; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ObgREgS2LbREVTVWt2meuQSNcQMFkiPDU2dHRlXpVkM=;
        b=Vpt7WXTa+Y8Y2FQcVfgRoI/iWrGsKjubDKaLeSqbUDRNTc88qq/yTutdHSpbtJ7RjU
         94yhK8VocSWbBIHKh9Jl+l69A5Swonb1RnqS1uAIzkeLIF7jn6bp+GYhCgylJbxtxP4/
         jciAtf1eHdUNpSz6xBh6BVTY0lw3KK5n8sipAGSAl4Yu4GxffbLWsLt0gFZLf7xhaJvd
         PIRWJukCBQLendJnb5DTIN7qmJqIJdgaUj4iA/J/7HvodzE/AQuBUDYSsWfrVji46+e6
         dXUduh2d7/lkaesIO7Yzqu/pA/CIG8MfZy9fpvzIylQfzGEjda8gwAOFK3phC1Jtg05L
         65sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749747803; x=1750352603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObgREgS2LbREVTVWt2meuQSNcQMFkiPDU2dHRlXpVkM=;
        b=XCh3BM5CmvnTjYlRRM+/p6Xk115qH0n44JPh/ba2eRF8QyZqu8E7jGrnZLUO7gioiT
         LlSivta0mbBWBgblGQKqGJQHsCvPKzZSGhjD23K6Iu/lTote6r5pji99Je8/NaoHISZo
         tPw0pFJrP5XSdKgm0Vtp0QWnx9adJobpzCB8TvPFg6qeXyotJhnbbifUM2bVwjgWSSqx
         dH6DoBi3BKvR79Q5IdhDQAlY08nK8W/3lsY0Zy9qDOY8W/62aEYZDmO59cG7wci8c3Xg
         vfQNpxMwDtyjiv33wdRMw8ITYxLTf7YjMWhqY5OSYqDF8NDo6Iz29y44SKqO/iWeTKjD
         O0lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyfCOmiqlu/FIUCyVaCwwGcX70D/D5Quf1Fv60zYTHh385/5Gq2EB6idE+QX4P3tUne/I0uka3MF47UJTEUKQt@lists.infradead.org
X-Gm-Message-State: AOJu0YyEqQtzbCAM4JzshXCX8TjGR7/w0gREzDxc+3FlFNwxlWHhQPLt
	J+JqigKs/FiuRwHDaTgJNRaQIHC2sD6KMaIQUAn/0O4/k8cZF4RS4JGi
X-Gm-Gg: ASbGnct5EsptDQ5wD2/CJ9Hto0oGdXBQC2ZCXcV6xjDiRNq4zSIz+k2HzdjmzSoiSne
	nBDj0oNfxT2zs5iidzQ8S0Bl8t2BhEYEU6TVqYjsC+TttYJIafaDc1emUUUPQiy8+X3yQ3NCHS3
	9QEgyvBMWdt9s3Qx/APnX+EHX8EzmVaG3UyRTb+EIAh/A+XH9Q1o+a/HfdxwPo1ofVw8+sIpX0B
	UCRoxiIv96HaosIwgjgjuhkSSw5WhY/OvmLJLfIy2bB7W1U9T0KGFuB2h2VGxF5bs5cd768wsbZ
	y/HQnoRgnx3CNYbYlyH2h5FpOgUvkDvYroUd6wcmHshykPGeUZhZ9zbFPgML
X-Google-Smtp-Source: AGHT+IF54y3q62NL+kS/gD45o5e+WyN4FsAe5RdZjZEeztChTbyzYm/Srld6U8FosLrer/YeMYeZ3w==
X-Received: by 2002:a05:6a21:998a:b0:1f5:5a0b:4768 with SMTP id adf61e73a8af0-21faa58c2c6mr352397637.21.1749747803298;
        Thu, 12 Jun 2025 10:03:23 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fd613fee4sm1647097a12.26.2025.06.12.10.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 10:03:22 -0700 (PDT)
Date: Thu, 12 Jun 2025 14:03:17 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	"Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4 3/3] remoteproc: imx_rproc: detect and attach to
 pre-booted remote cores
Message-ID: <20250612170317.k3cok3utmiy5ptq3@hiago-nb>
References: <20250602131906.25751-1-hiagofranco@gmail.com>
 <20250602131906.25751-4-hiagofranco@gmail.com>
 <PAXPR04MB84594F9ABDF0728D9A71FAFE886CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250609173115.qecc2noswkcgr3hm@hiago-nb>
 <PAXPR04MB8459F651D1D0AC8C51F292A48875A@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459F651D1D0AC8C51F292A48875A@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_100324_941564_32705847 
X-CRM114-Status: GOOD (  21.04  )
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

Hi Peng,

On Wed, Jun 11, 2025 at 03:27:09AM +0000, Peng Fan wrote:
> > 
> > Sorry for the delay.
> > 
> > I tested it now and there must be something missing on my U-Boot:
> > 
> > Disable imx8x-cm4 rsrc 278 not owned
> > Disable imx8x-cm4 rsrc 297 not owned
> > 
> > It removes my nodes from the DT before starting the kernel, so I cannot
> > attach. Do you know what should I do in this case?
> 
> In separate partition case, UBoot will check the permission
> by checking the rsrc-id, saying power domain id.
> 
> You may need to remove the power-domains property
> from M4 node.

Without the power-domains property, rproc gives me a kernel panic:

[    1.253234] remoteproc remoteproc0: imx-rproc is available
[    1.258501] remoteproc remoteproc0: attaching to imx-rproc
[    1.263950] Unable to handle kernel paging request at virtual address ffff80005ae57d39
[    1.271812] Mem abort info:
[    1.274575]   ESR = 0x0000000096000005
[    1.278299]   EC = 0x25: DABT (current EL), IL = 32 bits
[    1.282581] mmc0: SDHCI controller on 5b010000.mmc [5b010000.mmc] using ADMA
[    1.283607]   SET = 0, FnV = 0
[    1.293701]   EA = 0, S1PTW = 0
[    1.296815]   FSC = 0x05: level 1 translation fault
[    1.301699] Data abort info:
[    1.304545]   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
[    1.310079]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    1.315073]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    1.320367] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000096bf3000
[    1.327061] [ffff80005ae57d39] pgd=0000000000000000, p4d=1000000097085003, pud=0000000000000000
[    1.335750] Internal error: Oops: 0000000096000005 [#1]  SMP
[    1.341373] Modules linked in:
[    1.344414] CPU: 3 UID: 0 PID: 47 Comm: kworker/u16:3 Not tainted 6.16.0-rc1-00024-gfe5d6ab20714-dirty
 #857 PREEMPT
[    1.354932] Hardware name: Toradex Colibri iMX8QXP on Colibri Evaluation Board V3 (DT)
[    1.362837] Workqueue: events_unbound deferred_probe_work_func
[    1.368651] pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    1.375601] pc : rproc_handle_resources.constprop.0+0x78/0x1d0
[    1.381421] lr : rproc_boot+0x368/0x578
[    1.385242] sp : ffff8000819f3990
[    1.388542] x29: ffff8000819f3990 x28: ffff80005ae57d3d x27: 0000000000000000
[    1.395671] x26: 0000000000000000 x25: ffff0000016ee038 x24: ffff800080f3c680
[    1.402793] x23: ffff8000813d6da8 x22: 00000000d999ad39 x21: ffff0000016ee000
[    1.409917] x20: 00000000266656c3 x19: ffff80005ae57d39 x18: 0000000000000006
[    1.417040] x17: ffff000002020600 x16: ffff000002020000 x15: 4addd15cca11c529
[    1.424164] x14: 73ebceed5d6cd787 x13: 4addd15cca11c529 x12: 73ebceed5d6cd787
[    1.431288] x11: 95a4e33b6b190664 x10: 9e3cdabdb09ca345 x9 : ab3734eafdd6fd1c
[    1.438412] x8 : d58a055de4cfb385 x7 : de97fab1791acbbe x6 : 9946d97107d0dcda
[    1.445535] x5 : ffff0000032b2c00 x4 : 00000000000003fc x3 : ffff0000032b2b80
[    1.452659] x2 : fffffffffffffff0 x1 : ffff8000814bd000 x0 : ffff8000814bd000
[    1.459786] Call trace:
[    1.462215]  rproc_handle_resources.constprop.0+0x78/0x1d0 (P)
[    1.468036]  rproc_boot+0x368/0x578
[    1.471510]  rproc_add+0x180/0x18c
[    1.474898]  imx_rproc_probe+0x3e4/0x540
[    1.475274] mmc0: new HS400 MMC card at address 0001
[    1.478799]  platform_probe+0x68/0xc0
[    1.484628] mmcblk0: mmc0:0001 Q2J55L 7.09 GiB
[    1.487400]  really_probe+0xc0/0x38c
[    1.487412]  __driver_probe_device+0x7c/0x15c
[    1.487424]  driver_probe_device+0x3c/0x10c
[    1.493941]  mmcblk0: p1 p2
[    1.495392]  __device_attach_driver+0xbc/0x158
[    1.495405]  bus_for_each_drv+0x84/0xe0
[    1.495417]  __device_attach+0x9c/0x1ac
[    1.500468] mmcblk0boot0: mmc0:0001 Q2J55L 16.0 MiB
[    1.503906]  device_initial_probe+0x14/0x20
[    1.503918]  bus_probe_device+0xac/0xb0
[    1.503929]  deferred_probe_work_func+0x9c/0xec
[    1.509863] mmcblk0boot1: mmc0:0001 Q2J55L 16.0 MiB
[    1.511117]  process_one_work+0x14c/0x28c
[    1.511132]  worker_thread+0x2cc/0x3d4
[    1.511142]  kthread+0x12c/0x208
[    1.511157]  ret_from_fork+0x10/0x20
[    1.517964] mmcblk0rpmb: mmc0:0001 Q2J55L 4.00 MiB, chardev (241:0)
[    1.518770] Code: 8b36c033 9100127c 54000924 d503201f (b9400261)
[    1.518777] ---[ end trace 0000000000000000 ]---

Currently I have the M4 partiton defined into the SCU code:

            /* Create partition */
            BRD_ERR(rm_partition_create(pt_boot, &pt_m4_0, SC_FALSE,
                SC_TRUE, SC_FALSE, SC_TRUE, SC_FALSE, SC_R_M4_0_PID0,
                rsrc_list, ARRAY_SIZE(rsrc_list),
                pad_list, ARRAY_SIZE(pad_list),
                NULL, 0));

            /* Name partition for debug */
            PARTITION_NAME(pt_m4_0, "MCU0");
            
            /* Allow AP to use SYSTEM (not production!) */
            BRD_ERR(rm_set_peripheral_permissions(SC_PT, SC_R_SYSTEM,
                pt_boot, SC_RM_PERM_SEC_RW));

            /* Move M4 0 TCM */
            BRD_ERR(rm_find_memreg(pt_boot, &mr, 0x034FE0000ULL,
                0x034FE0000ULL));
            BRD_ERR(rm_assign_memreg(pt_boot, pt_m4_0, mr));

            /* Move partition to be owned by SC */
            BRD_ERR(rm_set_parent(pt_boot, pt_m4_0, SC_PT));

            /* Check if booting with the no_ap flag set */
            if (no_ap != SC_FALSE)
            {
                /* Move boot to be owned by M4 0 for Android Automotive */
                BRD_ERR(rm_set_parent(SC_PT, pt_boot, pt_m4_0));
            }
        }

        /* Allow all to access the SEMA42s */
        BRD_ERR(rm_set_peripheral_permissions(SC_PT, SC_R_M4_0_SEMA42,
            SC_RM_PT_ALL, SC_RM_PERM_FULL));

I believe this SCU code is correct, at least this is more or less what
NXP provides as example, right?

Best Regards,
Hiago.

