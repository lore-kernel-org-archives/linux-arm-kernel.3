Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF546CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 19:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=loCR1eKtWPQr2AOCV7oFDbaaSxP/4srZDyqT1RiPxjU=; b=2IkJoMj5ATRlCfo5/7irqCikON
	jSA73lleTBlFcGhbftDeKrGQ4+fPqqbri5dlCJysIYEsZNvS5k4QwfWPxtLMfo2WZdSJ64QYN3PVT
	K2zO34SWq505XvbJbNLEkDpIrXss/xvSZW3UPsbMTTMJem3IPJffWH6K2PoyZaMngzH/itd2D2t/R
	JwKBdmAKgh3jI6zFoj7zr8mGgeTjdRJhmdVTFY9hDXY03u0Mj/uB7J96YODj9MPlurc/cpVKeS81L
	+G4Bed2b8OQHuInORq4hAHuQiVkIAjdxWgjMAtW7MdVbQC7n9m8xihTyeR896+IpFsk4EEouHlZTG
	cFgoUscw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyy0D-0000000ELj0-2nfj;
	Wed, 17 Sep 2025 19:39:41 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyy0B-0000000ELia-0GmZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 19:39:40 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4b38d4de6d9so1193901cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 12:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1758137978; x=1758742778; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=loCR1eKtWPQr2AOCV7oFDbaaSxP/4srZDyqT1RiPxjU=;
        b=hM7T9yafr6T26dOxxb+kyXBuBvA7ySSVVxQ8FRr7xJ5VWDQPZciO+0lv4FPcHW0MYK
         2ASzgRmYmQYf2dIjk5ZFsZU9rBi1Y+KGbILJgVvS+T07jvURL0476nJk3p1rvpUK8cdy
         Yhk+lndwmIueu+Sp5RAQWZoLzv2fPKHr9aXxRRWVC8WYLYKvvRVol14F7rd5yGak94ai
         4XHpXyDc1SqqJ8R16akzMrRejE5RB2A6zrrJl0xC3pcbPsigFxZfcXwN1qaJTWGOal6k
         1cv7Rf/GJ4TymsKEzi2f44XRGSOobOWiHKSnAhfTwTjQFCgjgnY10ZPFhOEw5q0cW1W/
         9tkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758137978; x=1758742778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=loCR1eKtWPQr2AOCV7oFDbaaSxP/4srZDyqT1RiPxjU=;
        b=Qdx9BLyUW7s237YjFYvB62Kqh7fYPYwuzso1U8UMyNxoMCSSaWHCBoWsIgYALs/j6p
         BliZwMIdEfAfGBmkZIGjf0QsJpZGbx18I97ftlJWZv6lN5CYn7QgV0l0MuI0W/eCN/gi
         k7ldPW1XnMahpO4KTkn4TeMlA2zm9v3yxPBuqPRwKN/ApVMn/YNj9Yksb7kORuYRVV7g
         /SbvC0MSXJtTdovVpKL8EgOaMjTnQoynGhMBsNTOT/sLsW7YTQsdfim8NPc6RkARz4h0
         Qm+WQb8rtmZZiHMBjIK3Sd2bzzErLauZrPTO2qvfDZypxurxDw2tHVlgOO63mvXTk7kC
         5BeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFTOnLwsbLBUIti1YkHuerv3ExhcgBlXJhx6/VB8DjgQvWCS0YOcMVNswEXNAFTDTuT4F9dbLWAFljRy4NgaUu@lists.infradead.org
X-Gm-Message-State: AOJu0YzpPndB6kqVBpCw/wAPY40HfTE0oScwspRZkBuzAW3Ldrl+bHvd
	OyOiG9PPzIVWitXmHQI5d1aD8rs6OM3eu1F6n7TWBjdyGsduktgTnPUgiu16ERFzoEQ=
X-Gm-Gg: ASbGncuFTSUZox4OmO5oFgMBTa/O+REnIeJJokMzpA72rwe6pCLlO9elDN/C1n4zxw0
	ybUPwcBoXmxxczqQQ8M7gl0fEzIv+ZaXbzGvCsm90A4vufA77six2/BJFyrWule/m73W50nbehO
	mVSZdcVi83IxzBfn45EByZRiXBudbrRnM5xUy9GupREAt8BNBDCHZzJ9TdvVMqlr68Z4OIY/FPW
	OlFj/U5jYMB3+B7GP2umG0bgyfQWPYkM7KMMwTAiW8CCwNjSLMad3Q2q1BxbTjgryKnl7wJQjfA
	t5CQCpsJDirwFFlBTvd9/WTJxn5BeLGjByMe7H3CmEN5gUQG7BHnaNeo4rhR3iQU8SUevLFFmhg
	UHl4RmscbycM2y78JRIoC33vqG68EViqviuKOrxmqlBWs8qRYOBuhid4gVadz1mCaOsykxGON0p
	IE7DS2Y33c/mM=
X-Google-Smtp-Source: AGHT+IH8rddOOuj2183qpUVyyVFif6dJ3P2j8BhXdLVsUERS6zel3c3yU22dws8RNYbBXoaWy5oC5A==
X-Received: by 2002:a05:622a:5e85:b0:4b4:eace:d0b4 with SMTP id d75a77b69052e-4ba655fa244mr47322681cf.16.1758137977567;
        Wed, 17 Sep 2025 12:39:37 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4bda86b3cf7sm2702201cf.29.2025.09.17.12.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 12:39:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uyy08-00000008n9B-2ccZ;
	Wed, 17 Sep 2025 16:39:36 -0300
Date: Wed, 17 Sep 2025 16:39:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org,
	joro@8bytes.org, praan@google.com
Subject: Re: [PATCH v2 2/3] iommu/io-pgtable-arm-selftests: Modularize the
 test
Message-ID: <20250917193936.GL1326709@ziepe.ca>
References: <20250917191143.3847487-1-smostafa@google.com>
 <20250917191143.3847487-3-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917191143.3847487-3-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_123939_109390_ADEABCD2 
X-CRM114-Status: GOOD (  11.72  )
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

On Wed, Sep 17, 2025 at 07:11:39PM +0000, Mostafa Saleh wrote:
> Remove the __init constraint, as the test will be converted to KUnit,
> it can run on-demand after later.
> 
> Also, as KUnit can be a module, make this test modular.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/Kconfig                    |  2 +-
>  drivers/iommu/io-pgtable-arm-selftests.c | 36 +++++++++++++++---------
>  2 files changed, 23 insertions(+), 15 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

