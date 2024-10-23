Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDB0CF5396
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 14:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YfCfY0e08fQets56CZIoi6Rt+juLarU3s4v7RWevgfI=; b=28PwQm1cL2OOD78WrMMIgtFMpv
	Nz74iCNRaAlhifQUR5IjEFqAU/VpF7OrT7XP85Exfj9truDvsPvswJZuIcUlWxSH1Jwu8hatAiOPF
	rh01gVzWao1Owq+QrvBI1BRLvNOk7o4oXHnlWeh1bTUfgIGxqy5hFhbDeohi2yWGBde65iVVG/cME
	p5F2WeKuNjAypyLcYF4MUTYTKjs3hKoSmtakvPVNf8lv3SvuBsvNv5lLBq05X151juSN43CWbo5Gi
	UXMEbPoxkP9pL6FqxKXdfIaqnwwbpDKGcBjzeKftOUFJeUxahuloyvpT/y8Z2atCPbH3Rd9oEbwKN
	MdG7rViA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cbl-0000000Emv0-1vaU;
	Wed, 23 Oct 2024 14:45:09 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cZ2-0000000Em1B-0alr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:42:21 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20ca1b6a80aso66898275ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 07:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729694539; x=1730299339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YfCfY0e08fQets56CZIoi6Rt+juLarU3s4v7RWevgfI=;
        b=hB/VaRbFPw+1Ovbz1e1qf4CzWU4aqQHuP/MeEjqsyfg3KdC/SpmfbaNTer0ZaxIMa9
         DzvEga2fIv7+hZ8pCXbt2p+KhwalzDmdZ6shmtjwS93ETGcue+P30i1FYlDVwcxWBJIB
         vIeYdqbgSf1B8fkbwG+YB1FsQg1601MIiKfH7U+deU98aBTFo37uKRzuXICJp10N7hhB
         2q5iR0/WMJbBcTpTC8ziNxC/8qa75DoUXY4utxlD9QEGRlJq9B57va5EPT1G9CgMoi4N
         WZYd3gdqTy6RUzi9e0J9W1GMF7T/vsTZlCK9/SK9RHvkE+Q2rmeOkAPo7BYqvvsJpp5F
         3ivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729694539; x=1730299339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YfCfY0e08fQets56CZIoi6Rt+juLarU3s4v7RWevgfI=;
        b=hNFkLOQ+wCsGeK69LRT4alRIAINn9xTD3DpTMzmP/JVwdnB5RiU9k2rY2N0wh+qLfZ
         bfenHlh94U6jMLsLHdZMDym/psR7I/MVKL3vFYCnmh4QulwJURC7GdJhXXzzX/SsAreJ
         EX9yEliFqH4gXD158pVib9oUnJE7+3jeBD7SA7CgPNsUqio/++enWIFRXx0AfYtq/IOD
         V7+SRUwk3MbdXN1YFcG7lyTF83zIQ3ZdZ5bNNDKNHJuUeGJH0BaiNZIoV21NMvHOzPrC
         7sJ/SXR/v3o3Ch9y4PwYYrl9ExphPJh3dC0pr9AMmFf/VUVQIkVAavBCga1qzXYA8NlX
         +Cvg==
X-Forwarded-Encrypted: i=1; AJvYcCWjXQjJflvtXdRPtFdimkBD0fDFvPIE8dFwD1pov5OkQFSI3+TPPMete/wIgbTed9zVtFvK33gz5xFgqOe2xoEx@lists.infradead.org
X-Gm-Message-State: AOJu0YyX3tudiubRnjgt7n21mECBBP1whXGOT4PKIIkVqYlpAduEW2bh
	0DecJLCBXqYc0Xtdt6MlPR0TVig2yxy2kWA4SruOnKwMeEP5u4W6
X-Google-Smtp-Source: AGHT+IFB17hqHfuiufxeK4p878goN3oqjHEpwzkM7x70GkUyk90bBzpvra7dZniR9vA6LGkZjhYwug==
X-Received: by 2002:a17:902:d507:b0:20b:5ea2:e06 with SMTP id d9443c01a7336-20fab31f644mr43620755ad.56.1729694538576;
        Wed, 23 Oct 2024 07:42:18 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:3468:366c:e529:6d8e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f109c5asm58573725ad.305.2024.10.23.07.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 07:42:17 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: hverkuil-cisco@xs4all.nl
Cc: lars@metafoo.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	shawnguo@kernel.org,
	francesco.dolcini@toradex.com,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/3] media: dt-bindings: adv7180: Document 'adi,force-bt656-4'
Date: Wed, 23 Oct 2024 11:42:04 -0300
Message-Id: <20241023144206.1099622-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_074220_212873_68840F54 
X-CRM114-Status: GOOD (  10.23  )
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

From: Fabio Estevam <festevam@denx.de>

The "adv,force-bt656-4" compatible string causes several dt-schema
warnings because 'adv' is not a valid vendor prefix defined in
vendor-prefixes.yaml:

adv7280@21: 'adv,force-bt656-4' does not match any of the regexes: '^#.*'...

The correct vendor prefix for Analog Devices is 'adi', so change
the property name to 'adi,force-bt656-4'.

Keep the old property for old DTB compatibility and mark it as deprecated.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/media/i2c/adv7180.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
index c8d887eee3bb..4371a0ef2761 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
@@ -39,6 +39,12 @@ properties:
     maxItems: 1
 
   adv,force-bt656-4:
+    deprecated: true
+    description:
+      Indicates that the output is a BT.656-4 compatible stream.
+    type: boolean
+
+  adi,force-bt656-4:
     description:
       Indicates that the output is a BT.656-4 compatible stream.
     type: boolean
-- 
2.34.1


