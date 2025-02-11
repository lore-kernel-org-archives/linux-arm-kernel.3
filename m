Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD579C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 18:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jf8IzMve9UruqqXDdyuV/W7aGzB8Bcp6OKBilUu94Gw=; b=IKjY2CuAU9AhNH1Do39howMnh6
	vMaQ7XAVyuRV5vmrbLr9kSgBeZH753aM8XGyDEy9HRVwvlzovnrPLkRcdWXUjCSEpYodbDEnGPcrg
	UXorY+7RhjO9W1p2glc7tLjBam990vDEN6Hc1OQVrNYRnoYc/1uwSdNIdEkBpgS4/oIjQ97jfQTnd
	txCb2NygMcOvKdtb5xQj1/hXtnt4DU+n5/TG8xh7GtcQOGol1nyjIuETwE+HuLPBBqlBp+G5BGAsY
	JxssFD6aWmECPgIqR9WN9GztFceoaJkYmuAbTLBHBoYFZmbVTb5c/lK6+jRMpYFr7RMhVNFF9Xnng
	ahaThzZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuwX-00000004pqL-1WJ7;
	Tue, 11 Feb 2025 18:25:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thuqQ-00000004oyw-0sty
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Feb 2025 18:18:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Jf8IzMve9UruqqXDdyuV/W7aGzB8Bcp6OKBilUu94Gw=; b=Fl1ofopmmVMB9+2Tn9vsMUr0fo
	qylCNZSG8G9LPV3peMlUDB+MnoHu7Mzco6rcbOZWyKhNbHnAW15YPVrJO8SDzK3nV0WrKjiDfbXb5
	ZGveXtAwWzyryz3TzHuQSoOTq+oAPMQA6IlP3CfLd13mmXlramk9G2NJyZxshSv/9icY/tQzxkcGY
	5M8BXGRAC4CQ0u7gnTp3o49byqnbKqEX1MhHVjiq++0eMFcCBp4aMou11F+E2mg4z8QzpozPvNHXb
	7Kd2v41hPP1odSy9K26PEE5nNpc37Cl8t2lHD3PtVlb4A2NO4zEM/S51NQ8eLtuMgJeAKenGhvj9f
	FGVbpQlA==;
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thuqM-00000000fjx-4Asr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 18:18:48 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-8552a15462bso184006839f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 10:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739297923; x=1739902723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jf8IzMve9UruqqXDdyuV/W7aGzB8Bcp6OKBilUu94Gw=;
        b=kYFJDtsE4mzVWrbYqZqKY/6YJEXZYY3B/MnNemHvOrLG+NNd+HeuNliDZT/0OVaonr
         26ByS0QW+IaYE/CDzwuUKZzOlRpFiOb8rTg5iQv/3Gx0c9lsl17kx6UwfUWWKAHopKTa
         MhmlDBxStEgRqf6Df+rEtSpFkd1bBMxumbRMpZtPqB/+R9mL2/ifi9vOCvyKzxAORzCM
         1W3FFTgpL0zfF3FiXqQJ2GbXwMWzCnVFMEevs6IM8vl3IAlhi9X/nJArUzQT0CIzC+T5
         QCRXMD2uUQQj9XU2ElG/a7UNMXcOEE9+TVAYVq4ERY2eetBPnrsStSLn17qRpraHc0uB
         +RPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739297923; x=1739902723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jf8IzMve9UruqqXDdyuV/W7aGzB8Bcp6OKBilUu94Gw=;
        b=KJ8WywRICt9OGYSWY8pOL/MkRu5i2g7HiHgZT1PvatwrZ8e+zEJtDFVnh9EYJNtRKM
         Yh1uE1kFH75GfEqgurGXe3a8mwCoBkZ13MfAe7H5hE5w5oqGHDqVnad2G86G020NboRp
         M0jOuwt6/39F0C0wMpljvwiMqThVKprEWhRViU+HLeg6oslMjeOOUlE2mcGQsDesrFrb
         2/CPB4j2mZYmZlt2U3PW/fn98ksteL9bOBkqITe7kb3SUeZy+TxhyXYxJNMN46EZAVkJ
         IQVCj7aRkIQurWlvjbTNtzubOCODCVNOlf6kBtLt4NYEQ+87D7FLvIGmcUhPN054K9lu
         E7xw==
