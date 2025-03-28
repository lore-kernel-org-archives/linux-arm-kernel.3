Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258CFC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 10:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t1CpYJHlklxVaczx+DLXp4fuzyVScYBG+2bxQ+q3SXQ=; b=CSRVyv5oR6DEepoxtyRxItEIKW
	L01h9yOvYGhFYuFL17PTC7yuTmRusoGzAi/XHV3Kg/TATLa/y47uayxsFrU5Jd0XLe+3WxzzgZMKY
	QEyjRfq0zOZqyikX1OQO0OF/aiDRof9+uTMR+MhXxOFvDjrfIDupSlqTLYhKibcd076axKy5Q3RP/
	9G25cPt+f9u+WVif1OHwFoBvVcQKKSk7KASpTX/o2eIzDRZjQq2eSbPfobs6FQRD/JhJiSjIpz+OW
	itcixRSsLtBtIk/Yt5RASmg3CKdPyW8F0kFY87NGG4PU0eIQa1vYNmU9ZTl/6jWOxOtnLcuwzfduN
	Zp0yv1PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty6yf-0000000D8Zx-19di;
	Fri, 28 Mar 2025 10:30:17 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty6tG-0000000D7U4-0ef0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 10:24:43 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52SAO82b2688996
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Mar 2025 05:24:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743157448;
	bh=t1CpYJHlklxVaczx+DLXp4fuzyVScYBG+2bxQ+q3SXQ=;
	h=From:To:CC:Subject:Date;
	b=s5CvMA8BE+6lnk+wW5QcURfa1sHg6GpDJbmqvWGZYD4DGkUdbu4cV1HA5OxicDcOi
	 xX6UGAU/ijzwUfeiA192YD0ckN5lNFLxet3njnc7aNY1FklpnkJdSOJrQ5PI04W9fg
	 E/+CjiXIAYZQEE91QRJM4q9/XTwNiFzbo0cOm9/c=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52SAO8av016101
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Mar 2025 05:24:08 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Mar 2025 05:24:07 -0500
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Mar 2025 05:24:07 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52SAO7vU080225;
	Fri, 28 Mar 2025 05:24:07 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 52SAO5OJ024918;
	Fri, 28 Mar 2025 05:24:06 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <dan.carpenter@linaro.org>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <namcao@linutronix.de>, <javier.carrasco.cruz@gmail.com>,
        <diogo.ivo@siemens.com>, <horms@kernel.org>,
        <jacob.e.keller@intel.com>, <m-malladi@ti.com>,
        <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
        <ast@kernel.org>, <srk@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net v3 0/3] Bug fixes from XDP and perout series
Date: Fri, 28 Mar 2025 15:54:00 +0530
Message-ID: <20250328102403.2626974-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_032442_287791_4041F64F 
X-CRM114-Status: UNSURE (   9.87  )
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

This patch series consists of bug fixes from the XDP/perout series:
1. Fixes a kernel warning that occurs when bringing down the
   network interface.
2. Resolves a potential NULL pointer dereference in the
   emac_xmit_xdp_frame() function.
3. Resolves a potential NULL pointer dereference in the
   icss_iep_perout_enable() function

v2: https://lore.kernel.org/all/20250321081313.37112-1-m-malladi@ti.com/

Changes from v2 (v3-v2):
- Posting to net tree as the features have been merged to net.

Meghana Malladi (3):
  net: ti: icssg-prueth: Fix kernel warning while bringing down network
    interface
  net: ti: icssg-prueth: Fix possible NULL pointer dereference inside
    emac_xmit_xdp_frame()
  net: ti: icss-iep: Fix possible NULL pointer dereference for perout
    request

 drivers/net/ethernet/ti/icssg/icss_iep.c     | 4 ++--
 drivers/net/ethernet/ti/icssg/icssg_common.c | 9 ++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)


base-commit: 2eb6c6a34cb1c22b09b219390cdff0f02cd90258
-- 
2.43.0


