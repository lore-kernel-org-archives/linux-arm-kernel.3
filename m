Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503D0C43602
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 22:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rjb/FajtBjMgnlv1ralDNgBE434bxvgdfvleOUHgX58=; b=2QVGrsEP1AU8laxC6j2zwRGqUU
	rxJnDKQ9ku1B56D06CMXAB+bzWI0smvMYUlNqn8ZsKnwcFeIBdSP74RvxLxVxZF2TH9KY9KO4dhwz
	XpmkSFIIgBvPuN+MPMWdJ3WfjBl6ENmQGMgsrD6OiDg+Mzp68evlAp5KskdQvn2xyBwDduiDwdasg
	fpoyorgtomU7FTOZegMmmVrN4UQ1rQYF1hwFAGVdeuq451zDSE+k3z3SQaG2JpTZvAQPWWoneAiw8
	/xHwa+tCPReK/N4icFL+CtefDGs1rwp4nXvO3+0j1E31yeIoRCmdKkHV6kwlV28BTBrvwWkHpoxGH
	KJLHGxow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdbyk-0000000CoQn-1h7C;
	Sat, 27 Jun 2026 22:58:26 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdbyh-0000000CoQ1-0ExD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 22:58:25 +0000
Received: by mail-pg1-x542.google.com with SMTP id 41be03b00d2f7-c96c92c0980so87180a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Jun 2026 15:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782601102; x=1783205902; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rjb/FajtBjMgnlv1ralDNgBE434bxvgdfvleOUHgX58=;
        b=XWwbjjLdCiTprvDyi45Gj21iS2QINc2CK7vqPAso5M0fNIs4D2fDA22MbhFP18w5jb
         uAS4PvkjijskGxqrDREffc4oxcciaUZmWUP2c29D1ULYAMvMsZSb6u8vDfJLdD5fYlIH
         6JmeZaaGkNeLh2T1YgcxX6yrV8rkrZKP2C665BZ4H/EPLYrE+3cVAkN/emj9fSMYlY4I
         WoT7NR1lJgw+3hXyk8c4EQwQ/zv9fE56Um/AKVbMii98TIuVs8Koo3y4x5sbtrv+lUDJ
         cPxBo5wgjVjZYo7mg89vZbR7/h4aeb3Ljp4W5rmbZozEfT6Cth7Mbp2SZ7MKFKs3EzEe
         mFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782601102; x=1783205902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjb/FajtBjMgnlv1ralDNgBE434bxvgdfvleOUHgX58=;
        b=Jc7o5JZfqAJamMWUNGzJ9Fp1cq5IFu/BmuzczaMJJ2skHzp6ORip/1BGklbQ+dVWH9
         HWK2GCEuHEvG0/ckcL+vrZvYIGLl5fDL8VXq0ZEY3u5ssbARg1VSDuLfqSe38ExEEuvb
         nYoRJNQZuslLWwpdh9UR21+8A6kxeVpl0rxQ+c7YJRCKDCG+aN1Nr1+CcEFgduz5cewn
         yzZ0zl8tP5cTU3aixIMqIRlKDS2Yp5j8IJBVOn9wOiey6i0U13zZyeKnJFxEDnaLH1d6
         b3zi2anszo0zzZrZXIQ5awlRySbj4IK0wMBP6+baQjqmk+N6TV1u9bWGIBX+hssFR4LQ
         cgGQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNby6VW5AKpIeYRNo8EqqADS+2t3qa9Fhgk75Zqoti8BDclCqTvu8JlKwiihj7rGun5xSM7oECzPmFu6zbyQS7@lists.infradead.org
X-Gm-Message-State: AOJu0YxexrnYrUNpFXKAj6BkO2m9oOtEEtDF/2HP5hgn0MSAFsrWD7AS
	wiNhJ2ghVQZtrGerah8V3aCFsqg7yTIU9u05keN/MGG+QSXY0qm9XnC2
X-Gm-Gg: AfdE7cmGdogANzBRlwaBHyPaV6Npf0AxsfTe5sZ7wWRPsakHX9qZNReVYwn+zFPD3Jx
	Hqu6M8vwrrTYCzt2kCBrQofyeoWzD9JHlH6mbUbBZUd34pzoD9wAUUytzX/lgmBHfw9Z8D5EQMV
	+0fn7DkE9G5MNNP5PPfJBj7ch8jqKmBthjB1Pz6gYKtr3ssf1DuD4t4qHjO6EII3YySt4dv7LgM
	oJY4Bq2G6q0T3yDwVgliysG6CXCSmUi6zl3yc9WZvbyQgasA89CvWQ/qVqU+TUYQU/Y9MXE+RCl
	Sbta3/VoXWd2rSY1EX+5NY8wjNfqn2WVquI8IehcyRzCbrJkDlEwGgqc/xGCbXtRvRJyD1MpMLw
	zQwwtjKJ1JkMwaQdHQFFrILps9yxDsWLibce0P2YYYUSH93teNPV3jvySyojPrPOe8g4VjnYx/R
	mDhC4fV0mQYl4=
X-Received: by 2002:a17:90b:4acd:b0:36b:93f7:a903 with SMTP id 98e67ed59e1d1-37dfa25a0d4mr12186003a91.18.1782601101601;
        Sat, 27 Jun 2026 15:58:21 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37df3b0ee6esm6313693a91.6.2026.06.27.15.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 15:58:21 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add graperain
Date: Sun, 28 Jun 2026 06:57:54 +0800
Message-ID: <20260627225755.1710837-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_155823_088486_2EE8C710 
X-CRM114-Status: UNSURE (   8.63  )
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

Add graperain to the vendor prefixes.

Link: https://www.graperain.cn/ (China)
Link: https://www.graperain.com/ (Global)

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f36..641a37c0d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -682,6 +682,8 @@ patternProperties:
     description: Goramo Gorecki
   "^gplus,.*":
     description: GPLUS
+  "^graperain,.*":
+    description: Shenzhen Graperain Technology Co., Ltd.
   "^grinn,.*":
     description: Grinn
   "^grmn,.*":
-- 
2.47.3


