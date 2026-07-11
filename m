Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730CAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 11:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJ53oWqRjCNjVlROCxKHTEOJ8pLHHBllpxRR0nGEHyI=; b=NYFjW5URkYMiTSy/SfPm4UsqZl
	2e4jS33KLkmvs752lMr7++awI0mRYIiblWHyQ2FIj15FGX6unTd7kSn7CT6f+y1wuBLC68lE9x5VT
	uwCx8UrYtTBzkFs4hqxSr4v51ZOJt7uu1xzCZLJ7jT/IJF1wHV5R6S71ZTndn2Z9g58ahQfuLMKAs
	dkn3tkce/XRbpXmatKGoLBAJ2SRoIVN28XTbRybvgFnWWvLVcBu1S1WRv2SmpKJQ7RUvVPZvgOrAs
	MVsKAewiFei2uzuz1G5q4RJJtga1P5qJCjWVBwWbTMXHxF2GIVjSWVzQtmBv5ZNe23lrTdVqYpvdE
	0uYQLzjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiWDd-00000006VP6-1drd;
	Sat, 11 Jul 2026 11:50:05 +0000
Received: from mail-pj1-f51.google.com ([209.85.216.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiWDZ-00000006VNL-3j0D
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 11:50:02 +0000
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37ff8e0ad0fso2136130a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 04:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783770601; x=1784375401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kJ53oWqRjCNjVlROCxKHTEOJ8pLHHBllpxRR0nGEHyI=;
        b=Ijc+cbC7zM0vTLuGUyHZuVSaimGn+KXqFlQ1g150JsS0Tu/YdPFWiMKl4T8C7m6JFX
         gcXNOqfwVoPHcF86nLgCJ32onLx84HiFt81eJnpDeD0+Go9eFdPb2oZjjSuEz3TK5bVX
         0oD2pRguAd+EhGQ6ABzmgqRlkF62jOX2zr5dFoC62joTwTqBY1LcMKxBIIpgrYkhoNE2
         nM/FfRxJNi1vP2e/x3JxXs5eFpMVV5D0EKFJVhG/FoKU89mJ3eugRWQ8XEMDP0AEIddz
         S+ILQbqnl+H4YOCqw/mUMlRkKgekdXsRRKBTIO1oArRK+/fVEv1VccXWib6GToUVkl6v
         i6IA==
X-Forwarded-Encrypted: i=1; AHgh+RrlpSnRX+8o+EqX4N8CXjtIZ0mvmZDN89+U5W1aF63aSTLyvGFsoWamgai50zGy3JwseDIbzhOjPt6vqzAND0Ta@lists.infradead.org
X-Gm-Message-State: AOJu0YyC6fW0oIk/qAVTX3fONbynItQFnN5gKSbjQmiLWjaOhEyovzKp
	sLNlmqPAstnZd1nzUXPwlG5x70UVX0yjsICLtttpUJB9LVFG0ECon38=
X-Gm-Gg: AfdE7ckvklSZx/DqOVkE0L5ADL8mm3vpK++Ai74PoGBhQxCd3llxiO3nT07PqSoC/Xk
	xFuPcaowHYstsIzmsbFJ3pOn93jB12zm5x/sCzZ4ipZE80+cBIVWRfwpY4+8gXF2y5Nb1qO3+AT
	ANtcd5YYRQp2pDvk/hRWIUMjUHPLQxMbysjqX+z+qp/19T9CNcU5Q1ie1tBz5pxazDv7LMFSay2
	cjpwMff8wGtvL4AFVMMPpwx+Muf0sAxi/V7pv7Bqob4FTAB/nBQo72IzB6BrNUGT2XdMpOVJNRe
	SMy/CQaBwBK7qA9LEU9S/KWZZueuJIUDybBRW//fu+GMeT8g7qnk6dxE6dkTLAjDbJujUFWNPqq
	IKur+/rzrTtmR5jFMrXry5VpohtIpEdc4q86R9pYq/s0mSpyugrkFEJE1JvGgFkqTYNDzMFk6VA
	3Ev5niV9U1swM5qzRLfg0Jaz0PmTKUoFD+O4PJ8ZQ6DCxlp1OixT/M7TyYwg/CtrcL3ABNXiDyP
	4kzommOexo74O8fX9JHk+vrWw==
X-Received: by 2002:a17:90b:5344:b0:381:1b66:4734 with SMTP id 98e67ed59e1d1-38dc75d0b31mr2658787a91.6.1783770601104;
        Sat, 11 Jul 2026 04:50:01 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-52-13.dynamic-ip.hinet.net. [61.228.52.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5506b48bsm3957570a91.1.2026.07.11.04.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 04:50:00 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Shih-Yuan Lee <fourdollars@debian.org>,
	linux-input@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/3] Input: applespi - cancel pending work on driver remove
Date: Sat, 11 Jul 2026 19:49:35 +0800
Message-Id: <20260711114937.16670-2-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260711114937.16670-1-fourdollars@debian.org>
References: <20260711055247.5412-1-fourdollars@debian.org>
 <20260711114937.16670-1-fourdollars@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_045001_928883_41BE70A4 
X-CRM114-Status: GOOD (  11.76  )
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

During driver removal in applespi_remove(), the managed private data
structure is freed by devres. However, the driver does not cancel the
asynchronous work applespi->work, which registers the touchpad input
device.

This creates a use-after-free (UAF) vulnerability if a pending or
running worker thread attempts to access the private data after the
remove function returns.

Fix this by explicitly calling cancel_work_sync(&applespi->work) in
applespi_remove() before cleanups.

Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>
---
 drivers/input/keyboard/applespi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
index b5ff71cd5a70..3bdb9e7cfb8b 100644
--- a/drivers/input/keyboard/applespi.c
+++ b/drivers/input/keyboard/applespi.c
@@ -1822,6 +1822,8 @@ static void applespi_remove(struct spi_device *spi)
 
 	applespi_drain_reads(applespi);
 
+	cancel_work_sync(&applespi->work);
+
 	debugfs_remove_recursive(applespi->debugfs_root);
 }
 
-- 
2.39.5


