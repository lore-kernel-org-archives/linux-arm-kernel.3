Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84384C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 16:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FuXTk3sNqgjvfJDVodnQ6dQBc+GEb7krH4jOLDWR1sw=; b=tmfwEmKDX/7UqmadrZ+EMfa/HY
	1jSkEfQxjw5B7Pg9fQ4g6i6/J0zibMygy9nrVT+GBMq8N0TLKz/8GF7heiNRNSw6rZj6+EKAPyJeO
	xswZn/mj27vuuvndWU4tMDxnkd/EJfHS3q6t5tsTkedjfmqcRLJvl0F9HqUaBWOHDbT8FgZYERmJH
	AnS2yQ8uSHoDkp8CmNZQY5pOPN3ngI++YAk2Jt1h5ioahsSpVYxNVNpt2hnthHj3Ftl+pxbZlRbsB
	Kjy7TBUIGT600s9/YOpF/D7/P8EjOw3ZQ29uuMy7B+tsBZLyGeZ2hYm44w2DvwiS44BfhYZTZ8U7D
	lvH3wEpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1dA-00000001NJj-0NKv;
	Sun, 26 Jul 2026 16:23:12 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1d7-00000001NJN-1svt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 16:23:10 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cae1a3a744so14478815ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 09:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1785082988; x=1785687788; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FuXTk3sNqgjvfJDVodnQ6dQBc+GEb7krH4jOLDWR1sw=;
        b=D/BZ1rt523kIbQBo0R9+P2asN5PKEoobgovvu1vgLAvbJ4iI9XDoBu+iCN1xVjTj+K
         k+UgX9HuQNLal1uEM10LgQFhBb1rlOELwZcHwJ9mv/HBYAvpV6ZLZ2X/d0zQkPq/0sjj
         RRAjwhBNpVNOoUETEdO57IHExADNiY2+7CeXpMBm+twEmy+6SAs9dkbwOvAgLhcwTjSa
         YSCzGsZLrHoFEJL6EhpHVAETJHnvhsvO5pyqMGLbIn9puNufloY+0+61E2QQJylYH563
         BWUIk2ZObTi0ur16C/0XHZBX9cjtLy7yTYgO6LZdgymgWEwfRtWUi8M7unCD13iLp6kE
         f73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785082988; x=1785687788;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FuXTk3sNqgjvfJDVodnQ6dQBc+GEb7krH4jOLDWR1sw=;
        b=S7KldPfiGauNuwiAhBsbQU3rM5kg4/JtJuSyr063f95NUsYYFK3wSXzX0zhpMLHc0R
         pAYBcv4UroiK8y58c91lADbjFy9qy2JXbXEeWX/BLG90ZCkCbHgyyqQy2l4FGk1vNySU
         Trw1m/4yhm4jyZhKnvdmxxwgIaD7CnJpegRHUU8cNB1Sqhd0OXoEtlvNYn558xHdPjK1
         kTnQmhb4UOYc3Jy9Llj0GnrOv7KI2uHu+K7s6k87FPdxY8Hq5SPf/syk1qrvNIUkXO2z
         Sl8ogNPUuxKVCsnkIrUWkC2bboW/Nh9pyOsNqwHZDqPH7XpPvGdT8BX1lJaubIkZ8doB
         Eedw==
X-Forwarded-Encrypted: i=1; AHgh+RovzJqzbAq44dsS6EUU9VrQ9cQR+N7IcnHXJ8gBCTsgvKCjfo8HjbzjAcPf3Q7XAJuMHKj6rcFBPd+0k2UQLODw@lists.infradead.org
X-Gm-Message-State: AOJu0YzKrkTMsWOJsO/t0slhAIJzCOD20kNTCTyHUti6DS4Hn/QdBG4M
	i46EL3hJxHvzITrxQqXbJnsYaq66/3h42I8/TXd6wjzK2cfnLQAqv4SPnAm0McAWzcg=
X-Gm-Gg: AR+sD11aDY6pCdzluPbu2d4b1Lqw2f5LU9AjocCOSBhGytDFt8H81x+3hGg3F6OtqBM
	wrMGNRzXOpOtZuq2d8LjY7qq88po5k/QxlvlG03+NztbfDpMMpeLLuhQnNOaJ1sGv/910vX7FDB
	E9ig7KPsvLDHV+dsTlnZcQXijip4E3y8+VOhUYpa1KHL1CkI3nQL8U5XKNRSzjo3HaxbtH8eBHV
	ewdumgugI+rFFgfw+wPm9IIUc19CFuAxgW8Af3zI++FS58uLzJB7U4sejY7Kf55QKlTNhbA7SLI
	w3uQxmQj58/wm+MTJBYI4hJtFs7q2B0jHlJ2iXuZkPT4H6okP1NQtEywXMLZ9oZqxwD7FHne4js
	hPOHWRHEXhU4r9RcehLq8a+j/PL5ENrV9z/PhXiCNUhcToIAPI/Q=
X-Received: by 2002:a17:903:4687:b0:2b7:975c:dacc with SMTP id d9443c01a7336-2cfde79058fmr52053305ad.1.1785082988138;
        Sun, 26 Jul 2026 09:23:08 -0700 (PDT)
Received: from ziepe.ca ([64.114.68.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde80f50asm21426485ad.77.2026.07.26.09.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 09:23:07 -0700 (PDT)
Received: from jgg by jggl with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1wo1d5-0001Tl-8m;
	Sun, 26 Jul 2026 13:23:07 -0300
Date: Sun, 26 Jul 2026 13:23:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, robin.murphy@arm.com, joro@8bytes.org,
	nicolinc@nvidia.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v9 3/4] iommu/arm-smmu-v3-iommufd: Report
 CFGI/TLBI-repeat erratum
Message-ID: <amY0azMCny2sHfX2@ziepe.ca>
References: <20260726081904.1408859-1-amhetre@nvidia.com>
 <20260726081904.1408859-4-amhetre@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726081904.1408859-4-amhetre@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_092309_492061_C8969422 
X-CRM114-Status: GOOD (  13.59  )
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

On Sun, Jul 26, 2026 at 08:19:03AM +0000, Ashish Mhetre wrote:
> A guest with access to VCMDQ generates its own invalidation commands
> and must apply any invalidation errata before submitting them. If the
> host also repeats those commands, each affected invalidation is issued
> four times instead of twice.
> 
> Add IOMMU_HW_INFO_ARM_SMMUV3_ERRATA_REPEAT_TLBI_CFGI to report the
> CFGI/TLBI-repeat erratum to user space. This allows the VMM to expose
> the erratum to the guest or apply the workaround itself.
> 
> Use the raw __arm_smmu_cmdq_issue_cmdlist() helper for user-provided
> invalidations so the host does not apply the workaround a second time.
> Add arm_smmu_erratum_repeat_tlbi_cfgi() to query the static key when
> populating the SMMUv3 hardware information.
> 
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c |  7 +++++--
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c         |  7 ++++++-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h         |  1 +
>  include/uapi/linux/iommufd.h                        | 13 ++++++++++++-
>  4 files changed, 24 insertions(+), 4 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

