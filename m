Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BD1D7977D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 15:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAut55lNFkfH4Sk5JTUQKJAHX4+yf6NtX5ad7G5O33k=; b=E2myDh3oJV/IdW7aiaI9SjSnpG
	K/QNoGQYxcmirFesQqZKFarTrkT3pOwphMME2PsUzAl88ZB3q5Sg7ZMB/KOJYhgIbIf9L9XuyRZ8s
	avg3kcyCHrIqmX0Ek3zpgTijCuu/zAKnCbkG8pqySYzSqIsdqvKifltndifq2rOeToikCwKNQCpb3
	WwEMTh9nC/WDXgrs2i05GL6UM3IgKlu4gdH6AyNh44IiPlcKisfJvynLnsHIobrCst/bJVhtxM2Wn
	x77m6KzWbtyAYIuqtaiw6xMJMQOPQX/Xneq+oWWiO2adaXROO5OS4gXI1TVGy+iKapt6V2wfCcZBB
	6+qqx5nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmCwc-00000002kNb-0fYk;
	Sat, 31 Jan 2026 15:31:30 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmCwU-00000002kJo-477m
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 15:31:24 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-81f4f4d4822so1568350b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 07:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769873482; x=1770478282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAut55lNFkfH4Sk5JTUQKJAHX4+yf6NtX5ad7G5O33k=;
        b=IhnJHxVjljjCXfJgUByTQrc9PcUDJl1vTu2n0cCO3lqTpY7ifj3Cf1Jph0E8+eNd12
         Cn14iHa4oTFLLIzMB43sBpZWxt/vljxdIbrb64eoY+HUkTGhX/bgXvHtOGl2mUYxPuXr
         j8AR7gx5TFLPYLHCBFpG36orx/8O8X+L355mkAYIXr7Mx8fowWjqKd37LVRPa5XaD5Cz
         h0Rz1b3rAZaOU3n4XE1MXdkRxoncDlRnFW9r2/6r9sBdlSGwSAVr4yftpunNhX5sDurA
         M4WylRiREqN/IlahrDETGE7CL2JTmVNW6Qxs5/7oMAo4z2LIfV4veer+yMCRqnLsB91Z
         PkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769873482; x=1770478282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DAut55lNFkfH4Sk5JTUQKJAHX4+yf6NtX5ad7G5O33k=;
        b=P73eW8sPw8qw8ZEHK93AX56xozHVPylY96RMVPrBJ6DAKHhf4CECyOijbhKdA6PlTB
         hqE/vYyJ43qVl++P4m66TMrOD0y/oUfo3sMFcgbIeDWY14lZghlKbq7qg5I1TU2b8Q14
         5X5ZGzkuqKA4e+I5EViECVQ488NjmjTxCoZu9ktPPPclEE1gUkjZ7V+Oc/90n/peGz+z
         /ZR1dW98FNOahnNLM4c4stb4ECBFTGxVkQM8dJLmvvUNnlnQKSLM/zET97HeKCbJb3CF
         GG0mZHxLSWqrIETHbyItkFgf8XKI1Q4o/CAeMDcbCgNzbEhpYuxiLO+jWJKteMcDN4v4
         iwKg==
X-Forwarded-Encrypted: i=1; AJvYcCX4W3mhgh3Zko4JdMj/IUWLXYr2k3Bxdznpe1WwLNpeBb+uPg/RuuYtYrS+38L00MsL+gVesgpsu7XyiSPmOhIz@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd7yNswzTHM4Q7i4cmOlvGEvGTBItM8nOSDb8ahLv9TDfGQK9N
	TmQo/ftLy4oxS/zDCbBAP7ssnXhEFiVG16uK/nhgAs+s+W/dnCyGgTuf
X-Gm-Gg: AZuq6aJpPgA049x9ktKRzNmswKg1kOveY/zF7sVy2WvPsptTrlLi5rR9P1omkMt/lXK
	8AzCPNr5GvvgvvljdREt/gBDztKTQz6X0yGnPRPX/ovYwXAGdYFQb35PMcJaF+aYQHgIFD70+wP
	qKUQAbghDIid91yaIpGz19OUswHHAMqex3o/PZ5FPv0+qKeNgzkFrbOvrHKqtqeXpbuzY6Cxh+Y
	FzQcc5WbGPxX2YW3ufbk0FegBLROknpyHFpzyy1zYo3uB0iDP0Zn49Cg8sWDFmzrnEuQvSZUutK
	WAFvHbfa3Hh/DjzQ86qaqY14UiYJmHLy/SqJKJPhRdy4cuZGZ5m+w0nnjtJY+cK3tklZFRBz2C+
	hw6vwQXig8EjqjPXsUmyWBn/rsfqrNQ2hd/gyNTVMajSoomE+FYkPkciEE7fgHCW9U4BRf8WI5j
	RTRNPgseUqwiIWgQDkLklCfoRKZ+EyXKUh0tWNGQmvhTUjv6eF
X-Received: by 2002:a05:6a20:9396:b0:38e:90d3:49c5 with SMTP id adf61e73a8af0-392e01438aamr6048600637.53.1769873481898;
        Sat, 31 Jan 2026 07:31:21 -0800 (PST)
Received: from arch.localdomain (awork135098.netvigator.com. [219.76.135.98])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642487f1f5sm10701122a12.0.2026.01.31.07.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 07:31:21 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	alchark@gmail.com,
	dsimic@manjaro.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Shenzhen OneThing Technologies Co., Ltd.
Date: Sat, 31 Jan 2026 23:31:01 +0800
Message-ID: <20260131153106.31723-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131153106.31723-1-jerrysteve1101@gmail.com>
References: <20260131153106.31723-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_073123_017984_9AD3AD9C 
X-CRM114-Status: UNSURE (   8.97  )
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

OneThing is a company engaged in edge computing.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..49607cf2941e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1199,6 +1199,8 @@ patternProperties:
     description: One Laptop Per Child
   "^oneplus,.*":
     description: OnePlus Technology (Shenzhen) Co., Ltd.
+  "^onething,.*":
+    description: Shenzhen OneThing Technologies Co., Ltd.
   "^onie,.*":
     description: Open Network Install Environment group
   "^onion,.*":
-- 
2.52.0