X-Gm-Message-State: AOJu0Yz4PJjdfPUKNzydwM/xoZvQFeDVXXH/7LsKW128fZ8rVSD0F2LA
	hkB3OL0AOEG+TJUOthxl4jM2kqF2OjPB9FogjkFfnOW4Y/B+ENUcf4b3XA==
X-Gm-Gg: ASbGncuAB1tFYOsSh/OxQdBVNX4pVTSX4SwjkD8Z0bQ98os07HcgJtgDcCVKJyzeeVC
	Anp1SYD2dIekjd4OPASmWbHwRv/f6t0fzyhuVyZwGFEnkKOgWyipf/jvMnEt8rJZ0bTNxMSuG6E
	hVn6Wb+yUssliuaU8CNwJL/T0BY9/eSgwJgSI0+ULw/7RVedCC39rkLpXPFWY3b7u6sLP4aJ+fz
	4GWCywH4LDfmJMX7T2fjv/4KjF0B7dvEnr9HeAJn+xzleiutkiyM8a5LMTXfeszAB9q4gWUuFZX
	qDn84oMJVIfM27itDui8Ne7Jj5vkwJULa14HNiqhWyXMjmtuwzU=
X-Google-Smtp-Source: AGHT+IGcIyE/tZiKdR8eJMFiZgsnRwE5Eadm6DDPm2IiuJCYrjQqDwUUtTIZwzZEQMZZ+0j/yDuavQ==
X-Received: by 2002:a92:cdae:0:b0:3d0:19c6:c9e1 with SMTP id e9e14a558f8ab-3d17bf66cb1mr3706065ab.13.1739297923599;
        Tue, 11 Feb 2025 10:18:43 -0800 (PST)
Received: from hestia.. (24-220-158-153-dynamic.midco.net. [24.220.158.153])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d152519ee0sm18017875ab.27.2025.02.11.10.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 10:18:42 -0800 (PST)
From: Robert Nelson <robertcnelson@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Robert Nelson <robertcnelson@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Davis <afd@ti.com>,
	Andrei Aldea <a-aldea@ti.com>,
	Jason Kridner <jkridner@beagleboard.org>,
	Deepak Khatri <lorforlinux@beagleboard.org>,
	Ayush Singh <ayush@beagleboard.org>
Subject: [PATCH] dt-bindings: arm: ti: Add PocketBeagle2
Date: Tue, 11 Feb 2025 12:18:38 -0600
Message-ID: <20250211181839.1575497-1-robertcnelson@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_181847_122414_B252FD04 
X-CRM114-Status: UNSURE (   8.21  )
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

This board is based on ti,am625 family using the am6232 variation.

https://www.beagleboard.org/boards/pocketbeagle-2
https://openbeagle.org/pocketbeagle/pocketbeagle-2

Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
CC: Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Andrew Davis <afd@ti.com>
CC: Andrei Aldea <a-aldea@ti.com>
CC: Jason Kridner <jkridner@beagleboard.org>
CC: Deepak Khatri <lorforlinux@beagleboard.org>
CC: Ayush Singh <ayush@beagleboard.org>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 18f155cd06c8..b7f6cd8d4b9e 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -46,6 +46,7 @@ properties:
       - description: K3 AM625 SoC
         items:
           - enum:
+              - beagle,am62-pocketbeagle2
               - beagle,am625-beagleplay
               - ti,am625-sk
               - ti,am62-lp-sk
-- 
2.47.2


