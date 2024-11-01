Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88BDE6B27C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 14:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZU7MAARj0sncxwFgqQLvOZGjw24c60A4QeqGtRoxeC4=; b=bBbG+yPv1zxY/zK18kyqabYo/7
	PCl/J974BkJEC+r9yLR0OFQkxByshmKnJeTAYSNlnTjF4RL8+vBrGl31KiOXCAY5dOsVoeGDNId0L
	Hm7pg/5l4xDYBrcKkZwWVkXS4q1JB/0eOP10BsIcWR+r6fVQqEj57+e8CLEes0tDJnbx+WQHIeHcM
	np+FFXrD7RMeqq6vzcS9PSfCYrsdw6AJ84xJ2Lc+NK/MmDfxmRL5Cb14JEN9GGuwzwB+2huOOYD/4
	WIgPiv6GgTOer6A/nfWKLLlhCMvtz7V6j4rZV16FkWgf1T7v/BEoOtcQfDWeC2/2OfSRJHdlmONZH
	G2dshEwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sOM-00000007I6D-10fj;
	Fri, 01 Nov 2024 14:12:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s6l-00000007FI4-3Ooq
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 Nov 2024 13:54:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZU7MAARj0sncxwFgqQLvOZGjw24c60A4QeqGtRoxeC4=; b=FyHzCi4q+mr9nriiR47V0Qpk+8
	dLW9Gkppru3n9h4kfMB9gFmfFWDWgB2O0P99GiYkrhOMdGiCWzQKECrKRFnvtCjzOQpnA25IOgN6l
	FA90ySOOcDCuzf0/qPl9MFFa+FizMtWyPOklk8Yoh68DfiKX5pGFTem9zpKnCJ7b4Paov8svgYwPH
	q8FAMRFwFHH5sgYhW3Y2hVFHT7vxmmNXeydybDIuSrTItRWhhW+v1I6JueCrIu1APhe80Oka7L04e
	/9DfnBNTBLVSs0EkBMnimnXf3QbkiVON++MPjAFDmnqVvWyL90rK0WLfcRX+VC1aSDD7FYQYDdDwV
	d/1JlutQ==;
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s6i-0000000Ai2z-3EFQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 13:54:34 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-71e70c32cd7so1651788b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 06:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730469270; x=1731074070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZU7MAARj0sncxwFgqQLvOZGjw24c60A4QeqGtRoxeC4=;
        b=RcQxgRkuhbdpw8kGRdPcXGvUsVxdzjDEVzNrjgnE8m8EEOjiHf4voM9ySM8dWvRVWF
         wNR6TpF/opx3CANT/czgFAi285oGn1o1I4L7xbhbLA0K6wvWzbCdCjyDtpagjgB1FHjM
         ohMGiK1XXNjUD06uNWd/Tcm1IgrYRf4RALKEJCJdFytk0xEV6PSToqdkb+5ZQGj0UNoa
         7w0ZxbuLPuCop8AtjPuRufAHm5S6eFOI0+dFtzqz9Yj/khlKe4XPyAcP+Nv4bhsGvARA
         oZOpX9WTDQtpOIk9tyahawNjwHePQgwkkDtjE3bOvD2HAUFHWZwRd1gm64giA+AhY7sR
         1n7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730469270; x=1731074070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZU7MAARj0sncxwFgqQLvOZGjw24c60A4QeqGtRoxeC4=;
        b=OPbY0gELKDMiiTc/wpl6m2J/9Fa9U+y/CcEEO/lwB4wOWVCp+6kGj8LoPU1rYc4XHM
         n02KSx1xffkSc5W5Yjxa/Hy5XFQaCEiNu8WmSzism0yyLwJvrLjAWzFDcBt0S8sjBNGL
         0g7jHotkQ6BNsPEkpo2aGXYedQ43dI886VNz2lo1A8pd8YvG4yCBl+ZbLvJT6POf0pJG
         /3bjoN80rYSSB4BsTgTxDVB7LFtJHZQ2ULFop3XUnXTDrKZ7wgKZJy1BZ6OpGNzX8UDE
         po1Y5EAUgjcDefFAD4ywqMsLh24Zv0uy6mtizPrt6VVmDYCIt3c5pQ9vCIwBuHycgOd7
         wlTw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ/6yikG7fiLCdJ4WoqFg79rAHF2khkmX+Fi5RjMXsZkeKXWfK+f2MTpjH9FTPHdnWwBX6zyqwafjY8UOFWCnW@lists.infradead.org
X-Gm-Message-State: AOJu0YxIbbd4oM9ZSAv+gP93gFOqknxC1hZpTnKjrERP2sUEnPAInyxO
	4d0CqMXROmeobVv5wi3jp2hIH52dtW4G+fpcmnWE2y4HqsujtAf7
X-Google-Smtp-Source: AGHT+IFNvODyOXFIZrFt2e8iiDHQo2FUGoSfpLAmSpRo47uVpMec5MwoTYVpy0Ef1+U4+wcnRG9sbA==
X-Received: by 2002:a05:6a00:3e16:b0:720:2dbf:9f60 with SMTP id d2e1a72fcca58-72062fd6edfmr33829235b3a.16.1730469269993;
        Fri, 01 Nov 2024 06:54:29 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:f81d:d4e5:9f89:77f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1eb3a7sm2656270b3a.81.2024.11.01.06.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 06:54:29 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: marex@denx.de,
	a.fatoum@pengutronix.de,
	andreas@kemnade.info,
	kernel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v4 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll fallbacks
Date: Fri,  1 Nov 2024 10:54:05 -0300
Message-Id: <20241101135406.47836-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241101135406.47836-1-festevam@gmail.com>
References: <20241101135406.47836-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_135433_000059_24A96579 
X-CRM114-Status: GOOD (  10.31  )
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

From: Fabio Estevam <festevam@denx.de>

mx6sl.dtsi and imx6sll.dtsi have the following lcdif entries:

compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";

This causes dt-schema warnings as the current binding only
allow 'fsl,imx6sx-lcdif' as fallback.

['fsl,imx6sl-lcdif', 'fsl,imx28-lcdif'] is too long
['fsl,imx6sll-lcdif', 'fsl,imx28-lcdif'] is too long

The imx6sx-lcdif programming model has more advanced features, such
as overlay plane and the CRC32 support than the imx28-lcdif IP.

Expand the imx6sl/imx6sll lcdif fallbacks to accept a less specific
fsl,imx28-lcdif fallback:

compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This helps keeping DT compatibility as well as using the more advanced
lcdif features found on imx6sl and imx6sll.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v3:
- None.

 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index ad0cca562463..72e509bc975b 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -23,14 +23,18 @@ properties:
           - fsl,imx93-lcdif
       - items:
           - enum:
-              - fsl,imx6sl-lcdif
-              - fsl,imx6sll-lcdif
               - fsl,imx6ul-lcdif
               - fsl,imx7d-lcdif
               - fsl,imx8mm-lcdif
               - fsl,imx8mn-lcdif
               - fsl,imx8mq-lcdif
           - const: fsl,imx6sx-lcdif
+      - items:
+          - enum:
+              - fsl,imx6sl-lcdif
+              - fsl,imx6sll-lcdif
+          - const: fsl,imx6sx-lcdif
+          - const: fsl,imx28-lcdif
       - items:
           - enum:
               - fsl,imx6sx-lcdif
-- 
2.34.1


