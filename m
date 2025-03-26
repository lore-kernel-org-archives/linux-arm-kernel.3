Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD5DC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 06:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5r6oCeJ4EMAeiLeoG532L2JW9nTuYagBmQstVPI3p0=; b=UWF+Zm5EblNRM4l392DuqVjBxC
	WXOxZbUftl7VkKHd244d+rpZJzg04fftCBol+Z9v2e56nzcYWxWjyU59U914VqgcB0gMGa1BxLSmb
	CCrbi+yYHd28TpVKpbnkZtXgDICdzdQl2sL/WOLoIEOj2ejGfIZVH8y/Eb9okrOQ/pAEOFDADEjMa
	pJ6F8rgVY4icg/KBYpr2QQwci4A/nsJk88ZdnR639KQi9vPX75ftscrCPRfkSAgYiWbS9Rlq1Toc0
	YbcJZGdeQIhaZ2cZVume/d6tJp02LYkG3lSO5r9PcldQCLuU0XD+J67GEgBPKwS6ZH4hTQsWTag7R
	LIW5KNOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKgp-00000007hqx-3nLD;
	Wed, 26 Mar 2025 06:56:39 +0000
Received: from mail-pl1-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKf5-00000007hf6-27L6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 06:54:52 +0000
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-227a8cdd241so9671755ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 23:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742972090; x=1743576890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5r6oCeJ4EMAeiLeoG532L2JW9nTuYagBmQstVPI3p0=;
        b=VE/8g7AkXHOZTQIOq64ZF/Ghf6+/w14qiPkpSfLEXmSamU18wg53AhvCf9nwMR3jF4
         KqQdeVPUpaGmGAK1NewmgGE392uBCZZwLIUfczgpL/vpBTQfWIEuVth/U/8CbBI7IiMl
         2wE5lPLmXfQJlgKyuulmRXIADPjt+o2e+mjiAfJn/7HZGIF1NhPt5X3MwCUo/qubIxwx
         xnAHIhfRtWWhx7SHV5CVjbeAMwkmF0R45NXN2/hcxuCBsuk+hK//D37kVlAxHhD3ZEHe
         slkVCbBuXXAeBFBQ1B/HoIOGvxO0bjW5KhzB4PA9a3ibiYhfRgBqI9Mesg0ToWIJd7Wf
         To/A==
X-Forwarded-Encrypted: i=1; AJvYcCVjaTBuj7Hp9BAg6LR8Rvfalku7PGBlns30K0AfsSfYGcyDzKhbHhXuRcKyF3UIjbb4MJvO131T3NzWzjXDVU/f@lists.infradead.org
X-Gm-Message-State: AOJu0YwfPcBh0jlhk/WNZX3uTkKNpSTmcVpoL9RvUGj9n9uGl143+0l8
	dbFJ++hq5I4MvlPrRc1bIRFfWSRBQxCuFYKZQLc8t6+kSn2vZYck
X-Gm-Gg: ASbGncvBoTzmBtI5HltIYZyTCdqCg+PPi9K4vieA9Z3XeBrO+ND8FcHIMe9ZXLJsPT3
	NMPTFydUfgB7IGLzqWV88Lr3+v/xBPYbnyBbt6tvNQdTq7xZTSW4mBNRMG95MzNCKLSrlNP/Z7v
	OZfxV6/qh5zTcf/vKBcZDYj7/vnZmvhJGk26ES3hLRgXo4XdlfDp4wwt/7zccsiMSXvCfYpe7Oe
	MNeDO1ZdRoA4muFPKWB65H0yVQxqf92wSqE/ddiH4PeG7UNyZ+9cd3Sf+36sdgUBErnPrDFwKjj
	PGdZuFD79d2uu8hmuOZaxwIgvufWmxDu8v8QWNO7ATYA47d7IUBYVX2Rjb/AF59Ia/V4QhVoh9o
	D53o=
X-Google-Smtp-Source: AGHT+IE6BS0dWx+A4CO2d0RKHQRRpGuVDJdQisEl5b1NHCFZIRGeaNjz7ChH04Mj+QdFzRg0J2Qpzw==
X-Received: by 2002:a05:6a00:e13:b0:736:fff2:99b with SMTP id d2e1a72fcca58-73905a530b6mr30978159b3a.23.1742972090093;
        Tue, 25 Mar 2025 23:54:50 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7390611d573sm11744324b3a.100.2025.03.25.23.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 23:54:49 -0700 (PDT)
Date: Wed, 26 Mar 2025 15:54:47 +0900
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
Message-ID: <20250326065447.GC2822343@rocinante>
References: <20250313055519.j3bpvsm6govd5ytk@uda0492258>
 <20250313160215.GA736346@bhelgaas>
 <20250314041705.v5j2fjulol5ywvyq@uda0492258>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314041705.v5j2fjulol5ywvyq@uda0492258>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_235451_544320_D87ADB59 
X-CRM114-Status: GOOD (  13.12  )
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
> > So I guess without this patch, we incorrectly ignore link-down
> > interrupts on J784S4.  It's good to have a one-sentence motivation
> > like that somewhere in the commit log that we can pull out and include
> > in the merge commit log and the pull request.
> 
> Yes, we can prepend the following to the existing commit message:
> "Link down interrupts on J784S4 SoC are missed because..."
> 
> resulting in the following updated paragraph in the commit message:
> Link down interrupts on J784S4 SoC are missed because commit under Fixes
> assigned the value of 'linkdown_irq_regfield' for the....

How does this look like?

  https://web.git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/j721e&id=b97b5b8cb603a4ba6b3f7f1b6065fa76e69bdb56

Let me know if you want any changes.

Thank you!

	Krzysztof

