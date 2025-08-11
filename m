Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C8DCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 15:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avIBeR8rEnAqVNBXeOJ8wqd6+seOLFJ0KWtILvJpIqE=; b=MBoP+/twDzbVW9/+eNIUs9S/tD
	xjDlIcYiJoPQ6wuLebfhOaO/90n91rFJCW4953W+s88sn2OxwigMn9VJvlo3UcspZTzAhpEghB5JS
	Oums603oocoC4XDJgZukBEhPe6E/CMwQUfxfbWl70nAqxC1R6HjCYcQAmFr4pmSpGtCOtRaAje04g
	PMRIiS+Xc3YMNXarOjj6X8plU2s5KF7DhVQubf0eqlFDbJQwA9tzpbZCDBqbLgoJi5NDL/iPg9gEc
	wnBv/7RIJrUUh4LRf0VD1u6FXNXENQV0EKbnbuI2nlg1RS7x3SbzhvAy9RFwFjo3/MYacrgqfTVKy
	R4HAhYjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUKz-00000008BeL-00PS;
	Mon, 11 Aug 2025 15:21:25 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulT0g-00000007uHZ-2m2j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:56:23 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-76bc5e68e26so4028944b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920582; x=1755525382; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=avIBeR8rEnAqVNBXeOJ8wqd6+seOLFJ0KWtILvJpIqE=;
        b=f6FU+AtEzfasOlhGbyVbBMVHdEHKsrVGLt98ewN8tTOr4nh4haCrSLEkGyPaJXH20b
         BXj4pi6g30rdLxqhhzTZfPM91+AhMU7/EfkigU/uwhYO2+47YXXSsVk/n1VJRxeVcCeZ
         ZMKJ4sV+QoiKGQL5E9jIE7wXnlHyN43BTwlduhK6L0BpfdCkeGHnj+Izz8UN/HZ4uWdF
         LXs75jn4vpXsefFU+cTcIf5haD716pbz75M8Qpn6oth8nRS0eWM7uZrqYcr1I2KmxNsj
         auaF0TRjUu7oVZwDjUdwJ0dDcLBVTbJsG7H1RmFCWgamguMicQaYUWMOMAx5FGYuXyPM
         DnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920582; x=1755525382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avIBeR8rEnAqVNBXeOJ8wqd6+seOLFJ0KWtILvJpIqE=;
        b=R8pvCsK+JhEcJinAqXoYecLLOeeuQVQsv3umiIcUZrRg/D2I/v9rGzvLs2qH4un/0t
         5mKGZHNcrgGtPjhoT8dXXd1jBobPwKSWK+vAt7AjzLKxb/+drcfO0ic6O5TWm/0oe8u2
         ++TBdBMP4oIMeLlm+o5nGVC2v+fDu3I0kZVHOMZkNCALLA7P0CpWe/VM8ZkkAgOVUENt
         iuNusghL2dOhNQCqT2O/6intsljhhZ9aPMz4ytKkAV/+WvErdPz66/dLjUoibR0Ri6py
         XwgyQO9bmoowpJo21uT15RlNHZimc07tfSua9uQmsGJc4OTrTue/rr3SiBb1Ph0xghx8
         3WQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrFVyCljFUHBe/ACtKfpvOzxvrzOIeyusVRV/TVvIed68zZpsu5ZwbK8wwny7vCMnRqFQenn53E5LYOzAiSES0@lists.infradead.org
X-Gm-Message-State: AOJu0YyNnKLkYXPi9ZugpBbwDU6CqVVl6fco1SXkZdUfv2ERBwF9FV58
	pmfu66Dm4Yh1nych8ukNEC00o+DftDVDrKvf5zCMwEAUutfft45YD7/B
