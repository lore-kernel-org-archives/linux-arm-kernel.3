Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD0FD59F65
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 19:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IhKxn9mh9La978hmxe7Fc0A2OJRby56llbTMDvsHyfQ=; b=y4mz7qmNvnj9rPdS3NrNAvWq6K
	1v71CthnbIZktb+GlBhB4jQkiPvAylEbouur9VZdrY3iLHhK1p3ZID+v/nXjbGuJBmB1qEi6/7E75
	PGcCpIgpvRo7beKz7oZtXv4IywZzEH4oiGPTsmPOsDKYfS4ldqfT66avdILujaqdlcos2W7sV3Bim
	m9sRPEr79Rt0H2DVJTiScxpsBHj55WazrFAhFF+POB4JlGuWJPzJFumXiNciZLZC9iLnSPzDLaxKz
	VTPWbaT38cZ3mh7C4gZUH3A2UyeTm35iDA/DHnoYQ5UgTmcGP1G+sO6vVzcVK0rBpPGAszQNc4gaH
	YDmDTGWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lQR-00000004Sa1-3MKA;
	Wed, 06 Nov 2024 19:10:43 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lLZ-00000004RoL-1VET
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 19:05:43 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a9ed7d8d4e0so2393566b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 11:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730919940; x=1731524740; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IhKxn9mh9La978hmxe7Fc0A2OJRby56llbTMDvsHyfQ=;
        b=lKLlNgOyKNBnELPIbU35gTVIlQxYjLps9GFlNP4ASAE5qXqBrv7ZBs01QT9c2PEUnU
         sIWcyfjN/TA2T9iiNCIpHKZUEDX97hpsZNy0BUPsrlSRTDlc5FidIsP+z0jJK63+kzZx
         f62e8V/RZDhomAfu6guol3Db+ewpTnwbsCX3LZOTdf+f/zFApTCsPO1XbKqvRz1s/MFO
         FN6H97+sVAu53Rw23aJ2Mq5iKD+m1mUA4NBwPv+r6ErE070qjY0DmK/gi303YVoQVvuO
         4tNmweREVj1duN6C8fysNPMjxDKn/XfoXnBdVzxSBJrXALXKWDuWAHYnlMhonkIS5tMv
         1qqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730919940; x=1731524740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhKxn9mh9La978hmxe7Fc0A2OJRby56llbTMDvsHyfQ=;
        b=i038QKHmMfdW9vrxGyKC8cumNEjc4HLMLFh7Nuh1Qwg/7M9WRma0VZ9camHm4sSiW6
         qcrU3+F9L40PwoBMiLoUsO3XGCyESxxd/I7vRpGOnedENVLxSvxhPLxZ4sbUlA6I2l5s
         FvEnF8d9LS3oQNZkgtfCnyqYe4njofHSX3Elnemuyva5ldoqzLdA4NRzYMsxrxgJfmmE
         6zrUT/CPD70m6jfya7WTjM/yWIdUpd4kxwIuS4QdOkAqRDkyrQBWzOcLCYgfNev8D4st
         BZDvPbfy8RT4FA6pa9KgHPYyvEP7VACn1i/cQGcjR0K9XVEqDGZwhEeOtxXEwy5sZtSv
         RH3w==
X-Forwarded-Encrypted: i=1; AJvYcCV+wm5Lept2f+Gs2LWdarx//Sh4igPLH+N5952lLfJ6UBZWizmdcz9hdaipVdKWP8SNnX9G7WdA0Opf6y2LaugA@lists.infradead.org
X-Gm-Message-State: AOJu0YzxLoZZnZ4j4mkm9zYKlJPvS9IqOYM6CMPE1N0RoheTjimAILFc
	8vzO9TmaEQlKfc+mU//kb3J6ZQtBNp1X2O7saZQ45p18sG5cWA0t
X-Google-Smtp-Source: AGHT+IGI4oKgg7PABJwD5X3tevlDjTR+OfQLY6lSEUSJtjKLD8YmiD6b4oSzu+h3XfqjcTwDMlXWrQ==
X-Received: by 2002:a17:907:9602:b0:a9a:420c:d1a6 with SMTP id a640c23a62f3a-a9e655b998amr1755144366b.48.1730919939703;
        Wed, 06 Nov 2024 11:05:39 -0800 (PST)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16d67bfsm316574366b.56.2024.11.06.11.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 11:05:39 -0800 (PST)
Date: Wed, 6 Nov 2024 20:05:37 +0100
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] arm64: dts: sprd: sp9860g-1h10: fix
 factory-internal-resistance-micro-ohms property
Message-ID: <30d7ad167400764b6fe37f63276c07d3e30d931d.1730918663.git.stano.jakubek@gmail.com>
References: <cover.1730918663.git.stano.jakubek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1730918663.git.stano.jakubek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_110541_420261_4BDF058B 
X-CRM114-Status: GOOD (  14.27  )
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

As per DT bindings, this property was missing the "factory-" prefix.

Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
---
Changes in V2:
- new patch

I thought about squashing this with the 1st patch, but I wanted to keep
Baolin's R-b, so I kept it separate.

 arch/arm64/boot/dts/sprd/sp9860g-1h10.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts b/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
index cd8b1069e387..94af7700f3e2 100644
--- a/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
+++ b/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
@@ -72,7 +72,7 @@ bat: battery {
 		charge-full-design-microamp-hours = <1900000>;
 		charge-term-current-microamp = <120000>;
 		constant-charge-voltage-max-microvolt = <4350000>;
-		internal-resistance-micro-ohms = <250000>;
+		factory-internal-resistance-micro-ohms = <250000>;
 		ocv-capacity-celsius = <20>;
 		ocv-capacity-table-0 = <4185000 100>, <4113000 95>, <4066000 90>,
 			<4022000 85>, <3983000 80>, <3949000 75>,
-- 
2.43.0


