Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFF4606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 10:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1lXP6/JH;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B3w9YgKo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZdBmqWoIAK9ETV7duLGYvvPktodYvBmwhRO6fWKb/58=; b=1lXP6/JHTaQeIdWZ3TkQRvaWQg
	fNkpTD1rTxHtYxF0X15ZUuaFYbf3lvk4e+1PYG2JUoLWLEKiWccalfleONLmsoYLT9GpL7wgUWhOF
	coqUTpQewdTYGPhTnGuRq4Crz2szsFDRDNlk/LGjZnJQ8SJaSSd9RkqZ0c0ziHlbF1W8cLOJZjjN1
	A986jaapfFWHfawiTdxmim0d1lFg2GZvbadkWvmEC8cWSOssjaHHF90R9SdFi6hvVxBtCuiN7rfCH
	HPVSjkUqcH0qSuC6u1O7Kts5+FLyrZ6JInBhCa0/Z0NGGOIe/HcpyGFVhHmQ6Rki2eHuh3/QYUoZl
	0/hSlrxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM13c-00000006m1W-2Kms;
	Wed, 28 Oct 2026 10:39:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM13V-00000006lx3-2gQX;
	Wed, 28 Oct 2026 10:38:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 11A19602C3;
	Wed, 28 Oct 2026 10:38:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793183932;
	b=EhL1DHN89Xor69V0rcIITDMbw0JCGkQNbnJkoWvZUQayU/5uYl4j/dIElebk5WJ7/hmN
	 vLP3+2JvI91fYxjL/LaQHbw/ubNfKhfpUmaOL/xBsyVQ1B0x914DcYtduCCIijm4+f3VH
	 KYixvD4kiRs4qnkAim7fPvgTw70x2v/mJ7d2aO9s33BTCTARvghBpyhs2e9avaXYGSvSE
	 alPgeqYxlSU+y74f3FvHO5QzsYaFJbC1BLq0g8QLPJ9LSK+E0cHTnwpLX2Dkh099ZapnC
	 EmweSYFdZwQCgYoChhhOTFyA0rvXWrwhl0Se55DlU4s3YVY80ZMP3edcG0F5oOA9Dvw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793183932;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZdBmqWoIAK9ETV7duLGYvvPktodYvBmwhRO6fWKb/58=;
	b=c7R3zws39ou45J7or2Lt3muyeUBoRZbqtU/TheChtlGJ3+/3an/QkozrQt1Lp+J/bBHo
	 uIRXxCsgYIcOtZA4GTRrZ6CUWPscAfsJuOswdKUk6wTxeJpDmE11iAI3lNiECL5dgxVcH
	 z+ugwBaxyAI7a+vALYiH8CBQPcj4rS0gQf/dKzqgogI9268MhVBsZMD1k/Y15xiGj7SqC
	 XKuDIcyJfuDLcQyplpjQ2DrYu3nFqYvuUAzDNxpkWA3ZW/HTjcYU3v+Y2ygqNilJeEHd1
	 R6iJh+lovZ49l2+1y9ByylWN4RBMuXYajT5OAA2oY0ufnBRjtSaKaOG5VyhAN6TybPw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0C8B51F031E2;
	Wed, 28 Oct 2026 10:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793183932;
	bh=ZdBmqWoIAK9ETV7duLGYvvPktodYvBmwhRO6fWKb/58=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=B3w9YgKorUpNDB7XhiumFcHbaJMjjfgag6f1lx/BJYcGd7FHdPwYnCBAsrdm4V0d7
	 bQ9YwD7Q4TVvOVoZ4kAyvttMYtxCcrQpHIXJ0OI4UFLmi7k1FuXo/2J7mjr+ajxlJ1
	 WPneloPzL5Qb7bA2Gw7kpRJk8yxaRq1V/8COd4UTBdncP32LWaoaPUyHcAC8WA2ncR
	 ZUKdNuGE5Y/Y9Mi+0qn9XxXGSjUzPP6M73XdqYxHwtx4Q3TGVxBBx5bWmY0GKw2Z83
	 O4uxQ8XJbpfXJ4CVDfsE+TvetDdAuH/QAAosov5sMjSralzOtUawsjhDuNACtlid5X
	 bMwjpGW/3s7NA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 78836453CE;
	Wed, 28 Oct 2026 10:38:50 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Wed, 28 Oct 2026 12:37:50 +0200
Subject: [PATCH v4 1/3] dt-bindings: soc: mediatek: pwrap: add mt6572
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261028-6572-pwrap-v4-1-1780c58d2097@protonmail.com>
References: <20261028-6572-pwrap-v4-0-1780c58d2097@protonmail.com>
In-Reply-To: <20261028-6572-pwrap-v4-0-1780c58d2097@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
 soc@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793183929; l=991;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=GreXcy6jnp+7uSBsM4HWautBYMOxxhKkXIgAc4qRklc=;
 b=Y6KcgZp/YNmbaIJLnybaz2481KbTtOyT3rLH/CfH6CTFlGkG/aJAaXieIrFxPDw5aOSBZe6aH
 Gm0EZjnBTd/DNMaXoCw9JcnypfFG3+vfRJvldQGcxJMrK7mAK511OU2
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Roman Vivchar <rva333@protonmail.com>

Add a compatible string for the mt6572 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index e7c4a3984c60..a3cf11153fba 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -31,6 +31,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2701-pwrap
+              - mediatek,mt6572-pwrap
               - mediatek,mt6765-pwrap
               - mediatek,mt6779-pwrap
               - mediatek,mt6795-pwrap

-- 
2.56.0



