Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A6AC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 19:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xonXqxvKrBNVv9VbDpJk9UUk6NvAaABwloKGPZx8qJg=; b=NwOfCkN4zA74hd6VV1KgpdmIZp
	vkSQ8LbGYlzttetOPt01vFUC4m4gBUZ9e7raOpmOTmkx9/m9E2jLIUPTx1L0HQx6EGp945Upr6HjH
	WXKUodqWvEr58Y7SwIzbOMn/iSH8u22u1gUxfcWW+kr+TiuMqOWysmB8WWbNPmsHlEk/q7a2nlr1N
	JvXaAjNlBL+HIK6sii6aDi51Hi+wYiP+sT0j9p1HP1u+PcSNNdALIBe71vcDvzgG3NIX/rN32C510
	T1J7OlecYHkKeQ4WiHAC6JwR8mGGD0B0VLQ04WLr8VE6uTIEgTcefS5iLqRu2fqZEv4vR8XhroQTC
	EHlg8Cug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0ef-000000019LP-1zmu;
	Tue, 25 Feb 2025 19:31:45 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzym-000000011O8-0nI5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 18:48:29 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-abb9fac29d8so90797066b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 10:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740509306; x=1741114106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xonXqxvKrBNVv9VbDpJk9UUk6NvAaABwloKGPZx8qJg=;
        b=uNa9RDAG0y06rKzqngLNX73+TQ0GYx8uf+DL1iEDxewTE5WtmjXn0t5zlo4kmSNR29
         tqVppC26/M7LP98Z0FkH3u6pRCi7+TENH5Ff0Nj1YBOrafSWKdShu5pb5JRpPwP0SUMC
         SwCNqAabQ8C9D8xwCtElULnEuS5xklWMewz+oyjwGmTjJhgp89BLCV8AxpgodwtqChAZ
         PMnjVjpm/UqD0Fwttl6Fizlg84j6atxH4JYtzidMcn06zlG9bYdhoattFmmG/e6lYkbA
         ZOS2tyNX40eBLdWdyEqwKWCwRulDuHpOcjMlXdymaQDPRsrVAFwC96iIOtITk1uH/eYJ
         J1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740509306; x=1741114106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xonXqxvKrBNVv9VbDpJk9UUk6NvAaABwloKGPZx8qJg=;
        b=D1LuH+a/mQpg8p+uEYdW3ef5LsZWSUocGSKe2tE67cGE5NBMuHCVDYc+IlYF+KF675
         VCLnyRrZW6+Vh+Gsx9irqwwTEOi7FaX6qcoOSASVAekSnwVajYN+cOfEFgMw8+lfLkp6
         HCvJ2H0e4z4Vw+b0N++VMJhWsCVvlsbsytxrr6+ylq1IiAJNl68WBXIfVlLvsj4+V/SW
         rP7nqJgVLTHyEwauAifqj7SoMudm4vubehaSSxIv2D2Wn4Y99RTAmCVJzIoBfFlDmoqL
         amXWG1TZBmDQIOYtyf7LFyjAK2UAjCQiGq/pibygwrD5a0EAOoRWr9VSjkVyC8pmHmf9
         zlPw==
X-Forwarded-Encrypted: i=1; AJvYcCVpLVfHYaw4jX8AdMViAvHZnHjjNSg8R7ldDl85e8nabZ2Tcl3QySBRO0geMbmSBshgl594mFR7AbmM28HCwre4@lists.infradead.org
X-Gm-Message-State: AOJu0YwD2ga370L5obsEvG/je8Y5SpUxituEDyUvLftEp3r5DKnp9R5u
	oZcDGAXG7Lbea+wIY5fAPRVqA4kiClEAa9CIcUftrEDKgt1Y7/r3f9NLi+RZvXc=
