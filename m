Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E7CC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 05:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WCWytUFqWpA11l7+HALQ7eU9w9oD6XNnVxxUMUpWGj4=; b=f/YZpmmX+3UM6MbrZ4a/vBF45N
	NYAEoYZ9tbT0InCj1OUmn3Zc+gntdIS/PbrRdMvs3Zx2f8jv/45XGkwTMbVNjpk4g7T0DbS9mReiG
	SnaG1v5OR0zu7yGV8mypQT8JWbDIcEDInsl8xSfkYOcI1sidO+lmneekqhi7xQZh3yqNimCeUhE1U
	yb3VDTU+chz1i8//iiG157DRmZZEPQD0d8vhoAEhXt5DOTEfLsiPXeyR7u4JBiE8NXFyvZHpJ9XkY
	rjMRLlHgtYYWOO9QXuALdSUGK1DT9vU7gW6BSWYi2ODaRLN5CT2wVUBtTfvydC4AFIp0KGsOaeEnV
	oIrul2NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trVPM-00000001ZvN-2n0v;
	Mon, 10 Mar 2025 05:10:32 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trVNj-00000001ZmC-2qt7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 05:08:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741583331; x=1773119331;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vZk5dZKIa4Fkbt7Ox6MVoxXVuECx2sVWiZptJoBL78g=;
  b=WDBJhFz+zUd5xKAW9taQNHtLJ/98hh/Eu0wcjI+/d/XDhuzQt70nXMyF
   4HXaPey/Nh7hkyuH2JslKJrkp0zWA9uVL/x4a0JN7cZ0FtrgUNP8CoRtN
   1DlP/Mu9SG9KYLGZCr+v0D451PRHasYSexQKJIqlpRM92BARShAUxAiuc
   LWpOvKU6m+Jht1uCJra4/pIVTHAaEqYKMdRox3fs0Wyqasj1ifnDfjdx/
   0jzQQthj0SbuHio1W4WGx3RreQftuq3tyeorQ35VY29cQNJi2H6nPmgyD
   PPTvc/JKta6ejlZbX3D3eLQ9Ncs6b2xojkIUSLdnak/4B10YbvL54IHfa
   w==;
X-CSE-ConnectionGUID: 2RljeDVmRaO9v0V4rRPPWA==
X-CSE-MsgGUID: 8Ssj5LkHRG2hZMBLn1bPow==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42779847"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="42779847"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 22:08:49 -0700
X-CSE-ConnectionGUID: Gq4sFC+MRZCgyTTGigxMtg==
X-CSE-MsgGUID: HPWWkEnYTUCNLCdy22OdpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124050655"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.227.39])
  by fmviesa003.fm.intel.com with ESMTP; 09 Mar 2025 22:08:47 -0700
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v1 1/1] stmmac: intel: Fix warning message for return value in intel_tsn_lane_is_available()
Date: Mon, 10 Mar 2025 13:08:35 +0800
Message-Id: <20250310050835.808870-1-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_220851_732856_EF11EAFF 
X-CRM114-Status: GOOD (  11.24  )
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

Fix the warning "warn: missing error code? 'ret'" in the
intel_tsn_lane_is_available() function.

The function now returns 0 to indicate that a TSN lane was found and
returns -EINVAL when it is not found.

Fixes: a42f6b3f1cc1 ("net: stmmac: configure SerDes according to the interface mode")
Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 9c8de47ee149..5910571a954f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -494,10 +494,10 @@ static int intel_tsn_lane_is_available(struct net_device *ndev,
 			if ((rbuf.buf[0] >>
 				(4 * (intel_priv->tsn_lane_regs[j] % 8)) &
 					B_PCH_FIA_PCR_L0O) == 0xB)
-				return ret;
+				return 0;
 	}
 
-	return ret;
+	return -EINVAL;
 }
 
 static int intel_set_reg_access(const struct pmc_serdes_regs *regs, int max_regs)
-- 
2.34.1


