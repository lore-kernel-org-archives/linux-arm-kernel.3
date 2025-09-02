Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2BACA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 22:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DTQRLWXvEI14NWUbWjh+wxk4xMHeIyr9b4st02lORnE=; b=GFFps4mRGLnFI10hNiefs2EGka
	BBAiLvphmPQUxRdoom9TK0Bf33r8s7hL0eQcZl7wvvFsIijfT3aNmOkaoTOciciDEBkkSKrLo7gjP
	eaAXq+xOEU0z8raKPchhUuXjP06fHkY9UF+ssQvgcmj0pwClM1d4Ez+s4Gj6Du4gfFWzp3zrWBWTz
	jO46CUTF4e2275be+YbNrb0z7vtBz22ywXmq9Jc4FjtLMsntrlR/ro4LhAb3iAWd+lyyJFL/Z1Vjt
	325PAYRslieV9xVq/KovroC2LTLZtOQBrs14lXi/5bxLn3AEWxvRqpKmxXyJAvmtfjkJ9qokchmJb
	3NAWFZeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utZwh-00000002UVi-41lX;
	Tue, 02 Sep 2025 22:57:48 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTaY-00000000sai-3q2a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 16:10:32 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-7220d7dea27so3041236d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 09:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1756829429; x=1757434229; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DTQRLWXvEI14NWUbWjh+wxk4xMHeIyr9b4st02lORnE=;
        b=jvisLikVeT5h7LA5G7wy6hOJ922gSjVcUm+lRIgY/DhraW3sE/m8PenTE+q3/EX9ZE
         PLBXp8rUPCMHFXVPt5kP7S0u34akt/4q9097XEP+x6CnBpFUkPNKEKanV9+TeNK3uBXZ
         8vi/LFeqaAe6L9yfVfIL+0Sbso+HD8oXxuc8NIeas5pucERahWuBk/PmSRMk1PufhKXP
         Y54tVPjKECk4wqIrTQSGAM1r2spoB/TSE+sZel16zzRf4MoHRG1QMKAB4U+8TJd256wf
         Fp2dRmqWWHdMwlzv8nHj1f9tO8xLbFZ0uuj6/5ZfF6mE/lcLoCpf9+TTU5XT6ppfcZCI
         KOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756829429; x=1757434229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTQRLWXvEI14NWUbWjh+wxk4xMHeIyr9b4st02lORnE=;
        b=YhMxoN/a1cEaCIvShXQvuv50FuFuD6Loetr8pAzt6UPPHP/hvQaf4c5LCmnLZ+fuB3
         0PQUfdJ5uqiyxF/h+yt6gy/xYErcbnAELdBiMsbIg66A+oZDiOjajIj5+Z0b/I0xQ0ow
         lZ7Yugv0ddOwrlrYuj2IVXc2OHkJSvSmeLHi8M3r9uJcxRdO1eTaucqkrT2PZx+dchLQ
         DfTdSW8hummUssNzAD6TiHu+iTz3snsquVmhUnc80xLy2r++mkmOZL80r7jcmEH5YbH7
         NMxVxUmSq4FpYd2MvFe8FFWDi/P/HVl925aoN5lpKgSyTB8BFjghfd9aEHixV2Wvd2p2
         rrNA==
X-Forwarded-Encrypted: i=1; AJvYcCUvEY2BuUs16vWJWo5a9ayCKgcetvBv2ChP7qrte7gQIRrA+Wuv4Vj/Mu/QgDaYNxFZ4j9UdSUfal1wNc/ONXdB@lists.infradead.org
X-Gm-Message-State: AOJu0YxcwRly7AL4CxqwbjpGooL9ylKdKolQIqtCI2Mew+EkdDsfkflq
	HQByzfkzJrwn1fnItakpYKWyMi5OOdL6ARbWfgzMsLvzbVN/+J6j3l0vFb/wEwE/5l4=
X-Gm-Gg: ASbGnctknNSh7+UhY/N6PZ7aXvH7liUhQgwngU319KlUg7KzvNvNLbrI8Xdfyuk/vos
	0rm2wcuX/XNFeUOmn6xonQzpkX++6R4ELTd9YsaIdayv2oq9Ij8R8BZ69fsRgZ6ucKjvUqAzQ3Z
	mSQbj7t0G8j6jDUAyXFbDkl1q9uxWpqC9+haFSHmQnms2GM5jxhWNPxRM7V72Kh02jzptq/iwu/
	lWsdRl3gNpFwcbr1WmWwDsYXqWt0aOT/OsOzp78kEfeK/yKGqpCWJ6Lrs/j2jJdPUvg7aQDb0hW
	yt6WywQL8vJZO18oRlqQ2UWBsB8lsdMix/6+0xYTkf7hhF2r6lgvbEVzNGlmo3EkAhYe1Hivdxt
	Y8h5XgZ3o+MwgVpD/iD4Dw46g3EuFbKlCPi0Zhq1gHBjtqyuAPZfQghrxmtkdqTwW7cmA
X-Google-Smtp-Source: AGHT+IFhzQTA7hTae/ikIqwqd6lRBifnM++rAw/xHgCOughJssiMfvo0jbnnGhHjDPXZ244dXS3P5w==
X-Received: by 2002:ad4:5a07:0:b0:70f:b283:77e8 with SMTP id 6a1803df08f44-70fb2837f6dmr81568126d6.3.1756829429395;
        Tue, 02 Sep 2025 09:10:29 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-721cf6d6cffsm6692606d6.54.2025.09.02.09.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 09:10:28 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1utTaW-00000001ZJf-1Cbn;
	Tue, 02 Sep 2025 13:10:28 -0300
Date: Tue, 2 Sep 2025 13:10:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Qinxin Xia <xiaqinxin@huawei.com>
Cc: will@kernel.org, robin.murphy@arm.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	yangyicong@huawei.com, wangzhou1@hisilicon.com,
	prime.zeng@hisilicon.com, xuwei5@huawei.com, fanghao11@huawei.com,
	jonathan.cameron@huawei.com, linuxarm@huawei.com
Subject: Re: [PATCH 0/2] iommu: Add io_ptdump debug interface for iommu
Message-ID: <20250902161028.GC184112@ziepe.ca>
References: <20250814093005.2040511-1-xiaqinxin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814093005.2040511-1-xiaqinxin@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_091031_057944_F4CB6259 
X-CRM114-Status: GOOD (  12.63  )
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

On Thu, Aug 14, 2025 at 05:30:03PM +0800, Qinxin Xia wrote:
> This patch supports the iopgtable_dump function (similar to kernel_page_dump).
> The IOMMU page table dump debugging function is added to the framework layer.
> Different architectures only need to provide the implemented dump ops.
> It also provides the implementation of ARM SMMUv3 and io-pgtable-arm.
> 
> Qinxin Xia (2):
>   iommu/debug: Add IOMMU page table dump debug facility
>   iommu/io-pgtable: Add ARM SMMUv3 page table dump support

I'd prefer we do this on top of iommu pt please, I don't want to
further deeping the hole of changing all the page table code in all
drivers for debugfs.

Jason

