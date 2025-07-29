Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11609C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 01:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S23qOVMAAKB7qgLVeWulkQC0C/F5u4i6UjQVVe6TXAI=; b=0Fu6W5rNPsFA7DG6/nZYJ9lvx2
	Lrz4nVeWlBHvyfkkOmwJ1bE7VF1M/GIjctqrlPk1rkvsqIU97INLX6syEBM22eveuK8tbjlcA9ylj
	IhlSLg1cxWHAI81XI8bOcLWV7LBAmDkc/7drvjHtyhQRn6xO/FfH21lX/rKdajIWI9C3dfYxRz/YF
	zuqoscNwTmBcHugkCjpBmqLFyTtzAwBiIPt1ytaFBYj5O2Y9H8ms8dqWM49UG2y37gLHKMWKNYgcI
	doOAi8zKrDkZk2M55F+veZhmBxC7r5hVOWtWLSwUYIG4VCJ5cUGxfciE1zA2Ax8p4PBzzofGi/pQx
	sXzv3KHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugZGE-0000000Fi1d-2gks;
	Tue, 29 Jul 2025 01:36:10 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugZDl-0000000Fhkh-131p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 01:33:38 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3e2c683524fso22771585ab.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 18:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753752816; x=1754357616; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S23qOVMAAKB7qgLVeWulkQC0C/F5u4i6UjQVVe6TXAI=;
        b=ZoWCg2mIQg35NRBnOmKwO7aB1XhuXnN/wWY6uqWnLnZ/J0t1qNxmBj22m4Slz/8rXA
         ruuOkgFL8yK0pW8/hpcM+6oXiN2jkCNRK6lJyqOoHeAgKCLliYi3h2e9atl43ETkYhAV
         OvOFruDq+mTHYteCPAKBJl4BCN5lbrKi/BMCP4R++fuY505SKQC1YIj5QGe4cROZCE6J
         B4jCI44QdgttKb7BdHcLIejIMhes5VSFeLxI63aPKH4nuBgSKo7HCTZwOncGjXe191jK
         2RfKRGkz8FCjh4GY2HsZL8PXaSF/s12s+wLjxhfpYdMYxxwMFH5zyORzyrNIeTYJ+AGG
         rYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753752816; x=1754357616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S23qOVMAAKB7qgLVeWulkQC0C/F5u4i6UjQVVe6TXAI=;
        b=R46WjVTMSvK9GVmJ5xWDPa9OOOvF/ivUNgI5okn0Ii0P3r7WTejhsFScTCtakT6mDt
         ylXkGWGnfkKCjWdkwc7LDIpNAcMyqs0eOxhWzuoYCVqfF2k0hqMnzJTq7FCGWgnjK+3D
         KMGJMJ46Q2oz/myWV0vVcoJdToxInduRskrwnPkSaH1ODwxAhcIc3m4bFFeBDlMxR5X1
         Gt+oY60PD+vQNSinmKsDaTpkuLJfJWYcBOLSXqRVBRPrdpiO8LwI5G4DDnxseG9wLxeR
         512txDizIYwH0q5xU/egQF2V22gjjH3WIp7vUe23yQ2GRHWH17CzUxgMBcTgLBoDMZJM
         gQxA==
X-Forwarded-Encrypted: i=1; AJvYcCWU3C/7wNOqLRdI2xi+HvK0UUiUl5xn5LwNVONyoHTuY0zMOcFba+p/K9F8jmn1Z1XxDU+rkg3LitbP7UCg0xjm@lists.infradead.org
X-Gm-Message-State: AOJu0YxKcxipUbLhVE+ww2l4Aa1qi9m7f9FUrK985GE+JHtFsMeeGFtq
	HN1Sf0aeNfwvA2+LFE8gxJyMv9JfzSAB8qndG3IrK/VvueJEK7+vO2Mc0bRnRuwQBpxuTnKM4x1
	Q7uDxAO+DYGt7vC1uRZ1twOsnHp1G9TU=
X-Gm-Gg: ASbGncvd9D2yIDTRGU+8FjzDD7ma1uiXFXP9rTikutU2sDiGWBR5+CnmCb+4hJj/w5x
	ra1nugzF4P/SHu6fzRy6f/jApFi2Sv8WgXRBfGKqnfV5LdZzC7w+l5ADZkysV31HmsnX7VSUN6L
	LnU4AbNz24Hee1DPHpgmMI5iT2EfYSz4kpvw+cvL/mROpgqo33F9Vf91o/jcKnclYJGlayaZJqJ
	Jfgyfs=
