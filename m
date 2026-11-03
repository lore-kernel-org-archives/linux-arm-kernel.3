Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2BF6082BF9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I+iElIYt;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=qQ6aSPH+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=n9UzS+0yoynIRHmX7RFL35r5qc5ZU/OmMg2n54yvo4I=; b=I+iElIYtCZduN/
	brwo9rZesSBJbIenVoVgs+n95UekDnpqrWL91WowouPJr7R39V74QD8Mv7lRFyCU7QuAknLavtrf/
	KQBv9IXSxsrymrQ4QI5J0FnatwWgoSmUR7Xngqr7Wih9sv/ybu4fg4lr1d3lC0WVDFIiP1uN+5LMg
	bCoPtKRliSExbVE6UYjU8dtlTAqw0Vp0pLAixTO02AcBGUTd3BGLIYeDVpt4jabmgjIm0E/EJA5rN
	as28iRPcMiwFg0sdZkgkO6KxG4d8s6flcbH3M6xydvzgrdxt+MyVx0ffV+9kJx50ns8ydqjjZU3GD
	tJ5+/cC1HqCl7CKReA0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9u7-00000001XeX-1BVd;
	Tue, 03 Nov 2026 08:30:03 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9ty-00000001XZe-2Mr6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:29:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793694601; x=1825230601;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=9ihnjzFxJvJl8h5oChA4G/zXh2wj+4MuoWnoqC0/TW0=;
  b=qQ6aSPH+s31hSV3fh0IvVyMYIaHOkehVhcwbRy6fujB7FJwuxMn16N8j
   /E+rPUhnO9u24dEr51Eefkf1QS1/Nk91CUV+kz1b+KlqS03rcuidqedc3
   4ru4uOGARWLsNHMzm5FSx/ICvoKlY0q9JUpzIUbQzgtAk7V7ILUCX5huG
   5LQSRHyMDY0DlCGxDF7paDHgtFSYrtx+yP9DcvCJ5uaaGJSz94pLxHFX/
   m1m0dCOJi7rNPiHnZY8eBqbKYddDsCeMcA7Py1QFoisu/FHO1BDw14JM8
   eEzEgxjbgsKl9czx1Y3W45ezj0ITWQOOQ4gmSW+8+QKXVdCxIbWCvnCss
   A==;
X-CSE-ConnectionGUID: C2jOjHXDQAiO7PJ6P3Cq5A==
X-CSE-MsgGUID: 3eAJCJ/EQOKeTVe1mzVfzw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 10:29:59 +0200
X-CSE-ConnectionGUID: klZl+CP9Rxy8oF4EFwvFXg==
X-CSE-MsgGUID: td+SdMnxQb2fLPb9q9wA+g==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.3])
  by ces01_data.me-corp.lan with SMTP; 03 Nov 2026 10:37:53 +0200
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Tue, 03 Nov 2026 10:29:51 +0200
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Tue, 03 Nov 2026 10:29:40 +0200
Subject: [PATCH 4/8] i2c: nomadik: change print level for fault messages to
 debug
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-i2c-nomadik-fixes-v1-4-655c6af2cb70@mobileye.com>
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
In-Reply-To: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
To: Linus Walleij <linusw@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 srinidhi kasagar <srinidhi.kasagar@stericsson.com>, 
 Ben Dooks <ben-linux@fluff.org>, Andrea Gallo <andrea.gallo@stericsson.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Dmitry Guzman <Dmitry.Guzman@mobileye.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_002954_929035_C1E03D0F 
X-CRM114-Status: GOOD (  15.21  )
X-Spam-Score: -4.0 (----)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

i2c-nomadik driver prints error message on every faulted message. This
is not a good practice, because in I2C a fault not always is an error,
sometimes it is the expected result. For example, scanning bus with
`i2cdetect` prints over 100 messages in dmesg (two messages per each
target address).

To avoid excessive prints in the log, change the print level from err to
debug.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index a3cef4b66190..9c7658148bd4 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -627,7 +627,7 @@ static int write_i2c(struct nmk_i2c_dev *priv, u16 flags)
 
 	if (!xfer_done) {
 		/* Controller timed out */
-		dev_err(&priv->adev->dev, "write to slave 0x%x timed out\n",
+		dev_dbg(&priv->adev->dev, "write to slave 0x%x timed out\n",
 			priv->cli.slave_adr);
 		status = -ETIMEDOUT;
 	}
@@ -661,7 +661,7 @@ static int nmk_i2c_xfer_one(struct nmk_i2c_dev *priv, u16 flags)
 		i2c_sr = readl(priv->virtbase + I2C_SR);
 		if (FIELD_GET(I2C_SR_STATUS, i2c_sr) == I2C_ABORT) {
 			cause = FIELD_GET(I2C_SR_CAUSE, i2c_sr);
-			dev_err(&priv->adev->dev, "%s\n",
+			dev_dbg(&priv->adev->dev, "%s\n",
 				cause >= ARRAY_SIZE(abort_causes) ?
 				"unknown reason" :
 				abort_causes[cause]);

-- 
2.43.0


