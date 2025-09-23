Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC92DCAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 17:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBIJqbmEZbrWURHaKZlCYT/zn1TgwW+8+aRFRZatnkY=; b=VYJcIeI0yFrpufLLe2+7mXLIqn
	luTzzfO9sy2o8PcBF0ICDzk0keQ5SGeoIVikmwFbj/DKZX/kZUmkYVhL7iLIUhktwCbTxXEXbu5aH
	EaC2ncE8UaHVObQmMHicYiyLm0bMyH0Lb1YS0eNbbd45DeebHbY/U6ZyqbXmvZzNEx0lDx2WgQUJC
	uJgJ78HoNUM+nB2+d//qXX9XdhcTV9unyWXR8UhfMsh5MMsOGmcS6Xdo8UwQwHfdh2BKV2GSdMwjg
	oh8xw1kfJaUrCKyqjojQZeXrXJmrCVOeVvza2oY75TG79k8o52Rb7tPKAJbTXqcR+imPYpbWx1LkJ
	pwCzSqaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v16xv-0000000EPHM-312s;
	Tue, 23 Sep 2025 17:38:11 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v16xt-0000000EPFo-1xBX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 17:38:10 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-30cce872d9cso6072452fac.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 10:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1758649088; x=1759253888; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZBIJqbmEZbrWURHaKZlCYT/zn1TgwW+8+aRFRZatnkY=;
        b=bJ6LkxnepimUpl+f7mEXG6rox9+43EtzaByC7WC+CUs5qTlRLukVBN/1xm5OiCpT67
         Fu/xN0pJF1vLtQK0Pe5lFgR5zAbPgDXJA6o5rXVqutNKWGn3pyU38v9WzWDTj0Cc/B8z
         Uh6Y9Jzuw8JLOj0L6Pn1nGkklRB8yQ8VNMRzXCvaZwDap65Nk0NDpJEulRMpPBjLxdU/
         CbkplaGARzfkkpoziDz0nJE3UTdknOr4Oyo8d2BvfDD1KkbhKQ4GyB/ZDj+wHiWCjria
         +caE1gsV/o/5zwYFhvl6qlCav+Ae4rc3Qt1utSRGa1Ry8qps80ImumEv3fYxG5XG0Zcb
         d6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758649088; x=1759253888;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBIJqbmEZbrWURHaKZlCYT/zn1TgwW+8+aRFRZatnkY=;
        b=nchFiS24skEJGUU25qKnHBhihzi4iepd05ifHCDlHpuzTo9Zcc1vbDS89EdQAAqbnW
         obbwPk576v5Jb52Nv94gyFH+e+AXXga745iq3rAh3I3iUe3WZ1V1+5f2sxhxy0c/NF7k
         /4oV8YoMykLZFeqY4l3uhgQTtUSpWz5LVnf0lzQbpCZ97IuQFMOfNyhl/J3KTIL1m0d+
         YmFQgblzE44RaYSIQtmeBzLahAhtfWtE/PVhv3V1OFvaXSOfMvkZO1GRqzZhr5lDssVi
         00vF86U78ums+wnYQCEKnGgB4xHbDq4O4xl/Rw5b9rIT5ehc+pE5nmdTOrlf8QIC58X5
         SmDA==
X-Forwarded-Encrypted: i=1; AJvYcCWHXTdS436ipDWbjvSh0Z7mSm/pZeTRHcZ3IGV8qPNfL4c6M4D9hJ2h2eS50rBWrxxKZqEoGZD5QdRPJeTiDS9R@lists.infradead.org
X-Gm-Message-State: AOJu0YxHbFKJ9sHav8ShSsaPLECZq3U3OlwoRp5l2j3gqaNaCVxtV8KK
	Z1lK+E4HPkqLHGgP5bTbPO5iNNNOfNnvfbbEK6ENFrOOGKiaNl8uVXSzKzCCVXA+5kg=
X-Gm-Gg: ASbGncvgyGCh5hgkhaoYwyjCPKe8/rvreYo6xuyB233QMOEBCRrQdakxL67vj4Aq+r6
	V4e2vtA6088dnnCCWSax8VPj6Hp9u+vqTyyN9wOy0lCBKigh04Mj8dNmSukisQCoQyuY6vpMwuu
	DwDMKP0bscE9xALs9qfHSbq8VM/FjPmA4hby6dEhtq9+bARY4bI2jcooROIDAkkFsyhqdCkoIy7
	ufCh67E+bl3j0M6i4lsXTxBIfmdO61ZQ/KKEaM3NkhjpWLLjUE8pnUDkIjVxVOMLSdDPFcX9jNH
	0I0GEFL8UxUT5q3u70udQTU6Hh0OYjI1aeV1230vnExNGb0gUd6WmdgzLlvsnet9Up0CQ+HS
X-Google-Smtp-Source: AGHT+IEiUq4ZNiIQ/kvtshlpB8TY+qUCVv3sM7ttZqsjKZyYCVp5SpveErcNASTGPSdrjl/Eyj3Y1g==
X-Received: by 2002:a05:6870:15ca:b0:32f:ec51:a716 with SMTP id 586e51a60fabf-34c83545b23mr2456188fac.29.1758649088337;
        Tue, 23 Sep 2025 10:38:08 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-336e3af73f5sm9720934fac.6.2025.09.23.10.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 10:38:07 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1v16xq-0000000AySS-4AaP;
	Tue, 23 Sep 2025 14:38:07 -0300
Date: Tue, 23 Sep 2025 14:38:06 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 15/28] iommu/arm-smmu-v3: Load the driver later in KVM
 mode
Message-ID: <20250923173806.GF2547959@ziepe.ca>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-16-smostafa@google.com>
 <aMQmA9cLaeYWG5_C@willie-the-truck>
 <aNKwROPzDCWgJBGQ@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aNKwROPzDCWgJBGQ@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_103809_513993_515C1A79 
X-CRM114-Status: GOOD (  12.17  )
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

On Tue, Sep 23, 2025 at 02:35:48PM +0000, Mostafa Saleh wrote:
> If we really want to avoid the current approach, we can keep deferring probe,
> until a check for a new flag set from “finalize_pkvm” which is called
> unconditionally of KVM state.

I still think the pkvm drivers should be bound to some special pkvm
device_driver and the driver core should handle all this special
dancing:
 - Wait for pkvm to decide if it will start or not
 - Claim a device for pkvm and make it visible in some generic way,eg
   in sysfs
 - Fall back to using the normal driver once we conclude pkvm won't
   run.

It sounds like a pain to open code all this logic in every pkvm
driver? How many do you have?

Jason

