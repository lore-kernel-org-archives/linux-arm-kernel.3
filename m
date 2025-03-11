Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410DCC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 15:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/E1C9TLEjucQveUr2gSBnFJRTsayVaSmXuzEE+51s00=; b=2qqTnj+Vsc+kmWW6vTz3msfMNF
	HjS6ZoemGOXNo7956251/h1fCZ9KoM+3czIu7MvbInFLjEUNgy8XGIfQMST/lFUOCiagUnh3bL6AW
	GGSm7WKZKr14Sy8gfHtZ5EvqpPd6v1rdqymisKJ05s0TxQP7JM0HSrixE8sJER/9f3/F8NhmgoaVy
	2CCGhsy2b5ImQ0xvQ4BO5VHII72ORugA0GfK3LMJAKk0LjF9pXplX+YGbbGz7fKXWrv03RscHLAiI
	/NumfxgLP2jI/22hP9t2H4VprMhGy2LbxHhjqWLMLD+0D9iJn8VLkquO6oO5Kw75sWqeiifmpqPuz
	ed8NFDzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1U1-000000068j4-3lP9;
	Tue, 11 Mar 2025 15:25:29 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1QF-000000067LY-2dpE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 15:21:36 +0000
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2235189adaeso96785155ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 08:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741706495; x=1742311295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/E1C9TLEjucQveUr2gSBnFJRTsayVaSmXuzEE+51s00=;
        b=Ok7Y6rqzrbKEusFfmO7Lt/QhpGMsIv3p4MRjJQPrD/BEg+L689tNbcfmDXy1FLVsub
         quEpFBwEjXvVmXeXiWhPJi49HHpL2xQHI6C2MS0zpuLH4kJTRgR77o30H/rB1+Q/f4y3
         GBCIP9kJIgoWeVLMpsXYrhogOvhRcOmglVmRBIeqDx3zwrue3Fy6gG1PsnD2p4eH3fHV
         cdLYXHnZkBMqK1EiqoJAgsAjfO+p5gqE14eJnA47+bWMBjJXX5ZQvPDC8nhcD9cwoP3V
         xqM5rZg1CGhhiIFQk95IStD1BI2nBQkKZG5gTKRJvDKjDO5hM3HveQy50Ak2xc0ECayC
         0gcg==
X-Forwarded-Encrypted: i=1; AJvYcCUX3aKdJPgM9GqN75ArqjHnrKEXZhEuwOPbv2tgoLOWPR6JR7kXoUzrBIFFpLZIsXZ0xbFIaTddiKiTJO+OcM3Z@lists.infradead.org
X-Gm-Message-State: AOJu0YzM6D7sbM+Y9LDzReh5Q1Yz8eoLkfuKkEIwcndLRyYlgIo/p8DK
	WifQW62kPajOWKhSyC9WwwMjQRKAE3AGvqyWUO4z3sSOna7xFPCh
X-Gm-Gg: ASbGncvQ9gykYHDzsKYQuk4cV+LaIkfglaKd3lFGAloa4u5yhnqLh0kJ4B9KomuHeET
	vNFbas9zYJFEr2kHQrVtjO+h4yKnmSrZ+p4f0a0JZULQViNpgoqUKPN8IBb+wMdJuF/JAb+aaLB
	DDBhOavTW6nOQQroi7IWi92ZdtzWS25tb40jQv8dFNFzMDYs+f2f9FkOn+fiOu9+OUGti3ngf5I
	5YNU6uSKFFodFlF5VwjXC6Y3kheaCVJO8MLhWSgTQDFJ7S/rx3UFWnVKt1byUX8DR6LAZdNJ9zC
	C3RBQgd0BkdxB5dRhOnN7CKsTwjJ163EW5ycuZ2ujJ7+WMkTNE0kvWgs0Cln3crR3yiWDkr1kfr
	tug4=
X-Google-Smtp-Source: AGHT+IFGz3iPtgYgyVDkphxmllQ/7kN3j2BaMrz84yDHpAk+pc1wjYonA27kitB771cxOGozpwoJqQ==
X-Received: by 2002:a17:902:dacd:b0:21f:98fc:8414 with SMTP id d9443c01a7336-22593df9927mr55406405ad.26.1741706494802;
        Tue, 11 Mar 2025 08:21:34 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-224109fda8esm99146375ad.101.2025.03.11.08.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 08:21:34 -0700 (PDT)
Date: Wed, 12 Mar 2025 00:21:33 +0900
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
Message-ID: <20250311152133.GC1381004@rocinante>
References: <20250305132018.2260771-1-s-vadapalli@ti.com>
 <20250310210746.GA2377483@rocinante>
 <20250311051806.smcu4o4dxpngimth@uda0492258>
 <20250311072546.GA277060@rocinante>
 <20250311073216.ynw7rzmu36dwywij@uda0492258>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311073216.ynw7rzmu36dwywij@uda0492258>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_082135_664091_B7537FAB 
X-CRM114-Status: GOOD (  10.96  )
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
> > No need to send a new version.
> > 
> > I will update the branch directly when I pull the patch.  Not to worry.
> 
> Thank you Krzysztof :)

Done.  Have a look at:

  https://web.git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/j721e&id=01d04dcd6e80f63ca5e97324ec17c20553947e35

Let me know if there is anything else to update.

Thank you!

	Krzysztof

