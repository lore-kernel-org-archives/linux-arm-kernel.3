Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289ABC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 07:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Usze/Hu/f9NyhQihXYEPOZpxjmRJBiCjP4S9p3//eDA=; b=t4o8kjCMNwZE/KvHM6aBQ91MaX
	IEk2MAl2vmk0+u1O9BCIK1hNWnq3BON61GPR+0d1PJEJOC6r5aF8BZPfbaId8pV2Rg3tt6BhAnTxa
	2ROuJkQ0tplhaMzWYOw5RBfWdRSbQMD7GFtqvi9pZbOFWY/t4/S550+5K3ni43BMbOVybBXbYXdEP
	K65sav+nMXkt6KmB/1XaTzWw9GgOhVDtZjoBMCeBZxK16Qy6MU0AN+kH9Opj47re77gwSm7XAkQnT
	98KQ69GQam5GeQBnqL2S+zhaVilcT5cLAPBVe3MVUKcBKRNdrqfh/7f7eXGPHMU7pLH8RDRLmBeca
	C45eSvtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKzK-00000007kyx-2pRR;
	Wed, 26 Mar 2025 07:15:46 +0000
Received: from mail-pl1-f172.google.com ([209.85.214.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKsG-00000007kHp-10Qi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 07:08:29 +0000
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2241053582dso59691045ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 00:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742972907; x=1743577707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Usze/Hu/f9NyhQihXYEPOZpxjmRJBiCjP4S9p3//eDA=;
        b=CNCEes7CZmvrNfte/tREHob0mGSqMtlHVT7F3sNqA2d9+atZEbpjtcJN+NONTmwBy4
         CKaGRFz8WIesAsg9FiFfqaEPiObAjn1d9y3s+liLcAJdWXDef8Y3Clmew6XbvgqBCOm7
         GdFHL06kMIg5QegrxT9lVUuAluJWvIWbHHRcQO33bdLIC56Kgk+HLQ2Y9ZjxiCDF+sz0
         CQt0ANXAdJhZXrbXlz7o5gJ5/xuaPAXA64r/9lm3DykkYwMYBDSvb2dv8vpCdnCKo00j
         +CwZVY4LYIhHMmW3XjY9U35KG+FoLwKXLBZIVsL+VKUeb6eAYizTVFnnBZQNxloRJGlO
         qBVg==
X-Forwarded-Encrypted: i=1; AJvYcCX5rnW+dz/FMWL3CC7dXalcALHKTqZSAJgyxPL3bNkMhbphuSWQYkWfji/R3enXn0EB/4rw5MI+AdBxE+knLeyh@lists.infradead.org
X-Gm-Message-State: AOJu0YyRq5o0ikR0Zg4wEVeVH36WNogHnKZsx86XPLEvps8pUoLL5GLu
	658rya6ANe2wfl1GKFFQwgrz7qDLSACRhnh92lw46pA9iF062wXB
X-Gm-Gg: ASbGncsVaOHVB+J/zRVrKElhK8Pf5DicDO7TJPUIJMtNBa+RZdTaG38zNlrNKPmzEaL
	No/gaF8LlSCvt8RdDgzklBOIBzwiVn0cT9VscrwDc++HEbTNkhCe7f7Fvh6IAA8WYkANdFQE2ji
	h8EdM5p6qryT4shzcwXn3or5gh5K30spdCScX9ka1f89PAzV5AUPkGFEPM90A8Bb9IWDogG7z+n
	h7UjeHef45NM8/pjoRcuAVeOSULlwsXEWdoZX8usn8WfVD6o+S4KjcC7iGk6ApHsU/F2Bu0Sxmw
	githp70vGNppAXaCUvp2MmT4bUICEK+VllNERIjk7n5Lsfnn6il0SsRPJqM5BXINvSkiYi2JcAc
	KKj8=
X-Google-Smtp-Source: AGHT+IGyEsepOSz9UoNKc7Y22NXljw4tUhAHspFeSHM2qES1d+egW2qdQZ6cpo8lCD4d3eJlrT4aQQ==
X-Received: by 2002:a17:902:e54a:b0:21f:85ee:f2df with SMTP id d9443c01a7336-22780c79888mr292422165ad.15.1742972906946;
        Wed, 26 Mar 2025 00:08:26 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22780f50c80sm102359315ad.104.2025.03.26.00.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 00:08:26 -0700 (PDT)
Date: Wed, 26 Mar 2025 16:08:25 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, lpieralisi@kernel.org,
	vigneshr@ti.com, manivannan.sadhasivam@linaro.org, robh@kernel.org,
	bhelgaas@google.com, rogerq@kernel.org, linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH] PCI: j721e: Fix the value of linkdown_irq_regfield for
 J784S4
Message-ID: <20250326070825.GD2822343@rocinante>
References: <20250313055519.j3bpvsm6govd5ytk@uda0492258>
 <20250313160215.GA736346@bhelgaas>
 <20250314041705.v5j2fjulol5ywvyq@uda0492258>
 <20250326065447.GC2822343@rocinante>
 <20250326070124.boluxjcid4ouszqk@uda0492258>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326070124.boluxjcid4ouszqk@uda0492258>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_000828_275687_4FE6998C 
X-CRM114-Status: GOOD (  18.88  )
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
> > > > So I guess without this patch, we incorrectly ignore link-down
> > > > interrupts on J784S4.  It's good to have a one-sentence motivation
> > > > like that somewhere in the commit log that we can pull out and include
> > > > in the merge commit log and the pull request.
> > > 
> > > Yes, we can prepend the following to the existing commit message:
> > > "Link down interrupts on J784S4 SoC are missed because..."
> > > 
> > > resulting in the following updated paragraph in the commit message:
> > > Link down interrupts on J784S4 SoC are missed because commit under Fixes
> > > assigned the value of 'linkdown_irq_regfield' for the....
> > 
> > How does this look like?
> > 
> >   https://web.git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/j721e&id=b97b5b8cb603a4ba6b3f7f1b6065fa76e69bdb56
> > 
> > Let me know if you want any changes.
> 
> I will suggest minor changes to the first paragraph of the commit
> message resulting in the following paragraph:
> 
> Commit under Fixes assigned the value of .linkdown_irq_regfield for the
> J784S4 SoC as the "LINK_DOWN" macro corresponding to BIT(1), and as a
> result, the Link Down interrupts on J784S4 SoC are missed.

OK.  Updated.  We are going to meet there half-way. :)

Thank you!

	Krzysztof

