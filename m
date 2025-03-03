Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12418C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 18:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uaH51U1EARjWt1wUptMoCo83LSnQN+HwOWnZIFYX+bw=; b=FMfVDwdXU905Eag+br1hHJ/MKT
	WSp1o8juIP0TZ02KAkDHfqCgvYp8nKuTrdHyHdOAvTtc2fL7GNsXbBq4CW1HKBDNEB0vYG8TgQe7f
	hQfMmFSj9hjBNxOuRg+9LO0IcDB4y+xalSZudHAA+n4xMVqex17E4o3wz5GV41e7Lc9RqdgyA4hx0
	d3Cv+ePkPy+3734RYoZxmmvRSdvfFKcqZ5daKtiIrCnIMn+eArfwoX6GukYwk1y/8lpVjwTArN/0v
	nypwSAJG+MvZoZiiwYFdh8t+XPcmMTg0t/QrAhKDgOjItdQxasiK0UITATcaT0ZJlOCLUkK7VPmUZ
	DcneFaBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpA9L-00000001sln-3mtg;
	Mon, 03 Mar 2025 18:04:19 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpA7l-00000001sY8-30wj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 18:02:42 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6e17d3e92d9so32253586d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 10:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741024961; x=1741629761; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uaH51U1EARjWt1wUptMoCo83LSnQN+HwOWnZIFYX+bw=;
        b=YZ+Mp6y8EWlboJO/hIOSapJyCWsv7PEd11iMAp3Xi7HchaR1TkjuHa9FsyCNrLMsSM
         SZMyiNQ1LNfljPGMdyNuMyGrRRSPpjWOAO23dKlDcbYzU/DE+na1WjzzEwfKwklfxdFF
         fs996xwK0qJCdKv3pRZngRqsVzw7HsszbtV5eHfZvNbarLvIw3JrypDvDOkDt0eorhOc
         cIGqtqUjAcCHum9zItENzp5xr8rgjN5V5sfjnCCDSwg+7SEe0QR/aO9iMHdhCWGU771P
         c+3jn2ShROuewm6cCSjOj1V/7r+yqlQhKPx5OzKK9NTkuM08P2b1dHwRiFml+/m+Pusp
         hlCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741024961; x=1741629761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uaH51U1EARjWt1wUptMoCo83LSnQN+HwOWnZIFYX+bw=;
        b=YYMYxZwlfJ/P6fJPSYyDhk3Ax6UHU3H8xv/yvMqgJPNY/wu3pVU7Nh7BIYKrqHIg2f
         6SIBkEvJGlF9FvnokGEnuvI9LzQNNneamfy2XoEOiFu5YkM92gl5G6S+MliVT9pmeOTe
         Vx6ZMsmQV22HCsFkUsNHZP+2WBJRQiDHfW9HDfrpqqVha0yRaKgpt7kKanByLVn3kbdC
         91LEz76Q/BPgOfRzqbm1LdIm04QW/6iKyx7yXpq5S5ZdU3h/jq+4KWdd4pJlA4lJRZHM
         XMTeCb8wBsFrBntrjrIDY/Ui+TsDBcnRvId3nuWTUAPwNB0Jscd/R7rgEtzQ6BeXIL5a
         IVzA==
X-Forwarded-Encrypted: i=1; AJvYcCVptorFm4pdfpRSd3buQZuRGfOqb771uVMnkdj+MQonRWrhWh+9htls6biWKrTxX8ow8FFBfjTXH69V+6s8nsx/@lists.infradead.org
X-Gm-Message-State: AOJu0YxnpmHWRLlJmDF+kmXHVlC4MorEKvP4su4j3WZB9lcRdx/SpF8D
	5eyLSAX7LjIpqh4XVXRrTTw6QD5GKlqDFJbUYz+X+IVvXGlseMPX
