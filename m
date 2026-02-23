Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CF5E98E10
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmLoKsGRq0Jk0v6P8EmAfqNiWwgYdoHTkVtSTERcNgk=; b=ohIQikzMuqHioHE7G4/8vMgRcw
	8xJ2ncOBzeQE3GNtLc92A0Y/RNAr0lV/5XEbOiWMtf9eq2DevfqX1zNlCRKRuMr+k22daj6Ty68pn
	3WbYawshayU6I+OWlUBg2pV/Z9Totp1ce40cuBakcT73V6g0vj27LJceqbpeCcg9ovyfJDhZrxb+u
	NvqX+54BJ3mr4/0Tsla4d9KVB6XqlSPTxKwQ2WMYLlVNxsz4hEkQpXSLFCtjlUGcvZMh30Aohw+Bj
	UuiCUh0ohbXnIE77zuTD/Kl2CoVG4elPHm3sERj1u/iau/atElWIa42qXf/cz75B9hr41JJkBnzt/
	Pgb/Lutw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSok-000000000Km-439o;
	Mon, 23 Feb 2026 10:05:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSoi-000000000Gb-06XZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:05:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 632CF40A23;
	Mon, 23 Feb 2026 10:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF87CC19424;
	Mon, 23 Feb 2026 10:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771841126;
	bh=smh9yZMUJkt/Wi3TicLVRTK4f1RCg3ErSTma3qR4fog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ie14nbv5gEt2VRioIZT5LtMd/v4HgyukOacbvTotXq2uGVsrZH2ZOVaXq/F15TUjl
	 TvPlkSCgKh74EgqLo9C35UhQdLOEQhi/jUCJw8bjxXQ0O3QF+jlc+94KybQiImOea/
	 wxyeBW3BpkZ3zhdhLaFc+Z1LAYk55ABwjcv5EfIcVxI/6fEnu4X7MocsQ1HI96aDRc
	 PAHcNo2w/OCa1kZGaxej9iipS6ABanZMn0MvQZFj/5nlWay+BG0546CTNQoPUQbI6T
	 nDDsKlsWoS5u/ormr3bCcTKmiCtE4SvOjNE3aYs3P/xkDE7y64wObw5q/CMLZGXch6
	 DiNZg88EdcdWQ==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 5/8] Revert "dt-bindings: arm: ti: Add Kontron SMARC-sAM67 module"
Date: Mon, 23 Feb 2026 11:04:50 +0100
Message-ID: <20260223100459.844967-6-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223100459.844967-1-mwalle@kernel.org>
References: <20260223100459.844967-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_020528_159444_7D969F6B 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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

This reverts commit 22e1d0d8cda783bee95de578cbda3ad0da8a3eb4.

I was just informed that this product is discontinued (without being
ever released to the market). Pull the plug and let's not waste any more
maintainers time.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 85deda6d4292..adda61e06173 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -208,7 +208,6 @@ properties:
         items:
           - enum:
               - beagle,am67a-beagley-ai
-              - kontron,sa67             # Kontron SMARC-sAM67 board
               - ti,j722s-evm
           - const: ti,j722s
 
-- 
2.47.3


