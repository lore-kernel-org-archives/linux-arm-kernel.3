Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1CBCD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=; b=kxyDpOK3oikvoAARURUCpQKRyA
	jhzcR/2OxoWJCnzkz6tgVeBNfiw4tuCl3tj7pXnggX/1AOvDvcCFSEuGKr5S/8mR1YbYLLbKu0TV3
	dUrGEvZ/gkvQ8wsY+kMtlHB3OkVepr1WyiLnXk/SWa1SGdixtwBsBycvBi8cdUOv26hs5EWpGHe6n
	1djrBFtijvozL8Unh+VpA4QYrNffhOYhqlaEya9dDlPAxTfD+7x0vQM6jd3JEV8ucaVN0ZTAfAIsD
	Lj8jUnzCfqumEsZBdgaUc+94vklew37oxh/drMrXH3Of33lzZ20vJAQnjgskv7WtrwUAKaiDtrefc
	dAQx0OGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMfn-0000000Cr7r-2P7C;
	Mon, 11 May 2026 09:11:35 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMfl-0000000Cr6c-3SJV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:11:34 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c828daf83e2so339501a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 02:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778490693; x=1779095493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=;
        b=j4+7pacMaAeULOnjPM++G5bMvrz1wg2jcl8j4O1ZlqhzmCiUjK8M/sY+88jkv9pIo4
         FM0dkWUYexiU4wPaIrTCarQ616uPscg+TLgviwyt7/S0GJit0ZL4UJbfyglgwhCM2IGZ
         DglaXzub2v5702uE1ubkrb/1c8GZDCRWumMuKVJ2THW8TkmY4Fmb48JStAy42sRzdbKG
         etVBk8Q/ikH8vR9ZXMeOwtxc+LwaE+9zMHlyW1bgqoqZUTQH7Z/LzcYpakZzEibeLd9F
         IOBfYx+KCWz2halxkIYNoF7GAwpAs1FPa41bcdTAyxPI4OCHqOg5hXvQUrjdXqqZGsiR
         ElqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490693; x=1779095493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=;
        b=q8BSfT2kYpY2+AtEl42a/0+EqY0BSFQNOBbwjN9hT3hVAG83QuOBHTN/bUjRlk1nFB
         BH8n8S77Vj+cEnu+9P7qjEn7Cl2wvus4MHMWUuYbmJWbpq+uKSPRWfjwThB96cTLaGkI
         8IG0RinMgdIZOS3xLf19hKbcNdW9VmnsPg62A8UUe8eU0ZDO2Hz5LiJzhO1X4Yk4WdCx
         3bjI/M48I7sn7otemLc7GVIQ021cR4Pqy0XrmG/4vkrwv0jbcgTxAIOqPxWTkati+r47
         ay9UNqbQ4zm8e8EIwJaMWPg69Iq4FhUQL7M+rTcu+6T8tSekLwGj6w+yeabASDDcc7ti
         otGg==
X-Forwarded-Encrypted: i=1; AFNElJ8Krd7I7iocLJVSQhq5pofLASrXmWaW5HMIyQqw2++PHXo6vzSiTZXL9aUJ1z2Wb3hGFJOXDLCLfOkFZcFf6Tfd@lists.infradead.org
X-Gm-Message-State: AOJu0YwzE3xEfU/MlK+vABum00Op4JfNnlXQ69T+sv5BOgytovnKSCrK
	d0cwHuiEZXMAWbuZn1bB3kG9/DoUym8vbzxKZSa02O32doRcRBbYAfTZ
X-Gm-Gg: Acq92OErle2q6ZnNOn2cR40g/cqPfyclIwqnllN+4lYyJQq7pdGLcEYKMJHX67+V/Dc
	XnpRESYDmZnbU4zDoLgo8lmg6hVj36V/YlDDb/2HM7IiM3EdskLPCyxZCiWMwxP1v0TUv5yQ+9H
	aT/b1vRGbOTLXbeSPBINVbeTPQCrqkAx87OSCyBnnjGt1bzT9j0akhyaZ1cszaUzM7LlK0ADfj7
	BEr3D/GdLhwUjdkAypMNmmJJT/oWStiApT33VvytcctQN2kcSFTZV3sed+934Vnii9XvRND5GbV
	tFFa9+1okcfNDO3s2fNlN4/C7Q9C/Izq1/9YKlVZZSQK0Hw2EgFaCPgyzWpgxqMiakxYuwr3wQs
	sfCD7cLJnSGA+RN470k0P6Nm8NE/hrg++wwmFJxVfh+R538WLIxo3VbCsjNuu471Mgmz7YTNZQ8
	H/XiCVZm55Mwmw9uH/bfaaL7w=
X-Received: by 2002:a05:6a20:3ca5:b0:3a1:d516:36ec with SMTP id adf61e73a8af0-3aa5ad31592mr26172526637.56.1778490692746;
        Mon, 11 May 2026 02:11:32 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f37:1974:abc5:99cd:a924:4e86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm24775517b3a.3.2026.05.11.02.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:11:32 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v3 1/5] media: hi846: fix hi846_write_reg_16 handling
Date: Mon, 11 May 2026 17:09:20 +0800
Message-ID: <20260511090924.269106-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511090924.269106-1-mitltlatltl@gmail.com>
References: <20260511090924.269106-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_021133_867189_5F99EE1C 
X-CRM114-Status: GOOD (  13.48  )
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

hi846_write_reg_16() does not clear a positive *err value on success.
pm_runtime_get_if_in_use() returns a positive value when the device
is already in use. When hi846_set_ctrl() passes &ret holding this
positive value) to hi846_write_reg_16(), the function returns with ret
as is, the positive value propagates back as a return code, which
callers interpret as an error.

Fix this by resetting *err to 0 only when it is positive.

Fixes: 04fc06f6dc15 ("media: hi846: fix usage of pm_runtime_get_if_in_use()")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index a3f77b8434ca..7f069aca0fce 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1271,6 +1271,8 @@ static void hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val, int *err)
 	if (*err < 0)
 		return;
 
+	*err = 0;
+
 	put_unaligned_be16(reg, buf);
 	put_unaligned_be16(val, buf + 2);
 	ret = i2c_master_send(client, buf, sizeof(buf));
-- 
2.54.0


