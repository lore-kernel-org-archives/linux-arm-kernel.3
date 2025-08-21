Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21264CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 11:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G2FaWlk1kC6493AlFCDPSJ1E6vlEnlmY+oKGnlHwhgQ=; b=BWnHZw2JU2+jm2NAoJ1nWucRc6
	m8W3pnV5joYVJHwyjNaYDH60PP8/oMSN2pUraEzLkggAbwDOdaBc3SUKFStvlT6TpxYPlC4uaQvVx
	AWOZR71Z0XMe2q9G0MwqHYl2t8QkkgWvDveWyuQ7Jsc2wfDVBMpQKJh5kr84Lt+bWeIY/OJ9XsMD+
	aPyc1dtju8hYWQlQ0/xodxxiW5emDRsurb6UmZiN9V29urArtTjS+zgSv9dKy94l9q9jJcCKl2o/l
	2ju20ao+A+mV5ssZD9M/D6JfxVxegctNDTHGvE+yubP8Fgl/03kOGZbmFXjJXajIxgqOvD6K2H3df
	kGe/7EyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3VC-0000000GlMS-3S5L;
	Thu, 21 Aug 2025 11:30:42 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0h5-0000000GG2W-0sR8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:30:48 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-afcb79fb221so7434066b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 01:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755765045; x=1756369845; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G2FaWlk1kC6493AlFCDPSJ1E6vlEnlmY+oKGnlHwhgQ=;
        b=rCEU0I22ap+ePsioYh0iy0wao0CuwXQLamr1HR0QrNGBl1o5jwo12D9tM5rz1Qtwta
         QBOx77XpJSjdHbUzjTyDd1BLkW3ty08X8F6qyGhRtysMOds3o3RN04m9cj+4kAhNo3nl
         0wIl4WkFU6/Dh66UEam2TubsJCutyNDryR6k1VvslHHu5J3RQ1IsDq31hJv9BgrC9rnN
         xYbmgJbs+al7iwgGYGCbihqaAvXAM227FPjbMaQJeCW10hFUAMPmR1nXyH3BaciX9JPe
         YOQ2lSe6J831Uedjx/M9cKhWeeQURjskZMUqv19hwXOp3TtRMFYOh8yo94OrL1C6rICX
         QtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755765045; x=1756369845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2FaWlk1kC6493AlFCDPSJ1E6vlEnlmY+oKGnlHwhgQ=;
        b=rAsTXWjtigxw+nVbZ/F+PhkfTlhT1nO7Mr+IRLGYaQWZ02aE7h9bAuJUTkSlzLBCsf
         cP6Xmae3up05MorGES8EKZ1w8SQ0eD6FjQH2JPM7v9hBITRY4MSMCvzDp9NdplVVQ9Fu
         7f9FwNMIYwvT+//x1vUyqFaV2c5d95zHtuTH2OdEJU2sIex3gZEfb9uVIqZQJLg3pDu1
         5SwUosOEjiBC3pTEwkuj3EYe5DxwpUcRhNvOX0V1F8j6oVzpJiOiwenxY9g39w6Ou8qE
         WmRVxuY1aEW4HXFEZe/YQ9BUTSVBXdNFOdthpvi02M+ubiJIagGCTk0Q21nVJN99tyHV
         KNZA==
X-Forwarded-Encrypted: i=1; AJvYcCUbAW7JoSe+vN7oUM06FnvQ3unZN3B+NkYKKEhndfuClk2Dtub5ukoTI/1TF5aazFgZT3RKC0bJMi6+kMV8zXZD@lists.infradead.org
X-Gm-Message-State: AOJu0YyKApFv5CBMRTqFLxG02bE1rR3KoEPksYEhv2UfmUjlakUAMcUy
	jxBHSJTkZD3TlvC0b5RyAjixooqPXxg6cWFHaFPpm5ZjNDikfDFRXRO57BDj0Plj92M=