X-Gm-Gg: ASbGnctU6kFFHRtUEHNCI/O50WOgzYBH0I8Uslcf8RyHGpJlQaxMk64GUITbxanAQXG
	wijTZ6N4m8k6wJKfacVl1htD7IE01j05JWXyiD9rap123R5y3psCohyfWmFDscTQsqwSUIfFEZn
	ULfabv08U9lr/8D8AOZOXjdApmVD2+Rr2Dvb4iS3FNiqsVPLRIPD32a+LymhhuOrDTUOY+WgzKz
	LlIxatW8o57hlJIbuo6vmcW6QXSIXnzN1YdVPdeEGwaSgKTZ4KquqxQuFzLYwb+d5JC7HjqV+UJ
	ZqS1Ngd5uHa/9lQ50WPDG7+XKQ2oVaMiLkYA8RIS
X-Google-Smtp-Source: AGHT+IHjzkfcwb10GrGN3uoaAD93gQYyAxTYz59dkNKhr3SqimWrYHhjEzDaYdTtiZWAuzKMb2Txaw==
X-Received: by 2002:a05:6214:2aad:b0:6e8:9ac9:55ad with SMTP id 6a1803df08f44-6e8a0d94f85mr225579736d6.37.1741024960502;
        Mon, 03 Mar 2025 10:02:40 -0800 (PST)
