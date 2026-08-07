Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB1FC5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 10:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4E+mVEpkDh0k8bNZJNbHh0uHQtIkBEm4hCBHMggYxlM=; b=Md5ha6BLbDhyqBUxGUOj5vKakJ
	rMYMouVoywag7BT6DHYFUwrYiWeRlkxG2XsgKqpq+cCgud/I9TLPwSkOuB6ActcMp9ZGWTjCXwPyu
	51TPiEgU78PU/e4IWP8eV/jDMARQVadArqpo5jOCgT1y0IwE7zUediAkJ/87FBpubcYVq0HOur1ao
	r3b5EndMO9RvVpkCQeTS1jeNpuvcvJh1rql8ZQISHBIJbKSYrMuUvKKN6D+rQFyR8D2DSCoTuIYJs
	5b9c7VkdlIGFkTpenfX+9HzaJOHAEkrZcEkoyc3ExIJ/UMRwIeeiKOadu+VIMZcqdiT1iyc1iNWQr
	B1uM5xPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHpv-00000007fvf-1ImI;
	Fri, 07 Aug 2026 10:29:59 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHpt-00000007ftk-0kTo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 10:29:58 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cab973140bso44488475ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 03:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786098596; x=1786703396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4E+mVEpkDh0k8bNZJNbHh0uHQtIkBEm4hCBHMggYxlM=;
        b=Rq6xeFOQ5PwmfHDPSOfdEArr1R3vfL8nt60n7X31dxQ+b7ua907ZO/x+mFBA03x0Ky
         iY+RFjucZI13mLKSgJ3DzKLF6XwnBL5pS3/Qp8IyqqwO5NXTar8q5WYHPA+PN8MCVaP3
         mR8afD6J008K+c/ok+I4YeA4WO+sQXHM8aJKvhWlN5bK8slRRlrEx1S4cwocEP2+tJWO
         FoRHVMuNwFK1u2EGiK/20VT+cMHQKmwnBsXiuOjIEo7j4CJBy6qjNw2NAh1UMt29pNFn
         3Zq3jRYMgD84WmRWQJop15L2gVqCT86TcQKEDxhFh6RwWJzmf/6+1IAURRDeLHrTFKaB
         M7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786098596; x=1786703396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4E+mVEpkDh0k8bNZJNbHh0uHQtIkBEm4hCBHMggYxlM=;
        b=MsN9okhM3Yw7hPao4aaxQKat58JpASQix4IzOdnvSRgUPfKDup0wAd3YkZMQY0zVnF
         gdtzzJ5063+xuWVvuiZDWw3kWr2mTuIoHNYn5iURxOB/e8lhgpXiSXGjV81xGB68elp2
         E3dn427UnnJtJ1ZzAXmXHxscLtKvq3S9BGSSe0uG5Q3eEX4HcRMidZHdGnBLBTkMqLtN
         RBm1tvN7dKPQbQP3FlZOmZ0ZAlm72p++E4eRCjAypcVVxfBvlXIHt24wZZD5ZgMcfW8E
         FpTrNKTSspqAWx0bid0bFPZEWxM8smYYxBf+L8x6ARMTA/wuUaQ1E/01ic0/u2rEKniw
         8mtA==
X-Forwarded-Encrypted: i=1; AHgh+RqMMG36rO0YV8wvytRwAeMaHtoy9/1mQHlJ+ZhNlJTIctoHpgv1ISsR4nYJRxLGwfeyup7iDgh3l9XV9/Y5dzMg@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+GKtfUhNMzijvSibsbn9CeBX+F6eijQjaHmIxjwZc2213AuFz
	FxSlPK0d/ADJUhfKjG6KEb/rJ6qjhDXgRkE3vBX21aLpOlNqBSLd4+y2
X-Gm-Gg: AR+sD12VfNv6S1PNJcWMmJnKx3Le0LQKGuwLKMiqjUcAupTxpSbQGq8tinsiGOhH5Yi
	vqZG06DlNWXIf5/qgJ4cL0JV9xjJK654kwoKZD9l+6RpbHZMr85EhB5zCMLuRLwMgKW1wQH6bRV
	X4tdlpetbTazQHTGURf2CrmDntokiyK/9IwKiP/grGEGsqe9FPZcPH5GMixx119a8iPvB0SpUc7
	Tj4z8dTF130IoD7SBavok9NnwaL0E6hztD0w///C8y32jJ+aNSPz9ev17V7R2c/UAp+fQ/VlzIQ
	rB/UXBwL4vgPgffnxt11v9//994BiAfqovpG2wMm+CLYQMCVE4N6yGeN6rUsZBzM2/8sLkbds/F
	Os/STefdhDwTLOAvkFom9Y5tH6FeE7fegU9AQRt7tjWYgPbW9dJH5Xdzgp4d8mqKZ4x2KOxdvA9
	2iRx4m2pr63dEHadifxj3TGwOAdXUfe4D4kgestNGI+wzjIFrDe9oKa/GgjrVrTZHvMgQduF0Pb
	M//mA0UFLDzXR/m3UFHhTuCoYrzmAUKiXGfULSQr8vjOWZHWD/pX06zAdN5hR4bbnEwFEbx9Yln
	9WcV
X-Received: by 2002:a17:90b:57c3:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-3903c5589e0mr24025142a91.1.1786098596171;
        Fri, 07 Aug 2026 03:29:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b1389e1fsm1133614a91.0.2026.08.07.03.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 03:29:55 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] spi: mtk-nor: Propagate errors from IRQ request
Date: Fri,  7 Aug 2026 17:29:31 +0700
Message-ID: <20260807102932.45785-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807102932.45785-1-phucduc.bui@gmail.com>
References: <20260807102932.45785-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_032957_217529_A136B2D8 
X-CRM114-Status: GOOD (  12.37  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Treat a failure from devm_request_irq() as a probe error instead of
continuing without an IRQ after only reporting a warning.

Return the error through the existing error path to ensure the driver
does not continue with an unsuccessfully requested IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/spi/spi-mtk-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 6b9a5d728549..c1e15246120f 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -905,6 +905,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 				       pdev->name, sp);
 		if (ret < 0) {
 			dev_warn(sp->dev, "failed to request IRQ.");
+			goto err_disable_clk;
 		} else {
 			init_completion(&sp->op_done);
 			sp->has_irq = true;
-- 
2.43.0


