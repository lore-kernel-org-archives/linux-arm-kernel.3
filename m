Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0BE606D81A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 04:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OVADoTNH;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kGW4TkTc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0zwPeQp6dUlaCXVekZRsNO6Eo2NKdROfCYjJe7dvpFY=; b=OVADoTNHxHtei8fobkBBiJuAYB
	LouPHBr3i9EOBTtb4TADWph/vAB2Of23HY42YLcFNDdp6QBVw3c0tSPJrtQLfYSOMmgMg9w2sjHpF
	5y6AeDQlZhhb5xwXKt+3gMwEMGZjhj0h5Uj1CghAE0+5DxT0TtnbkJqPxMFjcmhlLvToXGPHoEowt
	3WEcyNJVJuUFHS5j4qTJ3PuTIqLVTevNUSRp/dfp8yibW3kjs8lcSEEgFRMCkCdsbBpr+GT3KBAIP
	CIVAc5EGKxMqTXySYVTuOqch2CrvWV1jPM8qfVxmrsg5k+m8HryoRhK974l+X96si7bsCtoYF2Xea
	GQKZRJCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpHg-00000007nAr-2Jjx;
	Thu, 05 Nov 2026 04:41:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpHb-00000007n52-40GA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 04:41:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2093460D8E;
	Thu,  5 Nov 2026 04:41:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793853662;
	b=PkvL/cewj8KioAI9emVtBNt0KXhwReBRksfuVS8bWgwWj247PjdMRkM7YhWCkllpzTZY
	 SPftrB9K6On4Sj3Cw/QLYPg/lXwau6I18/46AhNXoiIoWTGpDD+vxA7E/76fecXAzm0Iz
	 IzPTOlQNxhZo9+2t5w1c5LXZ1q3M6DKUIECAtWqQdMlqoYvi5ab/eJMywLYM6Mp47xlJg
	 Chm62QTgi8NcIpwFSAQ6orE2Sr8xR6z3KqBhuuJTMhD5hsKEbsoOcYnY1Z+aKqgZR/uon
	 ylpnZOh6ba4hww8ZgRyXTsfbdbgigM1Z8Tp/jDDqoIvUAJOI9kHiW6Q6Q61Y4nk3DGg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793853662;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0zwPeQp6dUlaCXVekZRsNO6Eo2NKdROfCYjJe7dvpFY=;
	b=3pumTXxqbRYy7ZsW2ZdBX6T1nxrqQyS1E7NXJfYhfLLLnkVp0CasVDcyu8SOmSEzvwi+
	 ZxFA87uLvKbYMJIBgG+eRqv1E2TM42fTPBQXzb08yzly6pSmKeeWiuCbEbHZIbmnEcuFQ
	 zR0mUD5zN5SehSjw3zWomxxRq/6wWaPyvuk69Mp4wfb0HzgXQ1Re41VtZiPMsxNgL7kqY
	 Yyhh8JCDlxbRfow1+jos28+6Mckux6r16qD5HYIFD5p3vJeqzCVA+0zoUVK0exPN2yIcv
	 8C0OU+QhRkqbzKYhwaRxDkUau5BWaZ9bhgXhTBqOn/T21c+cV8ZfcX+KMTfgRpLmcHQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 635B01F00A16;
	Thu,  5 Nov 2026 04:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793853662;
	bh=0zwPeQp6dUlaCXVekZRsNO6Eo2NKdROfCYjJe7dvpFY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=kGW4TkTcRc2kUeo2NiUhuUXk7ysDhdbf/n3gQpKGwNA6XTtXkw06EVrEwc+0OCvee
	 Dnc/W19wYQdj5M+FCVRv2fRdmX+ahaEYSrJXcHoxpMtvYDjZ4VZhXWvsqvC1+UBFU5
	 KgJ0Qhzdho428xyzYZlPZzFBKZz7x8nNTGCWA0Bs/tPFMZ/BZQ9bHVlzOjQqCzLdYO
	 B3niuOuWmF1iRp+DcwBMnonAtMWqN0zVDztiFvKCLoxeItyMJOm0SNZrsGENL+tJwB
	 FsYWQnLNIolD7AEcp8YfmPx4fBDM8ya9dsESKbtAWPIgTvFyCVkbjF3rb82+02BiZG
	 uaJ1/uhKZWH7A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E3BE84709B;
	Thu,  5 Nov 2026 04:40:57 +0000 (UTC)
