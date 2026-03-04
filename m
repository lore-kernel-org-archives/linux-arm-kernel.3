Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FCAEF8FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 17:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nbV/oYX7d0ZGq24NywUe6q4Jk9h6nNIgQ4I7M+8thk0=; b=CfUJSTVOG17RAA0QMF0kBv0l58
	TLecJ3rGhiWMt1WvE0fU5KCw4mt5HnmPg64RIOec78LpQW92SoqybPqBSq8B0o84bgde9ukPrCKWg
	YHhZVDhSGLiej0GRRFi4CxM69uNyN8xVfijHnWYQWtx6sWbPf2oeoEH/k3Et1qOinHRN+nhJLx8Dn
	pIQgeD8xt6Iiz4ZlRlURGikVvFVRUIBdeSC8kh+kkuerPHFevyvsFM/8aQoNzcOPEJm7K3uqCurji
	f0/GHuspjQZz5u0rB5bj87zYafZHGa/ulqPU2D6QeR3rTbhl74lUg3rdOy9KqyqR7Vqbk42X/6hSf
	44qDEPDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpcr-000000007u8-1U9r;
	Wed, 04 Mar 2026 17:03:09 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpco-000000007tS-21Py
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 17:03:07 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-439af00d33cso3829742f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 09:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772643784; x=1773248584; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nbV/oYX7d0ZGq24NywUe6q4Jk9h6nNIgQ4I7M+8thk0=;
        b=ME+pgnY/7+4OqESMRN4wKZWdX8rA+xaQCz07HSFdFOlwQPi2kdf98GD3ILFhpb3n1b
         19wdFUDgMUy6PCy8dIvghCRzSvFxOFVaNdb0HXDgaEIbW9M0xUa8IrTpIBeXykrLLHZr
         gCB0accQDDFxshQTPNfG6nJjQFf5DW3WgeQv8y5vF8l8+ZHAQQNaN5mni17xo/GgNMhL
         1dgEJY1zJ/g0yapRh9FhpGA5MuQFuWacabR3KqdQK0DgosIljVAPwADb6emDLa04htOu
         GbOIVsj2NGNVALWtlwYC1NDszmTE9XJb8ImRd3cPd5/P9AGU1FENQ6tcrtdTTQP62P8Q
         R6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772643784; x=1773248584;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nbV/oYX7d0ZGq24NywUe6q4Jk9h6nNIgQ4I7M+8thk0=;
        b=eLZUn8GxDhGVkAQId2T/4HPElS3QOfjBPPy/KCgboMQdelGafxBDrIrpnRc4TAnPnj
         pM5b5Xf5EiiW8xnKO7c442ccB150tzj6udyO9d/lWqz1Xju3mFkABmlWfpx0EGFH0DR6
         5hmyCX6tHjt5D/aSd8Q+mGD08/Vr0NWlhQSGmyBBrhTSMHZWwmm5Dyr1YuPdINu9fAft
         F1NGl3qShMsq5bEDrKrKN14XSlhzBN64MUWk/PiOdkWVp3jNy3Jypbhs6aZUyoPIQX5T
         sMR5iZ0vVXynO4Z/j5EvI7ZhfgBCph0QvmHJfg3GZG80ELlKy2bnb1lcNkyvqCFh1i7A
         Btag==
X-Forwarded-Encrypted: i=1; AJvYcCVcvDnhscX3S2opZ5QClkPdebUJO+HyES0Z1iOwQCej4czqPTNHOM7sQe0crsXWfhXfhcmMz82FocT4DlNQJ90L@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0wGrdo/CJ+WT5eGvEbSK4IDP/5HL3W5bZKpimsssliwiLQYbW
	zusLubv+H4VQxBTnyWJT+FMMs4a0sXtADiGeUPZbQo6MqyYhT7IaKomc
