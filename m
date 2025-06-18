Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF62C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 10:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nX9uBVNO9qs42Kxb8fqv2jV0nxF10U+H6s6O+nbAUxY=; b=qwy6J8kd2DOMRKzNs0vst8EHBE
	d42pohy69WgdZ4RMRl43ADqyZIuq79exUP0B7fq2xNpE9V64AdUkRcsKOwEmCmlT8Zo1t0RM0kESs
	UJhXL0WZpUSvdMI1mufY/Jcv03a8cZH+ctzOxIKchcrW9JNNablDT3vmu4GsargHEFhrypfVng6zO
	1aAhflGhuNoWepDuKdwXntXFY/ai22bR/9EZ9NmpPloOvxAEmEzUp/pxLS1KE0nt49kg0ToAddWIN
	kWVikzLzD9aupbvLEPmz7BdeSQ5iJtU8ZbbQBJBEFkpvAYAHWFOYstMl0OgpohFmjvO5gq78w768v
	WltPmTcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRq6n-00000009nrc-3nMJ;
	Wed, 18 Jun 2025 10:33:33 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpa9-00000009gZF-1rA8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 09:59:50 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6097d144923so1284183a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 02:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240788; x=1750845588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nX9uBVNO9qs42Kxb8fqv2jV0nxF10U+H6s6O+nbAUxY=;
        b=cGh7sdz+3BSdOViqjf4KglUF+On9A5DlffouxMiUaZ8m/8YWr8L8IuGOrFqqs21PdW
         OLJp28TL3I0OkToYymkkpd0JiHiStI9TmjWb0LXtlmflI5p/+uq8lMVwfan0okhRRcTp
         lIxCw1j5hGn8oGmSPD23QaVfFbd6/wJOuu4oPe10fpT8X5Oab1zIVKFMGKb0G1ruh6hi
         FoyTnhsocOjNocRimd875c1iEAfwgq8oQYe4BrgO7mR5uNnORGAo2MooPzHHj3uOBOEV
         TIKXCpu5V+RRj0D4T7d+W8TXLovhXFBs8xeW4gqCQteuyNTDmL7/7ptpEY3gXxcZdNYG
         ZNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240788; x=1750845588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nX9uBVNO9qs42Kxb8fqv2jV0nxF10U+H6s6O+nbAUxY=;
        b=UbTB9rSLkABBdLzOdvnJ6TTFg4C2yKjg+vVxo6o2gy49seOmOZTEafmPTHHCpoNSQW
         CiiUDxqg8wlgOzkEstnpruqPDl2MU6OrZJbmwHoFPIYuikSFs7tA31CR872xnE6e6f3h
         rTrOdQElFw41/Gd7zY+g1OmH5eHjf72gD3EuefMmBIjOBFyHHimCFbf9WTLJOEt8H9kC
         XrZyFoks1UM8LB0Q6PrRHVdRC2P/y0agtB4n2iPB7AmGhfltCA8SjTa/PNVWoe9SkeMB
         ry1h1o+6J0hvBmLq0AGzK2Fv22k+WXI4f6jPAEvfUmQy8Vd9ODd87fhHlMkTKjIGQYVn
         8yHg==
X-Forwarded-Encrypted: i=1; AJvYcCU+6bGqiB4KUoJWW0gMZsl0oyXVuUlacHz8yJQZgcKlsX83ZbIILlpZlx/bDNfnqccvwNi3n+OHebS7o/+J4bFN@lists.infradead.org
X-Gm-Message-State: AOJu0YxcQL+k4w6+stqu0djqg34z1vQDY5zL9/3as2ghObDPbmM59CkB
	GerWSmQSXcqyu7C7pWI50dGXJ/alsMkUbzbSIWF52+f5eqZtZ+a7LIvP
X-Gm-Gg: ASbGncsvqMzrCB1IK0auPz3cX4a6GdRiQ9hhZF6PeWlshfrVTpALGb6CVpNqlm86Adx
	TyIime+nPCCIe2ro306kswGrkLLtn/fQkVFa4nMEWqCaDYS/NaWb6Ue9ohuI1RYFQnHNChJarYB
	/AbuTsRegqS3uPP2eJFOqcu6juNTbuV2152b0Iy0cu1rCTEAEOsSj85Rgy8ZZGCdSCYQoo5HqYb
	sjjhlqXOHnV7ZeXsYgAHQYJIs8oKYSCw117lX4QOTdrngOPkhH+7LH4b7xxf8hz740JJWSPMw2K
	mB2SENNmeNL0V/i6wU+vAVb9YevE4+IbmG3xoT11I1FC94MtjxrY0JeEbi2VpcuhZU18WsP+1a0
	=
X-Google-Smtp-Source: AGHT+IFKNSYCXHMXpMiW1D3ujznnkUIaiaR6vPPjrEqq56F/D3dCZHy5fYRRHjPkLHsCOyGrvhDTXA==
X-Received: by 2002:a50:d68d:0:b0:607:2e08:f3e6 with SMTP id 4fb4d7f45d1cf-609c1b9438fmr1253767a12.17.1750240787842;
        Wed, 18 Jun 2025 02:59:47 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:47 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 11/19] dt-bindings: media: i2c: max96712: add support for MAX96724F/R
Date: Wed, 18 Jun 2025 12:58:47 +0300
Message-ID: <20250618095858.2145209-12-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_025949_481674_79F7CE88 
X-CRM114-Status: UNSURE (   9.92  )
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

MAX96724F/MAX96724R are a lower capability variant of the MAX96724 which
only support a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index b345305acc4c..5dcafd46344c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -24,12 +24,17 @@ description: |
   MAX96712 can be paired with first-generation 3.12Gbps or 1.5Gbps GMSL1
   serializers or operate up to 3.12Gbps with GMSL2 serializers in GMSL1 mode.
 
+  MAX96724F and MAX96724R only support a fixed rate of 3Gbps in the forward
+  direction.
+
 properties:
   compatible:
     items:
       - enum:
           - maxim,max96712
           - maxim,max96724
+          - maxim,max96724f
+          - maxim,max96724r
 
   reg:
     description: I2C device address
-- 
2.49.0


