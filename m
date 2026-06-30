Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5ADC43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=; b=Rq6MR1tXUWIxyB/92EgNI7e5xe
	Ua0DHeD0ghD6gAPH3jfUQn0X5kavMw+tj37fH0fI2l77vsnoXb/I7l0zOr7ojHORxnDkJU6c0XWIK
	viDz+IFbGEQds+c2GRL46qic1c9Dqp9MRlop+PJel+fJ5UowU4v/1a8eBu7V/Hj0HaLKSXM4eBr2r
	lErwXVSmZJ8PRZLSk81kVN406qSqDBy1j2133jLbeI5qrJFqqL9/DBPLylJAq3gTccpAkSpK10b5i
	/sqAuiJlEvLnQtHwb9vo6kS3Yj2dtyptDHmJgGRXxRyiMUQ5ZOMjmrrJr5rv2FNcwF6smJ9H9jW6I
	vcef3WrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUkC-0000000GPo8-29K1;
	Tue, 30 Jun 2026 09:27:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUk3-0000000GPcq-27rN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 09:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=; b=jsfz8QM9cpxbz/mNenHVUMllEI
	AdzWMJrwXfUY7L2qdsZ/dXYEMQRVy+G7Ju8wsDTBMMGEY+GqPnxdOWma/wGimrRK8/d/zB+fs6Z7B
	DIgeCOo9lkHvyF6GU9MfRA790Q/lXD2Yrl1LgJMbqWjIbIoGFVj3Wsqv+ytbnonznpima3kY0YmqB
	BimPz6cgQDMvSc9dQUNR2HZ8UImV5Gh9le7hZ5Yx4FUt57BOkGehRVQpHmxjSuK94+t4qv0QWjd7P
	q9x32FqnS9TqdPkssi65CMsS6Mr7CjoS7CAIrea0wBY1Ot02zxcxe9BVXeI+yGjVy7kUqqJ9F1n/0
	3otFor6w==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weUjp-00000001hvY-2Yib
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:26:53 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49395888c7bso37628455e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 02:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1782811599; x=1783416399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
        b=VlDudxiIP9yKYV3OOnaEaVEZ0pl8mvNdQoucUvbICOtS0xis7gZ+H+WtJEL6qQ1aLj
         3fE/q1Mo3hC5+gLVzXQfmUCefLr6HOBldptBN5AJ2e33gYm7PmfwZ7TacdD0tKJ4x6Lj
         cNczW9+1h8TVtEAvRSMoM6opYL1xpYBnRJbBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811599; x=1783416399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
        b=MQpS4GJAqmfpbQ9qsM2uTFtfMsUmpUbJRQpM5btRyntrityf90ew9KYy+OJRunKmTE
         CCMaDHgn/1T4k/meetbBLS2aPDDxT3oAqZC+YtOrkx7/wXLsyMi8D+NRTjD/j49jS/LH
         ZRsc1R38qsxmLydLbXc/WNp6MscbhmjXGlO0NqZU2ugmMCwVuWI8YdoWzTXP99+aUTft
         MLK6rK2WgmXzObe631bfngihfuXvJqv0nCfidmJiZO75xmZcRqXrVUZNjro6PQ0983SR
         9GV5wX987LQ22pQWG8tIrzbzIBwi4LZOlofeR4IJ/1cC87ULL0Vm1rrrbYSorLZOH9CM
         7aCQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+ueQd3n6fhfgZBFpDfk1AhHMNoSGEwUJxM3Ei9LfPFARetdUx1lMVStGP31ROyMXW2JKmE+8eLj4oTOR9tx5a@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm7xXMZAToTDNkrQobU4q8/Vt6ElddrC/a4liRTrsphqfbocLW
	+Sp+PKhB3gBqSIlPHz05FxVdRrTEYiZdncyv/NvkhMoHAtl62o4hVz3SeKZCZMCWWtU=
X-Gm-Gg: AfdE7ck7n370cXJWhv4Avwt58EtpJxrAYBmCPIr5C6SZZCamjdWg8WH9grKxdv6qiM+
	KKXkHaglcFaZJfz/zQWxd7HN9CCpHv9pjFTtsi4axM1NgS/Byev1IAn74PK0vKrSHGhe1EWIUrQ
	lWt910KmIsFdsT+vhF2haoURFiV/Mqdhjm7PLJXL5/9HBI6l/gpU11e7IloSJVuv12jFDGTe6Br
	/HsEssywl3AbdIY2PYopf7xbijaNMoBRnf0Z/2MnZkzDn9mMYXIuYuUMve7evSLOwdnotGb1QVD
	6Xj/E62VJRx7Z8u6TO7xVpK2/yEVbN/gjs9R83nC+6x5WnM4N2wuaupOepxuYGgibWb7WK0K/JJ
	FdVUazHip8C53skYRtVAAu+Aq8fku2z9DI8q/nm4G3ztWnyXoz7fDVxe/rEgFOupFv13mENFSRY
	+PWbQdTvBvRT/4ANyLUMNGvQ2vb1TibX8X3y8EiEWm4lpJka9aP6lK6K/uZzZtcSgOHZdcNSYOF
	IfwtmyxwmSHOqyS4e2ua+0nqQACKpKEHUx8lMq3HBz8FVBNc4n5HA1tUXwjH4D9PBkh21N7nH8l
	OVTbwX/VC/5wKlD19LnJJgQn
X-Received: by 2002:a05:600c:6218:b0:493:a7fd:15d6 with SMTP id 5b1f17b1804b1-493b8289c5fmr45013735e9.9.1782811598900;
        Tue, 30 Jun 2026 02:26:38 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:26:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v6 01/16] dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257-RMM board
Date: Tue, 30 Jun 2026 11:24:30 +0200
Message-ID: <20260630092628.1695560-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
References: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_102651_010458_321D239C 
X-CRM114-Status: UNSURE (   9.75  )
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

Add devicetree bindings for Engicam MicroGEA-STM32MP257-RMM board based
on the Engicam MicroGEA-STM32MP257 SoM (System-on-Module).

The use of an enum for a single element is justified by the future
addition of other boards based on the same SoM.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

(no changes since v2)

Changes in v2:
- Add Acked-by of Conor Dooley for patch 0/1 "dt-bindings: arm: stm32:
  support Engicam MicroGEA-STM32MP257-RMM board"

 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index c6af3a46364f..c5ce81e3ce45 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -203,6 +203,13 @@ properties:
               - st,stm32mp257f-ev1
           - const: st,stm32mp257
 
+      - description: Engicam MicroGEA STM32MP257 SoM based Boards
+        items:
+          - enum:
+              - engicam,microgea-stm32mp257-rmm
+          - const: engicam,microgea-stm32mp257
+          - const: st,stm32mp257
+
       - description: ST STM32MP235 based Boards
         items:
           - enum:
-- 
2.43.0


