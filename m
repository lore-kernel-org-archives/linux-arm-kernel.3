Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7F3CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 14:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XktoxOSdy+7UpPmhAwTtEdQpOxHTuyByFDWP5fxlwiA=; b=S/Ivd6OikWewOAU5OiPxFp/Hbe
	u9q7doAmhZXc7x9fqFbg5u1HWiilCf255BIZNDLb8UhR+Qek2gfhwBp+hLXqpNksE9yOcvROtNXYG
	OBKnN5etiaAzDqXGU56W5EdQ2aQM6vO48sY3k9HZ1tLUu7yQ/vSoS0EBOAEZYNDFDcz3+vTMnfrek
	ss9o+WQ6UHJrxnMhCA3yEs7dOtKCswsDYhuvqIs9zqcCbD68IgK4twOt78fs0l0P7LmS2v0AYgR0N
	69W9C+wAFes+vzbi9RODcQF8C7RYrMW80/5Y9KPBlU3CKNRrjWyTria4J3RVt9Muoy1l030y6RtSf
	gg1BwISg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMZp-00000006izx-1MqV;
	Fri, 08 May 2026 14:53:17 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMZn-00000006izN-0i8d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 14:53:16 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso94655ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 07:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778251994; x=1778856794; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XktoxOSdy+7UpPmhAwTtEdQpOxHTuyByFDWP5fxlwiA=;
        b=thKFylDLJTXoo6RNk5vHUuvScBGiAH6Qh6ivBgrhTMNI7PPxsOSUWTrx4vFefl/UQN
         b8oLproaYmmQ9/QhjQyVWjRijw40xNu/QVsXGPet8YWH7GMp9Hn18hDcbTkoaWHw2SJT
         qPc4lbU99cZTzkyy8ns775yyMXrE7x5AWYfVKwVMdhedsta+WMpqZybDQxSd2W3k7ZTY
         qgdVYrASRkvUkt+iteTHGZBNRLikttb6PkPzby20Ko6M7xN/AwikFivRWi+5InKBHQ05
         1xBMSm1rfV5bm5QVsI7VBM+hEwJ2+WZFUsCdfe3peyyL6+7fbtuF6qZJshAIACRD5nm9
         1WSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251994; x=1778856794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XktoxOSdy+7UpPmhAwTtEdQpOxHTuyByFDWP5fxlwiA=;
        b=ojACqVjiV32GTTQlR1eXShl0/3eSgSf/D3XvzmizQ8pijeWekkBm0wCd6a1n5e62ar
         Tb2zGXZ13Xe8sU0qAbxJn8E9YaBBf3s7ZJiL/TasI74B5QTxLViFCA5yPRC8VR6RN4FG
         9za9XUHAD6sp/A1CFRPgFhkkEZEgwdt/+/eNZQORvNrx5ePyJ9aMs1y8U4ZGT08EGAho
         dY2PeFNQWyq0+kdOMWdfHbDymYO8dkvnaJ2EuKv5O2XiOEtRtspzTGoGz+F2vwu5gy2R
         h6ox4QYy7mQfahen8D+O4xqRMwzYkkCf6ZdOgvqN7DCf38KR0MhRPcwgNeUliWgkaZKb
         waBg==
X-Forwarded-Encrypted: i=1; AFNElJ9vi8PBPjUo7ksEfHVqc9mbiu1K5aOrJoiCI6ngRUk8gprHHfor/qKsw6P3tqyxwRckn/XivmMzAAuRhApeAdJn@lists.infradead.org
X-Gm-Message-State: AOJu0YyC9F56xZPE05KcyG8oUH08haiNlZbr/zR1aoLYmTV9Pi7sCHGq
	RLdlq8Viig3GsyhwtNcTerJ7VX6vkg2lmaaWrb57ElXDOg9t8sJf5OryM3S3mkt3pv9dz8sTzwr
	Myj+mHw==
X-Gm-Gg: Acq92OEd/QYusmLNomkFy0tDrJ7nFW8ZXDQdsjdmOhiPgp4IkqwoiBIwgMxNPeXKcfn
	DNw09rkezir1IMWxm3prTfInTbF+mOlh6CZh9Ju/lCljcdo7sT8u6vGHOuHSc97B5n/PiMOWpWZ
	88G3+Cw9KqvkvI/sOQ2B43IVDRhlkuA/+9t9U054reIhkr3lyIG/tOTN4O2mbkuYfReHIDuZo8f
	+LGqgVD4G/QenKJJUzmN52I7old7zfu4+zKF6Tu2TH9UGNLxN4IU8NcEyjqOLy97OOUzoEkrd3+
	EXqBi6s6XHm55ZTJV8YCybq6OEcvzV5GwGWlaqX0MAbL/o7T5aMl/t6GOQ+GFdZTpf2l9wWlAke
	TQGQGhM1uJOSYkEtC5WTJnwbE3JJVkmlPc3ytO7EntpZ0kzkGjutgzDf8eJ8zANOsqriRqfSDU7
	kTtGLFDWNC6uJui8fouUMEjcduX/rQyADHCnEZVQO+QzZoTOAALc8YbMADA77RgRbi9cqboLprk
	eDRPl4=
X-Received: by 2002:a17:903:247:b0:2b0:7a9b:82f3 with SMTP id d9443c01a7336-2bae9ab01fcmr3296545ad.8.1778251993701;
        Fri, 08 May 2026 07:53:13 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367c2ccfbeasm8405a91.13.2026.05.08.07.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 07:53:13 -0700 (PDT)
Date: Fri, 8 May 2026 14:53:06 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Leo Jiang <leo.jiang1224@foxmail.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	joro@8bytes.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Stop queue allocation retry at
 PAGE_SIZE
Message-ID: <af340uhd40FLTaEO@google.com>
References: <tencent_F6E384A40D990A279B460A0CDE1927FDF509@qq.com>
 <0fdf4b1f-90f2-4f69-9d2b-dc5f608e9c1c@arm.com>
 <aeeoEHHNKPo32H9R@willie-the-truck>
 <tencent_DA99B62735469A0CD219E9FC73E234A47309@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_DA99B62735469A0CD219E9FC73E234A47309@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_075315_240606_98F39370 
X-CRM114-Status: GOOD (  14.86  )
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

On Wed, Apr 22, 2026 at 05:13:08PM +0800, Leo Jiang wrote:
> Hi Will, Robin,
> 
> Thank you both for the detailed feedback.
> 
> Robin, you are absolutely correct. After a deeper look into the source code,
> I see that allocations smaller than a page are indeed possible in certain
> cases. My previous assumption about the DMA API's granularity was wrong,
> and I appreciate the correction.
> 
> However, as Will noted that the current logic deviates from the original
> intent, I have prepared a v2 to limit the queue allocation retry boundary
> to PAGE_SIZE.
> 
> In v2, I have:
>  - Updated my identity to Leo Jiang.
>  - Removed the code comments as suggested.
> 
> I will send the v2 as a follow-up shortly.

Hi Leo,

The general guidance is to send the v2 as a fresh email so that it
doesn't drop off the commmunity's radar.

Thanks,
Praan


