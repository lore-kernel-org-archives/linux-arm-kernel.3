Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47827C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 13:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTWVqg5kgZHclKGLvF2MA0D0VxEdp3Ov+OmIhdVJWW4=; b=0w/C0eb8c6TxZVFbFNrHZ+lO++
	dcDwhAeKqUqod8/62yB04tgK6ZqTaErN0DMaDwWOhwUlqsYNdSQhm3i4cZU/mji4SScFxJ+TG6f2P
	g2MQBdQ8NfwgR3P2Ek4gcQhYAO3kOUNVdle55QIO3uIeopUcqIepwMxGblUfDmnTu0Dj3axnT8uao
	x0MvbZ/VfmmjzugFTwSqeVpX4ORPgVkWQs7epX1aI2PwQI8xcRVFpV8hkejGInyBaHp+KlGCTVFu8
	oeq7li7y/LnRvWYXUUnrC5X+957UU9XxTc5bbkx6ezUxI52OelykLHf1+bciaZssi/wJ4NQYSYYO0
	ObSQf1Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAodF-0000000GMjG-3Y6k;
	Sun, 27 Sep 2026 13:09:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAodE-0000000GMj2-2ooe;
	Sun, 27 Sep 2026 13:09:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B89C060D79;
	Sun, 27 Sep 2026 13:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5ED25C4AF13;
	Sun, 27 Sep 2026 13:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790514567;
	bh=VV3PcSRW35Gh+Yndg2F831wLiF0LGsxmujAoDExyn0g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YA+SdiUTDHUrzX4RMKaOq+lhn8PAPgEuhF25f2k7zwxR12n4kBjCd4rOj/umWp3eF
	 AHpX4YndMFCE6QiLL5dKEiq9kKLG41wsOZ5jCEJrFTjSFb2JnZrprHEdXpJlvMkMyD
	 JNmgOK7gBN1DHA1FvQKpaZxrl2uslxuCCGVinkpwxUkIPw9tdPHSy2quOBoKY5cnN9
	 OWHd41rnZgzSRgGjqx7jShxCNENXwG9AxG4ZNs9E6EgSE+uR18ex8ugFBw+YV1/PzI
	 d0XfASa08RCaq+C2tLvgYIpmxjHm+ypQPzEwBsdyCHws6k0CBkxeRIfzgaIQgcbCns
	 JteDxE86s4wBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E8B7C9830E;
	Sun, 27 Sep 2026 13:09:27 +0000 (UTC)
From: Daniel Drake via B4 Relay <devnull+dan.reactivated.net@kernel.org>
Date: Sun, 27 Sep 2026 14:09:00 +0100
Subject: [PATCH v7 1/6] iommu_pt: Fix test_pgsize_boundary() failure on
 narrow-OA formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-bcm2712-iommu-submit-v7-1-dfa2b975cbc9@reactivated.net>
References: <20260927-bcm2712-iommu-submit-v7-0-dfa2b975cbc9@reactivated.net>
In-Reply-To: <20260927-bcm2712-iommu-submit-v7-0-dfa2b975cbc9@reactivated.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340;
 i=dan@reactivated.net; h=from:subject:message-id;
 bh=JFow46Vnz8reduVDvIc0YSORwX6vyQZXYpGoWC0l8YY=;
 b=kA0DAAoBw+aPsVMUR7sByyZiAGq5FYShEQEKIjovVnD1hOPwEinZcQ0OYFUbR7fJ9dJFV2SiT
 IkCMwQAAQoAHRYhBDpF/SxQ/WISFd9V+MPmj7FTFEe7BQJquRWEAAoJEMPmj7FTFEe7Qv8P/i1o
 7q0v4JhmkVXw0zJ3ay5fArpJIAHgLXLRffJNLdwrOa9YfVsn+D0/FX3kLS9tAdMVGBNbT5Z1hR8
 RjUtf+wj18jGAjjsE1d99HDuEFI5fVUlA9QR5QIgtnHTx07FYUITqCMHnYwLv88NlS29vqJESlQ
 C6/6j+RRAkWz0ce+mDMwXwW/QBwZx8SCrfCkLoJa/7NGbIRXFMwa3EEL6bA4tCGYZqc+1kFBYqo
 2qcesp1j3zUAUPwgnb+0x16mD0jHaboMIDNqUT0lk+oUrSXbr8rHERHdv0Rrc8UDXEHGIKFzo98
 82IHDfIv/4Zuf7JXFrHMHtqhnYSdyucJP1qUffTeWok5vsADncPF0Yn+uHz6xyU38oIKnShjs7x
 VyhC8bYCe1HpStUZVRdl2hSnWGErXQ3ndXMaZwt5JpAYiHa4feODm7rSowu0aMzLsOEPooWjsZG
 B97JQ6SZZLzQO5dhLZWRO9Saaxz+2SGBtTaV6z04u1DNKyU9n+nd4rgVgwqCD3TVjTcrpQpNQB+
 DhIWRvGUuIGcZvzgzFehHyztrPx3uxMLUiZiGJ1gBpdeYbFB5AMqogfYGkneIe9tk910cs+Pxpu
 6UYDWUNWbhkufG01535W/S2IAYLEPd5o/eQHcwtkVAek+lz+Bah1PpxaPXFU3DqhqfS+jQw3/vq
 dU0yA
X-Developer-Key: i=dan@reactivated.net; a=openpgp;
 fpr=3A45FD2C50FD621215DF55F8C3E68FB1531447BB
X-Endpoint-Received: by B4 Relay for dan@reactivated.net/default with
 auth_id=1070
X-Original-From: Daniel Drake <dan@reactivated.net>
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
Reply-To: dan@reactivated.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Daniel Drake <dan@reactivated.net>

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



