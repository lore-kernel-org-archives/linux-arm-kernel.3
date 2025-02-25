Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53839C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 19:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHaAT6T+XlWe+89P2zugxKrlYk7TledH0w0ahGQr4YM=; b=nNxLv2CvAZuMqMoB+GYBFQecr+
	IBYwdcNSbnVfGvg6ASRSliTqogwEYmG/9QzVPJePB9u0XMyz6L7RkNAFfbp6Zpza2dWmZDlydM+yn
	ZGZjg5M+zTVTZRljjpQSgXNuLltpEbslRTS+BNQxVu3Nt8uytC/RL5UMUQJSsXwYw8HgejiM86HZs
	51VZ7Vire6X5VopHBo7maO1XBjKc5cifHdnYtcETxjYggtJCl0SvLC63oazA0Jt32yn4QCExJFuXV
	kndCu0iPI+GlIZS33JbF6I8PXPN3Zo0WwT4S1BX7VBqM6L3t8q6JDt9fGrxHCI7GOpJVlvM9WUW9E
	AQ/csK1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0eU-0000000199F-23ZM;
	Tue, 25 Feb 2025 19:31:34 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzBI-00000000mnu-3lMj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:57:22 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-221ac1f849fso2935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 09:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740506240; x=1741111040; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zHaAT6T+XlWe+89P2zugxKrlYk7TledH0w0ahGQr4YM=;
        b=WBpDS+8tn06KXVHjeU1aEbc/0qX2pfjfN3oJy0oDC8KStNZ8eJBiMj31EHr8gQILGE
         H3DhMdqkdEN3nPB0feVVyYwPhxj8eLd1U4kzFMEeNh7V15o0uv2lcO8/KMSErR/jzGQj
         suGOvLz8O1igh2Pn3AIOfP1Pt4XUSr06Rq12VQh6AvDOf+XhFjjqAs/3/U4/DdT/z0Kh
         SDGSzlFB8sDuPFGY8LR9H+Bw/0NVoaNChOwyhXT7u07UoqGtFisd6ssyG/Uud0/zElMF
         T+aEmoCeqk3PIqByp1W5rjJMqpDldhrgqxN8s1faHAC+7deuw4DnkaxnSxGRSYuUVN+j
         UL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740506240; x=1741111040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHaAT6T+XlWe+89P2zugxKrlYk7TledH0w0ahGQr4YM=;
        b=Q3CD0LEpU1Ft3wHSoSgs50xSu2+q9APGUDMoOnFGyAWlWTf50YhoEzXdD7eFViekjT
         PaM35Rkvbgoe7MnrleNSBjdZ/JZaK0/v0TpAvpWyGVCkM5uS3yAm8njSJAn4+g+KkAhW
         JL2fGq8zGNhwdybT3aN5ERlwLNDvR5GFbr05rxEwzmZD2atwaoiSm6UW1SnOxZ8sspJ0
         ljEs3yymiXZZkxMH296TJG0a8G6g8x/DamgUSOu5Ezkey7IezeG9++d/NeKkSCMvrJ3y
         7zpShZ7l2LNVdT+RQBcv6KMMcIMa4FZzZDiclYpsMb45PC8IQmUtdsdXFaBZrz9eb90n
         G8PA==
X-Forwarded-Encrypted: i=1; AJvYcCWj4OHo9fkkJ9AwtYLkQNBqtFWDXRFcF33I1HoFfcQ1wY4/xRzr8N5cHZahsq+3ppWmyGGLnusGWlql1pBT5hkD@lists.infradead.org
X-Gm-Message-State: AOJu0YzewA2SdHnCSuYA+LxYaBTcT7T2RkCtqKOXLK8nyRZl/SzumxP7
	P8j9RkT3aLNnwtn2SM9AdilYZ7+ysBp0JYRyqQf7ZP5idrFGsSyn6wfChp+73g==
X-Gm-Gg: ASbGncsBDkxhwTE3i5NJ9UKYk4dvXTmwUmMUSR5x/xQ38XfP3eMA907nt95+EZ22rrv
	dTi+yYd4uZ0sTW/9vRFwZjwPEpQM34Q0OCgVLMFbJEHinIwvjb2ClBxNaGL/A3CJPVqz7cjUeBd
	t8r1TYIqz/rrPE8VUE8BnE+LXkdLR9JKKJhpnxpu7wa+jiZG8bYOHwBFdsmYd0fUatOK2xUcTwq
	LflR2m3hiLPKxLwykcicRbzu18Ej0owXU8q1A7xhXmNcpJ+1lxqtdoRigwueFOieDoXqSBBKwe2
	yeqie6+B7azPJ2tRyXKP/6rGzP78roCDgMHkUDdP6rWlzR7qO7fkeKCElFb7X7g=
X-Google-Smtp-Source: AGHT+IG02bNp0tkxmXxczB6ZSntt4wfTEWTePiQeT76QafmUXS7ThOKjH22xno2GMa6y5FkJX+V2yA==
X-Received: by 2002:a17:902:c40d:b0:220:c905:68a2 with SMTP id d9443c01a7336-22307a2c777mr3852445ad.5.1740506240014;
        Tue, 25 Feb 2025 09:57:20 -0800 (PST)
Received: from google.com (169.224.198.35.bc.googleusercontent.com. [35.198.224.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0a61fcsm17251405ad.191.2025.02.25.09.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 09:57:19 -0800 (PST)
Date: Tue, 25 Feb 2025 17:57:09 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	joro@8bytes.org, suravee.suthikulpanit@amd.com,
	robin.murphy@arm.com, dwmw2@infradead.org, baolu.lu@linux.intel.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	patches@lists.linux.dev
Subject: Re: [PATCH v8 13/14] iommu/arm-smmu-v3: Report events that belong to
 devices attached to vIOMMU
Message-ID: <Z74EdXC5YzvmJokk@google.com>
References: <cover.1740504232.git.nicolinc@nvidia.com>
 <7f6813dc2b62f5f396ac3172dc2a7d9bf3b47536.1740504232.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f6813dc2b62f5f396ac3172dc2a7d9bf3b47536.1740504232.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_095721_040260_C2332BF9 
X-CRM114-Status: GOOD (  12.56  )
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

On Tue, Feb 25, 2025 at 09:25:41AM -0800, Nicolin Chen wrote:
> Aside from the IOPF framework, iommufd provides an additional pathway to
> report hardware events, via the vEVENTQ of vIOMMU infrastructure.
> 
> Define an iommu_vevent_arm_smmuv3 uAPI structure, and report stage-1 events
> in the threaded IRQ handler. Also, add another four event record types that
> can be forwarded to a VM.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Pranjal Shrivastavat <praan@google.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  7 +++
>  include/uapi/linux/iommufd.h                  | 23 +++++++
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 17 ++++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 60 +++++++++++--------
>  4 files changed, 82 insertions(+), 25 deletions(-)
> 

Apologies for my spelling error in [1]. It's supposed to be:

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Correct spelling in [2].

Thanks,
Praan

[1] https://lore.kernel.org/all/Z73zvIbsXzJMCaNt@google.com/
[2] https://lore.kernel.org/all/Z730M3XptvDRObBp@google.com/ 


