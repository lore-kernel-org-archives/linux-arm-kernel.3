Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9566C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 13:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/UEtL/9X5WUxOZobblyxpCLeFiHwHXNogLMCYC6gE4I=; b=nF910DIX4Y++b3xvJuzqxuytKi
	iiKi5KjnrLIDrv+bko0j7w5EZgn4q7IGC908X1auxl+I4HB+JWvrJX4oN9Zre5Cu7v6k4QXYO+yan
	rQclotB9V5JuYJTBbj4JuwTG2taVgtTBPCkl22qeZMJPBI6VrRooTU0OpENZyFcmPY7Ky4rbbsBc5
	Wh7l8uqCHq+usX0v6ciVKrjxbeOaA1H7nYVYfCnHEcPIVksgBQcZc6N8yxtyhAvoPcVU1Sv5Xe/9i
	qLbxxD8MCv3vZtArMC1I7e0AfyScCw26QrRV+m8FKpOmYQ3SysAd36BLsIdVprGh4cxdxKlICR9G3
	xeVEpSAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxro-00000006CgI-2zYX;
	Wed, 02 Apr 2025 13:10:52 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxq4-00000006CYV-2GrC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 13:09:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso44189135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 06:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743599343; x=1744204143; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/UEtL/9X5WUxOZobblyxpCLeFiHwHXNogLMCYC6gE4I=;
        b=eDBFi4Ej862zErmR3bkOwj2ciy+mJIgyvkl1UhXPxpPkbnrK4ubj6kUNTKtmh2SQPD
         8T8UJVMkDkDM244LLLAUR+MMVjm28Pjtmo1fsn6IYVqtsqvGD/MlyYIbVK+xuGLYzmf1
         3C2jzXwKKSLPnFlDNW/+izha/6zAHmXj+KozY28Y2ED97hH0vpYE/2MmEHw/ll9fKfun
         qKJj8XrtqKvA1S5R1OmYga1VGfDFK61wQzOES/m/w5cXUYnmlPqtl5lbP1GY5gzgDbiW
         luYo9nMhxPLnPFyispIZKnGLwmSiKWoTurzRhzhOVML6gVGO9PkXry+wlLYGgFjpTPHj
         tu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743599343; x=1744204143;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/UEtL/9X5WUxOZobblyxpCLeFiHwHXNogLMCYC6gE4I=;
        b=Oy+xBjGaKDCNK4lgkXw9IMMMt515xaxMzIntoOW3GizhEGYyKxZCMA8/2XWFnajN2h
         YzFgUYDJ5bLaRAjGWmWgFFh8j18waelx9d25U4GoRYjeM81E6Ab5rjw/UfgLr7MuRqQJ
         Rf7T8HzSiiJ8GvBl3Bh5NVbhvqvF9KYFVmrn6ZKKhi44Ift2GlcJrZ2i+xGjo8wZNttE
         L/EYDDEXzcRJxEldL1Ae6UoCPjUNPQJKwyQhNVkj3sBZtJz489uI2JbtHTm+ED4yC42L
         ewZD+15cACT4cW9FkKJN0VwnD63rgbNwhYdk7a9AIZAoErFhg0thkQhtEvjuNmZVNwwV
         TP8g==
X-Forwarded-Encrypted: i=1; AJvYcCUoX0O5XKJZS8CNCtqi2kx5AO+DT0HaPb6pEYl7HZaROlnBlElzLNUGrO5cZ7CSqMDxb2iLO+88VmaLLy/vhZwd@lists.infradead.org
X-Gm-Message-State: AOJu0YxP1FRmatj9edQBXQi3H3LLd/+HMev04ckoXWqyvNhGSqT1ht4E
	A+ITi1Ovxc9ICrUKsGh8xW4Ka/iDR996s7u2PguFCiE/C1vKIjhAFp7nUWhcdXY=
X-Gm-Gg: ASbGncv/fN19GZINfs1dcSk5txYJfZTWfUWuZYiXz7Gf6954nVnt/XS2y09ebDBjWqE
	jQN/N3nVPnOG+9gxCeEt3+oj+Ao4GH5NGdvfYKzXfpWxjq8tjbhIXLtdFz59OyCtgyEqu8fT0DN
	DEXnH5vXuS6szfNCIAHqMf6SkmXxahUVKitZA9bFqceByjtYb12IcbsM3wTyZJsLY0dOgXUoSjY
	YLDtACadwitV44UlPH0S3cLG4NVhWgNpwCYx+PJnA14VgP5XNXPB6roDoqsaKiXAaTl0/O7pLM+
	K/x2OcJGB9ZoxlgPnXC1+12tjZYHKqMO6q2lFozUlHTT1m7l
X-Google-Smtp-Source: AGHT+IHiEvQ0MheT+mvxQ1vOO/oYCbfeKX2KE7QMawCDoqtMESLqbeGooQ94FI0LJV+49shSO9078Q==
X-Received: by 2002:a05:600c:138d:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-43db61ff68bmr169118785e9.14.1743599342849;
        Wed, 02 Apr 2025 06:09:02 -0700 (PDT)
Received: from [169.254.8.88] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fc67a8sm20741125e9.5.2025.04.02.06.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 06:09:02 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 02 Apr 2025 14:07:59 +0100
Subject: [PATCH] coresight: Break to error handler if connection can't be
 made
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-james-cs-ret-break-fix-v1-1-83907d9f6b38@linaro.org>
X-B4-Tracking: v=1; b=H4sIAK427WcC/x2M0QqDMAwAf0XyvEBbrch+Zewh2lTjWDeSIQPx3
 y0+3sHdDsYqbHBvdlDexORTKvhbA9NCZWaUVBmCC9F1LuBKbzacDJV/OCrTC7P8kVI7eNdSjrm
 HGn+Vq77Gj+dxnHm8CEdoAAAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Suzuki.Poulose@arm.com, dan.carpenter@linaro.org
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_060904_606649_62CB04A6 
X-CRM114-Status: GOOD (  11.62  )
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

Change the return to a break so that the of_node_put()s in the error
handler are hit on failure.

Fixes: 3d4ff657e454 ("coresight: Dynamically add connections")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-arm-kernel/3b026b3f-2cb2-49ef-aa20-8b14220f5324@stanley.mountain/
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-platform.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 8192ba3279f0..39851a13ff89 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -267,7 +267,8 @@ static int of_coresight_parse_endpoint(struct device *dev,
 		new_conn = coresight_add_out_conn(dev, pdata, &conn);
 		if (IS_ERR_VALUE(new_conn)) {
 			fwnode_handle_put(conn.dest_fwnode);
-			return PTR_ERR(new_conn);
+			ret = PTR_ERR(new_conn);
+			break;
 		}
 		/* Connection record updated */
 	} while (0);

---
base-commit: 5442d22da7dbff3ba8c6720fc6f23ea4934d402d
change-id: 20250402-james-cs-ret-break-fix-ad38103af5f6

Best regards,
-- 
James Clark <james.clark@linaro.org>


