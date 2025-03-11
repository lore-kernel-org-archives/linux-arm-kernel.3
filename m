Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BC0C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 15:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnmgUREpEZzHIqf+ZGbEOfCKGLjHhsT93+h47gc6MEc=; b=rMEe58Qgeix0038zzh0qXcbRlH
	EZgtRrA9x+zOkyav4Xr8fFIhZX7F0z+lXAIgCcQ/IUiyXLBR74e0HLaovF1ipvVYr5UfGlzHEpYls
	cyImnkdUPS5tdZ2QGlCHIcmdmwXz5hh1zEbQcxva64j/1eC/rprUsqpVt80V9+ROWr5Nug0HqrO8a
	6WA7WAGic6s06l/fKPoqEkzs2/mWsu+RjrSKijFhDUfuiTvz5lubYgCLFsuSdgodtR2NqPhnRDf1h
	1jjBNM9Ehn/gTfGcLYRW9IIiUMlIVrYg5BZ2SZje3rXC1uI59vxr/KDBQ1Edz5dXTdCuM8P0339Gp
	Kfw6w/3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1fV-00000006AsR-0Ro1;
	Tue, 11 Mar 2025 15:37:21 +0000
Received: from mail-pl1-f175.google.com ([209.85.214.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1cg-00000006ATi-0qYt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 15:34:27 +0000
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22409077c06so16524825ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 08:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741707265; x=1742312065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WnmgUREpEZzHIqf+ZGbEOfCKGLjHhsT93+h47gc6MEc=;
        b=wW/PH/BtKlgnpMRJkDaw7NvM3QsVq0kuaEPaGvTjEba4FXqWZCGHLzBCdzx+fMyOpd
         y5vt0m8WWBzHsbMtUaqq7k2Ls3UcFpBQ4Kpktq0bHgszavH+8JPQPfRDqST4dCqqDgZm
         kwxNS52doIe9bhIOusU05kkitIXUWZ4eKEG6f9VDnrNHHu6fH3iNkSeon17fJxOkhZNE
         cqFOp+z4Gm4qwWDmPJu/xRYJRr02WMUNc7OObBYE+4txi7oZwTm0e12l1g3YsltqEc4w
         O8s2nUNBLxKE7Lid4ZTbiBkkGI8jNONS58XRnVFeqdGQfFbZAzXeQTWSxyuuWc3G360k
         WwBA==
X-Forwarded-Encrypted: i=1; AJvYcCXOca8IMkJ8JnvS3AlQ7dkVGlGgp1r4tVH+4VZLcur9mSyG8o8IBC2AZBoR/+awCHg3RG8CmY4jhWivxb+Apz5I@lists.infradead.org
X-Gm-Message-State: AOJu0YwLsvWXUEzfX+G7oJDgmCSeF2SRKZy++O7Tw3aXDMsPwpUVw/7X
	APZYJRC6UYdJu00APYKFpiapcGGJ+t7E2/5GPUQ7jTUE9sv3Yy6JJiSIpv8FrTs=
X-Gm-Gg: ASbGncvvm4njjd1cd0WQ71vUDR+E4h+3uHup0BeqgnpkQVkp0mTHEt5HlN8S5o2pSWo
	AoMV9IEZpUvz3TzaVKYFq/CWcDEva7WhFYvN/Gv0VRfAwXq11B09hLsk57EjX0qdSH7uIM0Wh4Q
	v1A4O9FUiHsONAI6pjn+hMEg9+Hi9C5I+akeMtwE9L/tqEknfQ1TfBmbyFW0Jts0MPN4iSvLhXr
	quEAFYjXr3bf8qG1k7C1EUKXI10tvsEOdIDOHvjRDMrHehv+onGQJcYjxPzBaSd4DMJQ2n6Ougo
	k9t59Gx2U1YQaR6GhqsAFQ00i/+oEaB5ZYdLPXIRDMjQlYFQtCz1fUybRFTyh5OEK5KP90954pP
	du60=
X-Google-Smtp-Source: AGHT+IEp15FNyX/Zw521mFQHT8du6CWvUWJLD3C+Me9OYF9D/bY261KLnGwCsIfgZX7kcU0kGdCDpw==
X-Received: by 2002:a17:902:cf07:b0:223:58ea:6fdf with SMTP id d9443c01a7336-22428a8d325mr352593315ad.28.1741707265450;
        Tue, 11 Mar 2025 08:34:25 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-224109e944csm99547085ad.74.2025.03.11.08.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 08:34:25 -0700 (PDT)
Date: Wed, 12 Mar 2025 00:34:23 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, vigneshr@ti.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	bhelgaas@google.com, rogerq@kernel.org, linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH] PCI: j721e: Fix the value of linkdown_irq_regfield for
 J784S4
Message-ID: <20250311153423.GD1381004@rocinante>
References: <20250305132018.2260771-1-s-vadapalli@ti.com>
 <20250310210746.GA2377483@rocinante>
 <20250311051806.smcu4o4dxpngimth@uda0492258>
 <20250311072546.GA277060@rocinante>
 <20250311073216.ynw7rzmu36dwywij@uda0492258>
 <20250311152133.GC1381004@rocinante>
 <20250311152921.cwb7obw5bmlrhvsi@uda0492258>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311152921.cwb7obw5bmlrhvsi@uda0492258>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_083426_235891_BC7A1702 
X-CRM114-Status: GOOD (  16.09  )
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
> > > > No need to send a new version.
> > > > 
> > > > I will update the branch directly when I pull the patch.  Not to worry.
> > > 
> > > Thank you Krzysztof :)
> > 
> > Done.  Have a look at:
> > 
> >   https://web.git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/j721e&id=01d04dcd6e80f63ca5e97324ec17c20553947e35
> > 
> > Let me know if there is anything else to update.
> 
> The changes look good to me. There seems to be a minor typo in the
> commit message:
> [kwilczynski: add a issing .linkdown_irq_regfield member set to
> 
> You probably meant "missing".

Oops... Fixed. :)  Thank you!

> Thank you once again for fixing it without the need for a new patch.

No worries.

	Krzysztof

