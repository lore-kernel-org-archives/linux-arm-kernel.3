Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA51AC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 06:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PkMP3ZiI3GgKEDvBP4hg9KW9651hSPK9KJdmOWQbQXM=; b=HgkWafVUXngzgrkeZkyO/pjKJC
	4zhbKOdcgz2WfV5oZqbZH6P/fpsEGjOzHWVQclGbP0Cl63/G70rghhLpBOr8x31rggNttmBbaqoS4
	3JHXTDIoK8Ll4igbhIte3Vc2kownfzN8slNDmohVJR97b2iVDBTtDl/3gr9IF82VkiaAaZl6FGCZz
	av6ZAI+E4gjZdPiXUp7hsMmRagwU1b2O0RBhUmOtYxv+atFLxe3ttlWMPFe+p7+59/HPOjW4bKA+w
	Foo/8AyNuVQeLPIQwgtc1hR2yMpviaLqrQVAsFk7M495ewRa8HTubObItmyUnu98pnZ57D8CDp+8Q
	2Q10bNXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ehn-00000008cNZ-1E13;
	Tue, 29 Apr 2025 06:44:35 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9eeU-00000008bwd-39Q7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 06:41:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1745908870; x=1777444870;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PkMP3ZiI3GgKEDvBP4hg9KW9651hSPK9KJdmOWQbQXM=;
  b=OC29fNEHl8dCHV0u+26KVSLlclas1iUrnN3sTu5HbZwoPBc6RDmcuAoa
   MQLJYppU4QOghUJ8GOuBS2f7BZT6UVPc2OiGwOSAPBrsj33DbZ8fvgI8l
   YHhg0aOD8T5oC4+OEyfrBA3xjK3Wysh4dDW+Ys5hY/74B8B3AZY5u85BS
   XgYMoRPtDblksdjHHbc480XVUtXO0B1bD7ci3TYL5ItsEb7B9wla6z09D
   gN7FAjXSYSr7zKAWYdVOhZ9vUMUmaDtdCzr6f+qdwRZTJG08LUh623N3J
   Y5VgVjXA4OU0Bn8sdWqJB75NOTvOUspu3IWc4JEinBiNNEHpHA41u1EsI
   g==;
X-CSE-ConnectionGUID: Zz1nZyZvREm7cwggjdJuqA==
X-CSE-MsgGUID: Vz4QiECOTkef6qTLkshgBQ==
X-IronPort-AV: E=Sophos;i="6.15,248,1739833200"; 
   d="scan'208";a="43770687"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 Apr 2025 08:41:08 +0200
X-CheckPoint: {68107484-4-2417938-F0170C2B}
X-MAIL-CPID: 8B02CB2F6CFE0439DB61025BD08A5C8A_2
X-Control-Analysis: str=0001.0A006375.68107483.000D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1026D161081;
	Tue, 29 Apr 2025 08:41:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1745908863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PkMP3ZiI3GgKEDvBP4hg9KW9651hSPK9KJdmOWQbQXM=;
	b=exjAB8A+WTXI83fXvKExdcf+5Kmmobo5UXnwJD6z0N3NGpRhq85EnNK7vgACa+MSECVpUQ
	jE5UaJEtrzEVpNZYITVnv9j3LVfFCd/yhybsZAEMlagUMnblMSbTQuRjVOqvV8mhBrQnC3
	rL7FGMj2OtwLhVMmfC5Y/CV2m4TnXF919d15X5g9E04TuB3dS5njlJUyT8q8q1pgWA5VyT
	VlpHyWjBx00AYFQQkvBE2CpIpmK8lxiQvB6QXWhj+kWseEf/LKzJ5Ud8BCAN/XE3kaD8Jo
	eozoi4Mt41YBQOArYkhn94/ec/TxpCuZeVfL4Y7e3yGSK5LCYQj0xydyZ+o7NA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/2] dt: bindings: arm: add bindings for TQMLS1012AL
Date: Tue, 29 Apr 2025 08:40:53 +0200
Message-ID: <20250429064056.869222-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_234111_270432_CCE14D47 
X-CRM114-Status: UNSURE (   6.30  )
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

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

TQMLS1012AL is a SOM using NXP LS1012A CPU. MBLS1012AL is a carrier
reference design.

[1] https://www.tq-group.com/en/products/tq-embedded/qoriq-layerscape/tqmls1012al

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5ff0bc6c92483..8b9d96c5edc65 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1538,6 +1538,12 @@ properties:
               - fsl,ls1012a-qds
           - const: fsl,ls1012a
 
+      - description: TQ Systems TQMLS12AL SoM on MBLS1012AL board
+        items:
+          - const: tq,ls1012a-tqmls1012al-mbls1012al
+          - const: tq,ls1012a-tqmls1012al
+          - const: fsl,ls1012a
+
       - description: LS1021A based Boards
         items:
           - enum:
-- 
2.43.0


