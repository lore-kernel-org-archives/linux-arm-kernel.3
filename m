Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C7CC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQ4cDOZR480ZYl76QHpocLMJtx2lG9QDHXMvTEiDm5s=; b=aSTxLkUJtS7xGz1uUe5DL89V06
	7Db0sPUS+TgykIH6Tbrp7Be/o5InKjEFl2nzaQ2v5EWlZJ0twcSu6fZwEerr5ahW9SyQVR5OLGM4s
	AIrMHfJeLCqPjPXHOWkUKP4nN7vPleHVsbofHUI5OzbrvFI/n3w5iH44YIe7/KbLLfwLL7RV/iZV+
	EyZFP97466yO9h0hoexuoq5J+TpKu2SCeGbaxecSA+WEUivsFziwLjfiOMg/Ykv2ZlMOLe/IMYINL
	yeHwLiEbU1HTukcrWrBZXs1/EhajdPsrcq3J5X2mSH11QB8GrAZT3DAGIyENN3X2kkm7VXTyU8gG+
	S25O4kjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Hp-00000003P59-2FaB;
	Mon, 14 Sep 2026 11:55:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65HP-00000003Os5-3jK7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:55:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 57EF8601F6;
	Mon, 14 Sep 2026 11:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551A81F00893;
	Mon, 14 Sep 2026 11:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789386923;
	bh=WQ4cDOZR480ZYl76QHpocLMJtx2lG9QDHXMvTEiDm5s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eKsLJnyE3l8ruOMEgp/QQ7pAAQnw3MqMI8R8sJtkZC+ebUCM1WHljWC6LHMn56cWu
	 ZNyLpssuhdF3Rev5lLeqGYwrvRrb9ELtBFHKpaThYRXQjMfJHNEuAJHNg7RgMQkn4i
	 ndAa5/vkAuS4dz+YqrK8JJVdIT0AtdOeVTzztC7yi0ZzAPH9f3rLoWTGm2YOETxv6D
	 T7SxIg9bhaYMy/3dFuNOZtrVB4yFuRylqCFIUiYTb8MnIw5JVUDCDQftybKZK7YROi
	 arqx5JXIyZ2fnYgWMXqCkGC9JMMmIJG7gSejwfngYUgAhB6j5ihMS/r1vSdVYjnxUA
	 JGKCxRjHlDdmg==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 13:54:39 +0200
Subject: [PATCH v2 11/20] dt-bindings: timer: arm,twd-timer: Allow power
 domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-power-domains-v7-1-v2-11-9d0c17e1f816@kernel.org>
References: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
In-Reply-To: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Mark Brown <broonie@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dmaengine@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

Allow TWD timer nodes to reference their power domain.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/timer/arm,twd-timer.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/arm,twd-timer.yaml b/Documentation/devicetree/bindings/timer/arm,twd-timer.yaml
index eb1127352c7b..716d5f2d4eac 100644
--- a/Documentation/devicetree/bindings/timer/arm,twd-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/arm,twd-timer.yaml
@@ -33,6 +33,9 @@ properties:
   clocks:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
   always-on:
     description:
       If present, the timer is powered through an always-on power domain,

-- 
2.55.0


