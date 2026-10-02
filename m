Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CB1CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnTNlG3qZPtJtxJHsm3ojwHfnkTu660EyXz1lG5tbEw=; b=T5RTTnfNJcKi08O0clAD0Fbpaf
	pkib7Ak444Am00QXdBEStgWRSZl1V471PR9w8T1Q+yi/3siFBqyk1J7v/5KJeDqXvph8mikixFAbs
	cPRpnl5/NqiDmxhcEKxl/KIKMKWNr0yEpQF7R2fhf0djPT926FknpcEiY/+vXAhh369uI0Cqe+BYH
	45wVqFC1NRTNJsO3zCOwHY8t2LYeN2/IL6aUGjcMYD9OTBYcRaxfLn+x1yaJPrz62z1Wa4z+DGo24
	GFUCJjLL6hazPPTX4i9Nf2sMxjfXP0qalI1+slmEhwXWx8nS5HbuyBt4dN0KiUb6xvIZklagwmsTi
	luR/vi3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfJN-0000000Bwe6-3psX;
	Fri, 02 Oct 2026 15:36:37 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfJL-0000000BwdW-2Oqz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:36:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790955396; x=1822491396;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8s7rrg3yONdcHtmcH7OGOW2PwRv8XilceivIWnAV6hI=;
  b=j8z/+1uSYTDuEdVEmNw9zcBiGV1pUYgURxA5rrP3umTX3OV5+0r08b51
   7o7rCFVkDG0NvMYgN1w5aPo29uysDlvSEvuLPAHYPYBXTRatvzMeL6pzE
   wDvnaGgoPRJAM00hYih9nV6GYUxVOcfzqVArOkPhSZ5Hd9AiRRkZRMDTO
   PlKhOcOJbZ0qGY2lNGyG43GeLOCDDDIg07St+IarKfACOzw9EHIFxLvot
   SvKwud6e5h1suzdKFOdmhAq6g6ma3td6p+MX0pSRHzG6Tjg0zn702UpGw
   9WehFkgdnxic0KNwdVIPKPnYziyXDMl946KSVjZMr7ot0CCVSZTnAliQK
   Q==;
X-CSE-ConnectionGUID: qevPXocHTpKl9XxEJ4v3XA==
X-CSE-MsgGUID: X/rP8sGWTumJyK8Dyr0qyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="117247709"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="117247709"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 08:36:35 -0700
X-CSE-ConnectionGUID: J9GU+psBRte3AN8ClYb7rA==
X-CSE-MsgGUID: PCPhXXncS9OdjY4ZZFdGuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="279522387"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 08:36:32 -0700
From: Dawid Glazik <dawid.glazik@linux.intel.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	dawid.glazik@linux.intel.com,
	maciej.lawniczak@intel.com
Subject: [PATCH 1/4] dt-bindings: arm: aspeed: Add Intel AVCRP board
Date: Fri,  2 Oct 2026 18:32:42 +0200
Message-ID: <63367a27ef8c7f27a9d273b65b02b02009d149c6.1790344811.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790344811.git.dawid.glazik@linux.intel.com>
References: <cover.1790344811.git.dawid.glazik@linux.intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_083635_633489_ACA21943 
X-CRM114-Status: UNSURE (   8.20  )
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

Add a compatible string for Intel AVCRP BMC board.

Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 8ec7a3e74a21..2c8180e49b2f 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -106,6 +106,7 @@ properties:
               - ibm,rainier-bmc
               - ibm,sbp1-bmc
               - ibm,system1-bmc
+              - intel,avcrp-bmc
               - ibm,tacoma-bmc
               - inventec,starscream-bmc
               - inventec,transformer-bmc
-- 
2.43.0


