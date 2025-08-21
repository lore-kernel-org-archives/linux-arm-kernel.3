Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0476CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 12:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SiHsgd7okzHZC7sahAk8guYsKY/WDcCKla/MqikhROQ=; b=uHjHVhCzD1aGGkjrlEwhBB8x4D
	i31TCuuptDL/CjiZfo4xxWbUlymWs+QZoTmqccSoIAe14rt0UQ4tzS7PAr0ZFaffFqynOF9t6V87/
	BonV13zYntNPMGXpJtMS1TdGkDrH/56LjaUXX8wD+ng7inZxM24yDL8jlYAaeNLe9IPv6lrymcxa+
	YVPQRSg4SpY0q1Yla0P1CQQdsakmFhl805bBW0kpbD7hb34WfdNl7pp/ib7PI7WvFEjkFwi6w387P
	C9OpJrxIizSnYlMg075TJGQPF9jg4U3bhVnMgvuwUHMPfZ2rbLvOXGBYMjPQh3jbFFKoFOuvGx3Dh
	uhnIXeGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4NC-0000000Gu0K-0id9;
	Thu, 21 Aug 2025 12:26:30 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2LB-0000000GYhY-1XfK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 10:16:18 +0000
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id B48A1EC02C7;
	Thu, 21 Aug 2025 06:16:16 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Thu, 21 Aug 2025 06:16:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1755771376;
	 x=1755857776; bh=SiHsgd7okzHZC7sahAk8guYsKY/WDcCKla/MqikhROQ=; b=
	qpFOwpntq8Vt9Z6FF+ifj+ML13AVh4RY6H52o4rskHWYkSNGTeK4590yq+srRMZf
	jZ983Z+cYG/jnuDpi7gH4M9qrJH7NUvUG9bk3+da7FJMC32ac4aIukxliIKZszeH
	jNTSAaUI2miF2mr5cmJX/BrSN7vpHnWIBJfI3Fv8t6imYZOMNy7Wi1QRpfsI4UvG
	vIxqSFFw7JccoDynL7Qzdf6FnWOsyBJY55BZriOUX3Py9XUnwmn5hdwol4t0hkkk
	Bbe0VWd0Bxr+97DrIC+Xvw5nuLw2cVd3z+Nloi3zV8wFitN2bLT/s0Jr6siuFtxj
	3mwXTLQ2gmiLw29MQtsV2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755771376; x=
	1755857776; bh=SiHsgd7okzHZC7sahAk8guYsKY/WDcCKla/MqikhROQ=; b=G
	ddRYwZgRn9bRFOwiFxFLYLlu9aCfe5ClsAx1KrJ+dQyUg4m7YJ+zludS6Qy86q1u
	7n0W15eL6ISrjDMSyTvEyHW3ZCfiRrKFZ3PNnjXHv4otBP+3PvhjEwvvGLUBDHoT
	GFwEafK79jmVxjA/nofpQmmVUaHiZN/85n63gMIeT0PJL3AzMKF+DjroBu6fIRYC
	OiFzvMRM/OUES1bFVMcLcuNDbDdZlfqee1aWIyJX+l8Ndc4WbyiBZWLz8mQhU8Jm
	gB8OEdITBvY/fEuaSnwLaCe3Sep5csXPiVAZZ8Q8Fxnzok++5JKSfoUQB9lszbvS
	WbGSX71a/qx9EyXwA2I6Q==
X-ME-Sender: <xms:7_GmaMBzseDvlyN30MYQbsV1F0ZjsqxJJaVmaKus-0ny5_jqKhLKQA>
    <xme:7_GmaEfqfMtjrLd1QCptHQEuIHs8rhFfWVy9Kv7pZ-GKojSHkzFa7_-ULMk68tFJb
    E82sKEJ7b0eJMIl27w>
X-ME-Received: <xmr:7_GmaMspjc8TM7aYSR1sGd5YjGto5HZFy7XCVK7lchSVN69VvBojs5sSehzVCOW0KsVS1GeR2OmAyMiduW02zi18tVF-rpgHfPU-uw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduiedtleejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepshhvvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvg
    hrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgr
    rhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprhhosghinhdrmhhurhhphhihsegrrhhmrdgtohhmpdhrtghpth
    htohepjhhorhhoseeksgihthgvshdrohhrghdprhgtphhtthhopehiohhmmhhusehlihhs
    thhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheprghsrghhiheslhhishhtshdrlhhinh
    hugidruggvvh
X-ME-Proxy: <xmx:7_GmaDg4tVyIAzj-hh3Q75ifDrjp4uyCvGYVnCCbHioPdOQKYoHjWA>
    <xmx:7_GmaMuL9brG1KfGjBrReUZvPnu5wTrlXAFkS6y334bEqjNuWzJCIw>
    <xmx:7_GmaG_KNpkoTmBpL5paOtRL2oVaopsLafA79lpztvURwE49g9jBcA>
    <xmx:7_GmaKbeTfT_h9r9NDlv_MBzRJr57UXI8v3QdrvKJc2qRPxmBLmzlg>
    <xmx:8PGmaNSlEas4dUIKSOdiSoFlbSx48jiCGIVjFPGG0p8cH79ufZND07Ya>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Aug 2025 06:16:15 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 21 Aug 2025 12:15:58 +0200
Subject: [PATCH v2 1/3] iommu/apple-dart: Make the hw register fields u32s
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-apple-dart-4levels-v2-1-e39af79daa37@jannau.net>
References: <20250821-apple-dart-4levels-v2-0-e39af79daa37@jannau.net>
In-Reply-To: <20250821-apple-dart-4levels-v2-0-e39af79daa37@jannau.net>
To: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=/GMtF5Ozy2rc1sRrdEpBEK+lPwuPIjVdY9ROyd4UtjM=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhoxlH1+t2/52ySwTUWvOSwUBtyYUsv9K4lRasax74V6P8
 tpy//gDHaUsDGJcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACai2sPIsFjml3XpjyKvpmuH
 +NVf8/3O17/RoKEk+E/r1j6lE8duPGZk6Gd6VSJfNHvSBt4/v7u+Pfc4Wvfpm7vLlFDOAw0v/CX
 bmAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_031617_876795_ED9BB8E1 
X-CRM114-Status: UNSURE (   7.99  )
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

From: Hector Martin <marcan@marcan.st>

The registers are 32-bit and the offsets definitely don't need 64 bits
either, these should've been u32s.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Janne Grunau <j@jannau.net>
Reviewed-by: Sven Peter <sven@kernel.org>
---
 drivers/iommu/apple-dart.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 190f28d76615159527649cd288df395a50d950ef..e72a93e78e26ca61b233c83d439dbdfadf040fc6 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -166,22 +166,22 @@ struct apple_dart_hw {
 
 	int max_sid_count;
 
-	u64 lock;
-	u64 lock_bit;
+	u32 lock;
+	u32 lock_bit;
 
-	u64 error;
+	u32 error;
 
-	u64 enable_streams;
+	u32 enable_streams;
 
-	u64 tcr;
-	u64 tcr_enabled;
-	u64 tcr_disabled;
-	u64 tcr_bypass;
+	u32 tcr;
+	u32 tcr_enabled;
+	u32 tcr_disabled;
+	u32 tcr_bypass;
 
-	u64 ttbr;
-	u64 ttbr_valid;
-	u64 ttbr_addr_field_shift;
-	u64 ttbr_shift;
+	u32 ttbr;
+	u32 ttbr_valid;
+	u32 ttbr_addr_field_shift;
+	u32 ttbr_shift;
 	int ttbr_count;
 };
 

-- 
2.50.1


