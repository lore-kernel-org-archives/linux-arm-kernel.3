Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899D0C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 17:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDdp6JPsZHB45CMyh1swLsd39KS9lz9tRFCDBXIEVj8=; b=ePZQesWJYIh05LT0wYLe8EExgp
	qNvqviET8bVEPI/YUYjD/pHgsc4GCVpdJyZj/NPa0unR7kkSfJzJTNJqaJuS9Vj4xQfKJpoo97QfF
	xOvgcmkCSscKkxvdHKkjOs79jhPTbL7Wh10Xc89jQeMXdT+mFzR9Yh7w0E6rMxAxIBtwnrIIMlJnT
	AC5b8pD7mhFxabcMgga0pcLCviyUZct2XSePapiTqLNinjiiPDgIQ0VBCi1nIzVIehrOjwS3LSn60
	wJ92oyDBE7wR7aoSTdGETJ4zyyhlOb5S9lMCy0kbZ//4jXpoXIQFa0qguA5ei2eQpBeziNYA31EOS
	sEh+G7lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt8g9-0000000EqOf-1PYC;
	Fri, 14 Mar 2025 17:18:37 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt8eU-0000000EqCE-1VxW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 17:16:55 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2235189adaeso42477985ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 10:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741972613; x=1742577413; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CDdp6JPsZHB45CMyh1swLsd39KS9lz9tRFCDBXIEVj8=;
        b=mtSZvJR1xgIG/KGSzTUGupDVzXmD4EOkA3ju7ecMXUS/lbNsIrcoGP0b7365G8Now/
         xbLDpIb9VDcAGKAN0z4fwJsvYDrxmfY6xB/J08Mjv+pfAyrqCAE9B6Y2NtyTmAQK4bbF
         tnbWyRbG3yWBgu95tt8AAMSRqDlvVKuVlPRS+yZA534mk+5VyGH7lGwxKpPcSc7jE65n
         YMrGGM88ob15msutRVKqqekVXUq+ltUx6nu2nUOGe/Cu9rQKrpNfiLNvUAPK6WJonSu4
         Pgu8kw44aSSXxUi2LDvCupJYOrrDZmIxe0rm2k6Y0aaHVZO8Zl8dEbRDctiJmYdLAjBk
         wImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741972613; x=1742577413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDdp6JPsZHB45CMyh1swLsd39KS9lz9tRFCDBXIEVj8=;
        b=IlyGyyPtkFpc9HgxCowT8k+iYqbc7RcWnPuBIsv1fnpdF6Mw+wl0sARo6NcCxINRA4
         UewhRBfpU7TA0cPh/pjIr/MI7NvwoxRkkRsinNAgbwH6KmT6lGqYBJp0hyeAac+Kx41F
         Lpf+o2aZuXgtmlcaidSvxo/ddoNRQ2KQdB7KvgUuFTu8uhPE1Bph4hZiqPDdXbJmuFKc
         tAFRNmfViB+SJNPhkYyHRC5fFn6cjyzhy/XxBWf9wnM/wOS65X4FTqHW/rKifZivAdrO
         krcxvhSRjhki4KB8vGYS/JKkriRIpcWz/ECZL2/4QKAjBx0APd9O1PP2xZ3MFzFELC5G
         2f1A==
X-Forwarded-Encrypted: i=1; AJvYcCVNDOvHUQHXQECvB5iCIexBLGcNd+WHg/Lq4xwbUTat5HumnrEDp/oxFPzTmOF4kQEQURg32QvSffdawnyTBenk@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7wCu6Mozks3hw+PNTXoW3F0/6NYXVuwSNdYUiPJBJY7Ae0naZ
	o8xwVhNv8dtsRGncFlx5hsJL+o68YbKFMdXjYrRJb2LaL7m71V+0cFVx6ckRqQ==
X-Gm-Gg: ASbGncutk2xerqCFGzePK1G7lGP6UXyvL5MbFsz/lj0WUmiGuSo/azUz6I0zfcRbJ0+
	VWjX8yb4n2cjRqkf40Hf0NvM9tggURp53u+Guu7QT4f4qWPftB0wgraX7ieLe5OqUtkYmrGtP0w
	X7ZXGDTODDNgX1XBrk4zR+znhPqF820zpNdxZwWQWkPNtEmlhemkpoVsmEHDAEeKB/Hj4Q6PUnM
	hM1diyoNrrG34fkxPjCR1uApjmkqHQfat5oT+6v26PGTIQSUEded1oaUqnIBz1I3D9rCnecilif
	2UX92brXEqv4odGLT1uYJsaGtnLLLnIwh43LOPI/yVvmDOYWVqUp/FcAH3ZUK+hzjeyB6lxdWBE
	gtaJmmyZB7Fip7rQ=
X-Google-Smtp-Source: AGHT+IESV7lf4zH31HRl2I8byc8Hhj6aLdJrikr6gIoStXmwWR0DzwK8g18nrHPo3RniArFYGonCrg==
X-Received: by 2002:a17:903:40c5:b0:21f:7078:4074 with SMTP id d9443c01a7336-225c6617ddfmr87561165ad.7.1741972613410;
        Fri, 14 Mar 2025 10:16:53 -0700 (PDT)
Received: from google.com (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a84besm31146555ad.79.2025.03.14.10.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 10:16:53 -0700 (PDT)
Date: Fri, 14 Mar 2025 10:16:49 -0700
From: William McVicker <willmcvicker@google.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	kernel-team@android.com, stable@vger.kernel.org
Subject: Re: [PATCH 0/2] Add dma-coherent for gs101 UFS dt node
Message-ID: <Z9RkgY3gnx6Xp0nc@google.com>
References: <20250314-ufs-dma-coherent-v1-0-bdf9f9be2919@linaro.org>
 <0d7a8cad-adfc-4cac-bcc6-65d1f9c86b43@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d7a8cad-adfc-4cac-bcc6-65d1f9c86b43@acm.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_101654_398490_88A6D4EA 
X-CRM114-Status: GOOD (  14.19  )
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

On 03/14/2025, Bart Van Assche wrote:
> On 3/14/25 8:38 AM, Peter Griffin wrote:
> > ufs-exynos driver enables the shareability option for gs101 which
> > means the descriptors need to be allocated as cacheable.
> 
> Shouldn't that code be modified such that the shareability option is
> only set if the dma-coherent property is present in the device tree?

That's what we do downstream and would fix any issues when booting with an
older DT that doesn't have the `dma-coherent` property set. So I agree that
would be a worthy fix (which I did verify fixes the stability issues).

Regards,
Will

> 
> Thanks,
> 
> Bart.