Received: from debian ([2607:fb90:8e63:c2b3:5405:c8bf:c1d1:41d5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e89763479csm55795596d6.2.2025.03.03.10.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 10:02:39 -0800 (PST)
From: Fan Ni <nifan.cxl@gmail.com>
X-Google-Original-From: Fan Ni <fan.ni@samsung.com>
Date: Mon, 3 Mar 2025 10:02:32 -0800
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, manivannan.sadhasivam@linaro.org,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, jingoohan1@gmail.com,
	Jonathan.Cameron@huawei.com, nifan.cxl@gmail.com,
	a.manzanares@samsung.com, pankaj.dubey@samsung.com,
	cassel@kernel.org, 18255117159@163.com, xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com, will@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v7 5/5] Add debugfs based statistical counter support in
 DWC
Message-ID: <Z8XuuNb6TRevUlHH@debian>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132043epcas5p27fde98558b13b3311cdc467e8f246380@epcas5p2.samsung.com>
 <20250221131548.59616-6-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221131548.59616-6-shradha.t@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_100241_757959_F19CB6C4 
X-CRM114-Status: GOOD (  25.94  )
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

On Fri, Feb 21, 2025 at 06:45:48PM +0530, Shradha Todi wrote:
> Add support to provide statistical counter interface to userspace. This set
> of debug registers are part of the RASDES feature present in DesignWare
> PCIe controllers.
> 
One comment inline.
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
> ---
>  Documentation/ABI/testing/debugfs-dwc-pcie    |  61 +++++
>  .../controller/dwc/pcie-designware-debugfs.c  | 229 +++++++++++++++++-
>  2 files changed, 289 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/debugfs-dwc-pcie b/Documentation/ABI/testing/debugfs-dwc-pcie
> index 6ee0897fe753..650a89b0511e 100644
> --- a/Documentation/ABI/testing/debugfs-dwc-pcie
> +++ b/Documentation/ABI/testing/debugfs-dwc-pcie
> @@ -81,3 +81,64 @@ Description:	rasdes_err_inj is the directory which can be used to inject errors
>  
>  			<count>
>  				Number of errors to be injected

...

> +
> +static ssize_t counter_value_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> +{
> +	struct dwc_pcie_rasdes_priv *pdata = file->private_data;
> +	struct dw_pcie *pci = pdata->pci;
> +	struct dwc_pcie_rasdes_info *rinfo = pci->debugfs->rasdes_info;
> +	char debugfs_buf[DWC_DEBUGFS_BUF_MAX];
> +	ssize_t pos;
> +	u32 val;
> +
> +	mutex_lock(&rinfo->reg_event_lock);
> +	set_event_number(pdata, pci, rinfo);
> +	val = dw_pcie_readl_dbi(pci, rinfo->ras_cap_offset + RAS_DES_EVENT_COUNTER_DATA_REG);
> +	mutex_unlock(&rinfo->reg_event_lock);
> +	pos = scnprintf(debugfs_buf, DWC_DEBUGFS_BUF_MAX, "Counter value: %d\n", val);
> +
> +	return simple_read_from_buffer(buf, count, ppos, debugfs_buf, pos);
> +}

Do we need to check whether the counter is enabled or not for the event
before retrieving the counter value?

Fan
> +
>  #define dwc_debugfs_create(name)			\
>  debugfs_create_file(#name, 0644, rasdes_debug, pci,	\
>  			&dbg_ ## name ## _fops)
> @@ -249,6 +436,23 @@ static const struct file_operations dwc_pcie_err_inj_ops = {
>  	.write = err_inj_write,
>  };
>  
> +static const struct file_operations dwc_pcie_counter_enable_ops = {
> +	.open = simple_open,
> +	.read = counter_enable_read,
> +	.write = counter_enable_write,
> +};
> +
> +static const struct file_operations dwc_pcie_counter_lane_ops = {
> +	.open = simple_open,
> +	.read = counter_lane_read,
> +	.write = counter_lane_write,
> +};
> +
> +static const struct file_operations dwc_pcie_counter_value_ops = {
> +	.open = simple_open,
> +	.read = counter_value_read,
> +};
> +
>  static void dwc_pcie_rasdes_debugfs_deinit(struct dw_pcie *pci)
>  {
>  	struct dwc_pcie_rasdes_info *rinfo = pci->debugfs->rasdes_info;
> @@ -258,7 +462,7 @@ static void dwc_pcie_rasdes_debugfs_deinit(struct dw_pcie *pci)
>  
>  static int dwc_pcie_rasdes_debugfs_init(struct dw_pcie *pci, struct dentry *dir)
>  {
> -	struct dentry *rasdes_debug, *rasdes_err_inj;
> +	struct dentry *rasdes_debug, *rasdes_err_inj, *rasdes_event_counter, *rasdes_events;
>  	struct dwc_pcie_rasdes_info *rasdes_info;
>  	struct dwc_pcie_rasdes_priv *priv_tmp;
>  	struct device *dev = pci->dev;
> @@ -277,6 +481,7 @@ static int dwc_pcie_rasdes_debugfs_init(struct dw_pcie *pci, struct dentry *dir)
>  	/* Create subdirectories for Debug, Error injection, Statistics */
>  	rasdes_debug = debugfs_create_dir("rasdes_debug", dir);
>  	rasdes_err_inj = debugfs_create_dir("rasdes_err_inj", dir);
> +	rasdes_event_counter = debugfs_create_dir("rasdes_event_counter", dir);
>  
>  	mutex_init(&rasdes_info->reg_event_lock);
>  	rasdes_info->ras_cap_offset = ras_cap;
> @@ -299,6 +504,28 @@ static int dwc_pcie_rasdes_debugfs_init(struct dw_pcie *pci, struct dentry *dir)
>  		debugfs_create_file(err_inj_list[i].name, 0200, rasdes_err_inj, priv_tmp,
>  				    &dwc_pcie_err_inj_ops);
>  	}
> +
> +	/* Create debugfs files for Statistical counter subdirectory */
> +	for (i = 0; i < ARRAY_SIZE(event_list); i++) {
> +		priv_tmp = devm_kzalloc(dev, sizeof(*priv_tmp), GFP_KERNEL);
> +		if (!priv_tmp) {
> +			ret = -ENOMEM;
> +			goto err_deinit;
> +		}
> +
> +		priv_tmp->idx = i;
> +		priv_tmp->pci = pci;
> +		rasdes_events = debugfs_create_dir(event_list[i].name, rasdes_event_counter);
> +		if (event_list[i].group_no == 0 || event_list[i].group_no == 4) {
> +			debugfs_create_file("lane_select", 0644, rasdes_events,
> +					    priv_tmp, &dwc_pcie_counter_lane_ops);
> +		}
> +		debugfs_create_file("counter_value", 0444, rasdes_events, priv_tmp,
> +				    &dwc_pcie_counter_value_ops);
> +		debugfs_create_file("counter_enable", 0644, rasdes_events, priv_tmp,
> +				    &dwc_pcie_counter_enable_ops);
> +	}
> +
>  	return 0;
>  
>  err_deinit:
> -- 
> 2.17.1
> 

