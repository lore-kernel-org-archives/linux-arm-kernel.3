Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB7CEE6B46
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 18:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Plp3Yk6cNKttphBRZ6WkXav3acKM+/WvJHxDeTend20=; b=0PMCCGKEg+4JAmqxuFWQtAiF6u
	pW4yKmWJCHQL/SoY6XWwHjpvQL2CLCO96shZ4srOF1pI1wqz7jZSDJ9jBbR4C9GzrtZYmx3Nl6HIH
	Nh3YVZnaqSL3LQgQCuE7HM+CFp4mv11Q58lqt6wBgS5jcLsZgqbPureHABn6MippmU7aZt8BCM9hr
	OQylv+K3tUq6SkL49gI4e6MIGQGQP4bFcKpEN0NqF99nZbgZJoXw4miTMkKsmrojpN2TYW8tBxuKW
	PquPj1vGZW18GjGbls92dU5mtUGr2dLB6ygmjdVdg/8c+Eik/VXmnPLd/+wnfY2qu7j3xUw5zEfzv
	stCSdlUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQKu-0000000Bf1k-00P1;
	Fri, 06 Feb 2026 18:13:44 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQKq-0000000Bew4-2Bmx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 18:13:42 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2b71557299dso952833eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 10:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770401620; x=1771006420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Plp3Yk6cNKttphBRZ6WkXav3acKM+/WvJHxDeTend20=;
        b=BT8ocij79idFkTcQYKMLxDfGIG5Jf2eO7o4yUBTrTdQV/6ZMKbaG4mZrSnrraB4R/X
         y7zPD2K0DuiVloe4vfp4+0FK51cUizqHYfxje23npqETmgj513Txlqb7ZF1s1xLAfkcj
         DaugGHiR3lhF6muPlzw2aHpqPM+o/xkTy26F7pOi6QBIf65326TkpF5UwrKSK1fIt3X0
         aGyHNaRf95MzywbK6RAkU23AT6HNbTeo9cF5iF6m1SZT60ewQGfFUu+TwQ6X9asOHPCM
         Kz4QhS8LR8EZ5gRmAPIUEmLKp4LIObi43/+gIMZ6xZ3M+lwPuMgg16QkCEl6RpNzP8zT
         uZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770401620; x=1771006420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Plp3Yk6cNKttphBRZ6WkXav3acKM+/WvJHxDeTend20=;
        b=Y/OL5qjUx2PvBP1nQYWAfJ//vcIMVymdd7Shy3/ROKJXcwQWjXV16t1rxkE1G96XLu
         3Xt06Vzcvea0k6lo/12aSLwH3IGz0oX38AIXHswUfYRUqv2LmQ3y1LFYCLIITygjeLlg
         yJpx7MjTE19VOEJ4BaDnyDkqQM2panz6nR5nrCuurPpum6xU323gbXn2Yc1tzpEAc1g7
         hilG9fa9VeK2ILL2ByZx0p+5zb8I7hDttxdjPIl4L9ckA6tZBxIioJ1Srkrz92GJnOGd
         VeE2QWj9A10XUNTrWNR5fFNmB/Z2WGE5p4JJ+m2WmPqhdoDI78D/STU+6KwbPXN1UFOu
         OynA==
X-Forwarded-Encrypted: i=1; AJvYcCWMjR5dbWjxj2Ls/CaR9281AAOu8A5lwWrb8sMo8FvNL0GVE/HFAPf9YwsNZ6uEEWUDFL9AnDcF7YVU6rDqfqxA@lists.infradead.org
X-Gm-Message-State: AOJu0YxlZTn4Pw8xkvms4fM7odeRek0bXTIMkv7JCtbjmjejjWaZoo4q
	Ufvj8u52wsz2NYipHgr7oViqn590fuLcVH8a06k4I630GsZxk8j3sixk
X-Gm-Gg: AZuq6aLHv0QBqtNjfoYaQ0R6uKA7uDDAUbK9NkhTCPScV1NmFhkHJzVECuMDHRJEMlj
	Dmsz2oISUojtGC1lg5yEQyk8cMyXhxGdrh8RiFYl4ft7GadsND5noIQvIS6ld8LRV4yGtAQ43Mx
	Ur0zGpq98IV6DfVwQvGVUw13T8wbmOlWsOjaaS/BVUojSvM9g34oWbTzIA+9TsT1CPUVI+x9qK+
	Fd5JBUUr8PZHHjfhoFIA82qD5G2+osSG4qtLzEyy1FkKqA4aD/eIKNzfT/XIYwjHAwLlbdM6nko
	DguadRvrgnpq6XXGALtwraY3ps8mup8Ih8cYe5jdOej+1EyNaKjoJOhUgStrwXZXIHDIEryENA1
	zXO6jWhWs4N5/UG6bRswQOHdudqU8p8U+Jxlj3BRPXxy3q7CJDlmD75jZHQyaDh8raNycjfdLbE
	cyBe79e1kdyEzyIoFdSWpaeSy0
X-Received: by 2002:a05:7301:19a5:b0:2b7:24ad:5c54 with SMTP id 5a478bee46e88-2b85644ec11mr1930047eec.9.1770401619551;
        Fri, 06 Feb 2026 10:13:39 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:44a3:2bb7:a035:fd7e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270433ab31sm2782500c88.11.2026.02.06.10.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 10:13:39 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org
Subject: [PATCH 06/11] dt-bindings: mmc: rockchip-dw-mshc: Add compatible string for R1103B
Date: Fri,  6 Feb 2026 15:13:04 -0300
Message-Id: <20260206181309.2696095-7-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206181309.2696095-1-festevam@gmail.com>
References: <20260206181309.2696095-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_101340_566991_249AF787 
X-CRM114-Status: GOOD (  10.38  )
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

From: Fabio Estevam <festevam@nabladev.com>

The dw-mshc controller in the RV1103B is compatible to the one first found
in the RK3288 SoC, so add the RV1103B to the variant list.

Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org
Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
index acb9fb9a92cd..a75209bd2710 100644
--- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
@@ -43,6 +43,7 @@ properties:
               - rockchip,rk3562-dw-mshc
               - rockchip,rk3568-dw-mshc
               - rockchip,rk3588-dw-mshc
+              - rockchip,rv1103b-dw-mshc
               - rockchip,rv1108-dw-mshc
               - rockchip,rv1126-dw-mshc
           - const: rockchip,rk3288-dw-mshc
-- 
2.34.1


