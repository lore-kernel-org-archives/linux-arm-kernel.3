Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF118C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=538Bban5iOQuAF/2OvLsm8VbhbA6yCMNVAJAEEAo3ew=; b=N8pK8dlr2izpEeE72n2knTtjKi
	sV/IixG+IcrzTflsmSn1APvOKK/24iti6M9z5FzOzWAlr6puoxzqU68zt/POL5ZPaLQq1cIO6mjOS
	kSoiutmA1PY8J8RWgT1EkeYgPhGf9pyhNeae+RzZSbE/KqI1OkMTKqLTfk51BBHothx+h/ht1LzD9
	7y35uO1hXI+dT74bWmIf+8QN4PYbwjeNAT8u1S9cqpQ4JlqBJinSiCkCa44s3tD7QoaFR9JXM1hqW
	YlZy2Ar9tIhL0vOk69Ey3IWL7rAoJbpT7aaBVI/ZGMdDEQOm5/8BG42hZAs74WrEKHIoHfs/qoMiC
	lMyhND8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KDY-0000000BL6N-0DBI;
	Tue, 01 Sep 2026 08:51:44 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KDV-0000000BL5n-1pLm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:51:42 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6a5f91ae397so6623a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788252699; x=1788857499; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=538Bban5iOQuAF/2OvLsm8VbhbA6yCMNVAJAEEAo3ew=;
        b=Raqt8EWctssBzCPZPGTk9cwnPYLwP/lZTGHVUlqmwI0+kR0p+LT4P93bemZdr0h2aT
         ATa7u/xK4Dqe/k99UAaQX2GU6c2pXf/uz9wHY9VUvKbsV56QKedgHrX7lJzFLIBErTqE
         Kspklf3EKZBEWuiATpbC20w0Ye4Br0yXTBji4rNAqVKkCerirzvNigAKy7SQX79Q7aaB
         f2eMsILwS+bV86YWjtuenLDAcN2k0p2xiY8XhGNGHV1Nw7G27QwKLLJrrukIuZURR2PO
         AUb0pG+tuiym7NDPfCC9deK1XQWnMIhLGvTsqHORquOSpY00Md0dnGRlCr+28fo1dleC
         n3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788252699; x=1788857499;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=538Bban5iOQuAF/2OvLsm8VbhbA6yCMNVAJAEEAo3ew=;
        b=nFgj3QjNBkVgbueD4ei8KYh5ddKfIFbA/k5E6N3jyC0CfocJhRzF6GHr8O2lyi/zDe
         V1BRMd9j0ZQyJJqRFZpzSdoiDES7nbBkvsQxsugo+Wo0P99RtueSGW9pTY/ZSVCr+dxD
         5TQha46bAPtgRI8sTBT6CpOAsuqMjP4D/LicDWsylgGu9oPfYuELFFdBBb+5OqMXonHm
         f0GIAetNIqgX4+6+V78pmjr9hRBWGCsM846Wb2zFDnGe8iNZ3zAQBCjWzRFZea0/oGyW
         tYssVmagnL8GJ+NhF1Oz/cWZXZVTUGcg9STFLJc/JGLcxRWoc38AY/1tkjunq8RCdd+n
         tElg==
X-Forwarded-Encrypted: i=1; AKwUvBzQ1YINx2hfj1V1jzibdPYBrzaIw44fBpErgik4mlL7KbBcQn9IjVE4vh5KqDtMDvNL9NaRSZPhObMF4xYn6wI6@lists.infradead.org
X-Gm-Message-State: AFuF++nuNLZWaiwZtGS2t6m+PautCECTkKb9zQQLat3Yxg/v1Dxlz9lx
	HLRKQQ9761/680hJPnXPZmqi/VzrRuM+ZphkBlaUHkR3oZAh2e8MI5AuQiTLpNkNfw==
X-Gm-Gg: AYBFou2eQ34+h6CAWu4Q7ZWnQ3xXi39/ehdpu5rbQ9etTyKJZTv5XIYdHfzagZDnf+D
	iKQqPekNM/uDxyW2JpV7wLP/jWhkKM5mMSG3AC97IlnP+JAiqKM0uzyaJQBr3Og1qzfmISk+y4D
	CiDhXV7afXXNSxMXeQs10FBdfLQ1UIFaIWkUP1DtKv4ND3xwZP5skXsTxI8IrCm5+C3bAsKNaF1
	7bZooh+h/mT+fXOLGE2eqB1nyS48uGsXqnFQiaVwz09ilnd2V9zaupA1azTeXRVeJa420qLrjNg
	9xziS5r77t2DBsOUBazpB13weZHziRri2U12uXycbg+QCSfyisY0se+YFBE/mKv8sKzb9z0fl8N
	ToB5pd/lK03IebehkIjgAVohxVHH1KoXEESpHm59RUoojCjZ70sJyvInZKTGI1T7bzxi/V+J9lt
	0K/L2cUCGRVCinicT9Iu06SjRK6JW6ft+9u1dTG5wUNhNXC2mKJj+vTCdlq5ZWnnPiqGfduiEsn
	4uK9mJ2FkYxviVYZQBcIL7fQbx1PYkcfaHh3gqd
X-Received: by 2002:aa7:dcca:0:b0:6a0:6677:37f9 with SMTP id 4fb4d7f45d1cf-6a66d5c18e0mr19763a12.1.1788252698938;
        Tue, 01 Sep 2026 01:51:38 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a66ccdc50bsm466634a12.11.2026.09.01.01.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:51:38 -0700 (PDT)
Date: Tue, 1 Sep 2026 08:51:34 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	nicolinc@nvidia.com, praan@google.com
Subject: Re: [PATCH 5/7] iommu/arm-smmu-v3-test: Add missing error checks for
 inv array
Message-ID: <apaSFtf2xe-qbKbg@google.com>
References: <20260828125409.1921538-1-smostafa@google.com>
 <20260828125409.1921538-6-smostafa@google.com>
 <178792724271.3808739.15472225478426952013.b4-review@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178792724271.3808739.15472225478426952013.b4-review@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_015141_512835_95E8D063 
X-CRM114-Status: GOOD (  18.64  )
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

On Fri, Aug 28, 2026 at 11:27:22AM -0300, Jason Gunthorpe wrote:
> > arm_smmu_invs_merge() and arm_smmu_invs_alloc() can return NULL or
> > errors which are checked by the driver but not the test.
> > 
> > Add KUNIT_ASSERT_NOT_ERR_OR_NULL() after calling them to fail the
> > test instead of accessing NULL or ERR pointers.
> 
> I've generally had the opinion that if kunit tests hit bugs I don't
> actually care what happens next so long as the bug is evident.. Many
> tests can't clean up when they get longjump'd out like this too.

I tend to agree as that's how I use kunit also, but I'd be extra
careful around crashing the kernel from kunit as it can be triggered
from userspace.

Thanks,
Mostafa

> 
> So, IDK, it is fine but I also think this is in a category that maybe
> sashiko prompts should address instead somehow.
> 
> -- 
> Jason

