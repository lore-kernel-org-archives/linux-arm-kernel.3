Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1694FC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 20:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vvDVjXMkBmC823RzTkpYCZMBAfM5/raWm5UVKD1gJ1A=; b=mKAUQtyzNVZkRnBvokAshSFUO9
	+EyFAHY1AL2FkprmsT+4vzZHHpWvCtRkexoTHeRuYIvT/09TSvGYJwncZ61yGgn6Pt22MjlRVsNr+
	UoOMXPt9qMBMse08bFplHT+KHSJ4IJdYU5uhINy/FGPJdGl4GVPfjktJseGSDEG9HjCsoSZLYe5ap
	muW8QtA1TI0Lj3gro9eT8Ypbe3qh71BgSLrGPZon7Eth5oIfuTORm3FSayRgteu24Hfmlv9Qw58L/
	G7EDPF4Db5aip53qITS/dkoOgMgBQ435OuReBPHm4dxOfja6huxu24DJIAdsHi751PBqlfLx7ULw9
	tYuIFDyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzxN-0000000F1uR-0VnK;
	Thu, 23 Jul 2026 20:23:49 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzxL-0000000F1tQ-011s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 20:23:48 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so1132279f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 13:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784838224; x=1785443024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vvDVjXMkBmC823RzTkpYCZMBAfM5/raWm5UVKD1gJ1A=;
        b=YgvcIXnk2XWRaL3eeU01YV4qZsYkfsNup5HVpeJUaQNw7j4NTLCcjJWuP5sCii4On3
         wGxmzCZ+dLhaht+F8FgC8yNZv+Ieo6iXolXXxrEyedpENKlFU3Pl6Om+tCoUh2BPDcmW
         vaVtX7uwrQvAo/VYv5WZAXhLzeVoa4HUALj1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784838224; x=1785443024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvDVjXMkBmC823RzTkpYCZMBAfM5/raWm5UVKD1gJ1A=;
        b=rKhUIF8Gomtta57yaDrvQbSczICUsAK13EfIhMDEqe0nk9X0OVE5FWD46ck0Gpxssn
         GO/uqf2UVT/oqXFyUc/AEY+ZzGJ5fHT3rqHoDLD+BxDZnTPDonCoSyh+AwnN1DrT/zM3
         Db1PL0/ejT1YbGeIjjgcZJiP2GkUad5tG9RE/EVN2kqdlFrB2wWqjfT2P9abk0rDjCRD
         uHHSfGQeidMlb0qpQUw/8LMIUVpQWUD6fli2CS6/RUlnQfD2Al7/JYWDJ5LhtsvJRKCJ
         la8CTLC320cyB65aNrGLBPz4cML4XYk4n7FPZ+TDXOIgccyRjCZ2XjaSrXuxNtKcovXc
         cOFA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3a3U65W/j0JjA+x6N2ukls+T9XHvG6wd/oWsT9lh7tl+NaCGJOUNyd30qrfToxiS/zrx88+8121OxN8tncW++@lists.infradead.org
X-Gm-Message-State: AOJu0YzduOd8i/o6vjFGQrFF2oYsuASbw8b1VhWEw6cm7XMcTjUA092Q
	5dqAiENTO4eg9UhGFQk8mEINAymGW/bKaHuodgJ18w15eLSof+gJTzZE5SAy644dhY0Ie5fsu6T
	Piyeg
X-Gm-Gg: AR+sD127dsRYST/KCIxvTyV3lW9G7Y8SdqfKlOSO36w97UNf4GdqM/F3J+erjRC75rH
	euTjwGiTEZWABQX7aoBMtpWxw8Q5fjohim2hm8juZrJXK0lvVFKFzNXDU3VlOvP2QauJgyI+CPL
	DQJFUXsHgK88vk2k2Q1MNH9Yl00QrQzkFLTx08udIfrU1wEYqZV3bTIDYfyfE7n5BsLljmNEDiy
	S1tfI4ufc8EDMNj1JferYDUikzs/2nAOo/vfZnIosthZ7+ruf6I9oWQpRtk20CMr4osTJuo4+Bu
	Oyn3QadziH42yBoZLDw92RH19bUZ/hdUlOkG0MeVNZSej7Vt7jNPahYJLRRI1637vNoRZ/S5KCf
	e8NU3AHH7yH9mBAMFUd+JPilzMs04jGuZMHFe9ooTDybPC/AHnCaMXO1xuSG4Q075kYhAk73cY+
	wiBJ2hOoY4JZmknSN9DBBYfTp8VbS96jI0EQ57Oi+YADIPP3U7JqF0P3dvC3z4c7rki4LAIYiU5
	qzjIpc+rz9e+w+uKyo7MWA16ks2Fk/qM2M3/L5KLTbpLMFbl+GFLaA0EvkzEF4AZtkWzlHQ/hPG
X-Received: by 2002:a05:6000:18a2:b0:474:64bf:8fb6 with SMTP id ffacd0b85a97d-47f8dc993a7mr5621124f8f.39.1784838224153;
        Thu, 23 Jul 2026 13:23:44 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c631fdsm17516051f8f.28.2026.07.23.13.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 13:23:43 -0700 (PDT)
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
Subject: [PATCH 1/3] ARM: dts: stm32: add missed arm,num-irq-priority-bits for stm32f429
Date: Thu, 23 Jul 2026 22:23:33 +0200
Message-ID: <20260723202339.974529-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_132347_066514_28562573 
X-CRM114-Status: UNSURE (   9.67  )
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
base-commit: d326f83e819c53aa05c40d64f5805d6237b6aa1b
branch: stm32-nvic-irq-priority-bits

-- 
2.43.0


