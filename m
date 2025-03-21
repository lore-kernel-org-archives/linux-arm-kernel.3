Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6C0C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 08:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQ6AZvpz6rhEfIMNob1PWyEst8krux8q3uqPjk7Bggg=; b=rJ1rdiEPQ0djQdIJzZxIcPNgZ1
	Em+cJa79AnebjkhMPj4BxF87OQY8P8OXFYB3bnhkrPWSoF5E3h02UD9PV1fRq2v2qrFEMln/77yVD
	gdLKefOa0urfyUMKsE5VlkzU+2/zADXZMHc2QUg0BZw3h+Z1J0qy+E6WKN/nr+OwYFd7JE1q0CglT
	dZLQwauiQqZRqAof+p1/DAIP+P8z8oiu2HOb1Fdqp3iBMOVwRIqkGKq0VBxFF/76huvB3Bcb1b9LR
	d9W/uMuYlZg7ITuoKPALks+2jwlQj/tg71Mz6/nGDIwejA/tA3el3oqSMPRbHQgdFyZVMxo6h89sO
	W+lYw+gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvXpg-0000000EFrv-36LV;
	Fri, 21 Mar 2025 08:34:24 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWnw-0000000E63U-3lkw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 07:28:33 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2260c91576aso29035825ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 00:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742542112; x=1743146912; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQ6AZvpz6rhEfIMNob1PWyEst8krux8q3uqPjk7Bggg=;
        b=mNjmP+Afc6KHwQgNvfD0TF0+Uzi+Bl5ngXS1IMlnglZzQRXVJKKNDQkNsY/zNpr1Jn
         KycG2NX/yGP+SVKqB4XcrsXTs0NNYVtIKq7CIE95VzBeu5Ev8lXmbv4LWx3xwgawlbpp
         w8jAFeK+fx9IN2XkEDOvIwokWWnLOYW6oKFCs3tt0ztswCVLN45sTCXDZlTE+zHNxKzX
         NrQA8/pjYN/u5LljjfRnjLij4iYGeth9J9yy+nA9z06z1aPg6Wr/l9gYbJMiPzzhG8/s
         82n+GOODGYrRkZGe3OquSIA2mEDz+ZGHdSZ9jn/w7H57gokiRAwAg5zC+8B2kl60S0YM
         OMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742542112; x=1743146912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQ6AZvpz6rhEfIMNob1PWyEst8krux8q3uqPjk7Bggg=;
        b=pSP480DXDeIdKUyvmuy/ATFHEb6JOpq0Gd8BdzsojqASRuXiEADMNonnJMwqk3bVFB
         jRkSvFOEsqc9w+VbkvhetUty+eRlIQ1vOCss4bBkCI3Bu+SGMesyI5srzpskNAlP3KI9
         wdLr9bOBauNOsWXjBKByToA+6hJCKQ349D4YCy0Oz+MO4/EV0K2paAWrWc/fwOoT299H
         sk+XtrWr5tXbzAQIfskPmVBZtfS2byjgBwyZTEt0F4gzrJ81E2QfnLSc9ZDE51pk0hNU
         Mh5vgaLchRMKGS8UNNqoeDXbvz2ocQuQCOljyDWznmAA7P/fOvsEx/t60e9K+I3V+Dqa
         ripA==
X-Forwarded-Encrypted: i=1; AJvYcCWKzrlf+9AazL2uht/SgLASxIP9t9reJL8h8erzpFmngQENJ+ddUeeBLwwEtFQI+yQ8Bm8RjUElt0+ir41SqxXa@lists.infradead.org
X-Gm-Message-State: AOJu0YxnIGUChb+ebBurQsCb4FB4TngHUKMXC23S9oX/TCnp43sDkJ95
	hOQbSfbLoil3YMNbWDJNPbm8S62sGFond6Z1JB7A/Dzn1Gz6MXNLgyyvgg==
X-Gm-Gg: ASbGncuErvkUPX+dSBdyHwbPJYV3cyfFD78b3g8niEbHPFcB/krwapR2azVSZ8V6N/C
	Svg+ztLvZf1xfo2m4ukCBEGGATmJEdi30WuubpblkBcKmaY971WX+IWPRvuXof/WmEJP0qss16f
	ace9QNq5U2/Nbk8sTPWScUAvXuQs05j67bWtY4ssF19FapaftweYRuZ89aSRzzTl5FJvNJEGqrR
	NAQOECXxK0OBThVxEiwgCLEfaNkmnoYzX3kZnYHOaRoVtTjXkYsQTmM1YaEtTT16OYM+ZyaIroH
	yWkbzgYj62ncCTY0/oJHUBAbtmr/2OIAOFrmO1ntJCrWczmPBcIWrIm8VVP+cv6ImNDyGmHNVXq
	iJ0VG6tX40kMiQ7lmQ7HbaA==
X-Google-Smtp-Source: AGHT+IF7FqBLTpoqu0WbqKOuE+QLRcd920+js8xSlAK+76OhtVDhNbPYQwPAH2OcbN6qA0DGpJLXxg==
X-Received: by 2002:a17:903:19c4:b0:224:912:153 with SMTP id d9443c01a7336-22780c546b4mr50211195ad.5.1742542111611;
        Fri, 21 Mar 2025 00:28:31 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f396fasm9862265ad.27.2025.03.21.00.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 00:28:31 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Fri, 21 Mar 2025 15:26:03 +0800
Subject: [PATCH v6 02/10] ARM: dts: aspeed: catalina: Add Front IO board
 remote thermal sensor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-potin-catalina-dts-update-20250102-v6-2-4bd85efeb9b4@gmail.com>
References: <20250321-potin-catalina-dts-update-20250102-v6-0-4bd85efeb9b4@gmail.com>
In-Reply-To: <20250321-potin-catalina-dts-update-20250102-v6-0-4bd85efeb9b4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742542103; l=882;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=P26V4Vll3LYpWjYPKGRYB+hCja9t6ZA02VGXue+Ra5U=;
 b=1jyEURlt/5++JQucdIxsVJF68m7y51O3IBeyOync7w+P29hPHxy3fEcN/cXhDXvIy+QwRU4Q8
 AjZOawK25tpDUsS4J+XGCbz04FMJf03ZVOY2JXgxX3inZSerlbJpg91
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_002832_929640_61A52D26 
X-CRM114-Status: GOOD (  10.14  )
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

Add a remote thermal sensor node for the Front IO board in the Catalina
platform device tree. This sensor enables monitoring of the inlet
temperature.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index d5d99a945ee4..307af99e833c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -544,6 +544,12 @@ temperature-sensor@4b {
 				compatible = "ti,tmp75";
 				reg = <0x4b>;
 			};
+
+			// FIO REMOTE TEMP SENSOR
+			temperature-sensor@4f {
+				compatible = "ti,tmp75";
+				reg = <0x4f>;
+			};
 		};
 	};
 };

-- 
2.31.1


