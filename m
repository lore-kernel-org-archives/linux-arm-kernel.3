Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A8FCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wwb7BjG4Y6/P4xrH3b8bHVIXPI6hpByGNPPlXJjHlOA=; b=2SvgqFtj3YhFNYmOFtGacnEnBa
	/Uw7ojnOLqeo4jNDzJuyIowwOSVufx/jGF6XgzG0I1QHDae6/UkdtE57WNQ/5G+38RAGC0nTWQ3so
	9XJKCkBwekNdOpbd5RBGv+W4TqjNXHR4LiKr+NeA0o9foIozy+KfSmte46U/XPajZItUxpM6DvqJE
	Dfs2oUvfkK6yWCGvfJbGNnz5CdLNKdQJeAlahFeCH1JLn0fiddfQcM7+rJpc1S90mirP7tIJnlq9K
	apbcg9zchi5biKoXl1wUNeUFNF62Inyqt1yXmWO7JwkD4LnJM2QAHta/ybSY6TT4AH71mU7derJ+/
	FxJZ9iwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2a6-00000009775-1Y2e;
	Fri, 12 Sep 2025 12:08:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2a5-0000000975e-1hja
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:08:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C70FC6021D;
	Fri, 12 Sep 2025 12:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1193AC4CEFA;
	Fri, 12 Sep 2025 12:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757678894;
	bh=06h87KlWkV1Qdl8fM2aLPrnGF5NItjF1URPRbQmcu/I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V//8tx61ZUc+/50eULoGX5XwUqhDag5NjuiYO0FollJVZYf/Nw5EKE/1U7lE2eL0J
	 R/VVRGWQ69KNy5sm64TdlY+RD3oNYCflvgtz2mmCtMhnq5i0OMdUzn12zMGJCLYSaq
	 X66W1i4IEO3n1PFWtiiJqvNAHHfetXE+SBmoaIsW/WmQeGbBC3I38Z2jZg5jsbDZTx
	 CDx6nms0XGniOtq6MSJV3vuXI9z4YjNt6JbPj/fohIILDqy+4A4CsfzNWpyojqzkjC
	 lDi13wflcTW2iyVGZwacuU5tnZt2tK9lvgsti8MOhAkn6raJ87s3mYpSnfjqqSPmHm
	 R3k2L8Xwoj2bQ==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Andrew Davis <afd@ti.com>
Subject: [PATCH v2 2/7] dt-bindings: mfd: tps6594: allow gpio-line-names
Date: Fri, 12 Sep 2025 14:07:40 +0200
Message-Id: <20250912120745.2295115-3-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250912120745.2295115-1-mwalle@kernel.org>
References: <20250912120745.2295115-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Setting the signal names in the device tree was already possible, but
it will lead to a warning. Allow the gpio-line-names property to fix
that.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 Documentation/devicetree/bindings/mfd/ti,tps6594.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
index a48cb00afe43..ca17fbdea691 100644
--- a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
@@ -41,6 +41,7 @@ properties:
   system-power-controller: true
 
   gpio-controller: true
+  gpio-line-names: true
 
   '#gpio-cells':
     const: 2
-- 
2.39.5


