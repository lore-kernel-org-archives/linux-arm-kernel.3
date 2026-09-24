Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1B7C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 08:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBbUmiE2dRkBbSKytOyHEBRYcqAsz7TnE/aajFa/CtM=; b=viyJGEsii7VT7tF1xxmIRtEZhw
	ubdWe6Lodxe7kVK0Cqamv7yaPNTvTQoaMeCO6Ny/XExcv6WTl462RATKxFMKOE1JVkYZjqMTnzyBu
	pM6tWEce3NHcNgZeJTx1WKCYAFcjCSbwuyJtUICaw2ahXrM67YHiBLG3MfRAB0r9bPyaK0Pdl5wzL
	tSANUfnHi3dhabfOdIIa5xoCIjLS50Y4NSUxf7FnXOlhqcdrqe73sX6kVahIeocivuLPlHp7UxXBP
	wcy+Yn7KXkTySjTgh0xm4sWwX4ZWhZBp7a7Qv4qyAA2NdTyKSczztFaoqzrr66tJGV9e0f/w1X1lZ
	d2eMu9wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ehY-0000000APkP-0mjO;
	Thu, 24 Sep 2026 08:21:08 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ehU-0000000APjz-3pp8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 08:21:06 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49e6425f96eso32395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 01:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790238063; x=1790842863; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TBbUmiE2dRkBbSKytOyHEBRYcqAsz7TnE/aajFa/CtM=;
        b=PdmWH2e2hObvMPtYEFrVOFNcu7sc2NtSmqEohDDL9Ar0n61T7rZKHAHEiXVFt46EBZ
         vSEk+7FhS+1OK8GNfFZTR275QUT+kw7oCTGTJjpxheB/p8oGWx38J40M457ibIqxmXJF
         Lp17+62o8KlrGbFgpfW12bR2lKl7fY8xyCwBTyQKQ9Dary8XUASwtmZcXQRCXp/wA8Yb
         cVAR4TaeU45P2jM58VfNj9zfWvoKlStmqLfv/SBMEOixbwO6Jo2qV0HBlU0mK1YvOfOu
         W8Gx0jMjdwpVYt/WZ2veuSsi3anlREe2pv0upzW8C3Ii3MHKeoWqDBsCxeo6vIqsTDOC
         mpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790238063; x=1790842863;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBbUmiE2dRkBbSKytOyHEBRYcqAsz7TnE/aajFa/CtM=;
        b=Jp6RSTrMaJgarv1VFxkIJdi3dZERA2iALmZxlRJ/bRqDwa+cH0QSMpGiSZ3SEXQoes
         mQO/3Dtt0oaA3JakB76QuOuh+IxkuNPyJrfuCs4z4L0PBiT31tIaW6cGNCdLvoM8Q/kj
         rohDEehbBChPb+GvD8vVbJQFcVtTavXHNCQ01GJ5cEXGwW0VNJi79B3kpHRsiTEcYTI1
         1c1mT5X9J0yUMzZ0ZG8V6ibIW0bBTJzX+OoHDeYgPZUPlQErdFmaj9ovCZ8B4JNpKkU6
         I+Mj9x6FBQethJQFEmQa//PEXEJS2HkNaBBU122Yo93cTwZwgLvQRfolIS7VDcvQH8NB
         bA1w==
X-Forwarded-Encrypted: i=1; AKwUvBw/34qaP7wrcyxGL5IYhX6OyWXuYf0dRaGgCQjk9pzh7XMD5sHm4pHRppbr20OBhObBkyx7ypsiz3RmqqSuGbcV@lists.infradead.org
X-Gm-Message-State: AFuF++lVN0uI6qUKwAnZKFU6C+mwsSHPIvNj9rs7T4CYKR0uIP4q6str
	17kyJct7C93ynI9uJ4IMs7R0CvQWNjYbh+sOTAbKlrxImbC7GFvr8EjL2Ahu1jPZNQ==
X-Gm-Gg: AYBFou2wvKtogB7nTR8ty/H8q+7PjZo8Gmwd7TcIbS3umJxRntBNrpPqYuKWKvQSYYE
	TWfW3CrDi/SoJoo1DAaMW9IEGLUDGCVdsCrdBzmf1TOPp2JbRpNRTaoOgsQETE1GozreYAMCar1
	rfREgq62IQImRK3mFvZj8Rsglv5BGdrsyApSli7kiwiF2NH0F598qA1I5dkoa2dlbdgIVY5t7HJ
	PQemhBuX7UWmtDsW85UQce8hGDegeJS+bIHy3EDcccY3N/bOzm1afAKNTP59XBr5nLAx2fk2OoJ
	/brPkbhg5e2QhZG8GF199evXQFQm+xsNStLBFSvORyPRRGr24psx//VCB2zYlAUovCU4qenWebq
	0I+ZTM/EBcJ7Bvp/FJA4ZLJveunuPMtX883j4UXq6vChVqnpLCdagWHgxPOZcW4Py2ijX1HFwlC
	NLsHpVFHp1IhWMsSku4Kz2PJDeObhf3N4ZCDikezX57U8YFSTu5U7jYV+uNm+f/G4ZK+eITgaBV
	C7CI0kEXrm/BmsMmpsy+fVQCViBBToOHYYuZUkE
