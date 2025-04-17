Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F60C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 15:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhAGpPEptuinwFC5kpLG7YtOP8Q0MXDurkSFKB011WA=; b=RAvWS4tg/04CKDQuRwqJw5xJF8
	eoLEU/cvF3Fi9ws0tD05auBLh0flw586yHp/5IT0lvzVKQCbf735OMqZfxhhC1oR+IFgUe1z9EisH
	LYjwEz8Ct7yiQoOdUzX2WxDjWvm7fAtShQphxT8+yPMQ0vEXYHme1E8xeLeMWQYWi7OCnX0ZsZMa9
	wtyfKeN+01i/brHKquAicZsWOkD4oK6+uevKVxMt1u6uUnTkYZNSxWnDU6qRgZh4qCg0VNhElnSYJ
	/Dh02nIIN8uHKairBLFpwvn4CIOni8QlOA1lF8u3lqKDJODWZafm9Jfz3oGQrAK/+m+AYkSb0ZeAZ
	S2foVqKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Qog-0000000DQpD-2lBV;
	Thu, 17 Apr 2025 15:06:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QDg-0000000DJMh-1C9Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:28:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D9B4A4A273;
	Thu, 17 Apr 2025 14:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BAB6C4CEEB;
	Thu, 17 Apr 2025 14:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744900079;
	bh=f0/i1f77DYXfCc5XbQGnPcXxQM8UrjBHZ/+ff6enkUY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RkZn6SEYUjtOEKtRudAJMrMNJx7y3YN9Lec0IrVZPOXLZZotAL1U8JkFxg5/hgHao
	 Wy+jY+CwxGRcpJDs93u5NAqWA/9FP6aRJK2ezX82w6Neqwov7YYEutao4D8BObs+Lu
	 3rakzxbCtCxO6V2R7dA0lBtCM1FkzqUMwj++gY8gQiDm6OZYE21CRYapry4Jj+VMLU
	 YRr1DXWWlUISuKWHn/W9CKEqqn8xBwwK5xUjYWt4SEFOz3NGzJK/isNb8CGh0S3Bqx
	 xDAO8Q5IjGToW8OgYAlO2NrVEJKgSiGNitTE5WEHc6b/yZqFQhXr3hVRIkjjdqFrRo
	 4TNKEZOiKaZAg==
From: Will Deacon <will@kernel.org>
To: joro@8bytes.org,
	Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	nicolinc@nvidia.com,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Fail aliasing StreamIDs more gracefully
Date: Thu, 17 Apr 2025 15:27:30 +0100
Message-Id: <174488998090.911565.16333351329264813205.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <39d54e49c8476efc4653e352150d44b185d6d50f.1744380554.git.robin.murphy@arm.com>
References: <39d54e49c8476efc4653e352150d44b185d6d50f.1744380554.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_072800_339849_357D9236 
X-CRM114-Status: UNSURE (   8.56  )
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

On Fri, 11 Apr 2025 15:09:14 +0100, Robin Murphy wrote:
> We've never supported StreamID aliasing between devices, and as such
> they will never have had functioning DMA, but this is not fatal to the
> SMMU itself. Although aliasing between hard-wired platform device
> StreamIDs would tend to raise questions about the whole system, in
> practice it's far more likely to occur relatively innocently due to
> legacy PCI bridges, where the underlying StreamID mappings are still
> perfectly reasonable.
> 
> [...]

I tweaked this ever so slightly (mainly just the diagnostic message) so
that it sits on top of Nicolin's change.

Applied to iommu (arm/smmu/fixes), thanks!

[1/1] iommu/arm-smmu-v3: Fail aliasing StreamIDs more gracefully
      https://git.kernel.org/iommu/c/2d00c34d665b

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

