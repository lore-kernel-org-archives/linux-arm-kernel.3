Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC12DE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 06:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8IoPSQMtEEL6HOp9R3MHt1lyYtmF6QVYbrckRmNW8I=; b=Df2Fyw25+cw7f6K+p9fz9XtpVt
	IS3s7U/0qSRcs7IaCSTHpCHJIBmYu5DJ8ujonw35RFr2+Iaaj6FFjEgbMSab2NCw7fg327dM8oJBN
	kKSP4EDKEolLQggtvgVhSnW8Fq8RJUCkV4ouO51S84v9PZ0kHSzOOpR2OuwLINApudwfvEXETNdEm
	3iClksgPwey9GFpfQhpFjMB7OzWzPJTNpcIspn56x+PudzVLMST9jqYYbSC4uAg5zHellpnfZBf4u
	/uWXfaUNC9hj8ucbia7ok8+xYbir5Drht9huC6V/Q4r2lIRK/JC+0dn782bWWsPb7zoAVZgfVpJuR
	/aOYQ/PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFqs-0000000DtSx-1cSc;
	Wed, 11 Dec 2024 06:05:38 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFpo-0000000DtIB-3D71
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 06:04:34 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20cf3e36a76so55724165ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 22:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733897072; x=1734501872; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s8IoPSQMtEEL6HOp9R3MHt1lyYtmF6QVYbrckRmNW8I=;
        b=fCSjyj3v5LG7MSECjDfnQ2i4arXo8m0KWH9HB2+UQhsWgtugKWmLpAEkzdBI/NQ9j9
         gL/UJ0KQYQzhQzKZWFWApbQhoiLeL3uZagAsts2UOqCIuLvDiQ+coW9ag9XGK08A1axE
         i454E4FB4sRr7o9VDMb8kaYdqN5mV+wBcrZKLaTVXYM1xGuk7uTj1CgOmcgAIYeMli5I
         4LUvxcCE2iNXqBPVH98RM33hjj4anTbqgtEtFeJy65Y8c0Lj2vdhsooEeZqTej3Dnyv2
         iDiCxWtraIRg3i6u6Ra4dyFm36yG/Upec0lglE6zrtswFgWGTlabc2p8MF/PWqOuY2BS
         ARbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733897072; x=1734501872;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s8IoPSQMtEEL6HOp9R3MHt1lyYtmF6QVYbrckRmNW8I=;
        b=OyGzQvMrJJIJvBDK2sRC1KHOf2mJrskj2zWLxsEPWrhMGL+03D4aTDMH991L+OIISG
         KpxswhzlzTDRJ6h88fwbpwFbvC1OVovWdiCzxPeGKnCRCnTvOYeSSCAmvexjZk38u3zX
         PHWNKmTAs/cIvJadh2yEZlLvs7anjmfDJBmHqG1BV/ggyXxhVYmuVsz6kxWC3lirfWZd
         f/JHqRkqzBy4mG60pvEpXeNoV/fbgKB9ZDTWi8lo5HnpkkS4vi4u3Pmfwwfa8c9uTZR+
         f69S/IPwgnMDsHJpxMdG5NIBw3RqvBjvuNy45M6JkyhGFErxLSX1ith1efdOIC2aldVL
         uWlw==
X-Forwarded-Encrypted: i=1; AJvYcCUd2BQskA3ISugY+QHtz8XgvLXgkYNKGwU6rqlCIScy4uBYdRXhBc/4zTc5z5/Y3jSCfPLizC3jB4LILAQIbv68@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1ZGyB1FjuyypLgUYDivc42mUkdHk1aHk/fiHkNI/3npGy8Ga+
	VDZs0mv7AceU9FMawvgjv9QlkJMOnL2NnG1Ah8Euiq9AlVFuyyDV6YOYsJ4aLg==
X-Gm-Gg: ASbGncvWgyNeQcCOx+ifGzOYlxtu3d9PceChzIeS3LmfBgIUBZsL9nYFeJw44fAYjD3
	bn7YRL+JjcnRFF+XomaGpoCn3Tk1gEeMvPeyKpNjV5H1C+mrj26wKjTD2qer3tLRY3M9p4BzmkA
	gCcOog1uIz8lga1L3B22fTIxRvzask6XQVpAy1nfpfBwEE9BPF92+3Cc+jCfEY+9P623HfINY41
	RsZncB2rLXaUM1hMS7hJibrd9OL3qARLguplCjwEm1bYcdzForb5H7KJf0XTj0=
X-Google-Smtp-Source: AGHT+IGMQiw9EMReovhZtxJ046XhcMh5S83+xfJNwDeGQ8QcJ07MPY4YZJkgMpDk8inAJw3ApdVzrA==
X-Received: by 2002:a17:902:e74e:b0:215:9d29:9724 with SMTP id d9443c01a7336-21778590f41mr29160785ad.38.1733897071869;
        Tue, 10 Dec 2024 22:04:31 -0800 (PST)
Received: from thinkpad ([120.60.55.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21618d9beafsm81832105ad.6.2024.12.10.22.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 22:04:31 -0800 (PST)
Date: Wed, 11 Dec 2024 11:34:18 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 0/2] PCI: Convert the Apple controller to host bridge
 hooks
Message-ID: <20241211060418.gpepptv6wlbv7fwt@thinkpad>
References: <20241204150145.800408-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241204150145.800408-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_220432_849592_8EA6C769 
X-CRM114-Status: GOOD (  17.78  )
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

On Wed, Dec 04, 2024 at 03:01:43PM +0000, Marc Zyngier wrote:
> The Apple PCIe controller requires some additional attention when
> enabling an endpoint device, so that the RID gets correctly mapped to
> a SID on its way to the IOMMU.
> 
> So far, we have need relying on a custom bus notifier to perform this
> task, but Frank Li's series [1] is a better approach as it puts the
> complexity in the core code instead of the host controller driver, and
> this series builds on that:
> 
> - allow the new {en,dis}able_device() to be provided via pci_ecam_ops
> 
> - convert the Apple PCIe driver to that infrastructure
> 
> Patches on top of 6.13-rc1, plus Frank's v7 series.
> 
> [1] https://lore.kernel.org/r/20241203-imx95_lut-v7-0-d0cd6293225e@nxp.com
> 

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Marc Zyngier (2):
>   PCI: host-generic: Allow {en,dis}able_device() to be provided via
>     pci_ecam_ops
>   PCI: apple: Convert to {en,dis}able_device() callbacks
> 
>  drivers/pci/controller/pci-host-common.c |  2 +
>  drivers/pci/controller/pcie-apple.c      | 75 +++++-------------------
>  include/linux/pci-ecam.h                 |  4 ++
>  3 files changed, 21 insertions(+), 60 deletions(-)
> 
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்

