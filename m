Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35B3C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 19:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/PfC+JKXiHR2gOczjEvFYMX7OwerkeM8UAQevJLjnNs=; b=rAF8WL7iDnRoCvZDdOI5r/pN90
	ucJdH/aaY4L9sj1HGCo9KdfhVAO2b3TyyICDX5/ftXp8IRzg4gU2cBwrTBwi/IzKuM5NCBdtiR57L
	dkgT1HdSs3MYF+nGMX33O6D8dUQIOu7kNR1SJY2NZtfqBq3peDfCtz1IcI7RYjt5rzDC/dYshowuj
	6a3Q8ES67K9sH3UIKFMa2RjVSUuSRq2mCRXW9/SsM1cxtrkyEJnFagXy6x+wmcjuiaQENjaGwWvNp
	cNoZn3Z3I5+WhP72NlpTsjIGvM/11S3VTkhgQV5TD5zXLL3A7p5D06lMvwaMkf+TVjz0ZZXcun8DU
	1JdpHXBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABdX-0000000EGpP-1Vhz;
	Fri, 25 Sep 2026 19:31:11 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABdV-0000000EGoU-3V0j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 19:31:11 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-13fc403e373so2224738c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 12:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790364668; x=1790969468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/PfC+JKXiHR2gOczjEvFYMX7OwerkeM8UAQevJLjnNs=;
        b=lrmB9rF07hervuSApSM2GO9jeMA4E8rwx+wgfdxncks7JqTif/cUODQhD5G8pRoHK9
         8ouLRgEmf7M/ctBli0EkFGwhbNCAnqXRGtfRiRp0hECrRbZVs1ZGracxnqwZkV9AWwm6
         1sL8PvN9K9llFdvvwbNZogI1Q+dv8h8nOOMDO4CUlKbnhYjWPwCnr2aG3/HVAsjnelvF
         V6iUpGqN+x9zMUHzMnlTn9f3nB83ReHGgUq3YYgKmra1fH2BYA7j3psHODpMY+nmI3EO
         SSfFXD77atmXg6ruNWs3coHM9EU45IJkF9LcrdyuWTpWl3LppM/TUAUEeTWAvEiUHdTJ
         3KhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790364668; x=1790969468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/PfC+JKXiHR2gOczjEvFYMX7OwerkeM8UAQevJLjnNs=;
        b=kiUDu49bRQovgCRTNyIZ5MGTUBxhhBeSsVGRKBEP/TgOTNCy9SvCoI2fYaa/3IK+OH
         EPgG8qioV+6mehxA+MTw/aASSGgSE7ACVp0+s6Q+KX2KULMZu8dpGDZELd5jgFrQk+VR
         zJaQwHKQKj3Vt/eweKvCyPqIbdnCJFAOSQ4VuKp2sOgOWHvVWqzwiOs+3eukGhQz5v+O
         vXUJYy2nT7H/3JzSMFedOAeB/OgIVhhBxixTD2isjKSV7m1DASMNJBxrsCzu0CwCUmok
         gLUmK0rrOp9ESj249MIzhasAk/6Jhx2aZt+dTLVByV82laq7h5M9NdAFO4DEgB/qOn5c
         9rNQ==
X-Forwarded-Encrypted: i=1; AKwUvBx42OB004BT1mSlMilEzTdoJQ3jD+hcVXnSaXM8GllS9Sp09wk0VE3ZG/axraqcPNs0LlSNcvWRtDqZj0oLCla7@lists.infradead.org
X-Gm-Message-State: AFuF++kvF67gUsIk6ZYqDqRDTpwuV9tvTTR+pwLReEyHYD+t/9++AMsM
	E+IPRIto91K5b//aCUlEwuIeldGAJsF1DgmWkj4u864bovbvEotlkgCC
