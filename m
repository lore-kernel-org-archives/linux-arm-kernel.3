Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EBBCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 12:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NQuM3Xk+7G9sWhoq6x2tAlTMpAWAEfN04bfxDimDCGc=; b=JLMTDn+X++RC3+qd+djglD62R9
	0IYH10cB4Dt/xKZoFZ/9qqrlzOBXsuoRiPxg2TVfclOQz4exGRt33Ehcj7lw2a3ttnpRGM6/M274F
	OSvzjLoeYUKcsAHxvx4okbXLdX+F0Y3eJdktsnsrsZLzTdDqduJSRwG50EEIMWaBxh9fhWjVhLgon
	3+lnWDSH3gUoPB3OJAcR6LUOsQAlkZuAuzU5cOIbL1dkJjRcJvP/nDdWVuF1b2w/L52HHnQUtHQIh
	HovR8qJpBn4otLKLhW1szV7WSPyE73DSKSckfySvSr5Arv2f1haJHmAXLI8PwWAL1xDVPYn9maNTC
	N+mhZBqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQlq-00000002T7O-2q56;
	Fri, 22 Aug 2025 12:21:26 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLTE-00000001ifu-3QEa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 06:41:54 +0000
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id A56A253456;
	Fri, 22 Aug 2025 08:41:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1755844907;
	bh=NhQFO0rePfsIm+ZuSFdYTBz/qr+Qp+tq0rchzzWcrKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qvukm80n6STPbGxXIfOPFQWT7Bgc/JfWVO8X2vhUtGP4Dv1SreJLa2AQ+4sOKRZOn
	 z+5JwuRNSbuaITzF6t9jYrQJ+WsCxmG/X/a59bPTL7mdfhXgu5a4un7Jz6X7fAe+Dr
	 AII/ZbysARLtKd0bYkhzJF45Kzy421lFZ8LuY3rESPxcq8rdKgJ6YeWKnQZEpDzGbF
	 CKm6xQ0ppY46BycIAZw8g+LyMSaDutN4yBrQokXgjicchJlOQ5xk5/aXnZnapRhXPY
	 8euzpOofx/fEqtUd+n+QPo3Ln0+iGMa8naR9DU/feWmcXU4l7LQmimFtguUKQ4ZEAl
	 kPvk/KadBIiww==
Date: Fri, 22 Aug 2025 08:41:46 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rc] iommu/arm-smmu-v3: Fix smmu_domain->nr_ats_masters
 decrement
Message-ID: <aKgRKnbBnZ51C-t-@8bytes.org>
References: <20250801030127.2006979-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801030127.2006979-1-nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_234153_066036_28C1129A 
X-CRM114-Status: UNSURE (   8.01  )
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

On Thu, Jul 31, 2025 at 08:01:27PM -0700, Nicolin Chen wrote:
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied for -rc, thanks.

