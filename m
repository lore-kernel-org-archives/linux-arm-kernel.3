Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AABC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 10:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDWyXMYmlYyqkjQ5tAi1Mo+9H+BsqxqH2MJaH3c+pQE=; b=2CVa+Y4Pm1fnN4TdxKq6DRfKgi
	+GLgcuxsr8FTq0njhOcntYZdROjgYtQzcUJTykFcouLW7IxNPbAl4m3048HmBtcX6l4XwnHCfH2fT
	o9bzKNTRlM1Wg7LK6MBtgPsyFVwhBChxfTgOSJMrRLGmuQII/O9W4zhhhtYEAgvHf8X+I4OBJxdb5
	MFB8oqNQdtb2KUqRtFX17bMQncyAaW/Y63h6CchrssqOxI7zOoW0nW6E7dcvFWP/vZ/J64ZU/XsUx
	ZjS88ybdYZmvQjnvjs1LKqg8LbXtBQo/pOMh45eXoLaLpkPjNINq0Oxji00x/ZsVJXQ896w3KTvXw
	9DwwlyiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8qX-0000000DOyO-3NUV;
	Wed, 13 Aug 2025 10:36:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8LX-0000000DJlg-2Cdg
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 10:04:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=WDWyXMYmlYyqkjQ5tAi1Mo+9H+BsqxqH2MJaH3c+pQE=; b=m5IBid+AOh7VV15IPWAtYwLpf2
	N76QcmxMhbH5cJG1aoiwT8VgGy8FQtLch6f2nVXs1iP3UMPDF/wo00xthrLnbPciDDq/U1Mf89pUQ
	QDaTvWshACbmQAzHImtpiIA6B2mOcajIXxii8rB/9IzCTEtDzTFrMD7h7Y8DBdGd9fU+X5Afm967d
	UflOYKL+JAK6lsCy2c2qX44VwRqQk8DXMsIXzxyIosIu9Uu5X5ITDprBujp0yUVLNcayrLLa4n9gV
	WEzlDMVBBn7LTSZVRlwkUFP65BBTCAddThpmjTPKxtvuSG5LT7onSnDc55dJfJiDGYFTVipTi4kHb
	+k7ZIJ0w==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8LU-0000000G3pT-24NV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 10:04:38 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-23ffdea3575so42730745ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 03:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755079474; x=1755684274; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDWyXMYmlYyqkjQ5tAi1Mo+9H+BsqxqH2MJaH3c+pQE=;
        b=WF+njoLrGW3cTfzFc42k26V8g8ppKwwTWpxaO8XQKCvrP5WsHF1eX9wKuCpRxu3swI
         X6YyvfiIN6LcGwGBGz7DvZxsIo07yfcTCxMxbKdzhN283x74cS+VxbnlEF+akCtJ9HZ0
         3pvPMoj3zzlMKDANUxfcb5UpJkzb4k9gN0nYvQloVIqX1ndWoECtqDFcun9C9X1a+/O9
         nXNt1eK1iep4nyMm5lZRDRNIig5ScaPfgiOH5oj1vjN0oDULsBDk5CI7MY+eHzcIhkHe
         2oSA84VaiZkXrvgQlZj0jYe6I9qUbHdT23VEo8oLSyLi1Y717crZXaHvGn6jhUsoN51X
         ljOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755079474; x=1755684274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDWyXMYmlYyqkjQ5tAi1Mo+9H+BsqxqH2MJaH3c+pQE=;
        b=MUonxpg616FvB3lu3J3zEscmKUE+3kUlJFMjRf7aa7KZA2gEo5LsKQsDMuNFUKcclo
         pWa3Y3iARe06VRzGKqXp/X6AcucaCEbQWXJEt4hjNGR+q8BCxGEOAhvrjUyKIYKdH9nH
         NlAk77pf/NTA/w+20xdAdbvqIv+lkUQAbgD4tE9e5rbJVcqxMmO2lz/iY18cUaWicStB
         KrOUjw90Jc2o0NKYRreBhvJVgbOShSqpkFUgBCaQiEHg+wx1unTK0xE7W9IndFgnhL4s
         QZXQJEV/9E4oTLgdp6S4RWrdyX5wVKIpC/l4kI1o9tgc+la6XEN6KbwZ7r9xvv5sMewi
         ENJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc5615bErFXqQnqQcIXBGv+P7UPvJiCeD/BXjZlww0nsVrPden5nTtjytWOgXyQ2MxP5Mj84qiwKGZiVXB7SQv@lists.infradead.org