X-Gm-Gg: ASbGnct1ifLixX7Ja9Sqy162bztnVSLR2/UYnyiWdvvL8LGkhbJMamSzKF6Ft2/ujeI
	5qQuD/pi2AufIM5vr50EpdSEronwiiohNXFkSZpZYmWG1c4bkal4ZwwO5QAuYXGGXMZh8rA5drP
	L/oDObUk5Ujy8K9j3SQ33/fyMFDV37XqK+LW2G2axd3q7mNUwW1WQ8aNBNCjjQB4bIgC//Z3JJ+
	867OSGK4AGKLUnEoebD5lYOIFGaDKD+E0vUtqI1KGmDUFgfl7O0nSuz8WH5QKZUiHQvKqDDf1s9
	8QBzjpxUyz66t3oihrjUfu7eMWlcIJy+6UHPe+o86lPj9fE8q1wJze/ErWt55yrk5W+tN/oR1Jc
	LIHNJIK82AKhCV/RBz1P2XiePGCLuveOWtQ==
X-Google-Smtp-Source: AGHT+IFrQfhYYLDcOcklIphmk3LaaAGy6ccvp2arV3OESofIoJWROkko8fN5kaaORXuIhpFwjj8X+g==
X-Received: by 2002:a17:907:2d90:b0:ae3:5d47:634 with SMTP id a640c23a62f3a-afe07e9d221mr67370866b.9.1755765045354;
        Thu, 21 Aug 2025 01:30:45 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded355489sm349014166b.51.2025.08.21.01.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:30:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Karol Gugala <kgugala@antmicro.com>,
	Mateusz Holenko <mholenko@antmicro.com>,
	Gabriel Somlo <gsomlo@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Lars Povlsen <lars.povlsen@microchip.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: net: litex,liteeth: Correct example indentation
Date: Thu, 21 Aug 2025 10:30:39 +0200
Message-ID: <20250821083038.46274-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1068; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=RdLu58rkPGTY+tqQQir2QJXnP+/DeGGspDArj5JBTe0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoptkuPMnNZ8sg+hDdzh8QNFHnrn66BLYb23tUK
 StbaIlzrfiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKbZLgAKCRDBN2bmhouD
 17ZoEACLruAmBdVUQYdVGgf1ypibO7dLkXwjS6A52XCstq0B5vvYHZFF9C6I4i37mIonNLCvPQk
 oiTkDLHLd0XBA7acOAqIcEY2h1mGX2WU9nHLfGb0OAVIMqbFebxb7VKjl3IRK5svFpW/uf38ZbO
 e3Dv2qQMBVYTt0V80Ol8Br9a/jYtF5lwvL7/yXUqE88ZywKyzjHkv4FdsEHCrDksQgcHXErMbgM
 qFJbSP3aGTp8T2AJvujm6/RXD9sSN9x1dK5gMfNRmuzUCjbgfsopMcbt8y1vBswO/4ecv8y9v9n
 MleVR/L+aGMImotfDAQ5zud5pMjLOo69PHj2wGa+iygdWZetlkOl599zSRVC+0sCwV/1EJ5IAAU
 NeUyBF61YrWcs7FC1A8JwJsedDhdWVfZn5HeFiiOyNzpxW+DUEok2BX/mulXmtG4wu0649roP8e
 c2w7PlrzZO9Lamxh4mj8O2N+ck5uzqyosNnjK3yjTn9zcjX/Ij/F8MvP1kLzLwsi8aj6vRj1BlV
 mfmV3ycskX3b9RSwroFGIW+Z7YX8cRyfuEDvApCwyjuR/Sv8Ap9Yb11Yl8aIxJrseQJQN63tW7r
 FkNWwqkdsHTckcUWNrM7M1lTFy8sx4gwvpHrpfC+JBNgwMVh4u8Lg83VzBEtnLcMo5Xbp5iA4qZ ewZrZKm8AbE7WEg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_013047_249110_C9736E00 
X-CRM114-Status: GOOD (  12.30  )
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

DTS example in the bindings should be indented with 2- or 4-spaces, so
correct a mixture of different styles to keep consistent 4-spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/net/litex,liteeth.yaml         | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/litex,liteeth.yaml b/Documentation/devicetree/bindings/net/litex,liteeth.yaml
index ebf4e360f8dd..bbb71556ec9e 100644
--- a/Documentation/devicetree/bindings/net/litex,liteeth.yaml
+++ b/Documentation/devicetree/bindings/net/litex,liteeth.yaml
@@ -86,12 +86,12 @@ examples:
         phy-handle = <&eth_phy>;
 
         mdio {
-          #address-cells = <1>;
-          #size-cells = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
 
-          eth_phy: ethernet-phy@0 {
-            reg = <0>;
-          };
+            eth_phy: ethernet-phy@0 {
+                reg = <0>;
+            };
         };
     };
 ...
-- 
2.48.1


