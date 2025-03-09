Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB9FC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 10:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yw2H374gN572XNNga/kKlTJ1BhOXVSSGMoU4Wx/y/ng=; b=rty2ChbEd3vCwK7RAOe2S2FEIA
	IICF3yEAM3jxbyoTplWeLfvPU6vx4Feuo044F6C0Jx0KSly3gOYEOuP85UJdAiRhNtQDAw7EIz69T
	8l9jkYp/EfmkTAE4XHwwUn12uAhBy/UoTpJshlHNWW4zrq/O1a+BKROuMpqQtnPtWcPcom6NnFAQR
	n4i4xROZblIDzCFqDTKNK5rn6JonRHclFBIi+LDnrmz5i2AmbNrlsA4dPq/6iZG8tYB9cB8yaFIHC
	wW6taNUpqkVHedX2rNuC+JHsfbEw9wKwDHApoQqQ6Wk5A99EqqlhQxuu1Fo1x0fv5zEXMJSkPxyDZ
	NW9kYwtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trEIN-00000000PEA-1IMa;
	Sun, 09 Mar 2025 10:54:11 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trECD-00000000O3b-3dot
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 10:47:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741517270; x=1773053270;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=KHNKvaNQrW/TubLYiHi//7sCkHIl1zaGizz8x+M0qnE=;
  b=FpRxdPqvfpb+84Qk1TXKRhT4EwpIIdKa5wzz9hOgU4rPakN92hyyxjnj
   g6U5DcZA8Yo+kfTSmZmyQa99mfxRl2sMVLqm0rpEtbmV162jCJlYGLiYZ
   cd7KYL9IE3A8gZwA5odPnGCgKEr9jS/ibIOWBFyK6xW5nG3ySNeco2hbl
   IT4gMCWSWMW4JwyNZHUVxyw4k3UiWmF28VGLhiFG7msqhHwslMcpVYUqM
   U+3MHZUkrYpFrJEA5M8sNguNAXpuX3qiIcjtrcNEvUvwsUBlIN9ScsSev
   OQh0tBg5Euw0nu+Gj1KcpzicthNiPD7I7iEXtCP2/vkKKJ97459r0cwI7
   w==;
X-CSE-ConnectionGUID: km//2VhUQByTIAG+YU6M6w==
X-CSE-MsgGUID: O7DmG4ROSTGjqaMOlBcaDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="42636019"
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="42636019"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 03:47:50 -0700
X-CSE-ConnectionGUID: oAWasDTCRYy6m2gKBLdGLg==
X-CSE-MsgGUID: 2WmdQr0JSvOXsjcC8pRwoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="124655041"
Received: from mohdfai2-ilbpg12-1.png.intel.com ([10.88.227.73])
  by orviesa003.jf.intel.com with ESMTP; 09 Mar 2025 03:47:42 -0700
From: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Furong Xu <0x1207@gmail.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Suraj Jaiswal <quic_jsuraj@quicinc.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Gal Pressman <gal@nvidia.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Chwee-Lin Choong <chwee.lin.choong@intel.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org
Subject: [PATCH iwl-next v9 03/14] net: ethtool: mm: reset verification status when link is down
Date: Sun,  9 Mar 2025 06:46:37 -0400
Message-Id: <20250309104648.3895551-4-faizal.abdul.rahim@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250309104648.3895551-1-faizal.abdul.rahim@linux.intel.com>
References: <20250309104648.3895551-1-faizal.abdul.rahim@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_034749_941907_21FDB91B 
X-CRM114-Status: GOOD (  11.63  )
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

When the link partner goes down, "ethtool --show-mm" still displays
"Verification status: SUCCEEDED," reflecting a previous state that is
no longer valid.

Reset the verification status to ensure it reflects the current state.

Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
---
 net/ethtool/mm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/ethtool/mm.c b/net/ethtool/mm.c
index bfd988464d7d..ad9b40034003 100644
--- a/net/ethtool/mm.c
+++ b/net/ethtool/mm.c
@@ -415,6 +415,10 @@ void ethtool_mmsv_link_state_handle(struct ethtool_mmsv *mmsv, bool up)
 		/* New link => maybe new partner => new verification process */
 		ethtool_mmsv_apply(mmsv);
 	} else {
+		/* Reset the reported verification state while the link is down */
+		if (mmsv->verify_enabled)
+			mmsv->status = ETHTOOL_MM_VERIFY_STATUS_INITIAL;
+
 		/* No link or pMAC not enabled */
 		ethtool_mmsv_configure_pmac(mmsv, false);
 		ethtool_mmsv_configure_tx(mmsv, false);
-- 
2.34.1


