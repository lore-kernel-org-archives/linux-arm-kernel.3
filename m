Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AE6C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 21:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHff/oT7sQk2aOClrUOYHK15KjAUKpAGfLp7PK5vDVQ=; b=HqKaNyN0KUkRvRYTN9TvG5ytzA
	fjcckMTcUtELHQgVXw3z5K1GGN+XHVSBEgAWm7On7cRiHuhW8U0x2asynqfpeI5nxSHwhDZLEWjGp
	rH44yzE6KIZIjJ4rWdKaY2QLjJbgic0PgZZHOZdL6uWhB3XtGFtY2QI98zfhMp8ThM0OgjoYldhjd
	Kk19WS2TNRjbGqBOlCtFTZGATh5Nz/YVoKu5AViwzQbMmSXik0nYXrBo3RLGskabc5/7+Zzya/xdJ
	LxFUCAmZEZIslfPBgteHx5A6jsGfpwsFmZTcX2sNFGnG96ZXhrB2Ysz96/9YbdpkLjPF6su2Hg1BT
	ukdM5G7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEb1W-0000000AlvQ-2YO3;
	Mon, 12 May 2025 21:49:22 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEai2-0000000AimH-1nBW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 21:29:15 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5f62d3ed994so1543447a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 14:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085353; x=1747690153; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHff/oT7sQk2aOClrUOYHK15KjAUKpAGfLp7PK5vDVQ=;
        b=VBYsLKid3UQ8tr8LZnOmVbeB9U096PszJegXHiQLZ7d3w89GIH/fmyFIPpNvM9B3/z
         MxtbUPQVDmMl8wuRGeqkvYMdR2zJE6lcGxLp5cfjSjTqRQLmuonHGhkMYXJ+6FWXwIYK
         FkSVW0a17TivOYP1zVMeZiquHs29h6hgNQGXWo/9KNmo/7df2VWdKvLbe8CtKRlvP6pb
         kjUeRHe61m1nitfdNqZf7g87dJz6upxZx60t6jBPwQjp69dwskDy6weGdol0y4csrlTI
         6NJgrTkKDbW7Qz+F9HRnus6Pse/O6hbWkW3w/+a4WuodxN13nMCfgMWhfHY8M25AfMHD
         g8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085353; x=1747690153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHff/oT7sQk2aOClrUOYHK15KjAUKpAGfLp7PK5vDVQ=;
        b=V4j6O/BoS9FTPkjB3GnfzE0WbeqqLTyIPlu3x/qWf+GbrE02K1+WrzJj4q0v+B8ElE
         2E3UA11R3Dv0et72Q4PQBzOltUErnpmfsLq6QFsgrp+eCrS9bp2j9GS6GwPTmlm4TGZe
         Vtpi6UAgMDiAHfPoWk1/z56Fp9YwguiKloMRxre/FnqtB2+w2DKh2TwWustBian/KSr2
         al9t0IoS7Mnd7auGTfSEykhk75A6N/3VHtF9lIqk555UAigzdZZLRoJP3ihBcYjGRJEt
         nC2Rdo0sDOsxP8ppwoC3o349gOPukSbs4IMQde7LF6YqE08S+Ex2hRfx8T5Q7fUNUYvT
         LQRw==
X-Forwarded-Encrypted: i=1; AJvYcCW246Kos46zw+SprLwRgCS3E7Mqsgukm4o8WCgxlQbld3er4geN0Hgf8wqoMEByTDkvlR9RCF4X486Wd2Yi56s6@lists.infradead.org
X-Gm-Message-State: AOJu0YysnKJcxZ+YnWrR6HcdwQy33+q+PuNQ1eHxuj15K4zLVoNWnb0+
	We93Bcg8hSaplCTlyAFvJoftc62wpGXN44owx75U8BVbZSPYrBLA
X-Gm-Gg: ASbGncubKNPwBF8Zk47GTStqaGgW2bM+RfZRD0xBx1KpCJVpJmDROgkoidxtfjicHX+
	p1+WGwU7aiF7iFWusVsPkyMEyuxzU0O/hGWItjA2bDpY+i4dpDVDvHsIWNCp1MyErGN4SYIv8Mk
	3HMxC8P43HhVkArtHwcXLBnqECOjeYM94eHNhgw22KIaOOoO6lc3RUh4hiT5w5i1gSRJWAFYmR1
	0+TWZYdFMP9kXy26fS4KgorelI98CMtPDdJve1z4osrmxaiXH1Fe59YcLHsVEO6N/OLqnvXWqKA
	Fp6SJ27ngNjmogU5IYPWbL8DzU0Q0eoDxI2JD48l8kukVPqtsAtUqcxYSl3PCCs=
X-Google-Smtp-Source: AGHT+IEn/Ow2gvZ4FE7aKd+7Z9RkGF19BSAk0UsqyhXis2AK9rexBmvFZbe0MFYZuKP4CsSSd+al+A==
X-Received: by 2002:a17:907:6a13:b0:ace:f2c2:5a4 with SMTP id a640c23a62f3a-ad218f072e0mr1388653166b.13.1747085352861;
        Mon, 12 May 2025 14:29:12 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:12 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 09/19] dt-bindings: media: i2c: max96712: add support for POC supplies
Date: Tue, 13 May 2025 00:28:18 +0300
Message-ID: <20250512212832.3674722-10-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_142914_467258_799E6813 
X-CRM114-Status: GOOD (  11.69  )
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

The GMSL links can carry power to the serializer when using coaxial
cables.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 758c0223977d..b345305acc4c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -96,6 +96,10 @@ properties:
       - required: [port@6]
       - required: [port@7]
 
+patternProperties:
+  '^port[0-3]-poc-supply$':
+    description: Regulator providing Power over Coax for GMSL ports
+
 required:
   - compatible
   - reg
-- 
2.49.0