X-Received: by 2002:a7b:c4cb:0:b0:49f:c839:28be with SMTP id 5b1f17b1804b1-49fe5996dc6mr523225e9.3.1790238062399;
        Thu, 24 Sep 2026 01:21:02 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c119sm14042034f8f.15.2026.09.24.01.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:21:01 -0700 (PDT)
Date: Thu, 24 Sep 2026 08:20:58 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Pranjal Shrivastava <praan@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org,
	vsethi@nvidia.com, Shuai Xue <xueshuai@linux.alibaba.com>
Subject: Re: [PATCH v6 06/17] iommu/arm-smmu-v3: Don't rb_erase() a
 never-inserted stream node
Message-ID: <arTdal7U8eK9Z_7j@google.com>
References: <cover.1790188510.git.nicolinc@nvidia.com>
 <76c5f9dde30269995ef842a12a3a5e1ebaa3e6df.1790188510.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76c5f9dde30269995ef842a12a3a5e1ebaa3e6df.1790188510.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_012104_992801_858B4C85 
X-CRM114-Status: GOOD (  23.22  )
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

On Wed, Sep 23, 2026 at 01:11:25PM -0700, Nicolin Chen wrote:
> arm_smmu_insert_master() skips inserting a stream whose StreamID duplicates
> one the same master already owns (bridged PCI devices can present duplicate
> IDs), leaving that master->streams[i].node zeroed and unlinked from the
> smmu->streams rb-tree.
> 
> Both the insert error-rollback loop and arm_smmu_remove_master() then call
> rb_erase() on every master->streams[i].node unconditionally. rb_erase() on
> a zeroed node sees a NULL parent, treats the node as the tree root and sets
> root->rb_node = NULL, silently emptying the whole SID tree and breaking SID
> lookups (and DMA) for every other master on the SMMU.
> 
> Mark each node with RB_CLEAR_NODE() after sort_nonatomic() reorders the
> array, since sorting relocates the entries and would leave the earlier
> self-referential RB_CLEAR_NODE() pointer stale. An un-inserted node then
> stays RB_EMPTY_NODE() and is skipped in both erase loops; inserted nodes
> are linked by rb_find_add() and erased as before.
> 
> Fixes: b00d24997a11 ("iommu/arm-smmu-v3: Fix iommu_device_probe bug due to duplicated stream ids")
> Assisted-by: LLM
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 5732f3ba0122d..082da3dc09e56 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4122,6 +4122,13 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
>  	     sizeof(master->streams[0]), arm_smmu_stream_id_cmp,
>  	     NULL);
>  
> +	/*
> +	 * Clear after sorting: RB_CLEAR_NODE() records the node's own address,
> +	 * which sort_nonatomic() invalidates by relocating the entries.
> +	 */
> +	for (i = 0; i < fwspec->num_ids; i++)
> +		RB_CLEAR_NODE(&master->streams[i].node);
> +
>  	mutex_lock(&smmu->streams_mutex);
>  	for (i = 0; i < fwspec->num_ids; i++) {
>  		struct arm_smmu_stream *new_stream = &master->streams[i];
> @@ -4154,7 +4161,9 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
>  
>  	if (ret) {
>  		for (i--; i >= 0; i--)
> -			rb_erase(&master->streams[i].node, &smmu->streams);
> +			if (!RB_EMPTY_NODE(&master->streams[i].node))
> +				rb_erase(&master->streams[i].node,
> +					 &smmu->streams);
>  		kfree(master->streams);
>  		kfree(master->build_invs);
>  	}
> @@ -4174,7 +4183,8 @@ static void arm_smmu_remove_master(struct arm_smmu_master *master)
>  
>  	mutex_lock(&smmu->streams_mutex);
>  	for (i = 0; i < fwspec->num_ids; i++)
> -		rb_erase(&master->streams[i].node, &smmu->streams);
> +		if (!RB_EMPTY_NODE(&master->streams[i].node))
> +			rb_erase(&master->streams[i].node, &smmu->streams);
>  	mutex_unlock(&smmu->streams_mutex);
>  
>  	kfree(master->streams);
> -- 
> 2.43.0
> 

