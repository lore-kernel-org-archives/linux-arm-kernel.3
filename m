Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8535ECA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 01:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lKauwi606JW76n+c/E/TFgwwggsMIGS0qNvVRFiPKQ=; b=z/uq7nRVtcp08I5BTtmD9CQKds
	/i21HV2ttzUXKAClFCX7GqJQ6PXIGF2JwozW4VOOwbBla9/O0HjVvJ+zfoSzlzljhGnXTEeoK6xeB
	6Em6PkGdHKSPY9nbcQJS9HQpn5n2/OiokHcmPpyJS6a5xZF/Vr3dicleTOWdhod6RwVwIiC1mkQj4
	Jj0murhjxizR1GBtdd2XnNIJpfc335pzPHyT0/zUAVsbHuoXeGtBYL+CDyHYRwtj1r13gT80fckuj
	R3fAreSJx14EjvTRYKTkAwLzH7yN+3F+4cGIquHM3tja+U/0p9/YnShVkbYgpLmwCQEogI+Yy+jb/
	fUvVH5XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxyOp-00000002VVo-1T6y;
	Mon, 15 Sep 2025 01:52:59 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxyOm-00000002VUB-03xI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 01:52:57 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b4fb8d3a2dbso2491047a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 18:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757901175; x=1758505975; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4lKauwi606JW76n+c/E/TFgwwggsMIGS0qNvVRFiPKQ=;
        b=BOZ5iUjHy9DCe5dVSaEgZTSXkzNqhxXOf6Ra+Z7Q9wi70dOlqWoWtMKYeSfcT8mB2b
         aX1pJsBxIaTQp5nfE3j/CkaC/KpoikPDEkLxV/Vv+P2ThsOKmh9ApI7LOLxfamUxu0aj
         RkVBoGD5+1xUS/xr1O6POHMpef9bFYp0PWiIUAJsKZYkNFhc8Vvj+iFlWWm6R4zIMniK
         FUsnNixWziUJGWaK9TzZl+pGVWykkwfoE9e2k+tIAOaoYXpLjbO0utbfalsJYFzbDao5
         BxFYJgp6rxxv1b9Kehe2DcZGxrOX1BJLHSB2CTtWcy0N7YNbLKkE6gMjN3dcwnTjW+oA
         LKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757901175; x=1758505975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lKauwi606JW76n+c/E/TFgwwggsMIGS0qNvVRFiPKQ=;
        b=jWSnY5qAEegv0WZiggg02tW9s3KuPdZcqnGm7WHTaQssv5fleS5B/eLNdHwEAQP4dk
         xaF5hQeRbyaD5AY7qqIH5+6IUCURwHHWHQwfenTXLfHtPJ98psBgM9sQ2Z1Tt8ixuXJR
         iAJxz2nfVe3c+BBOzm80TVQ2ZyT6h74a2SnHOj3ZUbWVMVxm8o9fwufesQEfoMHjoQNl
         bNqukNIbMSedc8SlljmBZPzvJe7mvThghNaAHyvGPxpDfa8QBt3P+CxzelmOE/24UeLO
         b3WAp/aZR9LfEfrtMGMFwV7RPzuzK23SjtKR+uDzQiUjosie9moLkYGh1+7iJvBGQJF+
         3smA==
X-Forwarded-Encrypted: i=1; AJvYcCUBlZxCNfP46sFuuZGxfF9qjzrF2/bpKNqCb6ODJrhz5asoWDyGT8PzFYocYMhXZNuvlOiqjM/NqPACwpxPJq8Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yxsh1l89bQALX64nPpHkdtKzmFQ84cCi77kz+GElmCVfa4LCI25
	w7agr/yWXtryJJz1PBjz2w1vZAsQ4u+Xifq7KcoYVTqqrJpxXMlBakcF
