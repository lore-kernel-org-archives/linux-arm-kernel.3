Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2971C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 06:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQ7ByzFqI/4JyRD3MlNQLQW2E98MhssCvFL4d65wbGM=; b=g4PLpz5zqxbAlWGaa6jLt6dPNn
	QLTXETNXnDOBygQZ2ArfGK9joOBwrUxd0KqGN3YQBiADJ3TmUTuXP1hgUbf2sBf3FZM0NeI23v3Ir
	XSxkP23KI94S3+RVvVCnpLVnc4Z0XyNQh5vVDSvNE/zYS8GQR7C/ryTY/xzvmUQ6H3J0Ig0LorO+A
	iuXdJVG7drHJd2pCSKFCbyINDRGYqO0IUUZ0hWJwaqC3PEtIW1cajVrmN2BXXOLMgQd9VMojx4AH1
	uIJsDUlimhxKBi3o3NCIN3IpQo+c72Cj5Wp+nhIcmtmJQ4HZKJdkZo7kP5hkav/FtpS9braf6TgeN
	SDx92iXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXN8-000000069u2-2pAp;
	Fri, 03 Jul 2026 06:27:34 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXN6-000000069t4-2L6D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 06:27:33 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-37df416c44bso198268a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 23:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783060051; x=1783664851; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aQ7ByzFqI/4JyRD3MlNQLQW2E98MhssCvFL4d65wbGM=;
        b=R14z3guwF7nKkmIOBzjbw60b0rxwRw9Qic7Ug5FJlX6pgtjkzZidFy2f4kSmuj+w+m
         vn4l7NsTdvkedhZQtFIcj9k07YS1mjBq70M5GeNnlHIab3b6jcq8sktwEztFQnyc5NY3
         c66QlTDatXvR7iNww9ImTfup9ZmyBbTD5eTLQTAdyBNH5ywdLUEhyGuJUGGXRX/pXbM8
         Dr86Bg9gYyBH9e26WBMB9Wx/+3HTnhUeVhqTN9Q97NjpeYg5Puz7XH/FKx9MiGcHUKir
         8LRt7yZCXSUpBmT8rYY4i5a5fZaCEwp+aBqzb08qfooW2vSMiz4eKZiT8tuKDt1QgAxZ
         hTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783060051; x=1783664851;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQ7ByzFqI/4JyRD3MlNQLQW2E98MhssCvFL4d65wbGM=;
        b=EOMrld4LlQtTd9a+nkPMyYtrHkdjbK0JVR5wFXHuOl3iRV0Mw9l8bFZsEDJjBGAKFG
         5W+V0FsMG/C0wGfmtsEYwbCTY2/EnbJ/OLma8lFXF6mKyqxI9pr7rM/TGfuxCmB+mal/
         ChIjNs5vxkCL48eQkg9/gT1CJEfxsa4QI46nWYdrnSK1UiiATMuuLD3XRzVwLW71g38Y
         r6dz9JepkmNfxy4iQt34iI8QeFBfuXdcHPzXs4/oSDEt1xPJCtVANPxwd1O0CCjoGPEL
         KyHt0GE3YzJruVgu+ApmoXZlbQE6sz042LphGaQU+VekxT6weHMKqFUE49x3lOdIblgR
         +Y6g==
X-Forwarded-Encrypted: i=1; AHgh+Rq66Ne/gOgpPoiyYwdMi6HTlK4kJSEY582JmLopGcG7OOGtmk55/51oXiDAGDIQF2uNdSd5B/Yfd3inWLQ3WcLq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2L+xRHFOrNEAKR4KPQUT7KUrOT0BexCk77s0tk/RS/qqjH2ey
	U/NmPH96SW1c/9UdkAYy8xZCV/KkkRpwDIo9ENeft5T22yNEr1UvdiLJOmBVs7IJ3ZQ=
X-Gm-Gg: AfdE7cmSe44L0LvVgDFD+nt2BSpfHcZMn6QCQtCXTTzbd+epIOqLGfcvCWOlBsxrSga
	Uzfa7/DCLTO+2EIYliw2Mk8+kzMYjSfSbG6VhGRYkGIzW4LitqmZbnGK7iDIdPMF1X56HKIFlb8
	aE07FZ9PRgKLWB5pYYHlb3ZSxl5+nhCWZMNCfZup0zVHti2SXhAS5DKQn8koUJgTdaS+ktj5u/5
	92QCZf0x6hcgQjfmDn6V/W3Liu2OTYwcWkIrua6IpGmgVXBf1Igw9u5aRIUNNEytUD1xjjNWwDY
	Fy2x2hsPmQbm71lOWlrs1uIxkk9EosHzZ8pPcEL4VAESvE9e0hmNmw8TEexZgfQ/iQAQW3LDRsj
	CH97Dk0YWDApIJt7BPwKuXwISn+uLpTcDlz7PCT/+Bw9scL0T457YERLSNgYq6KbGvT5j1BdIKJ
	gsgtUoQK8m5xTf
X-Received: by 2002:a17:90b:3943:b0:37f:b447:def8 with SMTP id 98e67ed59e1d1-380baa8eaf9mr8701638a91.25.1783060050885;
        Thu, 02 Jul 2026 23:27:30 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm15733594eec.8.2026.07.02.23.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:27:29 -0700 (PDT)
Date: Fri, 3 Jul 2026 11:57:27 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: sven@kernel.org, j@jannau.net, neal@gompa.dev, rafael@kernel.org, 
	marcan@marcan.st, maz@kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v3] cpufreq: apple-soc: Fix OPP table cleanup
Message-ID: <ng7qv3vtfyhzklpbsghkiqezkq2foklddd6huusb5bfsd2xksd@u5hgcjtwnac4>
References: <20260703062049.1459175-1-haoxiang_li2024@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703062049.1459175-1-haoxiang_li2024@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_232732_614877_8C8FA3D3 
X-CRM114-Status: GOOD (  14.30  )
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

On 03-07-26, 14:20, Haoxiang Li wrote:
> apple_soc_cpufreq_init() adds OPP tables from firmware, but
> some failure paths do not remove them. The driver also uses
> dev_pm_opp_remove_all_dynamic(), which is not the right cleanup
> helper for OPP tables loaded from firmware.
> 
> Use the cpumask OPP helper after the policy CPU mask has been
> populated. Pair it with the matching cpumask remove helper on
> failure paths and in apple_soc_cpufreq_exit(). This also removes
> the separate dev_pm_opp_set_sharing_cpus() call, as the cpumask
> helper loads the DT OPP tables for all CPUs in the policy.
> 
> Fixes: 6286bbb40576 ("cpufreq: apple-soc: Add new driver to control Apple SoC CPU P-states")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
> Changes in v2:
>  - Remove unnecessary cleanup calls.
>  - Remove OPP table from apple_soc_cpufreq_exit(). Thanks, Viresh!
> Changes in v3:
>  - Add Fixes and Cc stable tags.
>  - Use cpumask OPP helpers.
>  - Reorder init and failure cleanup. Thanks, Viresh!
> ---
>  drivers/cpufreq/apple-soc-cpufreq.c | 36 +++++++++++------------------
>  1 file changed, 14 insertions(+), 22 deletions(-)

Applied. Thanks.

-- 
viresh

