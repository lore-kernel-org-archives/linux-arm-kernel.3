Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859DCCCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 04:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyrovHosLdX2LQj1aC6ideMoPUaKKiI6CstREEz9Rbg=; b=fEc1cI39ZzzeLsK2sy7aG2J8wc
	ECYv64W5ardJv8/iv2JHMZJeKiW/xdKUk1MgwYELtpreeAkGjV9TE5Tp8V24pTXVE33L5qBn3HRL0
	z6yZPPLjNrddxTSxeHPSjsdLKrOmOStjrvQV6YRqZmtEH0k0vCB6fN7aGy8qqO9KbJa/mBwNO/WLj
	To0hGdg+n3mUZkPsqHL+SuoOq/AyvpaD507nLhPU9zgxxg716lnqn0RoAPs29i0ME3oauYOcfT63L
	M0W+2kWD8YjXFc8pyrXDFPCfgmkfiTIINc90vyDHUCBtlfh9hk6+weSvqvvt/t2XJZg6uzm6wHB18
	4LVZDvxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIXi-00000005WY8-2KGC;
	Sun, 18 Oct 2026 04:30:42 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIXg-00000005WWZ-0fDq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 04:30:42 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38759bcd877so653302a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 21:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792297839; x=1792902639; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JyrovHosLdX2LQj1aC6ideMoPUaKKiI6CstREEz9Rbg=;
        b=h6GaDXH94qH+sgl+y/fYIBj0ppuSGfPrrm/X/K+pJN2h/dloDWo2N0tx+uKqqW8VNT
         LrCSCCDOs9EY79If8RE3MbLPy/hnbedOlNax6uw8yGviKhItH+iGfQU4oTT1oorch16K
         aGAtsAQGZvInq6yTAmLYBFLkCyfxnaSbLGBWDC97ZssTQ2V+6lxzWejKsM0uEdGVQand
         qPKBPkvgde0wUqkpFvuz6nzxjwYclNtmgx+BOFtwbqXL9mxThaE2MhRBpiir/z3HNUn+
         Eom8a0HykEk+Vx+vCgPrr6QF3ZDT9azN1LxfaOqN8PplFoSnDRfHd/tMNHC0K/NcG71N
         aClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792297839; x=1792902639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JyrovHosLdX2LQj1aC6ideMoPUaKKiI6CstREEz9Rbg=;
        b=W9M0wpvF0yeTS/F7Si8eQofDtLOLPLz0e9uKzPqRQBmwkKajKgzEEeu/yN6ojhboWs
         SRpotWg0lw3TLR7P5JbDVB4iVqjiVWbMa7/Jjh0aM/ZsrPQR2HBeYTLLWj2awfdYiZ37
         JBPSxU1DOgYjTaQxnoklxe9VliuspIu/2uXzDF3bsPqg/gD+IkSSGEBsxPntwL98tDlZ
         GPlyVAVKV3AN2hCc6YIJC+STYu1URvRjbxbt9Jxwgh4Wo3QiwPVWlHW+C6ea3qIdafNJ
         gGQNCanWLrC1nP7slLBtMAKFPM358QHPCUQv5miNbinw2Yf7B7gw1OTds4vEazMFhkAw
         IHpw==
X-Gm-Message-State: AFq9FYL7J7Yb18ekMwQYDzqYLi/YlCr9biAyHB6ed6TV8jbRyuIV+M/9
	f3JgMZ4Dp8HxYUr5l0Sd0ypIKKVGvyMkPLFNoHmz0ErSxYoxwi/YH3Ke
X-Gm-Gg: AYBFou2rdY7yOclA/sz4CijqeXHRq0sYq89ojiVjGQvB/HV9i+yPgd+SboRRvPzkgaf
	N2yYhzV6lsn1H92IFiZNE9cy86F/746aT7CWc9i65Ny+2K5gvlfMDyZcVm0r9yOm0t9Hp8L4gEp
	7n71vkNhAdTVR3scyOWk04UTSpY0PC6IHJWmYhm3Woqs4fC8Fj92ER87KPmKHadu5lsA836HYt2
	Zc8Rn6R/NTGbm3O87rdAdPzI1c/KSzqC70AMjC4mHbCbak8fOPbmAy+NegKEOKrAY4OIg7Jz8w6
	2vi6FQODhEtx7IbGODeXunfPoqbBPSocRwe1nqQdl8gUgoTNgm0Ar8O9GZgLDAAQfm97SV9ejB2
	a1SuXfI2QSl4kWoG6vOUPLHwSdUwqwAgUmBTj4gLvQIKPvXjKVKa2Lv0Zi0eO3EZKh262dc3XeB
	Ao6o9Di7YyGVofmKYEkKqTW3CKMHYD/XElD0TYeoHq8FWaFMnYMtxoJOJqxIMWKcg=
X-Received: by 2002:a17:90b:380b:b0:39e:59a0:46b5 with SMTP id 98e67ed59e1d1-3acef14451fmr3843389a91.24.1792297839161;
        Sat, 17 Oct 2026 21:30:39 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:8841:a092:12c2:47d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9e47588sm5885369a91.1.2026.10.17.21.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 21:30:38 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sun, 18 Oct 2026 04:29:24 +0000
Subject: [PATCH v2 4/4] arm64: dts: qcom: msm8917: Use a shallower cluster
 state to fix unresponsive idle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-psci-fix-v2-4-35f65b59eb9a@gmail.com>
References: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
In-Reply-To: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Val Packett <val@packett.cool>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_213040_195333_91B1E1B5 
X-CRM114-Status: GOOD (  14.56  )
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

MSM8917 is a single cluster SoC, so powering down the cluster means
powering down the whole system. This causes two problems:

1. The system becomes unresponsive, even to common interrupts. Waking it
   requires an interrupt from the MPM (MSM Power Manager) or scheduling
   the MPM to wake the system later. Linux currently has no way of doing
   the latter, so the cluster may never resume operation.

2. Entering power collapse blanks the screen. When the state is entered
   and exited repeatedly, this shows up as visible flicker.

Even if MPM scheduling were implemented, the second problem would remain
and it wouldn't fix the system being unresponsive at idle.

Replace the idle state with PSCI mode 4 (dubbed GDHS downstream), which
is less aggressive and can wake up from conventional interrupt sources.

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8917.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8917.dtsi b/arch/arm64/boot/dts/qcom/msm8917.dtsi
index f0771187d0..7730977e6e 100644
--- a/arch/arm64/boot/dts/qcom/msm8917.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917.dtsi
@@ -112,10 +112,10 @@ core3 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
-				arm,psci-suspend-param = <0x41000053>;
-				entry-latency-us = <700>;
-				exit-latency-us = <1000>;
-				min-residency-us = <6500>;
+				arm,psci-suspend-param = <0x41000043>;
+				entry-latency-us = <240>;
+				exit-latency-us = <280>;
+				min-residency-us = <806>;
 			};
 		};
 

-- 
2.55.0


