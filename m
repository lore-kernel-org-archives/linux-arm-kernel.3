Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7E5C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 19:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jr7DtT+cBeW7vunNHQDeXWMsjvqkgvHyclExXYfY/bw=; b=sG8QQCyTQE874eWUUFHWpkX/JB
	tvQfflX7uWNrhCcYMa43rJ0TYeW7Qf3ozULpyvMzgvVr5+1D6MVBWLYH25l5MWkBoMWxy69W03MEK
	q2fMYJDif++E1w2Xy+/2dMk1oTNlUM08kXzYH/q/VfbtCYVAlfJNLAblCRz+oXdhvaeSWWT0XKsJM
	oRaUoaaZsNMG/AxVQ/aDzu1MJFE2nvElUJ4eqK3GLJZhbtCcHmw/UlHw3qFZI/l5I7Maha9Rxr8vI
	uZfFCxDHYfYJrGsLwZSTfRN14eNoS0CcG++zEGqVPuuS0Hxx+fV5lzBk36uZA1nAORkz3Qmrmf0rm
	SQ79Nk5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpBhw-000000025tH-1CUc;
	Mon, 03 Mar 2025 19:44:08 +0000
Received: from mail-pj1-f54.google.com ([209.85.216.54])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpBgN-000000025iG-0Uj9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 19:42:32 +0000
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2febaaf175fso5687115a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 11:42:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741030950; x=1741635750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jr7DtT+cBeW7vunNHQDeXWMsjvqkgvHyclExXYfY/bw=;
        b=txb+g6zixcTG88HaH6cFEMEgvfd+n4yPm9RwgJL8Y/Tponc73IDxaXRtst2dJSKiK/
         rh9ypITeGASwGJgbHKwUKURCWAt73vuWAqlrB6lS2CMvcvbyY2T3iQGHBvKIsyyneZ8z
         iwbDAdCofUNqbcSbvW6oU9Tn76+Ln5+94jQekvB3boNWBIWm+wR8x5ofGXluRIksqdC/
         nYLb7vejaG3w5HzSMPVxkh1eWVml6flLTAwMoiFc9L7FeDss+IY+Nc682/RU2P5QS0Xm
         TZTgpbvgEIJuFQ2bK7MJmJUGPoTBycMb15ipL0dnsfGKdcpp7DhlkoC0MY+JSZTiPyCT
         EoUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV99ViyWml4IOrExLcoTcZLtIJGKhs6ffMrcFnIWHSmMumCZiRTwmwrT8v5kiroTxSWwAIiBxNuomQmLlQnawEA@lists.infradead.org
X-Gm-Message-State: AOJu0YzewH2fzOp2nOPfBns+rt5H4O37U3uSRUlLqkxlk0ttVUtiYcPD
	YdnA8dKz5IsV01Th+k3F1/nmkFkjH3g2xH3Jp1r8mAzxmvzVb6qN
X-Gm-Gg: ASbGncuxf7R0oPLYS7vy7qrk4Nn1EJzueZtc1YcQ4FdNBTMnUJ1lroACocyfOjDBpGp
	3nKsDXoGNl4gI6/Z/4nsqFdzPKqnPO5TVdx3qrp5TWEERyVSK1PPJtddPOTx+6i/eLe1XmZHbHO
	ohWkt/0iMfjMxfgCUPsKyyiaqoIMeZAV8J61PjR2HB4Ez5jTpQEu7pilnGvESeWSDTJwp9N+GxM
	ufPqhGo8s/acqG0wJxsnJPUeZg/B+godPpdxn7q9RZGXxAE6WduO8S1jy2Wpjs0Yj9dZpAP+X9P
	jYbugUE6un/CqaWdCwxXywVWyQkQrnAKFeuu2WlnsFIYtZSvzelECTvSg250UH8pQ/gxQweqKSs
	AMu8=
X-Google-Smtp-Source: AGHT+IHYCQVs+/iE6vvKrmK1B/IMxzVg0/4kX5VfDcWNz3937RP9zksebTa9YiaF4RmT8h+1QZFM1w==
X-Received: by 2002:a17:90b:1b47:b0:2fa:e9b:33b3 with SMTP id 98e67ed59e1d1-2febab2bdecmr20911899a91.6.1741030950198;
        Mon, 03 Mar 2025 11:42:30 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2fea67a7ddesm9360259a91.27.2025.03.03.11.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 11:42:29 -0800 (PST)
Date: Tue, 4 Mar 2025 04:42:28 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Fan Ni <nifan.cxl@gmail.com>
Cc: Shradha Todi <shradha.t@samsung.com>, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, manivannan.sadhasivam@linaro.org,
	lpieralisi@kernel.org, robh@kernel.org, bhelgaas@google.com,
	jingoohan1@gmail.com, Jonathan.Cameron@huawei.com,
	a.manzanares@samsung.com, pankaj.dubey@samsung.com,
	cassel@kernel.org, 18255117159@163.com, xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com, will@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v7 5/5] Add debugfs based statistical counter support in
 DWC
Message-ID: <20250303194228.GB1552306@rocinante>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132043epcas5p27fde98558b13b3311cdc467e8f246380@epcas5p2.samsung.com>
 <20250221131548.59616-6-shradha.t@samsung.com>
 <Z8XuuNb6TRevUlHH@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8XuuNb6TRevUlHH@debian>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_114231_154867_28D57107 
X-CRM114-Status: GOOD (  12.81  )
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

Hello,

[...]
> > +static ssize_t counter_value_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> > +{
> > +	struct dwc_pcie_rasdes_priv *pdata = file->private_data;
> > +	struct dw_pcie *pci = pdata->pci;
> > +	struct dwc_pcie_rasdes_info *rinfo = pci->debugfs->rasdes_info;
> > +	char debugfs_buf[DWC_DEBUGFS_BUF_MAX];
> > +	ssize_t pos;
> > +	u32 val;
> > +
> > +	mutex_lock(&rinfo->reg_event_lock);
> > +	set_event_number(pdata, pci, rinfo);
> > +	val = dw_pcie_readl_dbi(pci, rinfo->ras_cap_offset + RAS_DES_EVENT_COUNTER_DATA_REG);
> > +	mutex_unlock(&rinfo->reg_event_lock);
> > +	pos = scnprintf(debugfs_buf, DWC_DEBUGFS_BUF_MAX, "Counter value: %d\n", val);
> > +
> > +	return simple_read_from_buffer(buf, count, ppos, debugfs_buf, pos);
> > +}
> 
> Do we need to check whether the counter is enabled or not for the event
> before retrieving the counter value?

I believe, we have a patch that aims to address, have a look at:

  https://lore.kernel.org/linux-pci/20250225171239.19574-1-manivannan.sadhasivam@linaro.org

Thank you!

	Krzysztof

