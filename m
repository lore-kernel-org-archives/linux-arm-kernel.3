Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC685FDEE29
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 17:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bsUocZL2Bn6GCAa3hABSmeuNfrbPhRDBHVb9kanPFaA=; b=z2YSA0D9WSwnIW7XQdDTo0OB52
	lr2SQMIOCSrVHt7Y/piZyiHZIUJIsZF+/UAuL0WikGxn8T2AfFiR+9FUClsb8K45rn0kFUDFDax/i
	7odsagmzDf6bHdPnZXzdNMsaizE6ax8Wlb0Gexs58J2xVJ+2UXiqtNjmRe2rN86z8cg0luj3+AiQU
	YV8iH12/mibp1u8Pj3lY9cpF9SlVM+ijuu8YJdN91NCxdpcCP1jtBMIIBB2rWQbIXe41NgOJTTfT3
	Q3zztqzL8sYyEMI9uGUeaqcfBgxfnFniXDwrpBAFfnKtt7Obbhpm71BfY1Po1kHw9GeQ+3REDY+22
	ojOdoUSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxgX-0000000C1mQ-1Z0w;
	Thu, 23 Apr 2026 17:17:53 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxgV-0000000C1m3-0onk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 17:17:52 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a9296b3926so40379765ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 10:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776964670; x=1777569470; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bsUocZL2Bn6GCAa3hABSmeuNfrbPhRDBHVb9kanPFaA=;
        b=GIKFHCQtyft1RIRHfA7XRD5rXz/m/LOCS91RR2toxZ7nG8+OaGznxYMykHH001atgC
         qusrJsilZi/4QCm/VLGizqkJPfEV0nQR5pBBn1sRHT5lYDLbwlEHzOmy5pQqrajvL5Bf
         8DiewgM+EJQ8R9DVQRMDVZjxKc6O9DxnBRlBzvxupLs3GwliJ0TzvNcb7gHigB9LhC7y
         dW6Jpjd0RxUWzTYsey9FF7zYlWjiBRN4uo8HQSgtvTpX8zpP3wsdKOpCcaXovfXXH+iZ
         AShnfb/KNZyfONK3LJnLnxGZv3ZuRZcQL0Fv3npcEZ50b1D8bqoqGXPpe/0xmymVHio3
         XpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776964670; x=1777569470;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bsUocZL2Bn6GCAa3hABSmeuNfrbPhRDBHVb9kanPFaA=;
        b=UtdtPo3X1eOIfAyzFXv/PFZQUrZLSDmNqD0Oz2Wbdm07U4O/tLi8JmiqjVe9WnqDnf
         f3/mYiHg8vz//7pVUGAVwIYZSEcAJh2RzY3QzeHOy1AmaCZrOfrVYeJ15BOg/ELJhz2C
         CyVeHjeYlZGIzwsOOYe6Oxyiy0i4HN+PejX2FMDnC/a3tNQpIejN6p4gqY7JSkAMUPGW
         dxCJdX6JhD3YPezLItzkIyIdj4F2J+IDtSUQcBkTnJHL0rysmK1YLhh704nksElM1YQ3
         9egChA3Gw7FHcl+EJ+gwJ5Ugb8rZddZDE2COYGXmJM3b4e1Wfn6m+IHRzor6Yt5QUbH0
         ftGA==
X-Forwarded-Encrypted: i=1; AFNElJ/kFHNBYNH8SBdKSwLORmhVmPQWn1QlknZ8HIdfbqQ9kpYl5vvvlszV+rWlzRe61sYbypdUkfl+jvyn2os/HiM8@lists.infradead.org
X-Gm-Message-State: AOJu0YwtBq1WMnJ972F+7mwYN0oVPJvqA2kwmVXAa11KNXNMF4MAh6aS
	igtzfI62dxEVkOBnG/KyMGTrruT/dt4ckOT/N7FbhEj1rUFbZ1uvcrFw+j+VI73u1L8=
X-Gm-Gg: AeBDiesazexee33u6Ri4TbB648OqBNB4buPrh7H66eCdKpHnNHLmH0CbeyBCCq/dykn
	IrYQODGrLJ+3/Fac++Qa8MwCPDDfwK8a6Mcwsddul2EDQlUZGES5TiZcFLBYyqDSKY8Mi8ooIvN
	eTr9bu4F7YKd6K9P0YPcWXhgYf3xO+XHHH6vzVpo4uZRAljG0YlK94YLrae0HvjH59lp03MT16M
	SKNkEiiXUZiJvdbjNwfqbB8E6gVZzQ4CZx0EjYobm0AKbjgdu0hIoU1tAYpqun82oAqGsayBPQB
	7kJCMDtVzAOzZpVwOECJEvgsq57tfnHGXWXanTtBhPCwyf8JMQlCjlGoslAcfree4l2Yw/dOVCH
	IfQScQVL0EMGzbs2NNSeQiFkBodDFdSeQNGI/l+Uvciww8DIPTtyOPJczxKOSNLX6PZFIhleqAI
	pi/nIGtUoZW28Lgq/ytfqrvEfa7AAsE7Klc9EHOQ==
