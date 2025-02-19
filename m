Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EED3C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 06:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h17FbokfSERqNK3i9fAiWbwKGfwvwhKNe949xpUZ578=; b=lHZikduLjf/rZkw7XSfMxZUrD/
	zKgImn3yuQThIttnRGYZAC2VeS28BRv1o89Z1K7DEJll1FKtesOq16UWr60mNV1HR9Y8w7EzqyJZA
	ufUM8X5cbQBzalGfqsfxe0BDoCmiyZbPLMPC4sHDTgpeEQotzhK9sIQeILqkHGk/FhA1kgXonIKeJ
	4kD1ncCKpCscRVVoYrxRmfvpR2B+Wq+BazfLVVYANVhkIHCYaKHxMBgJhYLAZIA2//JlRAziK4Tlx
	9Mc1hwYiiXivTBH43moDpq2qDzVBWwz6TrP0t/IcB+4VwfXSHtExrSPsQivWn78JMRmegUSez1O1C
	tRlDMsIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkdZi-0000000B2lh-2nig;
	Wed, 19 Feb 2025 06:28:50 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkdYE-0000000B2YB-04mV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 06:27:19 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51J6R9Ad186657
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 19 Feb 2025 00:27:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739946429;
	bh=h17FbokfSERqNK3i9fAiWbwKGfwvwhKNe949xpUZ578=;
	h=From:To:CC:Subject:Date;
	b=f2SEqBwmhI+BDWAyCq+M7oJz6idx+3QRfKBuCGHbnMm7p2e/85iSOdEUQuzw/vYiP
	 Lz/BwHbTBNuSVWzWci3cpIIPaGXHUmf3QxkaZxBJzEJFykwfIqU0DFsSUV65JCdlQn
	 amBgJNLACy9FyzeDYnnWQnoAou4JYFxGQt+rcNwE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51J6R9BU109076;
	Wed, 19 Feb 2025 00:27:09 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Feb 2025 00:27:08 -0600
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Feb 2025 00:27:08 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51J6R88e019383;
	Wed, 19 Feb 2025 00:27:08 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 51J6R7g7009522;
	Wed, 19 Feb 2025 00:27:08 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <lokeshvutla@ti.com>, <vigneshr@ti.com>, <javier.carrasco.cruz@gmail.com>,
        <diogo.ivo@siemens.com>, <m-malladi@ti.com>, <horms@kernel.org>,
        <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net v2 0/2] Fixes for perout configuration in IEP driver
Date: Wed, 19 Feb 2025 11:56:59 +0530
Message-ID: <20250219062701.995955-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_222718_103318_1C50AD97 
X-CRM114-Status: UNSURE (   8.80  )
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

IEP driver supports both pps and perout signal generation using testptp
application. Currently the driver is missing to incorporate the perout
signal configuration. This series introduces fixes in the driver to
configure perout signal based on the arguments passed by the perout
request.

v1: https://lore.kernel.org/all/20250211103527.923849-1-m-malladi@ti.com/

Meghana Malladi (2):
  net: ti: icss-iep: Fix pwidth configuration for perout signal
  net: ti: icss-iep: Fix phase offset configuration for perout signal

 drivers/net/ethernet/ti/icssg/icss_iep.c | 44 ++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 3 deletions(-)


base-commit: 071ed42cff4fcdd89025d966d48eabef59913bf2
-- 
2.43.0


