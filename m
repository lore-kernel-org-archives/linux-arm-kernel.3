Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65315C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 02:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hxvs1qKqYZ45tqEecqh3hweSSHYNecuaYnp9+xZFJcM=; b=o5wlTRDzyalAt3WRy7lRI+MHjz
	8qDo0qA64Rn7WJgHQ9qtFwPRXanFJxF339TRJejG7iaaW1nzZgp7rg7vIeVVJxXtGnKxajqMAqVM1
	ovIuDzJ9a6M96UvKY+f2OfJFou/YJYE5WxAkKUcbWiwsAXRMheYaiTGUKugVnsLMV8DDe8XZ4rVzW
	yhrsIDmh/jB53cfXwdnLOtPKCZkWulMfJMjX6nm9tblUggfbVfgcXvzoi+2oFaeQLgAyw8KI3uOX8
	btkbPVVdEa3TKytd1DpzjXkQorEffmwq79M4bpnOJSqNtwSlNBJYMyCtxp+JZc7Y20TsojOXcVLZY
	TidAffig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyGP-0000000FEEc-0ULY;
	Wed, 12 Aug 2026 02:00:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyGL-0000000FEDn-0P0U;
	Wed, 12 Aug 2026 02:00:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Hxvs1qKqYZ45tqEecqh3hweSSHYNecuaYnp9+xZFJcM=; b=FI1/VPnf4sFRYib4jWxxALVNHI
	K0Nk6p8Z9G0gCz5xAW5qw3WvIcohdR6KfsXrtITnO5B9p7O0U90tiU/ikQ/jVka4GwDQn6Dmt0BIt
	K9PzRaLVeaV6uQzXrO7kTxgg9uqOqHxE8Eft/DLtn9HgTqswNVvGndO8YpRbepPz1jpBkeXKI/WjU
	4k7PmNtLxu0h4UvaXPR+qp6vKRR+tkqgJBbHoLxAe0uX4ZLklnGjWKa11SFGWieg9fdot695/4QM6
	sfrsZw6UDgz+BRwTvxpF+MhBQnySkbdw3bqoIus4NhgGH+uwJYRAcChwTcsmuK5sYTUQoL6N2FaMY
	oetVdZ0A==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wtyG2-0000000F2WH-2ka7;
	Wed, 12 Aug 2026 02:00:11 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67C1xH1N13194414, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786499957; bh=Hxvs1qKqYZ45tqEecqh3hweSSHYNecuaYnp9+xZFJcM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=hxxYr+ZTTCIhIvMqkzyXx0Plk02H3a3SUETSbF4qCwXxnoQwCxyC3cFu2iTZpqzez
	 22Oqf/z54t11beaeLz1hFvf/8pTnSut2otXOiudFG/y28ZQqp+TeiV8VnAXl6oR7dL
	 uUs6mtWVvHEDf1UuOniMcVrdiYqYh47FXaCYtuJN2pKxyv39G2vxVHq+lSKXsgYeuE
	 pQXGuCUblXq3WDqbN/kEVp+jv2KN1NsKvqmyiHmZsvs5WeXLKNspsrQllwqFMPrC0b
	 ENHGOv8uew6ypxHAkv4Cbw78+joxNv+nGMRvJVi2b8vUMFlBcwiOwgkNQhJh4+V4va
	 5IA2UI41RxLew==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67C1xH1N13194414
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Aug 2026 09:59:17 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 12 Aug 2026 09:59:17 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 12 Aug 2026 09:59:16 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.43 via Frontend
 Transport; Wed, 12 Aug 2026 09:59:16 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <tychang@realtek.com>, <linusw@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <james.tai@realtek.com>,
	<eleanor.lin@realtek.com>, <linux-realtek-soc@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<afaerber@suse.com>, <stanley_chang@realtek.com>, <cy.huang@realtek.com>
Subject: [PATCH 1/2] pinctrl: realtek: rtd1625: fix base_bit for VE4 GPIO 13
Date: Wed, 12 Aug 2026 09:59:14 +0800
Message-ID: <20260812015915.3477180-2-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260812015915.3477180-1-eleanor.lin@realtek.com>
References: <20260812015915.3477180-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_025955_700141_932CA829 
X-CRM114-Status: GOOD (  11.93  )
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

Fix a typo in the base_bit of RTD1625_VE4_GPIO_13.
It was incorrectly set to 18, which overlaps with GPIO 16.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 drivers/pinctrl/realtek/pinctrl-rtd1625.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd1625.c b/drivers/pinctrl/realtek/pinctrl-rtd1625.c
index 2d623bdbf9ca..796e51f9dff9 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd1625.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd1625.c
@@ -2867,7 +2867,7 @@ static const struct rtd_pin_config_desc rtd1625_ve4_configs[] = {
 	[RTD1625_VE4_GPIO_6] = RTK_PIN_CONFIG_V2(gpio_6, 0x1c, 24, 1, 2, 0, 3, 4, 5, PADDRI_4_8),
 	[RTD1625_VE4_GPIO_7] = RTK_PIN_CONFIG_V2(gpio_7, 0x20, 0, 1, 2, 0, 3, 4, 5, PADDRI_4_8),
 	[RTD1625_VE4_GPIO_12] = RTK_PIN_CONFIG_V2(gpio_12, 0x20, 6, 1, 2, 0, 3, 4, 5, PADDRI_4_8),
-	[RTD1625_VE4_GPIO_13] = RTK_PIN_CONFIG_V2(gpio_13, 0x20, 18, 1, 2, 0, 3, 4, 5, PADDRI_4_8),
+	[RTD1625_VE4_GPIO_13] = RTK_PIN_CONFIG_V2(gpio_13, 0x20, 12, 1, 2, 0, 3, 4, 5, PADDRI_4_8),
 	[RTD1625_VE4_GPIO_16] = RTK_PIN_CONFIG_V2(gpio_16, 0x20, 18, 1, 2, 0, 3, 4, 5, PADDRI_4_8),
 	[RTD1625_VE4_GPIO_17] = RTK_PIN_CONFIG_V2(gpio_17, 0x20, 24, 1, 2, 0, 3, 4, 5, PADDRI_4_8),
 	[RTD1625_VE4_GPIO_18] = RTK_PIN_CONFIG_V2(gpio_18, 0x24, 0, 1, 2, 0, 3, 4, 5, PADDRI_4_8),
-- 
2.43.0


