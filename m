Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AFFEF99CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 02:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TzRCi/w8UauYNvGrp56yDPR9f/IQ83oBSYIApP5ggfc=; b=d0fJR2cg52iHF5lv0XpsWuMdh9
	LEYJnQQ/dXTAwpI9FWNBdDoFFbzDj3dttATt4l0o0Zd5v8onxFgYiEYNIosxqQ5m14Q1VIgKDhol3
	Mz4vyhHW6nsEn6X3YMGanM7DkwtcWVJHtXcEqQAOqWBOsUvVU9IncbEpv0qZvvwH9lBicEl+s3CGq
	ZNPYqDCo6I+iK01W6MeEFW0KMr7gOj2UEhGmk+r9u2lB4p9UspTIqRHQHUtczH7CcdFRaxRYYHI9I
	QlSNoPWFvkJdW1OyZv8lIEhZsB4vcMwHfb40m6UDNewgn8ET7XgPZ5owFG02pWETuCsPQLUv2FTPl
	QhDf9DEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr5EE-000000049WX-2X0J;
	Sat, 14 Feb 2026 02:17:50 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr5EA-000000049UK-3oUu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 02:17:47 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4362197d174so1001258f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 18:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771035465; x=1771640265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzRCi/w8UauYNvGrp56yDPR9f/IQ83oBSYIApP5ggfc=;
        b=KMarYU4EMGbUmLE2srmcCn1Fs+RaF1svZSTV/l/ZSUtbdNLv7seXfB0+h4qiaRjVc5
         eenPVYUH7TaWPGy5C/B3af0wQZbiWY1YFXZk4BdAxvur5kbG3rO+yXrUEugsUVTjnPoy
         0uXZ2CHVZH2wQNhVzYthQ4+Hf7BJmbj7JjFg9G6TLKHd0zHShHig2+4USGs0jLKYR+y4
         JCEwMtnI18FZYnu8Xi1BT+muFwHx5XmWzfaZheoDV0xHu2VxuqAIua7CVky8cJtqoXe5
         c1yq3Xkt+PLJKkz5fXAUppodgBvk+Qn7fFawQj/wlHTyFqO8/PvvXmp/50w4WHDpeUh6
         5wBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771035465; x=1771640265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TzRCi/w8UauYNvGrp56yDPR9f/IQ83oBSYIApP5ggfc=;
        b=axqTpPaUk9nXJXJZEo1MaNJBYHEIJ5fN+/oAUTP4wjsuzdvnQLWtBizBUQ50z1F2Qv
         E4YIjSX4TBMmJGuBS45zdCufz4Rgyx0CwczfKJNTQPq7JBh3oQQ9Rd8XtC74DB85Zpn6
         D1Ot5T3+BIqa6LZy7F5z4flq4BhNdBxd9jdiwkbSEg9HH2WS3sjX4UGPauyWOjvTQk6e
         1URvdLq55GfQntHWyOi16o+q3hfF/8iUgndc4Uv6YhYQv9gIpvYIizT0TPdn7zGgUBu6
         gf71Agw/FMnUFPjpEdSExuqhCH045PBQ7Cd81iIv+yXjp93ZWZ8WEl1usv44adBvaX9l
         kOXw==
X-Forwarded-Encrypted: i=1; AJvYcCXd3hYDBIYpA4h/U0bQDzl0TQ+wvl8iGtCkZXSy7SDUWY6LorXU9pH+EBVMLdqOIyxeo4YCjMHWwE6Z3I/JcJMu@lists.infradead.org
X-Gm-Message-State: AOJu0YxLuVktPJC1Qc2V1PszF0jzYKkaYoHJufte+fwKqGkxKux7Cubx
	H/v+JooELyGYGweGSaB9ssEYCWh12T/hQGbW6ldaEnid70yIl/ZEet4W
X-Gm-Gg: AZuq6aJPp4PYSCJZ/RNcC0AJulrefleL7tPBOIyZp1mJmVCk6/RdYd2Vc2Vhzac+CVk
	5ZxpdHVbDzLIzLq9VZYnysmlKul2yb/rXQi35lmI/kyV4xdy6RsEj4R8fzopPlZWhfbMbkB7bi4
	ztKLpqy0mGpuWMuNlu3pvvQ1N6oDcjg5seyl/ZUMtukyQMs8pFAMNHBpnUsacLjHP60Ljbghj5d
	poAgr57/MybMtJxvhXlx9tAzLRHJDXdiv6fxVXRfrIrvmdPy5dyEcSVcIb4GSSDIIGG59klwEBn
	HFd7AAhJn/Rf+wmzRN1GHL+2BmiIKpCwOmZolUnyvYq4xXuJLO0VlT6uH2PIjbO9BTrxxATqEg6
	JPbiaRCa41m021FXlrTyWOCrZk5WYEReX0bZE56KFQ2lapywfeREOap8ffMjgmf8IKulMfY3tv9
	G5SZXtoLBg/zqgr4UkPQQI
X-Received: by 2002:a05:6000:1a8b:b0:435:dba0:736c with SMTP id ffacd0b85a97d-43797927177mr8537551f8f.56.1771035464830;
        Fri, 13 Feb 2026 18:17:44 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a53:6b71::1002])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796acffcesm8608308f8f.37.2026.02.13.18.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 18:17:44 -0800 (PST)
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
	andyshrk@163.com,
	jonas@kwiboo.se,
	Jun Yan <jerrysteve1101@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/3] dt-bindings: vendor-prefixes: Add Shenzhen OneThing Technologies Co., Ltd.
Date: Sat, 14 Feb 2026 10:17:14 +0800
Message-ID: <20260214021719.620752-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260214021719.620752-1-jerrysteve1101@gmail.com>
References: <20260214021719.620752-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_181746_954267_9D46CA1D 
X-CRM114-Status: UNSURE (   8.71  )
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2aec2a..484df0b7723b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1187,6 +1187,8 @@ patternProperties:
     description: One Laptop Per Child
   "^oneplus,.*":
     description: OnePlus Technology (Shenzhen) Co., Ltd.
+  "^onething,.*":
+    description: Shenzhen OneThing Technologies Co., Ltd.
   "^onie,.*":
     description: Open Network Install Environment group
   "^onion,.*":
-- 
2.53.0


