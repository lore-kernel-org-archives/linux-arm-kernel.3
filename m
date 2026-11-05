Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158E1606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h2bI9CO6;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZYH5m1Au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+kioeahfgGvkUf91Yc06eaj5tIJkAx04gn/a2VqmwN4=; b=h2bI9CO6UukVqz2T5GrnCbDOCn
	XkeBnKRM+3JAfuX++FwRTFe6gVMX5oPXoj80lPlU15qADKoZt0HCUu+/Epx2LUzeXeuwDSUtyqpMX
	o4mTO+BvqgqYW/mTJltA8IkQG6CBuPJkBIAJ388MXa3Z6hn8VZXn368qFfZ9HwdsXm6a4HUW0ggKu
	KbhTw87OjZflsQQtThaQQfNbFnKbcxPeMfXjL1tGxsi8E0q1s+prWWbYgkj2WScmhbW/SElQhzq/1
	Y4ASAiqzcP60FbR6RCkcMknQypyvuGOHPRwOGu8F+6NCC7LrRuJCQNd255lkj6N2GWQncLER8J1sA
	AQ8hgRKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvej-00000008ePD-02Dz;
	Thu, 05 Nov 2026 11:29:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOveg-00000008eOi-1fg1;
	Thu, 05 Nov 2026 11:29:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ABA1240A21;
	Thu,  5 Nov 2026 11:29:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793878157;
	b=jsTxyvh1ivJDJEwecKrvg3rLCmKAAWlvld57klRM5smYMdTFnOphznWOdY5ARXt6CNWa
	 7qgf+tTS3RantrS3n+4KkRXl8ipsPvT2pBRPT3PNSWAaV37N/ilogqUg3aZbeg9XUc6U5
	 HhzvkBie2dSKhUKvRaAXjTiUZW0hF+OSr191Nwe5Q48g8pCLVUfymnob797XlZhvkD0Jj
	 vfJXaWv0C/s0wutw2891LK/SzLT7l+THgePZNKnLRmUetENEVlsQQCQkrue+9Z0IdpzB3
	 jmjKRDNNWzWa0AAlfqFV0DmAyDYIN0azS86zYDrJGuJmyyRuhZd0mEHaxwg72iVsEpg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793878157;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+kioeahfgGvkUf91Yc06eaj5tIJkAx04gn/a2VqmwN4=;
	b=WdNq3tjT873ZiEg3NHqwJ3c6/rLKYCUatCpo5Z/1xYxvjOnypH/4z4ANU8O3pBqlbWA3
	 /NukGP88/5RS9yPmONIKB1fj5qse0GW1QunzsFJKQhzqi5t+C0Kuv2t8QRgA49ssZA/RJ
	 XqDn3HMqVnarSMdNiFkPN65vMspZq8ADgco/0E3Lr7J0DqPpQX0ihAA0fKO1romNR8uKL
	 y52DoquOZkXhKqVInIwsnnmwncjEFt+BXM+bQqWS8JWX6/0UqazsgjpJwTsY80X7T1IA8
	 D6BeId8CVMXHkjet2fwBjh15s+j/FdROF6gfEsobm68/rFXod4C1bKciIctmNIDkPXQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A5771F000C1;
	Thu,  5 Nov 2026 11:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793878157;
	bh=+kioeahfgGvkUf91Yc06eaj5tIJkAx04gn/a2VqmwN4=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=ZYH5m1AuHS1GELMoVUJhmaqwp+m7Hh4/9TLI6zlBojT1zyo0U0i56+WVKx7fbAxtl
	 cb+goGZaLsreByvgGMU12Hx8lBsNBe/AdKqxUPjemHet7mXwi/Sh1r97UOktWxkK3P
	 LbH0FQFu2CB85KKjnS/OxxUaFHsS6fk2gQZOsxv/493s5WyJZ63B9dfMU/A5bEDEuE
	 IB09IZ7yNM/1EF72TsZXkuZCzIWsUI0j0VNMuv/Sb85FMF1t8LondL3XEGHg+lynJn
	 bfzi9qZyvx+AB6wJiiLAbC3qqDUCM1HRkZwfSxrm/OF/f+3MJ1QgV7eDTEtZ1U11LY
	 ytduIMb7H/4eQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 70B3547204;
	Thu,  5 Nov 2026 11:29:16 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Thu, 05 Nov 2026 13:29:12 +0200
Subject: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add mt6595
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261105-6595-dt-keypad-v1-1-f0911f40d3ad@protonmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ5EMBCA4VeROZukLWNjX0UcSgezEistQsS7b
 5fjd/j/EwJ74QDv5ATPmwT5ThE6TaAd7NQziosGo0yhtSIsqCR0C458zNahy5TNDXUv4gxiNHv
 uZL+HVf04rM2H2+V/gev6AR8w/uRyAAAA
X-Change-ID: 20261105-6595-dt-keypad-d30a425f75e3
To: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793878154; l=1042;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=1ilWPyJZwXIBoX7Ef7K1dJA5qk/q0NQM6AQiVyoSYi0=;
 b=gsl/L1Nidw63mZs0argyawLAon+vgqnunhZ5yy+E3ul11j/wHv6bXMvJ5xrU1xKAHQyY96nB5
 xCtkMOJ53ExAWZQr9KQL1lf3SKp0g2voI0Xnc9l1YvqCV2iz8HIHOOy
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

Add a compatible string for the mt6595 keypad, that is compatible with
mt6779.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
index e0758aac7ffe..9f0da1240187 100644
--- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt6572-keypad
+              - mediatek,mt6595-keypad
               - mediatek,mt6873-keypad
               - mediatek,mt8173-keypad
               - mediatek,mt8183-keypad

---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261105-6595-dt-keypad-d30a425f75e3

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



