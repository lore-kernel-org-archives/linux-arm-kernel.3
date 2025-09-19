Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AE8CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 07:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ZQBDtNSJJywHTrJvOa6mmo7D552xBfvsP0SNjPK2mo=; b=RTKZJU0bk/3elI+x/pqlbRWE48
	WPODhKXREsy5eAIbbIyOZBRjL8JZhzFMKn0z5TVjTyzjt6XXhwXUZaT/S30NKaxjTlzgmv7barf4j
	LnpTe750z5fJp+XQ+BN9vfLN0j+weXeZuLjF/8gWdF2pKxb2f0VqCEU9qbsODhz6pHfWRFgOM2UvY
	6ovzTST+7zN4wEMEoMPkBVSsmtldhp0jqSxi68gpfloONoU6EYetBWYunF3kBXgNaeour0Skm4lxp
	rOyc24PMXq8n52w6kxfaVX1nH+Q1bKtR+Zk83BaYkbUMLr/ZZq1UctVSUvr8uncItJZCL6Ow6/1DP
	zbtaKsMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVtg-000000028jK-2gC0;
	Fri, 19 Sep 2025 07:51:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVtb-000000028hE-1cTJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 07:51:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0AF7449DB;
	Fri, 19 Sep 2025 07:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CAC2C4CEF0;
	Fri, 19 Sep 2025 07:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758268266;
	bh=APlp1xW8NAQ7jnrv9E9kYLn5pnd6JDt9VpE5agdknts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tsuprpiX71oIEYiECpyW0yByyMrzhbYxUz9A9iK3O7JiF9onfLY+F1SwFA8fZ9P/q
	 ZNW23CMx1Pfs38eVSMGiime8p1dlB+D6Mb0N5i5YHQzk4a14dRGCvI5m8Iid1rUmgg
	 z+s475OhyCB9HbaRIzO/zmFGw9J5dOJs7gBVaSHgGv4DMzjhW++UuwW4PS8hi4lSGb
	 5m4bNRDjOZbuvcdY8/z27UrCwMcN3IWRRm2nZQlXKuvGkfjkHwjGEG0rny0z9Tszyb
	 Cg+e54F5vglpH0kzMVJc2oDTbrr0Y+470SkQ75W6omut85fG12VUCAOcAx8g1ewBZf
	 n8S2C0KxODPig==
Date: Fri, 19 Sep 2025 08:51:01 +0100
From: Will Deacon <will@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Enable use of all SMR groups when
 running bare-metal
Message-ID: <aM0LZVudBKjWuVrT@willie-the-truck>
References: <20250821-arm-smmu-qcom-all-smr-v1-1-7f5cbbceac3e@linaro.org>
 <aMAkJ7CfPQuhvhfm@willie-the-truck>
 <aMBJNzXpQTMg4Ncs@linaro.org>
 <d73e5026-ccb0-4a19-9742-099a0443f878@arm.com>
 <aMsJHheI6Y1V5q74@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMsJHheI6Y1V5q74@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_005107_457471_1018481A 
X-CRM114-Status: GOOD (  15.07  )
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

On Wed, Sep 17, 2025 at 09:16:46PM +0200, Stephan Gerhold wrote:
> I realize it is weird to allow non-architectural features like this, but
> I haven't found any indication that the additional SMRs work any
> different from the standard ones. The SMMU spec seems to reserve space
> for up to 256 SMRs in the address space and the register bits, as if it
> was intended to be extended like this later. That's also why it works
> correctly without any changes in arm-smmu.c: the bit masks used there
> already allow up to 256 SMRs.
> 
> What do you think?

Although it's all pretty ugly, I think we really only have two choices:

  - Teach the core driver code about all this and use an rmr-like scheme
    to leave the upper SMRs in bypass

  - Hack it in the impl code as per your patch

The latter option is probably the most pragmatic (especially considering
the need to handle the virtualised case differently) but I'd like to see
what Robin thinks.

Will