X-Gm-Gg: AYBFou0QmA25CGw99k98IJKbPMthHJD1b9v8+/oCmLBZOxJyi+ocfmG5SPdp/bsfk+b
	ylcqvkLKmLtM1A6Azc+ga7peR5wP2zRXXXwzSTWX+gLRp+d8Cfq0u1f0uq2S/jF0JU7oZ2pfmrS
	FgUjVTurpb2CqM2Ytqnh2nyq3aUV74UmphCGlL8ctN4cEEBZLnDmPHgoSpsUDCcca9VLbd9/0iC
	S0eWF5R72S8LeTDpbAYWKyo+nYbYHy0u7+b+xADKDQuc1pgJSgKGSYLdkVIKhvL/TMOS2SxfJ5M
	k58/YP+LY52ZQrlZzDqzD/GUJFY8swWkZvcD6JN5mNSWTZURU32G2cDWl1mwZXE1ooTFa8COMn+
	hvgtK7hmYzN+agWbf4/hYmyMaEN3LwSWJD+9dqSzLz+gU5fUjPqe9x2thc4vSiFfKO1jzxJIDA4
	we6AnGpSmm7HIP5wLnkc8l1miQb3c1+TsfBC6Eg/TiaSc7HKcQ5eI05zI89+5tQmdBjRhk5lEAx
	DLTEaXuSEV9CbBgklYix3k1tNae8W16kjcJmWZVB3Ma67fovkKE8u6MW5VneKfnJThnbPKfxbrE
	7aQ81NXdoNL6d8dlPaeb/yR9WhnDIsg7MZa03ddwPU3tTw==
X-Received: by 2002:a05:7022:1584:b0:13b:32f4:e826 with SMTP id a92af1059eb24-146ce968c47mr1007700c88.11.1790364668278;
        Fri, 25 Sep 2026 12:31:08 -0700 (PDT)
Received: from ututo.. ([2803:9810:87dd:de10:161:9095:8001:15fb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc47ab8sm7886956c88.6.2026.09.25.12.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:31:07 -0700 (PDT)
From: Lucas Costa <2000.costalucas@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-spi@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lucas Costa <2000.costalucas@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] spi: bcm2835: fix device_node reference leak in bcm2835_spi_setup()
Date: Fri, 25 Sep 2026 16:30:08 -0300
Message-ID: <20260925193008.127314-1-2000.costalucas@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923184450.135601-1-2000.costalucas@gmail.com>
References: <20260923184450.135601-1-2000.costalucas@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_123109_875774_66CDC90C 
X-CRM114-Status: GOOD (  13.86  )
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

of_find_compatible_node() returns a device_node with its reference count
incremented, but bcm2835_spi_setup() only uses the return value to test
for a matching node in the loop and never releases it.

Declare the node with a scope-based __free(device_node) cleanup so the
reference is dropped automatically when leaving the loop body, matching
the existing __free(kfree) usage in the same function.

Fixes: e19c1272c80a ("spi: bcm2835: Restore native CS probing when pinctrl-bcm2835 is absent")
Cc: stable@vger.kernel.org
Signed-off-by: Lucas Costa <2000.costalucas@gmail.com>
---
Changes in v2:
- Use a scope-based __free(device_node) cleanup instead of an explicit
  of_node_put(), as suggested by the reviewer.
- v1: https://lore.kernel.org/all/20260923184450.135601-1-2000.costalucas@gmail.com/

 drivers/spi/spi-bcm2835.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
index 8f8715809c7c..23606967f7d1 100644
--- a/drivers/spi/spi-bcm2835.c
+++ b/drivers/spi/spi-bcm2835.c
@@ -1297,7 +1297,9 @@ static int bcm2835_spi_setup(struct spi_device *spi)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(pinctrl_compats); i++) {
-		if (of_find_compatible_node(NULL, NULL, pinctrl_compats[i]))
+		struct device_node *np __free(device_node) =
+			of_find_compatible_node(NULL, NULL, pinctrl_compats[i]);
+		if (np)
 			break;
 	}
 

base-commit: fe2ec83746e501645709761605c2464a44fd2929
-- 
2.43.0


