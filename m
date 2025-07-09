Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F48C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 05:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D40RACTU+M+A0T48TJsxMEccHJLTjNMOkil6oijTHUI=; b=h6R3HGLbR8VIRXvzxr5XH8yeGN
	QJXPZPwUAyvJk9/Ja5TIugVX5Q070q91gvnDQNYZbGBr6PDMbZ/lVqwi7sqZdj2MJaxP3klYuyAGF
	HyWNJeoPSGKUFsG9ocEi38SNSKjBKI930UPK2O1+QJzkof8Ipiw4HFcp1f3cn0iwwEylMrZtHI3u7
	URXP5Kh7QdEIeaIauyJjnMNO9v9txyU4VXxuPLdYNI1DZx3b8lPcDL1+lCm66XwMruzaO/4JJFeUS
	OxQ8LzSaPKgeRgsXsa0sxH/l2s0bAO+lzm/ps18XlvmRErfHp7FbtKDrGOKgq16v3sTqjtX+v23Wt
	Ngl5rfNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZNZa-00000007bpp-3yNo;
	Wed, 09 Jul 2025 05:42:26 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZNX7-00000007beW-1Mjj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 05:39:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752039594; x=1783575594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7zwyVyoHgAp6lLK9cesg4Iul0W95lo/nbGluCqo3G9s=;
  b=JOoSWdp7HVGji8y0HLuvzMhI+JMhf+Hop9tkt3KG3ueFktHYJzKqJg4B
   PCKWf+aSDuWi0sT4F5CfKqcfeGyV76w4I0qrEVLJKsIXI3JbXfGy5A2I8
   wHdoDCWuyQYDFSdX15YIRxBRFLbZ6lRkKkOGMFdNQ5L54iCVZPpNTr1Vh
   wn/h58SnuXXmRn1KIvcyNzENqyn/pfFjJ7kbMuvd2apt7aJl5BFAsByfe
   meHeGL+HOhyzaWuKd4StXQheJkkrJJ8En3wMy/3HnTOFzJQCxstngBevG
   Hl3QiOEjaKQkViUrOJtq5rPT9lbTDH6P4Oa3uHq2pTNKQq4vAvmv/nK4i
   A==;
X-CSE-ConnectionGUID: XhoEBQQdRu2Po9a5hG/Glg==
X-CSE-MsgGUID: wm65ObGeTsmF8h1eHNIesQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54263527"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54263527"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 22:39:53 -0700
X-CSE-ConnectionGUID: 1z9kBPWUQaO4T6V0PNAAtA==
X-CSE-MsgGUID: cEmge3AYT7uhOk7zwVLTTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="155303315"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa007.fm.intel.com with ESMTP; 08 Jul 2025 22:39:47 -0700
Date: Wed, 9 Jul 2025 13:31:31 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, praan@google.com,
	yi.l.liu@intel.com, peterz@infradead.org, jsnitsel@redhat.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	baolu.lu@linux.intel.com
Subject: Re: [PATCH v2 13/14] iommufd: Introduce iommufd_object_alloc_ucmd
 helper
Message-ID: <aG3+s8rzcjeKazG8@yilunxu-OptiPlex-7050>
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <e7206d4227844887cc8dbf0cc7b0242580fafd9d.1749882255.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7206d4227844887cc8dbf0cc7b0242580fafd9d.1749882255.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_223953_410491_2B6DA72B 
X-CRM114-Status: GOOD (  13.51  )
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

> @@ -61,6 +61,24 @@ struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
>  	return ERR_PTR(rc);
>  }
>  
> +struct iommufd_object *_iommufd_object_alloc_ucmd(struct iommufd_ucmd *ucmd,
> +						  size_t size,
> +						  enum iommufd_object_type type)
> +{
> +	struct iommufd_object *new_obj;
> +
> +	/* Something is coded wrong if this is hit */
> +	if (WARN_ON(ucmd->new_obj))
> +		return ERR_PTR(-EBUSY);
> +
> +	new_obj = _iommufd_object_alloc(ucmd->ictx, size, type);
> +	if (IS_ERR(new_obj))
> +		return new_obj;
> +
> +	ucmd->new_obj = new_obj;
> +	return new_obj;
> +}
> +
>  /*
>   * Allow concurrent access to the object.
>   *
> @@ -448,6 +466,13 @@ static long iommufd_fops_ioctl(struct file *filp, unsigned int cmd,
>  	if (ret)
>  		return ret;
>  	ret = op->execute(&ucmd);
> +
> +	if (ucmd.new_obj) {
> +		if (ret)
> +			iommufd_object_abort_and_destroy(ictx, ucmd.new_obj);

Sorry I didn't follow this thread before and maybe missed something.

According to 70eadc7fc7ef, abort op is for the object that can assume
the caller is holding the lock. But here is for no locking, so calling
iommufd_object_abort_and_destroy() is quite confusing.

Is it better we change to:

	if (ret) {
		iommufd_object_ops[obj->type].destroy(obj);
		iommufd_object_abort(ictx, obj);
	}

Also explicitely assert iommufd_object_alloc_ucmd() and abort can't be
used at the same time.

in _iommufd_object_alloc_ucmd():

	if (WARN_ON(iommufd_object_ops[type].abort))
		return ERR_PTR(-EFAULT);

Thanks,
Yilun

> +		else
> +			iommufd_object_finalize(ictx, ucmd.new_obj);
> +	}
>  	return ret;
>  }
>  
> -- 
> 2.43.0
> 
> 

