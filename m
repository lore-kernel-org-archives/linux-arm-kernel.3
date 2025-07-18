Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9A1C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 13:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWsb5uSBhu6bPzZbSom7WozOJmoigRto8Pj5BCIHyeU=; b=X1GGnt02n/6Yz8GaWx29a2v923
	xytWFarLqnJU8OQymBPI5XAM6lfGr/pQj+udeJbfuo4gQqe8I/LTQwwJIJWhOx2SvZPN0ePFd1Yoa
	zuQ8HOSpWv/znb3350jtk5zAD5UWkg3VvOk6YbMaCwmUS9ldqplzP9mxdSkTQMXRONiRwSn3Gla87
	atcKBSHQdvxRyBV/9qKgB9x3oGq/RE65SbQETXOBfSWbqMKn8uQCKFvLQWG0n6rYYbeBEStINhLoK
	I4zBZNTnqJSmKGZqytmsLdtjrAxLY69WobY8pz2pakluPMIZO5jXx8TmLp0hLYTvijYUiGLVLAaHL
	BMGtzTug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucl92-0000000ChBR-0Atx;
	Fri, 18 Jul 2025 13:29:00 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucl6X-0000000Cgoy-0maE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 13:26:26 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6fae04a3795so17234026d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 06:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1752845184; x=1753449984; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eWsb5uSBhu6bPzZbSom7WozOJmoigRto8Pj5BCIHyeU=;
        b=FTRCOPYsbrlJ/OQIdJBeiobLGqF94WRqrlhC79ECahr2fyJQnSzMSYY8i/OsxNdbzP
         uYZxoARdGS8W92JHay7LxVHcIJeA9zNGv4FVyHWtI/g0ZBMvZ8RqZyf2arT0Q44PX487
         ZUJgUkej5e22dTakq912TkZj+vCjElGYy4VcVeYDPWFqSHkQOJwH1ajKZJ0ZORyBGcuy
         6t+AY6kf72rfCVUShYxOl+kT0GACTS84QZuJmVVi0QyztQ9/De1TRLp8lKq1Tc00uKZH
         bqKsVSZw3AWJ16nAtRXFa2I6nJBDLv18I1DcUZY/j67A/lC7HUxrC1LCSlu6dGRCHh7c
         0jAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752845184; x=1753449984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWsb5uSBhu6bPzZbSom7WozOJmoigRto8Pj5BCIHyeU=;
        b=RG5LG2/Mk/HRGpqyjFHQcwvA9jYFUL4xYAAWoFmhyGpo+1xxc5nF+dylbn6m/Ujq4D
         5FfbrvaaAJjj3/xeFagefbiELi92JfQmxFVQHIC8xtiPcYt9EyP1uquS0MP4KB658WCE
         SNmTdJgIOT6TwG+HAYJeb5KEcsa1VWsN6pjAX8XNGv4tW14gJGnxntsl0b66RGMovFO2
         En/Gct/KgQDgjBNw8mynGE3PamKe0WLRFEgDYI+m8uiga1+jgiwFbkl+SCSUbuOYlUGZ
         1V5OzMnHIbifFsUmRhDGe3qmdKoaQLrO8B3riZLwOPqvOIWqgUjEQoQXsMT0tCHADH2S
         +ouQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKYmo6C0FrdLJznl69ueLyqek4o13YHKdq+w6hMIuxru9zWLvmLxD4NMQb7+QatrcVoVSgGf9W87xj+VC2KYkc@lists.infradead.org
X-Gm-Message-State: AOJu0YxgPn/D2ls+NRJNPs+wVRVPjmGVxqk58BLMHVg89fekD6vQNyU/
	+ZI2uAVXbJc7x8HAWiNbBneuwQYW0UGAaLhKTIPsNtivIp+N1tRfUEQZDVV6xfsV8TBOwrGFwig
	At0oW
X-Gm-Gg: ASbGncuGqS9lAoTdfVBByRhe4V3IdrvuuUNMnWnN6l6mJTEwyVu99yrJIH5L5u1ujLf
	E+v0bJRVsdAwnFU8nF5l1Z8SBKSSS/idcF7K7mDQyKMCF4zNQCM98bV/3783yqlOepr5rjNd/dt
	qH5qz5efG5eD13YOdOFlS0DjOQNUV2YYaJsEb0byipl6wiWNu27m5E/xYLPpHY+MD/WLyL4xpb1
	o9KZHOlR6NXGn36heca0xgOuMMsw6RZo15aOAO375086p1CbJXlF3fe0zO7lN2ON4OHAWZpIZp/
	1L+FOO1ai4DtseXKMw9tMgN/e2C0qwjB+5JZQ7l4N0XcGF8FvR6/qZOKyc1vGxfKOh0I0qxcpSK
	v+zh4fZC0DbKQDwtm8QtWSbORoiszm5qscmXvWoDZIGsSL0xnSvr8/Ovqj5FjJiXssxKicxn4nQ
	==
X-Google-Smtp-Source: AGHT+IHxe3HazeTMlNhrIdTEfQ3VTjX7wXKy+xR8Lh7PRfCMXJiCHtJEIAJGMTKjnmoXNaUXBSYUhw==
X-Received: by 2002:a05:6214:1d2d:b0:701:9a6:92f1 with SMTP id 6a1803df08f44-704f480de58mr194846736d6.10.1752845183716;
        Fri, 18 Jul 2025 06:26:23 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4abb4980463sm6903981cf.12.2025.07.18.06.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 06:26:23 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ucl6U-00000009yt2-29EA;
	Fri, 18 Jul 2025 10:26:22 -0300
Date: Fri, 18 Jul 2025 10:26:22 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	joro@8bytes.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v6 3/5] iommu: Add verisilicon IOMMU driver
Message-ID: <20250718132622.GC2206214@ziepe.ca>
References: <20250710082450.125585-1-benjamin.gaignard@collabora.com>
 <20250710082450.125585-4-benjamin.gaignard@collabora.com>
 <aHTzPwTob8_5rtBS@willie-the-truck>
 <baa1fcde-f167-4a1b-afca-0a2957a688cc@collabora.com>
 <aHozv0NG1OBlAH6c@willie-the-truck>
 <b4169471-fcd0-4415-8281-c5bd722e5f2b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4169471-fcd0-4415-8281-c5bd722e5f2b@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_062625_244856_251219B9 
X-CRM114-Status: GOOD (  11.43  )
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

On Fri, Jul 18, 2025 at 01:56:36PM +0100, Robin Murphy wrote:

> All they really have in common is that they're 2-level formats with 32-bit
> PTEs and 10 bits per level (as is tegra-smmu too). The permission encodings
> have some overlap but are not fully equivalent. Crucially, the schemes for
> packing >32-bit PAs into PTEs are incompatibly different, so if you're
> really keen to genericise things to *that* extent, that's what Jason's
> already working on.

Right, I agree with this. The page table code is duplicated
extensively across iommu and the way to fix it is what I'm working on.

It is all the same code, same patterns, same problems, same bugs :)

I think it is best to leave this as is for now.

Jason

