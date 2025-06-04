Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D124C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 12:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjvlidjGUQC4SxdMsrlPY8e5lq5D3hS45/TeUXFKOwY=; b=hUigAFF7AYyRC1LJg5geky0Sov
	LccZyQZQJ2TBxzVWyG19z5FAaj/nz5pP9N9ewcxaSae2hxYHkh7zVgSzoihhyBiZyBOJ4X133SXsK
	y5/r5TV00YzJM6/naXFp1TdB71OT9RiMxXF7K2h4O3r8jQBMJm87j6plEJCygHWQBGtSFHSVjQ7o3
	qqBj1EZcqfZxllgd1ms8I62zlx6ivZKWj7sGcwYnv2rlJBcbZHrSoewbEYgthIs+V56TzCgNfgL/t
	M/jffcUnjLhXQvf3XB01RsoS2ey4I/n6CDpBV2g46oWxQEvH5zNTgHwN+Zac//XKuIKt4UTJO5jYm
	lkGxsQxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMnf8-0000000DO4y-24ck;
	Wed, 04 Jun 2025 12:56:10 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMnd1-0000000DNsb-43fn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 12:54:01 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b170c99aa49so4236296a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 05:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749041639; x=1749646439; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjvlidjGUQC4SxdMsrlPY8e5lq5D3hS45/TeUXFKOwY=;
        b=W/ZHiQytBW3q3uxaT/kyBrbB7D+TBNlwn2xUCkwMOJaJYR/bUMbbv/82R9CwdOBoJc
         LnYgp6XmLD9pX50n2cqV+0tFvtQsFA/IeSyLnrhcRzAPcgzE7qrKVc3xKmJlKLrUXSV8
         vIbo7Xn/6nYts22TQCcp1rdp+WQ6lqoBzwGHl53QKDGZYINQ68avI5Iv6Kl6n/EumE3g
         LVsnkdRz/3TIJe1vk2UpCjaRicYZ2nhFHgs+L1eEQAfbLouG1E7IJnIPYbRf3S2s9KKs
         7etHzNUWB0xQmjjo2MWFnUB5XpZtm6nlqBcXIkQssocRltq47MBW65allGWYUmPaKh5m
         B5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749041639; x=1749646439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjvlidjGUQC4SxdMsrlPY8e5lq5D3hS45/TeUXFKOwY=;
        b=PrW3UUmkFlFIA0Q8flOD8CCTon44GbXrvhllBNf+ToisrcOicBIa0aWQQ4qaIkScpd
         x17bZF4Yz4VANQ7eo23bZ9+MH44TJs1w9qR1T84i8ky8K7d6lTE1nqDwln0Cwi2bQSDi
         dQNZ0ZS+RG0Fhc/nnUmuXJ5pA+1D7X6+og0owbKlkO3izmaBEUQMBgR2zx7bMd9QBycj
         gQeV1s9fvLtKMlEyM6fHB1LzvQQFFc52IQZYub2vW+Php+9A49Nu1uRKxU00bpV48bkl
         UaO8tm3gwm1NN3DmaUvmqD1CeeJME/vARP1zszCHcdtPJqHFdY1qnvY7BhTPfux/7O9x
         BhyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbQp9ZVPp7vjdn5zzUlakidY33MI+YTceb0Y1kdI4osYnvuMqDZe0h3VhJvlZ5I9mW+T/AXKLFgkgIUCThBgca@lists.infradead.org
X-Gm-Message-State: AOJu0YzuRRy1NvfQwbEP2y4gxwd1Q/TCbwueaBF1tWY+hFUe1H54CTwS
	uDNqLgpcvQkefdkWanSiy1YJj1gtjoCb7eBhp7b0wsm30wvVbUZpB/H+0xhjt8GaJ5lzQ8VjFpx
	iTghu4b8NFRpU/Iey4smqsZVot4lgZK+GP4eIl+M=
X-Gm-Gg: ASbGncup7sp2Db0JdhfSXxQcoV8+oauQ3N/5/8j+WMbAkQqV5zMO3L8QNH4Z3SP/2dt
	p7RmwItOyvgwIycH+RHvDOLIUof9arv0J9pNKt1csWekXU47K75aPQFyNGacf8Z9NPBMPZ1VKg8
	KaR7elKjZubFnkSSxWZYlvoawKr7S4mQ==
