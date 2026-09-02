Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AA6C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 17:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEt0FZh1h7xpn4K7s6fu7UzabzsKhHO6udvMeZH/uZk=; b=xEfPkMSyJ0EDiI4BzZ7JdX+SmF
	gQyQpIN6xY7zo2dJf/er1S0cQgLPOIpbzK6nQcrNBx9/wuzA6jfi5xzX0qiOYKeUP/a83es6dVE9Y
	z5+dpf2c9WWKpXAw3ffoqL9Ob/sKvmeBRAgLsbVU4Hb2S6jHIUNvoUOUHFyEc0fx/UBPVMUx2S/1Z
	Tdwt5/G7OSKZKSoYwafdri94Udy9BEn7ZTGd5nZvy7Z0AHs2BsNGDiOgy/tcsVySqHJ4SAHzftSbE
	sVhu44I94osJlVuD1N1Qv7ScYQwU0Z1fTqU5dnKBwLDgnrdhUAtfyAwmc6bh/r0KUDAOTviZNy1Uf
	EEoBbZCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1pDp-0000000FVrj-1M5d;
	Wed, 02 Sep 2026 17:58:05 +0000
Received: from out16-185.antispamcloud.com ([185.201.18.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1pDm-0000000FVq0-10wE;
	Wed, 02 Sep 2026 17:58:03 +0000
Received: from s1041.use1.mysecurecloudhost.com ([192.250.231.249])
	by mx322.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dan@reactivated.net>)
	id 1x1pDc-009oNV-Hm; Wed, 02 Sep 2026 19:57:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=reactivated.net; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uEt0FZh1h7xpn4K7s6fu7UzabzsKhHO6udvMeZH/uZk=; b=Z6F++i9KgG6GD3jlFrMtRACGEf
	x+da8bu2Zd9j0VY9ZG40KEvzPvhR8yL2BgDz4oVsL6E/gQ9/wP5e9YvafgiwtnfCyyWkBojVPEu6C
	CYR+3p+F6EA6/rtKeAiPZ5Ii6I8QLngJh8WC1GP0NfXXLcVpC3J94SJ7ZOvZOPLMhvthfZ9foC9o2
	Ek0nKnuaMsataqqAJrFalNf3OjuPYGcBpeShi0MA74xFVM6DjKn8+zJ4/y5nSJLIgex+d65GUgrYJ
	zl6wSALOaP6MSKyJVxyOu61tKEQEVAsCGpEl6OvwniEvkNnISN7IqvSU9KUqA98124YK2bxkSaXLo
	PCx7zXIw==;
Received: from [188.251.249.2] (port=45118 helo=[192.168.1.123])
	by s1041.use1.mysecurecloudhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <dan@reactivated.net>)
	id 1x1pDY-0000000F9KQ-3ANA;
	Wed, 02 Sep 2026 17:57:49 +0000
From: Daniel Drake <dan@reactivated.net>
Date: Wed, 02 Sep 2026 18:57:03 +0100
Subject: [PATCH v4 1/5] iommu_pt: Fix test_pgsize_boundary() failure on
 narrow-OA formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-bcm2712-iommu-submit-v4-1-9dbb657578c1@reactivated.net>
