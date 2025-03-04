Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791E5C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wa+NEDuZcYixtAYlNBsjFq3LjZunv0045SB9vkqgOdQ=; b=ahQN0UXYCG9yvu6qvDAIGvgVnf
	QMt3OUU7x0eo+1eUZ/+CLxRHg7iomGrGdo8lU8h8zIMe/AQMISfApqsZMiW9zcqhYqMNEn1Em4QMx
	q0Wb1QC6Ast8me6Fv13nl+iu7PYSAi45f08y9QGlgNKZ4FG2sywmEgc0Suf5g3V7jTkVZBT1fICO9
	dUr2XYADIXetRAefvkgQFz/wPdg7+PbYngQkwv+ywuVEXCvrmhMZ1R+y89InAvHgpi0PZlmwYLdv1
	0L6C9w/3Nq8hni4TrNTstqYaaNlWl2cEgorcq1bPQeMC7kVPx3xMLCwToxLvnjUN+qqd7fub5p3VU
	YabFWXUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXzt-000000061Xs-1iUG;
	Tue, 04 Mar 2025 19:32:09 +0000
Received: from mail-pl1-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWXU-00000005jsy-0ddI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:58:45 +0000
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-223a3c035c9so629145ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 09:58:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741111123; x=1741715923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wa+NEDuZcYixtAYlNBsjFq3LjZunv0045SB9vkqgOdQ=;
        b=upd6CU9KRnOX2bW6wyvIKwFrRxBjz2fKEJ63rn2qSRzFzXEN5+UcKBphZ9DLITSm7/
         7HWsgxIK+xRT2uyO4jI5CL4WkacRVWkdzNwpGlU2/Y+ECdMWTZYA7qcvG4kELXwBa1V5
         ZkCZ1Z7RKA8krjqB88rmV17AB7g+50/Cr1FFu77hs/3/lXbvPuInTr/c9bJAX0KVpj6s
         IyTFpyE1MiAbfCyhHZ/PMO7UxvtLHlrmRvYQ3/jMEVm0fepRoBGDAFaQc0cyh553N85c
         DOqJiTB9Sc3PxTkVY0hjQCgZghj7tHcHY6VoSif8aOp69zoXFRPYJoN2Rmsc/mwH9BVc
         b3RA==
X-Forwarded-Encrypted: i=1; AJvYcCXFOX3Ktmjdog9GPN2rjNkX6GLLv+cDFmeInq7hmbemYdw+UZimHMju21Ia8SSgrmMaJhE26UrfCCBjSlrK1YuY@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5FGOrrOquLBos4KN4QauPTaCgm0pGu8jPl0BVB5FFLz3HwiDe
	l708pRJTigyXUGMlAG6mXqZ3hdfo6eU+Vu/g4kHe52mFwhu/U2pH
X-Gm-Gg: ASbGnct+VT0gXZl5xjniMaaaO4wpRUDTiUrVzwnkTd+DhZd+CkEkBqCoNJDsQWOtHW8
	2FBKkGY6yBTxstoGdKE/FQBuRfeTHxZEvUGWvwVtr9EVB4k6RgX6Th2dL02K3y6IVtmDuzhyBrl
	J6wHEO2serWIRClXrAR/E/gQACkBSa/osJaVi+c/A33k7wLDl+LGx2cGM4mHKDVgl/sFwCtDxDh
	dhQThfDqG/3gvi9aHp4Zaim5b6baP5Lv0UoMNeunV9Rdcbm0jPjgofioMvv2B6vPc9FDCS0x51N
	3lPp9giIuGcHdipcd5lYtl9UZgyNBmqCIm8c89OsTcsDcwbNkfqgO7J0jkgiXWMAPaCv1kEA4FF
	NJnk=
X-Google-Smtp-Source: AGHT+IGxJOcaLpgJti6tTG0QJg+XMjirIbznemnIcFt44IjryR0KVwwvI5ls/IBoAD0A13h4IrVAXw==
X-Received: by 2002:a17:902:d48c:b0:21f:40de:ae4e with SMTP id d9443c01a7336-223f1d3ed62mr895285ad.9.1741111123284;
        Tue, 04 Mar 2025 09:58:43 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22350531a43sm98524575ad.238.2025.03.04.09.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:58:42 -0800 (PST)
