Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4EEC8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 13:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uzwpacVr2LDq5kXvxCDUAtNWqyaw9cIFdQ9xmj0ioPk=; b=vGgVjdsIHYBa/d
	dnaGYU9tlnm1Fwhe/S+XXwSZjSsvq+HW8S+1uJ+emwawGYuxnzFDISauj/poiP0toK3ruf/71GcXY
	zZ+IIXVrlUQ80JbitRfcQgXxxm1pQXn4c0VhAf3en4zLsJTgXRC14l8wY1hOP2HBNOEcaJB/4vbT0
	/JHDqVuY0ofizxfrJgNoqgQGGcFNrvaKr11zgj9Iwa18hafX8DyeeS9yFQ/RMzG0aPEO/iY4/Lz56
	KxalNaf3qsSvMFcGIWTwT4z7ZouiYkYSiBZt5DAjHGEz3rqAqEbFlptKOchI+rMDkE/GsNoF0q45W
	oLC2Z8688NDWl+cs1BmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWEEW-00000002JEz-2Udh;
	Mon, 30 Jun 2025 13:07:40 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWE5G-00000002GK5-1yXN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 12:58:11 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UAX7hQ009897;
	Mon, 30 Jun 2025 14:57:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=uzwpacVr2LDq5kXvxCDUAt
	NWqyaw9cIFdQ9xmj0ioPk=; b=Esr/VsQn/f4180soFFWYt9BFaYfONy5OyL4uY7
	bWHr81wKH7xj8/aPYzLmpbHVWKiBZS6MKchZJWGmyolwKMvl+9Lu5jl4Qa8wiNz7
	BxUwJ2/RTmqnktLySHmr3zDI8RVftAuqg1BZ18tZPJ9+zjj46CcAe6G9diP0l6lk
	1cM9NXXntZHnb2gJg4tOdW7LWmMOwV8Aggc/Wo+lUFDz7VVATsqEs6F28eev9ecT
	ujfuAjQK4w7oiP8XNJ7i61nxhHmhr868Ytoj8RBXxS/OJMAfP8PzJE113WZm+9Vo
	8oSILwgrWBYmoG7K/AhxR+L16nU4B0pAvg8OCQtMwP2Drhxw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j79h7b9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 14:57:53 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 962744004D;
	Mon, 30 Jun 2025 14:56:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 80204B42908;
	Mon, 30 Jun 2025 14:55:23 +0200 (CEST)
Received: from localhost (10.252.20.7) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 14:55:23 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Subject: [PATCH v3 0/3] Fix STM32 I2C dma operations
Date: Mon, 30 Jun 2025 14:55:12 +0200
Message-ID: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADCJYmgC/12Oyw6CMBQFf4V0bUlft4Ar/8O4wLZIF1DSi42G8
 O8W3IjLOclMzkLQRe+QnIuFRJc8+jBmkKeCmL4dH456m5kIJoCBqKgXhj4nnKNrB+rgrhtgXEL
 TkqxM0XX+teeut8y9xznE915PfFu/Ic31MZQ4ZVQJKy3ISjkNly4gljiXJgxkSyXxo///SCLrt
 eEKhFQ1t+aor+v6AZ5tRpHpAAAA
X-Change-ID: 20250527-i2c-upstream-e5b69501359a
To: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat
	<alain.volmat@foss.st.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "M'boumba Cedric
 Madianga" <cedric.madianga@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
CC: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.20.7]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_055806_790902_D29DCC7F 
X-CRM114-Status: GOOD (  10.06  )
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

This patch series aims to fix some issues inside the driver's DMA
handling.
It also uses newer I2C DMA API.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
Changes in v3:
- Add Alain Volmat's "Acked-by" on patch 1 and 2
- Link to v2: https://lore.kernel.org/r/20250627-i2c-upstream-v2-0-8c14523481dc@foss.st.com

Changes in v2:
- Fix the dev used in dma_unmap also in the error path of
  `stm32_i2c_prep_dma_xfer`
- Add a dma_unmap_single also in the ITs error handler
- Add Alain Volmat's "Acked-by" on patch 3
- Link to v1: https://lore.kernel.org/r/20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com

---
Clément Le Goffic (3):
      i2c: stm32: fix the device used for the DMA map
      i2c: stm32f7: unmap DMA mapped buffer
      i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs

 drivers/i2c/busses/i2c-stm32.c   |  4 ++--
 drivers/i2c/busses/i2c-stm32f7.c | 42 +++++++++++++++++++++++++++++-----------
 2 files changed, 33 insertions(+), 13 deletions(-)
---
base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
change-id: 20250527-i2c-upstream-e5b69501359a

Best regards,
-- 
Clément Le Goffic <clement.legoffic@foss.st.com>


