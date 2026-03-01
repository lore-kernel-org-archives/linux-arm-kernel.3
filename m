Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA2AFD0057
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 14:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jMNSOkyr1OQmwknC/40Y8S8bviPWaYmHo+yrz5Q3E7M=; b=P5ivMZQqdS3/gpNkLZEzlt0dy9
	0Bbq8bghnwoOLPhaagiyE7e6JOBre1qSEPfy/zDk54+aeH1tmD28Xko79k3hFQYBXPA0EjkajxWPV
	gZm54ZpnoBpVeY8/IEK+pNL8GJAtXjcsscMz0hQ0vaML2UpTYXSDRi8whgjXSgiiH+owagpuSvtO9
	/QI5odKIkLWAsTVNfaosKZjGLj2FA++VcF5MnGRHqaKlLZ8prmGQnsCgKlIEEJhfq2Wh5oDkbO/YF
	l0sfg8sXoAw/D/4P0gLFvhZ6dQUG+WWznrKTIY/fbmvaxg+qDcV9sn1y3Avo4PumjAJRg/iCvTW1g
	T6yctr/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwi7f-0000000Baip-2nmT;
	Sun, 01 Mar 2026 14:50:19 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwi7c-0000000BaiT-1jZ4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 14:50:17 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-506a297c14bso33552491cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 06:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772376614; x=1772981414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jMNSOkyr1OQmwknC/40Y8S8bviPWaYmHo+yrz5Q3E7M=;
        b=HXGPU6yg2WQSxT6GOeDe0fkH+OGY4gfTLhP0mlGbioyLrASawsEdXyAQylTKgWhU8P
         X+PoYIPXCUhbHiE3MFc4UZ2QmUmvpmrhx/QuIESa/c5hcPJTnQl2/YX+4McVoVA+bpp3
         t8PKlViEOXnINCbeL3so2b2OQpHfvDp/octxLivGLgO+N6q/Kw+j9oqDpwEzGS82/CdY
         UnV0+uu84rgdW1JNq8VsBdoz2XPOUbSRycHbGG4ditRKtc6cOT/3QH99L13aMITF1dy1
         YO8xWztnAwI6xuhXsqL776JD2X33Q7rr/zcnYptKj9V+Dj0skK3wkepBg/0Cc2wyPgL1
         ztxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772376614; x=1772981414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMNSOkyr1OQmwknC/40Y8S8bviPWaYmHo+yrz5Q3E7M=;
        b=DJpUrWHrtUc71O72lxsWKcnbJbjPFq0fSkGV/ZB8Bsn5XfYyIxtyC6T4TKJfVvSKTr
         j7ZKkfM9s8KKHB5bpgDVmZtIoE6zUHZBRXrMfnuJcxUti1KHD3LY40VEFcJrUDTy6m1i
         C/vNWOxrdLFYrlAHFDy92akKYuW1rXXc5PL2WPdGzyl3w/zqPmVXz4FqWyagSrb4Gmg5
         yyghW2bkITvUEcIA4hWnYcDgZ2IRyGrxOrxoMLa172hGYrVzk5NSx6M2aLdHitpqlD05
         MGlqfH/lVcrh6juRXbNuhj8ARTZv28zQo6Vlz+BvRhCGBMPohbruTUapul6VtfBEsyht
         QtCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX84ilbxmPj8YBDoPo6kKm783R1v6zEOgMhxaHwgj4O+FsqCstfXKiFkNJpCVhxk3xpPwSVodBfDDyTOJ6vsgrO@lists.infradead.org
X-Gm-Message-State: AOJu0YyN16ftWeCoAbxEJUWNaXbUDAbYtAZsi+60aAkj5lbD+lTUJdRQ
	qsqTouCrfbs7xj37Ij6N1U7/xWKkzztvn6ZAIPdOuUhwMEojPrmNH63N
X-Gm-Gg: ATEYQzxV7UbHBeVUlRLQ+A+jCiKDA4QCpdps7p9QB+Ncq1KMA8qIxLqfuwpOrySR3XX
	K/e94SFYd+XdrseSIr2DUd/hlwKdydDw09gVT+53N9KJn+0wBT/saDUqjEj81siyZLFZqSz2vhv
	yWi2ipnNCOE2ZZ5BZDwf9m35igPAMPA9Gm47JUt2Rs7mwpJ7RORYAZ6JOLW6WNF3WfwELGvj5S9
	wSfwuCDZEZyZy+zTl9PJzBwJRwbG6ggEoEF15YihGwIvgoo3plJ+lyMDKwNZS99aA9QkRZdBLiG
	kTKugsApK/xzyfYEh44JjcqGtYedfOW0zgEVWPMaoeAk313v4Wu0ya0ZWi8+mKXoJ600qxFGrUs
	9s1JOtXmDEhpoqFcspzHspGDcex+PYmuJV0pju3EHDsECpLq56TkC0OTFfC/oEhjcQNG7UODR6x
	+AEyZiS6srDpKrV3zTQZCHBT5qVDg=
X-Received: by 2002:ac8:5991:0:b0:501:44a7:ad50 with SMTP id d75a77b69052e-507528d2800mr117305101cf.26.1772376614382;
        Sun, 01 Mar 2026 06:50:14 -0800 (PST)
Received: from new-nest ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c73a25e4sm84714256d6.50.2026.03.01.06.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 06:50:13 -0800 (PST)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH] bus: sunxi-rsb: Always check register address validity
Date: Sun,  1 Mar 2026 17:49:39 +0300
Message-ID: <20260301144939.1832806-1-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_065016_457055_FCB121CC 
X-CRM114-Status: GOOD (  11.05  )
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

From: Samuel Holland <samuel@sholland.org>

The register address was already validated for read operations in
regmap_sunxi_rsb_reg_read before being truncated to a u8. Write operations
have the same set of possible addresses, and the address is being truncated
from u32 to u8 here as well, so the same check is needed.

Signed-off-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
---
 drivers/bus/sunxi-rsb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
index b4f2c64ac1810..daf0ea563e477 100644
--- a/drivers/bus/sunxi-rsb.c
+++ b/drivers/bus/sunxi-rsb.c
@@ -445,6 +445,9 @@ static int regmap_sunxi_rsb_reg_write(void *context, unsigned int reg,
 	struct sunxi_rsb_ctx *ctx = context;
 	struct sunxi_rsb_device *rdev = ctx->rdev;
 
+	if (reg > 0xff)
+		return -EINVAL;
+
 	return sunxi_rsb_write(rdev->rsb, rdev->rtaddr, reg, &val, ctx->size);
 }
 
-- 
2.51.0


