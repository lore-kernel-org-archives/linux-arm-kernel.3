Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921ECCD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 11:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdNhpYSdJLZFqMwO9tkYt495l1ZUqFPFFf63TsgVKd0=; b=TYMU6abSzVWiCy+Dpwx4n/ouQ5
	/aT0o3k9+ihMhWUcqJRumheL3pst+rG4XzEue397nT0tKHo6cYo3o/LZh47opMn8+DWJX3+clfa7g
	/ujrnV1LBkO7r0p+/WmH8V9Ju0TLvvai2gypusf/beiBNYjneBPUpw62sz3m6tlOKjy1JfNfm8W4j
	lSU715VLQq2gD8wJNLjv4TAILOcRsfX0t8YJ92GGanKH+B/Ygh9/Ir4oXXGEHtrA256qZlviWAcxb
	akpXne4RXxttAi3jRefbf8C17neE6GBhiEz2g00ElIaUgdxA/rAHDrrb1MEBGWpGEpuKP3sVn0Suz
	t42SwpQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSvmX-00000007K7e-0wwb;
	Fri, 29 May 2026 11:53:41 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSvmV-00000007K7G-1HfM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 11:53:40 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-8ccd1f57b32so21014436d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 04:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780055618; x=1780660418; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SdNhpYSdJLZFqMwO9tkYt495l1ZUqFPFFf63TsgVKd0=;
        b=PY79nF0Gtg5Rvu58IcIRZonHsAdzZBxLfcKeoPhp65lXgypWIy9VAHob4SGD/K6HDt
         KPs/gOaXfBLBoeVo4EmKe1BFk0PmgvwjjuHcl91HrRs0XN23bg/4eu3mnO0rYruUgh9j
         e6yj5+qHxJfRKyytI3CXuU5qSWV4etORtpjOh010GPbPkDEiohQysBCayEV8a6EO0FkC
         ENTX9mxBD9CKS78fiubbvTseeCw3SHLPEq7HZ7H1z9jnZb9jvU8fldtCF9eFNZSD/KyE
         9nKUmKoE0MfTgWLgm1JgaolOqaPP4437yL97o2pWzq+QqLTVc4xnAaEssefwtZmI8rvq
         8p/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780055618; x=1780660418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SdNhpYSdJLZFqMwO9tkYt495l1ZUqFPFFf63TsgVKd0=;
        b=p91CdQ4+GljFf5YlqpNvtJ7+4mxMaFBDWji4qCQUOhwW31g/L86j9W75uxiBX9iqbC
         qtuwlaF0wj8MvuPAZB20eyc5RRMiRYFz2RKelL2NB5iQCLv7iW4d/f1JhPFvtPQeFQZS
         M0pOt8wJxskz/vSrulViG9xOON0DMowdj6hRSD1FqCaqmnpFTrmW8pSyZKQHKH3ocX+T
         3oM7BLluiFulMtvHjI5LUJ6lh6ck8PfPM91sZrL6rKjXXrPIKGS5pidFIZjVeIX9DkXP
         oBrJdXWN5Ua4mNbMoN56DYXvF0T8gjByZ6tiFkCPy9jEi7DfqgD6yaftf+FZRkUyeVgq
         R/8w==
X-Forwarded-Encrypted: i=1; AFNElJ/ZYrnn/BdotOoCnP9FFmEr2WTZOsFBzyVKd9BSp8Dv/uli6d6JEUYQvtux2rTkOyhwznc0n9Fd7bU2VLA516pT@lists.infradead.org
X-Gm-Message-State: AOJu0YzPufR+UbE4Wc95j+nRqnI4zv4r1iuuT2fz+US+85SCzjnWtKy1
	dnNVs5Pq2Xh+xvE1uDA5Yr0K7XdUa0i0HZCfRhMnhO7mBYqThHE+RdeHuD69fl2TBUY=
X-Gm-Gg: Acq92OEJpALe+r6wDdRDnIOxdgoSUVXOVL0dqQpvwA0/POUVa8JXQxcYoICL0uCYypK
	j4uyHHtBV+FaiH/ZgK3PY/1okQtdXxjiU6pvbRGOOGHYpxaX7B+1QJ0D/xx5bvG3xSpvroJe8fJ
	fMjz7TaQQYD4a3sC5lxU5ZSyeGZ9t69Fl9xYaLtn4JhrvNypd2GKv6ba+l7xPMA2Fagir1xWtUe
	IRP2JbXptwj0PRdJMrP+enpi/LuTsC/UfMcxn5fN1d6NEuVE2aJ3juh1XTjUvXcQeMQCiZG/DeP
	21XEdntUL7jifwS0zSKlnvUI7oijEkpPhhr/0xuNHFsAIU1vKanwdipYvzB269/7rtDO5XN3/sn
	afbjgi+lmc7udXJKD/UC42wYF7ypISbIgGo9ONrsWCbhMfiTw/9UrFMDj0AUwl+npubJmUQDTOo
	cZYz6UG5i9xgMNVZwdSVpi0Z6TBzUx3dfwDkPv/3AVScGh6znZnjiQAR264z/nI89+gidj7Yios
	bIzWEmDon7ghRxomSZC7XG02ws=
X-Received: by 2002:a05:6214:626:b0:8ba:ad10:97b with SMTP id 6a1803df08f44-8cce8035ea7mr28459056d6.41.1780055617749;
        Fri, 29 May 2026 04:53:37 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea245e56sm14706746d6.43.2026.05.29.04.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:53:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wSvmR-00000000SVP-1Len;
	Fri, 29 May 2026 08:53:35 -0300
Date: Fri, 29 May 2026 08:53:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shameer Kolothum <skolothumtho@nvidia.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, nicolinc@nvidia.com,
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	nathanc@nvidia.com, mochs@nvidia.com
Subject: Re: [PATCH] iommu/tegra241-cmdqv: Skip CMD_SYNC flush during remove
Message-ID: <20260529115335.GS2487554@ziepe.ca>
References: <20260529091052.317102-1-skolothumtho@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529091052.317102-1-skolothumtho@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_045339_412213_6D495303 
X-CRM114-Status: GOOD (  10.32  )
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

On Fri, May 29, 2026 at 10:10:52AM +0100, Shameer Kolothum wrote:

> @@ -789,6 +794,13 @@ static void tegra241_cmdqv_remove(struct arm_smmu_device *smmu)
>  		container_of(smmu, struct tegra241_cmdqv, smmu);
>  	u16 idx;
>  
> +	/*
> +	 * tegra241_cmdqv_remove() is added to devres at the very beginning. So,
> +	 * at this point, devres has already freed the SMMU resources that this
> +	 * path must not access to avoid a UAF.
> +	 */
> +	cmdqv->removing = true;

Please don't add random bools to avoid devm bugs. Just don't use devm,
or maybe fix the devm ordering.. These ordering bugs are a well known
problem with using devm :(

Jason

