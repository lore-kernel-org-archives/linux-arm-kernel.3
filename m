Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB4EC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 16:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XK4Y6ip2+MGpK5rFPoUFgmlORTebyDkmYty4BZXBQm8=; b=lyGwBu5ZHeyZVuh28CX1b/ZcdI
	qynZbut8xc1Ms7iNBlP2puZfM3G4iAC8AvZ8LX8x1nTl1ozLsr0wTq5iEwy2+cVjx9Zdp15clRZVR
	rXiZzXPw1EhTsapaRqeT12NwnHJDXJD62Q4OWi8LiuFIwVf0CexjPIREVFH8iyQ9dsRCNqzJ4PW2D
	MFBySr20CLchv82fnZH8/6b9vuavR7GDy5OUQbjNzndu+svlSwb4vNIm7rGsvNCG2rIQXOea+xAa/
	l3mFZJG/kSVY+jODDmRWsMiknrKSKafKVLjw4mT7+jn4uHMJnV3Fyd0jSYE2DqEe3fN7/oJ9hJwiW
	Ehsji/iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvIMK-0000000Cc5L-0Gsc;
	Thu, 20 Mar 2025 16:03:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvIFd-0000000CaiH-3hgK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 15:56:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FFAD1063;
	Thu, 20 Mar 2025 08:56:14 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D24693F673;
	Thu, 20 Mar 2025 08:56:04 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Brandon Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] cpufreq: sun50i: prevent out-of-bounds access
Date: Thu, 20 Mar 2025 15:55:57 +0000
Message-Id: <20250320155557.211211-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_085609_962164_EC0B462C 
X-CRM114-Status: GOOD (  13.88  )
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

A KASAN enabled kernel reports an out-of-bounds access when handling the
nvmem cell in the sun50i cpufreq driver:
==================================================================
BUG: KASAN: slab-out-of-bounds in sun50i_cpufreq_nvmem_probe+0x180/0x3d4
Read of size 4 at addr ffff000006bf31e0 by task kworker/u16:1/38

This is because the DT specifies the nvmem cell as covering only two
bytes, but we use a u32 pointer to read the value. DTs for other SoCs
indeed specify 4 bytes, so we cannot just shorten the variable to a u16.

Fortunately nvmem_cell_read() allows to return the length of the nvmem
cell, in bytes, so we can use that information to only access the valid
portion of the data.
To cover multiple cell sizes, use memcpy() to copy the information into a
zeroed u32 buffer, then also make sure we always read the data in little
endian fashion, as this is how the data is stored in the SID efuses.

Fixes: 6cc4bcceff9a ("cpufreq: sun50i: Refactor speed bin decoding")
Reported-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index 17d6a149f580d..c48ed04b82335 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -194,7 +194,9 @@ static int sun50i_cpufreq_get_efuse(void)
 	struct nvmem_cell *speedbin_nvmem;
 	const struct of_device_id *match;
 	struct device *cpu_dev;
-	u32 *speedbin;
+	void *speedbin_ptr;
+	u32 speedbin = 0;
+	size_t len;
 	int ret;
 
 	cpu_dev = get_cpu_device(0);
@@ -217,14 +219,18 @@ static int sun50i_cpufreq_get_efuse(void)
 		return dev_err_probe(cpu_dev, PTR_ERR(speedbin_nvmem),
 				     "Could not get nvmem cell\n");
 
-	speedbin = nvmem_cell_read(speedbin_nvmem, NULL);
+	speedbin_ptr = nvmem_cell_read(speedbin_nvmem, &len);
 	nvmem_cell_put(speedbin_nvmem);
-	if (IS_ERR(speedbin))
-		return PTR_ERR(speedbin);
+	if (IS_ERR(speedbin_ptr))
+		return PTR_ERR(speedbin_ptr);
 
-	ret = opp_data->efuse_xlate(*speedbin);
+	if (len <= 4)
+		memcpy(&speedbin, speedbin_ptr, len);
+	speedbin = le32_to_cpu(speedbin);
 
-	kfree(speedbin);
+	ret = opp_data->efuse_xlate(speedbin);
+
+	kfree(speedbin_ptr);
 
 	return ret;
 };
-- 
2.46.3


