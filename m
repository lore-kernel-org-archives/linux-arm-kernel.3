Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63A8C83F0B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SG1Uf3WWZKbhZvXehI/zWsa4U/GR4wtbqsoht1Gvc/s=; b=QUGzp/TSS+k/05
	p8cR6oKAQl97q7iNBBquMl/sZ6oCIA1ex9OrmiCe8oKD0pjzleQTmka2dMrtOBNr/wiq3MpWmGg83
	jmjTusVgnjRIYpciMI+LJSwCC22TSY106KwO6JvNZ9CxtNyhDT2jp5DCQ7efC+U0yv9RoMLPt6a90
	o4FsL+nMB78ZG3JJdOoHg3/riWvDROXeAVr0HkPx645fSK1W4KUJ0vDkyYj6hZ5t0luLEb5/a8Rrb
	thzQxk0aHDvHKtbhyAy/gnvfdrQs8BE0JCkC2MdWCxlkXxx52+GbsOmKtlqXh/85FzXOJSg8KE6Wb
	bxvjoDQQOQw+WGGc1dYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeUF-0000000EC9A-23Or;
	Fri, 04 Jul 2025 11:21:47 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbza-0000000DlzJ-0PsT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 08:41:59 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5647ZtTI015069;
	Fri, 4 Jul 2025 10:41:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=SG1Uf3WWZKbhZvXehI/zWs
	a4U/GR4wtbqsoht1Gvc/s=; b=QmrquhH140RmkusdKGMoRkObmTKMLtwuLmEXU5
	wmSkUun+22sj1wVLDVEVRsnGu4tBT+iYggKLdQrW3tT3iB55Cndsx+sCwcbkLHSw
	qY/e4APbVTFRDu2IfqWzeL/Qk7Fz8guiua0XZUmiTySeKBPhTq0CTQOsyZ3+KqQU
	aHQomihSjdRo/ZmnxcxGvuxiXDOnmLRn5J06upV1tWs8JjSagMR4GIqmLs+hhKEO
	mJfUOjGFuzyRPluIjYqMaiw3Wi/sirTIirPmVe7jALRVTVSwgYr9bc4wNsrUQu4+
	5rpV+3eFvlRBQZuFsWd7EsnrGg2xbjoZVshkJtF76eLiEElg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j7r6kx8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 10:41:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 98DAB4004D;
	Fri,  4 Jul 2025 10:40:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8586A48213E;
	Fri,  4 Jul 2025 10:39:36 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 10:39:36 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Subject: [PATCH v4 0/3] Fix STM32 I2C dma operations
Date: Fri, 4 Jul 2025 10:39:13 +0200
Message-ID: <20250704-i2c-upstream-v4-0-84a095a2c728@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADGTZ2gC/2XOTQ6DIBCG4as0rIuBGUDtqvdoukCklYU/AUvaG
 O9etBu1y2+S581MJFjvbCCX00S8jS64vktDnE/ENLp7WurqtAkwkExCTh0Y+hrC6K1uqZWVKiX
 jKEtNEhm8fbj3mrvd025cGHv/WeuRL9dfSHG1D0VOGRVQYy0xF1bJ66MPIQtjZvqWLKkIG378I
 0LiheFCAoqC1+af44YjO3BMPNeAugKlCtR7Ps/zF4+/vAAoAQAA
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
X-Mailer: b4 0.15-dev-7616d
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_014158_440723_BD910CAF 
X-CRM114-Status: GOOD (  10.41  )
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
Changes in v4:
- Patch[1]: Remove all `chan_dev` variable occurrencies
- Patch[2]:
    - Refine commit message
    - Use the dma_callback to factorize the code
- Patch[3]: Refine commit message
- Link to v3: https://lore.kernel.org/r/20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com

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

 drivers/i2c/busses/i2c-stm32.c   |  8 +++---
 drivers/i2c/busses/i2c-stm32f7.c | 56 +++++++++++++++++++++-------------------
 2 files changed, 33 insertions(+), 31 deletions(-)
---
base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
change-id: 20250527-i2c-upstream-e5b69501359a

Best regards,
--  
Clément Le Goffic <clement.legoffic@foss.st.com>


