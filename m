Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89368C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 08:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zATNOB+RN3GRdRq8GAz0vH7sY1Yh90UPf+hvtUwtFk=; b=yME00/n8/i2RyLeHf2waNJy0JF
	W+vYB5TBYQx3gTZPWvsbsaDhcqh9N0k2fBSZG5DEMDtzKBgj8MG1vQ4Hh4KUzDG/9ej4G3ZDFVom6
	bcVEca1QMySFLxjYKIgz0cg5C8Yah2B+VWiyed3NFohL/g628Mz5WCt93/HW/vt09dOfYOV06LZJO
	DEY+lAFKASiAEG99jMyLlWYmEDIH83HOCOZh0bKmJR4OPeYgnZjHndH3XlktOLKvmLWdys62aiVD/
	IWra9cdSPBMPvhGiJFUgA2ibUV0anpbXNX7yMwdqmvAGEgaFQaZ7UVjkddZNcphMbImv7LUPSaT1P
	TkBCIuHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuS0K-000000056Jt-3XUy;
	Tue, 18 Mar 2025 08:08:52 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRuq-000000054yg-1tVu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 08:03:13 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-225d66a4839so64688035ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 01:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742284991; x=1742889791; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7zATNOB+RN3GRdRq8GAz0vH7sY1Yh90UPf+hvtUwtFk=;
        b=naKWgR3Wgrl+2Pu2RFsPhF7zAhopGlmupWZ6nEuU/tPNtDyFcwNGmq3QkiQrO3OHYp
         7p1kzY5k7rx6Oe6rbyMTon5oVLJF3ICuErbks4GxTkEyajAvoE+L6Zp07m6X/5s6CQXQ
         34/MstC+GQj8cdwpbBIaefuvgor0ZgaSyRyFtRm3vQyjIJGqhtGpsXa25Bq6BNXx0JaQ
         suOB840Y7ws+ISSmqICqE8aazzVBkfpKpVrQ950Hdhd/bTduEG16Cr19YO9XkfYdciQr
         1xib0E+JSBZuhz69hP5fjkuoIcaQ3NGSVF2o3btDNBCnOANMUqtUk3Eft7B+R4wqnTm6
         IcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742284991; x=1742889791;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7zATNOB+RN3GRdRq8GAz0vH7sY1Yh90UPf+hvtUwtFk=;
        b=fbCJYuX6C1qPGNU0quNvzoJnNnO7y38gR9Qn/9llSep6q61Y2+pIolxMpJ//TUViFY
         C0eJRJTb+vGPFFe2n9mbx+Tufu7U16xot9FFuu0FpqGNPTsJj5M5mkXIdC+9p7uXFYAf
         vU7zl5X8s9K0oFTwvzjQPB79hoQViPi5Cnrlyk9S3jOsqop4EotzxR2xveRW1/Uln/A0
         YSULbNIgokvj+kCGIoQNmV4xea5BGuldfsbVr9iK2qE0sV+QhWazmjcr2V2vYEwy7L6q
         nGdBKTLMI7qdo0qALK4hZIl4RwLn2LaqIsqGwZIgBj+1RkTePoQ0dzMFRtXo+Ec8KMGT
         tFUg==
X-Forwarded-Encrypted: i=1; AJvYcCVl802LVTZC33ErR0tJE3VZjv58R/Ymd2MhQDwjBesXcu85DRd1Jx/hSs0LeFZlbnB2TGa1sTFNLMH2XxXUnlot@lists.infradead.org
X-Gm-Message-State: AOJu0YzX+xfto+KqS94/NwOo+oOEk+NASZP2UE3m4TYlBeegYAVhAE9D
	YXuPVb8pTMxWt4WZy/Yng0mbgbDQdKFo9uxVjwuP0aWg6Ytkh8C46doSrtWX+Q==
X-Gm-Gg: ASbGncum83WNMLmDtX8G0znoRm+q57uF88OMOE8iCnH0xuk5qx0meWgL9kwkVw8zDHi
	ttM/p+IhL7tsEkXtyrw8/tOg4Rwdwk/kTnZpXD3OcMh4h+LqdDpBgVHrCy3aqHDs3u/zc9uvLLX
	rhjW0urDyRoeZgXFVdjSRFPnrx7FRJyrWxYuQfNViLQgep7W8ydCb62je9ZTrLDTEvgCL0/gbe4
	rriSLP4TsjxWSqapgNEJfchLXncI71C2qP+Leu+I0fpsPa6wW3ARsLx9MVNUttaqV+lIuFZRRmY
	k3cBROsBodlmZbXl8/rN1MNC/yX9OvX24zq1IOTJSCypzUXFMmNIr5+5
X-Google-Smtp-Source: AGHT+IFQI50pcGaomE3YOZGMmALp0D+8DIQDQoTe6NaI/OMfzJ9nJAe8ts6tZPm5ugXC7xjglM9V7A==
X-Received: by 2002:aa7:9902:0:b0:736:4c3d:2cba with SMTP id d2e1a72fcca58-73757932a76mr2891234b3a.9.1742284991535;
        Tue, 18 Mar 2025 01:03:11 -0700 (PDT)
Received: from thinkpad ([120.56.195.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116b1103sm8934019b3a.167.2025.03.18.01.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 01:03:10 -0700 (PDT)
Date: Tue, 18 Mar 2025 13:33:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, vigneshr@ti.com, kishon@kernel.org,
	cassel@kernel.org, wojciech.jasko-EXT@continental-corporation.com,
	thomas.richard@bootlin.com, bwawrzyn@cisco.com,
	linux-pci@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH 3/4] PCI: cadence-ep: Introduce cdns_pcie_ep_disable
 helper for cleanup
Message-ID: <20250318080304.jsmrxqil6pn74nzh@thinkpad>
References: <20250307103128.3287497-1-s-vadapalli@ti.com>
 <20250307103128.3287497-4-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250307103128.3287497-4-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_010312_498770_46271843 
X-CRM114-Status: GOOD (  15.59  )
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

On Fri, Mar 07, 2025 at 04:01:27PM +0530, Siddharth Vadapalli wrote:
> Introduce the helper function cdns_pcie_ep_disable() which will undo the
> configuration performed by cdns_pcie_ep_setup(). Also, export it for use
> by the existing callers of cdns_pcie_ep_setup(), thereby allowing them
> to cleanup on their exit path.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>  drivers/pci/controller/cadence/pcie-cadence-ep.c | 10 ++++++++++
>  drivers/pci/controller/cadence/pcie-cadence.h    |  5 +++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/pci/controller/cadence/pcie-cadence-ep.c b/drivers/pci/controller/cadence/pcie-cadence-ep.c
> index eeb2afdd223e..85bec57fa5d9 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence-ep.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence-ep.c
> @@ -646,6 +646,16 @@ static const struct pci_epc_ops cdns_pcie_epc_ops = {
>  	.get_features	= cdns_pcie_ep_get_features,
>  };
>  
> +void cdns_pcie_ep_disable(struct cdns_pcie_ep *ep)
> +{
> +	struct device *dev = ep->pcie.dev;
> +	struct pci_epc *epc = to_pci_epc(dev);
> +

pci_epc_deinit_notify()

- Mani

-- 
மணிவண்ணன் சதாசிவம்

