Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFA8CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 14:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmFKaOR4aQGC+poykjDdPG1AnUAiLy24Y6bEN5NS4q8=; b=JJbqix35LMfwf4QtY/6XrrhlVB
	NgzToUhM2mQyMPAUW1DDSnH6s/8QK43Mi5n4tJtw4E7zb54I3h7sKrMYtKa9+pagy7j5vqKbfOhmx
	quKFkNcBnIXS5SKhuJs2S9hZ3YnHZYRnqchMjnPYqGoUOBUIvU2v5aPZL7pkGlXQxqQgXpR6dfbCc
	RjYFUv0Ninl4lMb43ZSypmAgFSyEbp0IlLsiSmr/o7f12YJvK3qDLvpS2gFMY58P1yBc27LnVPevT
	o8K/DBPWWpAefUB9sMEsrJDDVATD1fteL6AXOzBh5qsBwvq4pOWDf0BXNxrUV6Qms9OUBeWtGuIVb
	MCk1Yz3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQRAK-00000005UVm-23eu;
	Tue, 02 Dec 2025 14:15:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQRAI-00000005UVQ-0Uqz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 14:15:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 196AA442F4
	for <linux-arm-kernel@lists.infradead.org>; Tue,  2 Dec 2025 14:15:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A06C2BCB5
	for <linux-arm-kernel@lists.infradead.org>; Tue,  2 Dec 2025 14:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764684937;
	bh=4Wc48KRaIcqiX0vglMdyQboI7iIQ2x8CgSCV7WOL/hs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p+ggOilV7hbCENVUpLZfQtcI9bfpQxkoFezHGuAQvuvaYdDyUV6O+t0GmwrCixOmy
	 eULW8VDcVhs3pmhrxIhNNfQvFW3zdGGzyw/w2Y4odcZdbCGDaYNtEhKAKm/UMMdA4O
	 xCHyePMCaHsP4Jm9H34vnPknAIQYx7+WkiU720/FmwpKT/ojij7crJN+bPbpoD6G/M
	 ABgNsVnpOIZAM9v0vD4VmwAxVFpbaQCzgDvN3FcCXBOnFcJPurFRM5yHKHAcUzR3Gk
	 urSDBmLfaBhdDE2Kxmm7ngIIP8x5Wvhgdqo2nmQ170Yub61jTjRyIGwDZxK6XQErY/
	 1e0tgAb6nnxag==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-644f90587e5so8619587a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 06:15:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUyRIUu36P9m19H7sPuHwfBHSHBRoFK+uOC1W4zbU6IqMs/J5erfqhMlLAo7bv0mpuoNxuFtYNLfyL5zkcXyHts@lists.infradead.org
X-Gm-Message-State: AOJu0YziTiYAr0deV9659U8UKua2ygsixan4zYqGauqswP4PIZUkFFy4
	OJeOsWRBXqwOvAg0wMOmXi4GqOM6RI43NmwnvHhARl8x3Sd5zSJdeDvtZYmUCLJ1L4aREVZd8f+
	NyJRQpLq1CxnV4kkHymAgCCL8VhWlXg==
X-Google-Smtp-Source: AGHT+IHOK37x0Kt35joRUOghP+Y+b/h+dUlhViPYEEU5vZFEgzun82hvWA1eFjAbdPJqCcazIpiBmOYOIRh+oi7lQBk=
X-Received: by 2002:a05:6402:51c9:b0:647:6589:516f with SMTP id
 4fb4d7f45d1cf-647658951c8mr11422163a12.23.1764684935180; Tue, 02 Dec 2025
 06:15:35 -0800 (PST)
MIME-Version: 1.0
References: <20251124182751.507624-1-robh@kernel.org> <CGME20251127142839eucas1p186846c6c1ea1d9e43369fbba9bb5d17c@eucas1p1.samsung.com>
 <20251124182751.507624-2-robh@kernel.org> <674efe8d-c299-4ce9-bf6b-c1920a5393eb@samsung.com>
