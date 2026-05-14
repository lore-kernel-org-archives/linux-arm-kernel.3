Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8348CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 03:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pS0Ld9uzavm9qCIn3zeBESeNJisq4fm3wOJuKswJN0=; b=JjTs532e2Yf/Q9B6xxeRYTUl4F
	CSUmiYZAqaT0eWJbuMSb3H4LupGOOfaTeMQmrd6oihSJw8uPco9A8oCA7vIQQ2jvuBVh0wnJ/4uWx
	05+tqeWkj4GUYc2MRn8Aj9iZ0qTAamVLjBExDC2D3f9XZQZai9I8qK/KABlhsGvqUqEhzBls9P8Os
	Z86jfV4fB/cs5HKjhm01a0VR/sEJsCVpDRCJIHHyW26v9TfmEh3oT53R2GaOI/vub3E0YMbR7uoUT
	9HE/XWFmFzRdkNfYmY1Fy/Mhovt8KGT0RH116aXw2ym4wdMEpZtiGqA9wqJZjoqmH0mvNQCxZha8s
	czhc5UMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNMYx-00000004Qkn-3vzz;
	Thu, 14 May 2026 03:16:39 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNMYw-00000004Qju-1fRe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 03:16:39 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3665b67ed66so3883361a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 20:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778728597; x=1779333397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pS0Ld9uzavm9qCIn3zeBESeNJisq4fm3wOJuKswJN0=;
        b=PBse5tqmhfXzepkd9flpIt1lMjHACzR0V3bq+nDYTEHFQDmLsaEmYRmJbAwb1kTj47
         nS/DACtPW9bqefyd+1ZPCBXx6X+Yjrxn1hJVO/xt4SzpvWE+WcAsr1Szibx52HJUV600
         QdEtjp7inlO9+iepsp5FhRUVvg/2Xpac68A1FHcd/O8YveiOu2+h9oXJBSSKD7XxyiZf
         USKHUoEKItQHjTELOUMExiHzaroC6utA9NyePNIc18ExiGmOTZg49mmCQXQBHt+s5EX7
         QJGJoCvsNoaTWsCwdWBc62Q4AGq2z0Jf6TSglPIdYlJjT3XoIJTUJb7QZg/+csprQk5W
         OUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778728597; x=1779333397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8pS0Ld9uzavm9qCIn3zeBESeNJisq4fm3wOJuKswJN0=;
        b=svIFDb6zNSxCtNivH5EFQXDjmgDN9JrEYqvwUW4OBOumVp/ugg01XKQ9pweK/V1INo
         pACfcQaSUT0/5tCU7KiWgioot7LJCsQOFcACQNmKrVyWbeYpotvm7W7EAo0z/8Kbiibm
         FSZsal8rkuaer04035FUiY/aKDQrsD2FBX88M2tPGjS/qc91X23owU+lDnY84SueSVtT
         27TbQLr1sPZ9ShYiC/0hWhaGmGppcYNrzhSQ8oiIISledYnVA05kvWinaToV5VMAWl+T
         npBt/NPstk/zmuuGnixayti0WSwnXG1gVEH1SWRAVNLChMX2RHOLyptmiLbhWSDMqE0i
         JuBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Qp+yAXB3Qp2G3vXNaECB/KICxFFfFow/H4FXUY0orC3bg309zkB3dsAjkwux5yWCNTSNMmMmkeBXC5pa2RUXc@lists.infradead.org
X-Gm-Message-State: AOJu0YwjqZyOMMA1PZXwvw1Fh+7yLFy7mTnhzpZvpFHAeu8PLTz/iyiR
	e1+xlCInVHQfVOMwLa16f/tKo5U6er80R7wiZoICnINcN6EyazGIDPfm
X-Gm-Gg: Acq92OHCwTFL6dKphx7dNFKLacsLH6ABsLvh1u4p/eKzbE14UUD1kPjmGIaFzBq/bLe
	eH57Dc7pqABZ8x+9nRd8lo/2tjWT4jZ6Oha0LE9w1SfKtcKo/AvQDIWtB+KLUqmCroHeyPZGCvU
	rzxkNt2ejuidlz2O8iHewEsOOj9NsCDYwGRynODfdutRWAuFn3DtHQn/YfF887P51qS4I75tH2m
	8OL1bAfpsKimL1XDvXBnqx3gDqj4rgOjs+VSGLMrY2KEUd0heAD0SRDd8KTWjL6OiRTzmuHCaI4
	9+KCD7ViPrQ1vlVeLqQckcP3X4FNzaIbyjcRcniCw42R20kwsUFlLSrQr+GXzdjjyPnSJ+NIIGD
	mGtw1aAYDTxvu3e2eKWcCJEX+KdptARVajxugnoSsvaZMX+6fDfcF59riSIEUyD3pnemJwgrofi
	V6RSNBRWtkQPBHsNp62h3ZjcDHZTPLKug71TrkABTV
X-Received: by 2002:a17:90b:46:b0:368:af5c:67f9 with SMTP id 98e67ed59e1d1-368f3aa3ae2mr6181333a91.8.1778728597547;
        Wed, 13 May 2026 20:16:37 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.138])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3692a94205asm320047a91.7.2026.05.13.20.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 20:16:37 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Date: Thu, 14 May 2026 08:46:21 +0530
Message-ID: <20260514031622.1416922-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260514031622.1416922-1-prasanth.padarthi10@gmail.com>
References: <20260514031622.1416922-1-prasanth.padarthi10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_201638_431588_43763CE8 
X-CRM114-Status: UNSURE (   9.14  )
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

Add the compatible string for the ASRock Rack B650D4U BMC,
which is an AST2600-based server motherboard.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 2f92b8ab0..656397850 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -77,6 +77,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asrock,b650d4u-bmc
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
-- 
2.47.3


