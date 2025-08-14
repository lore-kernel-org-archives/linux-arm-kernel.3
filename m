Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAA7CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 08:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dInGrJE+Wye5FBXM3QXXiTdcsGBJk2tEBTfaT2DZ2P0=; b=N39nVYXCR/Z05VzbNaGacW3Z0Q
	qEJO3Q0KiD2/kx9/jPS3RPcmH8iZv2q3FfPYYcL+WsOqvEkX+oMFpWwt7a/8T3BkPfjddJy7fZMCn
	pZEjgH25V6XGvMh8DnPYYYRZRZO3Elu6ax1BcxnT0CUbGE74IKhzuY9BuP3RFJYwR/MB87OgTvXXI
	GJJ6CiCFi7WF2YIO0rR2FnfLIwGK0uLeJ7P/kylsqCawZdBZaBycal4liNBkPV21mtWHnba/AUVhJ
	0CuzBMUmMN25824nq1FPhEP2FwjIO1XfDZHRNPsbHxwI0MYZgotUA2DMfh0tV+XveGB8MBmR+cpOl
	g4oFXbXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umTcR-0000000GIY7-2sqL;
	Thu, 14 Aug 2025 08:47:31 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umTW1-0000000GHRy-3d88
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 08:40:55 +0000
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id B36D5EC020C;
	Thu, 14 Aug 2025 04:40:52 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Thu, 14 Aug 2025 04:40:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1755160852;
	 x=1755247252; bh=dInGrJE+Wye5FBXM3QXXiTdcsGBJk2tEBTfaT2DZ2P0=; b=
	Lko/orpi4SK6byknfmhH4e98miSBxF84PL7TaHkXdNJcTZkiL+mtDS6ENTs8jY4W
	frcJ2jPFiZ6cP2ueYCgdW8bQO2/gxlqA/cqcrPOLkbzdDEP47rqctEi7XNyI+5Tj
	/Qs29MGL7wt0vk8WF0Xf0Jb2v4yXxefP7qFk9/8StJs2H6uSsqVGJta9/+ssOn7j
	7q/Zq/RjuwkxuVY+jpJRmrW13ZqjVBvxuBDgaQhhOkqHeb5hWfnE2j0Bh9/PiezR
	T7JrGEfYsShE5L6JefI7FL8oRZdz1uw+pjEtcfti5oilRA6aIVZDl81136M/uwAB
	3PU+Q8zeC6AqvY4Fqaz4fA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755160852; x=
	1755247252; bh=dInGrJE+Wye5FBXM3QXXiTdcsGBJk2tEBTfaT2DZ2P0=; b=b
	0G/73GGv25R4Dn57qSO1jTgpX7OXss73gTjqFM7Oo3rBZ5BGDq4jzLtwdLcgOanY
	bjp5QjzyzBT8cykXLBCOmP1FQqtA+tIzLXbTjQUP0DHHQu3aFQd86c9yWe7q73hr
	BdpTW7Njh+nSaI5w1bXHphvxRSQP4lny15JFDRavBg2433A+tBtKcybfBchSG9Us
	yHUtXm5g9kV99OoJYEy8S0apSaF/ZQVN2ZJadLIUqG5XwzYXAsFOhxkwJIzWtYxC
	ieK+ZzAl+nriRFYqMtrirzltak4flimoH1+06LqNMarczUWKYynqw7wRABUueejm
	7kH9AWIvedwKZbhpYMSQQ==
X-ME-Sender: <xms:E6GdaEnqMQwD_5dvyZxxPdb-CA23pmcwlgSuyvYsrGcs1IacO3I6_Q>
    <xme:E6GdaJx4-s8tuXuKdl_RwAl5_es-lHyDLLNQ93XJ-RS_IHjeZKy5nlmvx9vgq8EkO
    ujWwXHB4RuleeGmMBg>
X-ME-Received: <xmr:E6GdaPwhP3P5xGk9pkKNxrmIZLH6vmcYYxprQtFZuwx6-1eEchNujbvwn3MP7a-bmdqJiEp9wlpMkcGdD0iaPWKYhSAHHXqHZxpPYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedtiedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehiohhmmhhusehlih
    hsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepmhgrrhgtrghnsehmrghrtggrnhdr
    shhtpdhrtghpthhtoheprhhosghinhdrmhhurhhphhihsegrrhhmrdgtohhmpdhrtghpth
    htohepjhhorhhoseeksgihthgvshdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhs
    thhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvg
    hlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepnhgvrghlsehg
    ohhmphgrrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:E6GdaBXroz8lPxjww_1gpBAT_vuCq1zxaGWsfN0w-op29NwH-9_wVg>
    <xmx:E6GdaORBBlmqCZyayryKfGCygdHeRDuRkYa5zGyeMI_Z_Ab78ZhfbQ>
    <xmx:E6GdaBTJ-nZo50ho-eHIU87xcmcdXu6mdEb8GM9imWYLBRoZ9gRSgQ>
    <xmx:E6GdaOeIpU34LfxYAbzvwPp1xzoS5giolcmwtzYseE3zlnYxgGGtCw>
    <xmx:FKGdaH2mSOs3f8J27TU-24IOAwytsu9nMTjxo5VO-bVL66M-t36_Xc4->
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Aug 2025 04:40:51 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 14 Aug 2025 10:40:24 +0200
Subject: [PATCH 1/3] iommu: apple-dart: Make the hw register fields u32s
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-apple-dart-4levels-v1-1-db2214a78c08@jannau.net>
References: <20250814-apple-dart-4levels-v1-0-db2214a78c08@jannau.net>
In-Reply-To: <20250814-apple-dart-4levels-v1-0-db2214a78c08@jannau.net>
To: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=Ah2FtuAI2Pz9rAwG3UdfiegkoAw7DTu7B/zqezSouiI=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhoy5C/lm/zDfVRph9d3OmFnl3Qox5ramw3xB3WnW0k+PW
 19PLNXpKGVhEONikBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMJEFWgz/fVoq+NS6AxoKJN5e
 knb75SSVz7j72+tXuYv5/73SXcn6jJFhV1DhUYYXrw7tf+Yl/OjfxDvTdPWuF8TWmktYRbRuSD3
 PDgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_014054_003400_EDF20BDF 
X-CRM114-Status: UNSURE (   7.50  )
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


