Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED36CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 08:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qoN/N/zV0mOtK+wxHpTPr+tV86a/2egova16++2Y83E=; b=EGa3RQB8CrCv6CiT46vE5jtIew
	C6Y8C4TTNTOXBxIMv2hqSd2xEqwqsZ/EzEbcBdxhnncM9ryysl4HEbzYevDwqlGeCW8WoUH1KFaT3
	ktikxv3jB7z6BXeR9uMZjc1ez3MLzWFJYEj4XiFgNYOG6lhYTquW7Pf8wYsdtckI3faQjXbomWazj
	3+MEc99ncl+jlPLHF6dvDupFrLGBy19OhymNjH5AH7HNvcU7ul6xHzBkVfKBR7Bkx3LBjuKGnHMSK
	TXIrJp59IkYzF+/mCDcXMdEKNMpEdqchsEVRRisi88dBW54K8ZVPI6pEoNrHmn1iw5U86C/JkYcEY
	XRqBR8gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwvW-00000005wgF-1Fus;
	Tue, 23 Jun 2026 08:56:14 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwvT-00000005web-1Gte
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 08:56:12 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-845369f60faso3192652b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 01:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782204970; x=1782809770; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qoN/N/zV0mOtK+wxHpTPr+tV86a/2egova16++2Y83E=;
        b=DJGKEuROcq7QvgWJJU4aa5pzwT0ajc86D53+idQfJ/467D/LEgGfJzus3nxLa3Xd7g
         Y1cDuwXUPkEmtZInq99imvmaGUS081JcqznY79h5TmUU97QnCYPXG1OeWM9g4ahdvVsk
         o9j8eMLcfTuaKkTwM9cNt/6ar7qMFpXxEWDrLeAvcf6yxxdu7ZafcZZLDc3cUi+dtoVy
         jJWnz/XanZp+IB1bdrV1w87UpNlUZFitozOcrNBhDWR4VTqm9hwXx5eAOSvY58/MMHZx
         afH/SrdzRsgWg0GHU/lKYYP3HdLDloCD8r6/VJ7FXf6WrBhGq6GsOKvpSiwJLqy044Vy
         4xwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782204970; x=1782809770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qoN/N/zV0mOtK+wxHpTPr+tV86a/2egova16++2Y83E=;
        b=qFYKIYus95UfNfw5XHg70Lmt+1pbIBBL8BhJBB6EbpWgilhF16si4oduB6pd8MW0OD
         /qG9Ocu9yMRZ2c8P0SfIRNaQpu1g2mq9AiU+5aFrj0Ljtk3/33W4yDaJwlQxe80dLeFR
         Rd2dS3z68JWfeDpJbukTxU6hvJX37uufYfYJ3QMsLe3UQE80QcHaHPA17FKtB9lYHQvL
         yi0C1Oh3EShda1Y0GDvEpGvv8MP0M6CjOdH+SW8/Ae4pGwR9sd5exrRgybxOl/W0Vipr
         p/MaS/0Mku+26L9q9wEcYL/mlxQ5B01KwG9LLenAG1bz+FQfmb/PtKneX0zEMOv+YkSG
         IAtw==
X-Forwarded-Encrypted: i=1; AFNElJ/QWItqcTIde/r2VEfcp5HeeYcrZwuNY14bqdN1D4brmtspvWkNfDmAx6uZAU3cskdcuwKMd9K8FLrkiC/+CX/B@lists.infradead.org
X-Gm-Message-State: AOJu0YxOfxtWg2f+EBcXxVOmqIPkGid8nna9uN0G0w0/og74WHPbcVZU
	Enc0YkwA3qIwoRua5Cvqcy0xmR7AMvlW4McKVm0OtPbncKaHQUXgdE4=
X-Gm-Gg: AfdE7cke7cSS2frMJBsFgF0O8ZuukkQfnnBQaFa/Xji2diQCheqmpjRkwtA3ZmGBOvC
	V7XGviAY0T+xsGFqepR49rbWw2mhM+WV8D92EnhzJV+SHndKRg5kbuQamxEpPtMkNS7XRa9atnK
	KNE+7MQY8JkZNWgdRkX4srHCvqauJXm+s+v5Okf+lGinVA2VJvZcmH1am3mQqnWAtIjRFBo2BNz
	D9PfHzUHyiFQ09ayiHVuA+23IwZgYFsPW8YSFZ+15bHchmo20bfnG+1MAN8XfswppeNnl5PgEMp
	zvll6NCXsdSra9NOi/g6wve6vknUk2QpuNfDGCyR0qPCJE5yyN4aQhvrQk6m4/5z0CTeeBqDktQ
	1pFf9qDxZnqR6IkFPQmYlU0nJFzgiANApd3ifozkrj3VO2IFRo9DXwcQO+JbB3x6RMY0t65rl5m
	KRJBSemK927CAXzW3vBfEAOf+XM7D+BWfnC9aPwdFjmiq8h3Ml67rzbVId+8bViUrn
X-Received: by 2002:a05:6a00:cc8:b0:845:4b4b:8836 with SMTP id d2e1a72fcca58-8455088cec4mr18905236b3a.28.1782204970192;
        Tue, 23 Jun 2026 01:56:10 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84571784ad0sm7757315b3a.24.2026.06.23.01.56.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 23 Jun 2026 01:56:09 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] char: xilinx_hwicap: unregister class on init errors
Date: Tue, 23 Jun 2026 17:55:55 +0900
Message-ID: <20260623085604.89284-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_015611_361646_82E04AC1 
X-CRM114-Status: GOOD (  12.61  )
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

hwicap_module_init() registers icap_class before reserving the
character-device region and registering the platform driver.  If either
of those later steps fails, the init path must undo the successful class
registration before returning an error.

Route the chrdev registration failure through a class unwind label, and
let the platform-driver registration failure fall through the existing
chrdev unwind before unregistering the class.  The normal module exit path
is unchanged.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: ef141a0bb0dc ("[POWERPC] Xilinx: hwicap driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
 drivers/char/xilinx_hwicap/xilinx_hwicap.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/char/xilinx_hwicap/xilinx_hwicap.c b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
index 34a345dc5e..9bb5fa642f 100644
--- a/drivers/char/xilinx_hwicap/xilinx_hwicap.c
+++ b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
@@ -760,7 +760,7 @@ static int __init hwicap_module_init(void)
 					HWICAP_DEVICES,
 					DRIVER_NAME);
 	if (retval < 0)
-		return retval;
+		goto failed_class;
 
 	retval = platform_driver_register(&hwicap_platform_driver);
 	if (retval)
@@ -771,6 +771,9 @@ static int __init hwicap_module_init(void)
  failed:
 	unregister_chrdev_region(devt, HWICAP_DEVICES);
 
+ failed_class:
+	class_unregister(&icap_class);
+
 	return retval;
 }
 
-- 
2.47.1

