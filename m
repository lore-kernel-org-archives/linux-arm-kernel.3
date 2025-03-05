Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD86C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 07:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ViTLKygErdiplFKeTsB+hgfn7l7mcJeHlaXg11bXs0I=; b=X3iy5L2KypQyUdoMsQf95FEQNd
	TVRfm/h+a9/dscyuazZfG3peoVy4epzBJbz5Qdghb8j1ghnnoH+D9ZfBPnaEs60SBIhjqm9JpwLmr
	pla5/oZ+gz/ve2cCSi4nXHHDrBSj/7o92A0KqmSTB3UJ8/TJPOyHPWnTd995eOmzgnAEFwAnMdgkb
	XybGsVlbd0xQw/Obuvd6ovfoecjKMSRzH2BgsYVeQsTBTHoa5hCJS4dmH+wl0N3QkX4FlnuclbetF
	MlTEANf+1AO06PypBCu5Vd5lY0P63SwJG8I6DeAFmW84CmfuU/udEwUoKEh2TuRVf4Xc0kWbhen9U
	3huzNbzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjco-00000007Igw-1k3u;
	Wed, 05 Mar 2025 07:57:06 +0000
Received: from mail-pl1-f175.google.com ([209.85.214.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjQw-00000007Gyz-2lBS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 07:44:52 +0000
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22349dc31bcso114359285ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 23:44:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160690; x=1741765490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ViTLKygErdiplFKeTsB+hgfn7l7mcJeHlaXg11bXs0I=;
        b=sLh3XBD/nGCX7TWNL52/4fZpJHG/e4qyLB51fNbuQQPrKhZf2XBcBTcBxDDJC4r1ws
         4VRknU1mWoB/FRqe13+ctDIDR5Wzi1EbvWp8EI80hBH0pYE3LQhRzvCapWOlA9kBYLml
         Squ/MWS6wHs6BX5x4n40q71JkqVQeOHimb51pWzt1SopDNamOTSyO5X07BhuZLjyUHur
         AwswM9sDwHjxINrCjnwvQOSoby2opSye6m5RC3V6h+Tu5ljCKVmGhhzBhGnW5z60R6Rj
         Ua5PoiZ3V6loYU2J79060GeCUWOJArovZ5kDAy3VKwypDjcUw0Wd6szB76Y4/gii7yOF
         VEbw==
X-Forwarded-Encrypted: i=1; AJvYcCXeE6qcpxuQyITMbtuecxjLTtZt7eyqQRG+ermc6dnj1wg1n4qgJUmJG7E0Kjt0dXjGYQIACAmUuCOcoVSD/rqZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx+AYTLsdZoNaP59PYnijvWlY2m0zkHcgwWltRboPkrVhk1EGf
	PqKgLrIR97AwZUYdlOYxwOjxQ4KwSuR0dHxg/Y5rzr+NabBaEXBB
X-Gm-Gg: ASbGncvlVJjSeJ7B1+z3d3oJAGVPPVEvQE9A7GtkKI4N7LV2ILoxADpIkSkhjAMIydm
	JcOjcgUyyEUiCsdOm3GsHbVOnpXJ38LLYz5U+1BOjIcMAiztieRLSy2uKlhsvzFFe+FH9Vzfy7A
	GUF3/s8LMvP+vSq/barN5RiWVVY5HIk96UsvOTmPu0x1EiM+2Ent3zFOXONWHUwWRaxbXsicneY
	NMuyek+PLgu18BoElwm89KbHOTAcUe1c08kYvz7s47mIBDaAD9jXzGAygaQbjk+xBQ2nv7uodVn
	8YuEZs93Cw8fiRQ+2MplpFLXJUZ4Z2pK6v9H1Xjuly44aDvgfHnhp0zr+TYmejvmT5oE3/Phlpb
	H0Io=
X-Google-Smtp-Source: AGHT+IFkECmzs4mja49rj6DCPMiWTzRluzyzBjPs7V57SQJNUYO0IDGjrEZGfcUcPpPyncsq8K2mSA==
X-Received: by 2002:a17:902:f548:b0:220:f5d7:6405 with SMTP id d9443c01a7336-223f1c80b35mr33650085ad.16.1741160689723;
        Tue, 04 Mar 2025 23:44:49 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-223504c7efcsm107522695ad.154.2025.03.04.23.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:44:49 -0800 (PST)
Date: Wed, 5 Mar 2025 16:44:47 +0900
From: 'Krzysztof =?utf-8?Q?Wilczy=C5=84ski'?= <kw@linux.com>
To: Shradha Todi <shradha.t@samsung.com>
Cc: 'Geert Uytterhoeven' <geert@linux-m68k.org>,
	'Fan Ni' <nifan.cxl@gmail.com>, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, manivannan.sadhasivam@linaro.org,
	lpieralisi@kernel.org, robh@kernel.org, bhelgaas@google.com,
	jingoohan1@gmail.com, Jonathan.Cameron@huawei.com,
	a.manzanares@samsung.com, pankaj.dubey@samsung.com,
	cassel@kernel.org, 18255117159@163.com, xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com, will@kernel.org, mark.rutland@arm.com,
	'Yoshihiro Shimoda' <yoshihiro.shimoda.uh@renesas.com>,
	'Linux-Renesas' <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v7 3/5] Add debugfs based silicon debug support in DWC
Message-ID: <20250305074447.GC847772@rocinante>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132035epcas5p47221a5198df9bf86020abcefdfded789@epcas5p4.samsung.com>
 <20250221131548.59616-4-shradha.t@samsung.com>
 <Z8XrYxP_pZr6tFU8@debian>
 <20250303194647.GC1552306@rocinante>
 <CAMuHMdWens9ZZrjNH1Bd2AN3PJEP1KSUGdiJcBCt0uPGH_GiiA@mail.gmail.com>
 <20250304154638.GB2310180@rocinante>
 <061201db8d25$dd1e2bd0$975a8370$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <061201db8d25$dd1e2bd0$975a8370$@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_234450_697186_3D89C468 
X-CRM114-Status: GOOD (  13.97  )
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

> I think we shouldn't move the log level to be a WARN. I believe many
> controllers might not support RAS DES feature in their design and giving
> a warn dump would draw unnecessary attention.

There will be no backtrack printed with neither dev_err() nor dev_warn(),
which is what we were using here.  Using dev_WARN() or the WARN() macro
directly would be an overkill in this case, indeed.

> My opinion is to silently let it fail unless the user is actually
> interested in getting the RAS DES feature up.

I think, what we have there now is fine.  We don't error on the lack of RAS
DES capability when the platform does not support it, and only return an
error following a memory allocation failure, which should ideally never
happen.

That said, have a look at the following:

  https://web.git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=controller/dwc

This is how the code looks like at the moment.

We can still move it to dev_dbg(), so basically suppress any errors or
warnings from being printed outside of the debug log level, if you think
it would be better.

Thank you!

	Krzysztof

