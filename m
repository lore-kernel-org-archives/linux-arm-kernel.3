Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07A6C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 03:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ifoyain0O5tFEPV0Svn5oBE7BX1cAxLlXYL5Dnbq7b8=; b=1zO4mhw/cOJgIl8kAFWXFAbClT
	MuMqy2rnwo4maYQqjVn9Sx1BS/Malm55vkqowOKGIxMp8t/LpUqeZ8/TBtTRF579XtlVmDYkA+hMV
	ztAU4kEL3BTJ1RNE5ra4ukpyGCSPDxTkTNKkSONvjPp5EsJP/ABbrejyW3rxhKxufp93VTXkdNjow
	PfcjLV6JYrxmpUtC2Jfr4BneTl3+wwzTajOQjqxEVyiXe8bD9eRT7q5nN7kdcheQzZYB5Pg9e0Vxa
	R6G/KsIxWtCp9omn5jy8m++YprAH3h55SYKvpuOj4ybYEqlgVvIK6YGDHye1Rdn8RQH7k9ZGW+bEZ
	fETam3Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkvU2-00000003b6O-0TFy;
	Sat, 18 Jul 2026 03:12:58 +0000
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkvTz-00000003b4V-10Wt;
	Sat, 18 Jul 2026 03:12:56 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 683CE1380328;
	Fri, 17 Jul 2026 23:12:54 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 17 Jul 2026 23:12:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784344374; x=
	1784347974; bh=Ifoyain0O5tFEPV0Svn5oBE7BX1cAxLlXYL5Dnbq7b8=; b=k
	1AVjW4CVfGhQ5uD6qlFmevlrff9gyfvdbUIrTBlBcVrga14KMnt+fsyU9K0xXORm
	KAtfFg08LKIuyDWvEOXlOWVHk0+mbr+Ucw0yG3Y7J4tORn2P7ak9qSP30LqNW9nK
	tWOSHeDFBCuA1Q5+Xi/Qsp8qbBJ0T63KZ6dGD1mnZ6r1S+QD7xVa8kIou+I4/Ybe
	GVuXxE9R4Eus4oOiNcRbAyBKNy+wmnHtiNp7N6nrPdObo+ithQW3TKia5/ZZ58t4
	KlT5lzHVFc8H3L9K4o1V93CvzZJu/egFTIfAAk1NbrOITHn0F+wlNWSYGTciIJX8
	2QP2HRs9GDraG8Hrab4NQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784344374; x=1784347974; bh=I
	foyain0O5tFEPV0Svn5oBE7BX1cAxLlXYL5Dnbq7b8=; b=Epa7J8WQeQ/41tjsF
	FDe7KnXEAUZW0wB+g/C4zLn8fr2tjAfIkYNMKIyA3kOrSVDJWwuXbuuGKb8NnM1/
	WvXSOxg+jP1hx6LswHjzd+QSHgEgbg67s7ufUGIDxzaDqht5dr+a7pildv6RDrGw
	hCWoNcBUtooE7n4rwPnTWQCBSPw3aM8PhGRm1XbbP4hV138HEW1TXU7dgt/1+7/1
	mfbWbWJbiUb8NkrZ1dosmZvR1tfUEkwImho8w8rAMDFCSzPa0awSFIZj4R+LPQss
	4j46KRaxnxm8c14v8fB0KZ0qo76lwz0oBz3Z54Rf9gxHbjO+wNH3ryejncC5DPMy
	hpIUw==
X-ME-Sender: <xms:Nu9aaiIOdicFtdvGVW2KIJEuqOF1pF94QJeuoxk9xjdmqCrnfDHNeQ>
    <xme:Nu9aaqhEXSslR3GiJfldsxArqmAscoJrCgTCaKt4cdE5bydkrvU2u5jfx_jryDHwp
    QSzTeb3eXjY7THtuawUISj2bIvRl2URYa4-4WDMD-WfI9FWTSm73oU>
