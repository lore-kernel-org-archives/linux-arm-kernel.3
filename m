Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E33C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bCifOtjJgtGCGYHxQm4Y6gSh+lcRpiB2BE8yhc0wPw=; b=Dq1jvYaEaCetNKVuPdRxAGXAu3
	7OhFzDLCp1p/W2yxefzyNOgwwEwkqYKINYTRH11YxhdhXlTcQ4T0T6lqR7+0TtwDnCS5zwH8Bf5Nc
	rOApfYAfrZgPbRgx98PB1dqFc/syvfzSk40CcxjNJg4hqchwcfgO9UoAMiXt65IlvZdocwWqaehB8
	uGguK8NWrLnLt42T71kT8E7ob4xQkwvQO8uNfPzJuIyxOtP5iPbUD/psI1RoOj2ZVRwRseuDloFc5
	3tFnP1tWPFssH46pWF8Yq3R3f3rywN+TMtfBOKDTuv9Xk4k0HkCki61lrTyhK/PK6FQdm+4CQ39/a
	5mIN1GVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEOm-00000008wnK-1J3A;
	Mon, 13 Jul 2026 11:00:32 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEOb-00000008wfa-1Cco
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:00:26 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso1733648a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 04:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1783940420; x=1784545220; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1bCifOtjJgtGCGYHxQm4Y6gSh+lcRpiB2BE8yhc0wPw=;
        b=AdS3s3v5N/phoysJ/jqVHQTuoIJKB7pxpzseNNsxKHjsPAVskA9bLdyCefjN3l6rWP
         rJ2skuymnO4PWlX9nIk2TrZSDBCG95a/K+QFJb8prf9eC2/PcGsQmiqDFjV6FTo0UJR9
         kN1mNdH/7RB6L4w3iSmPghkZKa4y6jqXHX34s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940420; x=1784545220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1bCifOtjJgtGCGYHxQm4Y6gSh+lcRpiB2BE8yhc0wPw=;
        b=DdKK9sI+QHFHCq9K5hzr1m6Y+K5bBzbY2RKSCzqeBFnqs0yKLsmeTPohgQI5Gi1Zye
         VoRTGOw4Xkwj21oTN0SLweMxItALx3t1nlfn6YUMgiPsnWWhlZ/e9bNajimNpGzsB0uW
         Nas81EUG+zzxEDvT6HXhV0FJuZ7c7PdAw1jIIlJthw7XYlJrAQmH3GQFYzNzvc3eQbsx
         +plHzJ4/Y23o5TnWt0uy9oN4uVgDLi8h2VOK01lxWeLxK2Zwa9v15bYyHLWsTC6LYefI
         NrEe4sfvpJt6YAqCcuYtq/0LHetlhVQMB6sOJ4PWzhgt2H4O/Bvl1OyKrWsbZEdvVSwd
         +FIQ==
X-Gm-Message-State: AOJu0YzNZHkW/WLh38DGDE/LTXdFwQDbSrC/dElLSq54+eGgwnoSLsFy
	+QNipL2IcblEl6lavXyz3tKJW8EgkfpbJF9L8k3oOr/NtyCCUjO+JY0iUtelqiOpHnl9NrrzOI+
	mrfBr
X-Gm-Gg: AfdE7ckZgRJnaENpjtoe7+3jz3eyhbcwG9fyYq39lMuMy2Ulhk1fD2xJ4rDWipWoCLs
	MEX4RceXEKdbntVHdNSm//ItMDWBPi852VLkhEiHXgd59h2NcLU8LESBPGLlB8Royryntia2Olz
	s8vQejAHnk4ZAFfFDLb8FJMXECs3a2m97PxYirfbqTI0pyTv4aKSJTCCu5HWDFtq3/ZfR8FDGt8
	Hwq4lmG4L5I0/53VvQzBG7Ne6DPExIb8f1W9Z8p0vEm0i9q2rP7e6yx/5g6pjkVo4HU6hVNMJux
	ADQJp7KxLJ/J08j54VOjJPLsQGpzX6hM4GGLxjHMObMT5YiGlF7ensksTCSLuEOjCu1v1UmhDFZ
	1U9TAWCNamnlITgVUczdU/3oIBVFjcLBVbnvJULXVdXnKkofyqMtate6wobO1RupuEt1/DPJAs/
	TwuWYqg+SIcmVoA77ecA+AWvAmXw==
X-Received: by 2002:a05:6a00:1789:b0:847:770f:da4c with SMTP id d2e1a72fcca58-84889633826mr7816881b3a.16.1783940420396;
        Mon, 13 Jul 2026 04:00:20 -0700 (PDT)
Received: from kinako.work.home.arpa ([2400:4162:2428:2ffe:a973:53e4:1a28:8545])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-84909673e32sm3019597b3a.56.2026.07.13.04.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:00:19 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: linux-arm-kernel@lists.infradead.org
Cc: romain.perier@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 4/8] ARM: dts: mstar: unitv2: Link cpu to core regulator
Date: Mon, 13 Jul 2026 19:59:46 +0900
Message-ID: <20260713105950.1346962-5-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713105950.1346962-1-daniel@thingy.jp>
References: <20260713105950.1346962-1-daniel@thingy.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_040021_371074_09AD030E 
X-CRM114-Status: GOOD (  10.98  )
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

From: Daniel Palmer <daniel@0x0f.com>

Reference the core voltage regulator as the CPU supply so the
regulator is described as feeding the CPU.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
index b5a282cd1a67..6c1ae3e10875 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
+++ b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
@@ -85,6 +85,10 @@ reg_vcc_wifi: regulator-vcc-wifi {
 	};
 };
 
+&cpu0 {
+	cpu-supply = <&reg_vcc_core>;
+};
+
 &pm_uart {
 	status = "okay";
 };
-- 
2.53.0


