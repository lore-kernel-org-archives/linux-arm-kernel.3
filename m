Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A724F606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Erw0U/qd;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=R+eJCw6M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wIuWNWPmiP+GNfu0cVbxFPeeVlExF/grvtfoQgXSHo4=; b=Erw0U/qd65xLBe
	s58zSF+ozx5ooTCMb3yxhhmjnaFOsqHechRlfaiRfUBkE7t5sxHhct5nlDVDbFf90yMnAXn9UI7i4
	7LeUhuTxxjAj9EP9CPKN74mt79Sa1f/Omw/i0JdPYNckbfslAe0BWUOePQVMyTHUBOnR0mOf0QCPE
	l3vXeRykOkXsm3E5KdFItTv3GpH57MulUfMIYaJqm7ccJ414BFQ8R+L3Y0pafoOynLx2rfhJ63jkZ
	GdgqeRxMd5Sme4TGbq2K7T9cAas0cOnUFLGeKHtCWL6eomK27nQuJF9mKuCerievVM/pNGCqBdEfo
	HwVNRNnwwn4xmYT314VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdeo-00000005utd-0PUN;
	Wed, 04 Nov 2026 16:16:14 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdek-00000005upp-0V71
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:16:11 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 29727240029
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 17:16:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793808968;
	bh=wIuWNWPmiP+GNfu0cVbxFPeeVlExF/grvtfoQgXSHo4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=R+eJCw6M8/Nw/75QDJVrXpSmBh7JLoqXQmQwg5FlV4XvdGikMIieCGB9+uEyNxLfw
	 NoTIAILP69+BjIB2oLlYJN/mUq29mZF1ylXqTnHmSdvC81InjxbaAK9bDXs1rZHfmM
	 K+DdKYbSOY/Up59my2KmKiZAA9mFmLCz5CgkRePs0RvTmHEd4Zgjtfhz9zNCYa1TJg
	 3CC+w22lpccNfmxzxean/pHLj3iouL0mFnGD62nYoBL6TI67ya2vL+39KG7XXxqGuP
	 W30GXah40hqOHCPK4mhkO926we1fsbISUzMJuZsrJTrU3nWylmqzcH2wx81NEOUc/l
	 ysxupYYZmuSDQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jKVtD6Xh8z6v0j;
	Wed,  4 Nov 2026 17:16:04 +0100 (CET)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org
Cc: Mateusz Nowicki <mateusz.nowicki@posteo.net>,
	Julius Werner <jwerner@chromium.org>,
	Evan Benn <evanbenn@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Marek Vasut <marex@nabladev.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/3] watchdog: arm_smc_wdt: try every id of arm,smc-id
Date: Wed, 04 Nov 2026 16:16:06 +0000
Message-ID: <20261104161553.30115-3-mateusz.nowicki@posteo.net>
In-Reply-To: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
References: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_081610_475670_D0DE20E1 
X-CRM114-Status: GOOD (  17.44  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SMC function id of the watchdog service is not discoverable, and
firmware for the same SoC does not always use the same one: on the
STM32MP2 SoCs it is 0xbc000000 (the OP-TEE default for the platform) or
0xb200005a. With a single id in the SoC dtsi, every board whose firmware
uses the other id loses its watchdog.

Read arm,smc-id as a list and use the first id for which SMCWD_INIT
succeeds. Go to the next id on any error: OP-TEE answers an unknown
function id with 0xffffffff in a0, which smcwd_call() reports as -EIO,
not -ENODEV. A missing property still means 0x82003D06.

Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 drivers/watchdog/arm_smc_wdt.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_wdt.c
index c73ed1dcdfcb..993c8f92c871 100644
--- a/drivers/watchdog/arm_smc_wdt.c
+++ b/drivers/watchdog/arm_smc_wdt.c
@@ -113,8 +113,9 @@ static const struct watchdog_ops smcwd_timeleft_ops = {
 
 static int smcwd_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct watchdog_device *wdd;
-	int err;
+	int err, i, n;
 	struct arm_smccc_res res;
 	u32 smc_func_id;
 
@@ -123,12 +124,17 @@ static int smcwd_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wdd);
 
-	if (of_property_read_u32(pdev->dev.of_node, "arm,smc-id",
-				 &smc_func_id))
-		smc_func_id = 0x82003D06;
-	watchdog_set_drvdata(wdd, (void *)(uintptr_t)smc_func_id);
+	/* The id is not discoverable: take the first one of the list the firmware accepts */
+	n = of_property_count_u32_elems(np, "arm,smc-id");
+	for (i = 0; i < max(n, 1); i++) {
+		if (of_property_read_u32_index(np, "arm,smc-id", i, &smc_func_id))
+			smc_func_id = 0x82003D06;
+		watchdog_set_drvdata(wdd, (void *)(uintptr_t)smc_func_id);
 
-	err = smcwd_call(wdd, SMCWD_INIT, 0, &res);
+		err = smcwd_call(wdd, SMCWD_INIT, 0, &res);
+		if (!err)
+			break;
+	}
 	if (err < 0)
 		return err;
 
-- 
2.56.0


