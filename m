Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325A7CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYs/QBXCZvq/660ODvJ+tef1LDCFmdxZ+HXurvTN9is=; b=uJyOf1T0JAHqFvRhJ/mLAl5wOf
	SrT2/JlGqO9BnksfOPyutxDQuhXCXBNBbBIkGhjynkeIDtdYUC2RrK57RLrbMrGhHZxWPqEeOqdb1
	lKT/LrjiCXkJR5VoBZusXv0R6fKLIf+om+K4E01WxTY2CoBSQMYENA/6uTaDnJDRs7pEYd/LV9Vnh
	Xsevlustw2KB2KN+yo7JG0L3jTXUOT4iY4c/JkDsPHMSN23mcEsNXtKSd79BuOh/jIZm/lVd59KIn
	cL9fA1bgsrUJcormCbz5qw6q0b827jRgESLkSUyQo7PFYQLtGStl4aOWgp+H3T+FOAImPenzLhHmD
	qFhB0WPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIRk-0000000GvxR-1aCC;
	Fri, 07 Nov 2025 09:07:52 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIRi-0000000Gvx0-1sL3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:07:51 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2955623e6faso4796695ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 01:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762506470; x=1763111270; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYs/QBXCZvq/660ODvJ+tef1LDCFmdxZ+HXurvTN9is=;
        b=bOF4JUsMNW9rwdmALYVLkgJfvaUR4hBOXpQAj+vTYJYu4lIL4ll6JVAMG1kCVWkZKr
         zpY1eIhgH1ut8f8jLg/rWd3TQqNXeS79bF/JcOn6m+LlqAtSSvy7pe7lNl093bSBt1D/
         OW5ZqI7+YzkW0Rfseq2taM9Oj1P7hwerM+q2h9Yz/CBHTdyZZhCOvWAiKKVEawIQZ05m
         GzM0+0MPaOXXxk7nJxHfrT+fafQ/ZJq2Ws6OsfDvs7/71JepA/LSUsuPqE/A4f2Ya7YW
         67G7GAs+5DbHGETYi0Slpamjt2JBNlAbaYqvYKLxI5LMj3y8gZ0Eyjrl9sflyMg5LTjB
         5MTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762506470; x=1763111270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DYs/QBXCZvq/660ODvJ+tef1LDCFmdxZ+HXurvTN9is=;
        b=Yaae1HGFfHbhJ//saoDTZaC7dYlpLRkiIUCUVME2vwT6PZig0J3YcPuhSQJeE8DGZw
         lBb91osFqjK4kLXDotE/7vHtTrG+g+8jIiVmNFxRWh+hK7niC9PmdhCkq6skf8BRJwRg
         Yfc5wnjAmvLO5TtiJd/gGz0NBfUZl1KYY1grHI+i/F89uUQyGvHfF11uBRmGsKzEsKe7
         5k969S49NBwDxbBMLuKEx7J2KgeZPyc4a2jfDtvKtn2QgVEJK8NZi546NNIdBZOfOQ83
         n+ptIHntc2+whdg7u9sPVJylwncexbsU3jUAsJrT9VJhnwatmpLmLLA3w20UGr9GRwgh
         617w==
X-Forwarded-Encrypted: i=1; AJvYcCXTkn6YHjbAnNFqebyAVvTVZEwJUM6iViTpkOAD7TSbySxBGjr4WHcCkzGN8fb3wRI4iLtFgu1Fp4bYEOsKaW3U@lists.infradead.org
X-Gm-Message-State: AOJu0YybM8covnEjS/X/uNucI9K8vj6jd9U/0u5VkJCMg07hFU2/xVLw
	5Qw13qwNtdxvk5gsHU3WxnVKAAxvxe+22i1KRmcV16vajLCuQ3NsAHJqYWIKggFhza7qtwsPo12
	KFqqjXY6EYP2kNA5tcDvfv6/yfv277KY=
