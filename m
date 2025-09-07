Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BA2CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 18:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bpb81yFs8TLty9/uuEQTt5yzSnG2hj/7jGaEJRUiQBc=; b=QBKNkrYHNgLlHM
	H7j+FyM87FTOCqQJbjvp7nXx7gu483SjUofSob0xGGvVVUCYPddeJQNpTQgfzYYj6fUKKvcxTLeOj
	H//Qxv+A6QciRnQesR4svRMcjO746DeoxM9VMf3OtM9Vf3xe6TG9JwU/l5EFnBzXsEScSnARbRHK8
	IST0qffJh7ChS2f9D9zQunXc+XOA2wVOgnLU5Dv4+FcfTqF9ITVkoqQQg37uF+AJz9QAzvgWR7c2D
	+whiuz/R4yrSTCOVuMlJwjQrZYENoeA7CKhQBN82aj7NRWJrmk4srHdITzNTOYu6yKqfD4UudocAM
	wsvb2Bz4oBLG8lScRM/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvKED-0000000CK4y-3pbI;
	Sun, 07 Sep 2025 18:35:05 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvK80-0000000CIp7-2QVs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 18:28:41 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 587ISDn33631540;
	Sun, 7 Sep 2025 13:28:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757269693;
	bh=bpb81yFs8TLty9/uuEQTt5yzSnG2hj/7jGaEJRUiQBc=;
	h=From:To:Subject:Date;
	b=CmZvVuXYFzDpFe7L9aA6SP6fjbb3/a/0MKtNAlwd3w1/5FwgKaJ32B/+RPprZJNpq
	 5JO85VvzqlirwhCXm04COJ2Fcl9MdrCMGgpFSSC6fV9jocPPcHY+t1Kd5ARXgtrRvz
	 t84rO0ZNEzFiaDY8xMVBp5sNrUh+0y2z9o3zie0I=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 587ISDQn1851301
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sun, 7 Sep 2025 13:28:13 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sun, 7
 Sep 2025 13:28:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sun, 7 Sep 2025 13:28:12 -0500
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 587IS7UQ3565173;
	Sun, 7 Sep 2025 13:28:08 -0500
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <r-ravikumar@ti.com>,
        <m-chawdhry@ti.com>, <b-padhi@ti.com>, <u-kumar1@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <tomi.valkeinen@ideasonboard.com>,
        <aradhya.bhatia@linux.dev>, <devarsht@ti.com>, <s-jain1@ti.com>
Subject: [PATCH v2 0/2] Update DSS EDP integration configuration register
Date: Sun, 7 Sep 2025 23:58:04 +0530
Message-ID: <20250907182806.1031544-1-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_112840_659994_55DF9106 
X-CRM114-Status: UNSURE (   8.87  )
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

This series fixes the size of EDP integration connfiguration register space
for K3 J7-family of SoC's.

Changelog v1 -> v2:
- Removed extra line from commit message.
- Added Reviewed-by tag.
- Added fix for j784s4 as well.

Link v1: https://lore.kernel.org/all/20250904050940.2913567-1-h-shenoy@ti.com

Harikrishna Shenoy (2):
  arm64: dts: ti: k3-j721e-main: Update DSS EDP integration
    configuration register
  arm64: dts: ti: k3-j784s4-j742s2-main-common: Update DSS EDP
    integration configuration register

 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi                | 2 +-
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1


