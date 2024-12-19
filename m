Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0311E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 11:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGPXVL0/egs6Tmt22Jo7umwA4U5JIvfDhvu1Jf441ug=; b=qBUC5U16potKrw9QTDxaiDMSCW
	poYQrOON/zhnn8s/y28RMCqB1RJ1KhycrGb7ryhjhMK+Z0bZPc2ZtRDSkrAH6+VtgfJhOTH3VxZuR
	5QfnZtn7D2Ny7pxYRltM774fPnOVSImRlumJ19lOvofb+1XhYLzbOPMMTUjfHKSvf1pNv3GFcma9p
	kXZfaJHGJcOv1QtJf7d5f5PwwJ0hoOclsbOb+ck36YXHbogXGXUCwH0jdumGkboxIkwBrq/ZfQ8P+
	51VQjXQJ3uki8fMRqzKYXlwdHL7NNhtBuC0j0tUL6iYIh0QUS/QybmJKIvMtTuF+qEZzobJyvxldw
	56oa1KeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEkg-00000001fo8-1AZf;
	Thu, 19 Dec 2024 11:31:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEja-00000001fgu-1pCt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 11:30:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A06C45C5DB7;
	Thu, 19 Dec 2024 11:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DE0C4CECE;
	Thu, 19 Dec 2024 11:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734607825;
	bh=WZy77EM6Jp2nJGwMoUPBoqtGUEr8RfDUcV/Dtjbg0I8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GenVSOh3XU2e5AJnorSRRSioUtijToJOsGApMyITwDhvgZ4Y4EzR31hUh2NONg9Rw
	 Eqz3EUsbX6qb+azS7mGCxt5h1iaVKWzB+95c1Mwk6ZgmBP8x0ayOqIL6MFbbMkhDcL
	 lbamqngDPhxrUjnsUoeZjwAVjeQOPIqkXxQhZ/LC1f4G00ve8AMeF3q4LoUt+p/SS2
	 OERqcx8zxSWh/ez35wO+SJFPDIYgtmRX7PW84+/udhueRPSrPysLaaZBM7Jz6MYQOE
	 r9y0oHXrycr7RVDQBN0uA1xAlVt6645p0qVtsY3KE2DsL0Uk6jO4KC6UHu3//Us+wE
	 ICW5uOqkwoalw==
Date: Thu, 19 Dec 2024 11:30:20 +0000
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Rob Clark <robdclark@chromium.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
Message-ID: <20241219113019.GA23640@willie-the-truck>
References: <20241216171017.4881-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216171017.4881-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_033026_514183_1D7A8F51 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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

On Mon, Dec 16, 2024 at 09:10:17AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> On mmu-500, stall-on-fault seems to stall all context banks, causing the
> GMU to misbehave.  So limit this feature to smmu-v2 for now.

MMU-500 has public documentation so please can you dig up what the
actual behaviour is rather than guess?

> This fixes an issue with an older mesa bug taking outo the system
> because of GMU going off into the year.

Sorry, but I don't understand this sentence.

Will