References: <20260902-bcm2712-iommu-submit-v4-0-9dbb657578c1@reactivated.net>
In-Reply-To: <20260902-bcm2712-iommu-submit-v4-0-9dbb657578c1@reactivated.net>
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
X-Spampanel-Outgoing-Evidence: SB/global_tokens (0.00340747804734)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuURYIcqJYgXdt6wOxD7aGQHzZ8BhSPZL1cz
 XB8iudZvfiu2SmbhJN1U9FKs8X3+Nt06bFpPrNOlRAlE9AVLwR4uGVjKNnzF3nQoDoQtBifM84JL
 M0i5ZAms0EHrvcCaVIM/7hzmRCZMm1kSJI/8ywn3GnT3EFAinyrilm9zau/FuzkQt9Nb4Ml7QXdk
 EetczWBpY9ovdkP9RmEvieRDWoEFGZ7f+7oeClYYrL6OxfWC1jM0MOKiGRkxO3FaI58br05WBb39
 uS1TjWG2Inx+Ts2QrtVmombMJ4e2pn5C0yBMHZ0fE47nEjvubMSTLAkKCKefuLbx+lGq0svfyhth
 j0R6Iny++hg9dJLqN5zmWqF/oHgMZXS6X/fIHYslsKU0yPHM4JpSMI47HiFQBsGlm5AyJ9N3+CB9
 4aFbAhtG8w3Ly5ZVKmISsN3IhGLWYd0758XIiXx6YYOeazosCcxmb7RWPITtorGl87DPy4ds+UWq
 MUZTL/tWkSfK5K31nzL0AFHJBtc8x8t5TwPji0j+tEORarofO5AIaedOveY7zQj5YZ/cd7uPDhKh
 WGZMn/d4/04OdrifJPLFYXIpN2MC8oCi+3TnddL52Wxml9vX6xG9HT1hMqJwIOFdI2S/IkjHcgoN
 +lE++lajS+EBz4etym25QPOIjlkSAfAYMUguLL/iJ3dHHZk8+BacxJzH0Weev4hlgCBkpmIIyJOF
 ryTdK/1e0oTCxtGGr3tflBYFGrNrmHsCV6TDdtit68pQ4Nki0TzxZwPxmW1OTT5gM4+GMuFG0h5K
 1JfG3OtnsbD10lahPkuf+eM3l5KPnbp/eQthjVMIXiM548XiUPzdeM2DpJkNlS+QlzUpPwM5oicr
 BfHSx0cq8sPOf6wGW9u/lWd24hqw3yFuMpe/j6ywHoVhi9eN8zV1w9vIuEkKCYJ47Q917xCQbH1y
 M38733VOnxhw2U5RfvwcBhGdh7y1bw2tAk6MiqGkBrRAoXiKcRnEPA3cog/JkEYusjKvZuah7Eo5
 LC3lag+DgD9xY7Yj7fvC65xWAU3TJceJXG+jXar6FtDTl6SazWHDhW0k3iY0Nxd1+egvPpyylyRk
 sDtvh9EglVwlBP3PkVHlQGQFk2KBEkFw3+vw1RS8zKP8o2x05FSSJsC7k+LzVpQY05oubiJ9GrzY
 ++DuIQUs/5JJj4C/n4CILpFTKQlqbzX/LSb50zWeMLuo5Hnmju/07lE8IgUQIRKq4wpDiNg26VD5
 h9g0J/CmRqJfN6DTVjUszJAalIcW0Bh5dbygTK7jtNAOpOLoYrBwYYKC6XIWdfPsJXrcrDW6vfdj
 zQ6YC7Heg3Xf7O1TOd7yUx++SDY6V9XDGiqeh8jJhxFbE1QSjfwMTndprmVkWxS1mi+nw+nJxqi8
 G/0EWIVPrm1vwD4neGesGpTedY39WcqTsQtfSPgwkpcj1YhLdnNHf6G/7NjKIViWFaEeldR/m2+i
 TN8ji+Mhbk3TTo2Lw6nIoDr0sXUZ7YZoZ/GZ+slJL25ATsZTVifNjYlkFmCz0w5vcdcHI3py3L8t
 PqWAmEN/CjKjK3VVq9SDkpBDU8/nN9BMID38D/++xf97O23y3deP8vNnmz84mDUvZqxnHNc/wp8s
 bbUui5b8WkACIg5AB/ilm4apSU2goW8TQ8+z0w5vcdcHI3py3L8tPqWAC7xZyfryQF81aCkSJYKS
 vg==
X-Report-Abuse-To: spam@quarantine16.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_105802_293303_FA0203A6 
X-CRM114-Status: GOOD (  12.49  )
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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
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