Date: Wed, 5 Mar 2025 02:58:41 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Fan Ni <nifan.cxl@gmail.com>,
	Shradha Todi <shradha.t@samsung.com>, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, lpieralisi@kernel.org,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	Jonathan.Cameron@huawei.com, a.manzanares@samsung.com,
	pankaj.dubey@samsung.com, cassel@kernel.org, 18255117159@163.com,
	xueshuai@linux.alibaba.com, renyu.zj@linux.alibaba.com,
	will@kernel.org, mark.rutland@arm.com,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v7 3/5] Add debugfs based silicon debug support in DWC
Message-ID: <20250304175841.GF2310180@rocinante>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132035epcas5p47221a5198df9bf86020abcefdfded789@epcas5p4.samsung.com>
 <20250221131548.59616-4-shradha.t@samsung.com>
 <Z8XrYxP_pZr6tFU8@debian>
 <20250303194647.GC1552306@rocinante>
 <CAMuHMdWens9ZZrjNH1Bd2AN3PJEP1KSUGdiJcBCt0uPGH_GiiA@mail.gmail.com>
 <20250304154638.GB2310180@rocinante>
 <20250304171154.njoygsvfd567pb66@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304171154.njoygsvfd567pb66@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_095844_188914_43053F95 
X-CRM114-Status: GOOD (  21.88  )
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
> > > > > > +   ret = dwc_pcie_rasdes_debugfs_init(pci, dir);
> > > > > > +   if (ret)
> > > > > > +           dev_dbg(dev, "RASDES debugfs init failed\n");
> > > > >
> > > > > What will happen if ret != 0? still return 0?
> > > 
> > > And that is exactly what happens on Gray Hawk Single with R-Car
> > > V4M: dw_pcie_find_rasdes_capability() returns NULL, causing
> > > dwc_pcie_rasdes_debugfs_init() to return -ENODEV.
> > 
> > Thank you for testing and for catching this issue.  Much appreciated.
> > 
> > > > Given that callers of dwc_pcie_debugfs_init() check for errors,
> > > 
> > > Debugfs issues should never be propagated upstream!
> > 
> > Makes complete sense.  Sorry for breaking things here!
> > 
> > > > this probably should correctly bubble up any failure coming from
> > > > dwc_pcie_rasdes_debugfs_init().
> > > >
> > > > I made updates to the code directly on the current branch, have a look:
> > > 
> > > So while applying, you changed this like:
> > > 
> > >             ret = dwc_pcie_rasdes_debugfs_init(pci, dir);
> > >     -       if (ret)
> > >     -               dev_dbg(dev, "RASDES debugfs init failed\n");
> > >     +       if (ret) {
> > >     +               dev_err(dev, "failed to initialize RAS DES debugfs\n");
> > >     +               return ret;
> > >     +       }
> > > 
> > >             return 0;
> > > 
> > > Hence this is now a fatal error, causing the probe to fail.
> > 
> > I removed the changed, and also move the log level to be a warning, per:
> > 
> >   https://web.git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/dwc&id=c6759a967e69aba16aef0d92f43e527b112e98a5
> > 
> > Would this be acceptable here?
> > 
> > Mani, would this be acceptable to you, too?  Given that you posted the
> > following recently:
> > 
> >   https://lore.kernel.org/linux-pci/20250303200055.GA1881771@rocinante/T/#mab9cbd5834390d259afea056eee9a73d8c3b435f
> > 
> > That said, perhaps moving the log level to a debug would be better served here.
> > 
> 
> Even though debugfs_init() failure is not supposed to fail the probe(),
> dwc_pcie_rasdes_debugfs_init() has a devm_kzalloc() and propagating that
> failure would be canolically correct IMO.
> 
> So I would still opt to have my version + your previous one.

Sounds good!

I combined both changes (squashed your fix for the RAS DES capability
detection) together directly on the branch.

Thank you!

	Krzysztof

