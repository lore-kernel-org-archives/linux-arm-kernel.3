Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B9EC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9fUAMMSFfpBE9zde4jyNVpOAHmdzHBHI3cebG5cFgg=; b=O0rEncZIJyDfAYXcxT2USzuSXx
	lbWvJ7j7Z1EwhcTg/9TyMw5+XuzZIz1sTtliaGGQDOPPRs5c2gMRCxEge3DanGvpLYdLgN5JLa4ex
	Rve3dxFboDiK8zLcmheqg5O9BdFlrly2DpWR0BTH5nDB3RsrjyU8xGYH83Atjqpxw+SxLsAU7Ntt7
	frQlmRT+9y6g0fbS6AHBxGAWz7jqEaYv3trcFX5rAF/J0j22CFpj+5AJAK8fWj5KVU9OTxtOmvybJ
	w+ESVOqEruf1hF96LSo+Nkd8rohLn4imvIw/3oBfgIWix+PBTVsqJ66W+rSVUAV9GxXwPmr9pxTtg
	1yjrPW8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy0i-00000000L7e-08iD;
	Tue, 25 Feb 2025 16:42:20 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmwE4-0000000HZs7-0ZZo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 14:48:01 +0000
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22101839807so14652495ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 06:47:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740494879; x=1741099679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9fUAMMSFfpBE9zde4jyNVpOAHmdzHBHI3cebG5cFgg=;
        b=YeBoVNKVkmWSbQq8S/GuKNCh3H142w3KXnn0HSULPBFWJTj43yViOHfgvQona/uSw9
         PWWi8y6+vLyzn8rKTAbAqifH5o+dONDZpcJLQmm7w3BEQctOQAtizYnTywdAi02RBBWu
         BIJf60A3gg5Wl+f4ql4FyZzmxGLTDF5TQbqDWEvlNLcEY9hwRWiYJ7pY/UmbMvWJSEpK
         J+FwoAN36+g7dsCUzL14eta/0/ndgnIdMUY58hivY4kNwCIbh1VDdyPqVrkJxjvI5YvA
         sUUaq/sX5kZy0l/0jlRHu3x/0HQ+ucPUkip1Hc8ZdP+Uc2figZrfDw2fU3UlAPf2+crb
         F3sg==
X-Forwarded-Encrypted: i=1; AJvYcCV4UPFDR7l/zB0rD+XnWe5zxtXwsT6K3PMiB7vIj9okOI4dGG1+OLcfMEXUs7cR9cAdiWYZ8BSMDyLQwKj8W+RD@lists.infradead.org
X-Gm-Message-State: AOJu0YxX5CZkH+tAdHFi7yeL8wE2DMpEDpxjCq4blWJ3q8vPNey07HQJ
	/TlsZ8WKLS1v+i/ZqUwew5fcD5+IWO1FcB6Rts5ax5KI+OvXBkI8
X-Gm-Gg: ASbGncuUthBlRASGcimy19EFKYL/SImDJI5mUtxRGptT1CpFFtFrC9E1+r7gxvR43tv
	XoP2dJz5i896ytN39SFtr0blIZzj2WNFre4HzUlaaAveWQ/xHocIxA0hOM/1nFVklfZdQcP2AwT
	yJFiIO3QXO9YkVZIK9IZym2cMNKPkBcQQ7+QNwxsUuW21K9MGKCIrFWfgW3Pl/lnriR9tdVTAO2
	CKXU8ZArY5OiyQywkiXYcTRA8KuCUR/txkDAAMJlE0Okv19CjphEBsumjJqt7k0aWvYWFvzk5D/
	HiyfhV7AhgAuq5cJGurprVs7emfon8uvj3R7xvWHyB3VQMwQF/IYSVFPK2D8
X-Google-Smtp-Source: AGHT+IFJlOv8carYE6+UU235OdYaIvzKkWJV3Kr/Y5yUb/0j804xN8YoKlVnPeDtE+lBocpwiZJ8YA==
X-Received: by 2002:a05:6a00:c92:b0:732:1840:8382 with SMTP id d2e1a72fcca58-73426ae9b30mr24918884b3a.0.1740494879299;
        Tue, 25 Feb 2025 06:47:59 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-aeda7f8538fsm1488011a12.31.2025.02.25.06.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:47:58 -0800 (PST)
Date: Tue, 25 Feb 2025 23:47:57 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, manivannan.sadhasivam@linaro.org,
	lpieralisi@kernel.org, robh@kernel.org, bhelgaas@google.com,
	jingoohan1@gmail.com, Jonathan.Cameron@huawei.com,
	fan.ni@samsung.com, nifan.cxl@gmail.com, a.manzanares@samsung.com,
	pankaj.dubey@samsung.com, cassel@kernel.org, 18255117159@163.com,
	xueshuai@linux.alibaba.com, renyu.zj@linux.alibaba.com,
	will@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v7 1/5] perf/dwc_pcie: Move common DWC struct definitions
 to 'pcie-dwc.h'
Message-ID: <20250225144757.GA1660448@rocinante>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132024epcas5p13d6e617805e4ef0c081227b08119871b@epcas5p1.samsung.com>
 <20250221131548.59616-2-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221131548.59616-2-shradha.t@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_064800_171738_D227BE7E 
X-CRM114-Status: GOOD (  10.71  )
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

> Since these are common to all Desginware PCIe IPs, move them to a new
> header 'pcie-dwc.h', so that other drivers like debugfs, perf and sysfs
> could make use of them.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>

We are still missing feedback from the perf maintainers.

Especially, as I would like to take this patch via the PCI tree, if there
is no objection.

Thank you, Niklas, for pointing this out.  Appreciated.

	Krzysztof