X-Google-Smtp-Source: AGHT+IEr/DTMtrde4B2O2jQtp73B0jXdt56IWjZMklggeu9+9ek06vbQzMnKQzsISgrp5QqOpsqfLGJJJJuLC3iPRHo=
X-Received: by 2002:a92:cd82:0:b0:3e2:c350:2e61 with SMTP id
 e9e14a558f8ab-3e3c5312d49mr225067155ab.20.1753752815891; Mon, 28 Jul 2025
 18:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250722075225.544319-1-shengjiu.wang@nxp.com>
 <CAEnQRZBc2X6Yn0X+RbJ9-OSxovnHvoqJ3NXsJKBkuH82GNSAHA@mail.gmail.com>
 <aIeFqVUp2C6fh4PT@p14s> <12184ce7-e74b-48eb-abee-25f8a10a2423@nxp.com>
In-Reply-To: <12184ce7-e74b-48eb-abee-25f8a10a2423@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 29 Jul 2025 09:33:17 +0800
X-Gm-Features: Ac12FXyQrZyIVbOJ3pLjAv_HaREeHglGrD0Wy22HTBcGicbPxb4TlW_nT6cra8A
Message-ID: <CAA+D8AMpF9Te1+V=o6WQCzHTkKpKvrhP+76fpCZoswOhPiKDjQ@mail.gmail.com>
Subject: Re: [PATCH v3] remoteproc: imx_dsp_rproc: Add support of recovery and
 coredump process
To: Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Daniel Baluta <daniel.baluta@gmail.com>, andersson@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	jassisinghbrar@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_183337_291544_40EA7EA7 
X-CRM114-Status: GOOD (  28.69  )
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

On Mon, Jul 28, 2025 at 11:09=E2=80=AFPM Iuliana Prodan <iuliana.prodan@nxp=
.com> wrote:
>
> On 7/28/2025 5:14 PM, Mathieu Poirier wrote:
> > On Mon, Jul 28, 2025 at 01:39:38PM +0300, Daniel Baluta wrote:
> >> On Tue, Jul 22, 2025 at 11:16=E2=80=AFAM Shengjiu Wang <shengjiu.wang@=
nxp.com> wrote:
> >>>
> >>> When enabled FW recovery, but is broken because software reset is mis=
sed
> >>> in this recovery flow. So move software reset from
> >>> imx_dsp_runtime_resume() to .load() and clear memory before loading
> >>> firmware to make recovery work.
> >>>
> >>> Add call rproc_coredump_set_elf_info() to initialize the elf info for
> >>> coredump, otherwise coredump will report error "ELF class is not set"=
.
> >>>
> >>> Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc drive=
r for DSP on i.MX")
> >>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>
> >> Changes looks good to me:
>
> I agree, but this is not enough.
>
> >>
> >> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> >>
> >> I've tested it with Zephyr synchronization samples inducing a crash
> >> via debugfs interface. App
> >> can recover correctly.
>
>
> The synchronization sample does not utilize the Messaging Unit (MU) for
> communication between the two cores, its behavior is similar to the
> basic hello_world example (no fw_ready reply is expected by host).
>
> I=E2=80=99ve tested this patch with both the synchronization and hello_wo=
rld
> samples, as well as with the default firmware specified in the device
> tree (imx/dsp/hifi4.bin), and everything works as expected.
>
> However, when testing with the openamp_rsc_table sample from Zephyr [1],
> I encountered the following issue:
> ```
> [ 1500.964232] remoteproc remoteproc0: crash detected in imx-dsp-rproc:
> type watchdog
> [ 1500.964595] remoteproc remoteproc0: handling crash #1 in imx-dsp-rproc
> [ 1500.964608] remoteproc remoteproc0: recovering imx-dsp-rproc
> [ 1500.965959] remoteproc remoteproc0: stopped remote processor
> imx-dsp-rproc
> [ 1501.251897] remoteproc remoteproc0: can't start rproc imx-dsp-rproc: -=
110
> ```
> Upon debugging, I discovered that the issue stems from the imx-mailbox
> driver not clearing the General Purpose Interrupt (GPI) bits. This leads
> to the remote processor failing to restart properly.
>
> To ensure compatibility across all firmware variants, including those
> using OpenAMP, the attached patch is required. Both the recovery and
> mailbox patches have been successfully tested on the following
> platforms: i.MX8MP, i.MX8ULP, i.MX8QM and i.MX8QXP.
>
> Shengjiu, do you want to send a new version with both patches?

No.  it is a different issue.
You can send it to the mailbox maintainer for review.

Best regards
Shengjiu Wang

>
> Thanks,
> Iulia
>
> >
> > Very good - I will merge this around 6.17-rc2 when I get back from vaca=
tion.
> >
> > Mathieu
> >
>
> [1]
> https://github.com/zephyrproject-rtos/zephyr/tree/main/samples/subsys/ipc=
/openamp_rsc_table

