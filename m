Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33ACAC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 11:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecpYbqALdrsq5jysuWF6EJKV2S+lxAMqirnljjX+k64=; b=VHlo8WWndUSOBmw1/JS3rnsqZr
	KRvlf3P5FIuX0c5RSBKlLuDZ99ROr/I89XosrHKf4XJ6BeJ0QZhV7Y4CN5Is/A+hwqn4CYRfOrteL
	DQx+G03wyoMpZFe/18iFld21NRQRpuLThKiQGw3IIuP3/DFvGU461kD0FmCf16pijVMSMhEljUbV1
	8Ndjm5Qyy95m5jDFDXnR9g0qXvF+vuVlnSIhmkbFc0FyszgW5RrLLQIz1Ell2gzrSQCg+UdnPbAP8
	6ZViR1GZCJXPl0c8DfQie8V0Mo9I3qEjJTzwTExQ3PcANjyucflAvK4o/tB0Jqf7xDuyArqNeV+cH
	AgTY964A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9hH-0000000DWPq-0b1a;
	Wed, 13 Aug 2025 11:31:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8Ca-0000000DI0B-01ba
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 09:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=ecpYbqALdrsq5jysuWF6EJKV2S+lxAMqirnljjX+k64=; b=PSs3DiUNvbZb1xS+ueyPC4HUii
	e0pMxn/04py1fWxy5/sdpb4zY38k9eLQNq1IkZZ5GPWOa/R6+hDnnS/OJDOdNeuI39DjSFlgLIRiz
	KT3SsO5rMsIgR1cAoo0VkXGwSDaDzHK1CtYo7tpZtYQllfhPXKjwssm9XZynsoAdi08t5s2IwEDmg
	An5g34P+CgvsVwckiQ92/g/8s48erYRscgJbmeJ9EcaTVJWfskdujuXORuc3lSmtrWLFrO2aD4Hcl
	Tlj0TmWy2af8Q7AZxw9rNRpQJMuBLzTAA2eHeRgsAqmblPj0jJ0Ka9UOfadCOuxxy15swqPQfMIiW
	3hsyLj1g==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8CV-0000000G3MX-42bO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 09:55:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1FDA25C6C22;
	Wed, 13 Aug 2025 09:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A0DAC4CEF8;
	Wed, 13 Aug 2025 09:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755078916;
	bh=uBSxFVB8M/HdzrHEThGCY2+OpvVZtcNgIN266BaogDg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OjAoJH626gSAtjBqDmz4DnNWtEuox28wvVC0q39yX9X+N8UjVQLZnhRB4JhHb6Rp3
	 zk2zJpeYq0ANEXMNxhKVq2IQsyOKuWgsfmMB7vD4tnqfPQeyy4IiJf2JZ84X3ghsOH
	 jtea5ZymMU7qiVTgGezcvFzvbL9ZQOAOtm2XhdpBCHVby1tXXZrPyDYMPCICSAqjaM
	 0tNuIZQOENbPzsWgHEnHfjNo0QcKL64n1wEmqgX3J7n5xqWF4kZKBT9vruzFKkyaMg
	 QeSTy6zakLNH6PLNb/oScLYGBHJ8oXXFmTAzQ3ZqDHQnBhZuwtXUhR0V6Q4FdxPI0k
	 eLgr7Eco6Y3Ew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1201ECA0EE5;
	Wed, 13 Aug 2025 09:55:16 +0000 (UTC)
From: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>
Date: Wed, 13 Aug 2025 09:54:55 +0000
Subject: [PATCH v5 3/4] dt-bindings: vendor-prefixes: Update the
 description of allegro prefix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250813-allegro_dvt_al300_dec_driver-v5-3-a312ddebc4d8@allegrodvt.com>
References: <20250813-allegro_dvt_al300_dec_driver-v5-0-a312ddebc4d8@allegrodvt.com>
In-Reply-To: <20250813-allegro_dvt_al300_dec_driver-v5-0-a312ddebc4d8@allegrodvt.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039;
 i=yassine.ouaissa@allegrodvt.com; h=from:subject:message-id;
 bh=PC3ijNZetyZmp31mYsP4nsyh9qRs+vDTMrjy2hHRDqY=;
 b=owGbwMvMwCV2oHftXqU9jLMZT6slMWTMSWTU4PmnsSxsbfEZnz/Lj1/Ya8H46mT2c6nZc2dG9
 1++2y59oaOUhUGMi0FWTJHlg8HSZ1/YanxmtLDNh5nDygQyhIGLUwBusinDPzOjXe4btn6ySai+
 b6y9e49X842VhZ01um9yLM7pKjf0czD8Uy94/H3aYWOmU7N9nJwORSqKRq6Zp9v6aP3+tR8fVBm
 6MQIA
X-Developer-Key: i=yassine.ouaissa@allegrodvt.com; a=openpgp;
 fpr=B0CE218FC8E89064DAED6179042F935CFB3AD0CC
X-Endpoint-Received: by B4 Relay for yassine.ouaissa@allegrodvt.com/default
 with auth_id=423
X-Original-From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_105520_187571_4B034C60 
X-CRM114-Status: UNSURE (   9.92  )
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
Reply-To: yassine.ouaissa@allegrodvt.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>

Add SAS (Société par actions simplifiée) to the allegro of vendor
prefixe description to include French simplified joint-stock company
legal structure.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 77160cd47f54079a39f35b570d69f7c4c2274724..8b480a62368556e8d0ded02cf304d7e776b6ea18 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -83,7 +83,7 @@ patternProperties:
   "^alfa-network,.*":
     description: ALFA Network Inc.
   "^allegro,.*":
-    description: Allegro DVT
+    description: Allegro DVT, SAS.
   "^allegromicro,.*":
     description: Allegro MicroSystems, Inc.
   "^alliedvision,.*":

-- 
2.30.2



