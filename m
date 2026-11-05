Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB026606D817
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 22:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FYU1WjuW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kdl/Z5Ps
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zcO9O8E0NGU4bvQ2IoLhA+PlZIDfLzWogU+GeL3djPg=; b=FYU1WjuWc8Frya
	nM+XS3Ky2jeTFyayLaaZD4n5wZIZA96hLJPxPyvIqEm/eP1XTmjkZhEqnG9Vg3s3f954g2t7kbkHF
	YIy/fDZrhdIHOPxh8z711wW2tdgPB6KFPSjRv15nKUCO6MTONYr2WLfuvY08HZGUlGEjztzKxfjED
	Cg5IAiqTh1/l3W7D6M3z7EU6GEe8F03A319umMuroG5b+ygdKnwE8uGJfdsHILAngpBZ2gvN6G5Fa
	YwyJqJ3C6o5Y9QurIb9spbrPqdgA3Ep1zHV004laU9x7YzprnLnp0Fomk7gQ0DGYOQEda7go1BFGo
	FK3mRTexSexcPriy4thw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP62R-0000000AoMr-320y;
	Thu, 05 Nov 2026 22:34:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP62P-0000000AoLu-3yPw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 22:34:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 38F6542CEA;
	Thu,  5 Nov 2026 22:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D87AA1F0089F;
	Thu,  5 Nov 2026 22:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793918069;
	bh=zcO9O8E0NGU4bvQ2IoLhA+PlZIDfLzWogU+GeL3djPg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Kdl/Z5PsdCRjYOzE6v+/aQNYl6rtkcBEKwoyCtbyVAf1xPMHEzlbn0xyc/1OWATKb
	 eaT0A9FEHBeyBEJ9hFx/xIbAmcDMz25nZenJ6DvpkGn55SPBIDOi78IlUsTwefIKBC
	 dSY7fgHD6LsiC996k5jOPP+Y8JgklXmj056IWZBAKjid9f+2tKpwZxSbiChTF03eMu
	 QJLN4dmIO2YjGC2y62V2WO0wEqCp50wr1G3L/+M2fV4AMoZp5H4BGn6ztINwPPxFRW
	 N4N+DhpKSrCQgBHrYmuBuQ7gNfj6JLQnCWYJqTSWv3O7/f9zfT7MbZLx0/X+H/W0kO
	 Pl+7XbIHGCLuw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 05 Nov 2026 16:34:14 -0600
Subject: [PATCH 1/7] dt-bindings: arm: vexpress-sysreg: Add "mcc" child
 node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-dt-vexpress-dts-fixes-v1-1-66615c3c8ec3@kernel.org>
References: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
In-Reply-To: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>, Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The "arm,vexpress,config-bus" is accessed via the "arm,vexpress-sysreg"
registers, so it is appropriate for it to be located there rather than
in a "simple-bus" as current DTS files have. Under the "simple-bus" is
not appropriate given there is no MMIO space.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/vexpress-sysreg.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/vexpress-sysreg.yaml b/Documentation/devicetree/bindings/arm/vexpress-sysreg.yaml
index be6e3b542569..5b34fe20b313 100644
--- a/Documentation/devicetree/bindings/arm/vexpress-sysreg.yaml
+++ b/Documentation/devicetree/bindings/arm/vexpress-sysreg.yaml
@@ -36,6 +36,14 @@ properties:
     deprecated: true
     const: 2
 
+  mcc:
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: arm,vexpress,config-bus
+
 additionalProperties: false
 
 patternProperties:

-- 
2.53.0


