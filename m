Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E063ECA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 00:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bl0AjuwmuTt9b9m42lFEHpaVtMv37QnWF5BqITX5uS4=; b=kYBLHDidoaqzfGhSsfkLMPJXO+
	tvsrUJ+PDEaWu4ElxNcMegyG9xs2jq/Pyz2FYWR5UyENRz23dwPaqbjx55c+LXv/iC1zNwjW8r3yg
	tCq+/Y0GUj1T7b1p9wl7NdkdZQHh4j+xJ4Y1bSFfkAFUhM9c5xvR4SpvfA4Q9aRqzYAfVBFE8M5Yi
	opITgMQHBRK8GRu6zdhotiXL9QUtQiwnemnVtPONfz5ywWXXPLHh7UmT7MrIKPiDpEZl9LmeH/OmY
	Rk0GBS+umTn2K50FbrqdljNZksqPJxDEJXD6pAdwsV+jUxKfmAI3or0K7PQp008pYPfdORWPy3A4u
	zKYBxiww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBLIR-00000001vr0-1Z7N;
	Tue, 29 Sep 2026 00:02:11 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBLIP-00000001vqT-283h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 00:02:10 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2d8facae850so18525ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 17:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790640129; x=1791244929; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bl0AjuwmuTt9b9m42lFEHpaVtMv37QnWF5BqITX5uS4=;
        b=QUXIJSBCdQRSoUebDTiDEC9JsEJ/7XSByC224lPUWXvsjjn9N+FerAJoXuNq8QV98H
         djqTnslq3CwoTJ29JPg+ZjMIZMZU0PMHsUEiU1QcQ7Qzwowmr4a3GQ5xamHp7qln+zaJ
         EeiK8yRcKfJH3LqEl9p5tcxbFc+E9/q1gaEAq9wL6VZvHthP5bwurxnkRy5vyoc3nTAx
         n0LhO2+pjVtWbx00XuHQKuEHJhPZ5ozdC0bPBzz4eMVbwHYqwyUhYFCJ4EwRwGJ6j5XW
         cDnVcYAZtnY/KSj7zzZs6eIt0Ec5ViBAf1wEWeDg5Ul9YWXMrQa31InixsHJrZPGOzlM
         Sa9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790640129; x=1791244929;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bl0AjuwmuTt9b9m42lFEHpaVtMv37QnWF5BqITX5uS4=;
        b=04YmZbUxL1ohWZKoy7v2fl/ZHioQRaVSvehMaM6I0zOF2JyaxoKGGHLNyEk+ppHBeI
         Vbya65riTe6Cdhtwhwf3ddRZ0dQSoe30CN5lBKDTix/GFs28J+IeByol3eQwFnKLdm6p
         cO92FzpobT8jzkDu/D2Pm8ZdaLCUn/hMG2+tARsG22C4io9W05LcRSxOjMv1syVxNj19
         fUgURXfTSnMubXBpiOjOcmGeLdXdpZcwV14w3R/XnKgOSu+HvSO7mUviQuQ4QnXUCsGh
         rXFjrQTgjJu0pMBzD71nElSwP3JgXbiKy9QmH3K1RM47SrI/+tjbqhos1oENfWjTH9Xe
         9OOA==
X-Forwarded-Encrypted: i=1; AKwUvBw79WFtOn5ilTav8AEX1b1Yv79ZZ6pfmgNVjmoJVKHOT9RJoWmcEztq0myjEUnSH0VvrA3bDhJcm27gg0JuNUem@lists.infradead.org
X-Gm-Message-State: AFq9FYJfgsJ2UaN6vLnAZtkHMbY/x0OLlca0AbCSEtB+mj+wGoAet6W0
	XiKLYP09qIX22nfRTG1C8B3d5MX/WM9Rf2EmUzMhG6MA+l4AbMxydFq4LHJV14Jd0w==
X-Gm-Gg: AYBFou2bumPsaREmukzHNthHB2l1NEboqUloaWuLek1ucZvJ3xLj0zk5yLJ9Chn5AzQ
	NClHkb2YyfP9eBnsXZecq0nCOb+dIdszXGDH5FCCsoPjTLM+LvZZ+K71NkhBEZmvQ6uOfMZ0ltR
	tjT6le6xX5wdKA6NY6JAfNkSGfkotL4DFaUJqD8jpBVDqfJJDwS+R7o+T22uVYxt0FKonuXceXk
	zdZHomlmDgzyWfnB4K5PdnWU4qrGP+tU7n4fjk0x22bdPBc4JOx48JxTyxqNJXG6rHugjXnDZwg
	nKyaagD1q7HxJr6idRIOBWJ4s/Zr52P3gojanFX8RKUFwhgbiZs13Um5qjPwC94cMhjaXVuJny5
	dIpo3RXJG9q9cgV+wgL2+m/TaRYpUoysPeWrA/eC33iJbll04Dkg95dv+wykg9jcXqlm2XI8Jer
	O2hsg4jAJ+X4s3zOcqjwO6I4v2ooRV0IYuuNXjp4wC7jYSRl85gpa1zcYd+8c+qRGZWSLKT+tCd
	8AMNdVVHXdSeDE8XNN1C6h68zLn/+rpgMSxMlustfYGQmo=
X-Received: by 2002:a17:903:986:b0:2df:8e89:3bff with SMTP id d9443c01a7336-2e2c7ab83e7mr1395595ad.17.1790640127941;
        Mon, 28 Sep 2026 17:02:07 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498179081sm1843895a91.14.2026.09.28.17.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 17:02:07 -0700 (PDT)
Date: Tue, 29 Sep 2026 00:02:01 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	nicolinc@nvidia.com
Subject: Re: [PATCH v2 3/5] iommu/arm-smmu-v3-test: Add missing error checks
 for inv array
Message-ID: <arr_-bvl3qGR14BZ@google.com>
References: <20260924085616.300650-1-smostafa@google.com>
 <20260924085616.300650-4-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924085616.300650-4-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_170209_546340_DAE65CFF 
X-CRM114-Status: GOOD (  12.20  )
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

On Thu, Sep 24, 2026 at 08:56:14AM +0000, Mostafa Saleh wrote:
> arm_smmu_invs_merge() and arm_smmu_invs_alloc() can return NULL or
> errors which are checked by the driver but not the test.
> 
> Add KUNIT_ASSERT_NOT_ERR_OR_NULL() after calling them to fail the
> test instead of accessing NULL or ERR pointers.
> 
> Fixes: 15a2a5645ad7 ("iommu/arm-smmu-v3: Introduce a per-domain arm_smmu_invs array")
> Reported-by: Sashiko <>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

