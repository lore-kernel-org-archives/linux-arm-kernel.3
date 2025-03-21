Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419F9C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 12:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+NiAZ9mdyZTQmFAQQ+DvuQUzdXkQ4ZbSFQA5qFBOIg=; b=Yl10wgyitDFIPNh/iILvbhM/be
	Phc4j42JL0ye476iQnjxa6IHOmx/Z5/bIGNIcF8p1e5IifN/QEcx1Ra8czdEsi26UhxapCTqzaXo0
	zvoqK6Jx9Bve1oBPSwqsdAqqzQ//O7bAVJdrUkhrbmkiJlBleTBH+70JBiTblKHnrqli3B9YF1dWZ
	xIMdvb3JQgtF3dBIEt/YvIx0IAB/y64QoUeQ3OurmTvJnBL1IEJ+GqaFwRNFpjqMmFAzlhn8o9P4d
	yO6tH5WRgttwZkjH92PUdNJWt6XeZ9uVkAEPzj77kj0+xFOlL5Dqe9fgd4gcDKfM5eMH4jVnaFBDC
	1omeHpvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvbiQ-0000000EnPy-1F0A;
	Fri, 21 Mar 2025 12:43:10 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvbgf-0000000Emkg-3yQs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 12:41:23 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-225477548e1so34750865ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 05:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742560881; x=1743165681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+NiAZ9mdyZTQmFAQQ+DvuQUzdXkQ4ZbSFQA5qFBOIg=;
        b=JmFMRFrltcLRLqaMPVpyVZ0HlmKl5mJ4u36Vwk8V17K2OCkk8VN6rUo4mqWzrACQ6c
         gqiGtYt15bGxeD+4Hp2SSkDuzFgUEE4sIPR2DyQL4NSBTQZvnoHlpI8Q9SSvySG/ftiD
         zWnFFOT55FSQ7ZvovT3WMyTiMal9KIdmL++J/+5ESCunnx9Y4v1uHIn24gw3m8136rOo
         hk3KlEs9+SDZZt8NACluNLnDB/D64fkxXXouMMZ8cM+M+0zNhm5iZ2xSali2ZWMpsg3Q
         HJU94pxpRj9h7ogb5+DqOphoE5Sby16RlTVzzBn4sGJv4m8h/dmqledHqskv5XXsupb2
         M0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742560881; x=1743165681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+NiAZ9mdyZTQmFAQQ+DvuQUzdXkQ4ZbSFQA5qFBOIg=;
        b=lpWDYMrj/JOY3Rko19jOshRTryCzRIVVNqMHQEBOjWWK4xUZJwVwoS2JuRomtsrpNE
         EDlsv2nkf1tSMAa/FZ5rkrGRPz23V/8KkKpguekxGP8a9qBbeDqDo4STPDI9j1xR8x0f
         bvQmFPLkcYwLBzTAD/3OzSlyjmYcj/EF0rCg6Hr6UTpIx4kcUvsy9VRrOkLCde1QggFF
         QBLmnkQb45syx+mRPamX5gvWFntyI9/6WKvlkX+QpZmZFFhxENp5+4icgtqHt/sGWSN/
         swJGzYrrTQbon6Tm0qDlb0WSD29ImbJQjyKOzqkjNvBA3XcnVPFDnq8AHHZChlBgyRMQ
         YE2g==
X-Forwarded-Encrypted: i=1; AJvYcCW+/6ChR0gbt46/sahcKHoi/Tk0q2lzKxIVYPc9G2AkjRc4kQwMrwIzXOR16XGitzc4tFzORn1MWK8NYp9VYiAa@lists.infradead.org
X-Gm-Message-State: AOJu0YwHmyJ/L4iNiJ+A99GpXHVEkjxxUMaa0y9GYymD+PgUcAJvpA45
	48cSDCHVQi+ulu7wHy+iaqdpQOn9xQgSxQtaxkNkTrPMaapo773x
X-Gm-Gg: ASbGncs79XCIwbL3I3/x+3eJ9ix9xDgWybqNLQNUryl1ItPjoVwupdVAhdG7clBow4K
	D7jkd2gkr+x54/8P109qj3/Ng3sjNcthRX0rd/orrFSEMA8Wv3eJs2jfZvHbqLcRgPux0KwNcqg
	fmuTAeBDSwNhHZ72Dd9l0DCsOqhQ1WWufMMmWz6U68zn/cCqcXAG3OMdpTTW67NQuUQk2pwo/3n
	U2qAWHW62jYgd7W3717DWBbtp9MUdxMmRtIfBjGk/XNzhbv9iKSnxAOyfrRojFHiV5GGvq9T2Mk
	Dc6pWxZaHQm0aJaAG00baR1s0wRz6IiTk5M1C7BNXE0nIEdyoCDs9c3vgbQO1ovNKuPYU48+yrz
	Do8d7ACfP8Ke48TX/c3LCqI2TGadAFphjSsLT/05G7z0lovXEZgp/E0qrmcw=
X-Google-Smtp-Source: AGHT+IExgVZ4q/4fohD2pxnSiano84+Gjnet64GgoejlycI2L+z5k6c8k/m9ePdFfCzgOHfdnbckMg==
X-Received: by 2002:a05:6a20:7285:b0:1f5:6f61:a0c2 with SMTP id adf61e73a8af0-1fe4300fe40mr7650260637.34.1742560880874;
        Fri, 21 Mar 2025 05:41:20 -0700 (PDT)
Received: from jason-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fd5c90sm1815432b3a.51.2025.03.21.05.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 05:41:20 -0700 (PDT)
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
	Jason Hsu <jason-hsu@quantatw.com>
Subject: [PATCH v6 1/2] dt-bindings: arm: aspeed: add Meta Ventura board
Date: Fri, 21 Mar 2025 20:37:30 +0800
Message-Id: <20250321123731.1373596-2-jason-hsu@quantatw.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250321123731.1373596-1-jason-hsu@quantatw.com>
References: <20250321123731.1373596-1-jason-hsu@quantatw.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_054121_984116_86E30088 
X-CRM114-Status: UNSURE (   9.19  )
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

Document the new compatibles used on Meta Ventura.
Add subject prefix for the patch.

Signed-off-by: Jason Hsu <jason-hsu@quantatw.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fb..a86b411df9a5 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -87,6 +87,7 @@ properties:
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
+              - facebook,ventura-rmc
               - facebook,yosemite4-bmc
               - ibm,blueridge-bmc
               - ibm,everest-bmc
--
2.34.1


