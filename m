Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC81DCA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 12:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/EixXrQYznjJW/63oKtisPH5UyKT6tWjQS1Ri3VBxh8=; b=q7+OukIm0hn9BJ4J39sfqrMdXp
	wfAfqJQUSCeGoqMlZ9lXN2vdCpVEcg+fH1Up78z8pGxKYkcofWZiR+FWkM8QVwq561ZMy38sJBRpE
	caXKBuYFz4b5+BDSlW7AnryBfBuL/ob1VSk+hzMdx+KwfbxIGpXs+V5P2gpFcPdaxl89OPQuTsg8s
	CLRw7HXQKZr/UzHIeO4e0F6+sLbnAfvU5/t2NHPLbg40X1YbLvKBhBvDWfoQd4zv6WD0iFUwsXjAo
	UX+NAfa77TWfGdioErqSoIFGowNk/lvTqKRkQCpuJun0U9kQlRm7D+uncs3Yb299Fe/3XuI61eYU2
	YUrx2YSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQyL-00000002UmP-1hIt;
	Fri, 22 Aug 2025 12:34:21 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIoY-00000001Rm7-0i3d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 03:51:43 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-76e2eb3726cso1258665b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 20:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755834701; x=1756439501; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/EixXrQYznjJW/63oKtisPH5UyKT6tWjQS1Ri3VBxh8=;
        b=hxK9SChd+8UuxVHeZ91a3ZdTx6TKc46p0Cc/KZw+7iBzRyYH/Of9wqhdCL5WZPbmk2
         hoRLUcbMejytVWRUpMEN/HH905cZP8xWo5pg34QlaEHMiWhxjmFxkILLyqpfVyLVouX9
         0ol7IEfCCIMIL+7WClWinT4Dqk8kuEO7NaEDclw596/xi0Thrh8RoiVGsfRidvwB5rA7
         GlLwknl2kMla76wBrHQzfG4UolV1wpEIGTAxhnAqIAQ0cxbNRZVjInPEwdT3lj1/nrom
         wU4oOv5qnndRS7spZ6j+RSwMiaZBQ8dscW5rzpmyTyB4Z/mPZL2S/IdqSK1UB86DnP2a
         jdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755834701; x=1756439501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/EixXrQYznjJW/63oKtisPH5UyKT6tWjQS1Ri3VBxh8=;
        b=PHIuo5+Xun7ZdljBbu0l/yXCp3MGXnfkU0T+Jf1G1Os2VCyO8vKfWjKDFBQ7izvxxy
         yVZPQyDSZqjJa0tzNWKbDavpX24IFDXzBzsItSwn6U9/ocSrMTdv3Rdkkj/rFaBajs2E
         DuCqpV6jZD4AWLNPiMDEL91+C+AE3gfoJesSznKRIOHsHCq4oCUvjvLoMWOcnMaagf74
         VRpDX9LPmP3Qjk98pnTcGPmuZHg+kf/zGx4T2Pl56XdskvMgIsF/iWjoUVz4FxT446IG
         XJRbc76YtyPZuBLp+r3w/bLobv1dITMhblTfr/NbjzB9+EZtbeYUeDyioK5oLQGc46s5
         Tvcg==
X-Forwarded-Encrypted: i=1; AJvYcCXuvk59U/ivoVQBz/W5sXD7nx1RLV4SvyvrZUxH5qC2UfmPGubqFZ5qXSSI6Nt9OFBKov+lIpxGenQuKDWNc130@lists.infradead.org
X-Gm-Message-State: AOJu0YwQP02wT+fcBQtLQggx1T8ft7F7zdvuUlVCAKhCYeIx4A6vUJPt
	AS+MDjMAeRitbt390xwWmoAT3/w6jYX/NPy0d9XyuUPgOImH0eM45iuD
X-Gm-Gg: ASbGncuyIcr3gw2KWYBoExGI6F380AM09aq7sbkVEH3EJmYvV/y0laL1M3SCT0TSB3m
	fumjPUBR++ctmmytdj37Lo8ky2Sp0TN0wrvq2o8yVXIxohRAjwtQ+Q3+DLXmzMtCvgjHzp8LrvA
	vnpPu73OfPliGb3RPGBzISqhItmOOkGCGp8WvbhDcH6Ay+DEa9fD41c289Q3N71tkQJnr5nlSIy
	Smst1kU9JH6poRyTiLUnqQuidaBh/FXFfplxR6981OqUvCBmDo9AnPdaNLR2gnDJ3NSEtmyF0Ok
	jYJqf7ThUVDBwzgpTXXKGtPs+p36PI5yeFox4LFqfjXMWfwtBLSAI6eXEYPeU+2DeZf0jDmThI5
	wgM9yE0ZOYAcBbCvBh4zwTkLJ6IhL
X-Google-Smtp-Source: AGHT+IGmG2iHm+kPtdB8VyZNf1Keeivo0b/Ddo4YxYKdTXfFyokHg1nQnJSsPhPXXQhViC7G78ZoCQ==
X-Received: by 2002:a05:6a00:2288:b0:770:3064:78fa with SMTP id d2e1a72fcca58-77030647984mr1909008b3a.2.1755834701233;
        Thu, 21 Aug 2025 20:51:41 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:51:40 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:56 +0530
Subject: [PATCH 08/10] iio: pressure: Drop unnecessary -ENOMEM messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-enomam_logs-v1-8-db87f2974552@gmail.com>
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
In-Reply-To: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Haibo Chen <haibo.chen@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andreas Klinger <ak@it-klinger.de>, Crt Mori <cmo@melexis.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 Dixit Parmar <dixitparmar19@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=834;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=9sYG9bHos7xB9NTLNoGx74dL9X517YjRrTR6gyjXoAQ=;
 b=NI1M2YGG1OwJpwbLAJnJ6Qnit+GivyUJswFcnSjAyT2MnVw5sTWxxCLJoS3GZsCiajAbZFUyc
 84hThunItQmAHPZ5dwKUdMNC8vDzpzBO3EbM2n4xQrC+R98ypIPo+hY
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_205142_219951_1BCAB187 
X-CRM114-Status: GOOD (  12.16  )
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

The drivers do not require their own error messages for error
-ENOMEM, memory allocation failures. So remove the dev_err
messages from the probe().

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
 drivers/iio/pressure/dlhl60d.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/pressure/dlhl60d.c b/drivers/iio/pressure/dlhl60d.c
index 48afe5c94000..c5f4f5efaef8 100644
--- a/drivers/iio/pressure/dlhl60d.c
+++ b/drivers/iio/pressure/dlhl60d.c
@@ -294,10 +294,8 @@ static int dlh_probe(struct i2c_client *client)
 	}
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*st));
-	if (!indio_dev) {
-		dev_err(&client->dev, "failed to allocate iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	i2c_set_clientdata(client, indio_dev);
 

-- 
2.43.0


