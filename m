Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF7DC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 10:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t+mJhmkLZgpAPm6mQXB3Ry9+462vf9DYEtzPTIfXg6E=; b=RXdxJLPB6WiKP2QY6kZKmbqlTe
	YG9tLi+qpiTE3sOzInRoIZ5lq4zoXl1sZPDceprPUU2rjJVZb8woFgF4dP6gPOHH0MK04MNh4MV2O
	tughHkE/wSPJdb2DD+h0QkXeFkhig/pTlHgvlacbQ7jySLiRkkknCQgW6mvLPtDnZOHCwvtpHpzGO
	+9N63TGdrRRfY/2QjWMTkdEPnSDTOJaNLk5mjzdKPAGc4nHcirdvMmIxelMEP+4az/LKIZ97diFVm
	4ZpyYCVpBIwEiSvWeJlTgoPjmGitP3NhUdCQQOlNP75zphBCmazrd8S/EPiYSBA3eA3H1pkDGZmnu
	gPIGS6ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiW0A-00000008bKj-1mtQ;
	Sun, 03 Aug 2025 10:31:38 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174] helo=mx0b-0016f401.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiVv0-00000008b2P-2Bop
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 10:26:20 +0000
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573A0ndh030720;
	Sun, 3 Aug 2025 03:25:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=t+mJhmkLZgpAPm6mQXB3Ry9
	+462vf9DYEtzPTIfXg6E=; b=JckCxyZzrvt2FHYbhVXbrNhi0IDQzlLkUPSAXfI
	M5zOh2Lri7p9QbVTON42zfV9on9VnlR7sNFHrFNaY1gyFBteFRl0/qiJ0v/+B92q
	sjh4HGQz6xIuIyqUewz8N3QGYD2Rw1SBcdcSZ7ldm/Mf7ye++PuhzCk4vzNFNwob
	rJYhi+GLRMKga+8HIMRxswZXCIYRH+VrO6t01IxWUBDoSkyYKn7H/1TyQIA1n9OR
	zaEXcatRZiNl0i0+rASnlL9I1lzHF1cVFy7qaV7bfezIqPF7xraoJEB0KiXaLcyZ
	UjRo1YoV7KISAwepjbuK/FHiUg0k1qJhG0s9oLx2WLqiZgQ==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 489g1qhhtg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 03:25:53 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 3 Aug 2025 03:25:54 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Sun, 3 Aug 2025 03:25:54 -0700
Received: from c1illp-saixps-016.eng.marvell.com (c1illp-saixps-016.eng.marvell.com [10.205.40.247])
	by maili.marvell.com (Postfix) with ESMTP id B22BF3F70A5;
	Sun,  3 Aug 2025 03:25:50 -0700 (PDT)
From: <enachman@marvell.com>
To: <andrew@lunn.ch>, <gregory.clement@bootlin.com>,
        <sebastian.hesselbarth@gmail.com>, <tglx@linutronix.de>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <enachman@marvell.com>
Subject: [PATCH v2 0/1] irqchip/mvebu-gicp: clear pending irqs on init
Date: Sun, 3 Aug 2025 13:25:47 +0300
Message-ID: <20250803102548.669682-1-enachman@marvell.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAzMDA3MSBTYWx0ZWRfX7ouwtaYd5o4A vNSFKehRf0bbRqtFBksfitYvJ0OisWPXFGhIxVZDWEf5IKlEeg6HNCyQlmyNMvLJUr8eATZSGVY gIxqCBfT9s+egbbf26Fz2Mct+JlIOLej3hKPlIbZdZvLtk/z4nSA1X9Y/H5PLWzZbJmU3ibuuPC
 rPNCaD6L7MwPLsNPeE8qWqyEkM+mR3BHYVok7oLJMSjA5jPyEDWnd1Hu7PTu3qkXM1ct9jqrj+4 RyV30Q/0YGjgtX8/gWr8ttmnJBAwyGJFwbLDUV2Ql5+2bMWYYPl30wD5TLjXQ3H1MHi+PDU0dKy qUBcWligVLkJpJDVoWYNweovewho8QqJatL+7MeYPS1kQHre+ecRXeQR3oV8NcO/PY0OBkzIcqK
 GV32kG9sNAyC4N5smnEPn/eMo32qeeLWFdnU34TYEl5CtGlCe+s/793Hhv81SGraBGUX4vFv
X-Authority-Analysis: v=2.4 cv=PYD/hjhd c=1 sm=1 tr=0 ts=688f3931 cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=2OwXVqhp2XgA:10 a=M5GUcnROAAAA:8 a=BM-YHa9G8tpcXFNCLwIA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: 6tZKmBBJQzgZskEVZlZQXfkh-Hg27CDJ
X-Proofpoint-ORIG-GUID: 6tZKmBBJQzgZskEVZlZQXfkh-Hg27CDJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_03,2025-08-01_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_032618_571209_8190CFE3 
X-CRM114-Status: UNSURE (   9.03  )
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

From: Elad Nachman <enachman@marvell.com>

When a kexec'ed kernel boots up, there might be stale unhandled interrupts
pending in the interrupt controller. These are delivered as spurious
interrupts once the boot CPU enables interrupts.
Clear all pending interrupts when the driver is initialized to prevent
these spurious interrupts from locking the CPU in an endless loop.

v2:
  1) rewrap commit message

  2) don't keep remap, unmap register space after clearing pending irqs

  3) fix code styling

Elad Nachman (1):
  irqchip/mvebu-gicp: clear pending irqs on init

 drivers/irqchip/irq-mvebu-gicp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.25.1


