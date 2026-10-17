Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC73CCF2C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 16:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyrovHosLdX2LQj1aC6ideMoPUaKKiI6CstREEz9Rbg=; b=ovGaj8yp1FnH3Bt5vg5N5XN0Py
	d59AXbNzuJNUlJd99URK3mYaTP8H2dacN/omc3Nt7pVAP7DM8lmdLXsXuBrQQs1vFs5XlyqgzdOIj
	Yi1DQPG0OVDSrS/b7RivXPRTK2SrQJHMY4Wj/9HySHFs3yehvTMBIwYh58wgrCF3rWjyLWuS5HkR/
	V05CRaWiOqygY/Q9DTif7NUihSqRtHreMh6JmH6OzRO71vrrPXB+wQxJUrnU9XX7T10NK2ZBVqVgt
	iar0kSVKAGdhO63BN79knZa4XSCuyQBaNw1G2SXvW3+DUcD+ky5jqDkdzA1GHCpazyXOIOybg1JWf
	BZfAPlkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7Uy-00000004wy9-2uow;
	Sat, 17 Oct 2026 16:43:08 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7Uu-00000004wuP-27YN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 16:43:06 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3ab98332238so666952a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792255383; x=1792860183; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JyrovHosLdX2LQj1aC6ideMoPUaKKiI6CstREEz9Rbg=;
        b=kivGv9zxPYOVwmT7i1LzMN0l8BEd6+PsGUjoWvkq42FlXbradgRhWyDgEw2hCqkgoO
         d/79/n3i8reO32q0A7rvrZTHBz/4Eunc0JVmxKUK1bwAQxaq0saPnnkFiyLxfAbAemfJ
         vMvo6mncOwjEjhLJJdtekg+td+aB/AuxlB2guLw0IxeOAuupTUcxIuSRcK49Fjxy2BOj
         yY7pfhE6w68NqQIVkwserr6FVvVhV+gG7wfud+TPiFLEgy5EBwqwXZ4C1myURfSfSeuO
         NsVc9oZWLM/rxvAqc03CRjDcBxoO+jzl1nqyhnsqSbr79ZCdFMK7bWea9teBUGg56W4C
         45XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255383; x=1792860183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JyrovHosLdX2LQj1aC6ideMoPUaKKiI6CstREEz9Rbg=;
        b=pWSc2tHuwl4B+QbNym+dyLhD5HhwTLoDc58fb8kX5absM1sBdf+Ss5kr5vUqhqAnkg
         jqWbTmyQyTtJLDOBJzA97WJTv5/yMGnusfxpRSYsRyO+TZG5LIIvfT2ZObZRaNebfSWh
         pvO7ILyJFtTCLPLHIzJxivvCHaW0d5LXJoV0EAlhJGGiwiiJMHVTaUIMhF3OMY596/2q
         5ZCWfKwnS5FEnv1CbA7oFiJmn1zd86ZFsNffAv4k7L6xCGvlwNCnVpC073UfLiprDT9M
         d7JCqYauoq0GoFQEBsuO7fjnZ/EHzo9d/aLkomf06sD/iIQrRoDHAPgUMiWrkaYGaAoC
         kKzw==
X-Gm-Message-State: AFq9FYLnzaiUtE78aPGTWYq2AoCq+d6lNHURlooj3oV414T/Br2Xfy8z
	5hlEbmWJJ32CpuKwY4g8RttKkkiVM+J7d75gZVYlARs8kdTtExHXxS7G5FR2+A==
X-Gm-Gg: AYBFou3pOc6ipXDD5zpJsjpDYGCXWTgyeazral2aUCs3s2pYecDRjaI5MbO7RXVjgDk
	sZyugL3LT8RH2JGxMWILeeDEBUgklkSI7G7cDh+gMgH5pI9Z+HR6rfkfHjp+DtMBg1641x/29J5
	6722xBBNJnotWcCryH52DpDiawTXHjGZ2CPpqo0do4uK/T/UNKd1l6v1O9A0RDwAeB/OA7xP3zG
	M8dvn4lNMEARZv/HKxuRy3SRfOR+ERGeMj8XHy490Ni4LJ3Rqu0e8DBm9GolIL+G3G00bVp+z6z
	v0vYckCuTfJDdXPvtocE/M0X4gctgQQpMS+FEwcKclm4vGQ5fHL965hQ+FKQYb8ofPbrCv0X2I+
	FlUNQbuMYsQbdpiqORMQEBdpki7+fLRGH+lDS6wwnDMIzpG/CjfQzFsUBSax9qbxAdKCyLV/LHu
	Rj+0q57O4fmv10VcVoKJin7PJFs2oQW/E5GwGBmVCrf3O7vzTrHk4gRJcvWgf+Mg==
X-Received: by 2002:a17:90b:582d:b0:3ac:8897:7b98 with SMTP id 98e67ed59e1d1-3acef1455edmr2772023a91.32.1792255383602;
        Sat, 17 Oct 2026 09:43:03 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:2cb7:b2e6:ffb7:d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94798212sm13816164a91.14.2026.10.17.09.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:43:02 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sat, 17 Oct 2026 23:41:26 +0700
Subject: [PATCH 4/4] arm64: dts: qcom: msm8917: Use a shallower cluster
 state to fix unresponsive idle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-psci-fix-v1-4-dedae27e4a31@gmail.com>
References: <20261017-psci-fix-v1-0-dedae27e4a31@gmail.com>
In-Reply-To: <20261017-psci-fix-v1-0-dedae27e4a31@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_094305_504721_150A7877 
X-CRM114-Status: GOOD (  14.16  )
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


