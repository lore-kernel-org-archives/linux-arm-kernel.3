Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBAFCA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 22:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXBUwB6riv6anGuWowZRcLSzUYer/ZJs0DMzJRXqBAA=; b=jv0+HtYq8lyjH38owecXbyOjmL
	kyKJhdmzdiKMXfEE3VvxogmHuzyL8FQEkk4pH1yDaMqsN6Cbz2Wo638NVaNIctrTtEMU+Ki7FwxVF
	pNoHiafAWOR/JwAD70RtX2lyK3I723sf+eycL6WOb3ln+n/rUtoH3i97BW1FsC3DDEal3f07Yi41e
	YqYtTRVKTVaw6NtbhJIkFvSepkN0Ez+D6g8iYSk+5urIj+QfAqXkvC4TJVUsEShW76blvJc1o2uVH
	woQbc/+riPkl+tJ2TPoEC6Wr96hugGLcqpHcWjizGO9iAJ8UBO0yh3/Vsza5deK+sPx5Gu9xFkRpG
	OiGYrooQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utZwk-00000002UYK-3d43;
	Tue, 02 Sep 2025 22:57:50 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utU22-00000000zs3-00Kj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 16:38:55 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-772627dd50aso66200b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 09:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756831133; x=1757435933; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DXBUwB6riv6anGuWowZRcLSzUYer/ZJs0DMzJRXqBAA=;
        b=WiRPRChxZUXrH7fN3h/MxIfahWu+GclXJf6zXp6hQ7cROMIFuY39vW5SC4pf4WmmpS
         iLgrc3qKeiFdzcr9GKbTOErRg/NNCqfW8T1vcnXn6OaNzAoTftUI++CLrYkR4gyLGj2C
         MlyRjOYCv6EYeKHyrcNPVc9TsMDdKW03n5AcdMvQa89Oqb+2Z+eDsU5S7Gxlv3SFxXIg
         EzoxvKtsVOOs+Cuk+bvm8/teWGKBHQfN542ZPZUgwGIlhcRotc1JgIKUxT8nzy8pwyDe
         DpnSS6vBWUCflxlV83776FrQDrsvoj5KH3QDVsMuXthIEPyPHvCiOuYiu7fqEMxL7AP7
         ZuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756831133; x=1757435933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXBUwB6riv6anGuWowZRcLSzUYer/ZJs0DMzJRXqBAA=;
        b=BpHxmusekjjb/UZFG2uzYcn5NSC9MohKeDGiAz/ZGCSbhWiI+N0nENIkeUpSJlvHQm
         6cdOSYOU2w9mL3NigwQsJo5givVdNPXFFPb5EYIfqWCNx0O8DQfKWA8Hbw8ajIMLF5gj
         0asUaO0VOPuaaaxrDnzUxmkGOYYr7Cm5al3L5dyrDUpvT2BOJ6XayA5KOWwSlVJbStW8
         NtDhH1GtRi2DhMJTPvVbggsifq0A5+8m6dHaWq/f45KNHkLMQSJAh2sP4bJWCiiltRkS
         Pzh0MprOoD2OTDswUBfJ1bwD/jZ2a5eupURBFoxcfyDbBKn63xewmrzrlaXsMuZkB2FX
         jQ1A==
X-Forwarded-Encrypted: i=1; AJvYcCVm65AEyii17gzyUS3CUf3xaiALd2x+yCIDiEMjQcI9myEO7Ctxa4gTUpnPNC8OjqVasNiFIR3Bq8L8yIhSThAJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzTumtKCRSYMmI7hHXujfKw3wJwxW7dZqs8r4ZE4NL27XJ3mcq2
	/x5y8EmpDioau9zVqFu41myCRADyO/wLOvBsfM7XfVN8Umhg4jIRjSnlirbV91VA4wY=
X-Gm-Gg: ASbGncufv37r+UHtgcSRRJSkWz/X9Eg1jDziTs3S2QEuElCCHk5HmJ/U5EbF/NCp7Vy
	SDELNkBNZJIm0EiH6W+huOKlsjA4KvVQO7IZnD8h2H3v/0pnkqFrMsgxoHeQ+08oTBDedUjNcBR
	iknDVFqAGJ75ejmqbCTJ0EEmB3eACLMgoVJ92PiI1o6/8x/aFJ2Pu6SAMQPbQe1NwWsVNDXc7ok
	NIxeq7FEOrl19SWykBpjMXNCb2C1BI0XP6c3VjTzv/tiQm8dY6txkcWjfDZ3iMpVV7u5U0OdYuL
	AA6llQ+78hAlfDMzeiZhvwrZgAkdiuHZiy5ywJx2NZ4JuESZhzqczAUrKDD9R6QdlWA2u7asvz4
	jSK2eoXnxK+6haB9eogtRcpXJCOJE/GccQWkEpqUjLRnf0nHxflV9uD2JnnHq/ayEo/mT+ihVc0
	v//w6OkYFp/fzw4jYRRELVi/P26QfRd+hJjIA=
