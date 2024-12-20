Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DA0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 12:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oK8cRe+fHR1VWCxiDadEgLXPU4PatzYvmC0Gyvp01XQ=; b=ZRER1EDd+HaUXnz8UgNylm6OHD
	7fyiFIgHWY13tUXIinmtdZGQeX+0HJdkNpa01n1QNAzTbWkQm4bMiib3mWkDitPaT7aDSPWmVnXzw
	0T85T4ONlWULWZ1wFHOvM9LB4ZMAjD9f0YPaluEWjDree4TEbDGHeh25XeEM9gYKcYk0FBzdb/n+d
	xQGURddbuUTZ2SQdsXYuVfxHbC00dWKjt3jLzgvQyzeQsyzeiEOAIUsFLzAhz/HYR8oy9tZ0WofNk
	mfcWsSqypXLJQhHs4irBK4ChoaE6rD1LxJvn5FrpYSXqX8IH3AeZ3/PvFl5LG24zhrqRMhnfn5SjO
	MtRLoajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObha-00000004qLm-3Td3;
	Fri, 20 Dec 2024 12:01:54 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tObgR-00000004qHO-37hK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 12:00:44 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-385eed29d17so944672f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 04:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734696042; x=1735300842; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oK8cRe+fHR1VWCxiDadEgLXPU4PatzYvmC0Gyvp01XQ=;
        b=JAxUbxt8SPeXfEsHLRNMVdUTsEixrmFauQOuXiC1E+jDJtzObSYHCMXbLw5zznfHX9
         UkKYpxUFF2Yg1FFPZcEfIWGWNPJOos0fanUEa6kJfZt0vN2TsNaVL4BFwrQbqKBSTAgY
         Hwtpi/zTvC4WKie4GtksnTtO4Iq/HKnEiJHBOoeKxxN76hknuhCHCOu7eISt7UpFGrJN
         Zr2xvkjCqz0cy8uiJqTOf9tj3y+zE4Slbuyn9Pt6La7S/XC7x/Q3Ifw3fNjssb8URFA5
         JFDzv7fGvtNnsui61ee++Ji97Uc1GEoIgKXdi5rCpDItERmUl6S49b/BjysNZbSMB7FX
         yP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734696042; x=1735300842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oK8cRe+fHR1VWCxiDadEgLXPU4PatzYvmC0Gyvp01XQ=;
        b=lGYQP2yMG0E8fVEOfJI7RDpGoWbGTURh79VEzhLmzaA4md/1JYU+4QJa+brAdr5hmx
         p82Rkhbg3z0vzXzWXXJfqE3Dc3UpNTxh8XZ+yQkoV5cwfun7uMPOEN4h83jZSrY9mSHI
         3DZMeX6vTZhSYlc3GxMtkhnii/hB5sRZsUEGaYE7CBVAURrbXl79t2h3KaVCeH2lLRJC
         bpdPkA0ynsJqIF5Ti+QksIIN2YPKPnEJLzYEk9DgJTFVSCkpYfpvE3zC7PtiFo435xjn
         BIsHQoXkvqQRupvwlGUoff5iTF3GDfk9T3qejK4OLiJNKVJnn14qFZ4M972JaS9BuqUb
         BAQA==
X-Forwarded-Encrypted: i=1; AJvYcCVBxg60u5LKZWKCDT0g3fmVGVIiUtIY3QqYj7gqeJAxWi028v9ulRyPjKRXJYrMwWJOXJELxqfTXupvuKBQ+2Ec@lists.infradead.org
X-Gm-Message-State: AOJu0YyTl/cwZTFtHhMrFg2GT55fcdflhlkhHV3U8ZjSnIonAt46Zmlu
	p5qkRhqX3AtFOmfv2RSqF8vN8b4a2xhfz4Bc4xQehW+tpplx9dDqdLbJn/gy
X-Gm-Gg: ASbGncuIJQSYZ0LOgAA2nb465FoHvNil3AMerR22/PYqq/+7YcUUibUsrn+UavW/jaf
	R9vAB7+q5aa0/n08rAGvgJkxRrfKUYPDeQFlTFER7mmTevku3dXDy8Or4e2e8UEnxVFn1JLIjGr
	8cEsjQAycuj5GLW58BsEgPnRchuwjesfrdq+sMKWS7NquTa2SiKzxGEoyF8X3/j0EfjoXKntYG/
	w6b44SvYFXitXF8JIkA1wG4RGtGFDVw2up9ENoRRQfePfugYuAhkb8st3E2pRAN7uByXtBCN2z9
	7i6D2rXx7ahi5cP71xkMKFgkdP4lzysXWQB49RH8yQmv6FNGfkQLkhKpTvNz3A==
X-Google-Smtp-Source: AGHT+IHGkBxd31pWu+xtwPWlWhzqK08a5e0QfwzpYag5XqwWVGkcAgvkQ2m1qj/zjZ9WwhUM2P+gTg==
X-Received: by 2002:a5d:648d:0:b0:388:da10:ff13 with SMTP id ffacd0b85a97d-38a221eaf55mr2906782f8f.21.1734696041476;
        Fri, 20 Dec 2024 04:00:41 -0800 (PST)
Received: from cypher.localdomain (e.b.8.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::8be])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c8b830csm3921038f8f.108.2024.12.20.04.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 04:00:41 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v2 0/2] Add support for WiFi/BT header on Pine64 A64
Date: Fri, 20 Dec 2024 12:00:29 +0000
Message-ID: <20241220120038.3137248-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_040043_783899_B10F8A1B 
X-CRM114-Status: UNSURE (   9.22  )
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

Add the BT and WiFi pins on the WiFi/BT header on the Pine64/Sopine
boards.

Changes in v2:
- drop patch that enables the WiFi module, it'll move to a overlay later

Peter Robinson (2):
  arm64: dts: allwinner: a64: Add WiFi/BT header on Pine64
  arm64: dts: allwinner: a64: Add WiFi/BT header on SoPine

 .../boot/dts/allwinner/sun50i-a64-pine64.dts  | 17 +++++++++++++
 .../allwinner/sun50i-a64-sopine-baseboard.dts | 24 +++++++++++++++++++
 2 files changed, 41 insertions(+)

-- 
2.47.1


