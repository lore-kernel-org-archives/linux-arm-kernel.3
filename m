Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C0FC61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 12:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Oz1MxgiShj1tL2/lO3VGadAAeQQwfjBsEUSB93W3OE=; b=HRn+uYTEDQy5IDvgzBviylHiO6
	CSNOhLJCA1cmHv8tqdKV/RmZNk4GlaetHOrSqwYKB8dqOO6tfu6oV7wjMnLgkWGgn+aMKOhWTwgtW
	EtBMYM5YQ3mGELQ+064dD7WoR8l0dWglkD7zPSMnD7Lu7R7cQJNnXsF6ljk9pX0/V94DDyY6PsBbG
	atzXYaJ4XEb4mvFeyJG4RyKp1QmddEu00Par6U9A5cyTV8k0wPqd2iQKhgqpulHWcb5A1WKa8M6hW
	/cVmJ/Yj13yg0ObLYx3j3s8ECGs44/mj/Yn3eZKUzQDsCObonXP2t0SswyUbITYeFkKrgbeuK/Z82
	OH4lPrVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZH0-00000003yAW-0ocb;
	Thu, 27 Aug 2026 12:32:02 +0000
Received: from v2202607385953487451.hotsrv.de ([45.157.178.7] helo=mail.hofmaniac.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZGw-00000003y9v-3I5f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 12:32:01 +0000
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260822; d=hofmania.de; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1787833859; bh=2Oz1MxgiShj1tL2/lO3VGad
	AAeQQwfjBsEUSB93W3OE=; b=ZmrWa2zVKvLaXkN/HK6B0JHnsjdWOV02a4JsaJyFo/PHL8k9ea
	FvNqqkO+N/Dq7DNKwtXpmrYFYhqFbFBuYNAw==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260822; d=hofmania.de; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1787833859; bh=2Oz1MxgiShj1tL2/lO3VGad
	AAeQQwfjBsEUSB93W3OE=; b=lecdQvSnAe7FSEmVAXM7cp+vUV9wiZdVyFNt8QMvKNShN3mibJ
	PT9Xv9A2Z/r1Vt75ey8Z9PlBYGPJzk23zcP+D6Se6d6Gnes0ZOk3cNNORIT8ZVuPfJNz3ttM3T2
	FT5cIXMGaQcroUlyi+bx174OqL2Lm8v/AV0wILPiRbVDySrSCMO7kHUoo6ziU6+1XcphQ+nJest
	/qt4Gb0+CoXuuXhgDGXux2x8eDCemBNevaEuQ1/DAuohcBaSZoMsTrOhGl+bZWQoO7j3BqI2HsI
	yLv7S2UHnJ2ZAgabeU9Tq/EiixsH2hJgGuQGWQiGCN4r5NxVPMT+fFTMg8s7/tcD29g==;
From: Marcel Hofmann <marcel@hofmania.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marcel Hofmann <marcel.hofmann@ingenics-digital.com>
Subject: [PATCH v2] remoteproc: imx_rproc: allow mappings ending at region boundary
Date: Thu, 27 Aug 2026 14:31:36 +0200
Message-ID: <20260827123136.438798-1-marcel@hofmania.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_053158_977652_712D1EE4 
X-CRM114-Status: GOOD (  15.03  )
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

From: Marcel Hofmann <marcel.hofmann@ingenics-digital.com>

The address range checks in imx_rproc_da_to_sys() and
imx_rproc_da_to_va() use a strict comparison for the exclusive end
address of the requested range.

As a result, a valid request that ends exactly at the end of an address
translation or mapped memory region is rejected. For a region
[start, start + size), a request [addr, addr + len) is contained when:

    addr >= start && addr + len <= start + size

This occurs when a loadable ELF segment fills an entire mapped memory
region. This can be produced by a linker script that extends the
resource table section to the end of its designated region:

    .resource_table :
    {
      . = ALIGN(8);
      KEEP(*(.resource_table)) /* Resource table */
      . = ALIGN(8);
      . = ORIGIN(m_rsc_tbl) + LENGTH(m_rsc_tbl);
    } > m_rsc_tbl =0x00

This produces a ELF program header like:

    LOAD  0x010000 0xa4220000 0xa4220000 0x01000 0x01000 R   0x1000

In this case, the segment size matches the mapped region size exactly,
causing the address translation to fail with:

    bad phdr da 0xa4220000 mem 0x1000

Rework the upper-bound checks to allow ranges ending exactly at the region
boundary while guarding against integer overflow. 

Fixes: a0ff4aa6f010 ("remoteproc: imx_rproc: add a NXP/Freescale imx_rproc driver")
Signed-off-by: Marcel Hofmann <marcel.hofmann@ingenics-digital.com>
---

Changes in v2: 
- Reworked the bounds check to guard against 64-bit integer overflow
- Use u64 for offset instead of unsigned integer
- calculate offset first and then validate len against remaining region
  size

v1: https://lore.kernel.org/r/20260826155123.AEB731F000E9@smtp.kernel.org/

 drivers/remoteproc/imx_rproc.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 745ce52cd822..ea852ca143bb 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -540,6 +540,7 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
 	/* parse address translation table */
 	for (i = 0; i < dcfg->att_size; i++) {
 		const struct imx_rproc_att *att = &dcfg->att[i];
+		u64 offset;
 
 		/*
 		 * Ignore entries not belong to current core:
@@ -552,9 +553,11 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
 				continue;
 		}
 
-		if (da >= att->da && da + len < att->da + att->size) {
-			unsigned int offset = da - att->da;
+		if (da < att->da)
+			continue;
 
+		offset = da - att->da;
+		if (offset <= att->size && len <= att->size - offset) {
 			*sys = att->sa + offset;
 			if (is_iomem)
 				*is_iomem = att->flags & ATT_IOMEM;
@@ -585,9 +588,14 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
 		return NULL;
 
 	for (i = 0; i < IMX_RPROC_MEM_MAX; i++) {
-		if (sys >= priv->mem[i].sys_addr && sys + len <
-		    priv->mem[i].sys_addr +  priv->mem[i].size) {
-			unsigned int offset = sys - priv->mem[i].sys_addr;
+		u64 offset;
+
+		if (sys < priv->mem[i].sys_addr)
+			continue;
+
+		offset = sys - priv->mem[i].sys_addr;
+		if (offset <= priv->mem[i].size &&
+		    len <= priv->mem[i].size - offset) {
 			/* __force to make sparse happy with type conversion */
 			va = (__force void *)(priv->mem[i].cpu_addr + offset);
 			break;
-- 
2.55.0


