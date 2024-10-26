Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0C1D0C604
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 20:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EYdW0WVK/HUf15o3sRYMMztvU9O/2v/dtyJUieuwwQk=; b=j1Z/2kg7DkQ7L6glM2NVAEyvSX
	qa3AWSxv+HmsUJ7RmaJs/pIdU8h85nJ6SPXCmAqmnS44A/n1yR8ovxQQkj/csCtpwg9DhXiRKf6ew
	gM1vLQaySExi37n6DL8oxVkb8Zk3StSTp7Xk4FSbkTJ5fhA0KgoWoaobzW/A/UbySAXks4vUbBC9l
	1Wd2op4ZtUI2s0GDhJMax2612YQ7kG3dOyiYP1de88S0McqqufBH1R96yUTfo3HZaCn06l4vqGgvW
	q+Zr6dRGxWnX5D7eQvi75LSaqLCLH9dMBQPZWwc28dKoV1mE7gtRKe3QnGx+LJkkyG2vjb68VwFAG
	QO1FxkCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nSo-00000007C8N-1cP8;
	Sat, 26 Oct 2024 20:32:46 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nOi-00000007BfJ-1Y1l
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 20:28:33 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2fb5fa911aaso42100891fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Oct 2024 13:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729974510; x=1730579310; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYdW0WVK/HUf15o3sRYMMztvU9O/2v/dtyJUieuwwQk=;
        b=EV5juU83jRBu7CTmcLz9eDCG2bRi8PwxjoT7u0IYLWjQ/hb2tSIMaSv4B4F5Ygep10
         tDynJ4jAgxfYFPujWUn0AN8/1Ne6p7hae5TxTDEXoJi8FURNC+X+WmjYeLZ+l5fM6wYu
         BKdiPPK4wwKo5nrYQ5m4+aV1yQvIeHkMSmp+h4Zt3+lGiGhiYxlW7T9TNpbDI3O/uVbP
         foZtgtNJi6sSUsRlbo/fkmgfy3h0LUNKdtx62aeYEiahm+k2o5JzFRsc4kbqmRilt6IN
         y9L1R+N31ywQ3Cb4grrI7Z9W1lVal3zX+4PZa0E/hQllLSD+ByLP3G7BW6+JnZSAvXFp
         gxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729974510; x=1730579310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYdW0WVK/HUf15o3sRYMMztvU9O/2v/dtyJUieuwwQk=;
        b=E8I8v/yljUzsgG9Udb7V5AkIRDPizXHyHxk+lR3so9SoC+p2+I7S58NLpIWFPRe+pZ
         35n7eSqZy7UgB2dXzqSvSUAhaAecrgmAD7upJk4LiTPTPuyq3bRfXsHDhLzGLXrzGa8i
         s63+wIDQOCMPqkEfVqNctHUvmqxoOMI0Jr/rM6eE+qbdSThQgSoC7ff6FKaQj65+BV92
         GwnkgiIem3WkirBHts6u2Ep6RqemGHq3QstA664Lj7BlCszuzevH964SW6dnQ+U79Ner
         KfGJDiTOi/GQE4XCjzaM72C3RhBce6jmzS5YFkH1cEqGMJhayYY59mLSTytdVqZu2w4b
         ltEQ==
X-Gm-Message-State: AOJu0YzJDaayB+o9Ny3c7PuUCJ6dHmZPehwpsrYn8NsmikDCaV4vuwKZ
	63Mivdaq0BW1bvGCJfIJcMa70yR/l3H8bUgaUEplq+almaF1yOlq
X-Google-Smtp-Source: AGHT+IGedkOCrp2Ws7gHHAOMm/HoxIvaYQUxFfzfvXpg/O9OiKO8kLi7PH2WqwN8AADLmXnG+ExWzg==
X-Received: by 2002:a2e:b8d2:0:b0:2fb:3960:9667 with SMTP id 38308e7fff4ca-2fcbdf7db23mr19809711fa.14.1729974509867;
        Sat, 26 Oct 2024 13:28:29 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb451a494sm6370421fa.39.2024.10.26.13.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 13:28:29 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Sat, 26 Oct 2024 23:28:08 +0300
Subject: [PATCH 1/2] dt-bindings: arm: pmu: Add Samsung Mongoose core
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-mongoose-pmu-v1-1-f1a7448054be@gmail.com>
References: <20241026-mongoose-pmu-v1-0-f1a7448054be@gmail.com>
In-Reply-To: <20241026-mongoose-pmu-v1-0-f1a7448054be@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>, 
 Markuss Broks <markuss.broks@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729974508; l=907;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=pxSfIIbbzDQhlem4rS9n5rwMaU5xP9xgQizC2pOHkCg=;
 b=G2bpQn6ZjZqyQNJwfwqAC4PfkPkUBEBV1PyoRzw8pi52cGKBGqKDjqX3ONoIK4vfOXmNkFOnx
 sdU3mKxBjSoCSB6Q7mH30fKv5cO9gm+Eti7W1UYrtP7l0Q26VVyuBVT
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_132832_430102_0FFF2A6B 
X-CRM114-Status: UNSURE (   9.89  )
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

Add the compatible for the Samsung Mongoose CPU PMU to the schema.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index 528544d0a1614c9f9bddaafa8dac4782d09ac7e9..a148ff54f2b8a92fa3fcfa78c1bcc525dba1c6dd 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -74,6 +74,7 @@ properties:
           - qcom,krait-pmu
           - qcom,scorpion-pmu
           - qcom,scorpion-mp-pmu
+          - samsung,mongoose-pmu
 
   interrupts:
     # Don't know how many CPUs, so no constraints to specify

-- 
2.46.2


