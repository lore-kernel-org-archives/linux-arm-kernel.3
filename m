Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5D1CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 04:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VWSV2lYeWe6uhtDKhgh0Nkoh2az0FS4A25FIOTm7cLg=; b=kUoATLL9JaMeu/
	9gO4E4No749noeTfjxIaqldOjJ3Zq+h80ww8P5PmtVm9XrJRi7WRTP5JtLy9MWZ0VGHdtLEUjhQkd
	GD/smAUFpZlp+5bQ0yRJasHa266ABbq8ifEinyE2+bvYrU24ASBpUW478frccJpT8ghbbk+dpo0wb
	TsakaGV9C98YwzApK2MgMxJaCIHyNS898bkuZfId9r0FWX6Lw9MEeY9Q5rhoZ4AseAbhGGma0Z5CP
	WOljAyGFsusIfymVW4LptYXAjeNYWL9XED/v6z4jEKpDIbbaM8MlzUsgFkIPLg5t01YnhXneV5Fhm
	kKsG6VAQ5Vbc1OXqIx1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIX2-00000005WJF-4750;
	Sun, 18 Oct 2026 04:30:00 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIX0-00000005WIa-16ml
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 04:29:59 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so676262a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 21:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792297797; x=1792902597; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VWSV2lYeWe6uhtDKhgh0Nkoh2az0FS4A25FIOTm7cLg=;
        b=RJhM6Ws9YA5KJURCsPLK3K/Z7fvpGZgd8B2V93OFLuQg9crQJSg8dgLWf7Sy0u9VkE
         WtrrJeVIINHBSVXtImlxpWhhRJ9K9azUb5ozC2HBBeIRcGUr/7i1roon7fPz8Uy7wTV5
         OZtjyS9Gfm7iBDpYkqgak97zzaJjFrEF6k/UqN0DFNNhIWa8R6ii1uffb/vohVKVBgG0
         IJhND4FaedSC0TvxyJoAusHmIr+tDi+qGWRLgKPtQ3EqIfzZQEN5LHrLAZhY7PsOn08J
         4FgOvnpB6DfmvzKquisl4LVTD37lw+63C3sLTZUF3DVcaxBo6ThADZt0DIJRhnokVoaW
         0wjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792297797; x=1792902597;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VWSV2lYeWe6uhtDKhgh0Nkoh2az0FS4A25FIOTm7cLg=;
        b=tG4O2XxnLEv2oYSLF3o+fKfDD2iHu5wx+lDeXDEAIfqpVd3LlsXkMAIHxM5bEE7DLP
         uM6r4sKnEiYkSoT+xqqr0kksufJhs0soFbHI3dr5DxmQbtjvEOmddpnvsub4p1BQsyCx
         urieHxHeF4RnAQXomrOl9+ycTFtMe83kssZ/Lyf+vRzvPPdnBs08W2vk7y7FLV9LvZKX
         ZrGQt9Ds8lYQsLaVXPzQWefK29BXBQHX4LVpt4kZaRS1y2R2FBK3NbXWD35uPr9qeN3j
         NqcHgT667ma9AiHMc/JwiQKc4hfIfvN8hx96EsJ8G5ehLOe0RQH80cSYzbK1W6zmEjIt
         pRJA==
X-Gm-Message-State: AFq9FYIDy/r5P2wZEUsFkdsUEBsK9HnfcYjADRg1AcdORKz5/nv0Ahy4
	8yQEcgEFf8gdSSF6QpxbmZy4ojweM7P+WGDvvuixTBvyv6f97453syP1PRwXLw==
X-Gm-Gg: AYBFou1UWSx8uVFn3DPNGoWO4qLxY9NvhgzLpTEhJpHRXp8AUm6mMRds3ipodY9xNQb
	ItHTSjdA4wy9jJV5GNJbftYM7sXpU6Q5ecAUV3M4AOyaL9UOZu0hNacpLh51tj8ub0Zhzg4CCkC
	6oGpMQhSYdZjKdhRqKsijM1kIjArf2Mc2fvQXaUFfSLIjPlyXVfDHA3/whJSY0BaJndC4Nu9EJV
	LLubhc2atFtPyeMLtDHtcrN1jciJKs0eBnTdu6GMpKA6LA5pD5IRyztUOEpL3DXE/V57/d+AjCo
	5yoxChhx9yRDm3Om31xN5Xt61L65ZYxF/k+vLaYGpUQfuO4g/Kj2ewPJrlCnMMyLhbfkqvUubG/
	Br2FA2qNhGReklD6u8QoQr+Rmo7Ta9dvVxe2f1/otapXwN6yfPaNZVvASoQe07O7NdwybZ95PD1
	R99oxsvXohLMn9G8QGvErg6EVR/7sVNQpQiAhURfngxibIg9k3Mq0ZU8h+FKmcIoM=
X-Received: by 2002:a17:90b:5610:b0:3ac:8897:7b88 with SMTP id 98e67ed59e1d1-3acef5f43f0mr3344212a91.58.1792297797308;
        Sat, 17 Oct 2026 21:29:57 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:8841:a092:12c2:47d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9e47588sm5885369a91.1.2026.10.17.21.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 21:29:56 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH v2 0/4] Fix PSCI on MSM8917 and MSM8937
Date: Sun, 18 Oct 2026 04:29:20 +0000
Message-Id: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WNQQ7CIBBFr9LMWgxQQ40r79F0gTBtx9jSQCWah
 rsLNcblm7z/ZoOAnjDApdrAY6RAbs4gDxWYUc8DMrKZQXKpBBc1W4Ih1tOLnbU03CqpVK8h64v
 HfN5Tbffl8Lzd0axlX4yRwur8e/8VRfF+2eafjYJxZtFqlA2edC2uw6TpcTRugi6l9AH3CMdds
 gAAAA==
X-Change-ID: 20261013-psci-fix-8a2c0d6266fa
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
 linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_212958_332084_3F5D321E 
X-CRM114-Status: GOOD (  14.11  )
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
Changes in v2:
- Small phrase change in the property description
- Added property check in psci_1_0_init()
- Link to v1: https://patch.msgid.link/20261017-psci-fix-v1-0-dedae27e4a31@gmail.com

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
 drivers/firmware/psci/psci.c                    |  6 ++++--
 5 files changed, 33 insertions(+), 12 deletions(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261013-psci-fix-8a2c0d6266fa

Best regards,
--  
Reza Kurniawan <imkyufie@gmail.com>


