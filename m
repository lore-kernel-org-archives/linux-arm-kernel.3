Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC32CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 04:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9/qTcpGmqHaagDBr3uuGLszB9r96QIe5+vf42bKI7w=; b=2hxuHdMaNq8HqBXJk/XMJOEGO2
	ucf9zyH5Br7g8UaUsd50suhgMtwqGqNzviPQTdpD3wb46J3V4J6P7rfvxWUPA1aINyoT5+35ivhX1
	uOxKwrF9dF8y0eNK7ZJzLLsAILy3fD/bpR+KeHXG9jDhps+barNbBIF6BUQe2gkCUEUI+P0TikW55
	JgyaOKTjxpaQZtzvG2Ir22zjA+xMy/baAaGrbgzskgNU7kECziK4zYuqRG0L+GK7flfVxb5P4oy8u
	HtJmkj6WFXNRMdEfSKmgJ/7GLm5DsNl7bFv6lhZcaIOh5Nza9nJ9RQ7NtALMfuLlgVmtSXOdVuxlH
	3NEComQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIXG-00000005WMi-0rdg;
	Sun, 18 Oct 2026 04:30:14 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIXC-00000005WLd-00lK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 04:30:13 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so1073228a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 21:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792297809; x=1792902609; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9/qTcpGmqHaagDBr3uuGLszB9r96QIe5+vf42bKI7w=;
        b=Jrxx6Z8hShTE6nyZd0XRQQMIYUVzKO+c38Sl1/ITePZC+8wgQrLy4zGRVXax8aRNy4
         NDG+5D3LtjYKV6qe5KxrX0gAc6BRhSmehv3EoZu6jkHYRNcdhvDhx5QQIwC1J7gj6sR5
         Ov+EJpjeMnRtl1qP6nndDwKGyZrNUdRzeu6WdxYSw83WvMOuvgbgZfcK+svretTPCFuc
         hhFA65THbtoFPyiLTvFYUi4VKFHWrXK/I/NPW3SfKI7Ir60C6Z7iL+DX2bZRKgmLFzYE
         sNM2X7ksBA1AQQGJ4ZhzbKLegGt0tn45c40Ts6TOHm3G21K4SdCphSG4f2nmW1rUdtgd
         jwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792297809; x=1792902609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9/qTcpGmqHaagDBr3uuGLszB9r96QIe5+vf42bKI7w=;
        b=VNTrDvXCdhQ6jINaMz9Ob1wWW7m6R6RX0eWLqmF7k1PzIMg1WBSJzz+8JHMnsUlaoa
         28x9bzWpZD2rWKb1ADdYOzHxMpbj9gH/5Qz58heFhEr9pY15CnpHKmcxfHHqxq5kP4TC
         PNVaB4DZIoe7LDJSw+eHl3bgIRCkLl62/47DYHIz3FWFsawAzPRP2n8QkEDqXMyhT3n4
         1B7LW0VWqUVZz3uyo4IL8KNGQ2jkLgkMIjNd+McdpMIp5AYkOt/Mv5Bd8U2cNQeiLwZk
         UE9bohq10ElEQrSGgTo8flQdNrLdZ8ZnsLj8kXXHr7OpRCSMf8zFqi2/s+ZEi/5aTiiG
         NePg==
X-Gm-Message-State: AFq9FYKwpytKPWFTJHOaher8xPeabydC0p9+jLVyQIJK57JCVLzDOYQE
	Kft9YDMQtclNrZI2FhE/CnBKkn5bBuW9ku3tyMHEA33axsgChsLfSWZz
X-Gm-Gg: AYBFou31jD3/0hVizXlEqEhDfRhqyfHKdCEzY9b4E4F3+8bmzu26p6cVe+g0k54HKN+
	BsJ45uQaOTebHBW5gu0co2ROoxQ46GVxLVD/eNZoCvuJnzP0knaiMVedF2XAmpXDrWotrpusEiO
	NwTVf9vgFUV1ipW/FvpGUmNu15BArxVf3vxwc5kxEJM4SShvwcguAM+Xa4eh78lNo9yitzgofNP
	fwgoNcVFZBeyGwSThiIRrQmdVnDHvACxpq+7vkdpmA9MrclVu7lWHfdX+xiXkBrgngV2qfL6i0b
	LBIFpWUuNcfC94CBDa6dG78+4UiwdgFWoimHXEfRMmhqq7qhCIfqRD6fm+rIhDsApqffD/Po+y3
	TAzRgxjTVUxpfffuz8kK0i1MokhNa5abUBioCQ6Z96FndefgHpEJyt4Utf57q8nY/GNz3GXWEzH
	c8G7/mbaKhdTdIuBTuXoFPeAGyG1ZfA6I1IEffy2PuCxvn9/gGFO7esP+zICvwr2vXsIjFCLxG1
	hc=
X-Received: by 2002:a17:90b:390e:b0:3ac:ba49:2fed with SMTP id 98e67ed59e1d1-3acef5f1d7bmr3980364a91.58.1792297809016;
        Sat, 17 Oct 2026 21:30:09 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:8841:a092:12c2:47d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9e47588sm5885369a91.1.2026.10.17.21.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 21:30:08 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sun, 18 Oct 2026 04:29:21 +0000
Subject: [PATCH v2 1/4] dt-bindings: arm: psci: Add
 skip-suspend-mode-switch property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-psci-fix-v2-1-35f65b59eb9a@gmail.com>
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
 linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_213010_053380_ED25C8D8 
X-CRM114-Status: GOOD (  14.40  )
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

From: Alejandro Tafalla <atafalla@dnyon.com>

On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES reports
that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
call is rejected with NOT_SUPPORTED.

PSCI provides no call to read back the current suspend mode, so the OS
cannot tell which mode the firmware is operating in or why the switch
is rejected.

Add an optional flag that tells the OS not to issue
PSCI_SET_SUSPEND_MODE on such firmware.

Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
[Reza Kurniawan: split out the patch, rewrote the property description,
 renamed the property]
Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 0d04389c81..2eee38d155 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,19 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  skip-suspend-mode-switch:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      Do not issue PSCI_SET_SUSPEND_MODE.
+
+      Some firmware advertises support for OS-initiated mode but rejects
+      every suspend mode switch with NOT_SUPPORTED. Since PSCI cannot report
+      the current mode, the OS cannot verify the state the firmware is in.
+
+      This property is an assertion that the firmware works correctly without
+      a mode switch. This is a workaround for non-compliant firmware, only set
+      it for devices that ship with firmware known to behave this way.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#

-- 
2.55.0


