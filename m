Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD483CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 06:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0nTkCtsKIgXr2WMA6t7lMsVluJvzGAOx7z1QS1X8Rvs=; b=Jidxsu3gc4Wfgk3O0ZLJbKwaUT
	39yCsjIAn8Ig6KVdWAQhRmlJ0iBX7bL5A342OmVMPjBAJi2pa/6Ec4xH0PX6Z1woGY2hNGnh9c+wD
	dhd0/SfNJKKtcyB44oP4DeeWGn2xI/e9rcb0saXcmtbAhegWPhomTPFrkNpHefiy7+XexPafyWVRq
	vwXcl5SVcOgiqpbu659xynbvMm3Xyzje0bcEtMjNcRpo01NUra291gYUClZCh3Zbs4dBjn2gdzCNl
	2bwg33p1abwzC0OdzsmcUSmSNaEAlWuw2tQVQrtis/IUcg3fept0Yy1Szw4IBdxHoSNoyhXZUDeEK
	j72jHVgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAj6P-0000000BzK1-21XG;
	Mon, 20 Oct 2025 06:10:41 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAj6L-0000000BzGO-3ndE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 06:10:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=0nTkCtsKIgXr2WMA6t7lMsVluJvzGAOx7z1QS1X8Rvs=; b=S3yl3n
	/bTCMfub6fBlpTU6KMcToSn/P9SMzCjvCdJY9zZpSrmRItahmsDKYED33XC9g2pP
	8fTCRMmuUwqi7m8Ok3IbqNIW8jlAko0JoP8TlLDisTBEtH7Xf4McbD6p92JqMXt2
	GV7LAO1jNO3brf6aWek6JV9Lfi5mwtCXiX6uGxDgvKicQqTwH9j85rgoIv/8tHui
	M1vzDeY2pfjzmy1+vM4qWZ4oKXtmK1yyseTcwgXBSCDMjUWDpKdbI8S2eUuHdZin
	DEMtjrGVtGdm/Vkt8vjtBZSQna9RlPOf6grg3Fmi1BxT0QOnfLeT9wC25nUI8wZS
	qHCKKRNnIkKgBwDw==
Received: (qmail 941049 invoked from network); 20 Oct 2025 08:10:27 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Oct 2025 08:10:27 +0200
X-UD-Smtp-Session: l3s3148p1@BhWR8JBBLoggAwDNf0fPAEuMhp6AgTGK
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: devicetree@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] dt-bindings: nvmem: don't check node names
Date: Mon, 20 Oct 2025 08:09:51 +0200
Message-ID: <20251020060951.30776-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
References: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_231038_779368_F24F8E6F 
X-CRM114-Status: UNSURE (   9.23  )
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

Node names are already and properly checked by the core schema. No need
to do it again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
I'd suggest to give subsystems some time to pick this patch before
Rob applies it?

 Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
index 3b2aa605a551..ab4cdc4e3614 100644
--- a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
+++ b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
@@ -31,7 +31,7 @@ properties:
     maxItems: 1
 
 patternProperties:
-  "^.*@[0-9a-f]+$":
+  "@[0-9a-f]+$":
     type: object
     $ref: layouts/fixed-cell.yaml
     unevaluatedProperties: false
-- 
2.47.2


