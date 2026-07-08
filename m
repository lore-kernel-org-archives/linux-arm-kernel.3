Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E279C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 07:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rlx259H5PRNOwCYabNIgxLB3O/YTgiwldROhNyFGIVc=; b=uYjzDVR9lOo1vHOkA0ea+OISy5
	MJ281AMEXRnI0kBgps9BdDYQFqcNyFvfpOY8OnJqOfGqRjBIhf3blP03a4/LaydMYTHgpDL/OaGCz
	y6KxVhJ5ohTOs0f6kvIgm0oqQHHGf7/1iMGt4okd4wlq9B6PoQPutIEiu1KnXOTYmis7MGSRB2YRv
	XIdRN4w7XpZx4a/qg8SJGLsZHywoiBM7QaDum93vegU0L/WTsY41O7Vhype2EsdkU1in6GtRwd0S5
	zpJl0GRSy8Wvg0YBkKxFq54Y3gVSk/jOKc97luEA/wFq30X00J2PKfYVyQRo+Lxe8eoJetYurRjWG
	iE0KnwGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMVm-0000000GT6u-3sS2;
	Wed, 08 Jul 2026 07:16:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMVl-0000000GT6B-3q8n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 07:16:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DFA72431C1;
	Wed,  8 Jul 2026 07:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6EDFC2BCF4;
	Wed,  8 Jul 2026 07:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783494960;
	bh=VWmWh6pzki/ShXejJu251uuQUSOrl8ApE+ih5NcCoSk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HYDWuUEd+swZZpJ5jxAfUsBbCQmJs9mkezhp4PvoaTS5uFeidGbF9ovIrS1N2XKiM
	 EkHAacBP5AOykWFH1bizsQnkn7NZUa06lj6Qb6bAvsNuvds1AaP3oNT/MbiPV6BGxm
	 R8lGD+trNsNhfOfmRFfYW3eSF4qVhiAWNACZwx6Hi9ab0Ufj8pRyHpR2RbOYX6GlPr
	 vh1ZYuv5uzpmPNngcEUIFtuWVcnB+qbS+uCQsT4xtxfCJtXWJWQ06mS9k5Qf1NjuoY
	 iUWH9MvQ6E+mKBRF9Nxgfjjxi6mLcYxYfCcVXbd78mbXYC99MW+vwZTU91M4rORMUm
	 4W+zCTsYGGjTQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E65C43602;
	Wed,  8 Jul 2026 07:16:00 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Wed, 08 Jul 2026 09:15:37 +0200
Subject: [PATCH RFC 1/6] dt-bindings: arm: psci: Add EFI conduit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-efi-psci-v1-1-9efb3abf0e4c@kernel.org>
References: <20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org>
In-Reply-To: <20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
 asahi@lists.linux.dev, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1948; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=VWmWh6pzki/ShXejJu251uuQUSOrl8ApE+ih5NcCoSk=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ5bvT40an+LrNSsz3ou+eHBk0ZXtj533ymnX23xwvt15x
 YdfqJ65o5SFQYyLQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjCRg5qMDCvvckRZqXWc3Cb2
 W/IGc2WwDau3kNEPx6YTR8vSMlbsDGdkuPHeUvnjNHez9BTjI6zrxY8f0638FyfOeFRiqa7irW9
 LOAE=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

Apple Silicon machines run the kernel in the highest available exception
level and can't trap to anything higher for PSCI calls. Instead, we will
add support for a conduit based on EFI runtime services to be able to
share the same level with the kernel itself.
Add the conduit to the bindings.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 6e2e0c551841..f9d607e1a213 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -28,6 +28,14 @@ description: |+
   Note that the immediate field of the trapping instruction must be set
   to #0.
 
+  Alternatively, when the "efi" method is used, the PSCI functions are not
+  invoked by trapping to a higher privilege level. Instead, they are backed
+  by EFI runtime services: the firmware exposes a PSCI handler that the OS
+  invokes through an EFI runtime call. This method is intended for platforms
+  where the kernel runs at the highest privilege level, leaving no higher level
+  to trap into; the firmware shares that same level and is instead reached
+  through EFI runtime services.
+
   [2] Power State Coordination Interface (PSCI) specification
     http://infocenter.arm.com/help/topic/com.arm.doc.den0022c/DEN0022C_Power_State_Coordination_Interface.pdf
 
@@ -69,6 +77,10 @@ properties:
       - smc
       # HVC #0, with the register assignments specified in this binding.
       - hvc
+      # The PSCI functions are implemented by EFI runtime services, and are
+      # invoked through a runtime call into the firmware rather than via an
+      # SMC or HVC trap.
+      - efi
 
   cpu_suspend:
     $ref: /schemas/types.yaml#/definitions/uint32

-- 
2.55.0



