Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBD4CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 05:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=da2BEaVwQwnW5q0LhsJRvx8hShgrOg2AUZE7itSumgE=; b=iuenut+7e3EEpG8VMUtdRawwBK
	wTN/DNFSsim5wloKSne5ynRHyfEGa3JWzkS8Ug5+p6FHN0NvObYSzDphi7zrcmxNFRaeKOx7Icyw0
	3x9SfVCeQA4OtdJ7A5R7gf+PPeTY5oif98WFO9v33ayF/c+kp1fTsliqRrLLiHSOwki05em8lvYpe
	BCyhvUIkI1HOGMc+4oI4OY9HXQKoYBdpK50O5jFtp5f/opArhqY2qvjTEsoinRwMm/EW6Wwo1CVMX
	IC4aYyKuoRhPhb75N2oR0qZJ7RvyD6dga2hzYKPkj2156o/wE1OxomN7hwA3xgIgETRPqQUwDel7X
	Dr2evALw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxJH3-0000000DQjs-2Hsg;
	Sat, 13 Sep 2025 05:58:13 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxJH0-0000000DQix-37WS;
	Sat, 13 Sep 2025 05:58:12 +0000
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 20DBB4FD40;
	Sat, 13 Sep 2025 07:58:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1757743086;
	bh=TdTQRlOgkFFp121tWctGOE7zJMN8424tRrjVZduIikg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XqK1+UPuImxMQZCxA6SMPJbtwsVcWCAEAh20urbbjeTj7wMT+Sv/Pfi6Luy1xLiJB
	 K4wYK1jOR9pgBY4L/Z+Hifkxw4YopSYDUrHwlrgPTBeytduGK1/BEJG1rVUjO46x/m
	 It4hn6eb/zBK1bX/ddQEjFCD0xWQqbohk+ZnuCQgdtSsZyaEGznKDVbS2Nv3uVqLls
	 6T3cqm32KoGrl6CT1weUyJ2Gl1KkhRgNGuJd0gERBjHseLnsxapr/baWqBostSLSxR
	 G45QWT5TqIuGRW/J7eTwrH0PUeDSj+ENwVNo36DdZK7uHzSx4Xrkh1XJdLQwC5xlqD
	 T0WyvAhR7p0WQ==
Date: Sat, 13 Sep 2025 07:58:04 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	robin.murphy@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	heiko@sntech.de, jgg@ziepe.ca, p.zabel@pengutronix.de, mchehab@kernel.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, kernel@collabora.com, 
	linux-media@vger.kernel.org, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v9 3/7] iommu: Add verisilicon IOMMU driver
Message-ID: <rt6nvgazcl6mvyy4iuut3n7irf72t7rex2iwabbkuxp7cdvez5@2nanenqgxjdy>
References: <20250911155720.180465-1-benjamin.gaignard@collabora.com>
 <20250911155720.180465-4-benjamin.gaignard@collabora.com>
 <vrngq76nnms3jyl5hnxqnkimjc6kil66o6fdyqn5vm3fpovmja@cfynipjw7ktp>
 <694b9ba15cd67f41a38f4a65a3811f035cf8e99d.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <694b9ba15cd67f41a38f4a65a3811f035cf8e99d.camel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_225810_997722_171DEC91 
X-CRM114-Status: UNSURE (   7.51  )
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

[Adding Will back to Cc]

On Fri, Sep 12, 2025 at 01:37:11PM -0400, Nicolas Dufresne wrote:
> To me this rejection isn't about Benjamin's driver, all iommu seems to look
> alike, so anyone else that would have sent new driver would have face the same
> issue.

This is about ignoring comments from one of the IOMMU maintainers. I am not
going to merge a driver with open comments/objections[1] from Will (and a few
others), so resolve this with him and get his Ack.


	Joerg

[1] https://lore.kernel.org/all/aMAno-DkDJumcAtj@willie-the-truck/

