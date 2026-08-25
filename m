Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635B1C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 20:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFYEPCoxn2MyfT0mq6zzyX/aFE/9XbWP2gpFGV4SkrA=; b=TxqRJKFOel28ac7MXDSHTc795u
	sr6hMISm0L6BwL/IyfcnBqQtFv1sTieK4rEkyA37y0ZIzTjw0vScCU1vAPK/w+hQnXGza8quxM+d0
	itIbFQapeHaF0oQrFo2E3LQbjRBcTOV78z88KSUbVnwM3L0dkiML1b5FeYvReo3gD4XVGl7wLQpwB
	5fGnmBGEI7yO5fl03hn3Aw1otvcX82S+pTDRsTVHtq0yJORoP4ZJtXHsRq+XQOPsB0mrb8XzEtw4k
	ZjW6uh8t3gjLL11VwsXNxJ2HGe0wBFGKpjmPPwz7a7qlMMaYAh9e7e1EAxEiswc8fg/9N8Jk0N8s+
	8ymnO3zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyCo-00000001SKc-3Vsy;
	Tue, 25 Aug 2026 20:57:14 +0000
Received: from out13-75.antispamcloud.com ([185.201.17.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyCl-00000001SJe-2nhP;
	Tue, 25 Aug 2026 20:57:13 +0000
Received: from s1041.use1.mysecurecloudhost.com ([192.250.231.249])
	by mx321.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dan@reactivated.net>)
	id 1wyyCb-009xqQ-D2; Tue, 25 Aug 2026 22:57:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=reactivated.net; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OFYEPCoxn2MyfT0mq6zzyX/aFE/9XbWP2gpFGV4SkrA=; b=F9J12duIT9WRRzljTrYEKAamV1
	ZTvM9qFfEDDAL76pwP3zYy9kdhqcelb3sQKe0UTM84WRXUGeblCoXJdhzKTYwQCZpYLLTrAN12+Lr
	V1VjlNwxx+enC8R0xSE/cFZmXGXru72Ryq0xAvIlX3BdCC4yOKkHoZ7cbvyX1rjMog1tUTrSSeyt0
	TxU9md5vbbPjjY0E32NsOpJcFHlJtMMKR1wm9oklC0ozIqyqET1TOPp8ltTVtSbRSQYfLo3vPj1kq
	VkBKhQaRSokSzOn8NG5+BNo1baHIeuHrurTM1Usjzn4uGEbpHGRA8QMP5BU70IenWn6I15hs84tJS
	TP3kZc8A==;
Received: from [188.251.249.2] (port=59110 helo=[192.168.1.123])
	by s1041.use1.mysecurecloudhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <dan@reactivated.net>)
	id 1wyyCZ-00000007Cd8-01h8;
	Tue, 25 Aug 2026 20:56:58 +0000
From: Daniel Drake <dan@reactivated.net>
Date: Tue, 25 Aug 2026 21:56:04 +0100
Subject: [PATCH v3 1/5] iommu_pt: Fix test_pgsize_boundary() failure on
 narrow-OA formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-bcm2712-iommu-submit-v3-1-7f143e7289b6@reactivated.net>
References: <20260825-bcm2712-iommu-submit-v3-0-7f143e7289b6@reactivated.net>
In-Reply-To: <20260825-bcm2712-iommu-submit-v3-0-7f143e7289b6@reactivated.net>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Daniel Drake <dan@reactivated.net>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com, 
 james.quinlan@broadcom.com, Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: b4 0.14.3
