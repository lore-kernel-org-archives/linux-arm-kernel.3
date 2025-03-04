Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CBEC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 13:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sx0YCaXeKShwrE/m6agNawDS0BbMWcKtDVV1e8NgZ1I=; b=UFj8mHcF+pGFfESQA60sw60qDC
	CoyYYWRnHaAzqeOsaDWVGt66M0pq00k4FoIoXxrZhboVlCOpwNFOaQEWT1xM+JJItJHCiCSYcpiTW
	gcNH5h6WLJtn+A0yV+3PghD4lLX/QlGktZ2R/h0ldQue6HtiPdt6Ag+qduY0zV2ZbLx4WAn4GrWLn
	rCvyJCn2jwfqTvPhtS+6L3kIty2jQEvE/mk0sP4rKQgsiw1e5L/bNA4xLGOcw9Utx7g6pYZCAw997
	hZ+81V/rbVnXhvrerJzcKAD7q+BLqjWkOgILYpGf2Tk5xG5D3iWWWJMP9UmkKb6d6Pk0IGX4oHjWM
	BpIBAZ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpS6d-00000004kth-0HVB;
	Tue, 04 Mar 2025 13:14:43 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR00-00000004VsG-2tih
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 12:03:49 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 524C3QsV3589547
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Mar 2025 06:03:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741089806;
	bh=Sx0YCaXeKShwrE/m6agNawDS0BbMWcKtDVV1e8NgZ1I=;
	h=From:To:CC:Subject:Date;
	b=bpQ4SNJJ5I73c5pFSrVx3egsUXZLZGRIyHzYUXwfxpfuh76M8r2ODqwdvSA9UA48j
	 MMrBKWzzHP6oilxSnurUs9iWrWnAOFTMLKOyQlNPCW099dGcJBIHl/dqWPYk4GpIN/
	 v81Pc4b6Lc4Pyx57xf4QnIsJfbQ7wjXjPZXSJWlc=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 524C3Qva070667
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Mar 2025 06:03:26 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Mar 2025 06:03:25 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Mar 2025 06:03:25 -0600
Received: from hp-z2-tower.dhcp.ti.com (hp-z2-tower.dhcp.ti.com [172.24.227.4])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 524C3K2A035887;
	Tue, 4 Mar 2025 06:03:21 -0600
From: Hrushikesh Salunke <h-salunke@ti.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <quic_bjorande@quicinc.com>,
        <geert+renesas@glider.be>, <krzysztof.kozlowski@linaro.org>,
        <dmitry.baryshkov@linaro.org>, <arnd@arndb.de>,
        <nfraprado@collabora.com>, <quic_tdas@quicinc.com>,
        <biju.das.jz@bp.renesas.com>, <javier.carrasco@wolfvision.net>,
        <ebiggers@google.com>, <ross.burton@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <h-salunke@ti.com>, <danishanwar@ti.com>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH] arm64: defconfig: Enable config for PL2303 USB to serial adapter
Date: Tue, 4 Mar 2025 17:33:20 +0530
Message-ID: <20250304120320.874617-1-h-salunke@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_040348_812728_BF3EB57E 
X-CRM114-Status: UNSURE (   8.49  )
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

Enable support for Prolific PL2303 USB Serial single port adapter.

Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
---
This patch is based on commit
20d5c66e1810  Add linux-next specific files for 20250304

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 3a3706db2982..8b233b7ea857 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1113,6 +1113,7 @@ CONFIG_USB_ISP1760=y
 CONFIG_USB_SERIAL=m
 CONFIG_USB_SERIAL_CP210X=m
 CONFIG_USB_SERIAL_FTDI_SIO=m
+CONFIG_USB_SERIAL_PL2303=m
 CONFIG_USB_SERIAL_OPTION=m
 CONFIG_USB_QCOM_EUD=m
 CONFIG_USB_HSIC_USB3503=y
-- 
2.34.1


