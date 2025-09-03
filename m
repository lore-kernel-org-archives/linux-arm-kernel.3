Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5925FCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 21:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wTAdyOlm/H89MIPXpHNMclT4BvrXX7ltwC3KFNrpZs=; b=3HBMm7lAFUnkLPHgca4q0Gt6FJ
	yn6zgmX9sTx0TfBs7QmCXV5QMoQowNnEw32XCnVS6LJMbV3Wgg5ORiKfVlaBK0MPtBJxmo2uVegcP
	4W5/CeDODFOFsK/QFrJKASuopI1ekFsbFEVc5mtPdeoDyPrBolnZHDB99eM+782pTyy0QyOCcXxyE
	F7p6UJphERGZ4zBXm0M1qSupPluSrQiv83fGdtdUtHsWAQRDwBIB4JauogDsBQUhi6cZymBQTrYW6
	2kGlZZrkvGirQ5gMNaaBjy1SbcMXmVy1HvKxCna8VNUkr6K0V0n/Y3w3QUteYVUf0WT0OXq+g7pvA
	z2GKgw8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utvDM-00000007hsO-14K3;
	Wed, 03 Sep 2025 21:40:24 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utp4S-00000006pyM-1vfQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 15:06:49 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-619487c8865so1964939a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 08:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756912007; x=1757516807; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wTAdyOlm/H89MIPXpHNMclT4BvrXX7ltwC3KFNrpZs=;
        b=Fy07FpkZ8EtFF7U8YFBhgQRtFEVYcd33o9zirdSpPnpsMhKCG8HdANKiOpFsHqlcff
         loVuYSE0+R213ddU3LRyLfrVmPt13WI4HGZiaEvzPhV1lIgfpjEuULz4LNrl8/eSy7lU
         MB6thEiZoUQOkrTixmOnCp508zp2mDD7AOmkGQcCCqKcPfBerIww7JUQipQchqnOOAus
         Klrgsqsd6OtFwVDLMdMuQFQDCgFhUynyDjocV54T1KobXSJmePY2wO9TTued7PuqiXE2
         G7x8PNRMQWUcRLNmtMsXML3gFDFtE4rTOrHI9zTqcGkbaJxlUA3Jxdx/imYksL/Cb4nF
         c5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912007; x=1757516807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wTAdyOlm/H89MIPXpHNMclT4BvrXX7ltwC3KFNrpZs=;
        b=q9k1SUeOsqZBF+UWgG1O9rKqO+YqCsBYgCPZmNMN2ncNVBH5meFtZ3nPRakSsxQkp4
         lf9Qwice9tdT9T2EvywtdAY4AEuGusyndXIJggboUARZpz10xcTZWPXnBAoR5QyF4qvk
         ogRcp65aXiqI94BVczRdGfH7DPFMjzD7UzU20Zo+dKlNd2s7NzE3aTQoxRt1S9UXuszN
         3X1svb1VqZG6YiqryS8Y1tDJgPlXYDKx10V/n3/guWg/mpCcVkE34SkeTRQhLa0wOLTN
         JbeudYn62LPu2iPwGZC9tjKq58WVQjhZHVW88W0lLNCbXBW8g877/sGJnnSMWiT38RX2
         Bk6g==
X-Forwarded-Encrypted: i=1; AJvYcCXlQa1aghMV81CjDcHuon85OsfjuLeeTbuTQ5jjU7/pw0lR9TawDoac7wGHZCRL9zfd0CPJdZp7jMAYlrNpemor@lists.infradead.org
X-Gm-Message-State: AOJu0YxT2rr/JrYJ4BdlHEBiCsB7ZC+jNqgBkBaApqrrFRCicQDzy97X
	YVGKUGQuOkrxEA0HPzpP2zeW/sEkNgDFG7A7hkmVqANzcmvqnYXqGN2hN41d6wJRftDIdfw+rZl
	3pHWW/KTGRonHIvEHd921Efg1X8CHSIaqc1UAU7YuaA==