X-Gm-Gg: ATEYQzy19+XhR2MMYkfLenFZjmy5d48AUJvq3khGACL2lp0Vz3wnEuLdtGH+korglBT
	iIs/22uh7WoaL6uL/LH4gHdMbwPKCh1xQrUNjVP0ICP5Kq5E2FQJoLzQkAWFv+cJjIfJVwclcmG
	dJwlYAr24wbQvTf8stBkV8a2yVMoVczhFv5PB+A79Vikoy/Tfi4jVDcRXOtxS/13QindcsFqGcc
	dPusQIF81Y4duQ8cpplwh89n80o8fjHsTYbg0rt3R+4vdv++AtiJPTg6mvBP6lUI8/XBVd71Xur
	uWpXSEgVehsV/YW9MDCTWH5Ql1H2jPDJrM8OMLwXmktcLuUIW841UInMZzT98uN+dcY96sh2V4G
	5CIWL/CGBAtEk3i3gFvJbokZn4hy2+wqLFwP/twry7XyA744bSusdp2X+0Nu1xVKaO30HK2Y9wE
	svLSsraAdClFP9lO8H96XzGez9nEoPD4lFJi20V2eGW2k53LUMck8ur+ErEaJmDxU0NvANLWAva
	efN2wntHBchQL0J9iehX3GSxXCIOZzQEZHU9mH9bUU8ZRzQ3csc55W7QEA3CjmUxZIxxcyhOQ==
X-Received: by 2002:a05:6000:601:b0:439:c2b6:d5d8 with SMTP id ffacd0b85a97d-439c8006b97mr4939995f8f.36.1772643783963;
        Wed, 04 Mar 2026 09:03:03 -0800 (PST)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b8807a4esm23022556f8f.4.2026.03.04.09.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:03:03 -0800 (PST)
Date: Wed, 4 Mar 2026 18:03:01 +0100
From: Franz Schnyder <fra.schnyder@gmail.com>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca, 
	benjamin.gaignard@collabora.com, p.zabel@pengutronix.de, sebastian.fricke@collabora.com, 
	shawnguo@kernel.org, ulf.hansson@linaro.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de, 
	Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com, imx@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
Subject: [REGRESSION] boot failure on imx8mp due to e0203ddf9af7
Message-ID: <n3qmcb62tepxltoskpf7ws6yiirc2so62ia23b42rj3wlmpl67@rvkbuirx7kkp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_090306_552190_6BA917F0 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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

Hello,

Our iMX8MP SoMs (Verdin and Toradex SMARC) fail to boot after 
commit e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC").
On rare occasions, it's still able to boot.
It fails after having registered g1 VPU, probably when it tries to
register g2 VPU.

Ming: Any ideas on how to proceed here?

Success::
[    9.040517] hantro-vpu 38300000.video-codec: registered nxp,imx8mm-vpu-g1-dec as /dev/video0
[    9.052133] hantro-vpu 38310000.video-codec: registered nxp,imx8mq-vpu-g2-dec as /dev/video1


Failure with decoded stacktrace::

