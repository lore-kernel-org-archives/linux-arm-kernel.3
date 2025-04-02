Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EEEC36018
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 00:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wAloBg1GSJoUoSs1Fe6e5szwOsXLtBgN31oDTUHQ8I=; b=B3/sO+5q3rDGNbFvnNz8kvV49j
	QqEysxkqHFepreMycSXyEt0yiB0NeETwJ2fQOBXhLcwdSvCDCa0aM+PDkMHOAMbjgQHh9K+5TkcCJ
	b+e3n4ci6kvYTquLKHeDVRB4B+Rc2pU3zDFRLYkoQObIjLSbMs9gWzy4sI4luUGVED3qUGSJh9/+b
	9kks7i2WpIRVVh9KTV40ZB/yffOFx1bQHshSyA+Olf/vnyAwIvMfjDjxDwEWBFZaI9cQy5JGyYDDi
	a0VTOwWAaRgiVE1qgg84puEQ2GI3OXqtbdgQQWBqLEH7UCb4CiDS4RmFW3uLwz+7yKvLsk5XHWvoe
	bNLHsGzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u082z-00000007SsV-3KoG;
	Thu, 03 Apr 2025 00:03:05 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07bg-00000007QCY-1a8U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 23:34:53 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ff798e8c90so263354a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 16:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743636891; x=1744241691; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5wAloBg1GSJoUoSs1Fe6e5szwOsXLtBgN31oDTUHQ8I=;
        b=NUPH2rutVY4L2pElykOpdUkWpG8VQ6VYw1cgWw0nbw7wKkvjLddZMEQ0A2d12P/mWN
         +algsWhxYzkkoLIJpHZZgbwC3pGZMwXtyA6dtWeLAuUKVQ903haG+oNpmb3CXioo/rnI
         o/iXzc/dHlDlsXL6IbEdA6mAN5ltIwdrlL7qyHM1dl2PghRyXmOgb3Y6/zsIRkHqBpWH
         UWTCaTpjVPAolEgsUNLnxdEfyOHeJAeeievzWxzGvchXk2pLW/H1kVzCHg5ZF5+yNP1V
         IXSNTT4UUZBS/TsnnVp4aQFkDFpaAudTXJc/Rv4N5dA9C7+zd6Gf29lQagXkBn7xH4td
         1FHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743636891; x=1744241691;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5wAloBg1GSJoUoSs1Fe6e5szwOsXLtBgN31oDTUHQ8I=;
        b=rWkmS5BsyG1vWK36UsRGZSy0rfGlLIA/pvj5DaEJSTB1iKNemaxGW9Z0E2Hp//Iz2J
         B9DlzNb3RaAic/r9CkJaoCB6tm7oo2M4VOYRi7nbfsIuMNKGCkG/j+hK8T7N37N22Ctx
         mqY6fRVtvHb3oAybjx8draLbeZRbxHyeKMn+NidpuhOMYjJ0/YiaQHWMd7DICt3Si7Mh
         bS2KH3Szm0iSXJTL/0E6RN0LksCxK/bZGkhbvXgJxhlVbHaQZWQXp95mQ6lG/FSSYovf
         7YcGFTrgxpNKD2CZQc91nNLK/hgE/+6toosZmx7V2sKm4tjoMqy1fEDBlPWJhljgQRHh
         7OFw==
X-Forwarded-Encrypted: i=1; AJvYcCUlOIOh7nw7P3IOKuwaDJ+3oFzvnM6cDpfs6MzfrJdMkslH9FCEim2odML/emcL6DLv7yiEkE2Jr7t3lvrxuGF0@lists.infradead.org
X-Gm-Message-State: AOJu0YyMhJKDdcSovVO4bOE9d8NaQvq0piOEHFxxBRdZrAH3iJ2uRuvE
	KEtJ1I1sPEhWHAjPUEeqOfVJCdeH3o/vNeYnvg17ciUj/UQTvVIUf6vbhoZ8sUNiPs+K9OpDpM2
	UhMmLfCfWTmoJ4owJZ2QZ+oFs4A==
X-Google-Smtp-Source: AGHT+IEiKn3CQVmPMTLKprEJLyfSe5jv8B99g5wOxhodbCJvNHuufgRdp4KFjo2AWb/3XvYfkZ3bTBmaSOWf4m+NNUs=
X-Received: from pjbqn7.prod.google.com ([2002:a17:90b:3d47:b0:2e9:38ea:ca0f])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2dcd:b0:2f6:d266:f45e with SMTP id 98e67ed59e1d1-3057cbcf16amr864128a91.2.1743636891016;
 Wed, 02 Apr 2025 16:34:51 -0700 (PDT)
Date: Wed,  2 Apr 2025 16:33:55 -0700
In-Reply-To: <20250402233407.2452429-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402233407.2452429-5-willmcvicker@google.com>
Subject: [PATCH v2 4/7] arm64: dts: exynos: gs101: Add 'local-timer-stop' to
 cpuidle nodes
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Will Deacon <willdeacon@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_163452_408879_93880060 
X-CRM114-Status: GOOD (  11.96  )
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


