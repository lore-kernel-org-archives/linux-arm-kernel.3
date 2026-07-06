Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E937C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLyPjG5C5L4PyonbjPrLAmmPBiN4HQfMBWtrcgyX/W0=; b=RCEhQDWGw6aMVhIN3IsE414RAm
	iYEXzENVL61oIQVQrv7h8dL6bkyMleTziGk3ZksKZrJeKWnxz7TQifgy+7a6RHEs7K4FSfR4px0lT
	rPT54tjv8lySjrk1Uunk/FiXMFmsKKbsPStArN3uuk1xgO6XJQQ2ju0A7soFYBoqa56oGwY0lgw7Z
	/+ch/Ujo5V8WkV1mym15XKF9E4vLPH/QZLk7qs6bbwFGeo3hRriEYa+gK2vqCLCB/5iKMK+MuyFT3
	eUarcrEtAxa9YE4aqOSBfBjUgl+2zSk8Au8NQngiNOoYUgB2m6zxVjMN7ScTlzFh3qb++9+/tG1F1
	pwT5PEWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfPx-0000000Byix-379A;
	Mon, 06 Jul 2026 09:15:09 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfPs-0000000Byfs-3F7a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:15:08 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-8454160043aso2738658b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783329304; x=1783934104; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLyPjG5C5L4PyonbjPrLAmmPBiN4HQfMBWtrcgyX/W0=;
        b=Q9tuw93A05vq2GL3eGI64TU3D/b7YhoT8WikETLlm+9K/6dPSBw+YuE+0I2yx7FQ/h
         lQ0CUfvTT/0ojWxHyAxyrgYpY6CKO/9dcFF5t6YWncJRqnOx0nsoTDGmI7ev+Pqv7sY+
         2IBqvm5FFGavMUtZFor9IdAt+nkvyolFgZiQWLbxulTUjdM+E5GuY4ZfWkoV/GO0dGzZ
         e5ghZ3gAgKDdatxlBadtmGwNvOdvisimodKTQHgsegkp5ayAEpCpf0pzzyxoqm4mJeA9
         npTG4qZSs2cnClCwtj8QvF0kbCvmYGc9vfDYaQGXJDNsUoaeASKJjcLgKyjJopzieVre
         tUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329304; x=1783934104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLyPjG5C5L4PyonbjPrLAmmPBiN4HQfMBWtrcgyX/W0=;
        b=onCWJezY1H2g5AmbNHtPC7JPvwS45Bso83wb1SbstlQeQ04HJxFRuCGOIHEDrm/jLV
         LfJzowMkbPaYdAmsW6+/f6V6IBOUoDxwmsH5uTsvBVAOJkOnXMTtZvk88w6ujRUHaGaU
         gBVVV7wUXp5NyshrIb2pK1s8fAftB8LH/5MRdU1FvcXXUqFsFt7FO72ZwMtZ1SqiJ9ZA
         oIJs8Ts9l0XkDDMviC8r0jxaVT17BwTj5g7rioOSZNzIJAGCgOZYg6+N3Q8MhErD/6nE
         p5PYzDV0XSYcDDa4SZbdMBqLNgmNQGtmPZs10MuEbQr0P7gJFscSoDDEUqADE3DZH6RU
         QsPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq1XNrTUx88S9lAzldE4gKokr266VsEiSkf+kFixPMIQ8tFAdG7eMzS6zU7Y8UjY9qeFYP8IHsP0tU1rsotp1sv@lists.infradead.org
X-Gm-Message-State: AOJu0YyBLHC9GDGDRR37Dw908iMtHD9BiyhHj3pUCKYKS6KcrPE71Qdz
	00dXOvJiscHxxz5FyPn93y2TkFHRSu3t/xRmbNM9gVCQcaV/JwwFfF8DOPfTsqbFSsc=
X-Gm-Gg: AfdE7cnhN/qZTgUnO74SHfC/YUabJnxPX9oJN8YIHYVD+y6DJLr5VlaYDvdD3ObZaic
	XbU9Vm6KMaqUcxUR7TbkulsW5t19FRqlFKOazBDLpUnPPBVM4mvWk6Ju8/dIOUW5bNjLBj1uqbH
	3kyB0l/JM9TSWZddGPhmM9rkH4CwCV25ryYkYbzulQxlMWbgGooEos9ji+9TrwbJW6kygBHsOut
	TYGumhqR66l5WPu3CzhWUZnG/kyZf0UmY5m+y/BGRReor3I7+JVYbV+EtrbO92dclFe00K9ZLBZ
	4btILZ7n/bNolN/8NFJJQlY3dM1KJbhEdSynpzRL12MMzcB4LnvBPn/nXBKWuMSdmdsc0tQe7/9
	5qtI3OJ+QPEmY3uisejgKe9ZTw+wNI9mlz8Zx8Xzfwf0ain/+oIhsSJaDTfBH3nSmDI42iWX/Da
	oGPBQlnsczD6HIAvLhgTm9RnG/
X-Received: by 2002:a05:6a00:928d:b0:846:c7f4:74d with SMTP id d2e1a72fcca58-847f6f4dc63mr9274624b3a.41.1783329304103;
        Mon, 06 Jul 2026 02:15:04 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm3445963b3a.53.2026.07.06.02.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:15:03 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Date: Mon, 06 Jul 2026 17:14:41 +0800
Subject: [PATCH v2 1/5] dt-bindings: vendor-prefixes: add alientek
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-rv1126-alientek-dlrv1126-v2-1-ff3176ca362b@gmail.com>
References: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
In-Reply-To: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Frank <Frank.Sae@motor-comm.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Yanan He <grumpycat921013@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783329286; l=883;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=mcE6Yk5jQAt+Yt1V2EfWURtYiAgr7yrD8IJBZ/7gloY=;
 b=BxvGMeEMOJIcDK1cuZcQyswYfSolbuWRu2T2E+i4BOAKIXIhu8SvtnBgIthxgHZ8eezTIYref
 jRshprlBawRB4rPkB+L3GtuaunnK7RYifBztV8pZ/pbn8jfugmoNo2I
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_021504_825362_9B5EB862 
X-CRM114-Status: GOOD (  10.93  )
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

Add a vendor prefix for Alientek, a board and module vendor used by the
ATK-DLRV1126 board.

Link: https://en.alientek.com
Signed-off-by: Yanan He <grumpycat921013@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..914d5a8fd628 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -88,6 +88,8 @@ patternProperties:
     description: ALFA Network Inc.
   "^algoltek,.*":
     description: AlgolTek, Inc.
+  "^alientek,.*":
+    description: Guangzhou Xingyi Intelligent Technology Co., Ltd.
   "^allegro,.*":
     description: Allegro DVT
   "^allegromicro,.*":

-- 
2.54.0