X-Gm-Gg: ASbGncsmN2YhVHmjceP+1qhj81yHU6Sz1J37NqRqXr7dQYf8x8apqkGRIOgtS/uj5By
	XeARAx/NTljTiOa7JSqN77NDEzxCROyDE0tOzGrEvWku3A0GjfKX4T7vz7plakVUdR4nImrDY2V
	GUCDHxpK8uNQ+FIobfdsXGry3eSJj1HpgZKI/DQlJlCX37ipKQ2aTMzVGqx15lQ+7alZ7q68etO
	adOv+xFb7ue/Tu6YlPCJ2RFYzWE24dQ3GQwQcjDhEdHuyrCzHgzt2mU5A==
X-Google-Smtp-Source: AGHT+IHqvZ536/L69mxHkhuF11bfPojcxN3OKrIi8t8i0qaWQH5JkzQzoCPgXqiKJrVEEFwXuBfxc+8S2r0QzJL31A8=
X-Received: by 2002:a17:903:41ce:b0:295:bba:9734 with SMTP id
 d9443c01a7336-297c0403d70mr38962925ad.24.1762506469467; Fri, 07 Nov 2025
 01:07:49 -0800 (PST)
MIME-Version: 1.0
References: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com> <20251031-imx95-rproc-2025-10-31-v2-4-758b2e547a55@nxp.com>
In-Reply-To: <20251031-imx95-rproc-2025-10-31-v2-4-758b2e547a55@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 7 Nov 2025 11:10:15 +0200
X-Gm-Features: AWmQ_bm9Zcfpruky9KY1PgELNLr_sZHGvJRfTN76y_f7sFmTI8iuqFJ9SjSqPuM
Message-ID: <CAEnQRZC8PTbzNM056WUSR-kYqdf4Sgkr88z3S87ZFk+rc=q3=Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_010750_503732_605DAD09 
X-CRM114-Status: GOOD (  47.12  )
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

Some comments inline to make this easier to understand:

On Fri, Oct 31, 2025 at 4:26=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
>
> There are three cases for M7:

Here we should specify how M7 gets into these three situations, is it
via the ATF configuration?

e.g

Depending on ATF configuration, M7 can be used as follows:

>  (1) M7 in a separate Logical Machine(LM) that Linux can't control it.

Here we should make it clear from who is M7 separate.

e.g

(1) M7 in a separate Logical Machine (LM) from A55 cores, that Linux
can't control

>  (2) M7 in a separate Logical Machine that Linux can control it using
>      LMM protocol

(2) M7 in a separate LM from A55 cores that Linux can control using
LMM protocol.

>  (3) M7 runs in same Logical Machine as A55, so Linux can control it
>      using CPU protocol
>


> So extend the driver to using LMM and CPU protocol to manage the M7 core.


>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
>    is fixed as 1 in SM firmware if M7 is in a seprate LM),

s/seprate/separate

One question here: Is it OK to call scmi_imx_lmm_info no matter the
context are we in?

If this call fails is it safe to assume that we are in the case (1)
describe above? E.g Linux
cannot reach the M7 core through LMM protocol  or CPU protocol?