X-Gm-Gg: ASbGncvW6ARXB+hyQENibPoPzQoufXZ2GyKjmmfowWmLahv/mZOVLiaArPtxxAyHBjq
	iDNC+1Hxd+25gU/JiaYn9QqIDSDpl1Ct4v4/Ico8+EjXdKfAXBl2syNoMblKN/yFzvENZxhKYi9
	u4rxgzgngNza9dVD6hBzw0M7OvHjNcqCvIGhQ9YdMqEKjyE9bhuO8K0Xx0Xbpkou9ckwBhRujKy
	hS52jjNaDoay2P27EN3x4ZMHn78AlIgiLCz3o4dvoUGE09pfGljh94jCid8Qa+v3pGbzcOafzyF
	esYywmWjMTgtUOfDLiYdqI3xZPhdsNxgz5If/U+Gcp7Wy4Dp4MZdlNA6rbv4joUdqJAA99RUhZG
	kvxdmGCSM0OZq3UaEL3fJERBaVTWxELCWkck=
X-Google-Smtp-Source: AGHT+IHWuYTbEVpZyLJS7fo2wvFisOiIUIQdPnNoSbXPJNsFdx7r09O0spNATU/bO9TcPnESAwBMXA==
X-Received: by 2002:a17:903:19cc:b0:24c:cb22:8221 with SMTP id d9443c01a7336-25d243efcacmr120111695ad.3.1757901175108;
        Sun, 14 Sep 2025 18:52:55 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-262df893ec5sm41565255ad.46.2025.09.14.18.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 18:52:54 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 15 Sep 2025 09:52:24 +0800
Subject: [PATCH v4 1/3] dt-bindings: spmi: Add Apple A11 and T2 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-t8015-spmi-v4-1-758620b5f2ae@gmail.com>
References: <20250915-t8015-spmi-v4-0-758620b5f2ae@gmail.com>
In-Reply-To: <20250915-t8015-spmi-v4-0-758620b5f2ae@gmail.com>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=982; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=hIWxj9zV2KpfWd9HN2GYWeuxu7uVsrIcQRAZP2bkNnA=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBox3Fw0lI+FDkxbVsnvMxk4d6qhiOLERJV93n27
 tRJib2kXUCJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaMdxcAAKCRABygi3psUI
 JJvvEACoCQwgoPlFXhCu6aP1Yzfukrb4xs2OuMeTleGduVEcbjvhnY7+8noTnDVwUxB9QjHDQJ8
 cXdwqikO3XMly1/8zAbFzYc/UlWhNitGrKvG7HVP8Hp1xZmdPzl0hYKzrNq1/pk2fwIYNaTF1Ng
 9I4sj7rSjOxUT77j0KDQO35Lw8c1IiZX7rDN5gGrDAHhOwUZa3GvSMRStssqPMeOeIhXMJssO6N
 XuRglKBrjfXCq/YnM6OeJkAiJ0iAl5Tn1cUvkpI4VB1Aavoy0KPIdc1dF/ad3Gn4LoI2WGcXd05
 /fkRoAihhT+BUuoWw1ljYwCB4/tsScaBLTT4R10+iArSkGo4ZO+pohJ4rDpEfEkhoggMbvAmnU4
 6TcKbaGKCgeZmAIVxvbENvknuebGJgYEKO3zQVEpqPVUkwRue9PFdP8q+VDH/wXT54hEhxNEWFO
 2RQ0g4pu+17+L9iGf/mhqdjze3xjHY3IMAPrgxlr8t5P9UD35TDTx/iX3RPZ95AkUlLyC43SrkV
 ipe5Nm0TP9qGqsGEY3/N/oM+0w0R14mTV+J8L6118du7GWmbQdHtk0mLx1EHHoKrZP/tylT1V6X
 ucju8hHM5S4Rv78omdfawQeCBwiyaSOhJaM84vjHkiY4paUHrGpIAfSDrvD/BtVr532U2Cys4IQ
 q/8pFvmjRLnyvcA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_185256_072575_9823CE99 
X-CRM114-Status: GOOD (  12.02  )
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

The SPMI bus found on Apple A11 and T2 SoCs are compatible with the
existing driver for t8103's spmi so add their compatibles.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
index dbf09ad0ecdecab82074344aa6a840a820bc448a..ba524f1eb7049dc5ba7c5f83f734d3f2f7e905b3 100644
--- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -18,7 +18,10 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: apple,t6020-spmi
+          - enum:
+              - apple,t6020-spmi
+              - apple,t8012-spmi
+              - apple,t8015-spmi
           - const: apple,t8103-spmi
       - items:
           - enum:

-- 
2.51.0


