Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8E3C44518
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/ODAvH7LCtn1m59CsElLw/Ab/ek73SglmWztbty9rY=; b=T1kGCLlRrJDW/bjEf5O8aGi2nR
	icCk1TLB1O3vY4Ry3yi9jtG5IJRtf7CSuLqNjkkci5D1eVa5bFb6SW68NFMO4xN5Y1mBUcvMCUzLX
	g0/ym3zWAXbAC3GcfD5acbmFqg7LeZJJlRQUcruqnMRqfGc7gduRTFWY727JEWOldRdIILQOaVJnf
	l0LQRHBjdbj8PON2sRNH2+PTSV08cW3cfzO7qoZUAt+KriXcPy6YNr+LoNXNKm/NbITPrMsZfn8ZX
	TI0HjR8Ihhz9ZUtTzsZHRfqiGeG2SFqeZQMQvCyyl31vJzvmrHyL00N8baz1EWZf2MedFMtKPCre1
	Ni2DWOwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMlp-0000000HRAD-17xE;
	Thu, 16 Jul 2026 14:09:01 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMla-0000000HR0x-1vOO;
	Thu, 16 Jul 2026 14:08:47 +0000
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 71E54EC017B;
	Thu, 16 Jul 2026 04:17:22 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 16 Jul 2026 04:17:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784189842; x=
	1785053842; bh=C/ODAvH7LCtn1m59CsElLw/Ab/ek73SglmWztbty9rY=; b=l
	WYMkIPghogRppnegq9x3n8kQ/GQmsrjjtdcqErTxkCdGuCBJ6NIlxroxl1YGGQQM
	cUrxoPqiTa+7LhsibrxsQYlWhxYL32BtdgU+m8CxrQQRGUEaibNAOBSu7j5fnxPg
	xC3t/CT0t57AeE5Aa0HrXoabjvEy+lFdjOETK9fla4SQidGjFZ1p4XuArVc07bJn
	jXskCcLSc5a0YnR14WZWTfBUHWyBwwhgsJdwh7kpI/bfgRaalcWQm/+SxBwe2ro2
	FQE6SqJsCN9XnWYa+pb2iWMSrN+r9bFo/dbng5mL1xd/6jhAh+FHUURdI8PLJHAz
	wc5JbVxvNeFHeTE8/N+cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784189842; x=1785053842; bh=C
	/ODAvH7LCtn1m59CsElLw/Ab/ek73SglmWztbty9rY=; b=khdaiQoD+HxQAPqok
	nzRuh533rAVWUR99jobutDzOcBMvp9sSC9mGZoQQSNBbXzDTqAMlvQeyx6MryYCh
	dc3tmWk5MTexsiDtC+lgWyPpwFAu4SMeyiHjGCeK+Tc2J4hxmdewW+pMSmNNOYrU
	xTIooNx72/kmr5qHr5k2mHBTtG3Zytu6K+vSMz1d2DP3Dfbl7p1m7DtQh3P7lK3n
	onf9zMsW3qqVZRg0cavA+96zLrI5qRXxY9U59Jt3nHuyWT/o2iwyhM4whZ4gtPtF
	yxQW1aPhItg+Ij5L3MZCvMsJfAKMKsCXNEgcGQRBOMJ9kOHSnZYIoltPOYVKKHEN
	rQLUQ==
X-ME-Sender: <xms:kZNYaoX0KYaATGtw1RoD99ZdfAxF11HYFytn5OCiKNAovtbkteDM3g>
    <xme:kZNYaomY4HLhsrZSAr2cNZeN1BgUG5KyxMI7ndmuyMlApr2khECU-alu3AwA2iIxR
    wGzv8VXc6W4cK_ecGhzyQp0gxeaC37Mm8AnNowNDDpED2VCpTL1zg>
X-ME-Received: <xmr:kZNYaulYu6GfIHxPSTmqtHR_eddrJSJwkVb7DDz7rsGhN8ui_5HOZynpY9iFgPeu5Bb2K-G3Jq9PLNAQ5V4>
X-ME-Proxy-Cause: dmFkZTGff87KyJVsaA4Nwam3GLMG9AaBBVlnv4sxHhbrcd5Efg0u3vhWAQ8HAJC9ou+zN6
    yqjtL5Q/btILL8UVaic175ypKBK7QiVpJ+nYeUDoRCcYjJmMWO86jZaIQOpvG7E5ZnWH8O
    S7a2W9hHrLWtHSySmGohQNWP/5OVCtatIbcogeU9IU3M1wzUBGA8HlDB/ARFeJEDIKXVlb
    9cXXtCxee/RtGwt3D0vs7/KZXLf/9kFOm8DAETgAwNUU9TP3HxEv31y6XDAaORjKNsWzp7
    Xcg0eiWz8UQyebfxan3Jh2BAXreInhIN4w0uORtmPxSgEs5oboe4t6qh8Jy0oUkidVCwWD
    rxS6d+ScC3hHnVkGVumIFQNi6rXG8YYoUfstDoMIa6i80RDndjd0KXJ4y+0KWy0YkYmlvf
    AvRgHzEQKeZn8TZP+aZDFebLfjinhZgSCaJpgVR9I7iKaZVwk+55rnpmHK22F2Wf6x2e+g
    A8LmCw52hhPCSoboTJD9rnWgiLeCtqXNpfX2D/EnX5ZrB3l6zHlu8PYlKfWEbVXkbe5xC7
    FbE/mSrrZe18DLaQGS1s2xk/pduF/WLY+kB9Qvt1rONkWEKAdzdwHm/zux03S+G+55fHLM
    mPDulLxCQ9s0FHa8EFYkSs3b7A0wcZiD7XfN4j2Vs5P9Ny7NMcjo2xzEpLMA
X-ME-Proxy: <xmx:kpNYaoYRJmaEOjhMivnntBWWLO_UMzLlHy2-kxZN9660U_tZ7xpuDA>
    <xmx:kpNYagSvmZTAlRaCHKVrWloUuh9dkFHp4b466yW-yTpzZaeczK1PnQ>
    <xmx:kpNYaivS6TWyxY2A8azO__t4et6Ytwx0KInxP2H7D37P_vGmG183cg>
    <xmx:kpNYaiFOhZJuoaGRPzPGHIKZHsM7iBYGQKID2sqSAxDoNDH0VJUqfQ>
    <xmx:kpNYamRnNMFIQfWNJdsqBNhHxUSQ2VFq-JcBJk2FKVd0jyjUxtQSc1gY>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jul 2026 04:17:19 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: rockchip: Add ArmSoM CM5 and CM5-IO
Date: Thu, 16 Jul 2026 20:17:10 +1200
Message-ID: <20260716081711.2482259-2-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716081711.2482259-1-gahing@gahingwoo.com>
References: <20260716081711.2482259-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_070846_582709_D81D66B6 
X-CRM114-Status: UNSURE (   6.67  )
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

Add compatibles for the ArmSoM CM5, an RK3576 compute module, and its
CM5-IO carrier board.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde186..5c7697f4d 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -71,6 +71,13 @@ properties:
           - const: ariaboard,photonicat
           - const: rockchip,rk3568
 
+      - description: ArmSoM CM5 Module based boards
+        items:
+          - enum:
+              - armsom,cm5-io
+          - const: armsom,cm5
+          - const: rockchip,rk3576
+
       - description: ArmSoM Sige1 board
         items:
           - const: armsom,sige1
-- 
2.43.0


