Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0EBD3B985
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 11:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tb+EnpOEWqbg5iCLmnC0J7ea39+1VY/WhLbt5ileqoQ=; b=YShUXS1LWyvVe7M2gM5lz18eAG
	8C2+Wu6quBYfJRVONSReVW6fGwG/oCVjCzAn+dOLm/5Y/hQiO7QW5k+VcWGP0bK99XtfJ1re777r7
	pPYG9e77ycYCGjXaZcs+MUBPOth85RxpV7vLEQpgUHYlrDaKvgk1EY+ng4B5D6SPHbQ8KF99CkCg7
	6Pl6pBmkdLHahVqhx+De3VBvPLApJfQUm75VonucILGaziZrtaRFdZCuXYaTG9299MzevWedE85l3
	qJYRSCNDL5EjAMLG4Akn4hwfUmjlhtnx7CeKFy89+uZniHeO//C7hhA066VAMp9KoPSgVGQHpssRJ
	2fATGX+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFteE-0000000AOii-21q7;
	Tue, 26 Nov 2024 11:22:26 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFtcO-0000000AOTS-1tEi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 11:20:33 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-724e7d5d5b2so3800126b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 03:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732620031; x=1733224831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tb+EnpOEWqbg5iCLmnC0J7ea39+1VY/WhLbt5ileqoQ=;
        b=RUIMLM4/mAD3w2QbaUb+Ca4axQNZHyjAKfZjGq5NH0gBXWAbKJ1RhJTgHDovysviMJ
         4pI0tZDnvTxmNowCaZekefhdimJHoNb0x8hgUQVA0zde6UmzVBVTbITNGYuF6lBKMttA
         3QWAagZMJcBwCuwVcwrbO3aYAost2zpSZ8wzEE+S/uCP550UGhZRSQ/tTQ03KP4fBeHv
         z5Q7l5qNCVQJHiYDIp5NxSPUW//IETYRyJ7Arab3gg3sFtJVr/2nSToBskNT516hA1gL
         pmslCQeDCjHCNhV2WPY6Em87pwfe0JoWwW2DE5CYX9iZQBhXCBd0wr+AkfRXIGt4TxLd
         XFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732620031; x=1733224831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tb+EnpOEWqbg5iCLmnC0J7ea39+1VY/WhLbt5ileqoQ=;
        b=ONqzT2OmuSt7j1YbxdPrHPNUm8d1297I7rvgMAJ/fvhCmP8Up9OsbMdCdJHGBcqAR+
         JXjH0cOBbOMTavY7WIN1P2vu//v7Tg4uardubJHH0/+MsEHMiT0o43X8TrxhVGHAlL2M
         lYVzcvJwaxkqQ3HfqdTJMPg8GPlz/SNa3MjgemNs9uZBcp7arSaEHTOvD48gWva2ZJhw
         OuSF18lLfhlSwFdhPL9esw92Ny76AXsVFii6fkrBkz8baGVEEc8jvjtZRRe6B0y7eHgT
         KMRogZViMPf9DGPNZMB6dYH0GJ6w5OoF4pUd6MMs0hEdjKZ8VKSSGh45WI2i0/d0uZjZ
         +Tag==
X-Forwarded-Encrypted: i=1; AJvYcCV1ep023BYRtmumzn0S03LuyPDIIKd4HBCg7i4kWySh4zHX0LdVIDzM7ZWIdQzV4d7q2VcECBJ4gxeejC+2dLfc@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr95XOvQCNB1UJIuB9KrVILbl91EnPcypIuao2HKaHgw8y+Czu
	Kf55CmB673+StkLKXkIkCRL/aO8DPlK1HK44JdXybTaovtLPvacp
X-Gm-Gg: ASbGncvbLWNy89o1uMs01hBYU/Hqg7U22p2sT36IYuedfgV+w2n5PKoumMKC+uIQRrx
	6+ItIzvjJMW57O65sjAYmB95Ad8YCLZj4MM5nK4Z4fov5ciC5bgL+bNqLGiOtkzTdz5yPVPjR6L
	Rc1nNlAYjhhTR92/0RtK7wm2Lf/ab5/36pOt1rQVYv2tRoESBiQ0NLbl/QL5CNEKNoynilrvk29
	rGfJy1lhmkLxpITYFymU0d0Ie1I5Hy289TnwflA5VcHxDGFqUKWAHdtxy2QhldqdDXZ4M+XLwVV
	dcq924/tSFvVBqy7txek9R88L3VzwpkKxx9qwZSHsUgTqXJ/gvh7cYBcNrSYaEho
X-Google-Smtp-Source: AGHT+IFwaXUSQdileW3hevrYxNeWCHpLe9v/tmEc1xux1jDfeU/ZHkgB6y/eGFDCPWiwoeS97ASx8Q==
X-Received: by 2002:a17:902:dac3:b0:212:e7c7:6bf4 with SMTP id d9443c01a7336-212e7c76fc9mr192626005ad.28.1732620031447;
        Tue, 26 Nov 2024 03:20:31 -0800 (PST)
Received: from jason-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dba5d4bsm82210885ad.80.2024.11.26.03.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 03:20:31 -0800 (PST)
From: Jason Hsu <jasonhell19@gmail.com>
X-Google-Original-From: Jason Hsu <jason-hsu@quantatw.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: yang.chen@quantatw.com,
	jerry.lin@quantatw.com,
	Jason-Hsu <jasonhell19@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: aspeed: add Meta Ventura board
Date: Tue, 26 Nov 2024 19:18:16 +0800
Message-Id: <20241126111817.2331577-2-jason-hsu@quantatw.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241126111817.2331577-1-jason-hsu@quantatw.com>
References: <20241126111817.2331577-1-jason-hsu@quantatw.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_032032_488736_C03AA1BC 
X-CRM114-Status: UNSURE (   9.46  )
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

From: Jason-Hsu <jasonhell19@gmail.com>

Document the new compatibles used on Meta Ventura.
Add subject prefix for the patch.

Signed-off-by: Jason-Hsu <jasonhell19@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 2f92b8ab08fa..98ea2b3e0eb1 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -86,6 +86,7 @@ properties:
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
+              - facebook,ventura-rmc
               - facebook,yosemite4-bmc
               - ibm,blueridge-bmc
               - ibm,everest-bmc
-- 
2.34.1


