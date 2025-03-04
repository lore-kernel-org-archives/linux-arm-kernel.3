Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11194C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 06:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/NqaLvRye4Cq0LyeXwhNE1kNW2vwV2kBs1us3jXtWU=; b=icrFh9+dYeSHE+ZQQQvrcGG2iy
	JoM2+Tesljd0wNe9buLUCIMZwSvzL0w2/xZ96Fzu3joMxW7RaL0LfiJw6gLZFryqk5TwHAt5gljYf
	ehufrNWBWGA81im8DePj/vvtR9QU9LTQ9cwrBiPuoA6ePtexSj8oW8pLpLIc0x5SoS00hCsidnhSQ
	uCgR+yK2rl+WIr8WUlqW2IwxaC+6+qX5vBRuid1Uq7L0/HzeLHBhm3qjyJx1Iv+ebp0nhE2pT8BRv
	FcVZ6Enh+CxA3lmaC9cFZpSWB5qBv+ndAcFaY07AJci41/tK0/1zJyobD9IK2o57OYms9OF0GWZB4
	niPsJJQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpM4O-00000003LGL-0cMB;
	Tue, 04 Mar 2025 06:48:00 +0000
Received: from mail-pl1-f175.google.com ([209.85.214.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpM1Q-00000003KVT-0id0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 06:44:57 +0000
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2234bec7192so83733995ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 22:44:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741070695; x=1741675495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/NqaLvRye4Cq0LyeXwhNE1kNW2vwV2kBs1us3jXtWU=;
        b=bvusGvL3/An51OZI87VZ+dUFjA47RpPSFrvMWlXfqsfvo9/Iub4JQ6T7WT98se2Ko8
         SW4rWnQwJHODlZBKYEpJykx3x/nBxvzfUj8t4Ry3/8/MGby34sJur8DFrPL+kPGXv/As
         xVUDbcnm380SkHsEx6dMtAbZQBZoFrLO9JbW5SZqodGaTzek7xqJp+iFn3Pme/QyCN70
         hRikoYdG85cW/YHQkubp71aiQr+UICaJaT0SQTb79tqBaXgbHhB23lmC6iAqVJFmAfvR
         MHiyN/qtv56+06bQWuGFnBf/Mu1svqqK61yMbGCjghucB1tjzge08IrlFN/Aa2r8K2qR
         vuyw==
X-Forwarded-Encrypted: i=1; AJvYcCV5tcsnT8kegZ8VPgtcHPlzkyAfBilq++sEQZnxxgCp3x+T9fMTu2wsHNqP0G1vMbE31QghXJRxchRVG5J37/Z5@lists.infradead.org
X-Gm-Message-State: AOJu0YyoLmJ+U3nBx7RncY1bQhioBYtxZuBv1FVFg0br8/1YoE/QJwUB
	wxEn7OWe/FYamTM96xh5Rf6c1/hm5TP6Nu6MFmjn3fh+rZdKTTKo
X-Gm-Gg: ASbGncuGSsVWZm5MVVxNcRUiiosrSZn3Jvr3BFXO3Zunj0cgaOqBzRQ4sECbYdnwI3L
	fCaLLeaZKzhG4ykIx3lzm68cS3ojmrsVeQzZptumk5f5jlv51ylMJQettW6uDTMYcBwxcBBqp1f
	/rEU0rP87TZpWu7YJnv1Q/FRJ2iZNgl+dsbpdBGMJicKMh6f0d0BBd65SxagrWHNnyabr6o7HRt
	O5RONKPWVULvIqwvsWzo9KzGyxG2UcBrgPapEoC+vnzZ9K1QtzonI1NYVO35VRh865rq42WR5AG
	yBePlzyTVLax9mvTo12iEEvTaWgpRMIiHAOCJN/4QSPq0JVl/Ga73xqGQ9piRJFiG8uIhKPrhu1
	CRB0=
X-Google-Smtp-Source: AGHT+IHubZ3OFPwp+4oYsLj435L9jVCvESdk0kEc9gOPZuvwk4jvcIWYRz8EL7NQ2ybDdZ4+kOA+fA==
X-Received: by 2002:a17:903:244d:b0:216:69ca:770b with SMTP id d9443c01a7336-22368f73bbcmr222052325ad.12.1741070695120;
        Mon, 03 Mar 2025 22:44:55 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-223504c5cc6sm88516415ad.112.2025.03.03.22.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 22:44:54 -0800 (PST)
Date: Tue, 4 Mar 2025 15:44:52 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Fan Ni <nifan.cxl@gmail.com>
Cc: Shradha Todi <shradha.t@samsung.com>, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, manivannan.sadhasivam@linaro.org,
	lpieralisi@kernel.org, robh@kernel.org, bhelgaas@google.com,
	jingoohan1@gmail.com, Jonathan.Cameron@huawei.com,
	a.manzanares@samsung.com, pankaj.dubey@samsung.com,
	cassel@kernel.org, 18255117159@163.com, xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com, will@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v7 3/5] Add debugfs based silicon debug support in DWC
Message-ID: <20250304064452.GA2615015@rocinante>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132035epcas5p47221a5198df9bf86020abcefdfded789@epcas5p4.samsung.com>
 <20250221131548.59616-4-shradha.t@samsung.com>
 <Z8XrYxP_pZr6tFU8@debian>
 <20250303194647.GC1552306@rocinante>
 <Z8YWILtSbQnvVqbF@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8YWILtSbQnvVqbF@debian>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_224456_211436_0F546DEB 
X-CRM114-Status: GOOD (  13.35  )
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
> > > What will happen if ret != 0? still return 0? 
> > 
> > Given that callers of dwc_pcie_debugfs_init() check for errors,
> > this probably should correctly bubble up any failure coming from
> > dwc_pcie_rasdes_debugfs_init().
> > 
> > I made updates to the code directly on the current branch, have a look:
> > 
> >   https://web.git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/dwc&id=1ff54f4cbaed9ec6994844967c36cf7ada4cbe5e
> > 
> > Let me know if this is OK with you.
> 
> It looks good to me.
> 
> Feel free to add,
> Reviewed-by: Fan Ni <fan.ni@samsung.com>

Will do.  Thank you.

	Krzysztof

