Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75D7CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 11:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0E1H3YRUGu5NQw+dGCGvtMy789cF+yQ8PDHb0PAjkg=; b=e+Q0ekeoIEfyIUIaJYo7c66s7S
	b/APEnXeAh5U7SXYSOwlT5P0xWvSuaudXEcLHNSeoHCSbaFticYM6Q4S8oEBV6xxCrxbtA6OyqsYw
	0a7GcSZ8AFSDhd+vZL3++ph5ofQZsPlGByq/P2kps/58zJwHAKroHrEhqUPX95t8wJPrMfj9L93yQ
	Y+mUuYxaEk0t62bmWmd+TOM/LYI+6IJkDftIZuMgShvFe6uvORy9g5KKIaLpcqwK5GrgP+L6lT0r2
	8MmFsyQTh8VXFvJN6b9LDlIBkrOwcBf+s9h1P/eJuYL10sW4JlWf1PKamnjZft84/yEGYCaNmwREH
	2B8xYRBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgqH-0000000GKMY-1KeG;
	Mon, 05 Oct 2026 11:26:49 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgqE-0000000GKLE-129H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 11:26:47 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-35120d43ecaso2142977eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 04:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791199605; x=1791804405; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0E1H3YRUGu5NQw+dGCGvtMy789cF+yQ8PDHb0PAjkg=;
        b=CC0yj8eSprOkWCQI+Iu9d/5CWOiRkKOH5XzGtE7R2EhUe5ecDYOL7UPhd+Qnie123T
         p+sAy2reQhMaR+HNm6yg6WKAOtCM4AU5BX+tP3QRqEdsqEXbU14uOETFoM8Yl+XriOXl
         JxlciyfV9I5q0I/0TmJ7ZfhN8g2km8SHf/FN1OT4FICYpH0Z7Rpv6nWvzMc48MbTyPbS
         1oVsqovdzpa5zs7wL8kch4/p+l8eYpvYkvww+w5iYzUaIOeo0BL0ccASw3QwvCqLdwk9
         jqC5vnACx3cV6iTopZ2U57nrA6OaSRYKrxvuqKBwVgG2GjqbiOBs8UUXw6Zami7TZPd4
         0/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791199605; x=1791804405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N0E1H3YRUGu5NQw+dGCGvtMy789cF+yQ8PDHb0PAjkg=;
        b=wWPJRFTORMl/T7NX52rDCa/mNsNG9vihVyfBnhfebbJ6O0cLLS4tKspR1DhNrJfXlS
         NwG3EGUwHsu9wN1D93RI+qVHENguVv2enVs02uaLlxuBxDUDqiqQUvfiFPrbSvn/9Ogf
         GXaNEuTElrGAHxndqwlDAfpwu1YqrvFwwgXtBDG81oh0M1RVBR1L6dVb7MH/19UkgJ7J
         UbhW1bckKXY4L6NPd6JP4jEJEZfL+MBCPlYdqaRwt3a2/OF+YUOBD2hjS19rd1kCLqch
         AJwRMhe7A+1M1qvRLCojpcqzAU8DbjKK4KeAsjYQpdmu5H0O5FESHz3LdC/fsq5PficC
         fl4g==
X-Forwarded-Encrypted: i=1; AKwUvBw9H7eLXXqDTgvlq2jEUHFHGyIcHcGpd5TeQKhxHTtBtAmPWFCSCNjEo6/GAcGp6yL+IVPAOGJsmMWPC4d29tIM@lists.infradead.org
X-Gm-Message-State: AFuF++mYcgHjovEr1sYMB16vONY/1bQGre07db9h1oN10DxJkd1QE0Me
	yDBOeo2291VK7+jRn6THBp2Q9Sdaqn+f8Oub3PYLV0+twIGM1a51Ob+K
X-Gm-Gg: AYBFou3qvycNJJT9j82T46m7VG2usRd9iFYiMIuegVCSVtG0G1aO8buM30j+rVUUnsD
	WiH2Y9AYPmtdUnzP66AnMONkIlsxUVE4wnXsskJPmljZNUNJ41Kf75jrMo/0+LjFy2eTfp2lMD+
	W8vzkTTy3FPj8t7NSiOXJUtNpeKK0lGmT6FOh4w9p5iIC4WvjQ+bLTGFmV/VX3py5iS533u4KD4
	yoNInQVcswo7TF80yDKcWGMYg8CW7bxRswjQ7BGWR09/5o9+c0ybyrihOZeAq8czj2ofRABYyE4
	4paRsvcwJDlB8zLsyKtr01d+XKxjiXwlNLq2db4h/OyVXbiXe9wKQqKEk23vRMNNJTcCBoDhMlA
	scd3Q3SWx1DoT5at3xCNkCco/2vvANCyst6Qw+n61+qZeFq55fyzLfuh9i23WU+7cj116u/5NNK
	LXHfctjn+bDwY7lOv03yjSFQomKObRGkkc4JWZwg9UwPZ9W8/h3egkLFtTOrZoGaBEvM3WDUshB
	q/kPQ==
