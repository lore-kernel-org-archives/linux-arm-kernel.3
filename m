Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC4FC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 14:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Utu49gZ9ZdunlufpSNh+aHZgAg6knuxu1sYPi3U69A=; b=l+qcI+SM9DXcLYKyDUGnOMCqtv
	4Uhq+ZrgRba6w52dpV/2IWf3xqtTKkBQ++UUdP43hpUVvsxmao3rtwsPpsjknMwl2LA46999dTzUN
	h3WKa11J+1mQZh25gFeQL1GwVM7Q+qjzLBUFVt4kdOqFGxcnZpucoBPqWtZfHIG7ytn4E5jVnZC2P
	eZU7srI4bc0OZVnuEd1RSkCLGPOvlYR8jhC7dJp2zLHCQcGoOxx+E7d7Nq4t6FPIXxdJSiGFpDYRQ
	+laPkDmkOi2/G3UHM6eYfnMgfpUWeh22HiPp9ima5GMUNgfdx9t1m+XIz5RQnE/czzMtYhHj4o3an
	zfhxCF6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWynp-00000008gJE-0csf;
	Wed, 02 Jul 2025 14:51:13 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxOv-00000008QqE-2Zl9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:21:26 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ae36e88a5daso883247966b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 06:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462484; x=1752067284; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Utu49gZ9ZdunlufpSNh+aHZgAg6knuxu1sYPi3U69A=;
        b=VVZXt4oHCGUQNlm3erMLNj+XeInRPGLKQrvD07FAC4NDHD1GmqQSUQz8qFTstaCpNB
         1oQYZYtRdoFRONfMS+9PjAU/h1y0ZYlNvD7wNQ+dGz8kFplbhOBYQsBwAQP+70+Xs9Gu
         rCj6GgzVsLIzho7rNHhRHoSBFSwej2vlXEtnI/436XSAgfUn5cCkL6JizeyczA1BhxIi
         rMxtkJ7W2V49CwXicwiHSjUPkve0zNvpWjbpCJRHowCFchn54tJqC/4nfM0+mS72z02A
         0jy4PF9NJjgieC6njstwi+kZM/eecOSZjK8jnAeQ6/cVT8JkqiPyDTEEThk8WU/K3d4b
         NEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462484; x=1752067284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Utu49gZ9ZdunlufpSNh+aHZgAg6knuxu1sYPi3U69A=;
        b=w+qFMPBIjUtLRqAYJ21T0EPDK8Bl3gr0OJyXxMvMK5wQObOJX1LNW3DYoIaYw698Fd
         32pANZUWX55+2kOLgPxQpEGgDdGo20uXhOd5hvJzFOF7TyUPZwdK1VS9nb0Od1kwLgpO
         zidTlLPQc1WZgUL5swv7QUuYSiE6n3ZQW8Cr1y6ju4uBVmtpQxUnbnc/ztH9xlVuFYWh
         z1Bb4yPgMOveuz0IL9n/BEsKZxvcVYMTdaJDUZ9jgS2QgHp8dXz/yKfVggnYceiMDJTN
         tkrnNjL/Wf28KDv3Grfh4DNfj7fv8vf2OPSrE0a3U8lu9ZAH4KMerm8mCMMX7733nc/j
         tvXw==
X-Forwarded-Encrypted: i=1; AJvYcCXNdu2E7R5YHRmXZGybTFvFWO3NARVooE1A/L7s5BG/nLDdYNqciOnnEfCzw1Opm+Be2E3ullOG2bfZpGxoSO31@lists.infradead.org
X-Gm-Message-State: AOJu0YzRkauPPe/OHnkt4a6BoBmOHKh1SshN48ZSvRi9/7d/xiP/pIAH
	8j+51eKHstH0SJM8P9wjR6YgnpRhNSGxteI/hqHoixMi/cKHMKz2WT4X
X-Gm-Gg: ASbGnctI5w6WtAGPT4GaYIn+tcqJ/7dHxia7wGX1BR3HrzsSMlANERqdkO8Z1EeXUHk
	59PGIgmIuNgrF+ixzvornXeqWwvFnHLrfa53MDlQ27V+Ri6UGUnGQ8jJYzzSLNmyWS+T0vwyPQw
	tXO+TjBJ2vLlFInFnCpv5/qUzAfuwk/Cap0mEzxuHqdp2qAecSt1jsumjFcT31ZDv42L4q8aiZf
	AnkCU9trd4kAU1mkYQq0lWoq8gPq29oxrrWNNbk3bpyxNLWd8Yu8/P6BvP8dG0jjmvHtX2CsRUi
	IICPDq/ug/5P0PrgkTCv5ksp+r4b5641QHX7v5wxaWrNZ2wlzius7PmRk9nwCRs9hFThcQ5dJTg
	=
X-Google-Smtp-Source: AGHT+IEqn7Qm1Pzei4IQRz8Ezf9TTzuTp38w4YNOcsq9Mh7+jeMr6GzuX1TetleMO9Y8z6HK2C40Sw==
X-Received: by 2002:a17:907:948c:b0:ae0:be38:64bf with SMTP id a640c23a62f3a-ae3c2e668d3mr292897166b.58.1751462483818;
        Wed, 02 Jul 2025 06:21:23 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:23 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v5 06/24] dt-bindings: media: i2c: max96717: add support for MAX96793
Date: Wed,  2 Jul 2025 16:20:32 +0300
Message-ID: <20250702132104.1537926-7-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_062125_655028_4F2FCB49 
X-CRM114-Status: GOOD (  11.37  )
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

MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
links.

Document this compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 78ecbab8205a..02a44db98285 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -30,6 +30,8 @@ description:
 
   MAX9295A only supports pixel mode.
 
+  MAX96793 also supports GMSL3 mode.
+
 properties:
   compatible:
     oneOf:
@@ -39,6 +41,7 @@ properties:
       - items:
           - enum:
               - maxim,max96717
+              - maxim,max96793
           - const: maxim,max96717f
 
   '#gpio-cells':
-- 
2.50.0


