Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BCACCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 16:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kv1aGnhKIy4dQPOs4e+ES3Qr9yc3Tep8lN5nihq3WSc=; b=Sijts+XArx8rgY
	06vSUXBPsXLp6xE2wnTRhClVbD+L8fUDmH7NEZ/lRXZXVXIGfwGlPXgWnw1kUXf1oon9OvQePwOeh
	1E8fg/Jd81E7aqu6yQZ2W3SjMS8EbGzCtM8B+bCCG2gHD2ssWF5NKxYK+P+Avol2c7+HcyIqqeLje
	T8vDlmz8XqEUkcQZqUiaLCL6SUiHfQH5R0DQkONEGW/eofMcLCfEHEbVdcYH4jngRxHKW/qixORmC
	qkHvO2H5eNlBt5NDqXt50pVDJGKBqbV/BS6BmbcEpA6i7/XACXUbPCT58GpqGPRghqeZmGgGot1Mm
	pYjUwdMNc8Yv1mgq3puA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7UV-00000004wgs-3swb;
	Sat, 17 Oct 2026 16:42:39 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7UT-00000004wgV-35Re
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 16:42:38 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so683651a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792255356; x=1792860156; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kv1aGnhKIy4dQPOs4e+ES3Qr9yc3Tep8lN5nihq3WSc=;
        b=mVU8ytKb11PqbXVxTnxWq/2/DhNSWEkGm5E1KtPeqxBXW3mx2GUEcf5+oG2ARBsAPS
         bPXYBEk7QXXuRpMBszxJa5BKmpbqdX8l0D7ouiTgedPWCYBmBI5lHa8ei0jFWQ1hzwIx
         Tge/ApxfeUGawGpF2Q09NzNGOYMbe5a+xUtYyWDOkI3mCYGBgNNUBFR6hpybe2lcHoQp
         EYPeax9sH3kv1faRDYFhayX74B1AJesUeWZ479QH9xYZBqVBK5gMfr05VZuJ6aPVGezN
         YlxRCpfo5xpL1LWPXVbzaflhD4AiDJjXULDqQFYXi0z8KT6ZBP1N3fs4aYx/WqAtvNVa
         U7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255356; x=1792860156;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kv1aGnhKIy4dQPOs4e+ES3Qr9yc3Tep8lN5nihq3WSc=;
        b=LGHrCxBoHU+tuNouuFgk3wA3n8zqinCSzX0VNZA/9DpuZC3+qyRdaHbAneR3Mgm3Rl
         p79e5rfesv2TRJ1qHOST3xItKBUIakK+pdJ7zI8bZGWAWjhXOMJkI1Dev9hw4LL54nex
         RYmMo59Da3QmA7BPeffKRZsLT6Z4DjyFm8r7NyiFsEGwwZSlUJf76b5I09OFnuuninPg
         z8a9avnQ55vVfFyYQ5h5l0UuvjikqwXnagq0KiXP7x9couuMWDP2LF6q4hTYHJ5WsLv0
         0MTChyrk62iGDmuuEfPYNQoQwVvhcjV/XGNTBtnXGH7Z5olH4O9qf1L6UN2EmT9rrdIx
         SVUA==
X-Gm-Message-State: AFq9FYIzTaMtGNjxNBtmd0h+wJzxP+qe5GGuTDb5NOn2g4laa1+oMkTx
	AOEtsMOA4qBK577GQuB2cChGDDu9mv9HjtBddTGJzcVHRN4AnBpusW6x
X-Gm-Gg: AYBFou14VPbSELiKXeVq0VYQkhqBx+49kS1EZIh6opW0ALkWSlqectpyKByND4LUBky
	rUZpZ5WycjTSFdbCy3o5G0HIpKzBZK/SleJto8MxG2e8g/+FgiiJt4SzGDoCWvXMCGjD0bDYYKM
	lWF6+weaUDeePCQSbMWFkX0RggMjbyWFkXEzBrI25aftTPANjgp2HR61ZB0ltIlj6kehGrO5eLX
	2rUAjI4KGnV89LHRIDX1rs495MKCRoot94ONcrr1Ofzd43IyeI4q7AHcjme+fdPbHy1r1aIULvG
	dSJqfWLaMohXihJKCz/ArfHnYK3nUupvP/fN2JZC7fS9VZuF+EOa4j0o9YulyPi2I28PRneCe+t
	ei8NPr881W+fQQXi8QSsNFlQL2mK1VZUy0+a/T0DnZk22wwj72+MA1hkVHCew/7I0aOkZU5nWzf
	12t/HgOAPVId/A2E6PyPvUfoQY9e1vsXaosqpih/RjJiZi8FBx6iokWojpVpMuzQ==
X-Received: by 2002:a17:90b:4c8c:b0:3a7:ecab:c4c7 with SMTP id 98e67ed59e1d1-3acef1486bemr2929602a91.34.1792255356104;
        Sat, 17 Oct 2026 09:42:36 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:2cb7:b2e6:ffb7:d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94798212sm13816164a91.14.2026.10.17.09.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:42:34 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH 0/4] Fix PSCI on MSM8917 and MSM8937
Date: Sat, 17 Oct 2026 23:41:22 +0700
Message-Id: <20261017-psci-fix-v1-0-dedae27e4a31@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQqAIBAE0F+JPSeogUS/Eh1M19oOFW5FIP57V
 sc3zEwCxkjI0FUJIl7EtK0Fqq7AzXadUJAvBi21UVI1YmdHItAtWqud9EYbEyyU+h6xxN9VP/z
 mc1zQHe8ecn4AiZ//EGwAAAA=
X-Change-ID: 20261013-psci-fix-8a2c0d6266fa
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
 linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_094237_784987_4AC6A1F7 
X-CRM114-Status: GOOD (  12.08  )
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

PSCI on Qualcomm MSM8917 and MSM8937 advertises support for OS-initiated
mode through PSCI_FEATURES, but rejects every PSCI_SET_SUSPEND_MODE call
with NOT_SUPPORTED. The cpuidle-psci-domain driver treats this as a
fatal error, so probe fails and the CPU PM domain topology is never
registered:

  psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed
  with error -95

This series adds a "skip-suspend-mode-switch" property to the PSCI node.
When present, cpuidle-psci-domain does not call psci_set_osi_mode() and
continues with the topology it has already built.

Skipping the switch is expected to be safe on these platforms since it
matches the behavior of the downstream kernel, which manages the
cluster power level in addition to the CPU power level, just as Linux
does when OSI is supported.

Additionally, it also adds the property to the PSCI node for both
platforms. For MSM8917, additional change is added to fix the system
being unresponsive at idle.

---
Alejandro Tafalla (2):
      dt-bindings: arm: psci: Add skip-suspend-mode-switch property
      cpuidle: psci: Allow skipping the suspend mode switch

Reza Kurniawan (2):
      arm64: dts: qcom: Skip suspend mode switch on MSM8917 and MSM8937
      arm64: dts: qcom: msm8917: Use a shallower cluster state to fix unresponsive idle

 Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
 arch/arm64/boot/dts/qcom/msm8917.dtsi           |  9 +++++----
 arch/arm64/boot/dts/qcom/msm8937.dtsi           |  1 +
 drivers/cpuidle/cpuidle-psci-domain.c           | 16 ++++++++++------
 4 files changed, 29 insertions(+), 10 deletions(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261013-psci-fix-8a2c0d6266fa

Best regards,
--  
Reza Kurniawan <imkyufie@gmail.com>


