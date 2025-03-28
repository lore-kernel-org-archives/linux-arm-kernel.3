Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DADC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 10:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4tP25R7wKXZmeyNdNfbQrRvdEC/iStfy1ogy2I2G0I=; b=a0hNiiWQOlANanowTO4jtyZhrT
	ZMjYaAlChsSPv8aSx6Gytf0iXfwo32bJ1TCpak+rhHcUm+dkALRNymlAjWmTFoH+PkPZkHWEKrBVP
	DpZoHQgTYPU9qpjLyrBSolcfYonuHw0qJ6VQiuI7xgelIX8XNJxpGm4ty9LfCxIN1LoEP/Zh/ggkY
	EfmLrJ20cRDPdHIvlNz6pFQJAtytrVoAjPUD0hShPp0wRj55XIpTy9OIy5fw0Yh2NBIumVx+QKh4J
	DBYIXPixXo26kOnngUFe7NodpQfVCm5dFhyPB2Cej78jlcRrkRR7+w4MPX5eiQ5zbEj1+eWiXeBfl
	xAQUpy5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty726-0000000D91q-3Dwv;
	Fri, 28 Mar 2025 10:33:50 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty6tP-0000000D7V0-2q0Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 10:24:53 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52SAOI4d2096894
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Mar 2025 05:24:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743157458;
	bh=u4tP25R7wKXZmeyNdNfbQrRvdEC/iStfy1ogy2I2G0I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UjTCfmWLI9GYR0caRe30ghn8tIfqDc5srFVpP7vmtK/+KstuxiYWS+FuDAeES3aWF
	 rokLxSYI2CjCR3IJKYQD4DFALV7BRsCRRwJoBTa+YLxHkp+lPfKQXtsmRHknWQihK5
	 R87n2zxhtHoXlOwluWmryQXO8VlYaSTIV63R8t6w=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52SAOIer056909
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Mar 2025 05:24:18 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Mar 2025 05:24:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Mar 2025 05:24:17 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52SAOH0Y004266;
	Fri, 28 Mar 2025 05:24:17 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 52SAOGom030930;
	Fri, 28 Mar 2025 05:24:17 -0500
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
Subject: [PATCH net v3 3/3] net: ti: icss-iep: Fix possible NULL pointer dereference for perout request
Date: Fri, 28 Mar 2025 15:54:03 +0530
Message-ID: <20250328102403.2626974-4-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328102403.2626974-1-m-malladi@ti.com>
References: <20250328102403.2626974-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_032451_807180_7E243EA8 
X-CRM114-Status: GOOD (  15.29  )
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

ICSS IEP driver has flags to check if perout or pps has been enabled
at any given point of time. Whenever there is request to enable or
disable the signal, the driver first checks its enabled or disabled
and acts accordingly.

After bringing the interface down and up, calling PPS/perout enable
doesn't work as the driver believes PPS is already enabled,
(iep->pps_enabled is not cleared during interface bring down)
and driver will just return true even though there is no signal.
Fix this by setting pps and perout flags to false instead of
disabling perout to avoid possible null pointer dereference.

Fixes: 9b115361248d ("net: ti: icssg-prueth: Fix clearing of IEP_CMP_CFG registers during iep_init")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/7b1c7c36-363a-4085-b26c-4f210bee1df6@stanley.mountain/
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---

Changes from v2(v3-v2):
- Add Reported-by tag and link to the bug reported by Dan Carpenter <dan.carpenter@linaro.org>
- drop calling icss_iep_perout_enable() for disabling perout and set perout to false instead

 drivers/net/ethernet/ti/icssg/icss_iep.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
index b4a34c57b7b4..b70e4c482d74 100644
--- a/drivers/net/ethernet/ti/icssg/icss_iep.c
+++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
@@ -820,9 +820,9 @@ int icss_iep_exit(struct icss_iep *iep)
 	icss_iep_disable(iep);
 
 	if (iep->pps_enabled)
-		icss_iep_pps_enable(iep, false);
+		iep->pps_enabled = false;
 	else if (iep->perout_enabled)
-		icss_iep_perout_enable(iep, NULL, false);
+		iep->perout_enabled = false;
 
 	return 0;
 }
-- 
2.43.0