X-Received: by 2002:a17:902:f78d:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2b5f9d888e8mr278593665ad.0.1776964669767;
        Thu, 23 Apr 2026 10:17:49 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:54c0:dbdd:6b84:4488])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab20c4fsm250035145ad.59.2026.04.23.10.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 10:17:49 -0700 (PDT)
Date: Thu, 23 Apr 2026 11:17:46 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 0/3] Add i.MX94 remoteproc support and reset vector
 handling improvements
Message-ID: <aepUOjXBOWK-0wt9@p14s>
References: <20260415-imx943-rproc-v3-0-9fa7528db8ca@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260415-imx943-rproc-v3-0-9fa7528db8ca@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_101751_247063_53227863 
X-CRM114-Status: GOOD (  24.27  )
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

On Wed, Apr 15, 2026 at 03:50:37PM +0800, Peng Fan (OSS) wrote:
> This series adds remoteproc support for the i.MX94 family, including the
> CM70, CM71, and CM33S cores, and derive the hardware reset vector for
> Cortex‑M processors whose ELF entry point does not directly correspond to
> the actual reset address.
> 
> Background:
> Cortex‑M processors fetch their initial SP and PC from a fixed reset vector
> table. While ELF images embed the entry point (e_entry), this value is
> not always aligned to the hardware reset address. On platforms such as
> i.MX94 CM33S, masking is required to compute the correct reset vector
> address before programming the SoC reset registers.
> 
> Similarly, on i.MX95, the existing implementation always programs a reset
> vector of 0x0, which only works when executing entirely from TCM. When
> firmware is loaded into DDR, the driver must pass the correct reset vector
> to the SM CPU/LMM interfaces.
> 
> Summary of patches:
> [1]dt-bindings: remoteproc: imx-rproc: Introduce fsl,reset-vector-mask
> Adds a new DT property allowing SoCs to specify a mask for deriving the
> hardware reset vector from the ELF entry point.
> 
> [2]remoteproc: imx_rproc: Program non-zero SM CPU/LMM reset vector
> Ensures the correct reset vector is passed to SM APIs by introducing a
> helper (imx_rproc_sm_get_reset_vector()) that applies the reset‑vector
> mask.
> 
> [3]remoteproc: imx_rproc: Add support for i.MX94 remoteproc
> Adds address translation tables and configuration data for CM70, CM71,
> and CM33S, enabling full remoteproc operation on i.MX94.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v3:
> - Patch 2: 
>   Drop R-b because of changes in V3
> 
>   Following suggestion from Mathieu that apply reset vector in
>   scmi_imx_[cpu,lmm]_reset_vector_set(), not change the meaning of
>   rproc->bootaddr, add helper imx_rproc_sm_get_reset_vector() to get reset
>   vector and use the hlper in scmi_imx_[cpu,lmm]_reset_vector_set().
> 
>   Add reset-vector-mask for i.MX95 CM7 to avoid breaking i.MX95 CM7
>   boot.
> 
> - Link to v2: https://lore.kernel.org/r/20260327-imx943-rproc-v2-0-a547a3588730@nxp.com
> 
> Changes in v2:
> - Drop fsl,reset-vector-mask by using fixed value in driver for per device
> - Add R-b for i.MX94 dt-binding
> - Update commit log to include dev addr and sys addr
> - Link to v1: https://lore.kernel.org/r/20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com
> 
> ---
> Peng Fan (3):
>       dt-bindings: remoteproc: imx-rproc: Support i.MX94
>       remoteproc: imx_rproc: Program non-zero SM CPU/LMM reset vector
>       remoteproc: imx_rproc: Add support for i.MX94
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         |  3 +
>  drivers/remoteproc/imx_rproc.c                     | 98 +++++++++++++++++++++-
>  drivers/remoteproc/imx_rproc.h                     |  2 +
>  3 files changed, 101 insertions(+), 2 deletions(-)

Much better - I'll pick this up when 7.1-rc1 comes out.

Thanks,
Mathieu

> ---
> base-commit: 724699d8d0523909da51fda8d1e10c1ff867b280
> change-id: 20260311-imx943-rproc-2050e00b65f7
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 

