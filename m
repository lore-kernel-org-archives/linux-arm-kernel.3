Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C205C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 19:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PW85pz5cGLvJh0OtF1LDKynxXRX33ioDpLb0ZUqgao=; b=mhnorDqfxUSKCYU3gQJ7t6jj5M
	FhLfK4su+zv/ZbeCMWtHlAyXRCDJcU3mReph7Npp9n+MGxBaZtzvxV/QwUUAH92BylDgKbPuE3GGZ
	BtNophJV9vaFB8ukRjiUbMtjvuaM8QlI3Coun2Esj1KSxCpYgp7CWGBziSaCSvjfobB7jVP5OTshe
	1nW3IQ4rirqdyLM1ZEcD9DCEm1ZcJglJf0J/twbYxywJF3qFpSZVN4aTZ4d1FAaN5jmB5kgWDIhwL
	LR1avWih3n3gAk/EB+G8wZC74vw7ELBkB8xUfJIwTLzauArsVWZ9LCsShBJSlMj20QqMq708k3pd3
	GEFDYnQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYhc-00000006eRA-2EzY;
	Fri, 21 Feb 2025 19:28:48 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYZ5-00000006dBs-0im3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 19:20:00 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5ded69e6134so4121012a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 11:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740165598; x=1740770398; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PW85pz5cGLvJh0OtF1LDKynxXRX33ioDpLb0ZUqgao=;
        b=mtS1Q8JrqbXTTVk+wrL9pEcHqeUGBI7vycqfdCz6rqd1zKJ/YKkasFWI2KH7Sf9Aj9
         RjxIaMaQjgxda4M5j186PYBeLR3Xuff3/dlOnMq4oujSOYqmeVgmg2/DKIjCrxW8e7KN
         sq5qXl+1JRncRJaEpxhLXayRBZfVzcx6y5rPUJW4RAxUxkByyO6aRgo1bt0IlKBe0L4M
         N8QLysIZq4CmozvXOTXG4jA0qIteNAE0rRjzszjSznTfmMuskpmTH8wZPMyexyLSjLMu
         i6Faj0k2fMYRnnbYvx5JBiZWjTp/GsXkbsK2bWODzUj9YZ31QpeNQvJLjIOeS4W+GmGY
         mnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165598; x=1740770398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0PW85pz5cGLvJh0OtF1LDKynxXRX33ioDpLb0ZUqgao=;
        b=Ws2JISJiUPP8HxYZ5d+dgMwXRyQh8nyUZ04K7AKudXxVSIgJtTjc+LjZyRvJxpLmLq
         qy/1uhVF2vqZ3kHg2m2boY4dNOzjhoVpYlKcUHgtQcOVtRuN7DjvMhcJrPCY+x0RGaBw
         jrvQ63LvaCb8Ow4XUW3zYXY3o8W7nUICzL3cCcsR0pjrElm+FSYPKbRbsOmJttt9x4Tg
         esdjpD5epVhUA0HSi84JqaTfi174uBE4+W0/QHNTj5jUXr2KBwHkzs/As4nCvPunV2yA
         g1k1DOTrWVkjaMI2po2w8OBhwH9IzAVK+sa3tkLAmKpjQ361ojrxE2AidCJfHyURM6XB
         VcVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHK5ObAHzkz5ngvq7w6l7eG9PfhH5fyjr40nRkok4E4AYvhPQYx3AZHBrcsovQHg11a/o5GC/6cf7qDXYUqv1n@lists.infradead.org
X-Gm-Message-State: AOJu0YxXqginWjwT7uFfgQi4azGJgp6BapDMpVvIBv+8CCzWTy6OViNT
	VpSr9PV5WNSigLJiqcQdRnLbv4R3JL4VOuHgUs70vhoEQ+sa8jg/SQl/i6LeW+o=
X-Gm-Gg: ASbGncv84Gf5z9XYVkbmE7yaowfjxoDZdKAQmSt4BR0/mqiDLjH6A+KcrS/LXTSvMet
	mEXskFFgWhPjCHY/rhA4A7xuVhLd81R7gtcmb9jExDbSnIljwTGXq0b3/7c5XMz2WczezfGV00x
	znywJF+dSrPxW0IrZwQUJf0S9nYARfABd5iL/5v6o8ZiTB004sGKjGnnmgIrUSvi6SgjAXSSdwC
	0qR4Wbq+0FEwD0eYsVcCyGzftWP4VN8/yVSx3JNnSBBWd8Xhm+IiMQuzzkYf8nT4Udnch3sCrg9
	nzDVcAMDhreApcN/utArt+8akU2+2JJbuYXKmfCfdRizP7BzJYnfXMwKtLU=
X-Google-Smtp-Source: AGHT+IHGNlBjv0prPEJON601/v7KmS0YwqUhGMf4lS65c24qSw6LwRCeA8Y99uRFtQLi0vwiyNDqXQ==
X-Received: by 2002:a17:907:6e8a:b0:abb:e95e:f2c3 with SMTP id a640c23a62f3a-abc09d356f1mr472726066b.41.1740165597467;
        Fri, 21 Feb 2025 11:19:57 -0800 (PST)
Received: from playground.nxp.com ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9cee79fasm995276266b.129.2025.02.21.11.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:19:57 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
Date: Fri, 21 Feb 2025 14:19:09 -0500
Message-Id: <20250221191909.31874-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
References: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_111959_208021_5C6CC7F8 
X-CRM114-Status: GOOD (  11.64  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The DSP may want to access peripherals on AIPSTZ5. To do so, the
security-related registers of the bridge have to be configured before
the DSP is started. Enforce a dependency on AIPSTZ5 by adding the
'access-controllers' property to the 'dsp' node.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index a1d9b834d2da..9ec51e7e6678 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2423,6 +2423,7 @@ dsp: dsp@3b6e8000 {
 			mboxes = <&mu2 2 0>, <&mu2 2 1>,
 				<&mu2 3 0>, <&mu2 3 1>;
 			memory-region = <&dsp_reserved>;
+			access-controllers = <&aips5>;
 			status = "disabled";
 		};
 	};
-- 
2.34.1


