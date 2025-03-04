Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90810C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 16:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9J55i6SaAxXDmk71XUiDvvdHDUMorv5pKHh75B2QGvY=; b=aklcXdCW9Z/0LuIbctbEdmsRHq
	UZ66FZx0EUex29M4wDZ7K9ZZ23YPPw53fKISdUK7qYlkdSba4kG6rghXFJY3IlOe5LOKClKjF0gMA
	Tz7zd1aaQ7Zpnam5MF5tqeK3bQYIezPJVkWxRtEABxTfyYnRi4Xgzqem6Tour1YOWC/9n4TwxR0tW
	sf90ZOMbRFCB+slSviRxIzE+Or/s3cbgkfPSOLlkjm7+ZmUH8ZQW0FoCOyd4FXg/qTb2q6bE+tDx5
	Inb1n5F3DSewewDwZfZuYogqiUxzN8O+SfbEkxjd1JInnKOWWE/MRXUu47Ok55lAIn88SmkPu7vFz
	6O+l0OCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVIk-00000005SyF-2qOw;
	Tue, 04 Mar 2025 16:39:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUFq-00000005E4x-3o1v
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Mar 2025 15:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9J55i6SaAxXDmk71XUiDvvdHDUMorv5pKHh75B2QGvY=; b=p7g0Ms8ctP+m1cjsPmXjbJGkEz
	c3n+ZGuhMEtn/2OjmdxgO4rIINQ3rpSqWMB8J1IDvhayc3X23krYHekA8hVPqcNqwx35BA3FfQXox
	qcqiOn9pudwp8FYPgr/apyhRVfvGfUI1YcJ9zEPLoVW1xHjVfMGnGJDj5Riwtsz38JB8mWnhx7niV
	onRRERThij7scLLW7mR6k8W6K4Eh4+vVgsqqyZ3j0Xwfph9klk+/ffwO/Ne+eIBjKgJuDSRp9bTk0
	Isw8BOVDvebKS74gOBO/1BCAMT7pWb9CBMxd3CvljlS1bLQ8HAAnwCA1aes6mUUa7QLEfsK3+G6vr
	+m5upiDA==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUFn-000000004Du-1oee
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:32:21 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2fea47bcb51so11552257a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 07:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741102337; x=1741707137; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9J55i6SaAxXDmk71XUiDvvdHDUMorv5pKHh75B2QGvY=;
        b=p///7mdw1CF3BIrSbLumHrshuTrhZgP/0S+F4AylmK4K9ihb8Dt9oGADkmgzrTdP83
         IEyA95H9/cQu46o1KwEaBNEbDtopEZQMz4eosvS0XrP5TAIg/nci9RgsEOseBWMoySsv
         Iud9jEVozChgFAayDDqiT5gnVjOfamzgTC8SPS5l6iTHg8pChG1Gltt83ftUN01S91Ua
         QxZPZ2nJ7BShG+NuEXnfyKOkphRV7WNdBAXSk3GfH7QQWiXpW0gGncJ+Lef3zjIssytw
         +6N1NsQtwPA/DbL0kblGXasPosbUUMtfP5odUzpP8MwGrwBGl8EJ0yJpjwktfOgu5Mp9
         kAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741102337; x=1741707137;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9J55i6SaAxXDmk71XUiDvvdHDUMorv5pKHh75B2QGvY=;
        b=aaD/FJy8MzbK4AoUJ3k4OASU9LJbaayboIBMcZrPMnpVREPeO/qmUrkJP3fEp/UCIY
         0HHh6bzR/sDELlkDh7ZpoUrEX4JVy6m6jQcrN0D9jEPL3ZG1rx4IQw+rdJnFpzXwbpiY
         rxAlkeQ4cnlCEL771VWYWS57G+Em/h93gpwQ63sXbyjg8CZU77Xuu3SCABcpQYFN4YGk
         Ztzwlm/KXCLQL1h22eYTrfnIwRh/2jh4rqDbsJYEkW5OGc+5QsbRPrenauAlyKtNcl8r
         w3g6D+YCGA/oDY7sE2zQt6p9CnsiNLAeA/CV/evgDkpi7tgVqGXhthZsLQ7rkQPBSgrJ
         coUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxzsLW+DmgW8CXW8+PtxumE9uKEC3FW5TW9m50shARQB0WWhq/gaDVf83RAFnsHX9CTQPboCYVMjKJsvTrAwOT@lists.infradead.org
X-Gm-Message-State: AOJu0YwIDLDLu7nQaA3AHVb11iE6zlfkwXf9qsYi1zLXAVS7aklIZsEd
	e9+kVTXA28CFYW2jQn77gDkk3ufG7D2swLIjMz5gZIZ/cBbPbMDnryh4JqVrCw==
