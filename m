Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9ACCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 19:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shQ9F/S9E+ezjDmWjFc88/0zLU6nZIORFrqFjPoe6W4=; b=f6assmiJZWovjhMuQq4gTdsijV
	J9BCoTsfv8cciUcusRsPqydXBZ/8PgVFIcmWtjqh/X8v8lkyFifytXjwEV5sShbUn8Ri1dYd6wsMA
	AX0CgRdp2kDcdVdRJZlb4mBquOWjDeIbkBMNA0LwGSX/3GhQrBvWVvdYyHSsaZ/aJGQS1y9WjUf/G
	ks8cD+qAzY3LWXR8P9omyT/stFHjxg6mMA20qU8cN8+WKqMXMtzRL7icMI01LwyDG+/JAqtUjK6fu
	ldeNHxiV8tO/sk9i1EvOPqRwoht0xG5mLWHUwXVArUKwHvbjgmSAP7CCZ6VnoUvpkS1Hu3JKMYt0A
	QDh9ix4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18KI-0000000EcCd-3pl6;
	Tue, 23 Sep 2025 19:05:25 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18KG-0000000EcC7-3Nj7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 19:05:21 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-27d67abd215so38585ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 12:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758654320; x=1759259120; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=shQ9F/S9E+ezjDmWjFc88/0zLU6nZIORFrqFjPoe6W4=;
        b=no+GBBTDgI8FtDSfbAet5Bfq5yzh8U9O/vskBBk7V3+efiojG5PaDa0zmMW6O0xXgK
         SrLMNukTR2XHZJ1bs25a9wdgmdY4pbWqdbeAUN6CZEteaCez7HasU5du6myEdmlmWXBu
         NUr/R+xm9KHKeeMSgyVhmzrbH4tq/DLNwdscPRK2Za40gtE/KxvmyZekRWWSkV6vXJ0j
         rk5pJi3j0WAhuNm/1lVyBcv4yo39w7wJ9jEbdMTY1HsqDJbo7nCnJFqK750meyl+nP4r
         84F5+CXsQr6H0rGveWc6+fUeyTA7RQ+25Pl7nVDbTrCCb2QrFHxCbKugYdz7E5px18Ju
         T7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758654320; x=1759259120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shQ9F/S9E+ezjDmWjFc88/0zLU6nZIORFrqFjPoe6W4=;
        b=o8BcRx77S/HqS21FJd3EalUbg6BbSB/oHu8yiDtmLYjaZtRVV/TZTBjfixAb+IpYlY
         HFSRTmJZXNsKBlvhCs6oQcoytmIA/CsE5xJiHptgV2HvhEplcvNbETYVVvdkHMygmzpA
         lg3TzmH0cU8hZB/7pUZd0lohWaq0FuRX0jHoA5HYtwc+aZ8HQt9psd5GExluAQfabTSk
         rSxIrjQVV6NDa4XJER1z8ZYXIBr3HvwXL3Pcn3TX7hn0S5U3hSDZa0tKKczUUsZ5EjQ2
         dJ4a8fHzfGhf712DWEM4w7BjrIgKSQxsyojHKz+sDKQvG4NYan2o+B/0PQsQVdV+Aw0T
         nqXw==
X-Forwarded-Encrypted: i=1; AJvYcCXMWK3OWfz2DYYz0Qg2AHcpbuOo4FKbxw/aJbLAtD5pAs17iZq8XYGBOvvLhz0OuI+2QizPEENbBVwywVlxrSg4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx56RAxO676CVY3GOno3tcD0e9aNO9+slp4J+SDdQftKEzxpXnm
	v7qpFaprBF8Tm5KqVkt+YMQUSlqKxdyB1sGSwHKBZcaYCnLvQNL6UYBUWdksaoavlg==
X-Gm-Gg: ASbGncuFKHeq7aSiuvxTeVObxj3eNp67YfH9jCx4CWWkOsLDM4T5yyNltE+Y8eWyPP4
	ZZyZmsvGmfcldTWOAM0/s7NwN8A68J0ApsGPfNm4Z7wxXdTkyH78gtoDfAHVir9654ztp5FXqX+
	JRtNsEUwo2GL8HWdgxa+lfojLqwe2Hy/KZ86zhHbYSfq4KbLAjssO51z/ZOPqFU/9pUh/TJaTQy
	i2VEJ9h9onU7zjX43CmXB7txA6mcoJd0NZE3DWRxCRbi+x0onfP/XuzAgo+vK2Gby/+gp7e0G5G
	VWRy9JL8D/tLzFYW9ap0j2rz5Y9AP7ZVFFgLqnqgOO1GkTwKzqXXZoKpO4gkFL02hddOhLRx5wq
	eXZvL4g9kGoVUmWvz5tjlgqUNFkG1Mhv1JIfM3g83TkSqCptq1Id9SeNwhxBCBRs=
X-Google-Smtp-Source: AGHT+IHVaOaeuEz2XAlC49A/lUlZuiYJ4YEiwzji5f5sfrXloiYMH7AkD2MYjlrCozMP/2Heq38dGw==
X-Received: by 2002:a17:903:11c7:b0:267:912b:2b4d with SMTP id d9443c01a7336-27ebf1b61a4mr578145ad.7.1758654319543;
        Tue, 23 Sep 2025 12:05:19 -0700 (PDT)
Received: from google.com (23.178.142.34.bc.googleusercontent.com. [34.142.178.23])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b553d5b35b4sm8345090a12.2.2025.09.23.12.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 12:05:18 -0700 (PDT)
Date: Tue, 23 Sep 2025 19:05:13 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org,
	joro@8bytes.org, jgg@ziepe.ca, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v4 3/4] iommu/io-pgtable-arm-selftests: Modularize the
 test
Message-ID: <aNLvaVHgOh-uS2JS@google.com>
References: <20250922090003.686704-1-smostafa@google.com>
 <20250922090003.686704-4-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922090003.686704-4-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_120520_850546_B5BF4186 
X-CRM114-Status: GOOD (  12.58  )
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

On Mon, Sep 22, 2025 at 08:59:27AM +0000, Mostafa Saleh wrote:
> Remove the __init constraint, as the test will be converted to KUnit,
> it can run on-demand after later.
> 
> Also, as KUnit can be a module, make this test modular.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/Kconfig                    |  2 +-
>  drivers/iommu/io-pgtable-arm-selftests.c | 36 +++++++++++++++---------
>  2 files changed, 23 insertions(+), 15 deletions(-)
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

