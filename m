Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250ADC5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzDNkLWug3uH06grmI5tFaYQGaR1Dd+azs+zlMWYDkM=; b=2V6vkGemDAJ0Nga5Yqg1riISyl
	KHb38/dOWgbvoBSyw9otOkESHXHJMdElcbo1CW6uP3TSXXJ4IHM4NUuBNKS9ySJBtnX3HzmHEFzWi
	BbSOF3LnaByc0pTUpWFypZEcOaVAyG3I3E+BymQ3bK8PROJMF8LUAf3270hBXEnuAbu61JDprYBnr
	gIslKgdG1jBlJURw1CEoMV3rax5vHtVE7odrljJojHhatMhBKuoDO58n5IjB+6uRok1U+9woPYcOP
	AkKNhU6lFRQk+XcnaM9X+rhEmTMKXUgLm2Ko/4a9UL20EhV/9uSRGxONpex7Z8Ff24/TGZPbQjD6P
	PTAye7QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyte-0000000BEqU-3eLa;
	Thu, 20 Aug 2026 09:17:14 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyta-0000000BEoD-0NZ2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:17:11 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4815bce4652so1325969f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217428; x=1787822228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KzDNkLWug3uH06grmI5tFaYQGaR1Dd+azs+zlMWYDkM=;
        b=NOxFkiA4v5oNzNW7ga5lRvYH0r3nmCqRAN5TdiX1nnr5ojGDvfnXCyNK/sGd355jkH
         3jq8jVi4Hca1QrnlDEGA9AWk2I8oxEI3fEIl5CT9Vsq6xt0FpxCCILEk1mLs91bD2Yga
         y/YFS1UUpale6vhLezYdzvgQhFaL6Cyo/MfiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217428; x=1787822228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KzDNkLWug3uH06grmI5tFaYQGaR1Dd+azs+zlMWYDkM=;
        b=F6cLT8uoOvX9hGdgRGRoSLCpcE3bJTmW2hoWxnnPCb7JVF7QpNzlBUDvtmlyYSU0F6
         UQ2ECclJzn3XVirRFQdw7J3GZc39ut1bU50yQdrITKKzgAnOBSXFWCnXa/E6daCcDLkF
         27cSKcJi2KkB4Oa5Dcn77DmkM39pO9g861bGBbTeyvGwpkWMfY5H8SE4GdnA4YNL+MEf
         Vri2dEn+dEtrKGz553TqIXO6qJpzwliTIMxlSUgYbLGLoYnZp4zBHEYxQ/Zg02wwH96Y
         4R4JdGuy1jLIxSbLZhNkAVF93Qsv2Tk820j5beOUT3sMiH0wl2JAsezGLr1WjnUna+bd
         ickg==
X-Forwarded-Encrypted: i=1; AHgh+Ro1s2FaW1ahCSkmdQQqMYG0lMEoEFi92ll3UuBAAy5SsT+HcGhq4tdVSMoCVLBw729drn85kfj33yUSTIIwU7xl@lists.infradead.org
X-Gm-Message-State: AFuF++mvHuxCjOryKCUj/S+JASI6y8BRW/wclfbxYomdzP1WqX30bmyH
	x+4I7/9xr12nKAzcuODRU8Of5Puu9UmE/COC1YY08xp/Ih4TvVpBNgwMT4Ic3CF5MJk=
X-Gm-Gg: AR+sD13uLKpsZJNX8kKMeg2CHy/uNZY0bbAzb5KMtrMvuIeQXXZhAqrD9/SbvnaDYfR
	/tbS5bONEewV7y37lICgvBLr6aypgQG/zrV/NVApZ8b44Y762meZhiD2NTYn46rvYGZ8SIjZLT9
	Ppidl7ZgWT5TUzIYCu6aOVCXqaCTiCKCaFcqo3COWB+Y2wP6dzpTVC+VUEOlgy87lgEMxGvkL7Y
	c8uFSy7vR9k9HgHEReNB9IbIt5cIOvmCLlo9vmbMtcA1bsdVzxdzGg2kbBuoBNHPvh+rQmTizJc
	v51nzw2FoJ+rvHYuWMlASmVi01xveYPK08ovVZajG+m1eXDgmAryW0P5R88EeAQ+pyTO3t/0dIz
	2y+NgV8jFzybwLILnmy09TuROogz+eXgPU9FiKUV5jlPt22AgVqIBwdcquWAi51JIccx+WVCHMC
	QQMsAPCU+zcZMk2D/of7QeW4CxdnmEnKALOXMhujVaUqgkXY82mDfP7wZterACtqjiV1ruedCA1
	xqUTb0xEgmrl5ZyEGt+HnU4j/Bl5jLSNIxYENUQtQlFKgr+A6BVhGoKPP3YWi4bVX0UDRvCJulY
	AcFXAwe8KU5gxwMj750Q7t2DAOBQMSH++xEAxHia8CoTrXJQ5maPTlOu0S/VQA==
X-Received: by 2002:a5d:59a7:0:b0:481:44e5:160c with SMTP id ffacd0b85a97d-482b1e8632emr21244457f8f.2.1787217428095;
        Thu, 20 Aug 2026 02:17:08 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	francesco.utel@engicam.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v8 01/16] dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257D-RMM board
Date: Thu, 20 Aug 2026 11:12:09 +0200
Message-ID: <20260820091652.43541-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_021710_145968_D867D7F3 
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

Add devicetree bindings for Engicam MicroGEA-STM32MP257D-RMM board based
on the Engicam MicroGEA-STM32MP257 SoM (System-on-Module).

The use of an enum for a single element is justified by the future
addition of other boards based on the same SoM.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

Changes in v8:
- Rename engicam,microgea-stm32mp257-rmm to engicam,microgea-stm32mp257d-rmm

Changes in v2:
- Add Acked-by of Conor Dooley for patch 0/1 "dt-bindings: arm: stm32:
  support Engicam MicroGEA-STM32MP257-RMM board"

 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index c6af3a46364f..3ed797ee7cfe 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -203,6 +203,13 @@ properties:
               - st,stm32mp257f-ev1
           - const: st,stm32mp257
 
+      - description: Engicam MicroGEA STM32MP257 SoM based Boards
+        items:
+          - enum:
+              - engicam,microgea-stm32mp257d-rmm
+          - const: engicam,microgea-stm32mp257
+          - const: st,stm32mp257
+
       - description: ST STM32MP235 based Boards
         items:
           - enum:
-- 
2.43.0


