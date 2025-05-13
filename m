Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08701C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 21:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PF/f05Jnn8cBIgm4MkrIADKbDArlZkrF9k16SO3CXK4=; b=KitJ5UbTg4Wp/KMAe0ldWZwYvw
	7U+kNYWtyXOD7IMHdmPb1PPHIftNMzJHuNZ/rxMgf4duOOuoAu9STeZn11S2b6PjL129pqf8VvpQA
	cOqPXTTjIaxFvA2H1JMdiXSytGrHn2CmuksvZBjiNxuyfdsDX+zHnxmBPAmwhz6ETkmVudV+XU+Xk
	U3XT410o+aMeBGdwjHLP+Bv2RDFN3sSi4YX9e6Fr7Gi/jG4/cADEQOJ6o5P44cDSLho6twt0mTEN/
	vsFoFDgulnaSx9fk1BHH4zgxdjhL0q7Z+ONmRNAioCFek9/OcgTordxK6jaa+qgjhf1wtQMNVCgXs
	CdMHCfBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEwr3-0000000DXfB-3NpU;
	Tue, 13 May 2025 21:08:01 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEwov-0000000DXSp-2iOS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 21:05:50 +0000
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-4ddbb22503bso4378128137.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 14:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747170348; x=1747775148; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PF/f05Jnn8cBIgm4MkrIADKbDArlZkrF9k16SO3CXK4=;
        b=a9q+fgwaog79ZwBIaWehtrlao0/54Xk3UEyd/2nJPKLbBPbXQ95EkGdP9iYrqF1Cbk
         yH09rqhAqhYjOEy90mOc2IbcLIE/kX2rnG3OGnXOwyMFJVHW1dOGXcQPXRwwt0hP1d+w
         SAZu/ZtUGfb8P3rERO7qE6mPC1jlw6efJPmT3XRyFHnNNWUcAjtONCm5D20AvvGPeRJB
         fRHZfsQXIm2BIsZj/e0/7o7u0UzF/vO5QpR92x+kE7Xj5BM1UQb9Ynp81V0j5wcyZJti
         Mzxs4osQTypoT1ug66xq7YPsRo/bxcJVx1DYdYf0OFc/Gh6qth/J5iH3hHoX6xoZXY2V
         kHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747170348; x=1747775148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PF/f05Jnn8cBIgm4MkrIADKbDArlZkrF9k16SO3CXK4=;
        b=thoSvP5RhijMyR6QQIzXjxis3QysXN1G5dBz1chKn6IqGKyzLURgH/nDjCUL4f72lN
         fymOjhbDqUD/cvkkZ3VAhUrlesbkxWTaZ93KA3kOdQGYsk2FjIyX4q+rMEm16TUubYKc
         +iPAG9r4BkufIohM4hTiLG3pXgvX8gDg2xwiziERaUdBBIXB9nU6Hrj/M0vudzMxOye1
         K4hNkgEQBHiE15S56rWPJQ2rIHe87egIjvoeT1z0xomtUY8QfxrUfTQ2cX1te8WSu+2p
         4GIAjiAhg6L4AGvV6GEgGK0VYMSFGO3WxdDkSHkUCmWJQ9Og8J87YGB7MILbqXq2rSQg
         7zXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnUPgPBusSvrMKml8DE6YDnRgSOYHr7Sw+8jOuoaIhQSu4tbcreAlzxMrjUPA0BCHCBVod/5yRxnioSXxIYKvM@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7cLf4fUP1pWl7hNeE9jczBPLfdBnZx2UsN4q4HWmFk2CvLh5h
	z9/hEnBPr36B58gbMNpPzFp1vFaipCdDOl4D47Tr97Zf+TziCFI0
X-Gm-Gg: ASbGncv/zJNmZdQ4RLMaHxvrH4pGYaPBQeUBi7618XM+B+YfzomjXe/kAR9DzoRjffm
	qHa/sPz9Hx77ZgcbdYU77YfNK56Tmf867dYZyGigbPjsom8zQWeQcUIRwVy31gjphSn35m4Zsg2
	J4FbvDGjheBpPpMZkjackC5hmFpo73D0psayJsiWWPrBy2Dvk5fWidjtZL5YGtswrHjvMmmSX6A
	qqx50Sfk7OVA6y4GCN3BRwMmymOApykQwTqNjTVYnK8Jh/EQqQnCYVuxK2wHHCE1kvjvRZtr9e8
	268LswCtSz76KFlr6DcBW1DGchkpSAFbUhh3FeJUwQk1bjC0TQ==
X-Google-Smtp-Source: AGHT+IGxvFdQRn97UaiBY7c/whlkImXIkzkXz6uwmHgp7GwxfHPgSbQVCxBX8oQoHlKhKWt+naoXiA==
X-Received: by 2002:a05:6102:948:b0:4c3:6544:c250 with SMTP id ada2fe7eead31-4df7ddf92ecmr1108581137.23.1747170347966;
        Tue, 13 May 2025 14:05:47 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f6139e8csm7562202241.2.2025.05.13.14.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 14:05:47 -0700 (PDT)