X-ME-Received: <xmr:Nu9aaj05_7ui1_YZPEaAkRsjD4sQYyluP6xUM0ppLFk8d90e8ra3tz8E7wV-VpHxx3eSq3BqA9wKFH6IJbU>
X-ME-Proxy-Cause: dmFkZTEMX89gCC44dqObrbulQ/I2vRcOyTSU2dL37a8Nf+rFxjy5PE8WS5gpE9RXw7+0PS
    yxUIuQ6gupe5zEJJchZQE4bKfFbHmQL7INM15u9ExRdXgkO57kNGwURGa++uDEBsULgTHI
    t0ZbzRzarKEWrP6K0r8ac4f1j9EfeJOBqZIOuHi65D2zEb8+Hr9A3pyCOeN8z68LWwn2cR
    nBEqlZGvm1NlJl0MtKgrU7cphGYeMLoNKly7LudZuf9EOf4mYb3xk/iIY0lHGtBrmlZsu6
    7UYsbLPlBovD5Ne0jETTe/ihY/4xpQnFOtQR8dx/YbbAYNmrYk14/xo0JBShoHg0ykTlCu
    UH1/8J40WwwUfVCylVd0CgaZ5fom8Ci+xBFReSOhGgGwYinXEnURs1R8InSumbCTKV352C
    GSqSbGdpiU76yiHCuAw/npfwHy8qb6YdWX+6+bBhRHf71Ko0e7Eukdm1XvXguC2vi4JgiC
    D7A84GkDGYBqdzkR6uHOIAA81Sf6fBoxqSUxSuT9gkkKuOCPy+5wB2ao/cofhEZ/8SBRWY
    oI3Gtl1aHg11gxI27IrwBgIb2NrKk5HgT+R5SitX9RfX7aIMzn13Ddx+6oCaDJ6Qv5h7M6
    gQ/b00ATM204LOaVLq0sPC6P1ZVWTjC7wGrQLF1SwThKWRWtlIht0hYP6lFg
X-ME-Proxy: <xmx:Nu9aajbeJaGzSD60-74suvwW1XXDEmmowKza9LLCXwYtnDlgyOxLTQ>
    <xmx:Nu9aaoglu-soqMcEVGLlhZCbIyvroZPz6l869cmuKSCTDhnb_HN6wA>
    <xmx:Nu9aarjSgrbRtrjMlHfwR77O8Q6Lq5yLooP0DEadlRzKFKTSzF0EVA>
    <xmx:Nu9aatClylaCtxPJSkLHzXyaexB5Yxg_OA8zt5YN2TEbMEHuoqBR3A>
    <xmx:Nu9aap80YAArHCHuW8myt3IGv0hf-Vux5BrrvqvBE4a2fZa-hmfnVAYV>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jul 2026 23:12:46 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org
Cc: chaoyi.chen@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [RFC PATCH v2 5/8] iommu/rockchip: clear stale page faults before enabling stall
Date: Sat, 18 Jul 2026 15:11:43 +1200
Message-ID: <20260718031146.3368811-6-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260718031146.3368811-1-gahing@gahingwoo.com>
References: <20260718031146.3368811-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_201255_352515_A0107477 
X-CRM114-Status: GOOD (  10.70  )
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

Boot firmware can leave an IOMMU bank in PAGE_FAULT_ACTIVE before the
driver has configured paging:

  PAGE_FAULT_ACTIVE=1  STALL_ACTIVE=0  IDLE=1

Such a bank ignores CMD_ENABLE_STALL and never reaches STALL_ACTIVE, so
rk_iommu_enable_stall()'s readx_poll_timeout() spins until it times out
(seen on the RK3576 NPU, whose MMUs share this poll across banks).

Rather than special-casing these banks in the stall path, acknowledge the
stale fault with CMD_PAGE_FAULT_DONE before enabling stall, so every bank
starts from a clean state and the normal stall sequence applies to all of
them.  Banks without a pending fault are untouched.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 drivers/iommu/rockchip-iommu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 62cd6b022..68bd55433 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -415,6 +415,19 @@ static int rk_iommu_enable_stall(struct rk_iommu *iommu)
 	if (!rk_iommu_is_paging_enabled(iommu))
 		return 0;
 
+	/*
+	 * Boot firmware can leave a bank in PAGE_FAULT_ACTIVE with no handler
+	 * (PAGE_FAULT_ACTIVE & !STALL_ACTIVE & IDLE).  Such a bank ignores
+	 * CMD_ENABLE_STALL and never reaches STALL_ACTIVE, timing out the poll
+	 * below.  Acknowledge any stale fault first so every bank starts clean.
+	 */
+	for (i = 0; i < iommu->num_mmu; i++) {
+		if (rk_iommu_read(iommu->bases[i], RK_MMU_STATUS) &
+		    RK_MMU_STATUS_PAGE_FAULT_ACTIVE)
+			writel(RK_MMU_CMD_PAGE_FAULT_DONE,
+			       iommu->bases[i] + RK_MMU_COMMAND);
+	}
+
 	rk_iommu_command(iommu, RK_MMU_CMD_ENABLE_STALL);
 
 	ret = readx_poll_timeout(rk_iommu_is_stall_active, iommu, val,
-- 
2.43.0


