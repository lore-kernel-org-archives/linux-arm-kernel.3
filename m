Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50AEFEFB6C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dFaHfPFCueb/MdBlAyf2+ElEWghzCTWqL/iqfEI9oM=; b=n6eDIdxgurx87yXUZGpA24QALq
	vh/kc64JX1mVhvICUf2rYWxd+bzkyilv7Dm1nla4cMM8YGj134U8mRyG2R3NcSjlheVjZEd6Ssngv
	cSjzH437d8/BH6BgQJicVHGs54MLgheNxS3XSJOiAJpjvVs8+8nAoFvEE9rj3DSw+bfNejCuw+qMr
	GW6OuODmYmQRxYgz5GkfacTEAP4LP7BVKWaXOKy73QFtqwpHNOVyD+SL5D/PGTa7FXthIY++GGy/M
	+svOXxRKXJDyUDI0X55BV4Ka9QDYKmkM61kUMobmiFTD+K+mih/eGwxD9JFEj457txnE2Tk0au88b
	j36C95+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0ES-00000008h7C-1T5z;
	Fri, 27 Feb 2026 15:58:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0EN-00000008h4j-1yt2
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Feb 2026 15:58:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+dFaHfPFCueb/MdBlAyf2+ElEWghzCTWqL/iqfEI9oM=; b=SYvy+8RU/J5EFL7XXSG7NNWm88
	71EQM484ZaXORDZx1pg93hGHkQXuN6putG1I+GhQjL4Izh6OxpvQtIYLr8AymaEaBpc9q94XHCgF4
	t/Qe6ECxOGkGQavG0pnHRfvcbWPuQHSXmEJJwMdaVV9Nk4TbRvlEgJauglv++An+Y9kSPL/K6PouC
	6fie3sKfqDmeSqmaFfPm8zVYruF1RlFH8IWjgw70dg/7KxFNoM2lu8jjfvu/bra1W9SRiyLvtreN1
	plDrzfZK+sd5KX/RTR3Czn5BVzHsw+zwE2/sCIsm8BVDFgXbihQWf3OirczGqWRc6wW313RUCL9lM
	Z+uBzLSA==;
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0EI-0000000DRUW-1Ghq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:58:18 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2b6b0500e06so2843870eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 07:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772207891; x=1772812691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dFaHfPFCueb/MdBlAyf2+ElEWghzCTWqL/iqfEI9oM=;
        b=nOvVyDEZ871KLyLfPv7WnTHnMUwztNMOZSfE6JlWOUdMRqQ227dJ50bvACIzrJ6LZI
         JnoOe5I2kpxeLxbPEmYLkoxp2P+4f07cwkoxIXN6bAG4KkcNKdHZps/sSYg9lTpauHhS
         clMZQ28NPEfXN6OmmJ7eHJfG1I7ClXbnZyWr9VTLqRvDTfCydtIQTuyPK1o6xjlNZt0a
         daecNte/T+lNp1fKoRfpmKBn6gLPmutRZId6FovJ91j/27hJo+2npUia8czzF533naTX
         FDDyRLW1cMk+g8rri6rCr+hv7ioBQ7lu3vAXgl5dsEaNggm9SzEww2LUfYgFGEiqKmSY
         6Xng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772207891; x=1772812691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+dFaHfPFCueb/MdBlAyf2+ElEWghzCTWqL/iqfEI9oM=;
        b=V/G9hpL9g6Q60l4it4uRVEgWR7o8nAGthExXVEOsJMQl1wQgNue5Lkr/2f5WX25OQM
         To+OisPlAfKXdK7cwMegh/I0zlQ6adFHa4/OJwqRe8yARvoJEqOMl80tojJEyGQ20iZD
         eVbN2x1Pnb+zeTkyV7LEMx0REXp8E14u7qzjinAPJYuDmTtDaHAR9dKfLRzpOhaxaBEY
         CF9f+9mR+bYoc5UGA7hvpLGbcUZQh0AhtmvGrUaYLnIe4knlkCiIGReLkRtmCgQ1UpRf
         3QgCYlietUdqUXtMITyGNvHT2Z8u5e3H70l6yyCaAwm0sD7GlhkimoMttgL7/+VvF6lx
         HwHA==