X-Gm-Gg: ASbGncvo+c2MfV1NC7uoIRSbSNMX2771ZyYKnrBgQU3TO+ex0tcsAOzLH8pr2M38NSt
	SgEQ+C0g4xgF5DhQ6takVyJ+uhcrwSdBXgELbuCpjlXZXm05ER3mMjpZ3AbkSf0ZpftxRt4L4D9
	o0U1T5+d/1gRhZC4PqKOJJzE/ls1xNU8JU2fyoAySJc+41Fft6vz60828jrj9o8zv9Bwz9Hipym
	bH/LtD8jYcfU1bPNNKjCBVazCLZaWSS7rUE2XkruzBT7pApNUXpX3KAxxEcrKwQ3lLdCEWlXCqK
	PSoxIw==
X-Google-Smtp-Source: AGHT+IF+0pwoAAxX3gf5UWkmV+omghafmOGaLYNyWJBUplkZID7VrCGzVwPUHydMxnaJb7KCcSQuj+InbQ/V0zcvok0=
X-Received: by 2002:a05:6402:3494:b0:61d:9a4c:d03 with SMTP id
 4fb4d7f45d1cf-61d9a4c0e7cmr12317883a12.13.1756912006605; Wed, 03 Sep 2025
 08:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com>
 <20250821-imx95-rproc-1-v5-2-e93191dfac51@nxp.com> <aLHOhKpAQbVCC76-@p14s>
 <20250830125208.GA22718@nxa18884-linux.ap.freescale.net> <aLcdmY-gqd5cFOYc@p14s>
 <20250903045611.GA8860@nxa18884-linux.ap.freescale.net> <20250903063915.GA18615@nxa18884-linux.ap.freescale.net>
In-Reply-To: <20250903063915.GA18615@nxa18884-linux.ap.freescale.net>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 3 Sep 2025 09:06:34 -0600
X-Gm-Features: Ac12FXxkYEichdIeujGDnw-u0qzphz0riJYUzRCbZ9M50zatPIwa4Kz2wZhsuT4
Message-ID: <CANLsYkw0YqSDC7-SmA4x4hB1Z1kO5MVR-dZb8PAbkw6RMW6PNA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] remoteproc: imx_rproc: Add support for System
 Manager API
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_080648_508372_ADE377B3 
X-CRM114-Status: GOOD (  50.16  )
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

On Tue, 2 Sept 2025 at 23:28, Peng Fan <peng.fan@oss.nxp.com> wrote:
>
> On Wed, Sep 03, 2025 at 12:56:11PM +0800, Peng Fan wrote:
> >On Tue, Sep 02, 2025 at 10:38:49AM -0600, Mathieu Poirier wrote:
> >>On Sat, Aug 30, 2025 at 08:52:09PM +0800, Peng Fan wrote:
> >>> On Fri, Aug 29, 2025 at 10:00:04AM -0600, Mathieu Poirier wrote:
> >>> >Good day,
> >>> >
> >>> >On Thu, Aug 21, 2025 at 05:05:05PM +0800, Peng Fan wrote:
> >>> >> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> >>> >> one Cortex-M7 core. The System Control Management Interface(SCMI)
> >>> >> firmware runs on the M33 core. The i.MX95 SCMI firmware named Syst=
em
> >>> >> Manager(SM) includes vendor extension protocols, Logical Machine
> >>> >> Management(LMM) protocol and CPU protocol and etc.
> >>> >>
> >>> >> There are three cases for M7:
> >>> >>  (1) M7 in a separate Logical Machine(LM) that Linux can't control=
 it.
