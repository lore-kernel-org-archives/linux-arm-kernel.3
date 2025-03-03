Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AC1C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 21:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9HBpbXIy/k/ZzJzT43ntRHVnDGFv2MuASArIvtm8UM=; b=CYP6R+lYgbbF3sw1n/DGlpp6b8
	VF/cyzhsWjleNeoPmbAMMDBRcsvFv5y4kXnFBEZoKQejT6sSHOcpyZ+Xg8M8gRpe4u1/Pq5HMPFvx
	98+zZ7z98zSQ6YJlBqgBncs1zPjQesaot8q2/Z6wGnvdq2TABwrpXI2R/ry3wRF6r/DR7Swgo1+fr
	a6KxfoGDwmB/zb5jd1fWv8iKI/8+BJtB4V0AOGrPYTbqutSQOM0USVcROBrOdwyuiUeNtpFEJ5Dhr
	Ce+59rJDtijBbO0NeJ4EPU/DkzMKHh3Z4V4BUChv+9Lq0mevs/QnnIOm+g7F0n94a4D2z9uNS4wlX
	bmtD3ZmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpD2K-00000002Kd8-2tQD;
	Mon, 03 Mar 2025 21:09:16 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCwY-00000002JrI-10ci
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 21:03:19 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2238e884f72so36339375ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 13:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741035797; x=1741640597; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B9HBpbXIy/k/ZzJzT43ntRHVnDGFv2MuASArIvtm8UM=;
        b=UOEJQIa7NkAFr5z/QBwXeHgLOb3S3CvFDFrVfBw93sqgQq/JL9JPLJ9wtRDamIg9VZ
         3auarUBtiNqLKgT1dpwE9iB0PINfc4bRo5V6yDCXOnzkHUF5lfD82N8SsOF8cWtliSDn
         o4MKFOOgzpKQzbKbStEaLMptfNCpjD9ToGVnRU+4e/CnOlLbKRJnLOQKoCsFnXPuA6PQ
         l43Y2y0dpuTxSuF+nxL1RmXpGGkqJVWLt5mP6FwW/Z/Drmvo1tM1DU8fm0PCmNz0vY9q
         /8z58ouRJV3hqav7pWsmbSpwKRrb6NkHkDXG0Qx0V20b+b1HFBQIY+KYj5RZsFfoQisO
         7uIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741035797; x=1741640597;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B9HBpbXIy/k/ZzJzT43ntRHVnDGFv2MuASArIvtm8UM=;
        b=QT0OyKevBOtA7eCkVwriirFta24JuWEDcGMbg4/nflz3eAH/ZcPz6tKeIY6BbXAeWd
         s1DNr7n966fT+NMQ2EqAg1c/RR7fEaYjm9BdFvDod5HDDRb/0Gi4eU+x/yCP8Zpxu9i+
         GNPt1yklHqu4jbK/Hg3u2u3xTmNddh0GkS3j0ZgCFps33h6Yl6gZWECWn4DMrNye8aRG
         jud9Ubcix9g+qxywZ1gs2pruVKjeNmWwtn86AIq9oQrDFHYXFUCfEMvCsGUj8ykUenb/
         xlMz9tmhtg1MFUq8pofaVpUi1fRbmUYOPlvUvlyy+1DfmzrPzfnrHK2iYpEFAtdSplAg
         lBww==
X-Forwarded-Encrypted: i=1; AJvYcCVp42AnFt5FLzdBkkoHkXP2+BMCGdq7otNkTN7txpIlhK8PmJUnSBW0n7TQoJxFv2PLUuatZTbkkIqjmb2kFM/o@lists.infradead.org
X-Gm-Message-State: AOJu0Yx11YQefx601xJjCP11nnLy7ZKSpY64xE/7KwbTHEo28TTpfIxf
	Z130xw7BOc3XhpTk7ltcieHkz/Q/huzCemQa+/K2XICj8KoEMGfu