In-Reply-To: <674efe8d-c299-4ce9-bf6b-c1920a5393eb@samsung.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 2 Dec 2025 08:15:23 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJTrGAJx-fv8OQGDhsLVKavQzzQotssEq_E5f_aJe8bOg@mail.gmail.com>
X-Gm-Features: AWmQ_blpHLPsU5za5Q3_8cThmj1tfuI1sEcIZQQrDepEj9pfYTWSHFtibfJZbEw
Message-ID: <CAL_JsqJTrGAJx-fv8OQGDhsLVKavQzzQotssEq_E5f_aJe8bOg@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] remoteproc: qcom: Use of_reserved_mem_region_*
 functions for "memory-region"
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Peng Fan <peng.fan@nxp.com>, 
	Beleswar Padhi <b-padhi@ti.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_061538_222353_E9E0C04D 
X-CRM114-Status: GOOD (  32.34  )
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

On Thu, Nov 27, 2025 at 8:28=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Rob,
>
> On 24.11.2025 19:27, Rob Herring (Arm) wrote:
> > Use the newly added of_reserved_mem_region_to_resource() and
> > of_reserved_mem_region_count() functions to handle "memory-region"
> > properties.
> >
> > The error handling is a bit different in some cases. Often
> > "memory-region" is optional, so failed lookup is not an error. But then
> > an error in of_reserved_mem_lookup() is treated as an error. However,
> > that distinction is not really important. Either the region is availabl=
e
> > and usable or it is not. So now, it is just
> > of_reserved_mem_region_to_resource() which is checked for an error.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> This patch landed in today's linux-next as commit c70b9d5fdcd7
> ("remoteproc: qcom: Use of_reserved_mem_region_* functions for
> "memory-region""). In my tests I found that it breaks booting of
> DragonBoard410c (arch/arm64/boot/dts/qcom/apq8016-sbc.dts) by causing
> the NULL pointer dereference. The issue is caused by replacing
> devm_ioremap_wc() with devm_ioremap_resource_wc(), which fails on
> devm_request_mem_region(), see comment in the code below. It looks that
> the error handling is somewhere broken. Here is the the kernel log:
>
> remoteproc remoteproc0: 4080000.remoteproc is available
> qcom-wcnss-pil a204000.remoteproc: error -EBUSY: can't request region
> for resource [mem 0x8e200000-0x8e7fffff]
> remoteproc remoteproc1: a204000.remoteproc is available
> remoteproc remoteproc1: powering up a204000.remoteproc
> remoteproc remoteproc1: Booting fw image qcom/apq8016/wcnss.mbn, size
> 4111376
> Unable to handle kernel paging request at virtual address fffffffffffffff=
0
> Mem abort info:
> ...
> Internal error: Oops: 0000000096000046 [#1]  SMP
> Modules linked in: cpufreq_powersave qcom_wcnss_pil cpufreq_conservative
> coresight_stm coresight_replicator coresight_tmc coresight_tpiu stm_core
> coresight_funnel coresight_cpu_debug coresight_cti(+) adv7511 coresight
> nfc rfkill msm snd_soc_lpass_apq8016 snd_soc_apq8016_sbc
> snd_soc_lpass_cpu snd_soc_msm8916_analog snd_soc_msm8916_digital
> snd_soc_qcom_common snd_soc_lpass_platform snd_soc_core qrtr ubwc_config
> snd_compress llcc_qcom snd_pcm_dmaengine qcom_q6v5_mss snd_pcm ocmem
> qcom_pil_info qcom_spmi_vadc qcom_camss drm_gpuvm qcom_pon rtc_pm8xxx
> qcom_q6v5 qcom_spmi_temp_alarm venus_core qcom_vadc_common snd_timer
> drm_exec qcom_sysmon snd qcom_common gpu_sched videobuf2_dma_sg
> v4l2_mem2mem qcom_glink_smem v4l2_fwnode soundcore drm_dp_aux_bus
> qmi_helpers mdt_loader v4l2_async videobuf2_memops videobuf2_v4l2
> videodev qnoc_msm8916 videobuf2_common qcom_rng drm_display_helper mc
> qcom_stats rpmsg_ctrl rpmsg_char display_connector ramoops socinfo
> rmtfs_mem reed_solomon ax88796b asix usbnet phy_qcom_usb_hs ipv6 libsha1
> CPU: 2 UID: 0 PID: 28 Comm: kworker/2:0 Tainted: G W
> 6.18.0-rc1+ #16209 PREEMPT
> Tainted: [W]=3DWARN
> lr : __qcom_mdt_load+0x210/0x304 [mdt_loader]
> Call trace:
>   __pi_memcpy_generic+0x128/0x22c (P)
>   qcom_mdt_load+0x68/0x60c [mdt_loader]
>   wcnss_load+0x2c/0x5c [qcom_wcnss_pil]
>   rproc_start+0x30/0x1b4
>   rproc_boot+0x19c/0x560
>   rproc_auto_boot_callback+0x1c/0x34
>   request_firmware_work_func+0x4c/0x98
>   process_one_work+0x208/0x60c
>   worker_thread+0x244/0x388
>   kthread+0x150/0x228
>   ret_from_fork+0x10/0x20
> Code: 927cec03 cb0e0021 8b0e0042 a9411c26 (a900340c)
> ---[ end trace 0000000000000000 ]---
>
>
> > ---
> > v7:
> >   - Split QCom to separate patch
> > ---
> >   drivers/remoteproc/qcom_q6v5_adsp.c | 24 ++++------
> >   drivers/remoteproc/qcom_q6v5_mss.c  | 60 ++++++++-----------------
> >   drivers/remoteproc/qcom_q6v5_pas.c  | 69 +++++++++++-----------------=
-
> >   drivers/remoteproc/qcom_q6v5_wcss.c | 25 +++++------
> >   drivers/remoteproc/qcom_wcnss.c     | 23 ++++------
> >   5 files changed, 72 insertions(+), 129 deletions(-)
> >
>
> > ...
>
> > diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_=
wcnss.c
> > index 2c7e519a2254..14005fb049a2 100644
> > --- a/drivers/remoteproc/qcom_wcnss.c
> > +++ b/drivers/remoteproc/qcom_wcnss.c
> > @@ -526,25 +526,20 @@ static int wcnss_request_irq(struct qcom_wcnss *w=
cnss,
> >
> >   static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
> >   {
> > -     struct reserved_mem *rmem =3D NULL;
> > -     struct device_node *node;
> > -
> > -     node =3D of_parse_phandle(wcnss->dev->of_node, "memory-region", 0=
);
> > -     if (node)
> > -             rmem =3D of_reserved_mem_lookup(node);
> > -     of_node_put(node);
> > +     struct resource res;
> > +     int ret;
> >
> > -     if (!rmem) {
> > +     ret =3D of_reserved_mem_region_to_resource(wcnss->dev->of_node, 0=
, &res);
> > +     if (ret) {
> >               dev_err(wcnss->dev, "unable to resolve memory-region\n");
> > -             return -EINVAL;
> > +             return ret;
> >       }
> >
> > -     wcnss->mem_phys =3D wcnss->mem_reloc =3D rmem->base;
> > -     wcnss->mem_size =3D rmem->size;
> > -     wcnss->mem_region =3D devm_ioremap_wc(wcnss->dev, wcnss->mem_phys=
, wcnss->mem_size);
> > +     wcnss->mem_phys =3D wcnss->mem_reloc =3D res.start;
> > +     wcnss->mem_size =3D resource_size(&res);
> > +     wcnss->mem_region =3D devm_ioremap_resource_wc(wcnss->dev, &res);
>
> The above line causes the failure. After restoring it to:
>
> wcnss->mem_region =3D devm_ioremap_wc(wcnss->dev, wcnss->mem_phys, wcnss-=
>mem_size);
>
> the mentioned board boots fine again. I'm not sure about other drivers,
> if they also fail the same way as they might not be used on the tested
> board.

Other platforms (non-QCom) were tested also use
devm_ioremap_resource_wc(). So something else is claiming the same
region? Can you dump out /proc/iomem?

The region is dynamically allocated, so maybe that has something to do with=
 it.

Rob

