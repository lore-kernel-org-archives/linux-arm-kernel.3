Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8E1C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 05:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDbPu0GoIrMl1ekfCD/PMILNRbV5SLzILd3Nw6UHcyw=; b=NKy21wN13k3PT4BO0u3POeMad6
	J2KPMFC+JCTtEJ0ELs3C/RGsU/kCzed2ciel9xuBV/OnEtgVB5sD2wDkjSnFWNFtgc8eVbuFS4bUo
	dogog2PePfPDkvmSABLByRuVqsITQFr8z7HpLQgOgnhIqDdVDEjTZOmUTLE+q+kibe0colwXKESA7
	xl3/zN4tzxyxjAfmFOninKSlM5AJrOgbyqU+Aqwv/baCT+XbPHda2sZhecJu7vvOw71WUN817YYV6
	FGMIJkwZVp1OOe4vbKqvRvUFDvivrJCLlDFUhCoeB+yxQnXLBfaWCou+Hxd62FQtrxphoHSVTq+CI
	RYcmqMjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tphKJ-0000000722c-2P3V;
	Wed, 05 Mar 2025 05:29:51 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpgKh-00000006xNs-353I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 04:26:13 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2234e5347e2so129595695ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 20:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741148770; x=1741753570; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lDbPu0GoIrMl1ekfCD/PMILNRbV5SLzILd3Nw6UHcyw=;
        b=fVqSKExvklpnyr2IdKQMuPiMH5B9r0cPXct26rcQXmAdD6ZE7E1+aSbAGzc+TRNPQW
         80x/2vntbaZU9vPFp27lLoqCMaXT2HuI8qy+araLA8mZgQUypsiLr9OjBBxPccqlK/e5
         8T5etHNkr8UF/Zq+hxDuu7GEOjMRUFHZnxVsMAjXGbtjVmhLBBl7OR7G8FrmzYjcMK7A
         wbdz2q0OeF9cJsLMaMik9GYXlvefvjCA5OFpf3XxtXybakn3TGRGw95McqsdOQQ5Z4vj
         If/4eBHP9REb4ULz82ku2RfpOXFK9JHkTecSNGwHEBwST6ILmmwIJg8Zl0094vdDslbv
         qZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741148770; x=1741753570;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lDbPu0GoIrMl1ekfCD/PMILNRbV5SLzILd3Nw6UHcyw=;
        b=Z+OjCc2KjJ1WuWa1SPq7SELr5OFpnoF0Jb/YFTl/mmAb7/FF4sBGSJBNHfQ30gCYg+
         TKkQc2asjOvWR+6dgMqBrreIwvpSnPbUBVQ+7EP3kKsoKwgCkUts8A4fOK99jot3cRMT
         AXZoZQ+CiMF7ThDMmho5KdxPgg8PTxjCYWkc4yJ/TIOje6kQWJRT9j/F/7iEtIzQXI/B
         B/UqXFeLbZjW0FAmQB9DBZeQZ0ooQhU14TlgTqMFtdBB0UY9qLx8I8qZg6z/d4HZSf+Y
         FdW3yapUPFZMu6Eh3c+AowTPrecnYZfBtRRodHNXmFv2EoMx4YFjpNOkX/vBP0fQVDwD
         IVNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZIROyd964AcogTXdKuilA9iCU3Tlj0X2EfF0zt1hhMBGFVXXWK5nWk7lr4ehyOU4kWjbr3ewlrNwz/IkGbF2Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/ljHQMK9q4bCatt/wCGm7hPO/dmsZrYAtR7aIU6FSOI4g8fdW
	zoxV91Sb92nQtUHMhWaD1waOk6XeFBRyF2VgE2n7EhzTV76WfqGQ
X-Gm-Gg: ASbGnctBsAaThssK8s41XD/0gtlDqnvw04pVSRnLN5c7monkOzjLvKTy35/mOMDT67t
	IEzwjHjRcWTkOIqcVL09u4N5n+AU35aKjiws7KKQpzZEF6W7bTGHibW1cvdSu5VEztLA5WN/3Sa
	0EFKkZwFji23+HqN48V+JDyvOT2Sh7D8pbHrX26OScMQJC3al3qIgoWLOwQSaV3UhQTi5kw3XkT
	NnTr3T91FLALGeA1Cv1j7VhQi79A3wC2QtDUk8Tig1bkDAoyN8xghX4u2VjUBWy/Ljib32gM4Mj
	iwqudhBfYMN4Tampnyv7/zIQi8c3NhCNeQ6d4w==
X-Google-Smtp-Source: AGHT+IE5O1ZVuOwmp//oQrwhNgSp7QZxuUhf3G7FCkClB32cJAQnuuVkN/3c86LEBjvOfGY+rzBunA==
X-Received: by 2002:a05:6a00:23c4:b0:736:3f4d:4d49 with SMTP id d2e1a72fcca58-73682b8b965mr2481120b3a.8.1741148770219;
        Tue, 04 Mar 2025 20:26:10 -0800 (PST)