X-Gm-Gg: ASbGncvcJ2NY4sXQAxKOvV07ROUTUHcVRc8tYvVh9raMOj5lncq+xNF/vN7azSzyDy4
	Q5o+0B1C5zrRWbK7E26dAlkbz1cLA4S2L/eSrGmAR7UXACuT+5pDHLzV6plcYNQBp4C9099s5ZT
	PKX2yn7wntAsNSDFv+ryOd0RXrCj4TOjK8Lq4YUGZgXyTCMdWSsnMPnJZQ+OqxmFGieRz5zYbI5
	3wB+dy0EMw/Hf4b1slGl9Zm1jqJiSuA6Od4iVGtczcdI/WatA8ssgRFp1ZFQnUhl8AvNS5rsIJg
	xL7VQowRUNWALexiNXq1u+blLPJYAEWgY1v+/Mi2O34t+RxCyImHoMs=
X-Google-Smtp-Source: AGHT+IGGf95zBxRvPRSEYDsTC4/BBUP78sumCmzYhxc9letUVVeTQ59a5edLgdJXdoWT1eIqtoqw6w==
X-Received: by 2002:a17:90b:2888:b0:2fe:b907:562f with SMTP id 98e67ed59e1d1-2febab5e112mr30851643a91.14.1741102336858;
        Tue, 04 Mar 2025 07:32:16 -0800 (PST)
Received: from thinkpad ([120.60.51.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe8284f076sm13309640a91.42.2025.03.04.07.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 07:32:16 -0800 (PST)
Date: Tue, 4 Mar 2025 21:02:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Fan Ni <nifan.cxl@gmail.com>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Shradha Todi <shradha.t@samsung.com>, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, lpieralisi@kernel.org,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	Jonathan.Cameron@huawei.com, a.manzanares@samsung.com,
	pankaj.dubey@samsung.com, cassel@kernel.org, 18255117159@163.com,
	xueshuai@linux.alibaba.com, renyu.zj@linux.alibaba.com,
	will@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v7 5/5] Add debugfs based statistical counter support in
 DWC
Message-ID: <20250304153206.gr7footrqrpc5uxf@thinkpad>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132043epcas5p27fde98558b13b3311cdc467e8f246380@epcas5p2.samsung.com>
 <20250221131548.59616-6-shradha.t@samsung.com>
 <Z8XuuNb6TRevUlHH@debian>
 <20250303194228.GB1552306@rocinante>
 <Z8YZEALV71PUkXpF@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z8YZEALV71PUkXpF@debian>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_153219_719696_60A8C846 
X-CRM114-Status: GOOD (  17.09  )
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

On Mon, Mar 03, 2025 at 01:03:12PM -0800, Fan Ni wrote:
> On Tue, Mar 04, 2025 at 04:42:28AM +0900, Krzysztof Wilczyński wrote:
> > Hello,
> > 
> > [...]
> > > > +static ssize_t counter_value_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> > > > +{
> > > > +	struct dwc_pcie_rasdes_priv *pdata = file->private_data;
> > > > +	struct dw_pcie *pci = pdata->pci;
> > > > +	struct dwc_pcie_rasdes_info *rinfo = pci->debugfs->rasdes_info;
> > > > +	char debugfs_buf[DWC_DEBUGFS_BUF_MAX];
> > > > +	ssize_t pos;
> > > > +	u32 val;
> > > > +
> > > > +	mutex_lock(&rinfo->reg_event_lock);
> > > > +	set_event_number(pdata, pci, rinfo);
> > > > +	val = dw_pcie_readl_dbi(pci, rinfo->ras_cap_offset + RAS_DES_EVENT_COUNTER_DATA_REG);
> > > > +	mutex_unlock(&rinfo->reg_event_lock);
> > > > +	pos = scnprintf(debugfs_buf, DWC_DEBUGFS_BUF_MAX, "Counter value: %d\n", val);
> > > > +
> > > > +	return simple_read_from_buffer(buf, count, ppos, debugfs_buf, pos);
> > > > +}
> > > 
> > > Do we need to check whether the counter is enabled or not for the event
> > > before retrieving the counter value?
> > 
> > I believe, we have a patch that aims to address, have a look at:
> > 
> >   https://lore.kernel.org/linux-pci/20250225171239.19574-1-manivannan.sadhasivam@linaro.org
> 
> Maybe I missed something, that seems to fix counter_enable_read(), but
> here is to retrieve counter value. 
> How dw_pcie_readl_dbi() can return something like "Counter Disabled"? 
> 

Only way to know if a counter is enabled by reading back the status. And that is
what the patch is doing.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

