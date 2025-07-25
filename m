Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E285C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 06:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V4QdjaSb9cXI8p01nmDA+/A+YYF9fy6Z2O8CYR9WSVM=; b=0nIb4zKqkECMcCGHF8v6mUI3ff
	YQnp93IvU6D40JA/WuwyRVffR1fLE4TUcuxf5h6QY0h062ZKBnKm7+s7jMREDC4eI0Bppo0nNA8QS
	Ecyqw9QsRPxpOgoRJBJFdbOiJNfhIFqf6UBd06921Pjd1uw9k2cX1piQRiEOOdnt7ER4rxAJPC13o
	lWsPPAbLHTa3CRj7tw7vUSqklE7CsjroZe8Wgg3OV08QEC8asCnLLFRw2cdMJS+dRG+dFMdBBT0Fh
	O2w6wJkmtARtqyRNygveFJU2srjU9QqXnLCGonzdLboraPKvFgTqXcmXRHpsN5rKE5BRnwdIxBE4t
	i3W+vGOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBUd-000000097zB-2riD;
	Fri, 25 Jul 2025 06:01:19 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBSB-000000097gR-1Pvm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 05:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753423127; x=1784959127;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V4QdjaSb9cXI8p01nmDA+/A+YYF9fy6Z2O8CYR9WSVM=;
  b=OYW7iq2mjQ3J0vQOXrRo4w+2fWteskvzN3Syk7aZxgkT0zryRYoDSQRL
   CDKMJn0x925/OMS+GqH2AZojnXA9y730QbMDRKP4LZ+/M9hz+e3sWWxbc
   AH5GQDBojrptQ24Jia5yB2gycPS0SirJtXN13RH1B8gsx9Y0nzmED4Ped
   mOGSOTrVTijt12h7BzM4I+OR45yrQdkdkFV2myzhXh0NuCYpxVOb5QOd6
   oLZP/nKPLGcWbsa09LvCcaj1w6XmEiynqPdC5xtGmPkSRG+t1HFq7dtuh
   FkzS3nCbqy7YyrPT9wFVkiH4/H3utbUuQagfKgJDinsZXY8dEh1Oeup2q
   Q==;
X-CSE-ConnectionGUID: tgE28l+3ShaV1TiRICoAlA==
X-CSE-MsgGUID: /HnVzqXOSEqWo7EWgSOZ1A==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; 
   d="scan'208";a="45412596"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Jul 2025 07:58:43 +0200
X-CheckPoint: {68831D13-65-BB1FFBB0-EB2CC75E}
X-MAIL-CPID: D84144F887B9A33A50C0C2DD131BC566_2
X-Control-Analysis: str=0001.0A002106.68831D1B.0056,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F258B173583;
	Fri, 25 Jul 2025 07:58:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753423119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=V4QdjaSb9cXI8p01nmDA+/A+YYF9fy6Z2O8CYR9WSVM=;
	b=VcJKFj3JkwShCaE0hIBZ0CmU43T7HFnPTHYwbM0zUpZDWX2UJ3ADKUHTO9eefxIfAhm2H0
	oNqo9NnM5PJE+eHA71PJFrVoU+qiUCHQ8lcPovRU58mw+RjI5MOaBndnfeS4OEVL3eYYoO
	qIWAqNj935NKJ7RFBQYtzz6YTIqDatPi+aN6S3HxVsvXhCOaOXEPvwYsmg53XFnAHIPBtG
	yaOXH904wNfesQQbKSa8QicQ26VY4Ao6y+ygYAJBz4Zsq6iykreT/w0Tg8FDZ5P/T+lFh4
	tMvr+wYKMqvkquNODQBMz0sGNTE6chb2bEg7Tx9R5lCTAREhhji0yAfLQE5kag==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] dt-bindings: fsl: fsl,rcpm: reference power-domains.yaml
Date: Fri, 25 Jul 2025 07:58:34 +0200
Message-ID: <20250725055835.260930-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_225847_713934_687A6233 
X-CRM114-Status: GOOD (  10.68  )
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

dtbs_check for ls1021.dtsi warns about unsupported property:
 power-controller@1ee2140 (fsl,ls1021a-rcpm): '#power-domain-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'

But if removed the check warns about missing property:
 power-controller@1ee2140 (fsl,ls1021a-rcpm): '#power-domain-cells' is a required property

Given commit 8bcf67b8d893b ("ARM: dts: ls1021a: add #power-domain-cells
for power-controller node") explicitly added that property, add a
reference to the common bindings to fix the warning.

Fixes: ad21e3840a88 ("dt-bindings: soc: fsl: Convert rcpm to yaml format")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
index 03d71ab930d79..5b7c0a1905545 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
@@ -13,6 +13,9 @@ description:
 maintainers:
   - Frank Li <Frank.Li@nxp.com>
 
+allOf:
+  - $ref: /schemas/power/power-domain.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -75,7 +78,7 @@ properties:
       RCPM register block is Little Endian. Without it RCPM
       will be Big Endian (default case).
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.43.0


