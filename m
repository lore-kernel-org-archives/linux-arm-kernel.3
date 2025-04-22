Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E51EC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 14:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lPFC4LcnN4maWHkXh5oR1L8DFfyQEi6+KKWudgcP/fs=; b=zCEUMkpZtJlTCYPSQo2j3KOvdY
	us/OzEJL3M9y4POiY9ISxayti6wtD9qs4N6z79HUNKl470iErZqjJU1R+qtQG88OSoF8bj/0agteW
	5hHkQw01U3QT5n6sTdrgPL5UyP5BXh6mOor1p22oApprBhU4QTtgepvYIxFd+uRuH1o3JgIGxWmzx
	trE+Ujj3afSBth2XwbfSQGhtLZobzettdlwEvMtF5cURczd2E2ZzeZreix/1zWibzGMjn0x73yljF
	WLgPIDDS79jadZECxx9hbUW8+khuyOVgajeWCCmGavvrgfUgikgk54q7qIU1zax5d0qC54N4g3wv8
	P/ImwXDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EY4-00000007Tlu-1F5M;
	Tue, 22 Apr 2025 14:24:32 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DMe-00000007Evx-3AOg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 13:08:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 976291FD49;
	Tue, 22 Apr 2025 13:08:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peko@dell.be.48ers.dk>)
	id 1u7DMZ-009gwR-26;
	Tue, 22 Apr 2025 15:08:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Praveen Teja Kundanala <praveen.teja.kundanala@amd.com>,
	Kalyani Akula <kalyani.akula@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Korsgaard <peter@korsgaard.com>,
	Kalyani Akula <Kalyani.akula@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nvmem: zynqmp_nvmem: unbreak driver after cleanup
Date: Tue, 22 Apr 2025 15:08:31 +0200
Message-Id: <20250422130831.2309995-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefkeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepveeiveethfelteelueelvdffieevgfdvtdeivdetuefgffdtvdeuffevheegffdunecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghkoheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehsrhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtohepphhrrghvvggvnhdrthgvjhgrrdhkuhhnuggrnhgrlhgrsegrmhgurdgtohhmpdhrtghpthhtohepkhgrlhihrghnihdrrghkuhhlrgesrghmugdrtghomhdprhgtphhtt
 hhopehmihgthhgrlhdrshhimhgvkhesrghmugdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: peter@korsgaard.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_060840_938966_E3D952C3 
X-CRM114-Status: GOOD (  10.98  )
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

Commit 29be47fcd6a0 ("nvmem: zynqmp_nvmem: zynqmp_nvmem_probe cleanup")
changed the driver to expect the device pointer to be passed as the
"context", but in nvmem the context parameter comes from nvmem_config.priv
which is never set - Leading to null pointer exceptions when the device is
accessed.

Fixes: 29be47fcd6a0 ("nvmem: zynqmp_nvmem: zynqmp_nvmem_probe cleanup")
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 drivers/nvmem/zynqmp_nvmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/zynqmp_nvmem.c b/drivers/nvmem/zynqmp_nvmem.c
index 8682adaacd692..7da717d6c7faf 100644
--- a/drivers/nvmem/zynqmp_nvmem.c
+++ b/drivers/nvmem/zynqmp_nvmem.c
@@ -213,6 +213,7 @@ static int zynqmp_nvmem_probe(struct platform_device *pdev)
 	econfig.word_size = 1;
 	econfig.size = ZYNQMP_NVMEM_SIZE;
 	econfig.dev = dev;
+	econfig.priv = dev;
 	econfig.add_legacy_fixed_of_cells = true;
 	econfig.reg_read = zynqmp_nvmem_read;
 	econfig.reg_write = zynqmp_nvmem_write;
-- 
2.39.5