Date: Tue, 13 May 2025 18:05:41 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2 1/3] firmware: imx: move get power mode function from
 scu-pd.c to misc.c
Message-ID: <20250513210541.f6ptdxq5ocni3bp3@hiago-nb>
References: <20250507160056.11876-1-hiagofranco@gmail.com>
 <20250507160056.11876-2-hiagofranco@gmail.com>
 <20250513073822.GA14572@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513073822.GA14572@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_140549_695218_B51FEFA8 
X-CRM114-Status: GOOD (  30.57  )
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

On Tue, May 13, 2025 at 03:43:37PM +0800, Peng Fan wrote:
> Hi Hiago,
> 
> On Wed, May 07, 2025 at 01:00:54PM -0300, Hiago De Franco wrote:
> >From: Hiago De Franco <hiago.franco@toradex.com>
> >
> >Move imx_sc_get_pd_power() from pmdomain/imx/scu-pd.c to
> >firmware/imx/misc.c and rename it to imx_sc_pm_get_resource_power_mode()
> >to maintain the same naming logic with other functions in misc.c.
> >
> >This makes the API available for other use cases. For example,
> >remoteproc/imx_rproc.c can now use this function to check the power mode
> >of the remote core.
> >
> >Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> >---
> >v2: moved this patch to be the first one
> >---
> > drivers/firmware/imx/misc.c           | 47 +++++++++++++++++++++++++++
> > drivers/pmdomain/imx/scu-pd.c         | 29 ++++-------------
> > include/linux/firmware/imx/svc/misc.h |  8 +++++
> > 3 files changed, 62 insertions(+), 22 deletions(-)
> >
> >diff --git a/drivers/firmware/imx/misc.c b/drivers/firmware/imx/misc.c
> >index d073cb3ce699..61fcb0066ec9 100644
> >--- a/drivers/firmware/imx/misc.c
> >+++ b/drivers/firmware/imx/misc.c
> >@@ -37,6 +37,18 @@ struct imx_sc_msg_resp_misc_get_ctrl {
> > 	u32 val;
> > } __packed __aligned(4);
> > 
> >+struct imx_sc_msg_req_get_resource_power_mode {
> >+	struct imx_sc_rpc_msg hdr;
> >+	union {
> >+		struct {
> >+			u16 resource;
> >+		} req;
> >+		struct {
> >+			u8 mode;
> >+		} resp;
> >+	} data;
> >+} __packed __aligned(4);
> >+
> > /*
> >  * This function sets a miscellaneous control value.
> >  *
> >@@ -135,3 +147,38 @@ int imx_sc_pm_cpu_start(struct imx_sc_ipc *ipc, u32 resource,
> > 	return imx_scu_call_rpc(ipc, &msg, true);
> > }
> > EXPORT_SYMBOL(imx_sc_pm_cpu_start);
> >+
> >+/*
> >+ * This function gets the power mode from a given @resource
> >+ *
> >+ * @param[in]     ipc         IPC handle
> >+ * @param[in]     resource    resource to check the power mode
> >+ *
> >+ * @return Returns < 0 for errors or the following for success:
> >+ * IMX_SC_PM_PW_MODE_OFF  0	Power off
> >+ * IMX_SC_PM_PW_MODE_STBY 1	Power in standby
> >+ * IMX_SC_PM_PW_MODE_LP   2	Power in low-power
> >+ * IMX_SC_PM_PW_MODE_ON   3	Power on
> >+ *
> >+ * These are defined under firmware/imx/svc/pm.h
> >+ */
> >+int imx_sc_pm_get_resource_power_mode(struct imx_sc_ipc *ipc, u32 resource)
> >+{
> >+	struct imx_sc_msg_req_get_resource_power_mode msg;
> >+	struct imx_sc_rpc_msg *hdr = &msg.hdr;
> >+	int ret;
> >+
> >+	hdr->ver = IMX_SC_RPC_VERSION;
> >+	hdr->svc = IMX_SC_RPC_SVC_PM;
> >+	hdr->func = IMX_SC_PM_FUNC_GET_RESOURCE_POWER_MODE;
> >+	hdr->size = 2;
> >+
> >+	msg.data.req.resource = resource;
> >+
> >+	ret = imx_scu_call_rpc(ipc, &msg, true);
> >+	if (ret)
> >+		return ret;
> >+
> >+	return msg.data.resp.mode;
> >+}
> >+EXPORT_SYMBOL(imx_sc_pm_get_resource_power_mode);
> >diff --git a/drivers/pmdomain/imx/scu-pd.c b/drivers/pmdomain/imx/scu-pd.c
> >index 01d465d88f60..945f972e636f 100644
> >--- a/drivers/pmdomain/imx/scu-pd.c
> >+++ b/drivers/pmdomain/imx/scu-pd.c
> >@@ -54,6 +54,7 @@
> > #include <dt-bindings/firmware/imx/rsrc.h>
> > #include <linux/console.h>
> > #include <linux/firmware/imx/sci.h>
> >+#include <linux/firmware/imx/svc/misc.h>
> > #include <linux/firmware/imx/svc/rm.h>
> > #include <linux/io.h>
> > #include <linux/module.h>
> >@@ -328,27 +329,6 @@ static void imx_sc_pd_get_console_rsrc(void)
> > 	imx_con_rsrc = specs.args[0];
> > }
> > 
> >-static int imx_sc_get_pd_power(struct device *dev, u32 rsrc)
> >-{
> >-	struct imx_sc_msg_req_get_resource_power_mode msg;
> >-	struct imx_sc_rpc_msg *hdr = &msg.hdr;
> >-	int ret;
> >-
> >-	hdr->ver = IMX_SC_RPC_VERSION;
> >-	hdr->svc = IMX_SC_RPC_SVC_PM;
> >-	hdr->func = IMX_SC_PM_FUNC_GET_RESOURCE_POWER_MODE;
> >-	hdr->size = 2;
> >-
> >-	msg.data.req.resource = rsrc;
> >-
> >-	ret = imx_scu_call_rpc(pm_ipc_handle, &msg, true);
> >-	if (ret)
> >-		dev_err(dev, "failed to get power resource %d mode, ret %d\n",
> >-			rsrc, ret);
> >-
> >-	return msg.data.resp.mode;
> >-}
> >-
> > static int imx_sc_pd_power(struct generic_pm_domain *domain, bool power_on)
> > {
> > 	struct imx_sc_msg_req_set_resource_power_mode msg;
> >@@ -438,7 +418,12 @@ imx_scu_add_pm_domain(struct device *dev, int idx,
> > 	if (imx_con_rsrc == sc_pd->rsrc)
> > 		sc_pd->pd.flags = GENPD_FLAG_RPM_ALWAYS_ON;
> > 
> >-	mode = imx_sc_get_pd_power(dev, pd_ranges->rsrc + idx);
> >+	mode = imx_sc_pm_get_resource_power_mode(pm_ipc_handle,
> 
> I mean, not change scu-pd.c in this patchset. After
> imx_sc_pm_get_resource_power_mode landed, you could update scu-pd.c.
> 
> Otherwise you are touch three trees which are a bit hard to manage for
> maintainers:
> scu-pd.c under linux-pm tree
> misc.c under linux-imx tree, I think using power.c should be better.
> imx_rproc.c under linux-remoteproc tree
> 
> My suggestion was that
> patch 1: firmware: imx: Introduce imx_sc_pm_get_resource_power_mode
> patch 2: remoteproc: imx_rproc: Detecting power mode of M4 for i.MX8QX
> Patch 3: pmdomain: scu-pd: migrate to use imx common pm API
> 
> Patch 3 could be separate out in future patchset to avoid handling three trees.

Ok, got it. I will prepare the v3 with your suggestions. Thanks.

> 
> Regards,
> Peng
> >+						 pd_ranges->rsrc + idx);
> >+	if (mode < 0)
> >+		dev_err(dev, "failed to get power resource %d mode, ret %d\n",
> >+			pd_ranges->rsrc + idx, mode);
> >+
> > 	if (mode == IMX_SC_PM_PW_MODE_ON)
> > 		is_off = false;
> > 	else
> >diff --git a/include/linux/firmware/imx/svc/misc.h b/include/linux/firmware/imx/svc/misc.h
> >index 760db08a67fc..376c800a88d0 100644
> >--- a/include/linux/firmware/imx/svc/misc.h
> >+++ b/include/linux/firmware/imx/svc/misc.h
> >@@ -55,6 +55,8 @@ int imx_sc_misc_get_control(struct imx_sc_ipc *ipc, u32 resource,
> > 
> > int imx_sc_pm_cpu_start(struct imx_sc_ipc *ipc, u32 resource,
> > 			bool enable, u64 phys_addr);
> >+
> >+int imx_sc_pm_get_resource_power_mode(struct imx_sc_ipc *ipc, u32 resource);
> > #else
> > static inline int imx_sc_misc_set_control(struct imx_sc_ipc *ipc,
> > 					  u32 resource, u8 ctrl, u32 val)
> >@@ -73,5 +75,11 @@ static inline int imx_sc_pm_cpu_start(struct imx_sc_ipc *ipc, u32 resource,
> > {
> > 	return -ENOTSUPP;
> > }
> >+
> >+static inline int imx_sc_pm_get_resource_power_mode(struct imx_sc_ipc *ipc,
> >+						    u32 resource)
> >+{
> >+	return -ENOTSUPP;
> >+}
> > #endif
> > #endif /* _SC_MISC_API_H */
> >-- 
> >2.39.5
> >

Best Regards,
Hiago.