> >>> >>  (2) M7 in a separate Logical Machine that Linux can control it us=
ing
> >>> >>      LMM protocol
> >>> >>  (3) M7 runs in same Logical Machine as A55, so Linux can control =
it
> >>> >>      using CPU protocol
> >>> >>
> >>> >> So extend the driver to using LMM and CPU protocol to manage the M=
7 core.
> >>> >>  - Add IMX_RPROC_SM to indicate the remote core runs on a SoC that
> >>> >>    has System Manager.
> >>> >>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(t=
he ID
> >>> >>    is fixed as 1 in SM firmware if M7 is in a seprate LM),
> >>> >>    if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CP=
U
> >>> >>    protocol to start/stop. Otherwise, use LMM protocol to start/st=
op.
> >>> >>    Whether using CPU or LMM protocol to start/stop, the M7 status
> >>> >>    detection could use CPU protocol to detect started or not. So
> >>> >>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
> >>> >>    status of M7.
> >>> >>  - For above case 1 and 2, Use SCMI_IMX_LMM_POWER_ON to detect whe=
ther
> >>> >>    the M7 LM is under control of A55 LM.
> >>> >>
> >>> >> Current setup relies on pre-Linux software(U-Boot) to do
> >>> >> M7 TCM ECC initialization. In future, we could add the support in =
Linux
> >>> >> to decouple U-Boot and Linux.
> >>> >>
> >>> >> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> >>> >> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> >>> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >>> >> ---
> >>> >>  drivers/remoteproc/Kconfig     |   2 +
> >>> >>  drivers/remoteproc/imx_rproc.c | 123 ++++++++++++++++++++++++++++=
++++++++++++-
> >>> >>  drivers/remoteproc/imx_rproc.h |   5 ++
> >>> >>  3 files changed, 127 insertions(+), 3 deletions(-)
> >>> >>
> >>> >> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconf=
ig
> >>> >> index 48a0d3a69ed08057716f1e7ea950899f60bbe0cf..ee54436fea5ad08a9c=
198ce74d44ce7a9aa206de 100644
> >>> >> --- a/drivers/remoteproc/Kconfig
> >>> >> +++ b/drivers/remoteproc/Kconfig
> >>> >> @@ -27,6 +27,8 @@ config IMX_REMOTEPROC
> >>> >>          tristate "i.MX remoteproc support"
> >>> >>          depends on ARCH_MXC
> >>> >>          depends on HAVE_ARM_SMCCC
> >>> >> +        depends on IMX_SCMI_CPU_DRV || !IMX_SCMI_CPU_DRV
> >>> >> +        depends on IMX_SCMI_LMM_DRV || !IMX_SCMI_LMM_DRV
> >>> >>          select MAILBOX
> >>> >>          help
> >>> >>            Say y here to support iMX's remote processors via the r=
emote
> >>> >> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/i=
mx_rproc.c
> >>> >> index a6eef0080ca9e46efe60dcb3878b9efdbdc0f08e..151b9ca34bac2dac9d=
f0ed873f493791f2d1466e 100644
> >>> >> --- a/drivers/remoteproc/imx_rproc.c
> >>> >> +++ b/drivers/remoteproc/imx_rproc.c
> >>> >> @@ -8,6 +8,7 @@
> >>> >>  #include <linux/clk.h>
> >>> >>  #include <linux/err.h>
> >>> >>  #include <linux/firmware/imx/sci.h>
> >>> >> +#include <linux/firmware/imx/sm.h>
> >>> >>  #include <linux/interrupt.h>
> >>> >>  #include <linux/kernel.h>
> >>> >>  #include <linux/mailbox_client.h>
> >>> >> @@ -22,6 +23,7 @@
> >>> >>  #include <linux/reboot.h>
> >>> >>  #include <linux/regmap.h>
> >>> >>  #include <linux/remoteproc.h>
> >>> >> +#include <linux/scmi_imx_protocol.h>
> >>> >>  #include <linux/workqueue.h>
> >>> >>
> >>> >>  #include "imx_rproc.h"
> >>> >> @@ -92,6 +94,11 @@ struct imx_rproc_mem {
> >>> >>  #define ATT_CORE_MASK   0xffff
> >>> >>  #define ATT_CORE(I)     BIT((I))
> >>> >>
> >>> >> +/* Logical Machine Operation */
> >>> >> +#define IMX_RPROC_FLAGS_SM_LMM_OP       BIT(0)
> >>> >> +/* Linux has permission to handle the Logical Machine of remote c=
ores */
> >>> >> +#define IMX_RPROC_FLAGS_SM_LMM_AVAIL    BIT(1)
> >>> >> +
> >>> >>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_b=
lock);
> >>> >>  static void imx_rproc_free_mbox(struct rproc *rproc);
> >>> >>
> >>> >> @@ -116,6 +123,8 @@ struct imx_rproc {
> >>> >>          u32                             entry;          /* cpu st=
art address */
> >>> >>          u32                             core_index;
> >>> >>          struct dev_pm_domain_list       *pd_list;
> >>> >> +        /* For i.MX System Manager based systems */
> >>> >> +        u32                             flags;
> >>> >>  };
> >>> >>
> >>> >>  static const struct imx_rproc_att imx_rproc_att_imx93[] =3D {
> >>> >> @@ -394,6 +403,30 @@ static int imx_rproc_start(struct rproc *rpro=
c)
> >>> >>          case IMX_RPROC_SCU_API:
> >>> >>                  ret =3D imx_sc_pm_cpu_start(priv->ipc_handle, pri=
v->rsrc_id, true, priv->entry);
> >>> >>                  break;
> >>> >> +        case IMX_RPROC_SM:
> >>> >> +                if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
> >>> >> +                        if (!(priv->flags & IMX_RPROC_FLAGS_SM_LM=
M_AVAIL))
> >>> >> +                                return -EACCES;
> >>> >> +
> >>> >> +                        ret =3D scmi_imx_lmm_reset_vector_set(dcf=
g->lmid, dcfg->cpuid, 0, 0);
> >>> >> +                        if (ret) {
> >>> >> +                                dev_err(dev, "Failed to set reset=
 vector lmid(%u), cpuid(%u): %d\n",
> >>> >> +                                        dcfg->lmid, dcfg->cpuid, =
ret);
> >>> >> +                        }
> >>> >> +
> >>> >> +                        ret =3D scmi_imx_lmm_operation(dcfg->lmid=
, SCMI_IMX_LMM_BOOT, 0);
> >>> >> +                        if (ret)
> >>> >> +                                dev_err(dev, "Failed to boot lmm(=
%d): %d\n", ret, dcfg->lmid);
> >>> >> +                } else {
> >>> >> +                        ret =3D scmi_imx_cpu_reset_vector_set(dcf=
g->cpuid, 0, true, false, false);
> >>> >> +                        if (ret) {
> >>> >> +                                dev_err(dev, "Failed to set reset=
 vector cpuid(%u): %d\n",
> >>> >> +                                        dcfg->cpuid, ret);
> >>> >> +                        }
> >>> >> +
> >>> >> +                        ret =3D scmi_imx_cpu_start(dcfg->cpuid, t=
rue);
> >>> >> +                }
> >>> >> +                break;
> >>> >>          default:
> >>> >>                  return -EOPNOTSUPP;
> >>> >>          }
> >>> >> @@ -436,6 +469,16 @@ static int imx_rproc_stop(struct rproc *rproc=
)
> >>> >>          case IMX_RPROC_SCU_API:
> >>> >>                  ret =3D imx_sc_pm_cpu_start(priv->ipc_handle, pri=
v->rsrc_id, false, priv->entry);
> >>> >>                  break;
> >>> >> +        case IMX_RPROC_SM:
> >>> >> +                if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
> >>> >> +                        if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_=
AVAIL)
> >>> >> +                                ret =3D scmi_imx_lmm_operation(dc=
fg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> >>> >> +                        else
> >>> >> +                                ret =3D -EACCES;
> >>> >> +                } else {
> >>> >> +                        ret =3D scmi_imx_cpu_start(dcfg->cpuid, f=
alse);
> >>> >> +                }
> >>> >> +                break;
> >>> >>          default:
> >>> >>                  return -EOPNOTSUPP;
> >>> >>          }
> >>> >> @@ -546,10 +589,48 @@ static int imx_rproc_mem_release(struct rpro=
c *rproc,
> >>> >>          return 0;
> >>> >>  }
> >>> >>
> >>> >> +static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
> >>> >> +{
> >>> >> +        struct imx_rproc *priv =3D rproc->priv;
> >>> >> +        const struct imx_rproc_dcfg *dcfg =3D priv->dcfg;
> >>> >> +        int ret;
> >>> >> +
> >>> >> +        if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP))
> >>> >> +                return 0;
> >>> >> +
> >>> >> +        /*
> >>> >> +         * Power on the Logical Machine to make sure TCM is avail=
able.
> >>> >> +         * Also serve as permission check. If in different Logica=
l
> >>> >> +         * Machine, and linux has permission to handle the Logica=
l
> >>> >> +         * Machine, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
> >>> >> +         */
> >>> >> +        ret =3D scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_P=
OWER_ON, 0);
> >>> >> +        if (ret =3D=3D 0) {
> >>> >> +                dev_info(priv->dev, "lmm(%d) powered on\n", dcfg-=
>lmid);
> >>> >> +                priv->flags |=3D IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> >>> >
> >>> >Why is setting this flag needed?  The check that is done on it in
> >>> >imx_rproc_{start|stop} should be done here.  If there is an error th=
en we don't
> >>> >move forward.
> >>>
> >>> The flag is to indicate M7 LM could be controlled by Linux LM(to save=
 SCMI
> >>> calls. without this flag, heavy SCMI calls will be runs into). The re=
ason
> >>> on why set it here:
> >>> The prepare function will be invoked in two path: rproc_attach and rp=
roc_fw_boot.
> >>> When M7 LM works in detached state and not under control of Linux LM,=
 rproc_stop
> >>> could still be invoked, so we need to avoid Linux runs into scmi call=
s to
> >>> stop M7 LM(even if scmi firmware will return -EACCESS, but with a fla=
g, we could
> >>> save a SCMI call), so there is a check in imx_rproc_stop and this is =
why
> >>> we need a flag there.
> >>>
> >>> The flag check in start might be redundant, but to keep safe, I still=
 keep
> >>> it there.
> >>
> >>One of the (many) problem I see with this patch is that there is no
> >>IMX_RPROC_FLAGS_SM_CPU_OP to complement IMX_RPROC_FLAGS_SM_LMM_OP in
> >>imx_rproc_detect_mode(), leading to if/else statements that are hard to=
 follow.
> >
> >There are only two methods as written in commit log.
> >one is LMM_OP, the other is CPU_OP
> >
> >>
> >>In imx_rproc_sm_lmm_prepare(), if scmi_imx_lmm_operation() is successfu=
l, return
> >>0 immediately.  If -EACCESS the LMM method is unavailable in both norma=
l and
> >>detached mode, so priv->flags &=3D ~IMX_RPROC_FLAGS_SM_LMM_OP.
> >
> >No. LMM in avaiable in normal and detach mode. I have written in commit =
log,
> >There are three cases for M7:
> > (1) M7 in a separate Logical Machine(LM) that Linux can't control it.
> > (2) M7 in a separate Logical Machine that Linux can control it using
> >     LMM protocol
> > (3) M7 runs in same Logical Machine as A55, so Linux can control it
> >     using CPU protocol
> >
> >>
> >>The main takeaway here is that the code introduced by this patch is dif=
ficult to
> >>understand and maintain.  I suggest you find a way to make things simpl=
er.
> >
> >You asked Daniel to help review this patchset. Daniel and Frank both hel=
p
> >reviewed this patchset and gave R-b.
> >
> >You also said this patchset "looks fine to you" Jul 21 [1].
> >
> >Now you overturn these and say "find a way to make things simpler.
> >What's the point to ask my colleague to review?  What should I do,
> >redesign the patchset according to "make things simpler"?
> >
> >Please give detailed suggestions, but not a general comment.
>
> I realize my previous message may have come across as frustrated =E2=80=
=94 I truly
> appreciate your time and feedback. I=E2=80=99m just trying to understand =
the
> direction you=E2=80=99d prefer for this patchset, especially since it had=
 prior
> R-b=E2=80=99s and your earlier comment that it =E2=80=9Clooks fine.=E2=80=
=9D
>

I simply started taking a closer look and quickly found problems.

> Could you please help clarify what specifically you=E2=80=99d like simpli=
fied?
> I=E2=80=99m happy to revise accordingly, but I=E2=80=99d really appreciat=
e concrete
> suggestions so I can move forward effectively.
>

I did give suggestions.  The core of this patch is 123 lines - even
after spending two full hours reviewing it I still don't have a clear
picture of what is happening.  When that is the case, something is not
right.  When I look at a patchset, I usually ask myself if I'll
remember what it does when looking at it again in 6 months.  The
answer was a clear "no" with this one.

> @Daniel, @Frank =E2=80=94 since you've reviewed and R-b'd this patchset, =
do you
> have thoughts on the latest feedback from Mathieu? Would you agree that
> further simplification is needed, or is the current structure acceptable?=
=E2=80=9D
>
> Thanks again!
>
> Thanks,
> Peng
>
> >
> >[1] https://lore.kernel.org/all/CANLsYkwZz4xLOG25D6S-AEGFeUBWwyp1=3Dytmu=
2q90NyEpkoX9g@mail.gmail.com/
> >
> >Thanks,
> >Peng
> >>
> >