X-Gm-Gg: ASbGncvto/s7/cywnkFQJzDOOGrU63VmT/jD7OynXjrPXiRJD1Wq5iGmW0xqrOSzj1V
	qB4dlx/sKfl8H1BZhwV/iMVXttBRPYjuF6gCUfBEGDzKA2Tl8/dwZi2DhpEMqDZlGYfNbPueTFP
	Qa13y2WcJiMMjQ3K+za07Dc1rQbBbe1doKKyoV5dG54/eEb7uKz0Plzb4yasi9nr7G3mJCk8pxD
	Nn0fv9CsUSjpEiVwBa9Tz+XCvlbTT+Sn3MOqnkotVPHqwnf3zR8XWd7ONvAlqx/Xua8ySUhZohd
	2rjIsw2KS+EQKA0mZfg2sX85PeWF+q4BLb1fDSyQWmrfXewX/nDtU60VsKZZsOvW/Mvxgy+4YRg
	=
X-Google-Smtp-Source: AGHT+IHgg2NfoJNIoVPeDVM+ZICkn7h+QLq/e1GcetAUMNdHAqmG1KBd1VC5Ah7e3zEn4CVbWsAd/g==
X-Received: by 2002:a17:907:1c0d:b0:ab7:c28f:de59 with SMTP id a640c23a62f3a-abc09d2deb1mr534837166b.13.1740509306244;
        Tue, 25 Feb 2025 10:48:26 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1cdbf55sm185359466b.15.2025.02.25.10.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 10:48:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jonathan Corbet <corbet@lwn.net>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] docs: dt: submitting-patches: Document sending DTS patches
Date: Tue, 25 Feb 2025 19:48:21 +0100
Message-ID: <20250225184822.213296-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_104828_227153_D525A033 
X-CRM114-Status: GOOD (  17.37  )
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

Document two rules already widely used and enforced by DT maintainers
and SoC platform maintainers:

1. DTS patches should be placed at the end of driver patchset to
   indicate no dependencies of driver code on DTS.

2. DTS patches should be applied via SoC platform maintainers, because
   it is a driver-independent hardware description.  However some
   driver maintainers are reluctant to pick up portions of patchsets and
   prefer to take entire set at once.  For such cases, the DTS portion
   should be split into separate patchset, so it will not end up in the
   driver subsystem integration tree.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/submitting-patches.rst           | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/submitting-patches.rst b/Documentation/devicetree/bindings/submitting-patches.rst
index a64f21a5f299..f3e23e69a638 100644
--- a/Documentation/devicetree/bindings/submitting-patches.rst
+++ b/Documentation/devicetree/bindings/submitting-patches.rst
@@ -54,11 +54,22 @@ I. For patch submitters
      followed as of commit bff5da4335256513497cc8c79f9a9d1665e09864
      ("checkpatch: add DT compatible string documentation checks"). ]
 
-  7) If a documented compatible string is not yet matched by the
+  7) DTS is treated in general as driver-independent hardware description, thus
+     any DTS patches, regardless whether using existing or new bindings, should
+     be placed at the end of patchset to indicate no dependency of drivers on
+     the DTS.  DTS will be anyway applied through separate tree or branch, so
+     different order would indicate the serie is non-bisectable.
+
+     If a driver subsystem maintainer prefers to apply entire set, instead of
+     their relevant portion of patchset, please split the DTS patches into
+     separate patchset with a reference in changelog or cover letter to the
+     bindings submission on the mailing list.
+
+  8) If a documented compatible string is not yet matched by the
      driver, the documentation should also include a compatible
      string that is matched by the driver.
 
-  8) Bindings are actively used by multiple projects other than the Linux
+  9) Bindings are actively used by multiple projects other than the Linux
      Kernel, extra care and consideration may need to be taken when making changes
      to existing bindings.
 
@@ -79,6 +90,10 @@ II. For kernel maintainers
   3) For a series going though multiple trees, the binding patch should be
      kept with the driver using the binding.
 
+  4) The DTS files should however never be applied via driver subsystem tree,
+     but always via platform SoC trees on dedicated branches (see also
+     Documentation/process/maintainer-soc.rst).
+
 III. Notes
 ==========
 
-- 
2.43.0


