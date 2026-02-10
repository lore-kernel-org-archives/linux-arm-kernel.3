Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7206EA8124
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 14:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRvhqTW/9dQaIxqN/xLV7/5mlXB1evHeb5Au1aMeufE=; b=AmXzHfHrsbTgW1Ad6rlcPxmFlQ
	eEykRDNnKYGYisumPcnQGGpMDH8Vnujrce2VQQ1AZ9gxWi2zitgrkhVV2POcaoRXzD20QVBqd94zc
	C22fInuxd+gCnOPvxCFSBVUXDJP34D1uDSR8KnrkmChnZEz0Ayz3PWf4Y0VNlWdFJ3tHzHm7MXji2
	+HST5wnx93Bk7MDPiqb2tc/uYsiHSfhc1ncx/PXVAlJ+OfAr/PxwtqLBLen4G+8g7rDOKoU8QoF0g
	bupmIB2KphWMWyC8GFyGyWPkBDiMhdPEfYpADSAgRJqDAEh274CC/MiyOyeDyZa8N0mkQ3Q4T+3Q7
	OU32rtqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpp3M-0000000H43Q-30SD;
	Tue, 10 Feb 2026 14:49:24 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpp3I-0000000H40Y-3oPD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 14:49:22 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-64ad019bbd4so3765844d50.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 06:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770734960; x=1771339760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRvhqTW/9dQaIxqN/xLV7/5mlXB1evHeb5Au1aMeufE=;
        b=lYdrXb5RkwST0kcPLKJVY5yZQd79NWwtPz5t9BwuT6uNzP0fD5FXczFmGRQ+OeZY45
         u8eK0+bXigTwAb7mp4cKa4B+W+ipgC8zysMHFcj5iSgUKjAjfqJNAKT3UXEcSAk6DpEg
         GXpl0OmVSMH54BCgE/N9hVa8t9ri1b7h9EBJmY+bu1p8+b1lqNo+ynS+NyuyRf+LikCs
         3MNwSi87x8cHDs2meyZ6WfokCNJEhrEA7+V9ktWHj97AvhWjOs6B+VDpnJyAoL4SYAfy
         xl3TKXw9p5V0mHL4AO08yUywta0mREyavHljl2ZqxK3ww3gmcbPsGJOBU8SgwasAibg5
         Pa0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770734960; x=1771339760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SRvhqTW/9dQaIxqN/xLV7/5mlXB1evHeb5Au1aMeufE=;
        b=VKNCnp05MnU4lzIxLACnsce2wXmNZ/c83VFMXTHOcUwjobAywSVkpfwzBDR9Q2iNmL
         N9IJZb+eJRp1ISMUAKYfbOjFsHse7JVbEMSmlaNA1mmrdkQn1zxk631KKPRdEnv3KGDp
         LWjzjszPROJXx6PsrkOy7xTv/M/JINFod+ORxBAJIUUDjWvE9Zfm/yYd4tBxlBN5SpD6
         03oFA6xqBm/NGUhatSBYF5CxhrrgU7G+/pll4ko+5wCMlFtWzkxJGg6rGy1RoC0PvhZg
         +2aPR+j5/08ay0ffx/DvIrfIE0Z2FOW8PmuKh2Es6gA7rwToCrEl8BldBBH8Pj7KKCoJ
         CSjA==
X-Forwarded-Encrypted: i=1; AJvYcCVrAw1IE+6QNEofzpzSnIsoRo4TqxirBIeIkYIlqbgqFhCx+1KL+b7d9IvP5dGSYR3QylWdsgfgaURxW/b2pRFV@lists.infradead.org
X-Gm-Message-State: AOJu0YzPB5zH+6twT+Z6E8DCgdSUsGXIVAXUdMTa8vfOSZDaKFutquXb
	o3EJn/JGuo/6ZyzkgU2qIvA8uek01eCeLyV9m4IhADKY5CKxWRfz9NeEC6RuLA==
X-Gm-Gg: AZuq6aL5/LUBAVNblZmEaHgcjFW9Z6hXaRmHl/Py+Dbb6FUwELaptfcf6iTMVtNuaEC
	ugVl5p2RvOzWLwHfFK1Nq/C5B4DE3AL7WGoekaAKZNuvpE3GfMOyhOPNkWUkMsaPketRc0H4xXd
	wbQ2Xc279q1tiWkkpFBPOT7VBRww6+RrZ9xBDQn1DJJDUvdRTZKx1XTZLUmkozu99wpHUC0Qkgc
	ZS/O502ottW/Y08ut1QsY8ECNjt4t6wkWXmtYkKUAK70DICe+P+S0tuM6ZWea5PPTcLtg1uvIuX
	XONQaAlYxhBPVm2n+USLgvX7TribPezgVWBhNfDONm18CBi0JpTMBI4nXupkFHMt4fFZQF3mC+v
	m2kTpQ07KBD8h98fqLPST0fvlM8W9U4sK7uElx2Z+28IUjY4iYBh1ic+A4bKKX04dCyPzJO1P6i
	TXKMc3EtYXTjhYfqov3F0CR7bEx+fZLDJIdq7Q
X-Received: by 2002:a05:690e:d07:b0:64a:efe4:7b47 with SMTP id 956f58d0204a3-64aefe47ebcmr2613048d50.83.1770734959965;
        Tue, 10 Feb 2026 06:49:19 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:7e95:428c:8802:872e])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64acd247ee5sm12086263d50.6.2026.02.10.06.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 06:49:18 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: jonas@kwiboo.se,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v3 3/4] dt-bindings: arm: rockchip: Add Omega4 Evaluation board
Date: Tue, 10 Feb 2026 11:48:44 -0300
Message-Id: <20260210144845.317048-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210144845.317048-1-festevam@gmail.com>
References: <20260210144845.317048-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_064921_407369_0E690F71 
X-CRM114-Status: GOOD (  10.04  )
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

Onion Omega4 board is a board based on the RV1103B SoC.

Document its compatible.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Changes since v1:
- Split it in the EVB and SoM dtsi.

 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index d496421dbd87..409c11b8ff97 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -802,6 +802,12 @@ properties:
           - const: netxeon,r89
           - const: rockchip,rk3288
 
+      - description: Onion Omega4 Evaluation board
+        items:
+          - const: onion,rv1103b-omega4-evb
+          - const: onion,rv1103b-omega4
+          - const: rockchip,rv1103b
+
       - description: OPEN AI LAB EAIDK-610
         items:
           - const: openailab,eaidk-610
-- 
2.34.1