X-Forwarded-Encrypted: i=1; AJvYcCV6yfDJ7WYvVhf1CeXn8IbNj7g6+ba/t/8rkBNvlE+nGMeBW0FRBuOYIcym8NtbbC7VRzBWB+rPYkAOZIhFa2jn@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq4kDKRBgxUKqQrSQATcLsEsBRWycUkQslknUbYZcpmXyAqWho
	3AW/fKGpbg03T4VR7GUXzhVxgl92FL3k+WfgYlAA4ggcUnTyWTDW99En
X-Gm-Gg: ATEYQzxxOVZjxAYBhTU3xTalfEUPfsozMK3fpP02HXaWLD0dcjTJHRLnfBxffONwdrF
	1S1K9nTh17XuEeODN9jJP67l8iZFht7pXT00gp025ukDIxfjFaha4dujCnmFT7QBehdN7nhvxRG
	ad/vf8HzQgrrbJ62o+44MUmp7BNZKOEPB3zdNeCnFGX9N4wVGAI19HO5m3QhW43xE7Uqc4S4ZK/
	l9oKZlrx7vWGDXJO4jAqeIMeY9TtQO6/xBNnsKwWReZQGyqKa3CMM46lJduhW2WAts5gJ6wZiQ1
	FmPp917LF8p9TfnJlUAdq71DQ1W5sienpprnkNqxV/rGxkbav0XpZZUScuo/joxZb8UrUqNITnC
	hYWfHvF5Ct0I9siJaOD2jdGM6/0FlhyIfqdmoDuPU8zZcCl85FBwwu6Pa/tfAu1PROPXmoEYKmm
	zbZlcBeUVprPG/PUaBAKKivmz+2FYD1oZCK2bSG/RupwHGEEpafmiSO+UiYGsDkBsUQ/JTnnrF
X-Received: by 2002:a05:7300:ed18:b0:2b8:2910:dc9b with SMTP id 5a478bee46e88-2bde1bb2712mr1314460eec.3.1772207891266;
        Fri, 27 Feb 2026 07:58:11 -0800 (PST)
Received: from arch.localdomain ([149.34.251.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1cf0115sm3833508eec.8.2026.02.27.07.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:58:10 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Beijing Ultrapower Software Co., Ltd.
Date: Fri, 27 Feb 2026 23:57:58 +0800
Message-ID: <20260227155801.211376-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227155801.211376-1-jerrysteve1101@gmail.com>
References: <20260227155801.211376-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_155815_076805_8236283B 
X-CRM114-Status: UNSURE (   9.09  )
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

Beijing Ultrapower Software Co., Ltd. is a company focusing on global
mobile games, ICT services, cloud computing, and artificial intelligence
solutions.

TaiqiCat A01 is a blockchain-based terminal product launched by UQSoft
(Beijing UQSoft Interactive Technology Co., Ltd.), a wholly-owned
subsidiary of Ultrapower. Its dedicated product homepage[1] was once
hosted on Ultrapower’s official website[2].

It should be noted that UQSoft's official website[3] is no longer
operational, and the company appears to have been discontinued.

[1] https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html
[2] https://www.ultrapower.com.cn
[3] http://www.uqsoft.com

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..bb16ae90a4f6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1731,6 +1731,8 @@ patternProperties:
     description: Ufi Space Co., Ltd.
   "^ugoos,.*":
     description: Ugoos Industrial Co., Ltd.
+  "^ultrapower,.*":
+    description: Beijing Ultrapower Software Co., Ltd.
   "^uni-t,.*":
     description: Uni-Trend Technology (China) Co., Ltd.
   "^uniwest,.*":
-- 
2.53.0


