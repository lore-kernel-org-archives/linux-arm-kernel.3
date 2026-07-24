Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADF3C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 18:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0P0G96PnVjrvutMww2xQvKi++EmjNPwy+LoL9j5UZ6g=; b=IAAW772q8dr/lcJsiGBLzC3IrP
	sZIcik8B5XVKFlwsoZuDNSJFo4rhHkLRS9aC8iXykEqV5HTv79Sv9fHnf+tApsoviNcSdlL3+/kHX
	5MLynKAmQz+MaGmrio/xZ87rfFk8Ivj4egrwvXMSgeyX7aHe8b5eQppE94VKp159lOKMHsLo3wlgW
	bp7fC3n/zSs42P83QmGeE/GRqDMt9KNlUtWzInDdig/zIvujgJQuf/9C7pFe9A1rHQNtsN79jLmXH
	eHY6SOjOTxhGMkjU+vf7u1bWjr2WEoPpQ8EKT4JCU+tgiHpIU9i1m1I75x9cMM46xT3Z+YjgxzwxO
	JDPWXhTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKSZ-0000000H36o-0fa0;
	Fri, 24 Jul 2026 18:17:23 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKSF-0000000H2vg-1esN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 18:17:04 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 7216B1D0043A;
	Fri, 24 Jul 2026 14:17:02 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 24 Jul 2026 14:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784917022;
	 x=1785003422; bh=0P0G96PnVjrvutMww2xQvKi++EmjNPwy+LoL9j5UZ6g=; b=
	cc42/l6l4fMsh0w40TKNFR9S19xbSTItuHOc0D0bcT8uj4LTvgC+QMDr6QKB5Rxq
	03VCZyktTP2lCgHl8UZ1hWXnFfi7Bg4zfXq4BFa3qAJuux1oUjYFTOLKWlgPykv0
	esTzRT3Er4AmidurlVilSWhQNJ1C0VPABet4tkXWTutW9lamJR0K3KYCigrcMJKM
	aDAe4hIbdMqqKFg9sC4gU0HrUBsvpedbnx365m321uSFzv916OqhzNDvxfwfbKjX
	Ti7/aU/m/b/4lfMy71N5s5hThmfJFbDjqMykWD4Mtz1g897eZ02z3ELRJmhrHQ03
	5naRjR+ThGGPKsRLPwNprg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784917022; x=
	1785003422; bh=0P0G96PnVjrvutMww2xQvKi++EmjNPwy+LoL9j5UZ6g=; b=Y
	BVxQcxcr9DVB8N/yDG/9tvdza1k2tm6zq6DheB73FBkLHWN5HW4O9HKGGYmPg7bH
	TqIEUagCsBvuk5nW9taLp7TlU11Cw9UnsiCbpgMETCSSKhoG/68sCzJI1CY1To+6
	nQOxA+otCYuf7KmGZ8yqsssEUNX5tqnRhlBAtq53mtCdDEIT8sVP4/fSBLz81qht
	Wl3ChpDdtD5bX+C8M0PfpjR7lX8RZNtasititjeJLLiYE2sfo8i/fyuZutCwLA7F
	uYwIX+je4OCoFSuCIpQpvc0KU9IOC3kcCdRPUlqT4QQem0Xk5JJzarPXGar4a0tq
	2xScxINeWfr+5dWRBbVmw==
X-ME-Sender: <xms:HqxjarxeX7SRP0T8K8_q-QY12QHNN2C-FlJuijDUoE5XrdBe0C5hBQ>
    <xme:Hqxjat8WrvtBl5yOPnZgGTJ6vSUGSNXeX6-XQOZzx7DfhKOixz8B9Jfi5684_IJuU
    8oX6WlE2v2WW8nem4hxnKERj8y82fPmV1xhDadAzL6VFXpOU3mA_oXQ>
