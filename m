Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F44BC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KPAaM7bTeu4n3UtyHqOaSRMG+n5s4+9FMWyYRge6VfY=; b=JUUtoSo0WatF5fkw59G/JPJiw8
	0XAPEt+uoa4EhzCLAGBnoJXa1akMbXCRfd4+5pDCmONdocD+Fw2n1pILlQ9bpmAd4KHQYQukx2F3O
	ffI1TyFpwiU5VgcCOoQj/m4lLk+sL3wNg9PcbBv1U98fOGoDIhDQXUuEVi0kktFsLTkZ7ExXBKmbI
	yv1rvpPbfjowIeM42jtI0czsyp3ifOrz0cr1rJRZECU9xSdb94MBT2HMHmefM7anlfhmZcA9SdkT8
	9e2epEUWKDMklZTDKJMK6v+grBaDlTMIY3PmpGXOFMN3UcyIzNtLHVtTslVHEALePHfjgAmKsTW9W
	AEOEDwOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnVS-0000000GZFv-30cD;
	Mon, 03 Aug 2026 07:54:42 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnVP-0000000GZEN-3PX1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:54:41 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49557167508so15940865e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 00:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785743678; x=1786348478; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KPAaM7bTeu4n3UtyHqOaSRMG+n5s4+9FMWyYRge6VfY=;
        b=qY+fttT18xtV25B6awRsB/W5wwfn1HZsXWm3BfeUmqNU3rMocYU+vyl5qaYj9gtsxC
         TIcrrNFpVRfay7J9xBJrmVrM6TbmbbCz22K5HhbziHJJIOG/D6Jhaxu2ZOsP/kvBekFe
         D4lgx8cWiWqVn+RLlJL+aSeSSPwukQ8+vn63k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785743678; x=1786348478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KPAaM7bTeu4n3UtyHqOaSRMG+n5s4+9FMWyYRge6VfY=;
        b=Lfj54w8wRB6Y2blOzH6w2rcZeZLK5rKm7WE+/UJdnzzvkBYyEerDXcAfmNe9OGoWTO
         gGWWOql+2otM4OHzUQrZVOSwtnGsHh5RTbmO3/zMRIwtnkP5K647uW8CU3Je+jvkqdu/
         VdfDgIsp6M+DZi3S+lm15CZzSxD6f+cqAFRRzjTOsZ2Wo9+EslVYN8Dd3j/rFEzbQfV1
         +7VzDvUB+nVxaXjgaTdzqdWofrn0vJhDw9ARb+ExZe0iWYApKKaAYpStM80RD/lOvuRy
         v63PujYFHFrQHbkvmcGcJ9aAqd3Vdt05rD1WL1WMQsa7dUe+k3lpaa9rGCCnJ7ONCS3a
         LwQA==
X-Forwarded-Encrypted: i=1; AHgh+RrawCWla3aJKEj/kYYpTkK1Gu+a7jNIlZnhLcVYYuDN0B3aRqYdo5MQ9cEOqhSt9d67nrOGJ+62hdNR829msEwd@lists.infradead.org
X-Gm-Message-State: AOJu0YyRTaCENlDX8WUAn1yX0Yk6mR7Y18JAuEOS0K/K71gzKXXsiy6l
	BOV38Ed4093W4LraMrKFy0zsFsNKrZTYPLGfoxWC5nxCJ/EY2j6tLAmV5VpYqTO6f8wzMF5alsi
	o+sBa
X-Gm-Gg: AR+sD12auQwde81AhzYnbVZ+45h47C7cxHXkKdn0aPCujdBmApgpvlS7iohg1P8XXEK
	/3XCgo7n4sL1gATfJWtkVpm5lDdDxCVYGG1on0HQR0QFTjSL8duP7GJmCY8mV4GR23uO1lpiA3H
	9aHawSN+8B8guoWzpEBXz/mA1xLoUCvGx1C4oVDdjdqdxeUDLb/a6bntPZFjWpxfb2q2zAI0bUF
	bIV0kHW9QiQE8kdhr4CJ1kxIHhh54ZXK91Ss6SSyWrx/IPm4qRAz8rHy06/q+FU2euV4Cmvod/A
	n/22YdI/m+2XhLbNcPQza+QxbZZ8lxTLnraO10Siuu1vMCjYaBo4aXH2szfL+9ZXpaQ2ABhZ9OZ
	jcL8WkhaOhKPqjVijovulKJfY8PmJfAX6i+zC1PRYp3NZHHRNMg/y6Hrgb3EzLkHN2+96lZ9bTg
	B1rTyZjcxpkXvS+5ZwZVcov6+NjRq3IpxwKcPQtSiN+TLQ0JSfHT9fvnbc1yk3YPu8IaCyoTvCX
	8P+SBkf7KLCezzzciTyQaokM1L/NTqoy/fA96LDtIsCLsGzAHPh502msiQ8K8ilJHiOx3ZzA0Ck
	2rohAbwiEn4HcVZrGuqYYJ4w6fHOhG2NAULT/yDwQwWhsgMcW2U+EvipHULEByF22ASlY5Z2+OQ
	=
X-Received: by 2002:a05:600c:5914:b0:495:5cda:52ec with SMTP id 5b1f17b1804b1-4980c662d03mr165261255e9.16.1785743678048;
        Mon, 03 Aug 2026 00:54:38 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm29411990f8f.34.2026.08.03.00.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:54:37 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH 1/3] ARM: dts: stm32: add missed arm,num-irq-priority-bits for stm32f429
Date: Mon,  3 Aug 2026 09:54:26 +0200
Message-ID: <20260803075435.3825122-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_005439_861131_2CC807B8 
X-CRM114-Status: UNSURE (   9.89  )
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

Add missed arm,num-irq-priority-bits to fix below CHECK_DTBS warning:

arch/arm/boot/dts/st/stm32f429-disco.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32f429.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f429.dtsi b/arch/arm/boot/dts/st/stm32f429.dtsi
index ad91b74ddd0d..f94500cd90cc 100644
--- a/arch/arm/boot/dts/st/stm32f429.dtsi
+++ b/arch/arm/boot/dts/st/stm32f429.dtsi
@@ -794,6 +794,10 @@ rng: rng@50060800 {
 	};
 };
 
+&nvic {
+	arm,num-irq-priority-bits = <4>;
+};
+
 &systick {
 	clocks = <&rcc 1 SYSTICK>;
 	status = "okay";
---
base-commit: 075b74841bd0065a3bda3440873c747938e69b68
branch: stm32-nvic-irq-priority-bits

-- 
2.43.0


