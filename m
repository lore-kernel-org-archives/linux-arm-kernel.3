Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA295CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 14:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFYhV629aCcMh6n03w8fB9pu9Qir4aq6dz+7Wpy2WIQ=; b=aBmgU6/5/ciof30Q5pXcguNiQT
	8ucbEy4QdmfHUWLhTz+ATfRahRrbBdZtX9VreAQ0jF6t1nygC8CNAVycLINlojVzcxph/ZIzX0XmI
	UQ907MaBoDXOBS1Pzcth9XcWBOLZuymPdz7KlKE2xNdVylQHAHHZmap2do2hAi0vQJM7tk4SF7sYn
	aprxpbxoAVljsyfs36LcwEcHDmpnr3quCDTkLGJauDQ5UcHYw6ENQ/59sJ8nX94BB/82LvkbAyWQ/
	fadb8yPmVX472us6pU4zcndGcMinafFyXAFQRoOlKQpnA23C54wuvA7IY9X6s1RtmwNMsJruCeK/l
	inKsEofw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3fP-0000000BHZM-12wq;
	Mon, 01 Jun 2026 14:30:59 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3fM-0000000BHXz-2Os7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 14:30:58 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8423efd76c8so883168b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 07:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780324256; x=1780929056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFYhV629aCcMh6n03w8fB9pu9Qir4aq6dz+7Wpy2WIQ=;
        b=poIM8Lei/J9MUHuGckelsvzWfe8PxCxc4NIHnoI4dp46KXmUPPQGaoMb7pTmxBu5Oe
         fPNh78xipSwSKs94Kj8AF7WP+HtBahF10psDE8nyPqgVIqWy2cNnlH4euXzw2sC0UhET
         ANb1Vo5W5oApZMQp17FFuVwMlwwY11IT1LcsHqlBX4GIzg4/Jh6MV9EeuHSPaM9VWkbu
         RTO0/Oj19kg3MgyQcIxvuG+BtmrcQSPCWeKd+N2ZjI0ADF7DrUdNPOXAUQKibaaqAOnx
         Ru0/boFhtcf8LbtaaNOVAqs/JOhsJiqcR/e+HdcvZ3fpYyYbaYuQ6N7HRPF+w27NdKTW
         2UNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780324256; x=1780929056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NFYhV629aCcMh6n03w8fB9pu9Qir4aq6dz+7Wpy2WIQ=;
        b=VJYYNHTjQQlyyu/JuHjyNmEsJeTmgUMsKnpmcbD0eaMApilthiVBhVRLl1A//vrFS5
         2Bda8YY55BmvQZ1k/CH/bFoFP4Ugd6PWCd7UA3zOQxZMMmFjPW5ro4u56EghxSVQSIy1
         9i+OzBK3B5Ar3cTQHgZjqqxGItIOnZVWkQ88rQvga1if8d4OkxugZlC3YaqROyy/MakQ
         3w2QQQy1YCSlKL09sBrbua/Wa5ItEgdZlfPrLd6PEj6ql5118/G3OsPgBO1lS/RM6txU
         /ebsuEVbx78coDUFcR578TU+eSZCoRYMp5uOH3nL3QY/K8VwdsYFrcxO7h22gYUxXp9N
         OBrQ==
X-Forwarded-Encrypted: i=1; AFNElJ+hj5GPkUHxAz0/AyL1nA8G+ecTWw99vfKHTMWBgsl9+rgkkptftYfDexHOyYlafi9couacC/sGatOSiT/l6ZDs@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ2W0I8xvg+6joCBqnd/XjfP1dVRCUlkWKzDw2gwuq/Ubcd9iH
	HTqrW5JRAOPcdl7Jo8lwz1XwReXxrjLzXiZTa0RrxufXvmixvDQPJ8o4
X-Gm-Gg: Acq92OHkqcMcln4Br9dsKyT52lDu5RSexBT9DuIwEQK4+0skI8Qm4hUt5Xd5gOfG6ws
	9WQi0fyRJdDcTezPtrkUktkZdqVmNMwGT1JzMWCm/9eWDE+u0K1enPUFl8i2b+g0+LG5qgctW46
	965+7P4LLR29gfK0cEleU870axj+4rHgmo7XF7IWyY6Ci+rsH4P1g2XAkSc+Kumx1+Rz1R0MG1J
	Qtu8PTFmQQMvhb5HO0qrVc5xbmYp5+jjGutdv4niHdqEWoQ4yyKGl5sVnRQAOsUBw2A0DfoY+L9
	+KIGc5zxFRK3f+w+zJzNjvklVIIR+nuRNgEUMAtVn8i5MtH2/SDWF+b50kvK86UdD05H/itX8S1
	UGcZor0GTf7scbXzrqxmDRDkLwG9GQ38DUy5BQj35JTWhbXCZI8E60Q9yad75v3QvP1OFtjKLxN
	E1nKG/8Ksk3fvdlKdo4Rd0f6HoIUu5Ut9lmnr10aTG
X-Received: by 2002:a05:6a00:6f46:b0:842:2ddb:e303 with SMTP id d2e1a72fcca58-8422ddbe825mr8194339b3a.12.1780324255689;
        Mon, 01 Jun 2026 07:30:55 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842498819e3sm4910786b3a.34.2026.06.01.07.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:30:55 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: add vicharak
Date: Mon,  1 Jun 2026 20:00:20 +0530
Message-ID: <20260601143022.153941-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601143022.153941-1-hrushirajg23@gmail.com>
References: <20260601143022.153941-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_073056_616836_545490BB 
X-CRM114-Status: UNSURE (   9.60  )
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

Add the vendor prefix for Vicharak Computers Pvt. Ltd.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..504a691a33b9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1791,6 +1791,8 @@ patternProperties:
     description: VIA Technologies, Inc.
   "^vialab,.*":
     description: VIA Labs, Inc.
+  "^vicharak,.*":
+    description: Vicharak Computers Pvt. Ltd.
   "^vicor,.*":
     description: Vicor Corporation
   "^videostrong,.*":
-- 
2.47.3


