Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603B4CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 16:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRLqlklMHo9ZCSuWpQYdrWIL15ypvdyDW0jPICD6Gas=; b=ZsZlakGx0uoxpl8KdCtHG7aJDM
	0BQTSj5hRCXkAh+X/Qwcv7Y0Sa9vFIz9NObyloytPKnT9qHxzviJWDk5zfgeQDos3ZsIERFDRs5YI
	/MKjMqUPhl8ZTdGe/TatXM+aNmodwpcSqyU3/adw2UICGQk3ob17aa8zUFt0Jc7OPDlkqaR3xwoaX
	2zAJ3BOwoP+v0Ef6oIDa4Yjbl8XcyTc7G2+5/N5mS9jgQzT0d0c+QNcvF8Z8JUQAhSQOkGEY3D7Qr
	bSaD8al/i5S9x/GGbpwufiisVyd3T5iB1K/IoZhVwE1R7RKXxhvqjaxWftBAp0FsR68C3PTRuaT9z
	SC5Zoiow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7Ut-00000004wuN-3MRS;
	Sat, 17 Oct 2026 16:43:05 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7Un-00000004wpG-0WYd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 16:42:58 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso413841a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792255376; x=1792860176; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nRLqlklMHo9ZCSuWpQYdrWIL15ypvdyDW0jPICD6Gas=;
        b=MYhwkoHmEHeb9te3bLQekZnjPo7ERxOOwUccPqxjuZakTxScDsISAuRqE6d3Hkhikh
         XnwZVsHfls2+p9F0gd/V5uvZrqRvus6lWcgK+lFswk6Vw1dxmcVL3dfYeCHR1jXl5RxV
         EDva5IHwkSOAW8+3ni9Jndn7FAoAjPnTvaFWnICv7RIHBK8SMgo3imnkIO0bD5QTfLuE
         6Px8zTG6HnWfbDYoDFXgUOD6VKxlcOAms0PZaS13UD7WClJ8IvlM+dpn4PA9Tk4wXQLN
         461Qz7uMp6iy4EmmFcbQnVmrJncLZiSbTuthCTyg86E+dk6BEACdaDz8fou2QMDyGxhL
         1Raw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255376; x=1792860176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nRLqlklMHo9ZCSuWpQYdrWIL15ypvdyDW0jPICD6Gas=;
        b=X4gfEqK5ZDnKh21fnTxpmy6/X48DaEsr8/GKv1eZiklytrObEmJaSXnKpeytXSdsoq
         djzsQofKdWqXWtUbdKCQ3vhgDAuuv+AuJpK9CzmdF5yzZFMY0MhwcvUpgosnWxncWx3h
         X4Nk4Tua3OZ14UR88zYe7/c3hMlfEaFS+9b8VQmCLuRtuB9tTGlnfi28J/CsvpplgulN
         GtFLTe7Dxm6TJYAJoLYzNTFHb7rIRbXvOXNabSi0IDu1q5xsLpoYEjW7ThZB7g627Yjm
         fLASH5yOoMuN6P4HF4zuAp5k18SL5qVB36GRGiWNZJ8wtvjs6tunQm+c9P72sTaEdqAI
         rU8w==
X-Gm-Message-State: AFq9FYI8uaHX60Yv5E7ZdNwyuLaFhXmnoe0EhoqUGSIipRPZNY0+S6bz
	3z/brVWHh1DXyPMeUU1FmGpvRX3uKSVVMa500NGXbI31AbiC7m3S5Bb+
X-Gm-Gg: AYBFou2A/AQEYsU+v0WKTKLT+cOz9UACVKOgg/ebsXj9JFT+WJYdHvVTtJ9//sGC2O0
	+EC6PN/569pqbq0P6/sQLFUW7eFsKgRibIz+QmgWQNlu0wF6lk1XK0xYQXRa/UJZvNEH8TMgHIM
	v1NHr4BiTD+lzZ73fkCEcufk+wygKJLmbWVs1qT10eA1hQ7UJPjW2JcFBQr4fPrbsAUQYBUxyEb
	6aO8KVOedeYNRx09eznDFSucX14DjVrB2ceu1RWdc1bMBSbxD6kN0UO7jAuC6WWVFHqY4Tz8NQF
	fWTfcI0OzXgDIKk3apC4KTGeDKjBNH6IevMVwpD6NyzSqhKYifPgUgpefJw4+o+aeoWDt8XkT9L
	5Z4rrRKZg9XudQ9vq8Kd/8WWWhv6hUy45HuViw1H6X+1B+8JVn8ynKBWEV3QtwOy0AAcKatKTQj
	TuRr3+pWdCVRtUSBsjWPDZE3x+ZYeb3BxtyylI2YOPCBF/kV9m8iZ0g2R1wq+tHg==
X-Received: by 2002:a17:90a:fc48:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3acef14544bmr3161802a91.26.1792255376492;
        Sat, 17 Oct 2026 09:42:56 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:2cb7:b2e6:ffb7:d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94798212sm13816164a91.14.2026.10.17.09.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:42:55 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sat, 17 Oct 2026 23:41:25 +0700
Subject: [PATCH 3/4] arm64: dts: qcom: Skip suspend mode switch on MSM8917
 and MSM8937
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-psci-fix-v1-3-dedae27e4a31@gmail.com>
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
X-CRM114-CacheID: sfid-20261017_094257_185391_E57757D8 
X-CRM114-Status: GOOD (  12.59  )
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


