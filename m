Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E465CC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 23:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wAloBg1GSJoUoSs1Fe6e5szwOsXLtBgN31oDTUHQ8I=; b=4lHg67G+L+DVlv8d0jAC1bdrBg
	8jIaq/rED5XQVrYPRr9lg+5h8wvpw/hIzaoEI/jdSnWuCmF0PmvRbSCDP7RTySeGr4aBHvRSb2zCS
	1D0F4AIgm24rt5jOBvp4agcPDcsPe6ssG1+kNQU66rHJwpfnYaG/TKnG4eTDZNS+efuGifx7WsKjB
	WkTvjJpxdHzDeVgt2twAnuLvPsqrtSXekeNDMWZzfFn/Z6ona7UPr09GbSuC7wQHJCrIZ/osHnU19
	kv4PnTKO5As8YkHN9lqjaetDysrFVZqldpMoZGTP0Yoj32d5eowuOb10h7KRNmrGzNDPyHcGgz3J1
	sGs2dHfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzOGJ-00000001ZWv-3EZa;
	Mon, 31 Mar 2025 23:09:47 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzO7g-00000001YYN-0UOs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 23:00:53 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2241ae15dcbso115799135ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 16:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743462051; x=1744066851; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5wAloBg1GSJoUoSs1Fe6e5szwOsXLtBgN31oDTUHQ8I=;
        b=4ObdL9g5z0qALL2CXUBpRBn8tLB7+SJEM4OZl/td7SM1IDrd2u4C0wxXlWoMuSvMGZ
         7uAdcUj5RX9ftlJ1//JY5wR9eX5qN26R+ia/pLu+/rxT0FaQ2Je5XTc3k1O7KgqHj7eV
         SNOwRFuWfZBtG9fDZHfSobdZ6h5PVsoj/bIRDESBtLZ9MpbqjwjfzzTjwG9EvdziZn2E
         Nd/yevr7g5sun5awekSPot0rVQFxTYnZJu6h5O/oAFKY4rHN1RXs0oM2GhsR6ZvjJlg5
         6/ekmf/pVxeVFl+qg0NHFExJFLi+t6wHjTv99MAWPJA5JSiMWbij6rw3OKIzi8s6estr
         eRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743462051; x=1744066851;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5wAloBg1GSJoUoSs1Fe6e5szwOsXLtBgN31oDTUHQ8I=;
        b=ReThotJiYc3UloO/8xOp2cvLIXQ05ZH6AnDEis6KU4ORIGdeohXgPXdfiTX0nPrhwU
         tOIYvz7KCb/mXn5FTFZY0DTmkfQ+jtRVmGOM7jUn7dHO2IL69UIlUsgtXN7icGFtNTag
         cHFYx53hB2EkFfqBWaXIG/bmXdPyDXglS48MPHcBwDTIYczcdkQWb2vE7SFKwDYW3sCp
         my5GNILTdM6T9ouL2io70rpbRqExAmrn2UkQE6r6950J2AD+KuvLofn4e4nnkcx/nJJx
         TwLQBcrXbv16p5k/lbgv5LZpVMldx+Qf4N9+FjXQix915h/0TaOTZXq2r9UI5qqWa7JZ
         30lA==
X-Forwarded-Encrypted: i=1; AJvYcCV7gAJZxlK515OkCHq98erQT834jQwZtwQowoyyOW22M1dqJLtCm8/A7tjEcefSNj83rVVUCxIK5km+ynDJPXqF@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4fHUILSLaBrK+lG2GrUOVLwd4EYD+pIMKG8tp45OkBH7Rhlhx
	gi5YPy028hqkG8OAy3nkyS4Lo0Yb1LI7FFCaGzVIGDZyKJ2L5/ia5orueUTKbQDrLhw1pZ6jUvD
	YquOtDgit7jkU/qmC1XtQvrhL+w==
X-Google-Smtp-Source: AGHT+IFhkqYe7aFPYhXhB/uXFuJRx2APqvedOXzVTYhLwQ5pf0aEv93uw3ToHTM6Wa3C2QveIbk5Q7eGKFiWITWBEiY=
X-Received: from pfbit9.prod.google.com ([2002:a05:6a00:4589:b0:736:5b36:db8f])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4fd3:b0:736:53f2:87bc with SMTP id d2e1a72fcca58-739803994b1mr16712693b3a.13.1743462050772;
 Mon, 31 Mar 2025 16:00:50 -0700 (PDT)
Date: Mon, 31 Mar 2025 16:00:26 -0700
In-Reply-To: <20250331230034.806124-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20250331230034.806124-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250331230034.806124-5-willmcvicker@google.com>
Subject: [PATCH v1 4/6] arm64: dts: exynos: gs101: Add 'local-timer-stop' to
 cpuidle nodes
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Will Deacon <willdeacon@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_160052_155271_5C3CEA2F 
X-CRM114-Status: GOOD (  11.08  )
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

From: Will Deacon <willdeacon@google.com>

In preparation for switching to the architected timer as the primary
clockevents device, mark the cpuidle nodes with the 'local-timer-stop'
property to indicate that an alternative clockevents device must be
used for waking up from the "c2" idle state.

Signed-off-by: Will Deacon <willdeacon@google.com>
[Original commit from https://android.googlesource.com/kernel/gs/+/a896fd98638047989513d05556faebd28a62b27c]
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 3de3a758f113..fd0badf24e6f 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -155,6 +155,7 @@ ananke_cpu_sleep: cpu-ananke-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
 				entry-latency-us = <70>;
 				exit-latency-us = <160>;
 				min-residency-us = <2000>;
@@ -164,6 +165,7 @@ enyo_cpu_sleep: cpu-enyo-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
 				entry-latency-us = <150>;
 				exit-latency-us = <190>;
 				min-residency-us = <2500>;
@@ -173,6 +175,7 @@ hera_cpu_sleep: cpu-hera-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
 				entry-latency-us = <235>;
 				exit-latency-us = <220>;
 				min-residency-us = <3500>;
-- 
2.49.0.472.ge94155a9ec-goog


