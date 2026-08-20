Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834D2C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tHcPefLb6jkueZtGNKuEiyQEEuFbmF4AqxweRVSlXHM=; b=IP2RHkzGC+b3bLZgyxUvidyFb7
	SnZ1CJK3CA5qrDioKvqtd312XiFzW+7n2iiHareTUqvfkFJOUa1cQdgjf8RudkBXEjvj55S2WHsFG
	vmtLeQ4So+8zDx7mrZKORzFI1lEr3oKcVY3Yb/0U+RoMfqbrQVc7C36PsAUe9EZyUNiV2yksXK6DY
	96cnRRyZQBxhx6Cp8ITEsr/+iODId3cL8RynJjLG0nQEUNlyJfnV93JPiIqeDtaGCCf5gZUS/RTAl
	s9HQL1rNqO0ivUlnQQ8RRjKcopbJiinksKMA+dl4VP3Xl1YvNa6AB5LEx5ryndftVhMGRc8m1ugAO
	RWCExWHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyyM-0000000BGZu-13zW;
	Thu, 20 Aug 2026 09:22:07 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyy9-0000000BGWe-2vIt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:21:55 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-499a4d1d7f1so16950325e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217712; x=1787822512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHcPefLb6jkueZtGNKuEiyQEEuFbmF4AqxweRVSlXHM=;
        b=cTnYfM8Pq8ZqeaKfACa3C1nNgc/xP8izuNwk9BzCu3Ln4hjdWeU6raXp5t/tTelhSB
         pkYGMyEGmyKvxRcv/lFDJanXdD2f0nTiKtubn4tvJV6kTFOgRVm4y+aB73iIL7lpTWBG
         Cb/9UWn/+ys5CkfSKwM8LICEva6j6tS3sDpwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217712; x=1787822512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tHcPefLb6jkueZtGNKuEiyQEEuFbmF4AqxweRVSlXHM=;
        b=RkvJ8Ez6WjxgHnoH4ocQRNks+1GnUU7KOovfDkhiftYuAJUN6TGixwMpvqbQXfl6Gl
         st2FMXnk3qdTLK60oqSI1jEaR1IpNy3VgHCEX1h5L+VZmeF7oIw4WwKDHVy7Ky8Gej08
         390Wjgfkwip1aJQ1HPs2Ap6viW6Up9F24fmkq5cY8DoE+BsZS/cyZLuV9yR/2Wlrv8Eq
         tG1srtx8CO5Mq7gCMyrV8qWenTcHvDuumGZFE1OhFAgkwSa2u7MH/Xp8wGZ2c3xwIYWW
         yVkkI4w73dYlihe5n4EPLJZXdQGc8zD4fVjcMyoX2R0QPLFD6gJ2No75gqyAYdb5db+r
         guOQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPbCxyAprB4NCyK4xw/QP97Gc9kAKQZ50zMw4Y97cSGJ2LgSiP3cwVfcO5j5FMO0yvWFnGf/mPQI8sr56lJs4W@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb6eHinUuOLnbpAIZuXmZBrhWBWVTKb8tZBJDfBAoCWQ86I6HO
	KtcanpDRfo6yUclHjBZNMkrVD66Uh2+z2jpZ+gc0sdGaw3J9lCqYmms4rBDCew89LiI=
X-Gm-Gg: AR+sD10vVWBQ4TUuOxT1F6Ejp1egWNbvCZzSG2Lgkj/fqUJ68NNXxZ38g7cIO6o+nOO
	ddDBtc05noopJ2fvaBhxwpL4sIxE2KLAX3sB5pQQG4QWuIfR8Fd3yE6djJVn1LHGrqkKIVGPvfh
	spzccuZ1TQWEMfQoHtDIFekzxGhN0jx2GqSRCcSyG7Dkrd9It0SoqfawPiZyAd/nbsF6/W4GsUg
	eQ/Ic1Avqg2Dyc/+QQLSNHZ4CtVqZdGy/om2MPpEt7C2k+fkxk99Aa069ALixk2+QmmnAz7Zzg1
	4jpCGffx0MEGMbEwjZHDrPFE4tvD5PwHLUrPHiMCRmrhhgr5WVQOzYoX6QXr89dEqRV3wOzH7kL
	o01tonjZ2IfY5refNPWO3y3iHn6J3QoLmj+4vYfpU0uutnPsvsPR7xUAXbKSDbDeacB0mzS1tuH
	voi6LacSmNchmeIhgvDzWPWm1fmLraUq8xYlQqTxyJRcpaQQ5twLqWhr+JYA/qxyp0bO5oUfN8c
	CCP7uhVGBEMdgrGqJFgFuKIH65x3QY9B1LKGw5zG7h22jNfdbDt3HnaoSbxEwy7F9hEgl4rMyap
	uZ1mwJJaxGDZt6fMKkVgy9HFXpmcLEmibk9utShYLhJ0qWqlSUk74cuoij/5qw==
X-Received: by 2002:a05:600c:19c8:b0:499:a277:e8c8 with SMTP id 5b1f17b1804b1-499aa1e35b5mr152829295e9.13.1787217711728;
        Thu, 20 Aug 2026 02:21:51 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0fd7a9sm165259515e9.2.2026.08.20.02.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:21:51 -0700 (PDT)
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
Subject: [RESEND PATCH 3/3] ARM: dts: stm32: add missed arm,num-irq-priority-bits for stm32h743
Date: Thu, 20 Aug 2026 11:21:38 +0200
Message-ID: <20260820092143.44829-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820092143.44829-1-dario.binacchi@amarulasolutions.com>
References: <20260820092143.44829-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_022153_739713_2823EF69 
X-CRM114-Status: GOOD (  10.26  )
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
base-commit: a4ff2be345d0abc943da8dd8da98151843b750dc
branch: stm32-nvic-irq-priority-bits

-- 
2.43.0


