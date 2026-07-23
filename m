Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41597C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 20:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAzh6OwkGuIfCY27rZc+4yNvhijgFF8ObLrHWvLSurM=; b=42FeD7q5GdbakeMx6jzqjrzwcS
	bkUbNEeTofxaSBiENXYR9XUtTZrnYCsNQb6Q5KboelocEtNV4WvHPoRMF3GuoExZfcRafFPk4l6nG
	uUqj4XISDr05ZE+ZU1NsfCoaOK3lOWQXW5bJDOAKJc7LsGkfMroW63wNM/ZdftqpFrSgLveD1AvmM
	guW4RuieycgajhDxcnzw1W3/lCkH7sLsif+AK7PhU+Z0wi4eeemnvICTKn59HhBnK82X5cXO8V2W+
	jEAk1N49t9iRAQqbkP92R25uOeuFYl+EVc9XknIxqSSw/la4q+u4JjONn2YLl2WHOI1jyjnd+VEg6
	vE+InJew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzxU-0000000F1wX-2Bq3;
	Thu, 23 Jul 2026 20:23:56 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzxN-0000000F1uI-1IJe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 20:23:50 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so937926f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 13:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784838227; x=1785443027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAzh6OwkGuIfCY27rZc+4yNvhijgFF8ObLrHWvLSurM=;
        b=MDhcPXmKiEPRQ8CEWI3Y0iAeUNpo8B57ZCh/q+Mqx6qiuJF/1yPOwCEuXxZmdfmqAc
         T3WSR0gKjwKhocX0xHAJ3jR53rq+TAfJwwNwANL8J2t+y+7M/TE45eR5Jlt+PhXbAR8Y
         PZl2tHA1y1SOyAMJ1gM2xGycpQW3/6DwaYHuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784838227; x=1785443027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TAzh6OwkGuIfCY27rZc+4yNvhijgFF8ObLrHWvLSurM=;
        b=CjaX5qf5mDLSiigQKaKEjlBXXRcQwu9kURVlkRBC1jSDGZRSuLpeKYO9BLbldjsUTQ
         /XSguREg0SW2b1OhTVhEWcRLR+fg9MbBSgOCRA55kzcwjtTQqPP2gd7KrKEMull4bdeF
         MnUJOjzaXavApmzNgxytJz2Zuf0gvhlyta7Wzz0508RwNCsvmCg7MlbdV37WDyGiT/N1
         pQZZVQn0LVBMIHbS248Fu0S7ccZapU5zUUsF1TLE8W7oIqE7zjKaLwmHS8Ku6qUyWoMN
         Z8pU5bZ4x+XfWB4wvy9luY8DyoX/6Wem/YK9wV/MYDlMYM5Ed1SxSUkNHIB/2Ym33707
         Qrqg==
X-Forwarded-Encrypted: i=1; AHgh+RpIDOrtDkWEkEx95NExPZpkSs3skV29W+gfjxpu3tgZ4NRXrQjXFoPJFj1u7aSvyocKss2qb3gIF4PaCc59iisU@lists.infradead.org
X-Gm-Message-State: AOJu0YxNP+UFM0x0E6EmvxDFFrJsjKe7SIdzHAgtvmFjegbaHaiV/VHL
	r6RT7iKTZxmDAk18zn8GY695W7aJFy+nuNDKyVFJIgNbTs+cFbumM6OJqB7lBM4Q7e4=
X-Gm-Gg: AR+sD10leS3HWos2oy9A31E1eUtRcRjdYkV2Ni90vM93Of57s2KKpLk1/dBWaQjriwn
	kM8K82um9Rwckvg3eerTTB8J6gebZb7iBcH8J6fggPvtO0S3L6gaE5Fg3XzQjC+ax4ivBtkmTaY
	PwDJfidCkgrkl1F309DJijejTXShM+BuE0o7X6csKYrzzh/89H4Z0vqs2DIhbTRTYFOfgMXkPLg
	dEk2Z1gEWMMawvn7pdavWI5Vn3fxhu+WlUIIr0cdm70sCKEi1mls+ULybZ3S9PSQEH8QSQ3/YLv
	dJnUnqhEqFeEYhCQqmu2D2t8WGDX6yJ/kzIx0GYMwzZmg2hC65iSriKXL/bRB3Lq3UUZCApbqIK
	6beTdDlYFuZ4Ur9DHBBjAqbB3M+gfWwZGJE7DpYgvGXO5f+eOX/+JE7v126P2tOSxcaqJxSpbJS
	VE61CPirJBafFwUe330APxf/cfqZxVVOZ6DMCFZwheEgtxabkQKzplY73j+07opEXUeeIEVAlWe
	KXmH0GqNLXudp919TEW+nwRKB+WK47C/eLXd/gIGWmlC11Tf+lBHdtGbZXsuf7lr3HFMgoChH8X
X-Received: by 2002:a05:6000:178f:b0:47d:ef38:260 with SMTP id ffacd0b85a97d-47f8d72d3a4mr5490133f8f.27.1784838227551;
        Thu, 23 Jul 2026 13:23:47 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c631fdsm17516051f8f.28.2026.07.23.13.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 13:23:47 -0700 (PDT)
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
Subject: [PATCH 3/3] ARM: dts: stm32: add missed arm,num-irq-priority-bits for stm32h743
Date: Thu, 23 Jul 2026 22:23:35 +0200
Message-ID: <20260723202339.974529-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723202339.974529-1-dario.binacchi@amarulasolutions.com>
References: <20260723202339.974529-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_132349_358814_F89EA013 
X-CRM114-Status: GOOD (  10.03  )
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

arch/arm/boot/dts/st/stm32h747i-disco.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32h743.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32h743.dtsi b/arch/arm/boot/dts/st/stm32h743.dtsi
index 2f19cfbc57ad..845d13c61da8 100644
--- a/arch/arm/boot/dts/st/stm32h743.dtsi
+++ b/arch/arm/boot/dts/st/stm32h743.dtsi
@@ -732,6 +732,10 @@ gpiok: gpio@58022800 {
 	};
 };
 
+&nvic {
+	arm,num-irq-priority-bits = <4>;
+};
+
 &systick {
 	clock-frequency = <250000000>;
 	status = "okay";
---
base-commit: d326f83e819c53aa05c40d64f5805d6237b6aa1b
branch: stm32-nvic-irq-priority-bits

-- 
2.43.0