X-Gm-Gg: ASbGncsZ7Fb4uGMjEHAfzwtFz7ewWA1mUXKJOp3aw7qhIO71c3sfFjl7egVMzhJziBn
	ovvZLSzPS8Zt3F0XDStnObqsqrBjjpsqgVYVa+wiKyycwOJbMRm9Pqnagp9hgGg/NA9r5CA7l3O
	AF3aHUdjLsFo1rWn6mB4k18YkprVptBzxGgMiS/PC+hWV+0/InldGfEPODdrQQRccN+BreO2AMX
	BLsPuYBS67M9heGHS0QosyvKFT3EfKoSaZekgfVuCpAXEun+wlU395EIlgtsrFP34DFOdGPG+Wu
	OTLCCwOd6gvzhO/GOKja4AruJtvgHFxQ5HyoDORF
X-Google-Smtp-Source: AGHT+IHInytWSAP68J0pF/25lZDGpVvx/ij28c4zW0D1/qGfM3LkSyEL79EClseudwK/bIrxfeuiDg==
X-Received: by 2002:a05:6a00:3cd1:b0:736:34a2:8a20 with SMTP id d2e1a72fcca58-73634a28b18mr15869743b3a.21.1741035797227;
        Mon, 03 Mar 2025 13:03:17 -0800 (PST)
Received: from debian ([2607:fb90:37e1:4bed:f057:b35a:e3e2:4c5f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73630744c23sm5969768b3a.15.2025.03.03.13.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 13:03:16 -0800 (PST)
From: Fan Ni <nifan.cxl@gmail.com>
X-Google-Original-From: Fan Ni <fan.ni@samsung.com>
Date: Mon, 3 Mar 2025 13:03:12 -0800
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Fan Ni <nifan.cxl@gmail.com>, Shradha Todi <shradha.t@samsung.com>,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, manivannan.sadhasivam@linaro.org,
	lpieralisi@kernel.org, robh@kernel.org, bhelgaas@google.com,
	jingoohan1@gmail.com, Jonathan.Cameron@huawei.com,
	a.manzanares@samsung.com, pankaj.dubey@samsung.com,
	cassel@kernel.org, 18255117159@163.com, xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com, will@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v7 5/5] Add debugfs based statistical counter support in
 DWC
Message-ID: <Z8YZEALV71PUkXpF@debian>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132043epcas5p27fde98558b13b3311cdc467e8f246380@epcas5p2.samsung.com>
 <20250221131548.59616-6-shradha.t@samsung.com>
 <Z8XuuNb6TRevUlHH@debian>
 <20250303194228.GB1552306@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250303194228.GB1552306@rocinante>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_130318_279999_9CFBA74C 
X-CRM114-Status: GOOD (  14.26  )
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

On Tue, Mar 04, 2025 at 04:42:28AM +0900, Krzysztof Wilczyński wrote:
> Hello,
> 
> [...]
> > > +static ssize_t counter_value_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> > > +{
> > > +	struct dwc_pcie_rasdes_priv *pdata = file->private_data;
> > > +	struct dw_pcie *pci = pdata->pci;
> > > +	struct dwc_pcie_rasdes_info *rinfo = pci->debugfs->rasdes_info;
> > > +	char debugfs_buf[DWC_DEBUGFS_BUF_MAX];
> > > +	ssize_t pos;
> > > +	u32 val;
> > > +
> > > +	mutex_lock(&rinfo->reg_event_lock);
> > > +	set_event_number(pdata, pci, rinfo);
> > > +	val = dw_pcie_readl_dbi(pci, rinfo->ras_cap_offset + RAS_DES_EVENT_COUNTER_DATA_REG);
> > > +	mutex_unlock(&rinfo->reg_event_lock);
> > > +	pos = scnprintf(debugfs_buf, DWC_DEBUGFS_BUF_MAX, "Counter value: %d\n", val);
> > > +
> > > +	return simple_read_from_buffer(buf, count, ppos, debugfs_buf, pos);
> > > +}
> > 
> > Do we need to check whether the counter is enabled or not for the event
> > before retrieving the counter value?
> 
> I believe, we have a patch that aims to address, have a look at:
> 
>   https://lore.kernel.org/linux-pci/20250225171239.19574-1-manivannan.sadhasivam@linaro.org

Maybe I missed something, that seems to fix counter_enable_read(), but
here is to retrieve counter value. 
How dw_pcie_readl_dbi() can return something like "Counter Disabled"? 

Fan
> 
> Thank you!
> 
> 	Krzysztof