>    if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
>    protocol to start/stop. Otherwise, use LMM protocol to start/stop.
>    Whether using CPU or LMM protocol to start/stop, the M7 status
>    detection could use CPU protocol to detect started or not. So
>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
>    status of M7.
>  - For above case (1) and (2), Use SCMI_IMX_LMM_POWER_ON to detect whethe=
r
>    the M7 LM is under control of A55 LM.
>  - For above case , after using SCMI_IMX_LMM_POWER_ON to check
>    permission, SCMI_IMX_LMM_SHUTDOWN API should be called to shutdown
>    the M7 LM to save power only when M7 LM is going to be started by
>    remoteproc framework. Otherwise bypass SCMI_IMX_LMM_SHUTDOWN API if
>    M7 LM is started before booting Linux.
>
> Current setup relies on pre-Linux software(U-Boot) to do M7 TCM ECC
> initialization. In future, we could add the support in Linux to decouple
> U-Boot and Linux.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/Kconfig     |   2 +
>  drivers/remoteproc/imx_rproc.c | 192 +++++++++++++++++++++++++++++++++++=
++++++
>  drivers/remoteproc/imx_rproc.h |   3 +
>  3 files changed, 197 insertions(+)
>
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 48a0d3a69ed08057716f1e7ea950899f60bbe0cf..ee54436fea5ad08a9c198ce74=
d44ce7a9aa206de 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -27,6 +27,8 @@ config IMX_REMOTEPROC
>         tristate "i.MX remoteproc support"
>         depends on ARCH_MXC
>         depends on HAVE_ARM_SMCCC
> +       depends on IMX_SCMI_CPU_DRV || !IMX_SCMI_CPU_DRV
> +       depends on IMX_SCMI_LMM_DRV || !IMX_SCMI_LMM_DRV
>         select MAILBOX
>         help
>           Say y here to support iMX's remote processors via the remote
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rpro=
c.c
> index 232eb91e0b5dc2432131b1c140d6688b073fea1d..1fb17701964ca4ee4b73d343b=
5ec1be8e2ee5fda 100644
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
> @@ -22,6 +23,7 @@
>  #include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> +#include <linux/scmi_imx_protocol.h>
>  #include <linux/workqueue.h>
>
>  #include "imx_rproc.h"
> @@ -92,8 +94,12 @@ struct imx_rproc_mem {
>  #define ATT_CORE_MASK   0xffff
>  #define ATT_CORE(I)     BIT((I))
>
> +/* Linux has permission to handle the Logical Machine of remote cores */
> +#define IMX_RPROC_FLAGS_SM_LMM_AVAIL   BIT(0)
> +
>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
>  static void imx_rproc_free_mbox(void *data);
> +static int imx_rproc_sm_detect_mode(struct rproc *rproc);
>
>  struct imx_rproc {
>         struct device                   *dev;
> @@ -117,6 +123,8 @@ struct imx_rproc {
>         u32                             core_index;
>         struct dev_pm_domain_list       *pd_list;
>         const struct imx_rproc_plat_ops *ops;
> +       /* For i.MX System Manager based systems */
> +       u32                             flags;

<snip>

>  static int imx_rproc_prepare(struct rproc *rproc)
>  {
>         struct imx_rproc *priv =3D rproc->priv;
> @@ -994,6 +1090,102 @@ static int imx_rproc_scu_api_detect_mode(struct rp=
roc *rproc)
>         return 0;
>  }
>
> +static const struct imx_rproc_plat_ops imx_rproc_ops_sm =3D {

I think this should be called imx_rproc_ops_sm_lmm.

> +       .detect_mode    =3D imx_rproc_sm_detect_mode,
> +       .prepare        =3D imx_rproc_sm_lmm_prepare,
> +       .start          =3D imx_rproc_sm_lmm_start,
> +       .stop           =3D imx_rproc_sm_lmm_stop,
> +};
> +
> +static const struct imx_rproc_plat_ops imx_rproc_ops_sm_cpu =3D {
> +       .detect_mode    =3D imx_rproc_sm_detect_mode,
> +       .start          =3D imx_rproc_sm_cpu_start,
> +       .stop           =3D imx_rproc_sm_cpu_stop,
> +};
> +
> +static int imx_rproc_sm_lmm_check(struct rproc *rproc, bool started)
> +{
> +       struct imx_rproc *priv =3D rproc->priv;
> +       const struct imx_rproc_dcfg *dcfg =3D priv->dcfg;
> +       struct device *dev =3D priv->dev;
> +       int ret;
> +
> +       /*
> +        * Use power on to do permission check. If rproc is in different =
LM,
> +        * and linux has permission to handle the LM, set IMX_RPROC_FLAGS=
_SM_LMM_AVAIL.
> +        */
> +       ret =3D scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON,=
 0);

I wonder if there is a better call to check if Linux has permissions
to handle to other LMM. This is a bit
strange but if no other option we can go witi it.
> +       if (ret !=3D 0) {
> +               if (ret =3D=3D -EACCES) {
> +                       /* Not under Linux Control, so only do IPC betwee=
n rproc and Linux */
> +                       dev_info(dev, "lmm(%d) not under Linux Control\n"=
, dcfg->lmid);

Would this be an error? So if Linux cannot interact with the other LMM
via LMM API how IPC is possible?
via CPU protocol?

Maybe we need a better explanation here.


> +                       return 0;
> +               }


> +
> +               dev_info(dev, "power on lmm(%d) failed: %d\n", dcfg->lmid=
, ret);
> +               return ret;
> +       }
> +
> +       priv->flags |=3D IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> +
> +       /* rproc was started before boot Linux and under control of Linux=
, directly return */
> +       if (started)
> +               return 0;
> +
> +       /* else shutdown the LM to save power */
> +       ret =3D scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN,=
 0);
> +       if (ret) {
> +               dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid,=
 ret);

do we care to restore the flags field here on case of error?

> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int imx_rproc_sm_detect_mode(struct rproc *rproc)
> +{

<snip>

> +
> +       ret =3D scmi_imx_cpu_started(dcfg->cpuid, &started);

Is this CPU protocol call? So we can still use this even if Host core
and remote core are in different LMMs?

> +       if (ret) {
> +               dev_err(dev, "Failed to detect cpu(%d) status: %d\n", dcf=
g->cpuid, ret);
> +               return ret;
> +       }
> +
> +       if (started)
> +               priv->rproc->state =3D RPROC_DETACHED;
> +
> +       /* Get current Linux Logical Machine ID */
> +       ret =3D scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
> +       if (ret) {
> +               dev_err(dev, "Failed to get current LMM ID err: %d\n", re=
t);
> +               return ret;
> +       }
> +
> +       /*
> +        * Check whether remote processor is in same Logical Machine as L=
inux.

Is in same -> is in the same. We need to always try to be consistent.

Remote processor is a hardware part while Linux is a software part.

So always use the same object types: e.g /*check whether remote
processor is in the same LM as host core (running Linux) */

> +        * If yes, use CPU protocol API to manage remote processor.
> +        * If no, use Logical Machine API to manage remote processor.
> +        */
> +       is_cpu_ops =3D dcfg->lmid =3D=3D info.lmid;

No need for is_cpu_ops.

Just go if(dcfg->lmid =3D=3D info.lmid)


> +
> +       if (is_cpu_ops) {
> +               priv->ops =3D &imx_rproc_ops_sm_cpu;
> +               dev_info(dev, "Using CPU Protocol OPS\n");

I'm not sure we want to go with dev_info here. It it pollute the log
and at least confuse people.
But if you feel a strong need for this you can keep it.

Also, shouldn't be here an else case where priv->ops gets set to LMM ops?

> +               return 0;
> +       }
> +
> +       dev_info(dev, "Using LMM Protocol OPS\n");
> +
> +       return imx_rproc_sm_lmm_check(rproc, started);

If this check fails is the info message above still valid? It will
confuse people.

<snip>

> @@ -52,6 +52,9 @@ struct imx_rproc_dcfg {
>         enum imx_rproc_method           method;
>         u32                             flags;
>         const struct imx_rproc_plat_ops *ops;
> +       /* For System Manager(SM) based SoCs, the IDs are from SM firmwar=
e */

Keep here:

/* For System Manager(SM) based SoCs */

Then comment for each of the fields:
> +       u32                             cpuid; /* TODO.... CPU Id of the =
remote core? */

> +       u32                             lmid;

But how these fields are set? Are they the cpuid and lmid of the
remote core or local core (a55)?

