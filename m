Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC8FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 09:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h5kvh+PJBUQXNkN1L2HdGd6JfOeVgSq/YRDXpDabNaM=; b=csNU2jlVnjD95T2hqPRhNqpr3v
	lavQMZtGTBOk/VRjzFg5eIlEJ5AAZkdlzyOhpeR3LQhbGeWW3ZPwpeMUha0qrsG3TTc8p0kt1HczJ
	sJUhaAcuWWIh4QDova8DuNHMqUFm2OPmzJkcdQDr1LghwqEIdS2S3HEkDFfvcMGNR0V7ZtyPt1CR1
	9f2xYgopg+j7riDCUDWU/jXw9fQ/wh30hhBvyK8AIa2AZ+u6wFLvZQ15EyGTPjb2xK41q5WrWEune
	VWJzxzwE8Cn5phoawW58vX6YtBg6SrdQVRF0O43BvJCDueoScMFgqa8mQYuyNyvH7OM5MryfCr37j
	gSynUpEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4cGz-000000056q8-1zQF;
	Tue, 15 Apr 2025 09:08:05 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4cFA-000000056X9-1H4j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 09:06:13 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53F95mjt2436534
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 04:05:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744707948;
	bh=h5kvh+PJBUQXNkN1L2HdGd6JfOeVgSq/YRDXpDabNaM=;
	h=From:To:CC:Subject:Date;
	b=WSMbMa7b0h3v0Hco3CILMum3NOdurCJz16oklFdlcZ7Cm+kcrIFHCNFYaFZv0saK2
	 uTRzzMSqFyv2MFSMVdukIgWbWM62rhtmze0N14MitXl1ijgb3tMdAhxlQH23/kR69O
	 X4QqIi99fLWsdevDR96ip4rO6uOHJgeMXz6AIkLA=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53F95m2l102143
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Apr 2025 04:05:48 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Apr 2025 04:05:48 -0500
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Apr 2025 04:05:48 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53F95mtF080138;
	Tue, 15 Apr 2025 04:05:48 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 53F95ki8010947;
	Tue, 15 Apr 2025 04:05:47 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <dan.carpenter@linaro.org>, <javier.carrasco.cruz@gmail.com>,
        <diogo.ivo@siemens.com>, <horms@kernel.org>,
        <jacob.e.keller@intel.com>, <m-malladi@ti.com>,
        <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
        <ast@kernel.org>, <richardcochran@gmail.com>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net v4 0/3] Bug fixes from XDP and perout series
Date: Tue, 15 Apr 2025 14:35:40 +0530
Message-ID: <20250415090543.717991-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_020612_434632_1DCDF0A1 
X-CRM114-Status: UNSURE (   8.45  )
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

This patch series consists of bug fixes from the XDP series:
1. Fixes a kernel warning that occurs when bringing down the
   network interface.
2. Resolves a potential NULL pointer dereference in the
   emac_xmit_xdp_frame() function.
3. Resolves a potential NULL pointer dereference in the
   icss_iep_perout_enable() function
   
v3: https://lore.kernel.org/all/20250328102403.2626974-1-m-malladi@ti.com/

Meghana Malladi (3):
  net: ti: icssg-prueth: Fix kernel warning while bringing down network
    interface
  net: ti: icssg-prueth: Fix possible NULL pointer dereference inside
    emac_xmit_xdp_frame()
  net: ti: icss-iep: Fix possible NULL pointer dereference for perout
    request

 drivers/net/ethernet/ti/icssg/icss_iep.c     | 121 +++++++++----------
 drivers/net/ethernet/ti/icssg/icssg_common.c |   9 +-
 2 files changed, 62 insertions(+), 68 deletions(-)


base-commit: 8c941f14a694b40a91d381e77bcd334622aa7196
-- 
2.43.0