Received: from debian ([2601:646:8f03:9fee:cf74:c30d:9ff:fbc6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736560f5e6esm5099715b3a.104.2025.03.04.20.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 20:26:09 -0800 (PST)
From: Fan Ni <nifan.cxl@gmail.com>
X-Google-Original-From: Fan Ni <fan.ni@samsung.com>
Date: Tue, 4 Mar 2025 20:26:01 -0800
To: Shradha Todi <shradha.t@samsung.com>
Cc: 'Fan Ni' <nifan.cxl@gmail.com>,
	'Krzysztof =?utf-8?Q?Wilczy=C5=84ski'?= <kw@linux.com>,
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
Message-ID: <Z8fSWcR_aXyxmFEZ@debian>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132043epcas5p27fde98558b13b3311cdc467e8f246380@epcas5p2.samsung.com>
 <20250221131548.59616-6-shradha.t@samsung.com>
 <Z8XuuNb6TRevUlHH@debian>
 <20250303194228.GB1552306@rocinante>
 <Z8YZEALV71PUkXpF@debian>
 <061401db8d28$5f0a4b40$1d1ee1c0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <061401db8d28$5f0a4b40$1d1ee1c0$@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_202611_891223_52C0C5EC 
X-CRM114-Status: GOOD (  23.78  )
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

On Tue, Mar 04, 2025 at 10:40:43PM +0530, Shradha Todi wrote:
> 
> 
> > -----Original Message-----
> > From: Fan Ni <nifan.cxl@gmail.com>
> > Sent: 04 March 2025 02:33
> > To: Krzysztof Wilczyński <kw@linux.com>
> > Cc: Fan Ni <nifan.cxl@gmail.com>; Shradha Todi <shradha.t@samsung.com>; linux-kernel@vger.kernel.org; linux-
> > pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-perf-users@vger.kernel.org; manivannan.sadhasivam@linaro.org;
> > lpieralisi@kernel.org; robh@kernel.org; bhelgaas@google.com; jingoohan1@gmail.com; Jonathan.Cameron@huawei.com;
> > a.manzanares@samsung.com; pankaj.dubey@samsung.com; cassel@kernel.org; 18255117159@163.com;
> > xueshuai@linux.alibaba.com; renyu.zj@linux.alibaba.com; will@kernel.org; mark.rutland@arm.com
> > Subject: Re: [PATCH v7 5/5] Add debugfs based statistical counter support in DWC
> > 
> > On Tue, Mar 04, 2025 at 04:42:28AM +0900, Krzysztof Wilczyński wrote:
> > > Hello,
> > >
> > > [...]
> > > > > +static ssize_t counter_value_read(struct file *file, char __user
> > > > > +*buf, size_t count, loff_t *ppos) {
> > > > > +	struct dwc_pcie_rasdes_priv *pdata = file->private_data;
> > > > > +	struct dw_pcie *pci = pdata->pci;
> > > > > +	struct dwc_pcie_rasdes_info *rinfo = pci->debugfs->rasdes_info;
> > > > > +	char debugfs_buf[DWC_DEBUGFS_BUF_MAX];
> > > > > +	ssize_t pos;
> > > > > +	u32 val;
> > > > > +
> > > > > +	mutex_lock(&rinfo->reg_event_lock);
> > > > > +	set_event_number(pdata, pci, rinfo);
> > > > > +	val = dw_pcie_readl_dbi(pci, rinfo->ras_cap_offset + RAS_DES_EVENT_COUNTER_DATA_REG);
> > > > > +	mutex_unlock(&rinfo->reg_event_lock);
> > > > > +	pos = scnprintf(debugfs_buf, DWC_DEBUGFS_BUF_MAX, "Counter
> > > > > +value: %d\n", val);
> > > > > +
> > > > > +	return simple_read_from_buffer(buf, count, ppos, debugfs_buf,
> > > > > +pos); }
> > > >
> > > > Do we need to check whether the counter is enabled or not for the
> > > > event before retrieving the counter value?
> > >
> > > I believe, we have a patch that aims to address, have a look at:
> > >
> > >
> > > https://lore.kernel.org/linux-pci/20250225171239.19574-1-manivannan.sa
> > > dhasivam@linaro.org
> > 
> > Maybe I missed something, that seems to fix counter_enable_read(), but here is to retrieve counter value.
> > How dw_pcie_readl_dbi() can return something like "Counter Disabled"?
> > 
> > Fan
> 
> Hey Fan,
> So the counter value will show 0 in case it is disabled so there will not be any issues as per say. We could add the
> check here but I feel I have already exposed the functionality to check if a counter is enabled or disabled, (by reading the
> counter_enable debugfs entry) so this could be handled in user space to only read the counter if it's enabled.
Ok. 
Returning 0 when the counter is disabled makes sense to me.

Just some thought.

It seems natural to me if we make "counter_value" only visiable to
users when the counter is enabled. 

Fan
> 
> > >
> > > Thank you!
> > >
> > > 	Krzysztof
> 
> 

