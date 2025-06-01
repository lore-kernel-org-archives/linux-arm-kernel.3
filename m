Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E90AC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Jun 2025 22:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kWWXJ7FZ3GSQ1AVSLuDSr03mU7wdwc2Hu2NuHuHCJ0=; b=v3aV3XbNORMrfcm4/ZPYEFVvhs
	fW4M/7T59iHFF66EogOnVP32mhjfMY3ClOI7B8H9vX+YnziEosRB/3tbtH2QgZNK3PeIErGZBris3
	PGvfrc2VCzshlkEaHgNYjztRWx2wvy/HkNNYUhk7dO0OIAAOH/UGwqLgfMcChKTJy9+FqheZ9vSHV
	9bjXmTD3t/XHSoMEjPY4gKTFNT3Q23sb+jw/qTcLvc0nwpLHnmQqU6zMU98Gv7XgAjzVIzKW+FbBX
	fRoNRqf/MOtzS6JqhIwKukJ3TsGX76XNstufq1JXVDLra1JkRr3RQVImBKqULhp28xyZiR+cEumGb
	GkOUUdzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLrUW-00000006240-25G7;
	Sun, 01 Jun 2025 22:49:20 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLrON-000000060ju-45HE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Jun 2025 22:43:01 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45024721cbdso29507515e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Jun 2025 15:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748817779; x=1749422579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4kWWXJ7FZ3GSQ1AVSLuDSr03mU7wdwc2Hu2NuHuHCJ0=;
        b=UUVNIz99hlNweM68kWagSr3IjGbx0EM4RIuI3cWj8ngmTOmgAeBvr9Mm45fGqAf92s
         /wg9hHuNfS2kBPwdcz8hFGWegJZMUt+7rN8gHLI/WaYfL6i0puJ5wcfNSF2iIwa+r/Xx
         BtI8GdWI9618ksx3NJW4tZ3fxFzZkWdhqlV92wxU46eV+vmkHK6ljXjnE5rWLYxInFuX
         k7gIfnSiliLkeOZCFrmZ+6qi8rkp3QNTDEumtizwJYIuw4PExbo9krLbquXWetc0SHjq
         pofMoEoO7dycBfmOphFAdqM007H6lcqBsmna7GV373vegwIkUmpomeaZGR8NFgpWLAtP
         5bXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748817779; x=1749422579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4kWWXJ7FZ3GSQ1AVSLuDSr03mU7wdwc2Hu2NuHuHCJ0=;
        b=RHBvzhqU8PIe6p1g1y9whP7ye+q8iK/Y5j4NgfvVyUymSq3d5hgMvpqZNIAWUFfwj6
         sxilXaSUvU6T704oDEqmSFuzXxOA3RPYLyMjx97LhNVlqk+h4FyYnTfkAA9SsnZVRttF
         zVHZS1/9XkGFU4tCQRrJRlg4p+2EeIYj9v7CsdgzxEVUWVUcvNYZParYtR4Tx31rdO5F
         HCcrq6ycTvGK7RotlJoJ/RC2Qutq20JBvRQkhkmjBBsvB3aHgCIx1Djuu8BsacfOM7vx
         fFvy+00S983EaSxDYybmLhoDGOHcyyNzOqS6gxnAd222BhHMnj+u+zljMJAkAUtQpBmv
         4pUg==
X-Forwarded-Encrypted: i=1; AJvYcCWylncqA+NZDXUwcldafYim3GfkzIDWmeFgfSnOaXkXne2wnJLZMXwPiISZBgZWDz/IAxXDYk9otYAFKavz6q6p@lists.infradead.org
X-Gm-Message-State: AOJu0YxB5bx7ZVCqEH5m0ZFvUdHaxi0oMMCOBqtjwoVB0yySMPQPA47i
	voXpZfV7OtqTM9BUFFTlSsbPf5mLo74CR0eMx7GbhJH8NdJ4BCK9ibS9
X-Gm-Gg: ASbGnctA8CgJs5jzfvNduEbieSr7mWoj43MRk4K8vGSOLhKl6GiUEwgTh7YZmWmk79w
	QZhFtH6YKfrznAa8MRDrjG9fYz3XFihKEVZ5PimVzRPPsnDh4Q4rzJZzJPgMLRkjSB4yG86Lx7M
	J4J1lB67GWqFjsXHcnzT2Mr8ofdxWBpvqcFjqK4LuCtZgEKxcojh+GfbHbYYVMuW/rweL1CInyD
	JQYpK6ToQtXGlEtXLE9Rq/rKt8cYQjB7qTLjIDaAAkT+h+d+n6Q7UqsNiXn533CnjvffrzcgH4s
	Hfuxx9J2ZWa9R7IZEOSfCmbzuE0QyI3IPNGl06cUc59Rh6o8/4zYJJRn2Tv3P1k=
X-Google-Smtp-Source: AGHT+IFVzpxyXLCtBRbAQTyeYAjleNHnDwVMGvtUL11IWaYeITMphSowW190mBTSVIH8CGVCZ/soCg==
X-Received: by 2002:a05:6000:220b:b0:3a4:d53d:be23 with SMTP id ffacd0b85a97d-3a4f7a816edmr8112878f8f.30.1748817778595;
        Sun, 01 Jun 2025 15:42:58 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:4518:757b:6751:290f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74165sm12916554f8f.53.2025.06.01.15.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 15:42:57 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: Sinan Kaya <okaya@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Qasim Ijaz <qasdev00@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] dmaengine: qcom_hidma: fix handoff FIFO memory leak on driver removal
Date: Sun,  1 Jun 2025 23:42:31 +0100
Message-Id: <20250601224231.24317-3-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601224231.24317-1-qasdev00@gmail.com>
References: <20250601224231.24317-1-qasdev00@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_154300_009938_568A3AB1 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

hidma_ll_init() allocates a handoff FIFO, but the matching 
hidma_ll_uninit() function (which is invoked in remove()) 
never releases it, leaking memory.

To fix this call kfifo_free in hidma_ll_uninit().

Fixes: d1615ca2e085 ("dmaengine: qcom_hidma: implement lower level hardware interface")
Cc: stable@vger.kernel.org
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>

---
 drivers/dma/qcom/hidma_ll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/qcom/hidma_ll.c b/drivers/dma/qcom/hidma_ll.c
index fee448499777..0c2bae46746c 100644
--- a/drivers/dma/qcom/hidma_ll.c
+++ b/drivers/dma/qcom/hidma_ll.c
@@ -816,6 +816,7 @@ int hidma_ll_uninit(struct hidma_lldev *lldev)
 
 	required_bytes = sizeof(struct hidma_tre) * lldev->nr_tres;
 	tasklet_kill(&lldev->task);
+	kfifo_free(&lldev->handoff_fifo);
 	memset(lldev->trepool, 0, required_bytes);
 	lldev->trepool = NULL;
 	atomic_set(&lldev->pending_tre_count, 0);
-- 
2.39.5


