Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB36D44D75
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 14:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNTsaYFvcdTX0Wb0OiiTSdCFogGY84Psmg3dgcA2ZBU=; b=c0avRrJEWKbQTQX8fKu96zj8kA
	TPaOKdPgPwbaG2thwERAsasjNrN/ls81xTE6PudIQRm8fY3RpxrsSkwd/Cu5rtHrCPrEKX4kSzxQx
	10VWQ06Wzny2P7MeQ83iJnbp3DTtypsrXRWiFDKoWHRbvJm7LhOCyV1T1nbkKzCxDGtamX7yuPGiv
	eJ5thgcCNTDkZ/VrlzDT4Ph8XLYH1DIvsfybVuXeTmYMZPI6OZsbkSdpAAp+irEFiaV07nx72uPBM
	WXJf7v+dXfIFYCHnVZqpYoym3dbrlqp/iaJtLDtatZeoRVsoVI9EuP3amLv/NchAleT1sALQuliEU
	7KVHBmwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8guN-00000003a7x-2rzC;
	Wed, 06 Nov 2024 14:21:19 +0000
Received: from mail-pl1-f171.google.com ([209.85.214.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gc0-00000003Wm2-4A5R;
	Wed, 06 Nov 2024 14:02:22 +0000
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20cf3e36a76so70778435ad.0;
        Wed, 06 Nov 2024 06:02:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730901739; x=1731506539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNTsaYFvcdTX0Wb0OiiTSdCFogGY84Psmg3dgcA2ZBU=;
        b=g7pPxb1CbjnSIQcPrVMXEKmj1EDSd9FRmxBTbNMDm6Xn/w33QP2r9HUN7vsy0kp0Xr
         h23c0fhiICM519NtUTiqv5fRn7HHbHHK6l2G5WEypnysv6iqeKL1fgEHjtiLTM1ETF7U
         CRmzrfTruI10ymtIbVk9gZCbNUZuOen7LKHJg2CI7cRUt0YNyEeAEM8sYKvRdOxhPtUu
         sp2K8tHkOyf/FQsM/fqMlXRqMuzpDzzoMR/PFVYUwwQIPWP8Yr22Z+wKCI/nQD5V2OGZ
         5Y1gI2Ml72/qQ5R0bh/cJGoGmZv3DRdhcA/1qKMLTW8lHmMl4yslvBOyZ4P3BS8k5dLQ
         w/Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWj8qzs/fBc1vQkIkdVsWKlGeEyQFA73wm+zSS+Y6Cw4HCU0J8kGJcSPMHc9BoKa/VwA/5nQpxK+AoAOD45TbaA@lists.infradead.org, AJvYcCX6n0jQ9KFE8fWi3AE84zJ7njdowGftkDb0gJu6uHgjIfFMy+w451tTBB1Dz2IEQ/k9JOGhqFLGFbqKAl09BoA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxT5ziaVZnr9sNRWJqPWXGA6IvutwZTh49r4Sn80w4IjIHcjuEc
	ZFRvYGM8dVSq2vJrFeHpHU4e1gj6Or0IhgD8BW7oldoNE07V+3zw
X-Google-Smtp-Source: AGHT+IG0KnpOVHJ6+FPyEIHnirGzIJjQbRttLyC4hJlcGX6Aev5lMijV1T5yRMGkqHzmL80DPHdBew==
X-Received: by 2002:a17:903:2286:b0:20c:5fd7:d71 with SMTP id d9443c01a7336-21103ace2aemr335361755ad.22.1730901739340;
        Wed, 06 Nov 2024 06:02:19 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056ef5f6sm96699695ad.8.2024.11.06.06.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 06:02:18 -0800 (PST)
Date: Wed, 6 Nov 2024 23:02:17 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, robh@kernel.org,
	bhelgaas@google.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	fshao@chromium.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v4 2/2] PCI: mediatek-gen3: Add support for restricting
 link width
Message-ID: <20241106140217.GA2745640@rocinante>
References: <20241104114935.172908-1-angelogioacchino.delregno@collabora.com>
 <20241104114935.172908-3-angelogioacchino.delregno@collabora.com>
 <20241104132046.GA2504924@rocinante>
 <e2e41af9-ed09-4ac5-9481-e605d1340b3d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2e41af9-ed09-4ac5-9481-e605d1340b3d@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_060221_047202_897AFD18 
X-CRM114-Status: GOOD (  10.05  )
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

> > Does this make sense here?  Thoughts?
[...]
> There's a problem here: this property has to be optional - and if you change that
> to return like that, you're breaking compatibility with older device trees, which
> are not specifying any "num-lanes" property.

Makes sense.  I will keep your version.  Thank you!

	Krzysztof

