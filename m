Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA16C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 07:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNgzDD9KflnZOadx5j+UnJGC4H2dSOBqjrhq830X+Ig=; b=Rq7vmRLgeijWTsaC//ay3hrBZq
	Ahs57qFK0rpVE0AJDZSXFXXdANJnEhS4ChftFlHhzsgoVlEVDgOtu2mD2W0sCqN5nX7+DOcihQh8T
	0JWzGvH5Jv1PVrQ1E1h7wNy4GX9QIql6cxeQy2FdS7/CLzEcYPHpzHwEudMqkrqNjcnzB0np2E1h0
	JPATbpcQt0WlYdybPMXP7cuv6fSla9DA1v1FGw71TA4W/6+OYRodbw4nmbm4a6uDoQIQjUl3e7n3c
	s701ezkjpJlJvvnbxQ/8TIubI96JSqsEK+b08paQqbnAaXNosNIOBguM7I6H/iNfETpCoD1+qKQOG
	HdlJXlOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjAx-00000007Ema-3wwD;
	Wed, 05 Mar 2025 07:28:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpj9O-00000007Eca-0gAC
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 07:26:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HNgzDD9KflnZOadx5j+UnJGC4H2dSOBqjrhq830X+Ig=; b=SDDdtcWunIFbnFZf4ZTAuDpV0c
	N4g50aBkJwOpR2RRUBUW6ZKarnPD7w+GeSGPmQ72TZgIDud06ZXt0FfHan0ylb3ypcUNW8F9wm/Tr
	MvEys4xjityuBx2Ml5Mspn4Q3iEeBZ9S123NO6mSFM5ZaOju3GgN3WgFmNoZZbvjhbYvyIQUtwX84
	wq5UZuCuRjp/M/i3GMBA7i9jHT0m9H8wTkBFhd13b/sl2et/j34x1yGSRwmvXYofzpW0DMkI7aU7H
	a9O/ZeG68TdbOkKLrf02Rctyres0toldAx/YiQNZZTU16WbP8BGe1eSKdIrpe4R88VuZ4Ta4E1i24
	DP+e8qYw==;
Received: from mail-pl1-f173.google.com ([209.85.214.173])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpj9K-00000000Ozu-2nMg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 07:26:40 +0000
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22334203781so9751365ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 23:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741159595; x=1741764395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNgzDD9KflnZOadx5j+UnJGC4H2dSOBqjrhq830X+Ig=;
        b=eP7v+WgURibT4q1BYUo/wLUM3ZT3gA5N7Zg3OPzenxliRicO/oeo2Dwlej5MLwqkNB
         A1Wq0eg1m+rfQpIL/8cvkg1EdoVCJ3aOzsGrVN/nZDzuRLuhW8UOwWE5R2RrGu+HTogG
         qvHUjG+/WqzYeFI0eeM6LodGd5NamYAqW0TMQT8LV7JEYrHsZHhtm4Q4HIfl+/A4Qs8P
         89BfGHjKtE7YRKZ0FdJkVmRrKccvXRUwgNN1ghR7TTPJeiYmer2CPsNCe9Kwqr9OuJ0y
         zVaoUE8QCfQmKZiWrBcyxLNbyydh81xSwz8wnCrrRKPukqIyoZ6L4tRYkTIPrxi3STnk
         wysA==
X-Forwarded-Encrypted: i=1; AJvYcCXs474vkc13yao/+SX8bkbG/LGi+0wXhH3u9Vo89bLffBCnjD0GMLQVDNsBrezvlSD8cMx6PeSq8BWrv5W6pnJL@lists.infradead.org
X-Gm-Message-State: AOJu0YwgUXmAHIjOwnx9gc950jA/GvA00QhMHyLCK9FO5pyrrhNGy7B0
	M4QWWiUJdx5fP19+PUs3eztgUsfZ13x+Gsga/aUbuFMFEna74kCy