X-Google-Smtp-Source: AGHT+IEeDLgFOBjXxbJ/YLJ/SF9khStqJW4YrZ8PIFvkVTEmJPvZRH8PlrIDW8LLNusvSklsV66ErA==
X-Received: by 2002:a05:6a20:244c:b0:243:6f68:a2f6 with SMTP id adf61e73a8af0-243d51b0c03mr14553396637.20.1756831132641;
        Tue, 02 Sep 2025 09:38:52 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9b21:5c26:1409:23e9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd28aecd0sm12394758a12.30.2025.09.02.09.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 09:38:51 -0700 (PDT)
Date: Tue, 2 Sep 2025 10:38:49 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <aLcdmY-gqd5cFOYc@p14s>
References: <20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com>
 <20250821-imx95-rproc-1-v5-2-e93191dfac51@nxp.com>
 <aLHOhKpAQbVCC76-@p14s>
 <20250830125208.GA22718@nxa18884-linux.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830125208.GA22718@nxa18884-linux.ap.freescale.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_093854_061917_5768FA2E 
X-CRM114-Status: GOOD (  58.23  )
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

On Sat, Aug 30, 2025 at 08:52:09PM +0800, Peng Fan wrote:
> On Fri, Aug 29, 2025 at 10:00:04AM -0600, Mathieu Poirier wrote:
> >Good day,
> >
> >On Thu, Aug 21, 2025 at 05:05:05PM +0800, Peng Fan wrote:
> >> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> >> one Cortex-M7 core. The System Control Management Interface(SCMI)
> >> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> >> Manager(SM) includes vendor extension protocols, Logical Machine
> >> Management(LMM) protocol and CPU protocol and etc.
> >> 
> >> There are three cases for M7:
> >>  (1) M7 in a separate Logical Machine(LM) that Linux can't control it.
> >>  (2) M7 in a separate Logical Machine that Linux can control it using
> >>      LMM protocol
> >>  (3) M7 runs in same Logical Machine as A55, so Linux can control it
> >>      using CPU protocol
> >> 
> >> So extend the driver to using LMM and CPU protocol to manage the M7 core.
> >>  - Add IMX_RPROC_SM to indicate the remote core runs on a SoC that
> >>    has System Manager.
> >>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
> >>    is fixed as 1 in SM firmware if M7 is in a seprate LM),
> >>    if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
> >>    protocol to start/stop. Otherwise, use LMM protocol to start/stop.
> >>    Whether using CPU or LMM protocol to start/stop, the M7 status
> >>    detection could use CPU protocol to detect started or not. So
> >>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
> >>    status of M7.
> >>  - For above case 1 and 2, Use SCMI_IMX_LMM_POWER_ON to detect whether
> >>    the M7 LM is under control of A55 LM.
> >> 
> >> Current setup relies on pre-Linux software(U-Boot) to do
> >> M7 TCM ECC initialization. In future, we could add the support in Linux
> >> to decouple U-Boot and Linux.
> >> 
> >> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> >> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> ---
> >>  drivers/remoteproc/Kconfig     |   2 +
> >>  drivers/remoteproc/imx_rproc.c | 123 ++++++++++++++++++++++++++++++++++++++++-
> >>  drivers/remoteproc/imx_rproc.h |   5 ++
> >>  3 files changed, 127 insertions(+), 3 deletions(-)
> >> 
> >> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> >> index 48a0d3a69ed08057716f1e7ea950899f60bbe0cf..ee54436fea5ad08a9c198ce74d44ce7a9aa206de 100644
> >> --- a/drivers/remoteproc/Kconfig
> >> +++ b/drivers/remoteproc/Kconfig
> >> @@ -27,6 +27,8 @@ config IMX_REMOTEPROC
> >>  	tristate "i.MX remoteproc support"
> >>  	depends on ARCH_MXC
> >>  	depends on HAVE_ARM_SMCCC
> >> +	depends on IMX_SCMI_CPU_DRV || !IMX_SCMI_CPU_DRV
> >> +	depends on IMX_SCMI_LMM_DRV || !IMX_SCMI_LMM_DRV
> >>  	select MAILBOX
> >>  	help
> >>  	  Say y here to support iMX's remote processors via the remote
> >> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> >> index a6eef0080ca9e46efe60dcb3878b9efdbdc0f08e..151b9ca34bac2dac9df0ed873f493791f2d1466e 100644
> >> --- a/drivers/remoteproc/imx_rproc.c
> >> +++ b/drivers/remoteproc/imx_rproc.c
> >> @@ -8,6 +8,7 @@
> >>  #include <linux/clk.h>
> >>  #include <linux/err.h>
> >>  #include <linux/firmware/imx/sci.h>
> >> +#include <linux/firmware/imx/sm.h>
> >>  #include <linux/interrupt.h>
> >>  #include <linux/kernel.h>
> >>  #include <linux/mailbox_client.h>
> >> @@ -22,6 +23,7 @@
> >>  #include <linux/reboot.h>
> >>  #include <linux/regmap.h>
> >>  #include <linux/remoteproc.h>
> >> +#include <linux/scmi_imx_protocol.h>
> >>  #include <linux/workqueue.h>
> >>  
> >>  #include "imx_rproc.h"
> >> @@ -92,6 +94,11 @@ struct imx_rproc_mem {
> >>  #define ATT_CORE_MASK   0xffff
> >>  #define ATT_CORE(I)     BIT((I))
> >>  
> >> +/* Logical Machine Operation */
> >> +#define IMX_RPROC_FLAGS_SM_LMM_OP	BIT(0)
> >> +/* Linux has permission to handle the Logical Machine of remote cores */
> >> +#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(1)
> >> +
> >>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
> >>  static void imx_rproc_free_mbox(struct rproc *rproc);
> >>  
> >> @@ -116,6 +123,8 @@ struct imx_rproc {
> >>  	u32				entry;		/* cpu start address */
> >>  	u32				core_index;
> >>  	struct dev_pm_domain_list	*pd_list;
> >> +	/* For i.MX System Manager based systems */
> >> +	u32				flags;
> >>  };
> >>  
> >>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
> >> @@ -394,6 +403,30 @@ static int imx_rproc_start(struct rproc *rproc)
> >>  	case IMX_RPROC_SCU_API:
> >>  		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
> >>  		break;
> >> +	case IMX_RPROC_SM:
> >> +		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
> >> +			if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
> >> +				return -EACCES;
> >> +
> >> +			ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
> >> +			if (ret) {
> >> +				dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
> >> +					dcfg->lmid, dcfg->cpuid, ret);
> >> +			}
> >> +
> >> +			ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_BOOT, 0);
> >> +			if (ret)
> >> +				dev_err(dev, "Failed to boot lmm(%d): %d\n", ret, dcfg->lmid);
> >> +		} else {
> >> +			ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, 0, true, false, false);
> >> +			if (ret) {
> >> +				dev_err(dev, "Failed to set reset vector cpuid(%u): %d\n",
> >> +					dcfg->cpuid, ret);
> >> +			}
> >> +
> >> +			ret = scmi_imx_cpu_start(dcfg->cpuid, true);
> >> +		}
> >> +		break;
> >>  	default:
> >>  		return -EOPNOTSUPP;
> >>  	}
> >> @@ -436,6 +469,16 @@ static int imx_rproc_stop(struct rproc *rproc)
> >>  	case IMX_RPROC_SCU_API:
> >>  		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
> >>  		break;
> >> +	case IMX_RPROC_SM:
> >> +		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
> >> +			if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL)
> >> +				ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> >> +			else
> >> +				ret = -EACCES;
> >> +		} else {
> >> +			ret = scmi_imx_cpu_start(dcfg->cpuid, false);
> >> +		}
> >> +		break;
> >>  	default:
> >>  		return -EOPNOTSUPP;
> >>  	}
> >> @@ -546,10 +589,48 @@ static int imx_rproc_mem_release(struct rproc *rproc,
> >>  	return 0;
> >>  }
> >>  
> >> +static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
> >> +{
> >> +	struct imx_rproc *priv = rproc->priv;
> >> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> >> +	int ret;
> >> +
> >> +	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP))
> >> +		return 0;
> >> +
> >> +	/*
> >> +	 * Power on the Logical Machine to make sure TCM is available.
> >> +	 * Also serve as permission check. If in different Logical
> >> +	 * Machine, and linux has permission to handle the Logical
> >> +	 * Machine, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
> >> +	 */
> >> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> >> +	if (ret == 0) {
> >> +		dev_info(priv->dev, "lmm(%d) powered on\n", dcfg->lmid);
> >> +		priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> >
> >Why is setting this flag needed?  The check that is done on it in
> >imx_rproc_{start|stop} should be done here.  If there is an error then we don't
> >move forward.
> 
> The flag is to indicate M7 LM could be controlled by Linux LM(to save SCMI
> calls. without this flag, heavy SCMI calls will be runs into). The reason
> on why set it here:
> The prepare function will be invoked in two path: rproc_attach and rproc_fw_boot.
> When M7 LM works in detached state and not under control of Linux LM, rproc_stop
> could still be invoked, so we need to avoid Linux runs into scmi calls to
> stop M7 LM(even if scmi firmware will return -EACCESS, but with a flag, we could
> save a SCMI call), so there is a check in imx_rproc_stop and this is why
> we need a flag there.
> 
> The flag check in start might be redundant, but to keep safe, I still keep
> it there.

One of the (many) problem I see with this patch is that there is no
IMX_RPROC_FLAGS_SM_CPU_OP to complement IMX_RPROC_FLAGS_SM_LMM_OP in
imx_rproc_detect_mode(), leading to if/else statements that are hard to follow.

In imx_rproc_sm_lmm_prepare(), if scmi_imx_lmm_operation() is successful, return
0 immediately.  If -EACCESS the LMM method is unavailable in both normal and
detached mode, so priv->flags &= ~IMX_RPROC_FLAGS_SM_LMM_OP.

The main takeaway here is that the code introduced by this patch is difficult to
understand and maintain.  I suggest you find a way to make things simpler.

> 
> >
> >> +	} else if (ret == -EACCES) {
> >> +		dev_info(priv->dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
> >> +		/*
> >> +		 * If remote cores boots up in detached mode, continue;
> >> +		 * else linux has no permission, return -EACCES.
> >> +		 */
> >> +		if (priv->rproc->state != RPROC_DETACHED)
> >> +			return -EACCES;
> >
> >The comment above scmi_imx_lmm_operation() mentions that calling
> >scmi_imx_lmm_operation() is done to make sure TCMs are available.  Is there a
> >point in calling scmi_imx_lmm_operation() if ->state == RPROC_DETACHED?  If not,
> >can't that check be move to the beginning of imx_rproc_sm_lmm_prepare()?  
> 
> scmi_imx_lmm_operation also serves as permission check.
> 
> If ->state is RPROC_DETACHED, we still need to know M7 LM is or is not
> under control of Linux LM.
> 
> 
> >
> >> +
> >> +		/* work in state RPROC_DETACHED */
> >> +		ret = 0;
> >> +	} else if (ret) {
> >> +		dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", ret, dcfg->lmid);
> >> +	}
> >> +
> >> +	return ret;
> >> +}
> >> +
> >>  static int imx_rproc_prepare(struct rproc *rproc)
> >>  {
> >>  	struct imx_rproc *priv = rproc->priv;
> >>  	struct device_node *np = priv->dev->of_node;
> >> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> >>  	struct of_phandle_iterator it;
> >>  	struct rproc_mem_entry *mem;
> >>  	struct reserved_mem *rmem;
> >> @@ -593,7 +674,10 @@ static int imx_rproc_prepare(struct rproc *rproc)
> >>  		rproc_add_carveout(rproc, mem);
> >>  	}
> >>  
> >> -	return  0;
> >> +	if (dcfg->method == IMX_RPROC_SM)
> >> +		return imx_rproc_sm_lmm_prepare(rproc);
> >> +
> >> +	return 0;
> >>  }
> >>  
> >>  static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> >> @@ -927,13 +1011,41 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
> >>  	struct regmap_config config = { .name = "imx-rproc" };
> >>  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> >>  	struct device *dev = priv->dev;
> >> +	struct scmi_imx_lmm_info info;
> >>  	struct regmap *regmap;
> >>  	struct arm_smccc_res res;
> >> +	bool started = false;
> >>  	int ret;
> >>  	u32 val;
> >>  	u8 pt;
> >>  
> >>  	switch (dcfg->method) {
> >> +	case IMX_RPROC_SM:
> >> +		/* Get current Linux Logical Machine ID */
> >> +		ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
> >> +		if (ret) {
> >> +			dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
> >> +			return ret;
> >> +		}
> >> +
> >> +		/*
> >> +		 * Check whether remote processor is in same Logical Machine as Linux.
> >> +		 * If no, need use Logical Machine API to manage remote processor, and
> >> +		 * set IMX_RPROC_FLAGS_SM_LMM_OP.
> >> +		 * If yes, use CPU protocol API to manage remote processor.
> >> +		 */
> >> +		if (dcfg->lmid != info.lmid) {
> >> +			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_OP;
> >> +			dev_info(dev, "Using LMM Protocol OPS\n");
> >> +		} else {
> >> +			dev_info(dev, "Using CPU Protocol OPS\n");
> >> +		}
> >> +
> >> +		ret = scmi_imx_cpu_started(dcfg->cpuid, &started);
> >> +		if (ret || started)
> >> +			priv->rproc->state = RPROC_DETACHED;
> >
> >An error should be reported and the initialization process aborted if an error
> >occurs rather than defaulting to the default mode.  This will lead to additional
> >error conditions that will have to be handled elsewhere.
> 
> ok. I could update to
> if (ret)
> 	return ret;
> if (started)
> 	priv->rproc->state = RPROC_DETACHED;
> 
> 
> 
> Thanks,
> Peng
> 

