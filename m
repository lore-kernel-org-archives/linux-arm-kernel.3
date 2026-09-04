Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6B0C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVe3j7HRHHIhbvIbEK+C2SoCEY61/0kcnS4nfccAWlM=; b=h+f3efzcDQjA1R7Now2RzgeU0/
	cWTkruRiQT85zjw0z6vNCZhZS63YawWlqnzQnkJpMXflPRlZ8r6Chu9SAVyav8i1EOslHtvVFTQCM
	c+QSF3QpOmKz0UxzkP3IdDP+EzeTHZw9xpSf+fItReOCL2lOuSeVOhOEP9jD0FcDKwauM7EkbnXTv
	F3SiWvkF4gUvbyQaIVT9XGgef5G9RggwOqs5bDq1K1mRa3fDoeEj2byONqXK4+wuz5yCJk/FGBBJs
	sNMYfWBIlkPL3ufkv5DDROI/bhRrYLOSBGecjGx5cGX8nZAgScmka4yHuAf8sxv8im6BuvZ0tjawI
	Sc11ZtEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RV4-00000001jXh-1fo0;
	Fri, 04 Sep 2026 10:50:26 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RV2-00000001jWo-0C7b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:50:25 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-382ef647e20so853563a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 03:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519023; x=1789123823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVe3j7HRHHIhbvIbEK+C2SoCEY61/0kcnS4nfccAWlM=;
        b=NzUeTAXjPvxQDuuBV01b9uR2KbKw24z7j/vf5I2E1GqQvmaSfs9QgpM0pxKh26yS65
         OjM2pw4BprKWxI4MCpWHath4bee7ajwtwHjfvp0Epv5L3rIg0YtTNcWaSiqy8o8QoA9Y
         u3jrelhZUrs0h8wiAy7aNwpaEWNrUyrOinLBzEnYbS/pzXn1qnXS8oRhMdEspkpRAR+D
         Sp/9twHnz4gQVgPv4bfDOlMFYDkguM6tSzWUlEddb2tmOnexljM/SP2SSu9cVFGbB5MS
         JFFahpMMaqW91AbJsAmGnbRsU8MPVc3qLLeWWWzDNltgZJIl/4/6Xk99FDFu/VdBTMyC
         lbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519023; x=1789123823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVe3j7HRHHIhbvIbEK+C2SoCEY61/0kcnS4nfccAWlM=;
        b=mR46ztvkaow0ekVb8xlvwo/ZrYmc4O2VR/JJianIo3k8OyEBzZ0qJYttvmSqapPFI9
         ADPW+aZTXzzFYE8JqELCWG5K/XegeQDEo+QUfzzUA0CE+iQfCqXjVLSHOfVEzf1h+ZEV
         HTHtgtoTQ+j+vNzXLd++rNKO+kPxyDreOZZbVxq24xh3ahl2rE5NRBeEKHleUq/jU/fP
         Vkx8mSD4Zz9dLjh5BMUrC0HPfSqxmY2stqPBW3z9iNxq0tRVEuFKGBPD8T15HnbXRjIK
         SM78kvXnPRyvQyqTlKVtbP+mmx7cs2eCv2AvZdfaVjLHOehEE0vIIROmldzOmAonhbGn
         3HEw==
X-Forwarded-Encrypted: i=1; AKwUvBw2MDQKwoEaAG7H/nJ8toEimAaUhpANW1pwBNZ5Y2nEZ04Ye6BVeVz3tDnWZwvoaTVaG5WOPBjGJoacl0U1BbVx@lists.infradead.org
X-Gm-Message-State: AFuF++l/byrR3Z63GkNM+HYlcByN6CJHlmi0cExdsYdQOnEA0Px0OALY
	IOPMaW6TNZ90Xp3CboJvcIpHOG/7Fu0jg2lYy234Gz9Juivk2iLf1jbL
