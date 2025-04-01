Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E047C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 16:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuO3JoiBaWEWl3zVvnUtjCtMgfiv8CYDUp0HTVXRARo=; b=VruHozc5c8jMlvleSaJxbLSXs7
	1ICa2kLW3nzyhIIdxpzakgnUSgLM9AzG/8MR9PovxZbLvStDP6Qv6YTb4Z2oPPcdmbDXLKxSfzSns
	MlXx4zOMJk2z8z53mkOaY4MFjtoBn+yCFOcL8CJ1IH8asAfHPJAI4n9RgHobPMD6YZQR22ejd3eBj
	KmNO0oixwSKIHciW1mQ5POvGo66Wyl+xJBc1qOu88I0yOiTuInui3y2tFzx4sAJRzoJ5SAa/4hQpm
	Pzys2sLUIpu0HU/f7NDmwpwxmEnOT6BUSUGn6F+p0LSZ+sLZMCSlC+S1i06V9S5cvL4+TpreAC07e
	hSp/o1cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tze9Z-00000003oji-1jEw;
	Tue, 01 Apr 2025 16:07:53 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tze7l-00000003oXm-3d3S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 16:06:03 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22580c9ee0aso117234155ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 09:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743523560; x=1744128360; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AuO3JoiBaWEWl3zVvnUtjCtMgfiv8CYDUp0HTVXRARo=;
        b=oroMFEyB2eR2NX/fAp+J8966B3A1LubpxLGqgQZ0S06gO1Qh/7CyTs7cP66MrrYGza
         pCP5VJdewAN90a6ME8UlrEqYIVp3tN0RGgCRihjdsGtZ3ju3AH+3RsNs35aeYv5GRnCh
         V5+L0fRgWTqmMFrcCuF2yc7K7MCKguuednAeOyDShvFhmHGFClGLFegeAHDcuEbVTTnC
         ac/7Um5+0DQ5c8KWs5DUerrnMtc4Xmui1Pjcu4BVrGYe3oIE1NkYHULoSgmZdhgUopr/
         kHrjdWk332AtouiWBFAQSvHLV33FzZuYBQ49mXGd0tCvkS4cBdAXujBv+RksNGZQSmVo
         md8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523560; x=1744128360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuO3JoiBaWEWl3zVvnUtjCtMgfiv8CYDUp0HTVXRARo=;
        b=om7VAFhxFlCFNPAc1ymNOxXX2qok0MakrT1/3S9QOEfxwXkiRj7rBMBUAX2EAsVNMu
         L+YDHhbGN+SGmyCgoxVak4RC93MOsUFyr1tdle9IVuxJpXvBvVmKU2df6aaDIc8Le94I
         L4w0vIM2sDKz128N5Gg587X9MrpwSt2THKAxraFIG2M8FLrh9UOutDVcFi2fwUMTi6Ou
         Fl8YnBoAIPbUe5Ba7MymfrdAYMkIJgbChj7738mWMsXdaBBp4PWP9h0gt5bJ6/VpmT1q
         t498DAIUN5DUHA4mUAiOUx9JVsII0zI0P10cAtQLo0crlUXmH0FNJYpeiURy2lNBklVq
         ud7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWaOXO9OjP8An/yF7eT0VRptlF5Lmr9greNzyOHmXqOjal/DgW8EXn7NO/DwV9TEkxdbaS64R9EjYslR2AvfMoY@lists.infradead.org
X-Gm-Message-State: AOJu0YxLIAWZFOTje8aTcFCrxf4bAi+TlqTYWP697NYYW1O7Siqfi3Y8
	+EcJS0PBANKigGj8n8v2A/ej6ohPBELLdj7j6hq2cqDswf+ARYxDKd+ZYNqmC38=
X-Gm-Gg: ASbGncshPe8c9GXlmMiA120XjakVSvWzIg5Ydy/QkxnPjzethJGS6zC61x5tDxQ1PfK
	VG5U82xO/dMRgy2l7F8Y8Cl7CwkRufIhOV1NF1v2ZyUmPqg6C0JkABcC/WO+xeU+CTtIbZvkslT
	T1tGAJ/tHC5LHnBsLcaghCvwgIOBLNC/dlD+eLM+V1IlxoMjTkjNhgCOrx6lSG48DG9iKqBR1Is
	0LPhGiodHs2Szp3aae+khQIZwf/UDKNmSfDoUbjxbOPoSkf8cSwEXIiiy4cJQwbDVfdDZpsNDI2
	0QxEJjqNg+nV+R+oApzMdmo/X6uX6XkA8STNy3LCHlxDHwhs
X-Google-Smtp-Source: AGHT+IHS665q9tq8I4Rn8gAFViO1Vbyxy5C1fhneAWy0pBzjbtNJpFCpmq60Cuhz94aODSClJDgSTA==
X-Received: by 2002:a05:6a20:2d0c:b0:1f5:a577:dd24 with SMTP id adf61e73a8af0-2009f645311mr20981139637.25.1743523560465;
        Tue, 01 Apr 2025 09:06:00 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:62bf:3c83:f3df:dc76])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af95d59a786sm5788320a12.53.2025.04.01.09.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:05:59 -0700 (PDT)
Date: Tue, 1 Apr 2025 10:05:56 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH V2] remoteproc: imx_rproc: Add mutex protection for
 workqueue
Message-ID: <Z-wO5PLU01Nd3QDU@p14s>
References: <20250401140402.3676049-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401140402.3676049-1-peng.fan@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_090601_907631_92C41C76 
X-CRM114-Status: GOOD (  20.19  )
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

On Tue, Apr 01, 2025 at 10:04:02PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Same as commit 47e6ab07018e ("remoteproc: imx_dsp_rproc: Add mutex
> protection for workqueue") and commit 35bdafda40cc ("remoteproc:
> stm32_rproc: Add mutex protection for workqueue"), imx_rproc driver
> also has similar issue, although no issue reported until now.
> 
> The workqueue may execute late even after remoteproc is stopped or
> stopping, some resources (rpmsg device and endpoint) have been
> released in rproc_stop_subdevices(), then rproc_vq_interrupt()
> accessing these resources will cause kennel dump.
> 
> Call trace:
>  virtqueue_add_split
>  virtqueue_add_inbuf
>  rpmsg_recv_done
>  vring_interrupt
>  rproc_vq_interrupt
>  imx_rproc_vq_work
>  process_one_work
>  worker_thread
>  kthread
>  ret_from_fork
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V2:
>  Add RPROC_ATTACHED check, because i.MX supports remote cores started by
>  bootloader.
>  Update commit and add R-b from Frank
> 
>  drivers/remoteproc/imx_rproc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

NACK - for the reasons I have explained in "[PATCH V2] remoteproc: core: Clear table_sz when rproc_shutdown"


> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 74299af1d7f1..4819a9e57543 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -5,6 +5,7 @@
>  
>  #include <dt-bindings/firmware/imx/rsrc.h>
>  #include <linux/arm-smccc.h>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/firmware/imx/sci.h>
> @@ -785,6 +786,11 @@ static void imx_rproc_vq_work(struct work_struct *work)
>  					      rproc_work);
>  	struct rproc *rproc = priv->rproc;
>  
> +	guard(mutex)(&rproc->lock);
> +
> +	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED)
> +		return;
> +
>  	idr_for_each(&rproc->notifyids, imx_rproc_notified_idr_cb, rproc);
>  }
>  
> -- 
> 2.37.1
> 