X-Google-Smtp-Source: AGHT+IF8BahbWPg3PJ0D16BlqIY1qWwOW5iNYKdNrQkdBaMB8hXbKb0RJuekC/SLvpfEpMn9z+5vwKt1GFfdaEoA8s0=
X-Received: by 2002:a17:90b:35c5:b0:311:be51:bdf8 with SMTP id
 98e67ed59e1d1-3130cd6d85emr4203307a91.3.1749041638951; Wed, 04 Jun 2025
 05:53:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-imx95-rproc-1-v1-0-a6e5f512731c@nxp.com> <20250604-imx95-rproc-1-v1-2-a6e5f512731c@nxp.com>
In-Reply-To: <20250604-imx95-rproc-1-v1-2-a6e5f512731c@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 4 Jun 2025 15:55:55 +0300
X-Gm-Features: AX0GCFuQSVALoqDz8lEd52R5b_qpD5ZIb0xjVNRy7BAJHJd7nx_8wHvUzvLriIg
Message-ID: <CAEnQRZByPkxojykJ3w-Mxko08Nc5txsOCL4vy+P76HuTy3YTaA@mail.gmail.com>
Subject: Re: [PATCH 2/3] remoteproc: imx_rproc: Add support for System Manager API
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_055400_007968_368AB1DF 
X-CRM114-Status: GOOD (  29.69  )
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

Thanks a lot for the patches. Comments inline:

On Wed, Jun 4, 2025 at 5:36=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
>
> There are three cases for M7:
>  (1) M7 in a separate Logical Machine(LM) that Linux couldn't control it.
couldn't -> can't

>  (2) M7 in a separate Logical Machine that Linux could control it using
>      LMM protocol
could -> can

>  (3) M7 runs in same Logical Machine as A55, so Linux could control it
>      using CPU protocol
could -> can

>
> So extend the driver to using LMM and CPU protocol to manage the M7 core.
>  - Add IMX_RPROC_SM to indicate the remotecores runs on a SoC that
>    has System Manager.

remotecores -> remote core

>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(got
>    from DTB), if same, use CPU protocol to start/stop. Otherwise, use
>    LMM protocol to start/stop.
>    Whether using CPU or LMM protocol to start/stop, the M7 status
>    detection could use CPU protocol to detect started or not. So
>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
>    status of M7.
>  - For above case 1 and 2, Use SCMI_IMX_LMM_POWER_ON to detect whether
>    the M7 LM is under control of A55 LM.
>
> Current setup relies on pre-Linux software(U-Boot) to do
> M7 TCM ECC initialization. In future, we could add the support in Linux
> to decouple U-Boot and Linux.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 139 +++++++++++++++++++++++++++++++++++=
+++++-
>  drivers/remoteproc/imx_rproc.h |   2 +
>  2 files changed, 139 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rpro=
c.c
> index 74299af1d7f10a0db794de494c52304b2323b89f..0649faa98725db99366946c65=
edf5b7daff78316 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -8,6 +8,7 @@
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/firmware/imx/sci.h>
> +#include <linux/firmware/imx/sm.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/mailbox_client.h>
> @@ -21,6 +22,7 @@
>  #include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> +#include <linux/scmi_imx_protocol.h>
>  #include <linux/workqueue.h>
>
>  #include "imx_rproc.h"
> @@ -91,6 +93,11 @@ struct imx_rproc_mem {
>  #define ATT_CORE_MASK   0xffff
>  #define ATT_CORE(I)     BIT((I))
>
> +/* Logical Machine Operation */
> +#define IMX_RPROC_FLAGS_SM_LMM_OP      BIT(0)
> +/* Linux has permission to handle the Logical Machine of remote cores */
> +#define IMX_RPROC_FLAGS_SM_LMM_AVAIL   BIT(1)
> +
>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
>  static void imx_rproc_free_mbox(struct rproc *rproc);
>
> @@ -115,6 +122,22 @@ struct imx_rproc {
>         u32                             entry;          /* cpu start addr=
ess */
>         u32                             core_index;
>         struct dev_pm_domain_list       *pd_list;
> +       /* For i.MX System Manager based systems */
> +       u32                             cpuid;
> +       u32                             lmid;
> +       u32                             flags;
> +};
> +
> +static const struct imx_rproc_att imx_rproc_att_imx95_m7[] =3D {
> +       /* dev addr , sys addr  , size      , flags */
> +       /* TCM CODE NON-SECURE */
> +       { 0x00000000, 0x203C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +
> +       /* TCM SYS NON-SECURE*/
> +       { 0x20000000, 0x20400000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +
> +       /* DDR */
> +       { 0x80000000, 0x80000000, 0x50000000, 0 },
>  };

^ this belongs to patch 3/3

Otherwise, patch looks good to me.