X-Gm-Message-State: AOJu0YwPPpLLb8SYo0tZ7XWu4y181hVMbwQkkVNozSfX245nMjI/hqQz
	C61Oyr0c0bC1tzetDiOzNhyoDmtnOTTGvi8H7S0/DYbgd4U9Q0tNDpGB5nkETA==
X-Gm-Gg: ASbGncsD4H1vN4WAl/yypZ03r5EflMq8Rsw9t5GyXYXiXOxyR0YEG6DTTlqO9Rcfhos
	I78qyUJDlBTcnKKNcFBsv/KtVI0/jOt2T18Ppuo4NisguDI4obVrkrsnMmhrYNC0Em6funrxrM+
	DKzlEDsB1+XyL19dK2FUrjobfbncPZ1GNvVTOXvvxODXxHbqUU+Groi4gum+scBltHGV6r072jD
	dgHP9/XSDBzL+7ypimihvfeGHOiDIhBpRSkbaqboMfSNRcttc0E/8SqoEEbyKNGgS3r1Ni1PuL3
	92HJT/dM1sZXgD7d7+c6tu7LisOuARB9ftlP8aK9xAA63RhiVzSWIz7iByg8bUjs5ql7aLH6pmy
	2L8yZIKJvDu6e8AKJhXQlf444I34Xv+/CG721Ds0bVpRZvmaUgU91yNgRsD1Y++lB9r6bJBtfqI
	7qhw==
X-Google-Smtp-Source: AGHT+IGT3aAhDjpoio/fVFfqmIOKN4CEmb3nnrCVJEFLXp1M8jEYK3v6BzGjhuS8hShYz0ZD8JlaDw==
X-Received: by 2002:a17:902:db12:b0:242:a3fc:5917 with SMTP id d9443c01a7336-2430d0dc67bmr45068265ad.2.1755079474310;
        Wed, 13 Aug 2025 03:04:34 -0700 (PDT)
Received: from [172.17.0.3] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aabdedsm321545335ad.167.2025.08.13.03.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 03:04:33 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Wed, 13 Aug 2025 18:04:13 +0800
Subject: [PATCH v11 1/3] dt-bindings: arm: aspeed: add Meta Clemente board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-add-support-for-meta-clemente-bmc-v11-1-8970d41f88b0@fii-foxconn.com>
References: <20250813-add-support-for-meta-clemente-bmc-v11-0-8970d41f88b0@fii-foxconn.com>
In-Reply-To: <20250813-add-support-for-meta-clemente-bmc-v11-0-8970d41f88b0@fii-foxconn.com>
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
 leo.jt.wang@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 bruce.jy.hung@fii-foxconn.com, Leo Wang <leo.jt.wang@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755079466; l=935;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=+J69e5YqTj9k0Q13XCuEnilTg/3SIAicfVR3jNTVkYE=;
 b=W00fAaXOnIiR/l9ZRnJcClS1vfLntgZc+ygrhDBzU+WRFiaQLz8OR+xeA5TrFS1TEUl0Noci9
 +Xx83IRKylaDGTK+9a95nhTQAKVaVg0PhuVGMJ3HoxhQ8Vu3njwx103
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_110436_635593_C8E63000 
X-CRM114-Status: GOOD (  10.37  )
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index b3c9d3310d57c065215054211cf5bd2af816906a..aedefca7cf4a80b5c9d14098b60ce277391fcdcb 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -82,6 +82,7 @@ properties:
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
+              - facebook,clemente-bmc
               - facebook,cloudripper-bmc
               - facebook,darwin-bmc
               - facebook,elbert-bmc

-- 
2.43.0


