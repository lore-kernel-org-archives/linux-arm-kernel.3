Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A735C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 03:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ewk+C2Dr+NeNykXYcfbBUgSsghNQhbXTW4j8zHUNmfs=; b=ULn3QU31NzowKMPJdS1FFOMk0s
	+T7PuL7IRqEkz61aFustkJDP4VNYyy03a0X9M1VFd5yxhiqSwEgc9kC86kXAZqMQ/VRI8MUkVl0E2
	/dFT8Ed9bZRQQg4ZbLXER7N4zxbtYk3BnpDaN2Wjhus5owz8tQk28RyV8U6W8y86/2qcDu9ir096K
	/pifMSpBd2NnvJwRMTMM6e207ypaCfMI76sDCl+y7KZRqynFLbkkKfPXBUnu067PdfaEeY0m+cKUL
	f/nUSzJRYmrpq/3c7soOX9ToeIPLuwmNzFY220qF0zLGARh6izZ3aGvKT8saUX3jwBJT47C/p4gbR
	ksCczg0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7m4Y-0000000FvZC-2o2x;
	Sat, 19 Sep 2026 03:49:06 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7m4V-0000000FvXU-1If9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 03:49:04 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so1059598a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 20:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789789742; x=1790394542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ewk+C2Dr+NeNykXYcfbBUgSsghNQhbXTW4j8zHUNmfs=;
        b=PJcq5DTmx/s1xUXdp9JcL956aOGUUzzvw0AjIHmFOsM6nQNF81JmxLumPmaZ0eH4WA
         vjMvHDYu8AogOy39fHjue27mHAQ80VyLyOknTMzHdvYA2LQ/Z4ElAnvkJoQtD4rr6Eny
         sm4sdsSSeMxlyDobKwrcIq2mxlVPA72CCM60zNR5Az62ngMCE9l0J//D7/IY2ED3Lcxg
         GhEMuM/IxjToSBPSOzZSknkDXOqYKW6qmTfAmc6Q7+rKVjKaS5UhHhzFs6pg6i2BejJU
         o5jUyTXZlVIx5cjvKngU2cYySfSAyzigk3LuA7EbmFev50W/vtYF8YZpVCPofPlLZW1K
         wbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789789742; x=1790394542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ewk+C2Dr+NeNykXYcfbBUgSsghNQhbXTW4j8zHUNmfs=;
        b=QJYMB1jYM23CScokevYtObNwULEA0qbN7E+TitMsXQKlB9J7SOntRXtku/yawKZnPe
         4NU6RQBiHI/fONrY1chNcRZ0YOV/6Rcp68dO9QpQ4kdJj9j8nK5cjWULdPPb0fltfwWQ
         dHaXtTWUHk2G1OY2iXkZI2Hev3jxdK4Wxt0sNmK7waCQ/UQVY573ctl5CrfBcIZCRpKx
         zbkHUya6IcCptypw+/WJBihgSnY69Pqbx9NvkheA/J2rDGFR73kQOIKAAMSEZCvKsDzo
         QLGa9EWO9oJgh5QQDbBxw+djHHMbtzrtH68tXll3iH4+/PxJAVR8zdzfYScpKJnknBDl
         egsg==
X-Forwarded-Encrypted: i=1; AKwUvBwdvOwHdxBMoqczylTzJHWCiQHhN5WxQ0qM9FNQ6tryIQGgUxyh4+8H7+3Gn6NSV5tBxbSlxsg1UuPzBM2RwFlv@lists.infradead.org
X-Gm-Message-State: AFuF++lFBeg5Eou0mnNITGfX1Mmh60eSBn3Ub23lR/E+hJYNDiABlYjh
	6lDpVeyd8Wr1qciBwxeLc9ZmV5HJSSR/e8KlZmXSFMktH43jllskWAM=
X-Gm-Gg: AYBFou0E0eR5TsM2OT/u8NWA3TK5ZiqxWeEEpuV9xPLl893e6TPjUWchdY5NVw4KZuc
	lKGcNmdxYXrEpCuW/h1hEBmQuBLVGQrDZFGxrwJ9KtU9HcAJlbOuWIK+n4t7fe3sGy7/wjFCfhg
	pNR8tagCm4/UWFvr0lF1TNDR7OfMSnSmp1Qw7t9FVNrO510iZO0W59e0bwh9kS4vkgQnXps8Qan
	s5mZcTXbJm7lxsnym+o8mG/zG9qwWFTgUOSa5yqosQRUozMej/VFxDH29cYWPhjAQEBpiDwwbuv
	SNhFzkvaQiFMT6FwAio31iHxT7haCxce2g9ZZzDCDZ26/2JpmeD6xUnaLNQt5RpDrCIw7KELemo
	p/XL+D0u+oWDbmWUcWXc0DWaqzUBIxhG3qqWUjSeuAvsViOuGdxCX/v56w3pBCeX9CwrFI/jZxy
	D7Tcw2eYDna/Z7Fm4ghOVcstYvsE3GoZ73DF2claOCrL2VW/zMHpgx2uV8CqD7Jr4VX+ga9vc2R
	Tjodr452GxCeF+4KGwq0LiaBjJe4SKwJom6yijoPoEKbGMQ6B/DoYrW7mcyXlflyYyWDiSehsio
	+C6TwVQbYCETJA==
X-Received: by 2002:a17:90b:48c6:b0:39e:131d:4510 with SMTP id 98e67ed59e1d1-39e54ce5062mr9390976a91.13.1789789742457;
        Fri, 18 Sep 2026 20:49:02 -0700 (PDT)
Received: from codespaces-2db70c.ktkhmpmw22vebpok31ngjx2qsb.ix.internal.cloudapp.net ([23.97.62.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c4ba12csm2305479a91.11.2026.09.18.20.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 20:49:02 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH 2/2] firmware: raspberrypi: Clean up local formatting
Date: Sat, 19 Sep 2026 03:48:40 +0000
Message-ID: <20260919034840.28593-3-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260919034840.28593-1-triet.hoang.dev@gmail.com>
References: <20260919034840.28593-1-triet.hoang.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_204903_358975_2B0FFB75 
X-CRM114-Status: GOOD (  12.86  )
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

Add a blank line after the local variable declaration in
response_callback() and fix the indentation of the UINT_MAX return in
rpi_firmware_clk_get_max_rate().

No functional change intended.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/firmware/raspberrypi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 88c3de9ce67a..1e98fc1457d1 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -39,6 +39,7 @@ static DEFINE_MUTEX(transaction_lock);
 static void response_callback(struct mbox_client *cl, void *msg)
 {
 	struct rpi_firmware *fw = container_of(cl, struct rpi_firmware, cl);
+
 	complete(&fw->c);
 }
 
@@ -260,7 +261,7 @@ unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw, unsigned int
 		 * assume the maximum clock rate is absolute maximum we can
 		 * store over our type.
 		 */
-		 return UINT_MAX;
+		return UINT_MAX;
 
 	return le32_to_cpu(msg.rate);
 }
-- 
2.53.0