X-Gm-Gg: ASbGncv7bG4Um/PXIdnInYbyO2PmngZk8QIBazQpf8aHT6IzjiJhRkP+tEK/yv2Ndth
	kIZj0HIS2nGgCuOinq64P3q1fJBMZDK5pIfklNEQOJVMNyukx3pD1tgHqTLs4cqyUGrqD5c1d4T
	Zwie36PAa5OmkzhoqxH0U8ETCBmd5KtRexRxkB06xXuuXT6BosIvRDiZ9zrdBrlZc7jt8N4JJi/
	EKKXSMRf6tXRxE5lU37b5NRGnmiiPoVSFI8VyewAc3OlWDknrFch2HY+RgAAIN6erS637mEAqYt
	4fIuiNxpoqyehqjhJACemX7D7f3JX6uVsz+jhb4siPmQgxWNDVU274NBAC6hqiV3lkWp6bKOyEL
	gjLQ=
X-Google-Smtp-Source: AGHT+IH4t9c1giK1O3kPlJL0PRn7mp5PNA7gzv7H2Tv8w5GXPqUFHbxAbvmymLda57tcg7gd3IxW4g==
X-Received: by 2002:a05:6a00:9a0:b0:736:38b1:51c3 with SMTP id d2e1a72fcca58-7366e75b316mr10877398b3a.10.1741159595256;
        Tue, 04 Mar 2025 23:26:35 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-736881fa8easm449243b3a.39.2025.03.04.23.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:26:34 -0800 (PST)
Date: Wed, 5 Mar 2025 16:26:32 +0900
From: 'Krzysztof =?utf-8?Q?Wilczy=C5=84ski'?= <kw@linux.com>
To: Shradha Todi <shradha.t@samsung.com>
Cc: 'Manivannan Sadhasivam' <manivannan.sadhasivam@linaro.org>,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, lpieralisi@kernel.org,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	Jonathan.Cameron@huawei.com, fan.ni@samsung.com,
	nifan.cxl@gmail.com, a.manzanares@samsung.com,
	pankaj.dubey@samsung.com, cassel@kernel.org, 18255117159@163.com,
	xueshuai@linux.alibaba.com, renyu.zj@linux.alibaba.com,
	will@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v7 4/5] Add debugfs based error injection support in DWC
Message-ID: <20250305072632.GB847772@rocinante>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132039epcas5p31913eab0acec1eb5e7874897a084c725@epcas5p3.samsung.com>
 <20250221131548.59616-5-shradha.t@samsung.com>
 <20250303095200.GB1065658@rocinante>
 <20250304152952.pal66goo2dwegevh@thinkpad>
 <20250304153509.GA2310180@rocinante>
 <061301db8d27$02e0ced0$08a26c70$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <061301db8d27$02e0ced0$08a26c70$@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_072638_844096_94556A63 
X-CRM114-Status: GOOD (  15.06  )
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
> > > > > +		29) Generates duplicate TLPs - duplicate_dllp
> > > > > +		30) Generates Nullified TLPs - nullified_tlp
> > > >
> > > > Would the above field called "duplicate_dllp" for duplicate TLPs be
> > > > a potential typo?  Perhaps this should be called "duplicate_tlp"?
> > > >
> > >
> > > Looks like a typo. As per Synopsys documentation, there is only 'duplicate TLP'
> > > field.
> > >
> > > Good catch!
> > 
> > Updated.  Thank you!
> > 
> 
> Sorry, this was a typo. Krzysztof, we need another change for this typo.

Not a problem.  I am glad we caught this early.

[...]
> --- a/drivers/pci/controller/dwc/pcie-designware-debugfs.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-debugfs.c
> @@ -113,7 +113,7 @@ static const struct dwc_pcie_err_inj err_inj_list[] = {
>         {"posted_tlp_data", 0x4, 0x4},
>         {"non_post_tlp_data", 0x4, 0x5},
>         {"cmpl_tlp_data", 0x4, 0x6},
> -       {"duplicate_dllp", 0x5, 0x0},
> +       {"duplicate_tlp", 0x5, 0x0},
>         {"nullified_tlp", 0x5, 0x1},
>  };

Oh here too.  No worries.  I missed this one. :)

> So sorry for the inconvenience! Should I post a patch for this?

No, no need.  I will update this directly on the branch.

Thank you!

	Krzysztof

