Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D500BCCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 04:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRLqlklMHo9ZCSuWpQYdrWIL15ypvdyDW0jPICD6Gas=; b=H/g69/p5jWaMY79b4HTi4gZKjg
	q0guve/K6n7eD9P2JN9HEZSxKGAmus8BTRjQjgwUhRV4GXLO6mxxLvFLA2Roor46aeq45X3a1pmqA
	xKwI9iiiMj0vYvHuj2xrRTIKZBf6HAsl9BmXbCuhOuKDYDG1nk4bKbjpKZ6zku51mOwvAg0nJ/820
	m1mpXMwWaMP8AQX+I5FrYiS6NiC3Lr7NMQIkDkHGr3RciKhH6bovQD1/NbTmT5a7UwR42x/CPWDU5
	Hy3hCzhz6ZbpnYRBaLGqk0KYk3WM59GRxJ7ejJJTysmcxWxaCzNqmTUOj0D+sg+ro1EhJq90zlb+b
	6uzZrmxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIXa-00000005WU6-1s4k;
	Sun, 18 Oct 2026 04:30:34 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIXX-00000005WSW-2bLl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 04:30:33 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3ab4178ee33so867702a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 21:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792297831; x=1792902631; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nRLqlklMHo9ZCSuWpQYdrWIL15ypvdyDW0jPICD6Gas=;
        b=N3NHJFMDJe+dmPAGf+R3tkj6rRuH7pDPuhWGY6xSRkiqOY5OPw8d5Qk0CKkhhitkON
         aVWCpd5o2sjzB4kg6ij6eX6JplpdJAtZhcrKmjesfK4lCZq3h6DchZNJ1OWWgUpd2N/+
         KBLALYepGjnEJ7ISJEoNurIN8hR/rOH23AdSg8TR1hx3Mx6LPR9mlX6ZBIdS1+VdreZP
         rSTgWg9HGO/1ivbUcmo03pdFdpb0wizGC0QyC8/Krm8GjFOcRPDyVh+xJKXQaoCFzIOg
         68ssiTWk+Rb6LettLbxZ0ukiPts7x2kiw0cfjwmLA6mr9Aq5Bgm8W/FLpG6mzZp6YwBi
         f50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792297831; x=1792902631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nRLqlklMHo9ZCSuWpQYdrWIL15ypvdyDW0jPICD6Gas=;
        b=eOumZYYwlJEPfDuayRiUXEi5XrUHWKGBSwKF+wcCH/h1bTbx4I3ajXZ0b9wR6hlAro
         JIHwrtWH+psHxNHh12ONFbxqP0vFMXG6hIfpB7FBt/w3Jl8Z/tu+FMsTMgM3SFBPOoC2
         3mxF9M94pEWiCfJLo9j1xoCgwY5PdInaovunWxTnrJ1C+utrKt/YxCguK3p0l3/xpdb/
         3ngZQ3kURgVHX/Z7Kdtyt58Tk5RopW2Bj3ESdIdJxjmZmn2M/LXDPK86o4Bt5XfSD0cq
         tfSn1cxRLTtMPOwgtinZq947qX7CNywv7/mJm0FvUHh9ehVyADYF8LwZvsI+znQNJF9r
         qElA==
X-Gm-Message-State: AFq9FYLHS3jKPUNCMfJ/JON9bO8l1/98N62vIxYWBkGXGbD788ZACfi6
	zSvmPsD3CdvxmzcHXdw8G51Jue4Zq4SEOdAC2UyOz6NhXhH+MRMtidfa
X-Gm-Gg: AYBFou3hapaAgatvtarm4VqIc28d9F2q2TddxenTwlj/QEc8bPvnDwkjYqE4Bgaq8LU
	Xol9YFecnZiwvQ+TXNYW3neK5vPkuqPvP5Z/UDvOu8RYw/lP4nXDzZqXu/D/XKo/6uSrhA0L8Qi
	oRyCpNpNUIAvJoHOuftYb6Crh/0j45PF+XaoppE2nvPPsomuM9pIa67bblub0r7hoQvG4GDCciq
	oXycwLZ3WktlL2CEV8VDJ4ks61NTnRlQc6V5oz71t7IhrWuI11TTLAMmMxZPH594n1WX+mrXbNE
	lCvxKvu8dDPo1haOsTwVXJTmoa1snaxLs34naqHmnGak+zDHoUMc6pcrifPCktI8t/1RxRhe1ZH
	DjYIgpiFJ6Z4/2QYZupvs//qShyMksI8LuaAd5o1EWGO4Ilelmh98wJbHQy95mNCR9W+ePffy+v
	A/bpvtOr4bYjvRBrlH2GgvccS9C8t2S7JYlte0mhnpGUAfmAYyLWQl1OzeR/S6WCs=
X-Received: by 2002:a17:90b:5870:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3aceefc0547mr3380131a91.13.1792297830714;
        Sat, 17 Oct 2026 21:30:30 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:8841:a092:12c2:47d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9e47588sm5885369a91.1.2026.10.17.21.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 21:30:30 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sun, 18 Oct 2026 04:29:23 +0000
Subject: [PATCH v2 3/4] arm64: dts: qcom: Skip suspend mode switch on
 MSM8917 and MSM8937
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-psci-fix-v2-3-35f65b59eb9a@gmail.com>
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
X-CRM114-CacheID: sfid-20261017_213031_671238_12A45D1E 
X-CRM114-Status: GOOD (  12.85  )
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

The PSCI firmware on Qualcomm MSM8917 and MSM8937 reports to support
OS-initiated suspend mode but rejects call to PSCI_SET_SUSPEND_MODE with
NOT_SUPPORTED. psci_set_osi_mode() then fails with -EOPNOTSUPP and
probe of psci-cpuidle-domain is aborted:

  psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed
  with error -95

Skip the mode switch on these platforms and continue with the topology
that was already built.

This is expected to be safe since it matches the downstream kernel
behavior, which manages the cluster power level in addition to the CPU
power level, just like Linux does when OSI is supported.

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8917.dtsi | 1 +
 arch/arm64/boot/dts/qcom/msm8937.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917.dtsi b/arch/arm64/boot/dts/qcom/msm8917.dtsi
index a2907f8a63..f0771187d0 100644
--- a/arch/arm64/boot/dts/qcom/msm8917.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917.dtsi
@@ -182,6 +182,7 @@ pmu {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		skip-suspend-mode-switch;
 
 		cluster_pd: power-domain-cluster {
 			#power-domain-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/msm8937.dtsi b/arch/arm64/boot/dts/qcom/msm8937.dtsi
index 7de6447de4..a66a544f30 100644
--- a/arch/arm64/boot/dts/qcom/msm8937.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8937.dtsi
@@ -311,6 +311,7 @@ pmu {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		skip-suspend-mode-switch;
 	};
 
 	rpm: remoteproc {

-- 
2.55.0


