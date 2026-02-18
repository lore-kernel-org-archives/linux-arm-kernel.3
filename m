Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F64FE9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 15:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DiGM3saLexQq7QJjFVEPfTJjnwZ/SSpdBYTl//BH56U=; b=xpBtXXxyVFLCvKF4H4MhNuDFGU
	Qpkjejy1RFbBy0BKzIiBcKg5NSx4Tmh5y3Ua3ce9o6BaFUQjXT/l4NHQTiTxNFNd5zP/Q4WLNLxdW
	pOfAyV5A3BmmbdZJ4Ho9qCfBy42JxVXnjYi1qdnHf8Fkw1PzanlWTB7EpYoIvV/7jfLZ5Bjl7wyIp
	fI02MyhLVT8zdMgHX/bNSAZl/unpRjzrfNIOT19lSEzxQekAngwZzipxqW06v9t63EasMiqxgR/Sb
	fZfwsUsIzJCx95Ca5eKHbQ4mt66u/9sfqw1NocgxXxTBYet9KMvtqosBAIzvueOCrM2izm0+Zp7rE
	/dmgFpgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsjBc-00000009zsP-3JKL;
	Wed, 18 Feb 2026 15:09:56 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsjBa-00000009zrB-3dC9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 15:09:55 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-435f177a8f7so5824844f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 07:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771427393; x=1772032193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiGM3saLexQq7QJjFVEPfTJjnwZ/SSpdBYTl//BH56U=;
        b=Rm/bSH3mj+4cztVSPlWpGQ/K0dGlsJdwEKlemrDu+ABJd/JCNpRWgydGNpYB0zV0jl
         aiwYums0gVA5pxm+PlKTh9aTqdKMkaswTjZ4xPQXfxLWBMlGED72aOpf8W4UkG9PJ5Ss
         LhJ7iiCMeiqoKwQL+JfM2o8Ra5XmNltZ+Cs2Ww3c0BkLd987z4xwWigjuG1K+s53qjvo
         07o3e/vMVTRaI3i5RnHyi8ipHxUbJzixS+ACK4XYv6x0rmib25PrT1Ul3e1I3ng8Pz54
         gCiVx90VdeeGEjujlxeivj4oZk/FQgBH+Xd7EMj6vw7KqJjEEXSKyWfv4gP82vjrRGYX
         jNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771427393; x=1772032193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DiGM3saLexQq7QJjFVEPfTJjnwZ/SSpdBYTl//BH56U=;
        b=A94S4iMBly4qLAHmVWbiySSFkQunNwAPdllER3il5R9eXncwyslZuIXmWNORcxMCYH
         6gU+E4kVbHyyLdDM1kgOH/ZOcwyUA3v+JZpNxsSgrmQwwlBb4DejcL1yRwln/7YoKTjk
         hxm5TsRzNmm72/nIEj/vKY3MHPljwbIijC7HONKEQz7MAm8QytWXoYnHyp+MfqSZ9ZEp
         tQkGrG8speE9WEKmPJPiDeWPEPQpXGsCUcQGb9FLsDmYxIW44hjfG1YstPftqG0mXF7j
         LSgiKNmWuioU8cPQOJeZfu/oOA3oIbqTBkIemuPDUXMv5RiWw/q5Cqh2uDKKgcU2ExKB
         GgyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa+fp5Tz3ieaX++uSBxwsHB1/+45HifJKHUPoNsToTzrSyMZmis84sYLGO3yfpEN+QuYb5HNLa3MS+wljdGDCp@lists.infradead.org
X-Gm-Message-State: AOJu0YxkEIiHcliirIYlSJaAWfedENt5ahKuoAAZqCBzL04DsSUu31eV
	Ht0LgGmAl5I3HCq+R/ni6sIrp4EWTwRthZIexQWz4xP0+S1csvr93VuK
X-Gm-Gg: AZuq6aIS7lK55GuOhzfpt4yMdaRDzZHMiWnqtnRCaLo90LPTzKF0MRkyKmHRcoMbP5C
	w0utNFLxj2ADkiD5VFWybQ3k5CGzRoB1x547V1DBUyV3AjP1sQY7kZM9aSnz4DAbCTKnCwqXH9+
	feik8zifRt/b4/+PBAU8MWYRv0rXDQUkke1aMgHMB+fH4fQ3Ixt16BOERDzHKUeCG7WeiEFhWjH
	1a/j2R7NqzdUErUXSkBKLcx1Mf5yvogEcBo2wxDhpdG18VJ5QgIirCJPTDsewgnZZ8gLpaCKtTG
	7zZv8kwwCmzNQBXX1A7R/+CxWmArmzKn8660Wvx8bSdhpwIzk/XZaqzD2y/4WEL4IFi72bzIiR+
	TtIa2gODV+jBjBTrBo/uPrnye/uhxePoO4gIGbdafMm8NePSSb3xwGER/r1oMnxpDCvhERmDJ/G
	smQqe64xIQhKzREZvxsqVkUT9LqP3haJ88wk0eM+mXUHrYaQF//tqdC6Cenroc6MPdCU7l8wGK0
	eALDc5A8bqKJN5NjuSS2dpWL1wIJDcldLXw
X-Received: by 2002:a5d:5f93:0:b0:435:e060:8071 with SMTP id ffacd0b85a97d-4379db61767mr23486335f8f.16.1771427392709;
        Wed, 18 Feb 2026 07:09:52 -0800 (PST)
Received: from eichest-laptop.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac7d91sm44333116f8f.26.2026.02.18.07.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 07:09:52 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	stefan.eichenberger@toradex.com,
	francesco.dolcini@toradex.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1 1/2] i2c: imx: fix i2c issue when reading multiple messages
Date: Wed, 18 Feb 2026 16:08:49 +0100
Message-ID: <20260218150940.131354-2-eichest@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260218150940.131354-1-eichest@gmail.com>
References: <20260218150940.131354-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_070954_920979_70EF1AA4 
X-CRM114-Status: GOOD (  13.03  )
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

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

When reading multiple messages, meaning a repeated start is required,
polling the bus busy bit must be avoided. This must only be done for
the last message. Otherwise, the driver will timeout.

Here an example of such a sequence that fails with an error:
i2ctransfer -y -a 0 w1@0x00 0x02 r1 w1@0x00 0x02 r1
Error: Sending messages failed: Connection timed out

Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
Cc: <stable@vger.kernel.org> # v6.13+
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/i2c/busses/i2c-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 85f554044cf1e..56e2a14495a9a 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1522,7 +1522,7 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 		dev_err(&i2c_imx->adapter.dev, "<%s> read timedout\n", __func__);
 		return -ETIMEDOUT;
 	}
-	if (!i2c_imx->stopped)
+	if (i2c_imx->is_lastmsg && !i2c_imx->stopped)
 		return i2c_imx_bus_busy(i2c_imx, 0, false);
 
 	return 0;
-- 
2.51.0