X-Gm-Gg: AYBFou2Kl2P/MfSf320Kui9NFgdO+SFlNGHQWq8jp/UlVwI7M0GUI8LDuCgRxaKvF1Y
	wbfNd1RU6hCFz357Wnz2t8rKQMrdHgGBQmAcPHhp5ckh/EG/kTH+9vaS8wy7q40TtMy5D4BGJwG
	Tec/eWxC61FoHWuWqyVDz6Naz1qk6UmhCozb2tKJedL4Qpq0pMcgKV6kPhgoPw+Qdq3H7s94pTU
	11qdqdDG8qTFuGrwDQ2yhyCiwVoFpB3NyX0pya7JgWFracgMjDeZsV1wXtqpCOBAsfElc3RR2rx
	62hUBfPKZLkNsskHracAllxj91nTkhyBmNcAHhzE2rrfM9RsBsDCE009WtLGmHijbXFFDAZjGWr
	7CBI+PMU/vGhgdKlcMveg3G/Db79MUkkEkvHPUk2qsqn1Xm/xbza9v30KczTO2miPgPs0deqqjk
	eSOOVc7TvutBAKYpsLYiYD6Tyc326Q2e5dNPT116S2ejdvndDU5FOnwyqrANlJOSOYAJwQ4WKhw
	km8f50zVwHsp7o=
X-Received: by 2002:a17:90b:3912:b0:398:c724:1bb1 with SMTP id 98e67ed59e1d1-39b26101524mr6786890a91.8.1788519021437;
        Fri, 04 Sep 2026 03:50:21 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm6421454eec.21.2026.09.04.03.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:50:20 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jochen Friedrich <jochen@scram.de>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] i2c: busses: fix typos in comments
Date: Fri,  4 Sep 2026 16:20:07 +0530
Message-ID: <20260904105010.27405-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904105010.27405-1-hemanth.selam@gmail.com>
References: <20260904105010.27405-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_035024_088677_C089F20B 
X-CRM114-Status: GOOD (  15.32  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/i2c/busses/i2c-axxia.c    | 2 +-
 drivers/i2c/busses/i2c-bcm-kona.c | 2 +-
 drivers/i2c/busses/i2c-cpm.c      | 2 +-
 drivers/i2c/busses/i2c-st.c       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-axxia.c b/drivers/i2c/busses/i2c-axxia.c
index 0555eeb6903a..62dc55c146f0 100644
--- a/drivers/i2c/busses/i2c-axxia.c
+++ b/drivers/i2c/busses/i2c-axxia.c
@@ -60,7 +60,7 @@
 #define MST_RX_FIFO		0x44
 #define MST_INT_ENABLE		0x48
 #define MST_INT_STATUS		0x4c
-#define   MST_STATUS_RFL	(1 << 13) /* RX FIFO serivce */
+#define   MST_STATUS_RFL	(1 << 13) /* RX FIFO service */
 #define   MST_STATUS_TFL	(1 << 12) /* TX FIFO service */
 #define   MST_STATUS_SNS	(1 << 11) /* Manual mode done */
 #define   MST_STATUS_SS		(1 << 10) /* Automatic mode done */
diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
index d4f287b31fd7..0c30821e7b0a 100644
--- a/drivers/i2c/busses/i2c-bcm-kona.c
+++ b/drivers/i2c/busses/i2c-bcm-kona.c
@@ -12,7 +12,7 @@
 #include <linux/io.h>
 #include <linux/slab.h>
 
-/* Hardware register offsets and field defintions */
+/* Hardware register offsets and field definitions */
 #define CS_OFFSET				0x00000020
 #define CS_ACK_SHIFT				3
 #define CS_ACK_MASK				0x00000008
diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
index 2cb6a233d313..c8b72f14d179 100644
--- a/drivers/i2c/busses/i2c-cpm.c
+++ b/drivers/i2c/busses/i2c-cpm.c
@@ -334,7 +334,7 @@ static int cpm_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 		tptr++;
 	}
 	/* Start transfer now */
-	/* Enable RX/TX/Error interupts */
+	/* Enable RX/TX/Error interrupts */
 	out_8(&i2c_reg->i2cmr, I2CER_TXE | I2CER_TXB | I2CER_RXB);
 	out_8(&i2c_reg->i2cer, 0xff);	/* Clear interrupt status */
 	/* Chip bug, set enable here */
diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 0a2b43b5577b..873ce2f5a406 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -256,7 +256,7 @@ static void st_i2c_flush_rx_fifo(struct st_i2c_dev *i2c_dev)
 static void st_i2c_soft_reset(struct st_i2c_dev *i2c_dev)
 {
 	/*
-	 * FIFO needs to be emptied before reseting the IP,
+	 * FIFO needs to be emptied before resetting the IP,
 	 * else the controller raises a BUSY error.
 	 */
 	st_i2c_flush_rx_fifo(i2c_dev);
-- 
2.48.1


