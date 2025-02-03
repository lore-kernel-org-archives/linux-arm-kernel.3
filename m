Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1B7C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 12:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkArynpSqp3cWfJCyboVvj5WV1Udsg6X2+BBCytGm7Y=; b=EL28IR6jBOWvaC24FdYDbROs5g
	piULRTG8zAVmyK/h3JS4evrjQsH+nN0naepxHzUQTwBMnfzn0ZypWMR56tEAoQ4ivVdigEoJBdhqz
	pVuTWf2li2RIMnNvcz5b8Wx0NMvvKDHHnMs5jlpp0iCQz2EwNNapRa/LF6e5gkRkuRh6hrOEw4o9i
	nbtwQXHnDiRHmVdPq2VPDfZs4+TmrxltVE5ETpL8YwL9eYGYWjBxN9EdDLa/fRaRV2nIKXZrj/C+8
	qwoyHBBib0H39SEiNTMepq5aGMalBaQQ/Y+DAw8FsoaK4ik8vFgizeuU15PSGBG1NQsZiCQ1WliMY
	LjTCrgJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tevTi-0000000FMIm-2nA4;
	Mon, 03 Feb 2025 12:23:02 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tevPt-0000000FLVB-1beC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 12:19:06 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21680814d42so69812455ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 04:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738585144; x=1739189944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkArynpSqp3cWfJCyboVvj5WV1Udsg6X2+BBCytGm7Y=;
        b=gmFp8B/SsHpcqK8rvR1NIbr0ggkrl//kusS2Ex1ZkJUGEvEWNJbgLd1EQBoxOO/HqX
         Z/o6gn7Ie7iVtBAj9GhrVCG2/ZXrDJiXiBRJbgnqkwlQ8wOUtLsmysQMv7DHbJNkZIRI
         u3lyDVJ4X8hcWo2jwul9sHFNMFMR2RWKR9pds1TeTIFnCqI5A3bro2WCWSqSZBv6v/1g
         BrS/CdO5624iLIME/0pDwqlOB3VpJy0Xm2l8C/FMi9ZnT6zBP8BJbE1IF9gIdPsZpRJK
         S66/BFUF7wXKrjinVIaUmGZ139QzHsMWG2HRL/cf7QFL4f277m4dFd1LneSVqHHm46hJ
         oxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585144; x=1739189944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkArynpSqp3cWfJCyboVvj5WV1Udsg6X2+BBCytGm7Y=;
        b=Irya/0QyWr6rJ7gp4eNlxYpeJD9gblQGryKI6qPyJvv9ZrbhquxGCPG0seT5ix3hOY
         QUJeFGxjTbpGExgOC0jC0AyNdHCyzeiYq8Q076/9Ohyy4/IYHK9uaZx7gmklnc4kkhoN
         iUhizop1BzstdR3cfFuYEjaJgerKzoBmV6yJjMy+3s4rZpfjgsqTKXXqxcp+HKLKB3On
         sMXxz6acmI3gY7UqOIa2ER/jAHkOa01AiWIyn6i9z/wEzzbuj2FrJOHV1nlf0APUcUu8
         My8+kYmuUglZe9wNi1JathdbKo4ZG7eu67etb48mr59YP58OzO3uWnrkgKbj0EKdAaTO
         3ciQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIJUH/JSovFNiVHQiYIAFnWAdDz0vcOH4DNIWQjHWjpxgqr75YYSy7boaXEV1VEB3ALdBWgISeUzsWxwyPZk94@lists.infradead.org
X-Gm-Message-State: AOJu0Yw59oh7atj2MKjk9WjBz2TkL4Mb11CGmyZWvZ2Q90GvRBL817MI
	LB11IZvF9uDZPv4+44xrVhkSfn/9i/MlwjV6oPuP0zShVz712qup
X-Gm-Gg: ASbGncsaFkgukUnkgmBJ2P9UX1UMiiN+xZqbRnNt2h2pBgh2IkRUlgrXpwRgghM+R3d
	bf215/AVWQ2h06i8elTp4O67JeGrtDfGuyTpXo4IOoYwQeJn34k/VnrX8f9wBkw2XcB7wioVB4l
	Mu1pDuuiqpKQPSmu/2Id51SDb9f68ivawaaGxoRl8HfUohvGxBBjdFANinZrLgu5V/CPr4sHHHa
	+lQT1lejWTwPXzUHZeEiq8eqiEH+s96BebzucaxlZbha5U119waF7gYJmT9GwghJbx4w46H/jkS
	l5EyOrDW4lcJXbET
X-Google-Smtp-Source: AGHT+IH234xwtUPOxphuk4OU/QS0XsrqNUoO1+smVE8tewsNcYKC6gtQXb6XlCEF1IIRTZGJuOd4Wg==
X-Received: by 2002:a17:90a:d2d0:b0:2ee:5edc:4b2 with SMTP id 98e67ed59e1d1-2f83ac026b1mr31193292a91.20.1738585144502;
        Mon, 03 Feb 2025 04:19:04 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f8489aefc4sm8789225a91.12.2025.02.03.04.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:19:04 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH v7 RESEND 02/11] dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11, T2 compatibles
Date: Mon,  3 Feb 2025 20:15:46 +0800
Message-ID: <20250203121831.36053-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203121831.36053-1-towinchenmi@gmail.com>
References: <20250203121831.36053-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_041905_421952_0EAE1120 
X-CRM114-Status: UNSURE (   9.24  )
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

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Acked-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/power/apple,pmgr-pwrstate.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index 59a6af735a21..6e9a670eaf56 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -31,6 +31,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr-pwrstate
+          - apple,t7000-pmgr-pwrstate
+          - apple,s8000-pmgr-pwrstate
+          - apple,t8010-pmgr-pwrstate
+          - apple,t8015-pmgr-pwrstate
           - apple,t8103-pmgr-pwrstate
           - apple,t8112-pmgr-pwrstate
           - apple,t6000-pmgr-pwrstate
-- 
2.48.1


