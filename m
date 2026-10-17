Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A888CCCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 16:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hX9ySrij59b5BCGF/OT7UHUToVS6gesb8Ac2hP4ly2M=; b=c3yp3tK98fxfZ6tv+I22YAMsIq
	eFuNCUCMiLERD6Eu5TIhdISs6cLK3Mrk8Q0ZKTsD4OUv9Z70PLk2krzcnecvy1knR9nC8mGdSX1lp
	1Tl635RxbXZgUVrm6T7Hj5KhYImcoYcutLRgxCQkYuld6PVncFlRhoTF0VtFD5LPKlJMsyKzxKlfG
	U/p71KqDPguIBjLdae2ofQRB3mP4k0xf3WQOZJlVkaGMY+EhNTXcp90O1KdKpuXGuZKor8DGRk2F6
	PxL8xbBzXx/IC8+If6BHOrDoJ+TdC7eLGZ/PJyXgIYZONhp4g551t3WNw92sbWLP1rslA+62Z2jeH
	2/IRWS6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7Ue-00000004wiD-0CSV;
	Sat, 17 Oct 2026 16:42:48 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7UZ-00000004whW-3Nar
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 16:42:46 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso522785a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792255363; x=1792860163; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hX9ySrij59b5BCGF/OT7UHUToVS6gesb8Ac2hP4ly2M=;
        b=n1nTyFLZQ5okzOgc6PyB0YHzFZiwY/BiwQfpxgyu7jrVi+RA1EwodvxuCnoOggBW1V
         q3oWeGRQzXb6/QHRB4BcAa4/gKmy4P0zOHnXbnx99ouqv5Gs2WEV/mmxnR6y6snDCv69
         u9B81ff/hatwWVJMWrJbHmqPo5FBXpXddrhvQ1xfxDV+RHqnp2tHATx8IZJFaLQb5MZE
         5WdJXYp7ls3dOEgIGBEAyOLyHxZHKI5hNaN1dSAOuytzHlme9p3gb1FOqTw5BZBmcDWh
         x7PFgfudzwwj1lOnymkhqxj06LuLqifdaCeqkt7P0eWUn0s7MApKiNqkzINuSw73Cun9
         nMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255363; x=1792860163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hX9ySrij59b5BCGF/OT7UHUToVS6gesb8Ac2hP4ly2M=;
        b=KOBAiKmiBGhUn3PJGy924pQIjyi4SSSc4l8PuIMUVdw6FEYvYdnaPZ19/TRwEXVPYA
         f8LC2qE5QfL68wSCH6UvcB3G4WjG2wnN+LzLH8OIn17s48YgIXIuaIOqeuyo8MA7yfyP
         tmvDOpZJEzI617M1yy0Pfh2o8sGPfBKfhP5BJHlq2S/+ju4Da+E3N99fMOl2CpKfAM0v
         X3agbdnOjiSKnnBgT/NeGXwbjU0qy3nDcJUrz/E/nHMnV0XTVOAvACWT/PVzCy0t1KS3
         G5D/Uu/5O9bg5WpYD4Gn1N3CsXb2ASy2HrbIMFHW4Sw6zT5djx2nAkBKQ4k6L38Yosa9
         sXuA==
X-Gm-Message-State: AFq9FYJ2di0odBGgUzvQe01MR+xZb0EJEYufgf5DOSWScnO1NLLzyTwa
	hY89kjl1l78pYHuJvar60Xg/V0FD4D4mIw6wcQfSHXpDw3xaUXNiFFZU
X-Gm-Gg: AYBFou0JDzCRQ1QMr9ksg+Gq1MAzXGufMA9EmOcKyriBVlLt95M+lkFUZQyj0XGmgqU
	2nBfOsoSR7TmOZl4NHyVEPVTnC5ixpmL2f2I0i4t+FiKvF5WUcP2OVuWqBuEROHBIbCWNUJ16oG
	8fh+B0dhNU9GtrNrXypop1CfltC2LFWc87jM3o6AQ8nttojBth9yDTSdUPh4oVtQ74OjNOrFyCg
	euJ+iyN5dSfUC6ITeoIiDQr2C0XQlRC0CqdEwF4/JYaF9ny3NySRvXitgDNV+8QBNZ0GOncYV4x
	sBCR++WA1kEXRqJ6gKHJqGXQgnXSPCk2Hiz01BozYje0eTeHf7f2qTfddkPN/2rVH359d55cTtx
	bri7BzXGRqrfDzzAUrKJv6yoo1vK1dB8xuFYszAM5Q8jmES/hAyEV6DB/LQKlLVAjE3Tpk/Ge0z
	P7mxNc1QNwGZXcvBxxS6DOsk7DGggtnxzrgp2KNc8HRkAmjZKmY+VWrDCAjEHTpA==
X-Received: by 2002:a17:90b:280e:b0:3ab:be66:ddbf with SMTP id 98e67ed59e1d1-3acef58d853mr2395968a91.54.1792255362914;
        Sat, 17 Oct 2026 09:42:42 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:2cb7:b2e6:ffb7:d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94798212sm13816164a91.14.2026.10.17.09.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:42:42 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sat, 17 Oct 2026 23:41:23 +0700
Subject: [PATCH 1/4] dt-bindings: arm: psci: Add skip-suspend-mode-switch
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-psci-fix-v1-1-dedae27e4a31@gmail.com>
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
 linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_094245_178584_AE6E1285 
X-CRM114-Status: GOOD (  14.15  )
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
index 0d04389c81..7777077dd0 100644
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
+      it on firmware known to behave this way.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#

-- 
2.55.0