[    9.004477] hantro-vpu 38300000.video-codec: registered nxp,imx8mm-vpu-g1-dec as /dev/video0
[    9.027097] Unable to handle kernel paging request at virtual address ffffd9c18eb05000
[    9.027132] Mem abort info:
[    9.027139]   ESR = 0x0000000096000007
[    9.027147]   EC = 0x25: DABT (current EL), IL = 32 bits
[    9.027156]   SET = 0, FnV = 0
[    9.027164]   EA = 0, S1PTW = 0
[    9.027171]   FSC = 0x07: level 3 translation fault
[    9.027180] Data abort info:
[    9.027187]   ISV = 0, ISS = 0x00000007, ISS2 = 0x00000000
[    9.027196]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    9.027205]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    9.027215] swapper pgtable: 4k pages, 48-bit VAs, pgdp=000000004924f000
[    9.027226] [ffffd9c18eb05000] pgd=0000000000000000, p4d=10000000496dd003, pud=1000000102e42403, pmd=100000010c33d403, pte=0000000000000000
[    9.027258] Internal error: Oops: 0000000096000007 [#1]  SMP
[    9.101669] Modules linked in: snd_soc_fsl_sai crypto_engine rng_core imx_pcm_dma authenc snd_soc_fsl_aud2htx snd_soc_fsl_utils imx8mp_interconnect libdes i
mx8mp_hdmi_pai evdev imx8mp_hdmi_tx aes_ce_blk dw_hdmi ghash_ce drm_display_helper snd_soc_simple_card hantro_vpu phy_fsl_imx8mq_usb libaes phy_fsl_samsung_hdm
i snd_soc_simple_card_utils cec phy_fsl_imx8m_pcie v4l2_vp9 imx8mp_hdmi_pvi typec fsl_imx8_ddr_perf snd_soc_imx_hdmi gf128mul samsung_dsim v4l2_h264 etnaviv ti
_ads1015 industrialio_triggered_buffer snd_soc_nau8822 ina2xx lm75 gpu_sched i3c lontium_lt8912b kfifo_buf governor_userspace imx_sdma flexcan imx_aipstz dwc3_
imx8mp imx_bus can_dev spi_nxp_fspi caam spi_imx error pwm_imx27 imx8mm_thermal nvmem_snvs_lpgpr snvs_pwrkey usb_conn_gpio gpio_keys display_connector roles lo
op fuse ipv6 libsha1 autofs4
[    9.173690] CPU: 3 UID: 0 PID: 45 Comm: kworker/u16:2 Not tainted 6.19.0+ #47 PREEMPT
[    9.181623] Hardware name: Toradex Verdin iMX8M Plus on Verdin Development Board (DT)
[    9.189462] Workqueue: events_unbound deferred_probe_work_func
[    9.195314] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    9.202284] pc : of_find_matching_node_and_match (drivers/of/base.c:1129 drivers/of/base.c:1120 drivers/of/base.c:1187)
[    9.207869] lr : of_find_matching_node_and_match (drivers/of/base.c:1185)
[    9.213452] sp : ffff8000805dbad0
[    9.216771] x29: ffff8000805dbad0 x28: 0000000000000000 x27: 0000000000000000
[    9.223927] x26: 0000000000000000 x25: 0000000000000000 x24: ffffd9c2060d48e0
[    9.231078] x23: 0000000000000000 x22: ffffd9c18eb05000 x21: ffff0000ff79d7f8
[    9.238231] x20: 0000000000000000 x19: ffffd9c18eb05000 x18: 00000000ffffffff
[    9.245385] x17: ffff263ef9a67000 x16: ffffd9c2055d3d54 x15: ffff8000805db870
[    9.252536] x14: 0000000000000000 x13: 006365646f632d6f x12: 0000000000000001
[    9.259689] x11: 0000000000000003 x10: 0000000000000020 x9 : 0000000000000000
[    9.266842] x8 : 0000000000000020 x7 : 00000000ffffffff x6 : ffff0000c4a9d8c8
[    9.273995] x5 : 0000000000000014 x4 : 0000000000000000 x3 : 0000000000000001
[    9.281145] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
[    9.288301] Call trace:
[    9.290753]  of_find_matching_node_and_match (drivers/of/base.c:1129 drivers/of/base.c:1120 drivers/of/base.c:1187) (P)
[    9.296336] hantro_probe (./include/linux/of.h:983 drivers/media/platform/verisilicon/hantro_drv.c:1047 drivers/media/platform/verisilicon/hantro_drv.c:1225) hantro_vpu
[    9.301144]  platform_probe (drivers/base/platform.c:1449)
[    9.304815]  really_probe (drivers/base/dd.c:583 drivers/base/dd.c:661)
[    9.308399]  __driver_probe_device (drivers/base/dd.c:803)
[    9.312765]  driver_probe_device (drivers/base/dd.c:833)
[    9.316956]  __device_attach_driver (drivers/base/dd.c:962)
[    9.321415]  bus_for_each_drv (drivers/base/bus.c:500)
[    9.325262]  __device_attach (drivers/base/dd.c:1035)
[    9.329109]  device_initial_probe (drivers/base/dd.c:1088)
[    9.333303]  bus_probe_device (drivers/base/bus.c:576)
[    9.337152]  deferred_probe_work_func (drivers/base/dd.c:125 (discriminator 14))
[    9.341697]  process_one_work (kernel/workqueue.c:3268)
[    9.345719]  worker_thread (kernel/workqueue.c:3334 kernel/workqueue.c:3421)
[    9.349477]  kthread (kernel/kthread.c:467)
[    9.352716]  ret_from_fork (arch/arm64/kernel/entry.S:861)
[    9.356303] Code: 6b14001f 9a93d35a 1a80d294 91032273 (39400264)
All code
========
   0:   6b14001f        cmp     w0, w20
   4:   9a93d35a        csel    x26, x26, x19, le
   8:   1a80d294        csel    w20, w20, w0, le
   c:   91032273        add     x19, x19, #0xc8
  10:*  39400264        ldrb    w4, [x19]               <-- trapping instruction

Code starting with the faulting instruction
===========================================
   0:   39400264        ldrb    w4, [x19]
[    9.362413] ---[ end trace 0000000000000000 ]---
[    9.367037] note: kworker/u16:2[45] exited with irqs disabled
[    9.367134] note: kworker/u16:2[45] exited with preempt_count 1


Thanks,
Franz