X-ME-Received: <xmr:Hqxjar_J_xWrfSylVXAvVtQeGvkHe1gUXmQcWNFoit0F9R6kB7b7XOeGnCQXEZAVbr5fs3yFiHpieo_0T9Tu54DgIWcCgLZxKHo>
X-ME-Proxy-Cause: dmFkZTE3h1iVBXYgSPcd68LVCbMYhnuaRavLLB/sNAzgF08hajlfFlCPkBNvaVlO65CCyO
    QhgbitTWrQnOHC9ZmasH5y88JNj+pctJAtJq+a2i0IPckhKnqCV7tXHpky3XqFscCwfRF/
    WCBC8Vi+sPQ79DnvzHozlPPSn4b4666jd32NbvbVPQChZpAQ+cm9Ep9tGXS9uhHWHKqZj/
    LrrZwG6IJepoE65fBiVyb1J9Z+W7M834F1B8RDvhl2DiDxBd0m14TWkej7E79wjgkaIo38
    tS/n4IH9JTg2MYL380cfV565ZYwxVuts2GpUZMhEGHUKz5X2W9m/9lqXSWdFb1i1YZmMoi
    iRyS3P5J2/2GJKSPre7VmXavrnfQ9mafuvONbD8qrP5bSnHK0s5DKIwyNj5h9Wirf5Api5
    E2SLzW8oBMIM33XafBE2+hdbHtqT7L49ly864o673WHGZPXvMkZjTZodkMqilg4J7xzNtZ
    hiqUlsoVXrIYNY4LIcyAkFIzLScNEdfR1PG8bfedZh0oNVeAcNS9g3RDThvkvEXNHPS5Qe
    KqOBguwrXM785WFQA//wcP1IZrvn9zPYLKegqMPButVt2qC+DHhV7UdyYpMQox41zWAPPI
    meFctFUiGs3cCWcfVaFVLFWfXiuSlAJTZkWtO4N/AMLMr1nZbWhuz2EFSVGw
X-ME-Proxy: <xmx:HqxjagccZ2hoHbIBFnzAfLN34jZ_wSOp66EWW2JG8sY-ra9W5Y3HQA>
    <xmx:HqxjantYKEq8hdUTu2p6VHuLjB-ck-jgeoOppPhj239qtDBDhvf3HA>
    <xmx:Hqxjap3FKnBVlqn2pIvCUZIzQjnAQx29bvJk1JMjUEHD0KigDXe0sA>
    <xmx:HqxjakDxMx4_om01tJ0B3PicFCFmGgHMVq2s-fgIbN55zG0uRE6FTg>
    <xmx:HqxjasWRtP24WDfvvC4fuAuD5NexvOgZu8yvL7zrKbBYgGqrOetpGfGg>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Jul 2026 14:17:01 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Fri, 24 Jul 2026 20:16:44 +0200
Subject: [PATCH v3 4/9] dt-bindings: arm: apple: apple,pmgr: Add t6030 and
 t6031 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-apple-t603x-initial-devices-v3-4-bbeba0420603@jannau.net>
References: <20260724-apple-t603x-initial-devices-v3-0-bbeba0420603@jannau.net>
In-Reply-To: <20260724-apple-t603x-initial-devices-v3-0-bbeba0420603@jannau.net>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=999; i=j@jannau.net;
 h=from:subject:message-id; bh=EAgiesomzybSknxGeZNprvP2a+/4nRBcYAJ0yjY0iyA=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzkNXx/VnYK7UjwNvKpT+8t6toexl44u9bq5vUXy/Zlr
 EsSWtrRMZGFQYyLwVJMkSVJ+2UHw+oaxZjaB2Ewc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 kY6xjhEDF6cATPWLGQz/lAOnFov8TYw69bp9pmHypVqLjMvn18mt514+YfH/2UHSUxkZJp3ILnr
 9/C97gonHt4UhQSdkOf+s59g+O/xkfOJHobwzHAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_111703_500422_5BE7479D 
X-CRM114-Status: UNSURE (   7.54  )
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

The block on Apple M3 Pro, Max and Ultra SoCs is compatible with
"apple,t8103-pmgr". Add "apple,t6030-pmgr" and "apple,t6031-pmgr" as
per-SoC compatibles for M3 Pro and M3 Max and Ultra.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
index c67b67ba065a..1d2001836eb4 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -38,6 +38,8 @@ properties:
       - items:
           - enum:
               - apple,t6020-pmgr
+              - apple,t6030-pmgr
+              - apple,t6031-pmgr
               - apple,t8122-pmgr
           - const: apple,t8103-pmgr
           - const: syscon

-- 
2.55.0