From: Rajan Yadav via B4 Relay <devnull+rajanyadav0307.gmail.com@kernel.org>
Date: Wed, 04 Nov 2026 22:40:57 -0600
Subject: [PATCH 2/6] cpufreq: sun50i: Move nvmem cell reading into a helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261104-a133-series-v1-2-58217cb33a87@gmail.com>
References: <20261104-a133-series-v1-0-58217cb33a87@gmail.com>
In-Reply-To: <20261104-a133-series-v1-0-58217cb33a87@gmail.com>
To: Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Cody Eksal <masterr3c0rd@epochal.quest>, 
 Alexander Sverdlin <alex@sverdlin.org>, kernel test robot <lkp@intel.com>, 
 Rajan Yadav <rajanyadav0307@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793853656; l=3211;
 i=rajanyadav0307@gmail.com; s=20261103; h=from:subject:message-id;
 bh=jug1cYQuSv5vtD26KyGAcWUzxwXZeSilBxENXC4nAHg=;
 b=k0dIIHjmW7+QmHhHfNI7sv6p4fN6fPT5z/URspyr/6RQHO8f1lmPqeO5DKL27skarbEWmIzqG
 dyveJDl+NJ4BHE0MldP9sop/vfM5Jg6T/yKTwlavNrJkql/F2zTG5q/
X-Developer-Key: i=rajanyadav0307@gmail.com; a=ed25519;
 pk=4ZPeiP5qrv2b44q/Obxi2koUS70Q6npbttJnpUoTlgg=
X-Endpoint-Received: by B4 Relay for rajanyadav0307@gmail.com/20261103 with
 auth_id=1391
X-Original-From: Rajan Yadav <rajanyadav0307@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: rajanyadav0307@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rajan Yadav <rajanyadav0307@gmail.com>

The A133 speed grade needs several efuse cells, but the cell reading
is open coded in sun50i_cpufreq_get_efuse() for a single cell. Move it
into sun50i_cpufreq_read_cell(), which takes the cell name, so the next
patch can read the A133 cells by name.

No functional change: the existing users read the first cell, as
before, with the same length check, byte order and error message. The
raw bytes are now held in a __le32, the type le32_to_cpu() expects,
which also removes the sparse warning "cast to restricted __le32" that
the kernel test robot reported.

Claude Code (Anthropic) drafted this refactor and its message; I
reviewed and tested it.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603021703.aBD0w99y-lkp@intel.com/
Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>
---
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 55 ++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 22 deletions(-)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index 9261d148a16..34c0897c22c 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -31,6 +31,34 @@ struct sunxi_cpufreq_data {
 	u32 (*efuse_xlate)(u32 speedbin);
 };
 
+static int sun50i_cpufreq_read_cell(struct device *cpu_dev,
+				    struct device_node *np, const char *id,
+				    u32 *value)
+{
+	struct nvmem_cell *cell;
+	void *buf;
+	size_t len;
+	__le32 tmp = 0;
+
+	cell = of_nvmem_cell_get(np, id);
+	if (IS_ERR(cell))
+		return dev_err_probe(cpu_dev, PTR_ERR(cell),
+				     "Could not get nvmem cell\n");
+
+	buf = nvmem_cell_read(cell, &len);
+	nvmem_cell_put(cell);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	if (len <= 4)
+		memcpy(&tmp, buf, len);
+	*value = le32_to_cpu(tmp);
+
+	kfree(buf);
+
+	return 0;
+}
+
 static u32 sun50i_h6_efuse_xlate(u32 speedbin)
 {
 	u32 efuse_value;
@@ -191,12 +219,9 @@ static bool dt_has_supported_hw(void)
 static int sun50i_cpufreq_get_efuse(void)
 {
 	const struct sunxi_cpufreq_data *opp_data;
-	struct nvmem_cell *speedbin_nvmem;
 	const struct of_device_id *match;
 	struct device *cpu_dev;
-	void *speedbin_ptr;
-	u32 speedbin = 0;
-	size_t len;
+	u32 speedbin;
 	int ret;
 
 	cpu_dev = get_cpu_device(0);
@@ -214,25 +239,11 @@ static int sun50i_cpufreq_get_efuse(void)
 
 	opp_data = match->data;
 
-	speedbin_nvmem = of_nvmem_cell_get(np, NULL);
-	if (IS_ERR(speedbin_nvmem))
-		return dev_err_probe(cpu_dev, PTR_ERR(speedbin_nvmem),
-				     "Could not get nvmem cell\n");
-
-	speedbin_ptr = nvmem_cell_read(speedbin_nvmem, &len);
-	nvmem_cell_put(speedbin_nvmem);
-	if (IS_ERR(speedbin_ptr))
-		return PTR_ERR(speedbin_ptr);
-
-	if (len <= 4)
-		memcpy(&speedbin, speedbin_ptr, len);
-	speedbin = le32_to_cpu(speedbin);
-
-	ret = opp_data->efuse_xlate(speedbin);
-
-	kfree(speedbin_ptr);
+	ret = sun50i_cpufreq_read_cell(cpu_dev, np, NULL, &speedbin);
+	if (ret)
+		return ret;
 
-	return ret;
+	return opp_data->efuse_xlate(speedbin);
 };
 
 static int sun50i_cpufreq_nvmem_probe(struct platform_device *pdev)

-- 
2.34.1



