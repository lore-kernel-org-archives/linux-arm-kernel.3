Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1912C44512
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 03:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qG5vKLbr5547vLcXdg56vJVJbxeGTUoEF8EAWRWmQM=; b=yDG+7+JeDMJWx9L5LPPU0phkvO
	sMeRv8zXGCcNUQqiv79LVgd25VHGHfrpi43leOccRsGaUr5y2hftS/0G66ZiFxiwFOTEJK9MKPSwC
	uWGIlSqVBVazQJFpKNYrgBb7tNjzdjbJd6vRUNpGcSiebyHO2rqbNy3wUqYlBGVcXdzAEjBmbEhvG
	6uSt6HsA0RGaMNgeY9PvBYvG1pePt5O1TbU74ECDyGxgvha56wcY50mRCEQqE7rM3Q5cQZF6KVTbO
	oPZnDU950oy4zvylOg2jxfVygRZA2iyfqCRDhtDumdzdgpDFyzK90tqI4hY/sb1aQ0L/L0dkDgUcl
	kBjcUCAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlITx-00000004iom-3bq2;
	Sun, 19 Jul 2026 03:46:25 +0000
Received: from flow-b1-smtp.messagingengine.com ([202.12.124.136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlITw-00000004ino-0URV;
	Sun, 19 Jul 2026 03:46:25 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.stl.internal (Postfix) with ESMTP id 4E698130009F;
	Sat, 18 Jul 2026 23:46:23 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sat, 18 Jul 2026 23:46:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784432783; x=
	1784436383; bh=5qG5vKLbr5547vLcXdg56vJVJbxeGTUoEF8EAWRWmQM=; b=Q
	G9N5z/z++HXeevXZd0o59gAa/JYMTb68VlcOt4FwS+EAZXloXOHdFU1fAzZZjOme
	1g1+nE+5ZjNp3/Hg3Ew/TEeRn9HDn/R4tSWKDLsdKeFFIbL05ulRIgjaHmKTjCYG
	AWy/lqH+/KRVhOpAujaoawsOys50hnRiQla3nK/IzYERByt9XkOFyAc1FCVAkL7Y
	zmYsf1s6jIpo8jzb41ZgzB8aVZ4sYkn3EPLuGfiH2elH1ku5mXy+xO8DTit142dh
	K/f+WSPCFHmhOR9QZxYHSgkYhnOuzDgkxQ3MhV7b7JukgKGIu/emZMuYXY92so1e
	+feuSj58p3Vi9U8Ozk4Iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784432783; x=1784436383; bh=5
	qG5vKLbr5547vLcXdg56vJVJbxeGTUoEF8EAWRWmQM=; b=JAu7PhK3F1wiwwFpf
	Kn7gESAcjb7hD+Rtam25jWoHELmz73CL3C9IrpIfOQ2i25/G0aTbpZXoXRMjwLn4
	EbR+MhoGrWmQC5dldSlL0hl683ZRrW2nTmJyfr8OUFNonGuAIXhvOxrpY3ANuxDf
	egq8R/kq50zbE01apjDVYazX/JZnHIvGGi3IPokEbLA+w+neHn8lENuPEVHw3Wes
	TkhhvKDoyM3C9Yn3Wf4GKzGxeLfcNIPc8XrIJfbDaoJCYYy8SpjftOb+GDUnmRzH
	QP3YC1VIKG9A6P3ilfksJv/rO1IxzqppoVSha0CsW07u0Ez5n5f83PH+qmjKbUfj
	OHqJA==
X-ME-Sender: <xms:jkhcatC_8YM_Wy6vleS4A1kHY3PGNmgpUbPwG1Aa6Y2XqlQTMYQROQ>
    <xme:jkhcapwRfPZ5fyVd1_nq9Mo06DliX8KyNcLbAAaQJP5D3cSv5GxyVpjGNiCrf_lLY
    KxTfe609UWMxh8CnzvuhajhwhHefHv1CLYQ_azQ1I9kSqdvcaSSOH0>
X-ME-Received: <xmr:jkhcah7rw-V0CaPcgzh7krSYX_5UezY7zO7U0gYiXrANX1E8aXzSJtLV0Sl3COu3P1281pJAnvbNEPbkBRs>
X-ME-Proxy-Cause: dmFkZTE2jG9j/51JGEiOJB8knLfigI0/a3ZuBfTGSvv0Scq3C7eFfqRi9Os0EP54y+NGsc
    YeZNbqu1Fn4U0TGfrx2ARwR8RtL7TM4QX7KoVWFKqWwsZKm2Gidg02785Iu8WC3f5lAuld
    16Z+3ns+e1lFZIRQN5VwH9UX32n9yL4HVpN2n7HUrlH7Wup3KdkksEQAmb/911un9W4qVj
    dDWY8sYSbQolWvji6NITtA4R8z9lYXteFEj3BJRT4nlaM3wg2I1HE1GeXwyD1eUGz/kAKh
    578qczl4NzzSEpThCB+50LiqDh6HBTca6TkcmWkakMhkxOCkXRYdHBuiOXwk01eH5NASAj
    vQ7IBob584ijFzLzTeUpb+Wbo849qTdOUv5HMcFWYF8cZIq+Ye9k7QlxzlwnzsRMvif0wS
    aobhpLLtJBiXsGUbD4OBSp/jcW6sTJwr3yQlnAuTIXPGsw02/ThSFF0bK1y14QgY8ErRGJ
    tptCTtdI1tXutqEVm86zD4Bs6LdolnZax9eEW+me7At0VinT/kHv8MP7R43xnovd8TnI+1
    ptGKs0bPrsNlVpdUH/odydavIAM24CIoP/MZ0fwjVK53B+TJcP5cXYvFmZpObF5BhrEj7/
    QaZ0PwauZIdDaXrK1zrGD1UbSP7sXsmZyqaRjUr+5IaSMLBzv4Yx/u3lHYvA
X-ME-Proxy: <xmx:j0hcaqziNJR8jmh02Meg4u3I2QwGtm4s6rT9s8PmuM6WndKzD8ZaMA>
    <xmx:j0hcalcmhoyI-WDR11yH5652xNsutMbF7bXNn5-nnaF6eGRroydP3Q>
    <xmx:j0hcavDn9eLv_xKRdw1s6Y12dat2Sv6MO04sNHNbuJFK8upYy_y2qw>
    <xmx:j0hcap6apkoBavxwCGClhVUNSRiaLMgBZJG4toS6aFxRQsaKaGqgXQ>
    <xmx:j0hcakZz3vCc3PlDzrWWI4HVRQbXHXqGmq7FR4UCk9EaBynHKQpZnXXO>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 18 Jul 2026 23:46:19 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/2] dt-bindings: arm: rockchip: Add ArmSoM CM5 and CM5-IO
Date: Sun, 19 Jul 2026 15:46:10 +1200
Message-ID: <20260719034611.3623066-2-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260719034611.3623066-1-gahing@gahingwoo.com>
References: <20260719034611.3623066-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_204624_194486_1AA77CAE 
X-CRM114-Status: UNSURE (   6.59  )
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


