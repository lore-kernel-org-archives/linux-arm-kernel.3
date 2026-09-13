Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5771BC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 22:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6tmc56vt785H8n8sw3psZCoq4rEVXID3penocU2E4Lk=; b=boiqrRdWlr/RuIZvE1fE0IQE1G
	kMjo+PpLVACKKSc7wDz0oGfh9xe6N8DU6xqpd6LZFvSkqsyAjK23AGrgEY8682ykFIX4M0FeFnio3
	tKzoc/FNjmMHyzMLqV/F50iheYTQb6h38hbb41AxiblVXGVIlwRSjxF3WjINJgNiVHpeJyqVBDG/D
	nBnSLfLe5c8mX77cyUE8XJAb3oPfH+9VfHpp2ptfaeTaaVXUq45QU746PB72ouMCT2pGvJ5CQoxk1
	721Nj6p7No5z+tIqX4hwKrnhcQw8MmMJuJHTVqwNRgcvknplU2FLuab3fajlYmw7kk9nKxAHOQnax
	YOJxcGqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5snf-000000024vj-0yc1;
	Sun, 13 Sep 2026 22:35:51 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5snc-000000024vO-3xVO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 22:35:50 +0000
Received: by mail-qk2-x10.google.com with SMTP id d75a77b69052e-52fb769ca02so25573011cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 15:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789338947; x=1789943747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6tmc56vt785H8n8sw3psZCoq4rEVXID3penocU2E4Lk=;
        b=V8O1VUZrNLkZRR5DHAOkonP4yYRzKnN5XddiVsFEFUJnQWyUjDxrGR7HBxyzkoWp+W
         KtpDZVTXwFAqujGy+3TkG11tOi9ZnRyxcZ6P4RzBNIAlYpqH9Oi0wbdZWrN6OxfGPe2G
         B0R2PKs0UI0EGGs/YMs8nNy9urZUJX450ynkjKarBdosdb4p+GaIHRLPm1J81fp1ASok
         k5Tt64M3y20ot5j7ptZTvgBM0zrHDqi0jIaDhsz4aAMSKrpxDXL0L37MqAZADjyHweT4
         IivLWyjXkEYhoIqteNJOfw9rNFO9565kiw4xz17KMIWbOKvWWDTbBAqo2CrWJraJnlWa
         Qwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789338947; x=1789943747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6tmc56vt785H8n8sw3psZCoq4rEVXID3penocU2E4Lk=;
        b=sEkem2j0COLGZlEFn9ulNhulnbzAUXSf9gFwECxJi43NqdJvp9HuDtPIxCqi4KVa0A
         C21dv6ae9HMxmy9CCi6404Xq2pW+GQA2Sj3IbYmw0aVL7ZSX4DWg4A5k5JEx4TD59iqT
         Q4Ol5nWV2liCic1ggehQDOM7qNNRaOhJHYBCQf1D1lPEa8pFcba70oJx81PsZEYQrqea
         gChq/BUMWwnYOsDbgXLsQEXNg99CiFdwvxXeLm2+sHV3b3jZ/oct7RK3dq3FLS/JjRn9
         5IvSvKSmyOyEi8RzMfei9VREs9h/1PFBOrAcsYxusxCJYoIEcbhXz6ol7xUyFZR9bHNX
         DFog==
X-Forwarded-Encrypted: i=1; AKwUvBw5KnCj0UD4IGoP4vhmfxIxgxGzuUMrfsXEVrlKQcYr1Vw1A7HLdzvIz4FPotxFpEpfRO1Y04vwk3uz+auQBDJv@lists.infradead.org
X-Gm-Message-State: AFuF++mA4r/H0hBD7+fP/1ETDj2Inu+D0/1CcWJm0kcF1N5hgf9gbjCE
	sRI4y4LROQdsbqjz/tC3m67AO1Ua8OCzYl5hqzL4X8PmNPze+uUqTC0=
X-Gm-Gg: AYBFou0FSosgG2dH8AhNufw1PwMf2PXdH+ZL2YQPUw7KEGrYzHlgEEXVFvAYrFAwfc6
	lamSSlZxThmUx3tqp6AhEzsHS3CHlXmShUtVFs94bTNGwAEIGLYUw1QvpDaOW451HAqEN9rS3Up
	s9SB1B5OEMfQAXrlSD+F/5LlalG/MuMZYVw8OjIfELGno2OLS2E73QHD9gOXSu5QSJCLGGJ55+l
	QTuxbDQzsKNv+0U4Xsuzv7DJbllRIgmAS3EdxsPW+nmynvAynLWcSI0dlIqUJMZKmOvqxO9ODec
	rUspPaeY+i4mqRdFI9QULLaSO2ab0SBmH+Ve69NkQBZqSGmg60gflY0AXLQx4hr52LFU28764AI
	Nx3Ry+KORaCh4YJMq5RbIv942n9MmrB1aS9wn65n/61gP3/4LVmmN1PW1nfTu+I6DnM7yIjOzVW
	XAslst8y7vIc8yEBB1ZlXGaUc4zQDMMjmfu57p8gDjdPp/KZRUebTI65GUTYJKxURLvTn6XZWy/
	ChH2Hu8cWCONzD+d2Y8KdXqmyVOxfK4SfRxdcRUig7ckIL8d/ZlCF2GgJ6Q65uvMwlyBo4xdXqK
	KE0qnTGKq5ERYBG9mfGMgVgmxwyIUzWu2g==
X-Received: by 2002:a05:622a:11c3:b0:530:eb9e:63d6 with SMTP id d75a77b69052e-5310d09817amr342871cf.49.1789338947507;
        Sun, 13 Sep 2026 15:35:47 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530d5e946a0sm71513481cf.25.2026.09.13.15.35.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 15:35:46 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] mmc: sdhci-of-aspeed: Remove children before releasing SDC resources
Date: Sun, 13 Sep 2026 18:35:38 -0400
Message-ID: <20260913223538.91579-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_153548_997476_DF238B88 
X-CRM114-Status: GOOD (  13.40  )
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

Probe failure and removal leave SDHCI child devices registered after the
parent clock and managed resources are released.

Unregister the OF children in reverse order before disabling the parent
clock on both paths. Use of_platform_device_destroy() because manual
child creation does not set the flag required by of_platform_depopulate().

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: bb7b8ec62dfb ("mmc: sdhci-of-aspeed: Add support for the ASPEED SD controller")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Assisted-by: OpenAI:GPT-5.6
---
Validated with an ARM64 W=1 object build and strict checkpatch.
No hardware runtime, probe-failure injection or unbind testing was done.

 drivers/mmc/host/sdhci-of-aspeed.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index f5d973783c..d317626feb 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -560,12 +560,14 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
 		cpdev = of_platform_device_create(child, NULL, &pdev->dev);
 		if (!cpdev) {
 			ret = -ENODEV;
-			goto err_clk;
+			goto err_children;
 		}
 	}
 
 	return 0;
 
+err_children:
+	device_for_each_child_reverse(&pdev->dev, NULL, of_platform_device_destroy);
 err_clk:
 	clk_disable_unprepare(sdc->clk);
 	return ret;
@@ -575,6 +577,7 @@ static void aspeed_sdc_remove(struct platform_device *pdev)
 {
 	struct aspeed_sdc *sdc = dev_get_drvdata(&pdev->dev);
 
+	device_for_each_child_reverse(&pdev->dev, NULL, of_platform_device_destroy);
 	clk_disable_unprepare(sdc->clk);
 }
 
-- 
2.50.1

