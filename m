Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F53C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 20:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DeBNmmMi2sz0NauGtZCPku7As8wMc8IwVYWILITKobE=; b=Jgtdr3tlVhCcI6ETQbrEdrlAzh
	zVWEl/ymHxjbmPnebFqFbnlI0bbQWlq66oHOMvJNKpMiEJIiZNbZaNvibs7hcGitNjEYMhClKvoK1
	j4cuV41qYQ621KzoNHAJ8HgAma42+nyHBF+oCd+9SgFTdtHd5YStxEHCY/SUgTJyI0DYlV3iXTLbA
	obtHBgooUEPZakspEMmKTgqthzdeesycn1+gKQAjPaqkNFgl9O3orrx5UNg1KIc/geU7eM92JSDQz
	SWzHXh8RB3+Oz3z7Dpif4K1yBPhCyZ+Qiyzg87VEbdDC3xK+D/ffrHxA9iKOR5SI62C65RM9pOGLV
	3cjeyHBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCm0-00000002HIV-2ffQ;
	Mon, 03 Mar 2025 20:52:24 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCkQ-00000002H9R-21Sf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 20:50:47 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2fe96dd93b4so8923780a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 12:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741035045; x=1741639845; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DeBNmmMi2sz0NauGtZCPku7As8wMc8IwVYWILITKobE=;
        b=ZBCNADgWMscPPjbedxYFgxp7PtoYBY9Le5ISNoON7pxbD/FLuyJxQAOr4ik0XNE8rx
         5xHcX5ahseM5LY9slCdJkGVrofizuwe9Z6Qh7XNhPjfcuZ5Zlc1YTPqTWvu1+NIBXFnq
         xIfHhIQXEzbIBZqcSc3xnHabfN6CUSnjt8hx74Gk3IJgFBURbr+vqE0igg/E65TKQjh/
         3JzzVtFsKjtCJ6rcOH3Yd8iHnpU87FZRH7qK2hvMD4zNZpXhnBOC5dqcInWYahzcaPTB
         hcInLNEai2EFYAhOeQ+IVfyd4ThkEKotqzI2m9WBxgyQYZTr7kxpVCUmr3b0mXffqbqi
         mP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741035045; x=1741639845;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DeBNmmMi2sz0NauGtZCPku7As8wMc8IwVYWILITKobE=;
        b=ueOnMYgWX/pgfPLJCpgFk2xkeGZUH8c6olyowrhiHfA7E6sW3kEABZoaL9pOT852+W
         KUYSBNHsXZC4m50mluWee2NggnKU5MtzCGKm6E9WWe2+KBT7bXlbyYW0LBU3EGmhle9d
         617xjp4UR22bKQbdfX059R0i7oVRnQrSknxLoAp0zPM+6YkI1UUbAC2l4rTsp0q7Sm/z
         QFZPy+X+6pZBge2dQczsFqxTSOjjtzfrDbLg7qsbblFN7rRm017QGZNHFkdHWNee2eRN
         wEl1kjcIMXz3eonHikOHQ30FeEYLAIxsKpUydEsDyRR+K5HsNEmnm8L4Y4gpGGr1R1wI
         nJrg==
X-Forwarded-Encrypted: i=1; AJvYcCWAmbwFNccn537I+uWGRtei+Uozl980WkRsjcEMxvXLyNVO5MD9xn4KHC8KVnnm4XQG/0AwDgobu81pAc7IaRrV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7toavwfago9Ri7dm36piiwwdKyVPutOKIoM1eWYdRyQ+2YbJi
	joDpcCqqWtJHnAsdEK0zpqIumVrq78Kba6oIcYwhPfrHMYn8KeMP
