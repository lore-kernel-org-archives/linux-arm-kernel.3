Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300E1C88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 08:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U/TcAfpNy9eIzFLTbXKaYNl6G8XOWTQ5TXRvEfw5GE4=; b=ugGz0rnb8hEKN5n2lU9NNxsrie
	oGalL8/vvoDdI7mIMAu5NgiIGg8o+dCX32JtyxgA6QeAx5eS/clSCCqprP6ZEJm/AGn7ecWCCOOMU
	hHV+osn6u7Q+XtwJ75I/Yf4ePMgoxx8T3CgpxlGQPxf1Uv94SUh++RUia0EZscAFVdNppQCdOuOWd
	uhnLx+rsAnXLqfqg9JPXKFxGDckhMh0UcTpcXQa5MeVJxcSGVE7PBqz3ph5e1Z+d/Vr3VTWUT0ay4
	aPW4RYWKoEvERb2xQWp6LiZTcBr+zhLwUn2n/+XzKgBK80gj8jeucrC5jWvFFGEsKioatAaJAEUWG
	8YWqgx7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wyO-0000000GBGH-2Ew4;
	Fri, 11 Sep 2026 08:51:04 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wyL-0000000GBFl-3yYl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 08:51:03 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2caced6038eso7366605ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 01:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789116661; x=1789721461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U/TcAfpNy9eIzFLTbXKaYNl6G8XOWTQ5TXRvEfw5GE4=;
        b=K8naL7hKn5/ZL23vKoQ7PbkGY+P8vY4cSF2aj0yZuSvy5x0VeU21B1zWiv9UmzU52X
         l7igpmNM3UMJB2mNUmCWxoTbdt8e9ThgBMEgs7UJcAWzhnH5C/XRo763he87ZImGmK+x
         6+Gk8faSJkxaSd+y8lADJe9Xxww3V6k58otUwd5GNVl1Y55tI0y+aoLmBlk6rwUY1gnn
         hrDRXLqO2yAk4HNi9AQyi7w8ZvvMptE8N6QuA/OoqrDsFs1BhwB8brUUV/EQUelZHBER
         IvVUiEwBbCy36y+EVN4DfuG+j5n2LKKvkCz6xJxIzXMfPqSJWqdTeIcQj9zH5UaJo3+l
         z4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789116661; x=1789721461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U/TcAfpNy9eIzFLTbXKaYNl6G8XOWTQ5TXRvEfw5GE4=;
        b=IW5nBzwVD5kvDzyGmqzw5q3tJrBYJKUYJoWTliGI2OSA0mRnQEu8g3Arr06kzp4j04
         f0U0QRAqzHx21cFkqRwpNL3GPueJ6W9sCUlJJerSxJasgX6a2Ch8dvEvncIHfEKcP+C0
         m0m5Y1+IjDHq3rctt0GTzNQ6mzg+r3xyvIexeq2Dg6tTUmevy060pPPGnuqnSVpWrvUB
         631vY37nysEdFjn9ydVidIfIuXNzsc/xAibVrrBLZWlh/gaBvl0jiJdfmEg5VEJ5KHx7
         VdhFLCpIR9aVmJFISMCtdUzUmDNRcTxW3hmJYxl9N2pIet3xsdjlflzKLloqqOgMJny6
         OH6w==
X-Forwarded-Encrypted: i=1; AKwUvBznRJKi7KXnbmtuWCdp8imNNKDa/USH1vH4HtuqfPBtHZm5lW20hNkngblfF/SDtqjo1IYrlCnF6IbD7HZZw6WR@lists.infradead.org
X-Gm-Message-State: AFuF++m3HpdQ2ulbSVmNiMaC3a8qRFbN2rb45ZhXe1oK8HG6s8aCFIm/
	IDu6H9efUFKUiinnRaxTfBsrGjR59S4t/pEB8DIK4w2MJKBk2tJ5qfcWup/YLw==
X-Gm-Gg: AYBFou0ld+fOp/vYKZ/eWM1RtFugBJ31Q9FdjVStKT3axgobvyR9FUX3mrMBIGI/Jrs
	0CKiPLVs1mCCLHM4uJ4HXfR1Sgne1d2lusUAxjFmrj5jHvpCeH9gZPAOuymI8UtKlwdX1455DzJ
	DOWLKX4/oC7MftQVEa1hoMTimpClfCp4IaK+/8Gq3nifVyQpasa6SVpdf/c6eTu4WqVHhhToeIb
	8uuTaXMmbOkL/Ym/PmgLZ4x3Pm5Ix2WyJzNqW1f8SepIsTwL2IQAum5sLCZ4AfhcM4JfwM5cCvE
	L/V2rW90k89pbnR0MN331kiLijb73FnQqkYxaB6qj2A0xaiHI6ZN71v475ARbdSeKKW4L2PzERF
	YZmt0ualWb/36jBWPadIdc/sYlzj9JGNjC2hU/p31qp2ODFPpS+qyorODeQ8lsQwH64+voM9EVK
	iY8z39Ull5YDEASk9fLEyEZyNYRGugkGRn4+udtMSGdlsxU4T8usks81GpEN6eobp6A6/KEwZ/l
	ZTdB5Z/d2XroRKTQko97QxzuHM=
X-Received: by 2002:a17:903:4405:b0:2d6:fddf:a890 with SMTP id d9443c01a7336-2dd0e9e5fd9mr93067975ad.6.1789116660866;
        Fri, 11 Sep 2026 01:51:00 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e95075sm4715294eec.11.2026.09.11.01.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:51:00 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: Udit Kumar <u-kumar1@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] soc: ti: knav_qmss: Fix typos in comments
Date: Fri, 11 Sep 2026 14:20:55 +0530
Message-ID: <20260911085055.715191-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_015101_994885_768321DF 
X-CRM114-Status: GOOD (  15.29  )
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

Correct "specifes" to "specifies" in the knav_queue_open() kernel-doc and
"accomodate" to "accommodate" in knav_pool_create().  No code changes.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
v3:
 - name the driver as knav_qmss in the subject rather than
   knav_qmss_queue, which is what the recent commits to this file use
   (Udit Kumar)
 - dropped the Assisted-by trailer naming the model

The diff is unchanged from v2.

v2: https://lore.kernel.org/all/20260910044551.50308-1-hemanth.selam@gmail.com/
v1: https://lore.kernel.org/all/20260907062247.9994-1-hemanth.selam@gmail.com/

 drivers/soc/ti/knav_qmss_queue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index 3e4041454f69..6186454dff51 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -509,7 +509,7 @@ static int knav_queue_flush(struct knav_queue *qh)
 /**
  * knav_queue_open()	- open a hardware queue
  * @name:		- name to give the queue handle
- * @id:			- desired queue number if any or specifes the type
+ * @id:			- desired queue number if any or specifies the type
  *			  of queue
  * @flags:		- the following flags are applicable to queues:
  *	KNAV_QUEUE_SHARED - allow the queue to be shared. Queues are
@@ -805,7 +805,7 @@ void *knav_pool_create(const char *name,
 	}
 
 	/* Region maintains a sorted (by region offset) list of pools
-	 * use the first free slot which is large enough to accomodate
+	 * use the first free slot which is large enough to accommodate
 	 * the request
 	 */
 	last_offset = 0;
-- 
2.48.1