X-Received: by 2002:a05:7301:1a16:b0:351:2e6c:9e1f with SMTP id 5a478bee46e88-3512e6ca15dmr3609482eec.31.1791199605214;
        Mon, 05 Oct 2026 04:26:45 -0700 (PDT)
Received: from JMD.localdomain ([220.158.183.16])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351277a2fb4sm14902080eec.26.2026.10.05.04.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:26:44 -0700 (PDT)
From: Atul Akella <atul.akella@gmail.com>
To: linux-remoteproc@vger.kernel.org
Cc: Atul Akella <atul.akella@gmail.com>,
	stable@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] remoteproc: mtk_scp: Fix bounds check in mt8192_scp_da_to_va()
Date: Mon,  5 Oct 2026 11:25:18 +0000
Message-ID: <bc3f565d08f6948aed9172c01c7c38b4cafa2ec1.1791198233.git.atul.akella@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791198233.git.atul.akella@gmail.com>
References: <cover.1791198233.git.atul.akella@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_042646_770887_820D1085 
X-CRM114-Status: GOOD (  15.10  )
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

mt8192_scp_da_to_va() translates a device address to a pointer into
SCP SRAM, L1TCM or DRAM. Its bounds checks have two problems:

- (da + len) is computed in u64 and wraps for a large da or len.
  With da = 0xfffffffffffffff0 and len = 0x20, the sum is 0x10 and
  passes "<= base + size" while da >= base also holds.

- offset is an int but is assigned from a u64 difference, so it is
  truncated before being added to the region's base pointer.

da and len come from the firmware's ELF program headers
(p_paddr/p_memsz) via rproc_da_to_va(), and the returned pointer is
then written to by the ELF loader, so a malformed firmware image can
make the loader write outside the intended region.

Use a u64 offset and compare len against the remaining region size
instead of adding it to da. Apply this to the SRAM, L1TCM and DRAM
regions.

Fixes: ca23ecfdbd44 ("remoteproc/mediatek: support L1TCM")
Cc: stable@vger.kernel.org
Signed-off-by: Atul Akella <atul.akella@gmail.com>
---
 drivers/remoteproc/mtk_scp.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index d18ae676260a..b1d83265fc26 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -775,30 +775,30 @@ static void *mt8183_scp_da_to_va(struct mtk_scp *scp, u64 da, size_t len)
 
 static void *mt8192_scp_da_to_va(struct mtk_scp *scp, u64 da, size_t len)
 {
-	int offset;
+	u64 offset;
 	const struct mtk_scp_sizes_data *scp_sizes;
 
 	scp_sizes = scp->data->scp_sizes;
-	if (da >= scp->sram_phys &&
-	    (da + len) <= scp->sram_phys + scp->sram_size) {
+	if (da >= scp->sram_phys) {
 		offset = da - scp->sram_phys;
-		return (void __force *)scp->sram_base + offset;
+		if (offset <= scp->sram_size && len <= scp->sram_size - offset)
+			return (void __force *)scp->sram_base + offset;
 	}
 
 	/* optional memory region */
-	if (scp->cluster->l1tcm_size &&
-	    da >= scp->cluster->l1tcm_phys &&
-	    (da + len) <= scp->cluster->l1tcm_phys + scp->cluster->l1tcm_size) {
+	if (scp->cluster->l1tcm_size && da >= scp->cluster->l1tcm_phys) {
 		offset = da - scp->cluster->l1tcm_phys;
-		return (void __force *)scp->cluster->l1tcm_base + offset;
+		if (offset <= scp->cluster->l1tcm_size &&
+		    len <= scp->cluster->l1tcm_size - offset)
+			return (void __force *)scp->cluster->l1tcm_base + offset;
 	}
 
 	/* optional memory region */
-	if (scp_sizes->max_dram_size &&
-	    da >= scp->dma_addr &&
-	    (da + len) <= scp->dma_addr + scp_sizes->max_dram_size) {
+	if (scp_sizes->max_dram_size && da >= scp->dma_addr) {
 		offset = da - scp->dma_addr;
-		return scp->cpu_addr + offset;
+		if (offset <= scp_sizes->max_dram_size &&
+		    len <= scp_sizes->max_dram_size - offset)
+			return scp->cpu_addr + offset;
 	}
 
 	return NULL;
-- 
2.43.0


