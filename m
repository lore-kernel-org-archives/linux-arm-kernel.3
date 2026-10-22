Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2418C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 06:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B89TFajt;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D7gHWThi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MeqapdHk4YD2xGr4hOW9N3bcaYW9GCT1w2/RAdnybrA=; b=B89TFajtvp/cXdOBLjWiIVGsow
	XaFbPlp/cwx4tOu43i6hAjKl8PoNZ9mVzgCdfuannvHBYKYupukzHHMW/2/9vrtgQlqsej8R+mmsA
	yb5MyEA/z+nzdEikFGJuT/waMmzjbdnQfUKsBQfSpZpGlyZg16QEWw4XjT6GaCbTKCqIpg5pKQBSf
	IQ8fzQR5OEcjeepxa5ujv3MbePLren1CIhJnu1MbxfoZtGQsaDAynF3DgfzrOiSiTISSlMEots3tn
	mOMNoF+TIUXxdIGKbrZyR1HCrX8cFcbjOoe15nUw+5uKm4Oik9fuqgV7grc8X3NU7LXcN/olgUOJg
	I9Sxrmpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlqO-0000000DR3x-3JwH;
	Thu, 22 Oct 2026 06:00:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlqN-0000000DR3Y-35E5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 06:00:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C102060211;
	Thu, 22 Oct 2026 06:00:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792648801;
	b=t0+HXvW1enGLhrNMI8H3FIVpA7LIW6CbbEAu+52VmnmNP8nVLtwoYmiO24viQANFl5LN
	 regG4uGIEQLpCKgXy6mQlwoE3Vu5jTeMBjX34JR1JjG3pXscwIPfKCt7mQgZPRTQ/TCx4
	 KihSiV0VMHu85jve/5veL+uBFNNDyA5mzQ/nejbvg2zyvTl7QgJm8uM7DF19NNbpgPGUT
	 sFRDdVoXjo36uPsumsjqszlzvsHvJoPtZbU/Qz2AFik070nHYCORGYKpArTzPwvVdH3tv
	 MHPSyfVmPK6has/a6JEkFWBiHbn7aLtYFzOOob742z/T3EGCI3aKsmrssLuMBh+N2Pw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792648801;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=MeqapdHk4YD2xGr4hOW9N3bcaYW9GCT1w2/RAdnybrA=;
	b=CSj4Msff2qKt+2kByJuif5JD8ZoNzEheY1vPHe9R/y+nRfwSTdBTZXNu6dq0n339h6be
	 buvv7HLf/8XjbJLhipPUxN6+vbiPc1nWfUn2AGYHyS4WSh+Pn0VigvpjScbfMJjEWyEuJ
	 TWKgdcb0P3TkuEN0W3KsjQTvJWmgor8bXnjw+iYXPOI+RfBYf2+5ieI4x1FZnLDSDT5Eo
	 +WYMI4xK3l1g1ScQJqAGfb6lHRsDDzADiIlgh7FVXk+B6UnzVG1wMl5wY8jZOUFpCZ12K
	 JACz4TXB1urKxSegdzfL/RTrwrLdkrJ9X+pcFtu3XnbYZs5uXBID7Iea998AbMn4HOg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 534741F000C5;
	Thu, 22 Oct 2026 06:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792648801;
	bh=MeqapdHk4YD2xGr4hOW9N3bcaYW9GCT1w2/RAdnybrA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=D7gHWThiEHCRJAE//0ZvO03APeE4eSO5khBSioNjs1viOKLDlXNM97D0Y1jmC3J4p
	 WioHP9neImsHWpo9CAheLRo2SwFxOzxA/fO4oZEuCftV07nyEJIWc6a527LqJzlqTM
	 5xEPLeiwP7LtMeLHloODGF9EKKVPkmeJlen0UytIHe+8NjGxQoSUV2x/+DpBpon5pn
	 Tme/+kHV/bWmGSq5KA1cy9bCpnESU5Jn0EkdGJde/1EG2QN2lQ67teAumBPeGiEzNm
	 IsLfrB3rPAmp4Lm6Se4cygPTykusGusKu3Fz+yEigxAFg4WLstvshs//kiLwE6kbKL
	 cw57PqaNvk47A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D3EED43511;
	Thu, 22 Oct 2026 05:59:59 +0000 (UTC)
From: Cristian Filipescu via B4 Relay <devnull+filipescu.cristian.gmail.com@kernel.org>
Date: Thu, 22 Oct 2026 05:56:05 +0000
Subject: [PATCH v2 1/2] dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-sunxi-orangepi-3-lts-v2-1-70b899252c6a@gmail.com>
References: <20261022-sunxi-orangepi-3-lts-v2-0-70b899252c6a@gmail.com>
In-Reply-To: <20261022-sunxi-orangepi-3-lts-v2-0-70b899252c6a@gmail.com>
To: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org, 
 Cristian Filipescu <filipescu.cristian@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792648566; l=1216;
 i=filipescu.cristian@gmail.com; s=uboot-20261021;
 h=from:subject:message-id;
 bh=t1m1y0S3cSpYjFuC+gfshCNEaxwz0B7aj0D0DiamZcc=;
 b=NWyMN/fe371QAzlJ1JPV7CAU54/0FpQa+6JvwFD18AVO1jIku23xr3877+2ePpVjxPcLhTRRK
 oe1NGAEHDtYBG0jb7MHbjrFSrvv3pTpNGaeaVmYgXqdDDDpuY/Hvvea
X-Developer-Key: i=filipescu.cristian@gmail.com; a=ed25519;
 pk=o7Ui0tU3x+X/6Pq6PZHmd2KFtOdPWttoPuNFOvdD8t0=
X-Endpoint-Received: by B4 Relay for
 filipescu.cristian@gmail.com/uboot-20261021 with auth_id=1255
X-Original-From: Cristian Filipescu <filipescu.cristian@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: filipescu.cristian@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jernej Skrabec <jernej.skrabec@gmail.com>

The Orange Pi 3 LTS is similar to the Orange Pi 3, with different
Ethernet and wireless hardware. It includes 2 GiB RAM and 8 GiB eMMC.

Add its board compatible to the Allwinner platform binding.

Link: https://lore.kernel.org/linux-sunxi/20250413134318.66681-2-jernej.skrabec@gmail.com/
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Cristian Filipescu <filipescu.cristian@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c6..379dc8591 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -1008,6 +1008,11 @@ properties:
           - const: xunlong,orangepi-3
           - const: allwinner,sun50i-h6
 
+      - description: Xunlong OrangePi 3 LTS
+        items:
+          - const: xunlong,orangepi-3-lts
+          - const: allwinner,sun50i-h6
+
       - description: Xunlong OrangePi 4A
         items:
           - const: xunlong,orangepi-4a

-- 
2.47.3



