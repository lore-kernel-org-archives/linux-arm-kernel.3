Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7A6E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 10:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kne1izy83fG8DPU8i0qf2GwLotTeQHzgxnwBzWOIdgs=; b=Dt5lJStE73scIXPcJFpcnNl8VC
	6uAC9RjSaOzd5m6+/3gnhxd9g3ikmJ6nHJ8o2jerq7ThtR4R+qqEdjPgsh5tgkjKPZ8FtcUEZe/Cf
	ylcdmiIlg+1aJLfqZWs7te/jjJ5onaQBZqnOfwECAWjN/oX1lL7nKN7x7HVeu8a/R1UmD5SjmRIG4
	d62nZ+KDMom/3b6WzbFCKflIZm65f3GvRcraMM0zQh0oeYz40BHUSJCNVY4GaqNaaC96QdpTXR/qc
	+QG68wH6QHxYx+SIZf0q4iwCF3lDzK13XZtniK06ebJei4vUH15LLKy4NFB6NUqEw2qp15E85kfXZ
	iXkYgMKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrau-0000000GJow-0UMH;
	Wed, 18 Dec 2024 10:47:56 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrXg-0000000GJ3X-31x6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 10:44:37 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BIAiRF8033096;
	Wed, 18 Dec 2024 04:44:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734518667;
	bh=Kne1izy83fG8DPU8i0qf2GwLotTeQHzgxnwBzWOIdgs=;
	h=From:To:CC:Subject:Date;
	b=PfsXCG4nbbVpCpxAaOYbnJhyPsSKeM0ju3xhGSmnriZOPGJJG7hQ8D3JkpEHKjDS8
	 ZPngSzEWvQ2gWwKAGH7h8rX4GxCS4LeEn4NHXDn2y09zMkvBfVReV426w2sJybC/rE
	 eIrQ1nIqztz4r6Wk20R2YsqOQjFLJtuHfJXewhWc=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BIAiRoD046091
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 Dec 2024 04:44:27 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 18
 Dec 2024 04:44:26 -0600
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 18 Dec 2024 04:44:27 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BIAiQDm089697;
	Wed, 18 Dec 2024 04:44:26 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4BIAiQbB026881;
	Wed, 18 Dec 2024 04:44:26 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: <tony@atomide.com>, <mathieu.poirier@linaro.org>,
        <grzegorz.jaszczyk@linaro.org>, <s-anna@ti.com>, <ssantosh@kernel.org>,
        <nm@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH 0/2] Fix compilation errors with pruss APIs
Date: Wed, 18 Dec 2024 16:14:22 +0530
Message-ID: <20241218104424.1257880-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_024436_803186_FACBFA42 
X-CRM114-Status: UNSURE (   9.58  )
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

The APIs in 'include/linux/pruss_driver.h' produce compilation errors and
warnings when config symbol CONFIG_TI_PRUSS is not enabled.

This series fixes those errors / warnings.

Also the header file 'include/linux/pruss_driver.h' is orphan and has no
entry in MAINTAINERS file. Patch 2/2 of the series adds the entry for this
file in MAINTAINERS file

MD Danish Anwar (2):
  soc: ti: pruss: Fix pruss APIs
  MAINTAINERS: Add entry for linux/pruss_driver.h

 MAINTAINERS                  |  1 +
 include/linux/pruss_driver.h | 12 ++++++------
 2 files changed, 7 insertions(+), 6 deletions(-)


base-commit: 7fa366f1b6e376c38966faa42da7f0f2e013fdab
-- 
2.34.1


