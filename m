Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361FDC531CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 13:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lrToqYOLFhH+a37iAKtn2F1YCzMAXjDxk7/I/zejNW8=; b=cQOQgB7laJOiOqbdwf9/Xwy1AP
	QL9j1CtKWWCTHwkkrauLz3T4HYof6fLg62N251Isl7pZ2DlYBX7Wtxjx4a+EQZIEX7U6DVMGfl82d
	TfmYdLAgdh0Oi0Jm6qEjwGp3+a79+FEjKEhtbBnDue3fpvwmfDFNAEVE6X+mbzgmjpIk0eL7Mqk8l
	EHn2M2YAMza5lYSOJFvJAAi8Rq/3Wuv8d17bkSmysobUl0pp7/7OOzLnr3u1pN3DG8jUn9QVNZLCK
	9RzXcm0gAuvt6VvDYfRjMxgAi/hm/50cNtnH92wsejsuqsF9qQayGkTzVcIBwSQz2PyhqLCxf8Ett
	+sN2DBjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtSp-0000000ENCv-0r6L;
	Thu, 23 Jul 2026 13:27:51 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtSl-0000000ENAr-2lEP;
	Thu, 23 Jul 2026 13:27:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1784813222;
	bh=lrToqYOLFhH+a37iAKtn2F1YCzMAXjDxk7/I/zejNW8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=kLVYbUv8S31hEiEjkUjGqRJL7g2q6PIOawQpaEHNT0EoXhyyV34gQVnGL0Z+6Dc/u
	 tEbiCmcl79LS6CVpVvm3LGKPZZ+/JX9s5LhKbHJn7Cocm3NKbrfVU9ptdfGBqh6tBB
	 PQyJ9bZCTC5M0chhVZUGRXTh2h0zFvGkshKodfXk=
X-QQ-mid: esmtpgz13t1784813216t40ea92be
X-QQ-Originating-IP: lLHxSerqMQiIyDtaLEoMK+5mS6xI575gAoG/gj5UYic=
Received: from localhost.localdomain ( [1.202.39.170])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Jul 2026 21:26:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13695719421709608333
EX-QQ-RecipientCnt: 9
From: ZhaoJinming <zhaojinming@uniontech.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ZhaoJinming <zhaojinming@uniontech.com>
Subject: [PATCH] iommu/rockchip: Fix silent probe success when all MMU resources fail
Date: Thu, 23 Jul 2026 21:26:43 +0800
Message-Id: <20260723132643.2853525-1-zhaojinming@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: M3ziZXKDk+iOfQ0hQvGGhHXfzZJ7D/54sqqKuhRYVGErTw0U0BNDLmt3
	AO3cxtQaQTbmR7ndocYm3xnx9BkKhL32SnCK29XkcGU3XaafDQH3POIi9bRPhonfFOxNWch
	HEFNnEL5hWU7d83jV3zUdSjHIqlEKEeWxaVVEkOjTA8O/Py1dqN8Nu52ws02YV1Cw9vsHjA
	ItxrhB+7CPw4Rwf43/BcAjZeV0nU95I8tFGpC+dj7W1Q5TZv10PIzKYHfqSrMyglUzejROa
	rmRjByBLDndfeN0V8VkLZyUA8QZG6CJ4u7SLT2sFGbHtrRIZbOMmOQ/d+utWQrMPqpR5EpI
	h31e6JReyo/Nmw1nh0c2I7oVWZvwul+zx33t7ZHAdm1vXyfFHP7RNLQ5RAFhEhBC1COmG6X
	IuMo4YvJNc1pW5+UWJ+e01g4RHZC1xUDcIOX1Qfo9rlpp/i4mcOwqNUKpxw0f7w3mgegv1Y
	EidcPCRS/0osBQuxrgXnauBz9Hwygt2VqHNo2LOKq/thjg/PBHEUiY8xn6MshYT2JogdAM9
	rlI/Ersv32th4sXxd6dStYfLFFVf7GP+wiFO1FN/mVM+8aCgP1DLmzqvTHhYQ0Ocycs0hZk
	fy5rJqti3ROKrG/43ZnD9F847lvSHJPeasmjerMacW5uBPDpbA003jQqvRSshar7JhVR6rW
	c2SSfdZq2wfR3YPSdMh8RSR4vME247c1aLAehP5/yA/q8+u+ShznMLHTQ7MX0J23Iv20IZZ
	DXe9QWqeevmGBLp8xwsNRSjmwXMHlk0ZHhRF5MbX9o2kh7IDRUvNuNh+RkAnPXeJlcoU7Yd
	lRWe8S54PAGC2m7GQ7dnjk3EiKjAKAihgjGqTf3r8xDD741I4HiA/GZ1nwW7kQxbg/tjoJX
	bU3z93mPQM0GLor1rwlMWYf1bHPOijKLsTRJDXD+xba14lpCfSm3qOzlkgojKfAO0y44lhd
	zPnBWkxoTCz4Zh0diqzMyx6G9lHMj3YLPM9N4bhch7uxTC593WhATyHwOA6yCm228XGnBsT
	0R/qG2hnx/2TKmtmkwjKZQQdOddBnRkgjY2/PL/BxVDTgpEKFzu5R9J9HUgCs=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_062748_284769_A9BAECB3 
X-CRM114-Status: GOOD (  10.57  )
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

When all MMU register mappings fail in rk_iommu_probe(), the error
path returns PTR_ERR(iommu->bases[0]). However, bases[0] can be NULL
if the first platform_get_resource() also returned NULL, causing
PTR_ERR(NULL) to evaluate to 0 and the probe to succeed silently.

Return -ENODEV directly instead.

Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>
---
drivers/iommu/rockchip-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 87ae036d6414..32868ea5fa03 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1245,7 +1245,7 @@ static int rk_iommu_probe(struct platform_device *pdev)
 		iommu->num_mmu++;
 	}
 	if (iommu->num_mmu == 0)
-		return PTR_ERR(iommu->bases[0]);
+		return -ENODEV;
 
 	iommu->num_irq = platform_irq_count(pdev);
 	if (iommu->num_irq < 0)
-- 
2.20.1

