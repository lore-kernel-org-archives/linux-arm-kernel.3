Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4664ECCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 09:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FaQviEYyn0aOZw+1EleTHAA/DT/se6i8MN21zy+nETU=; b=bXqCNSNfc3RNT8jYRafpkMROYI
	INLwL81+riSieJE3GXPDohYlyQKLxgHHfiHKFIZPGSZUyP+mF3aeMLfncwma5nzt+PydsSKSk9Hm4
	rOoYUjD3ma0QfAl2Cd99zjeMUK9gqYRluQbKDR9cxBXAmP1GOrxTDoXRT/aiQWCuR47Xg2NvrntNj
	78oKS5bc7GUKmJpdrO18N/BLzEk8IUImSZDS4FVnG8cqbv3QRkDxw++WmdOHI8G3O9wiEprHH6HXg
	a6+orrWXJ91yocN2sl/5Ht+buiks2Pp+elCF5gCL4++65aTGEVxhv4L6IY17OKYTHedLSVDODClJD
	NJ1AATDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9gRb-00000007DSe-28Z9;
	Fri, 17 Oct 2025 09:08:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9gRa-00000007DRb-3IVf;
	Fri, 17 Oct 2025 09:08:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=FaQviEYyn0aOZw+1EleTHAA/DT/se6i8MN21zy+nETU=; b=qS/98Fx4JlOa/34J44GN+CkegW
	FLzeWLZ75Q0dJYndos+V3Kz5hQ/PgSmqWri0bBTObNePucgcwJ1BbA5F92AAb4mHPp9Wpi1nmhYC2
	A8OT1RiEFJoso5s6SB3BaeaE6Jsnaw8/HFYP+8FNHeI5ofILz2Ndk+8IqXGBn9N+8+YiYzJ2Ed8oJ
	8wBNQGvI38nF6lnKQtwi54wL687f5KqNTePqKGrFf6BIiVWIZA0mp4q00cwgeRUkGVQiYEiuGC8gP
	CzBirGzTBEHf8K5VjJjvVK2fRsZ3+KQnlja7M+aGjFtopRjBEz3JjTRWfy2jEWldv5+b7Ra/4SHSU
	905l/lPA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9gQV-00000007Pxk-2kps;
	Fri, 17 Oct 2025 09:08:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CA7E34156D;
	Fri, 17 Oct 2025 09:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CBCCC4CEE7;
	Fri, 17 Oct 2025 09:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760692022;
	bh=ZTKgysNNfScjYNlHG2PtLbUTn95/y+2fnSbvS4Vbw0U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IMpZnIh6Fl3S1fF14hVVKkclmY4figgjW5dWv8yzfQHUmYllVL+zv1TzD2G6X3Kuq
	 P+Q8EHM3R3BPlf5VD0s/9BHK2lYKRqPJ3N0taJYw7NruQfcuAI9tXvxw6l7JCShVIH
	 appo4+HPBUc6ITUcgxKT4/RjaxUPhT2qOHDPbBBl+NXRQar4gw3bRu0wH4xdDkoSXv
	 gEiXhVQWrFnl8Y9UxPCVKsXPZcEA0Z7f/dYU+8DHZwVmFjDMY50rqbOo+J2Kbios6a
	 ATMKiVeHdZWMV5DF2ML79/t6J6zc3ndxAZZnM+u02mXwnDqDDBfs4oBgnp6qBsgYn4
	 uJPtDTNkH79Dg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 17 Oct 2025 11:06:21 +0200
Subject: [PATCH net-next v3 12/13] net: airoha: ppe: Do not use magic
 numbers in airoha_ppe_foe_get_entry_locked()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-an7583-eth-support-v3-12-f28319666667@kernel.org>
References: <20251017-an7583-eth-support-v3-0-f28319666667@kernel.org>
In-Reply-To: <20251017-an7583-eth-support-v3-0-f28319666667@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, Simon Horman <horms@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_100730_782980_9252B47C 
X-CRM114-Status: UNSURE (   9.28  )
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

Explicit the size of entries pointed by hwe pointer in
airoha_ppe_foe_get_entry_locked routine

Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 4b038673cefe20b47c42dd1419c05b57d4d6c64d..eda95107cd1daf6ff00a85abc72313a509ed67e9 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -619,7 +619,8 @@ airoha_ppe_foe_get_entry_locked(struct airoha_ppe *ppe, u32 hash)
 					     REG_PPE_RAM_CTRL(ppe2)))
 			return NULL;
 
-		for (i = 0; i < sizeof(struct airoha_foe_entry) / 4; i++)
+		for (i = 0; i < sizeof(struct airoha_foe_entry) / sizeof(*hwe);
+		     i++)
 			hwe[i] = airoha_fe_rr(eth,
 					      REG_PPE_RAM_ENTRY(ppe2, i));
 	}

-- 
2.51.0


