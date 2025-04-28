Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14676C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 12:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iW5UthSAfG9p2EdnrYC7wnlYQMDTwki3KWY3AVQ73rw=; b=yLpWeKcCBtnMnDDujgdrQVt5SM
	q3ttxHoGCmqfmGLibrDqAwmw+cyoCuyBvYJ24zlMQTakkI9ytr2yFMuPiPom+91Dyj8HnJvUvFo5f
	G5+6bErHBVpX3nXbQy/t0NQ7vgEI3JNrRbBrzfReUNByFBEq937DouiyAjr0Oy11wwNpyvPMVf/6U
	z9Ej8Ck4cFhGrpPDxFvVUVq7IBWcen3PdwsARHffSIs3kwA4Pba3ahGLIWNptsVKz3C2h8sBUWbxs
	e0Y2TR2/SHigQYj64UUOfVINIQGDxtfB/G/VSeMcXCDGEtvoDnoLKu+BEWs0M2FsgUrtUxeXS8uyn
	sZJ9d7hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9O1l-00000006Hts-34JD;
	Mon, 28 Apr 2025 12:56:05 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NJw-000000067OJ-2oB3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 12:10:49 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SCAVxa3394001
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 07:10:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745842231;
	bh=iW5UthSAfG9p2EdnrYC7wnlYQMDTwki3KWY3AVQ73rw=;
	h=From:To:CC:Subject:Date;
	b=DW2mwWgCofB8UDX4P/StHrHIWtrlaYuiopuAqMrL4ymHk31pf0DEh5jJc+UMt9BvY
	 faIGw17oENK7ictZxlUojtYJOOVhFeND4M/eirOV6FGuq8B4Wg4MXK60IdCzKk3Cj1
	 ntFrdEdCUxYxLN3BgiV6PcuLKawQ1lPYoRziriMQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SCAVff040847
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 07:10:31 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 07:10:30 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 07:10:30 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SCAUnv019741;
	Mon, 28 Apr 2025 07:10:30 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 53SCATbu027172;
	Mon, 28 Apr 2025 07:10:29 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <quic_tdas@quicinc.com>,
        <nfraprado@collabora.com>, <arnd@arndb.de>, <lumag@kernel.org>,
        <geert+renesas@glider.be>, <krzysztof.kozlowski@linaro.org>,
        <bjorn.andersson@oss.qualcomm.com>, <will@kernel.org>,
        <catalin.marinas@arm.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>,
        <m-malladi@ti.com>
Subject: [PATCH] arm64: defconfig: Enable XDP socket support for high-performance networking
Date: Mon, 28 Apr 2025 17:40:25 +0530
Message-ID: <20250428121025.246119-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_051048_757060_1D434261 
X-CRM114-Status: UNSURE (   9.39  )
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

From: MD Danish Anwar <danishanwar@ti.com>

Enable CONFIG_XDP_SOCKETS to allow for eXpress Data Path (XDP) socket
support specifically on TI SoC platforms such as the AM64x and AM65x.
This enables the use of XDP sockets for high-performance, low-latency
networking applications, allowing for efficient processing of network
packets and improved overall system performance.

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9e16b494ab0e..5c3abd51074d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -130,6 +130,7 @@ CONFIG_MEMORY_FAILURE=y
 CONFIG_TRANSPARENT_HUGEPAGE=y
 CONFIG_NET=y
 CONFIG_PACKET=y
+CONFIG_XDP_SOCKETS=y
 CONFIG_UNIX=y
 CONFIG_INET=y
 CONFIG_IP_MULTICAST=y

base-commit: 2c9c612abeb38aab0e87d48496de6fd6daafb00b
-- 
2.43.0


