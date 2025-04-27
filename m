Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070BAC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 11:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7G1hVkGcH/CVwZUqITWBWEMBFZr9TFGzQGp36jVQQkk=; b=eAjDr/eljHlecNxwuaA5HfUfV7
	vVE4/V6fpPtspWUTPzZNoHReqy5uDg0MGih7bfVnwpPSjnnddbpnSwReNXLGDBFZVsCLorgk4h4Vo
	hFloyUMDLEReuuHW4QHX/I4KptE0wScGSYY8dfE5eH69boTgR5gfmDH5coyqyM10PX/qDjtOUjUHI
	Xpot9zxvC3cjzUDtH+K9KkguFPQPfxxHGfisl2TOh8aQTdwtloljWW0tYcl+id0RcqJXObGc1WwX5
	12dM9JbE02LcbWgBvNEDjed7NpY53qh91k4r+8CJEgQvb3Lb65tgWE6KmvYL+gHJUldnWwU865F/W
	L8VLsY/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u90MG-00000003QVN-0X9R;
	Sun, 27 Apr 2025 11:39:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u90Dz-00000003Pe6-3rHP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 11:31:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 47FE46116E;
	Sun, 27 Apr 2025 11:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 995F0C4CEED;
	Sun, 27 Apr 2025 11:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745753465;
	bh=R6oSEObaTaH0Rzyp6urqUx5bFx9N32/+kpJdZz3z61A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hEgItdNtoXNGeDRKKF2+f7EaObMTpIzx34T5OV3ZjtkWF4JNLx467w/QJLmcgdYoj
	 XQqQNZ1vEuM0zUtdIkZVdapJNARIMy2Fy4zoWfqvYzAms5cn9UM+ZHNvMYqHHcVmhD
	 RivTJNiyy32UlHGta0qh5ssW3bvB+XsnISPikcMrVUoTY0CR6/5PFjAN6y1xFF8TUj
	 UPvFrniZoXqAsIKi/gW7VJAG3iiZoLyJ+QEMNIeKlg6ha7/dW0DAplpSrTuAb3NTQQ
	 r/s5RlpICdjqMIqJrF/S/gd3yZ8Rhyt9piPaDaD1J9i13FCmY5VUZESpZTAQOyBwwX
	 /urBMdP1lcn6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B3CC369D3;
	Sun, 27 Apr 2025 11:31:05 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sun, 27 Apr 2025 11:30:43 +0000
Subject: [PATCH v3 1/4] i2c: pasemi: Enable the unjam machine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250427-pasemi-fixes-v3-1-af28568296c0@svenpeter.dev>
References: <20250427-pasemi-fixes-v3-0-af28568296c0@svenpeter.dev>
In-Reply-To: <20250427-pasemi-fixes-v3-0-af28568296c0@svenpeter.dev>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>
Cc: linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=9e+uBDc/DvIOiwP1SNDeg2HD118JGZSQxiaK6ReJfNw=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQwafaFHGRN/pm9qYmMSf79lsPWPLjOhVt4wOceQ6n+U6Z
 LZbUCq7o5SFQYyDQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjCRX2EM/8y3Nq/qURNX6vr1
 sGbbZH5LpeNrftl+MbQvP/deIjIrgJ/hr0jOQpE37RWKl0sn5OmuliuMVPZ7Gtx7OeSad/zkPvP
 PDAA=
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
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index df1b0087dcacb0a3b94196368137d5e20b0e6d7e..3f5571a90c1d268ea2a9d95285f1a5e47f0481ff 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -71,7 +71,7 @@ static inline int reg_read(struct pasemi_smbus *smbus, int reg)
 
 static void pasemi_reset(struct pasemi_smbus *smbus)
 {
-	u32 val = (CTL_MTR | CTL_MRR | (smbus->clk_div & CTL_CLK_M));
+	u32 val = (CTL_MTR | CTL_MRR | CTL_UJM | (smbus->clk_div & CTL_CLK_M));
 
 	if (smbus->hw_rev >= 6)
 		val |= CTL_EN;

-- 
2.34.1