X-Get-Message-Sender-Via: s1041.use1.mysecurecloudhost.com: authenticated_id: dan@reactivated.net
X-Authenticated-Sender: s1041.use1.mysecurecloudhost.com: dan@reactivated.net
X-Originating-IP: 192.250.231.249
X-Spampanel-Domain: s1041.use1.mysecurecloudhost.com
X-Spampanel-Username: 192.250.231.249
Authentication-Results: antispamcloud.com; auth=pass smtp.auth=192.250.231.249@s1041.use1.mysecurecloudhost.com
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: SB/global_tokens (0.00589657339582)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuVXRBeihynGTLmiTFwuxxiisVeY5UDhNC2p
 IQkFJqtCkCu2SmbhJN1U9FKs8X3+Nt06bFpPrNOlRAlE9AVLwR4uGVjKNnzF3nQoDoQtBifM84JL
 M0i5ZAms0EHrvcCaVIPLmt0DcCRdEqg+ayzag3OkGnT3EFAinyrilm9zau/FuzkQt9Nb4Ml7QXdk
 EetczWD7cCGtDjbxRVgnsKOrWMc2eB7itP8hgjDRserKv4bhb7ubyJcscJCC/8jhyq4eIIJWBb39
 uS1TjWG2Inx+Ts2QrtVmombMJ4e2pn5C0yBMHZ0fE47nEjvubMSTLAkKCKefuLbx+lGq0svfyhth
 j0R6Iny++hg9dJLqN5zmWqF/oHgMZXS6X/fIHYslsKU0yPHM4JpSMI47HiFQBsGlm5AygJMVWPun
 1fB37VxVhASG8hN+IElQvHervZEzNuSEoswa+OggXLEoEANlDvY/gFZy/MXBXk8D5mjUeQRayE6u
 dz97s/DG8E3upRpJ0bS+wzRBHUR15RaqDwm4ioO24b2V/xoVM7xa9YKQVz3PCbzL9B0khM/Q6RX5
 n4wBXe4eJbd26ZpMsCKGEUNQoHD1dBwhSjvFGee+Sma/00rxpBtmA6JtX1tl9hlvVkB9JeTcvfje
 ogVSYoS8EzjRInfDtnb9xonw6auRGB+OqkfrxZvcAu63p/UbUTcmIpuXtxg/CxkM6Ccrh6NgeWPZ
 s2GGiUiSf3BA53ZrBURq7d95Cv9KDCFTYFcUbz5aS+1lWj4m3FNu1rSqDrVNGOYEXgKxu9VpMkhE
 mWb0+yA4G0yKmjhEqma1+/4Wol0EDMzOaSXdF5ul5d/P34eiOeGg3eceP8JBR+Z2rauNhtOAipyU
 VUOpJpoR8LmZMG0KW2fLvmDcwq5ovx/jotULrGAMzuIdJELu9Wrt/oF2ofKYeezPZTW+uJOuOlF5
 x2YtjfaUnDylc396zd5b9fxPYcgbuN9DD1eMzs1Q66kV+UAovquwsOu3XxP+6w9smK/hg5o9u16q
 yIzlag+DgD9xY7Yj7fvC65xWAU3TJceJXG+jXar6FtDTl6SazWHDhW0k3iY0Nxd1+egvPpyylyRk
 sDtvh9EglVwlBP3PkVHlQGQFk2KBEkFw3+vw1RS8zKP8o2x05FSSJsC7k+LzVpQY05oubiJ9GrzY
 ++DuIQUs/5JJj4C/n4CILpFTKQlqbzX/LSb50zWeMLtz8gacq+U9Dqtm91PWIuQm3rV3/B+dg9ZR
 A71t3uLj+6JfN6DTVjUszJAalIcW0Bh5dbygTK7jtNAOpOLoYrBwYYKC6XIWdfPsJXrcrDW6vfdj
 zQ6YC7Heg3Xf7O1TOd7yUx++SDY6V9XDGiqeh8jJhxFbE1QSjfwMTndprmVkWxS1mi+nw+nJxqi8
 G/0EWIV2o15nRn/UvQe5+8E1BpORr3Dt2I9RoKK2gSUVBoXloHNHf6G/7NjKIViWFaEeldR/m2+i
 TN8ji+Mhbk3TTo2Lw6nIoDr0sXUZ7YZoZ/GZ+slJL25ATsZTVifNjYlkFmCz0w5vcdcHI3py3L8t
 PqWAmEN/CjKjK3VVq9SDkpBDU8/nN9BMID38D/++xf97O23y3deP8vNnmz84mDUvZqxnHNc/wp8s
 bbUui5b8WkACIg5AB/ilm4apSU2goW8TQ8+z0w5vcdcHI3py3L8tPqWAC7xZyfryQF81aCkSJYKS
 vg==
X-Report-Abuse-To: spam@quarantine16.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_135712_023264_1EDAF0EE 
X-CRM114-Status: GOOD (  11.76  )
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

test_pgsize_boundary() tests boundary mapping with a hardcoded physical
address that requires 38 bits of physical address space. However, the
upcoming page table format for the Broadcom BCM2712 IOMMU only supports
37 bits of output address space.

This causes a test failure as iommu_map() rejects the large address
with -ERANGE.

Drop the high bits of the address (they are not relevant to the
boundary calculations being tested) so that it fits into 32 bits.

Signed-off-by: Daniel Drake <dan@reactivated.net>
---
 drivers/iommu/generic_pt/kunit_iommu_pt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/generic_pt/kunit_iommu_pt.h b/drivers/iommu/generic_pt/kunit_iommu_pt.h
index ece1c9b8c55d..9fc71db74234 100644
--- a/drivers/iommu/generic_pt/kunit_iommu_pt.h
+++ b/drivers/iommu/generic_pt/kunit_iommu_pt.h
@@ -403,7 +403,7 @@ static void test_pgsize_boundary(struct kunit *test)
 	    priv->smallest_pgsz != SZ_4K)
 		kunit_skip(test, "Format does not have the required range");
 
-	do_map(test, 0xfef80000, 0x208b95d000, 0xfef9ffff - 0xfef80000 + 1);
+	do_map(test, 0xfef80000, 0x8b95d000, 0xfef9ffff - 0xfef80000 + 1);
 }
 
 /* See https://lore.kernel.org/r/20250826143816.38686-1-eugkoira@amazon.com */

-- 
2.55.0


