Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782DAC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 13:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SO0Fk6BtwRVGlHqt3kYa0/V5Y1iTIzUN0pe77N3ab/M=; b=UgKdkv9UaFIeZTYyXY+B4+KErK
	oJQz1HGzLk8SEwRIndsRNL/yYbs7/CWuP2HYvlXpNbtNJnIMv8U0/G5A86VePZgI1/ey9jsj0LLpO
	RH5RYD5Mo3npbnrKW8EVf7TMv4z/jlspQqoTSlYPlnJVtlJfoqntGl6Bpl2mYGacXyUHC/jhEeug6
	LTalSP4dVow0YpK12/4WGdBSa/2yWy/0TGT+5X5iV/Cfz739VFIzG1E+VBOAWj9M5XtESTVGvYaR8
	2D8y0Fdc7tJM+TLk9g43nFLxmxdxI1Ud85P/OsIxuk8kn0F/0iSGGYASRtEjTuxcf570rUSF+KQGg
	KqDixE6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlplJ-000000086Ig-0XlP;
	Sat, 22 Feb 2025 13:41:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlpiN-000000085yx-3uyD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 13:38:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BAC2861159;
	Sat, 22 Feb 2025 13:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D15FC4CEEA;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740231522;
	bh=3b399MgkPbalzkt0UKL/iAOTcLxAkop81OzJJhuZ+Qw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s4q+Ybtj7eNZQ0gHWEM4mrhT5OZ5IHP4VQg29ucZqQ7rG2UtOHhHajlwxnaesYENz
	 NoQogjKJVa3BpJPJFh7YkRsv4WhDpiMXmGZPRMGFwCbNd8+zgBf6wfERZ1itsxyXQ0
	 XFnKFUrhnGHqb0Z1/FcjlQOkXZkTcz8LmRrlxzqccHYi9ZBrA0YNZGPr6TW2kJgGbD
	 Esm97bCU05N+ABKPtOl10s3g/kmWCg9bmi1Urpm0+XWXrnGU/46ZVMRHI15JVwIWVl
	 XilqBoMGVdrBNkHE0xllGmfOY/M26Kkg1UDXHSf214+hRcSCALiYdMqz8zogTOvt7f
	 8/RJZgv2qb8lw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60716C021BB;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sat, 22 Feb 2025 13:38:35 +0000
Subject: [PATCH 3/4] i2c: pasemi: Enable the unjam machine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-pasemi-fixes-v1-3-d7ea33d50c5e@svenpeter.dev>
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
In-Reply-To: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=2vIJw3C8UuzlR0vDYIDEMzK/yjJe3TCpkfiUQCAlb68=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/rOy3GzHj/dEP3xtk/58bMGC1Ys+l3dfPtjVbnC09wJz
 A+sr00M6ChlYRDjYJAVU2TZvt/e9MnDN4JLN116DzOHlQlkCAMXpwBMpPMyI8OxM6p5HBcKLa7/
 X7/syeXHrYtiGiofibCW1W198dqFXfQ5w19Z0ZporoRI5wvvvpebbs1Z9PQ7Z0SBR/BzDuu5TXW
 zL3ABAA==
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
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
Reply-To: sven@svenpeter.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Hector Martin <marcan@marcan.st>

The I2C bus can get stuck under some conditions (desync between
controller and device). The pasemi controllers include an unjam feature
that is enabled on reset, but was being disabled by the driver. Keep it
enabled by explicitly setting the UJM bit in the CTL register. This
should help recover the bus from certain conditions, which would
otherwise remain stuck forever.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 770b86b92a10..8f0ba975172f 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -73,7 +73,7 @@ static inline int reg_read(struct pasemi_smbus *smbus, int reg)
 
 static void pasemi_reset(struct pasemi_smbus *smbus)
 {
-	u32 val = (CTL_MTR | CTL_MRR | (smbus->clk_div & CTL_CLK_M));
+	u32 val = (CTL_MTR | CTL_MRR | CTL_UJM | (smbus->clk_div & CTL_CLK_M));
 
 	if (smbus->hw_rev >= 6)
 		val |= CTL_EN;

-- 
2.34.1



