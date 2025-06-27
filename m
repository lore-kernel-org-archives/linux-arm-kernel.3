Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F68AC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 03:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKbBTi7IDp31OkTJ6cIcfFVheRI1s9qIcPf1iWX2qRU=; b=MelFOEY43ci2+2i7JCif544n42
	5XvOHgUu5v9veuSyUIByHGohNISkk8gMusQQnkwDkpfzgnTk4WTQcsYcLnovb5coF5zPLAa5RrY8R
	GkIB8K118Bk6SBM2PgD7oA6DEAbCzwR5Tut88FTucdH4FYPHzCAEOi9StanEfCAdwKpQ08Y3wGOXF
	iiy/ARkuLfurBDMMT0d2noW4uWfMaUJMKv1CCZ9DW+7eKD6VLJqUtm+9svFndiHv8qyyYQoQEW9F2
	dYYwW/wIplWgWGxJ7h1PfnjQYhflkYCbzDTeNQQ5fQXt4d13lB29pDbOlyuPoPTa95gwpEmTeVo5i
	8JfiIVYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUzOG-0000000DPZ6-3vY4;
	Fri, 27 Jun 2025 03:04:36 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUzJf-0000000DP9C-1ID1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 02:59:52 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b321bd36a41so1359446a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 19:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750993190; x=1751597990; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKbBTi7IDp31OkTJ6cIcfFVheRI1s9qIcPf1iWX2qRU=;
        b=IvT8ZyR2HcoVvA+jY7ybkdgmdlusm0QZ+xC6Wbb2PzYtAGrs6IuvY+2pEBUeqMd0Fk
         F50MrKZlsZLk3OiOQETMYUnR0jSYsN7yQhD8HOsYlqMoeAtSv6SWUYFEg5plxgbRl5zn
         HgjSRcInvrnZqEB8TY3XSWgmKWDI9ZdbhNDqFKJiW4LojKjOVHNCIoxepLAw+YzDm6lx
         /5b7r2UoDsUeYkFvPw+e3oLMzwM6tQIJ6xSQtc9EsU/kizT3x9RUo3Fyv+/K1rtytX0G
         hIkbPygfYwH94F9ARpJgvPzhV+tBZG2hl7Dwgb71TnmXd5SqfcgNTQl80WhIVLpQb3Jl
         FjmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750993190; x=1751597990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKbBTi7IDp31OkTJ6cIcfFVheRI1s9qIcPf1iWX2qRU=;
        b=kTL9hWKQITIELAsIdwAZbFLgkkf3xkDBu0ExmrXAEc7g3d/SR3Q9SuRwZem+8MowyO
         g1W83E5A91k4wtbVWtUMP12iIwwsV+GVICKvJKPaJDbqJftOZRdJNCDFV/3eIGX9HGMS
         p0cxvESHiaPpIGcOhpfXiyyDvFrlIhjHm7q+hHX6Elswi9myw+bXsvqQBmdsBYFH88Bq
         nbDIOH3hdvUEiNioi0dzyx3lLUQpreoWMXvcMk131e1jIxGRNyHs6PGpSUXie0sMObeP
         WvU9cpbfIktd+8oM/Qy/xwas9oTgk1s/4MO01j9L5oFniVQ2dwQOM0eBmt6uKlU7bxBP
         ip/w==
X-Forwarded-Encrypted: i=1; AJvYcCUvFTlrKkDe1yITCFpFqJeQK+qsQQ8djSgoV/PtsD5L9JBocRKm2h5iNiz5b2LZQQamyAk/gZ5KTnxnHHrSByVm@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9GaBizSIB9M16GSAcD4k94d7gyWnIkC4qt2ivjSu8GXYDpU6g
	2Qjmm0hntVJ4uBm2XVmJ06tBigBixu1Oe77zuyMN7ohkEqWO0ezkfqCB
X-Gm-Gg: ASbGncvTXA5aiqX0CwC46BTSHBP6xTYW+j6A7ff/oIWs3yDWv7u0zkMIjYKHSFEAKRy
	kiMagoa9pBaEM1lOzKXpn2ZQ8J19/2lg1Z3/tBp4/w8lC75MYla48u9CWWi67WhRZYTQMvwyYBL
	ibH7wHeXHzhm0y8vOHP2fk6CiaNuGqqRWLFcVvO0sh6V10FW3P5leDjEox2HR+gIkPXSydiP5Cq
	SGLWPKxVxxcV/6aKJfOWGtLUUsK3RxytCy4S+njMdMz9zcmWp0oEFVh79NiptNHlxthd2xsyFTo
	dlTFAyL6qM5Ti8H1Ig67tmTyOJ9LajZpDkjHP+Dwy2CXVdHjnVVMfwdO0yMUZWMw/taIEmpruGk
	6oNw3YrMgz3xR6u/5gUKQlIimzgVhU1q8XHrhOm049Q==
X-Google-Smtp-Source: AGHT+IGKG91ljITMzoVCW+bBbL43wOYsdAmeiGbGiZjPAqk6qOf9V5tPOGCVNlv/03ppyEr4tpG14w==
X-Received: by 2002:a17:90b:5212:b0:311:e731:523a with SMTP id 98e67ed59e1d1-318c8ee570fmr2178372a91.11.1750993190514;
        Thu, 26 Jun 2025 19:59:50 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5426bd9sm5358186a91.27.2025.06.26.19.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 19:59:50 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Fri, 27 Jun 2025 10:59:02 +0800
Subject: [PATCH v4 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-add-support-for-meta-clemente-bmc-v4-1-ce7ff23460c4@fii-foxconn.com>
References: <20250627-add-support-for-meta-clemente-bmc-v4-0-ce7ff23460c4@fii-foxconn.com>
In-Reply-To: <20250627-add-support-for-meta-clemente-bmc-v4-0-ce7ff23460c4@fii-foxconn.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 bruce.jy.hung@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 Leo Wang <leo.jt.wang@fii-foxconn.com>, Leo Wang <leo.jt.wang@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750993183; l=886;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=jaJuRFuiQIpQeCgkDZC/ZckoYXAyyJRWtir3QL+VwYw=;
 b=AYHEHTRIFy88S1GjWZDWK5NLlxMnwupBgtb6qjRHYkPO4trM6o6fQKG9w+vESOZJ2Pi2UwYu3
 5RmXtrrudpSDo/PwJ0dJJo50AxHwE3iiQYAc+uKcT3OqY9VjtELAt4s
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_195951_354708_D2232717 
X-CRM114-Status: UNSURE (   9.91  )
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

From: Leo Wang <leo.jt.wang@gmail.com>

Document the new compatibles used on Meta Clemente.

Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fbb076582a6c0e801903c3500b459f..ff3fea63cecd99ec2dc56d3cf71403f897681a98 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
+              - facebook,clemente-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc

-- 
2.43.0


