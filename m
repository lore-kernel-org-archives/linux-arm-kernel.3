Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45547CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NIgVwvY6IewK6TNQqYKcV//Qio7X17sC+8U3nqOmNuc=; b=gnafTFt4eDoVpNdPEPxK3ZhU2d
	m4pBIfHIx/BeGmJ9D0QREF2WVTd7N9sjLEjxszBRAJvRc9yH+pYqVGQJKB1T0Dj+Y4UULVCUweU7D
	7iQNaewdSfprb+Sc8eIaupPx7cq12eIz9GgoUU7e9ziKwrgKb69MAsN7PUUWSGdPmVtWXBYG9e91r
	SZmkm/DWS763Ax4wBum4PSRCu7S62m+azGFSdIVheNElvJpxTydJp6QEWLUIywdNX1bwxBhRfWb6J
	CAppu+MmS3xeCaPDmhTrYsZcq4c+CusGNRdkKH+ASWwithJtN9yoQUYxNegn/hVM818j8Hszx/9xu
	qhPh0ZTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDCI-0000000FurQ-0J5B;
	Tue, 05 May 2026 10:40:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDCH-0000000Fur0-1c4R;
	Tue, 05 May 2026 10:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NIgVwvY6IewK6TNQqYKcV//Qio7X17sC+8U3nqOmNuc=; b=S36cxGmcAYVVE3NpVPS7poP+PE
	PCzyHGKA7tIOOmgPiqW1Vv6V6OADw3OEmSyF2pTjU/9q7QFIi+tm8AYyz0pD7iJKJdPZsRH4IqAY5
	lopusJgjbgz+IL1V+SUe65N2s7xRnF2to7DXI/nIyq+uXcFPmcvpq16vZ+sKHDUVLZwztJVmulK2N
	iFD8l+WLzmsfJAqiFPutQCjPAQFfWRpvH3hBSlq1hbMe44fKFWFcVCQ1FukBLRm/KIkdg7jq1qP+b
	3d2sxwO9UvcADMsmcBQdR3umQEqDphTG+OCl4w9j5wMOIx/92eaWMlsFbGOaHdXg2ckllhbGk33wS
	j7Lc9nhw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDC6-0000000DE9J-0y0h;
	Tue, 05 May 2026 10:40:04 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 645AdthiF1157147, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1777977595; bh=NIgVwvY6IewK6TNQqYKcV//Qio7X17sC+8U3nqOmNuc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=XpBxw0RZfi7E2dbNjI6FzZW7e9Dppg2iAMATHucJFAQAulNe7EmP0GsysbeV9PAi9
	 dCI01Y0x3fNl0XrweM3lo2NPK4x9NOQrxxBqz2l3hWEzj2l27HvfVA67OQlMP2D2Et
	 bgNIX6Qs7p0XizgXQtqYn/6SXG6wXNQ7akbgVdaEJNLQyNNrYYcWcLsNf/YRSYCc9M
	 5wj1Z8GeVnjVVIDsBADxOvc8nV9nxW9j5qchsrxIYu4UFrvzFpSK03AjIc+7MqQ9PE
	 9vWaUMNsoHc28lgbwyKYJotfMHJa06oKMySKePPQjcf8HSE39X0FmGNcw6WUt1UXrI
	 Nzl0iEFTyHNrg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 645AdthiF1157147
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 May 2026 18:39:55 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 5 May 2026 18:39:55 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 5 May 2026 18:39:55 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <soc@kernel.org>
CC: <james.tai@realtek.com>, <eleanor.lin@realtek.com>, <afaerber@suse.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>
Subject: [PATCH 1/3] MAINTAINERS: Add maintainers for ARM/REALTEK ARCHITECTURE
Date: Tue, 5 May 2026 18:39:53 +0800
Message-ID: <20260505103955.1010130-2-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260505103955.1010130-1-eleanor.lin@realtek.com>
References: <20260505103955.1010130-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_114002_674485_58480549 
X-CRM114-Status: UNSURE (   9.93  )
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

Add James Tai and Yu-Chun Lin as co-maintainers for the ARM/REALTEK
ARCHITECTURE to continue supporting Realtek SoCs.

Additionally, based on the discussion, move Andreas Färber to a
reviewer role and update his email address accordingly.

Link: https://lore.kernel.org/lkml/bbabf0f1-99fa-4822-85c8-df76ce89da01@suse.com/
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: James Tai <james.tai@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 71f6968fa695..b66b739ae2ca 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3346,7 +3346,9 @@ F:	drivers/irqchip/irq-rda-intc.c
 F:	drivers/tty/serial/rda-uart.c
 
 ARM/REALTEK ARCHITECTURE
-M:	Andreas Färber <afaerber@suse.de>
+M:	James Tai <james.tai@realtek.com>
+M:	Yu-Chun Lin <eleanor.lin@realtek.com>
+R:	Andreas Färber <afaerber@suse.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-realtek-soc@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-- 
2.34.1


