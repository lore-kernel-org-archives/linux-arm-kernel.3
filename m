Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE86CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 20:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4MsAfN8ggET6LQP8EBxlOi/6T17883/ulcELGobe1ps=; b=jCryuDEqpoNswgnSPPD7JJx/6r
	i5CGnvkKY6T3+xwZRNekF2kb8CkZ+LMTs7LyT/fsRPA0YRtKxJHQgJ5Kfl7SE8Uo7R2vV/o0zPtPM
	484//Abcdl57sEQ7dIR7OE3VbOokPAi8DPQDJs7cX+z0S7yGQV2ARaLZcDtRVbHtY3c00K47Lf25k
	7gxcW8rVonUeAs9iZKTX+YiHPbz+M7s5EujlyDGLItK46T7I2Swdzjuj+KI4kxXVxp/t85HRFQJGp
	OxAj9SQ4DqIFovcXbkwXNEX0SEuH0g8CXrky/2BZ/w5y7Bxst57i4iYJEU+aR12lxr3Obus0oczjM
	iI2sWIxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ses-0000000ClLL-42IQ;
	Thu, 25 Sep 2025 20:33:42 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1seq-0000000ClHP-1wx0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 20:33:42 +0000
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CB4A37A006F;
	Thu, 25 Sep 2025 16:33:36 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 25 Sep 2025 16:33:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1758832416; x=1758918816; bh=4M
	sAfN8ggET6LQP8EBxlOi/6T17883/ulcELGobe1ps=; b=pJf8uTAxclEov111Gn
	xQ33IEzEHo7vZmyugvLylE5X3t7pkcrOh7/XCidyZiYzR0a4NyS6HyGjCY2RivHL
	kzjCsBYKPn9K1MMqnWmtZ+EUfptvUGwTXB3/GZ8RoGAFD14VLatTcN0i7x5VdcxL
	VzKzL3SI9txI5qCLxEx4yXyHlncYrz9iuU7+9OZYhj/NBtQ8b0V3YQT953Sy4yZo
	Poqajq2bZA6wWZeIzp3ZkJcmlT9Jk2ZhyUUk7CV3YRcYDk0nTHNtiocJBthAeOKb
	mdf+WJOcxLqpClG3rFnpPh/b85F1wePpSMC9tA3ZEygExgKKTzXzHmGqjOhNBwNS
	IGpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1758832416; x=1758918816; bh=4MsAfN8ggET6LQP8EBxlOi/6T178
	83/ulcELGobe1ps=; b=lw2ETftN5AzzStse6OyaSkJZuueuyPUur6H1J8UGRtAL
	tAAxWijSEKFt0+5vbGbdh3XAnZ0qgCAOIiIrfGGq/UXiozMzSnH1YKDdLcp9/6BN
	KhM3y0FEGYd2J7ZXf5fTGCZdsy68aVqpYXJHAF25iIz8+Do2qQt+Zpi19xJNXYpI
	Mh4WgO2/X6IQvjxGw6fQgxjDjmvjifcF4MeHYx9kv+zv+8/UeqFmKIOzks5BE+LL
	UE7ge7OkFFfvJm567uE/u+dwu9/8SwWCtMq+8Fol1c3T23qehOYs3iW2+4RsZsHL
	V6Zrlv+zstB5oR5MuvqEMKEV3a1pZWJpe/v1oxRW/w==
X-ME-Sender: <xms:IKfVaDcyJhuTh0EKMcbT7vfbUje0hkz8Pbd-IaixgespATpn-tBd7Q>
    <xme:IKfVaDQrYi9YSJzbAyMUw9HGudsbSIg0PzuO7Dc1C7BlHXtf450WNSz-mWmtG7Ul9
    gtJfkffpo43jiU3YeEvA-b0v6hzAcVH5dQoFvUpAgjFSqnwnPJhZA>
X-ME-Received: <xmr:IKfVaMZ4Z7_YvfZp_Dav0LunN2VmZjwuKOp6WaDEsuZj9X8eArDK1OprQmGG3gTJW533JK5Z17qaxoYL770K6oOFF-9bzRlim92Rfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeijeeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheplfgrnhhnvgcuifhr
    uhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgffeiff
    etueffteeugfeghffghedthfekgfdtjeeuuedvveekteevvedvffekheenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnh
    gvthdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    shhvvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvg
    hrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlvggv
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuh
    igrdguvghvpdhrtghpthhtohepjhesjhgrnhhnrghurdhnvghtpdhrtghpthhtoheplhhi
    nhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnh
    gvrghlsehgohhmphgrrdguvghv
X-ME-Proxy: <xmx:IKfVaGdLgQ47fw3_12hvrZhafUyESr_kIuiiZmel5oIMUKdEh5wa8A>
    <xmx:IKfVaNJiTL8cjvTSDT__UcSJ8An68vNHUfVm4Igj0aPVuEA7GARr-g>
    <xmx:IKfVaDLdz77NmFoKrf-EvnPHSUTNZT49cU58Nm4x5bJ6E_AfDQQmSg>
    <xmx:IKfVaMWokm2V5rgT18v8iSgKqEmkosr2nwMaMhFre0Ew3s07gidJUQ>
    <xmx:IKfVaL5wYVvDXcvtiryhIXB5g6spwD_SM6WbfZgl96NQUaRfSyCNdz9w>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Sep 2025 16:33:35 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 25 Sep 2025 22:33:18 +0200
Subject: [PATCH] mfd: macsmc: Initialize mutex
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-macsmc-mutex_init-v1-1-416e9e644735@jannau.net>
X-B4-Tracking: v=1; b=H4sIAA6n1WgC/x3MTQqAIBBA4avErBNMiH6uEhHTONYstNCKILp70
 vJbvPdA4iicoC8eiHxJki1kVGUBtGJYWInNBqNNrTtTK4+UPCl/HnxPEuRQrbYNzQaRHELu9sh
 O7v85jO/7ASqO8vhjAAAA
X-Change-ID: 20250925-macsmc-mutex_init-80d7cb2aacfa
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=+Jor10eg5LvHZCSW9hUAM8+MJz6BmLXiQAQ9uw52A+I=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhoyry+UO9Srerd2t5J3CXPixIzP8kk3K0o78Hg8pJqstE
 61cZ6zsKGVhEONikBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMJG9Cxj+u/Dy+rsvSXuXqf/+
 NJPM2Vvxa/88vl4V/Sj85vrdP/fqPWD4n5c9X/nTyo3iOrwT1Xo0xQxLWI2EVVz8QmOninz3X3G
 PBQA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_133341_052687_5893A467 
X-CRM114-Status: UNSURE (   8.20  )
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

Struct apple_smc's mutex was not initialized before use. Surprisingly
this only resulted in occasional NULL pointer dereferences in
apple_smc_read() calls from the probe() functions of sub devices.

Fixes: e038d985c9823 ("mfd: Add Apple Silicon System Management Controller")
Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 870c8b2028a8fc0e905c8934c2636824cbe5d527..3a117cf19145e86b642f40dc165b542b8df69070 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -413,6 +413,7 @@ static int apple_smc_probe(struct platform_device *pdev)
 	if (!smc)
 		return -ENOMEM;
 
+	mutex_init(&smc->mutex);
 	smc->dev = &pdev->dev;
 	smc->sram_base = devm_platform_get_and_ioremap_resource(pdev, 1, &smc->sram);
 	if (IS_ERR(smc->sram_base))

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250925-macsmc-mutex_init-80d7cb2aacfa

Best regards,
-- 
Janne Grunau <j@jannau.net>


