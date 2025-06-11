Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61D7C71131
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wi7qs6/0obufZNyEqVTYOnyqV5ylPNwI/dhWbrEmSr0=; b=leyfd18EYYHbTUyxiRq42FTs6U
	J0Ck/RndPBZfZOoEdR2CShC9B04Dr3v2xUw331HrGmoou0U8OG8BzDCtEfHi3hcXPbdC+nkT3Vspx
	kmgAwP/CeI0FTNTNShoPYBrmTi8XE4XcaUU53B7+fCONDcpbUOpC1fSF3bR+cn/0XC9NEpMxz7E0V
	Ni5dxAXVVRCPUzEZ6Vr1uiQDexV70CNb+DZ6ic4fqbovt/il2hPheTIaytTMuCvFUn0nrfc94L451
	4aOanMUmGL0Nt6CJa3KQhW5Ne1wTd+CxKq9VD9pdCn3rhfTYEKJkFngydb85YRoizOhI9Q9Ml4Tge
	6EWlFCsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMpl-0000000AHqw-1h0l;
	Wed, 11 Jun 2025 14:53:45 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJdf-00000009kHD-218w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 11:29:04 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3138d31e40aso2975297a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 04:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749641343; x=1750246143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wi7qs6/0obufZNyEqVTYOnyqV5ylPNwI/dhWbrEmSr0=;
        b=D55wIm4UNrrMUOlu2Ipb+QAEvprYD9a6bGOOzsqNegmICqqxYRKNXDcQDmUEVO7En8
         eovx+Oi4oflYouEf4nXJ80hnMn3936sY8+NmlLLeXmN/l+L/rE7nqOAzZ2dMc0/fPYgf
         q3D9yavupplrCiC2A2F4OuGjcbSsqjg2py4e1wmRXykp+CZTRz+SSKdCH5KohzbVqJN2
         UjtdxnSCS77pesG3ECNzUe8sdvyf1MbSKyjgG/ZIQsqUq4zbvqMZJxI3BcV9QBaGDWiX
         nU7zwI//f9Zs5mV7JB0CYIAJppu/kaG9XBITbCCW2RrdCELulocGn6UUTO6nUcY+dd9Q
         GedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749641343; x=1750246143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wi7qs6/0obufZNyEqVTYOnyqV5ylPNwI/dhWbrEmSr0=;
        b=p9Ell6kL33ORp6Nflu1/P5hPmto96e69PmD1v16Fc2Xg5FY8dkFReZyi4kOyzIxX5q
         HUtbKi9kCZGvZFaIm8Ev8nV2Vs1LQXo72ANIP0u6Agg+oyUFp+MAFfk/reRMIJJDTJJD
         7q678icEdYxNIaxtoLnCh7ayCWi+Ogvbt/EqcmCpb640lU175Njd3/eB9lLgROsTWfJ/
         8tdUH+lVgw/zRXQtdAAhB3me0ohbNSJx9FizjcW1r6Yl+c2BMKTCOQX0oNS30HfAs+d8
         FNA/g9j3hfOC2wltIE/MLxYAp62AlFvMZyTjB1/Z2bDLTxTyhSULo7nhMHEDbnEO7f6H
         ZNNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjkYbG6R7hS60Zxbej/ygHqAp1gUYpwMdb2U7VrTgJNIGvihObgaWf7s4ZT6M0jbfIg76QKP7pL9cBYW02oVhR@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0lDoT3mz5KwRlNnV5czh5/tnhvUTGxpyHMIUcBetb6uQje88F
	QXqqkDAiqTa1RwU4zbegAM/6gn2Vo74xMffLuOQ9TRSPIa5xbSK00X347sNIr+gS
X-Gm-Gg: ASbGncuuStx2nkQuIlGwuMrCf7wJFAKhmSv2O9pSTobz0z9B85rlW5A6SXwLTMK36Vl
	Uuj9ZzyvDOXZUJ3CGMT4b4PNvrWeqSjVSubxfj18jfvdxLnovTfauXnZSSmAtwX/1ozrj7+oaCY
	7nvRoF6zDSyoHKnHFodD68NJ9WrujUX7Rww7aPic1cDLNsnKDbBZePQ3WMr1PrRCyFTi6rKJFEK
	ES/Pa/6oVLCdO3pag366fFUcMvUyGmfCxPZxMIn3vpDUst+HamUTtToZFNinAuqLgTE2Sy/Z0wZ
	HNEzFpjk0YbOvncZbRL4nDzc8FAcuARcP2LC/J5WyQKq5hA0DTNgGWDCRrOK0daH4KQuJvD50Li
	4sCQUT17l5Uq4Ofpcxbf6NRBC89zHs3+gw2rsyI9CzsbsBSdQaE+gm+8t1cvhpj5t+A2M4v3JsX
	w=
X-Google-Smtp-Source: AGHT+IHMjJzse7RRflhgsuTZl0mG2rLFTpa3QofIjn2JTX+BYAKzHeTEV28/i1Cf1ihDW7WbHff7Cg==
X-Received: by 2002:a17:90b:582b:b0:311:cc4e:516b with SMTP id 98e67ed59e1d1-313af28e377mr3594748a91.32.1749641342638;
        Wed, 11 Jun 2025 04:29:02 -0700 (PDT)
Received: from jason-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b1fee63asm1082246a91.3.2025.06.11.04.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 04:29:02 -0700 (PDT)
From: Jason Hsu <jasonhell19@gmail.com>
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
	Jason Hsu <jasonhell19@gmail.com>
Subject: [PATCH v8 1/2] dt-bindings: arm: aspeed: add Meta Ventura board
Date: Wed, 11 Jun 2025 19:26:49 +0800
Message-Id: <20250611112650.595554-2-jasonhell19@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611112650.595554-1-jasonhell19@gmail.com>
References: <20250611112650.595554-1-jasonhell19@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_042903_518915_ADB757D4 
X-CRM114-Status: UNSURE (   8.62  )
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

Signed-off-by: Jason Hsu <jasonhell19@gmail.com>
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


