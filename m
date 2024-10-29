Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C84D5B16F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 09:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pyXqryZnQWJUHD0P+wYFIgTVSYyxdvqqM4xw2mTbhw=; b=A6t+bJqshvgoN9I9yMAzoQQFsl
	786413TfQcI4FAruAg8pmjMCf/o8hXrX7HJdlFu9n2UJ2p1py7aBlfxBXDYQ8YWrQRCf7D6LsrgcI
	+SCuEgdh/7i72lEnEAyr4F1wWRCaCLulJF9NrNbecvr8x1hWj03ITCi/aOI/hsN670jzkD6NdK4Nv
	5/zpjYiYRGciRPctS04RKNol6qCVQaX77h6iojOt/Ryw4d62lQ3dCbn6IMh6eAA6/HEro/Z/Zzza5
	cpPXngDYXDaimQk4MOScqXeDRn6JErvEqJIXg/tFGI1JD5EVTXXBU8MZMxg8xm+pJ070qMoYkLoiJ
	tSf0wiMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5i6q-0000000Do5j-0sMz;
	Tue, 29 Oct 2024 09:01:52 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hv0-0000000DlM6-3tnI;
	Tue, 29 Oct 2024 08:50:10 +0000
Received: from 8bytes.org (p549219d2.dip0.t-ipconnect.de [84.146.25.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id D77FF2A8D41;
	Tue, 29 Oct 2024 09:49:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1730191778;
	bh=t4F6EkQzc+Tx2dGrpH/0oshPhSFvIj0HR4NfuwzqRJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aUQ6xfw4G2fAmph3fMFdnFmV5d7IVswiGPxXeaXX/I9SmikyU2MAAf+y4Isth8Y5K
	 p21a5tZ9rsQN0CxRZso6IVwby5zEOcH2BVQpWpR9rDow9TEbXHCS92Z+0aheRh471F
	 xHWeF+1O85Qp+VWsrNNEHC2kW6wmlznAOKjfdfyX494GntCf2fDENFo2kxeRU2udOd
	 zTifyhsLLwcopsEVsl7OaOng1N2eL6IcVYq8qymV4U36kJb5amFqmOiZ4p0BD607Hm
	 qoqV9iL1vxQfocKm3vi1TXeIE060idIsNLCclyrLXHabpebwZBZ1UagunS4H0Aie/g
	 uuXtwG4E1t3hw==
Date: Tue, 29 Oct 2024 09:49:36 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Konrad Adamczyk <konrada@google.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Wojciech Macek <wmacek@google.com>
Subject: Re: [PATCH] iommu/mediatek: Add PGTABLE_PA_35_EN to mt8186 platform
 data
Message-ID: <ZyChoFmaID6aGQT1@8bytes.org>
References: <20241017112036.368772-1-konrada@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017112036.368772-1-konrada@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_014939_134239_EA8A1E64 
X-CRM114-Status: UNSURE (   9.33  )
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

On Thu, Oct 17, 2024 at 11:20:36AM +0000, Konrad Adamczyk wrote:
>  drivers/iommu/mtk_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

