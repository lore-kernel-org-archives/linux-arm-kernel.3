Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC572D132C1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 13:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UiVWnP7kdfguO3vKrywHszcKuT/ax89aUHhWpqrDlzU=; b=KAxsG05pvH6FjojTuSWESn0lN8
	Dn32OFDjpR6QiAAyNUjABtCkI9EuZuJtcC5CtvZkvgsJBFv1dJEWe1ddHUejrRN8d9Sn+joizft/a
	BjFVpQBevz3wXaVVUNqYnNlfQmArZliJ9tzGgjbnsRd2HIy20AXt7Oi4ztDRpN7NTOJ7/9VdpMawi
	D6Hxk4iFCy0AqAbVWbJjlQdRIB9yEvUQ3OUTAXdc9GkTcwYVwofwB5/r4yYoruJenQKxA1z9bVlay
	2ms5Pr9msOUqeTmRbX15ayr889eTBOvBaoxpK75ORDBHSRZOQE2hgLjKMTPGi649bJc2Hj7dc1PyO
	dGwVhVXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7x63-0000000Dqpc-1zh2;
	Mon, 04 Nov 2024 13:26:19 +0000
Received: from mail-pl1-f176.google.com ([209.85.214.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7x2G-0000000DpxU-1X4d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:22:26 +0000
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20c8b557f91so42815335ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 05:22:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730726543; x=1731331343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UiVWnP7kdfguO3vKrywHszcKuT/ax89aUHhWpqrDlzU=;
        b=jI4neUM0E0wQrnlD+pMDfHZhgmhFXNBwhoJGM98GdxwqVeaRd2M/pJZuvTQsyzaCHX
         iADJEcf1a+4kESsbLltLu7SEJBIjOAzeu6MpUnHfyXknd67JqNWPAiUss3baCVjcdfhp
         dfN21SMp0K4OW/dCm4lRfoTapx8SwRW7MJPuobbVx5rXHsx3xVp1rXdGfB+F7d9Stnfi
         obwy+1hVH/Q0whJDAkpBPeUMBJT+lgMZ2Iw5cT0hK1EU02cIr5cETpsQ26+QFTv1jDVo
         jxpEv9FC1l48ej2LnuBFP0qiNkkKlNKdDNhB1oIOzhpZJDHr9nTVzCzA1cUoAZ1GPRNF
         akeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmntjXIGi+yGQQD+/VIyO4Jo+EBRJOSSaF8z7Pp7DJGwUzR7Rvb5nBnwuqeWd/asmfsfHt3q988qcXBh6WkA7W@lists.infradead.org
X-Gm-Message-State: AOJu0YzWCXG9Q8hQBinnme1BIJi8RcS6W2fp7e6kSsYQVsXwl3T94ODO
	ZtYXJx1PO6iokerbuObOSU2WQpd6biyjpiSdoFPWJNh/ZPtK0w1K
X-Google-Smtp-Source: AGHT+IHpDIGv2RScWEaNKHsryqx6v1lrXJOztR/qFFp197CdN99mxwH5uovMf6w+lDn72OzEgzUsUA==
X-Received: by 2002:a17:903:2bce:b0:20c:f27f:fbf with SMTP id d9443c01a7336-210c6ae7f15mr465977105ad.25.1730726543312;
        Mon, 04 Nov 2024 05:22:23 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057f3dd1sm60195775ad.308.2024.11.04.05.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 05:22:22 -0800 (PST)
Date: Mon, 4 Nov 2024 22:22:21 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, robh@kernel.org,
	vigneshr@ti.com, manivannan.sadhasivam@linaro.org,
	kishon@kernel.org, thomas.richard@bootlin.com,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH v2] PCI: j721e: Deassert PERST# after a delay of
 PCIE_T_PVPERL_MS ms
Message-ID: <20241104132221.GB2504924@rocinante>
References: <20241104074420.1862932-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104074420.1862932-1-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_052224_517181_961927E0 
X-CRM114-Status: GOOD (  10.07  )
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

> According to Section 2.2 of the PCI Express Card Electromechanical
> Specification (Revision 5.1), in order to ensure that the power and the
> reference clock are stable, PERST# has to be deasserted after a delay of
> 100 milliseconds (TPVPERL). Currently, it is being assumed that the power
> is already stable, which is not necessarily true. Hence, change the delay
> to PCIE_T_PVPERL_MS to guarantee that power and reference clock are stable.

Applied to controller/j721e, thank you!

[01/01] PCI: j721e: Deassert PERST# after a delay of PCIE_T_PVPERL_MS milliseconds
        https://git.kernel.org/pci/pci/c/22a9120479a4

	Krzysztof