X-Gm-Gg: ASbGncsljfyTcC7wGMPBlkvVL8ZgN/O2OY9CAeHDxsQi+TD0GB1ZUU2DzsBc5OMMNgx
	Xa7uus42vtRjua9+ufIRL5LB8clo7FqmUTcd7pYylOa1q4pku8QOWwhwp9Y0Mw/c9e1l5xIZVZ1
	VQOHTHNI0nJnv4DzG3S99uM/HvBHnAhYFHUXTdeNvuHnBsUlC6UP/p7gZykl7L0ns/0eVaTvq48
	Ils6dGrMy3/u/KVFuuOqR1iv8qbixk+qH83YYYOdV6HOEl93TB+u2YSe3Cl6vGYuwiIZKgFfpke
	Su2Mdpr2MpsKDnCp/8fbKzHpKYzIAHmC3I4RvwJr
X-Google-Smtp-Source: AGHT+IGh1THqn567WjqVqxs2mA94q92PxAVet1ueAXS1LUHZPvR/E7EsrK6tGQWCWBCacVWMkBiPLw==
X-Received: by 2002:a17:90b:2e0f:b0:2fa:2252:f436 with SMTP id 98e67ed59e1d1-2ff33b88525mr982923a91.3.1741035045487;
        Mon, 03 Mar 2025 12:50:45 -0800 (PST)
Received: from debian ([2607:fb90:37e1:4bed:f057:b35a:e3e2:4c5f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c603bsm82393025ad.121.2025.03.03.12.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 12:50:44 -0800 (PST)
From: Fan Ni <nifan.cxl@gmail.com>
X-Google-Original-From: Fan Ni <fan.ni@samsung.com>
Date: Mon, 3 Mar 2025 12:50:40 -0800
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
Subject: Re: [PATCH v7 3/5] Add debugfs based silicon debug support in DWC
Message-ID: <Z8YWILtSbQnvVqbF@debian>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132035epcas5p47221a5198df9bf86020abcefdfded789@epcas5p4.samsung.com>
 <20250221131548.59616-4-shradha.t@samsung.com>
 <Z8XrYxP_pZr6tFU8@debian>
 <20250303194647.GC1552306@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250303194647.GC1552306@rocinante>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_125046_522855_BBEB0DFF 
X-CRM114-Status: GOOD (  15.22  )
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

On Tue, Mar 04, 2025 at 04:46:47AM +0900, Krzysztof Wilczyński wrote:
> Hello,
> 
> [...]
> > > +int dwc_pcie_debugfs_init(struct dw_pcie *pci)
> > > +{
> > > +	char dirname[DWC_DEBUGFS_BUF_MAX];
> > > +	struct device *dev = pci->dev;
> > > +	struct debugfs_info *debugfs;
> > > +	struct dentry *dir;
> > > +	int ret;
> > > +
> > > +	/* Create main directory for each platform driver */
> > > +	snprintf(dirname, DWC_DEBUGFS_BUF_MAX, "dwc_pcie_%s", dev_name(dev));
> > > +	dir = debugfs_create_dir(dirname, NULL);
> > > +	debugfs = devm_kzalloc(dev, sizeof(*debugfs), GFP_KERNEL);
> > > +	if (!debugfs)
> > > +		return -ENOMEM;
> > > +
> > > +	debugfs->debug_dir = dir;
> > > +	pci->debugfs = debugfs;
> > > +	ret = dwc_pcie_rasdes_debugfs_init(pci, dir);
> > > +	if (ret)
> > > +		dev_dbg(dev, "RASDES debugfs init failed\n");
> > 
> > What will happen if ret != 0? still return 0? 
> 
> Given that callers of dwc_pcie_debugfs_init() check for errors,
> this probably should correctly bubble up any failure coming from
> dwc_pcie_rasdes_debugfs_init().
> 
> I made updates to the code directly on the current branch, have a look:
> 
>   https://web.git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/dwc&id=1ff54f4cbaed9ec6994844967c36cf7ada4cbe5e
> 
> Let me know if this is OK with you.

It looks good to me.

Feel free to add,
Reviewed-by: Fan Ni <fan.ni@samsung.com>

Fan
> 
> Good catch, thank you!
> 
> 	Krzysztof