X-Gm-Gg: ASbGncsEMfixn4X87qSSPtm7Z5TebK41dxugC90vyP2UesP4iT6VecnJ/mTClIkOhM8
	LqxN+SbttHO9HFEaeAkHNqhVpSQ4rN6zKhfrYFJrn+QorsWfQACBB8ZpKJUZhS3a/oMI/GCRvvp
	kOpSyuoI4BzG+zCMmAgmMfqb4ghzJUjwcoyWDufRnXF5YHPkHYcZiw3rdI2i++fvEis78RP7tm2
	D9KMl82o32iLCsQrXZSBnXejGMz123ogCa+W3VtGuNY2D0IttKtSMS3FzJM3UZBcxMoWHXj4uq/
	Ajh9LP9lcSm5KQznk1020hpe4sBXTflWEbNCAH1jha2tHLfZqQ0qmzMet+IZOy6aQR9YtaFoZop
	tPmxoc+bXb2+0Fn0Q7Gm6ZpEFbrN62MOI0ao+kwXH6PVkR9E=
X-Google-Smtp-Source: AGHT+IE3ROZ02+joJ2/XZJxRG29EJhUFoJrI7FNVppCcYvvwFIRKg068dmR6hVYWvx4Z2peyKUSMyw==
X-Received: by 2002:a05:6a21:9990:b0:23f:fc18:77b0 with SMTP id adf61e73a8af0-2405503b99amr21712828637.17.1754920582044;
        Mon, 11 Aug 2025 06:56:22 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:56:21 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:45 +0800
Subject: [PATCH v8 13/21] arm64: dts: apple: s5l8960x: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-13-c560ebd9ca46@gmail.com>
References: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
In-Reply-To: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=914; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=EpruOfD/q+EFiyB6qpD7d0v6HBQIo5PobeNa2WsPEsU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZCtrzCmJINFsXMQXuzK2KVaLhmiAmEiX6pC
 KGvAhErDLeJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QgAKCRABygi3psUI
 JGc/D/kBKhTM/DhwnhpwrT5dD9zmHbMRDZ/2Gctppczw581p304TYK8ymzYJzSShDs/csnIxEdX
 wXCIgVZ4WPGpHsmGKztkwdiV0bwTVYUxHvH7i2sONq2GPdsXnfIgC/74gcyaAYCaCA6UpMKawuD
 uSOOATu5GxQqnlDj1iyeSrXCvrs39uwo4B69Xb9I6EBBm93UPXoOBB15C9t0xszzyKp3CymnroM
 1s/2aj8bWzwrvylETXxxQuycD6N0kZMa6z2XS+fKINgL8eDmDWa8Te5nuU6dDcsHwsQhbwIjeUk
 rE3lIgPv8hfvtH5NE8kXB2KpEogwnYwJBBwKRPW9bIcpc5EheKUCO3zzr46y7gtNr2uEHtRCn3q
 gih+zlEDkYsAvde2+CpJ4a7taJQ1nx2IjJsQtkXuoUoUYT2e37rtOxbZrjwLzQnJBk8tt6TLB3H
 zae5WXMNods5BriqOB5em+/G7DZW4RHiNZhQWyLLR/kwsYaHuNRoL1S7TzPlMgW4xaUjfcpwfvx
 Nwmo7eCk+g9+iG7qbbFZJUZk+PoboVP854bxxWW8Q0k1+u1myiatSfOHQg0YUFrcSaxEjviCAej
 RZ9CftokBd7yIlrDMJQkuOZEZ7SSjIEZInj1sTul6sOGUtibs2ldDbuq3cPphV9bXHd/MVKA+Xn
 k1qn64enML+Lbng==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065622_703959_C1E92C4E 
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

Add CPU PMU nodes for Apple A7 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index 5b5175d6978c45052ded495fc0d18ee3a8fbfdcb..1a3a90f7b9ded42e371ef0b41057fd3081579615 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -151,6 +151,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,cyclone-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 178 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 181 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s5l8960x-pmgr.dtsi"

-- 
2.50.1


