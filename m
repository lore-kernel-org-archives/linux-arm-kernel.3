Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F65C369AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 11:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJvAKjiJHJHSQO2CoKVV4iRVjWsPCO6VX+gjfPZQS60=; b=u6E6DtUag0hQpDhOnhUlZBCmhf
	6wiccE33FR0toOrk/TCNHvmiSdfWBenfELIuaMUOZmfse19Ndw8lgho5DqKjFMOUI86xC5qhYcIfo
	aABxiTixro2/p0jIakE7OIQPgJFq36/1fM/qikw3IIMUXb2Qc4IpVYlM8bV6H/iGgqnbcQ9+ESY/R
	40RHrJ0KnKHdLJGD30AdEpZoJx6C7zuzJL96punLL+eLiPOSJWQPRB/feiMT/zqDLHbD8mKLJ2HDn
	PFSHbBcFbpHUP9jxpzN845G/8IBpRuMZROI5K1L9cD4a3OE/tymhSKenRbQ3lKPNc7E3MqhqAdIxl
	jXCWNvUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3CPi-0000000DV1s-0sWw;
	Fri, 11 Apr 2025 11:19:14 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3BmY-0000000DPdP-1geR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 10:38:47 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 091A247AD4;
	Fri, 11 Apr 2025 12:38:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1744367923;
	bh=xJvAKjiJHJHSQO2CoKVV4iRVjWsPCO6VX+gjfPZQS60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CQOBRZ5eq3e8EAOgPPhvG7ELGqdngO/0tFOjnIwglJKyis8fTGXXknWC9xOJt2GTI
	 owpnE2ts3qi+XWoTFiq0pY4wKq4nj4yMq80clPFNHVIkZv2qKXeF+P7SJHkr2iwBjP
	 zRNGVBpbEmERVURJi0uHZ6/+bvpjb5bl1WcO0OGVkjlu5HfSUbUzI+uar+J175Pa+j
	 /rqgNdfpm1CyiYyW99rcwuz/w9AbnDqoDMp3RIXhLmOTSOtJBbZXfMwDoaYr397W5C
	 3gzjkLvDaBlzrOzUPvDaUC+dmF/Gh2a+7i619+9RUuuAGmTiwWu/vTEmiRxp8OrLdw
	 of1D/4pnwl5BA==
Date: Fri, 11 Apr 2025 12:38:41 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jerry Snitselaar <jsnitsel@redhat.com>
Subject: Re: [PATCH] iommu/exynos: Fix suspend/resume with IDENTITY domain
Message-ID: <Z_jxMcyMsQRJ5WOr@8bytes.org>
References: <CGME20250401202808eucas1p2d2db882c5b7e39bca39e0cf8d7696ca5@eucas1p2.samsung.com>
 <20250401202731.2810474-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401202731.2810474-1-m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_033846_657204_4E03C500 
X-CRM114-Status: UNSURE (   6.74  )
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

On Tue, Apr 01, 2025 at 10:27:31PM +0200, Marek Szyprowski wrote:
> Fixes: b3d14960e629 ("iommu/exynos: Implement an IDENTITY domain")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> This fixes random issues observed on various ARM 32bit Exynos SoC based
> boards, like Odroid-XU3.

Applied, thanks.

