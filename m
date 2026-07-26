Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0FFC531CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 05:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ev/3L8OQlWgePlw96lEzXKu7EjQVakUCH3mo3g6zOGU=; b=fwS8fiO8TZ3dl3jTDEN5CZu/6a
	Gu/BWgLAGkPyBlGy7tYScEd6SEwt29W1+A5U6rC9vXKlt4XxxFtG7HLhBsrofnzhqbJKYYN8flIqG
	hkGwju+sBVbC+HLYTif5KB2G7JB+k31FCQ8AKESmAakkQfb1sceaigYfQn9OAsj9j2EOJwRqYShEn
	bSIwuICqkf35+YpxcpQvH1wdhGJ5WObQro1kq3Tp8TpxpFAZ6iJJsL4Fqa01xM31nRjppyxqMMbM7
	T/e8ECuMQ2Ir8/CJ0MOvHbGJdTqnUvDHyQ6rWbPCZbWtgNyu3XzsmacqAZwxRJe++Ppz+SRftTkV2
	OanFmZIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnrZT-00000000vd3-3vXX;
	Sun, 26 Jul 2026 05:38:43 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnrZR-00000000vcC-0KPS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 05:38:42 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-84e27035206so1622839b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 22:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785044320; x=1785649120; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ev/3L8OQlWgePlw96lEzXKu7EjQVakUCH3mo3g6zOGU=;
        b=K6EaAJqrKuI6BoAt6OeuGQJ08280w26DfR0Yy2T+W+urW0YMaFaAf7yHx32l+K1VbF
         NxTdUvPqDmn/tsSW2aA35sfJtaJpscGhK0+jU3dR+vcXuIxNn8wb3+BEVr+BoUZVe1cv
         X8vYvxYbzYvkzj15sJTvdVELLZVPINTqnJq3oto0nvv23Gexi7mgifwBap/nrDHl8jkM
         L/SAKJFujXoDDjNjHV0A8vNuxJ65Cu/udjymJ8RHjvU0rH2L+rdtm7sNLz4h7IROtamC
         eNRx9LdGXweuKOVt7NHvJ6L0FWYdRlMipK9dee7gmHId2vYk/GbeuFjE5+Bx9swVoD3z
         i5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785044320; x=1785649120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ev/3L8OQlWgePlw96lEzXKu7EjQVakUCH3mo3g6zOGU=;
        b=OFP45Vzuk3+PAsRTLgodmLiEI+5NRpFp4YiOfjQexJrDRrPyj1njE1J/Bh2OPkX8YW
         FtLenDurzp/7XAotNkC92iSI8Vp8SBH2U8ToLVb2snZmOO0v7s0iJGSl9sL5lwvUYRKb
         HISDfEKemw5Y6FOIMcxMOcCraL0rtcIqDCkcSQubBvrHQ8idzBcsd34Mf5hRJ5vnf3u+
         l2lwy2wDYt9O/gczNwOnt1PgrkDm2w+zFF9UYC2Cfnn32QljuP2m18s71fPvqkp3Yo7y
         vnekzTq2oyqnTpK1RZSUNc0x2Mux+qWDOLaaMpzxVuGWXjexuXMwQ/FF5otbrIsJ5zjS
         pDMg==
X-Forwarded-Encrypted: i=1; AHgh+RqsezTYHpeDXPw9LTx1zVbaR3wkyPPn3Uf1hoi6wNY2WB5w55/QZ9WUhgKjxj7mb47pf63s05+42b1Wi6iFEbws@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1iMnBvgg2BLExjgjdfmAgHOyShbriX+/gqsYe66t/zPXjb12b
	Ix3AFU01gqkFOcEw+/V09eGY3Nwz2MS1GiH2VP8dKe4qlm0AVufwojqTcr1OyCzpHpE=
X-Gm-Gg: AR+sD123ngDEaiTuAhZKcXs2ILJfczSCeRY5WV4ghshr1CzbmVaLqwVu9p8iPFJ4yBx
	Wi7mVfGhRHqeR2ZklbWGSjpVvxb0h110B2yAfM+f3FeQjcJfjnXPOuGOvGuEgvAR/eUsOspfqMr
	ZFiEW15vfMJZ4nc/Hdan0XYns+X+NBaK+PGRikX1HQ/jxqmUzlz45UlKNw+E7wtpE3F0bMNQWbj
	hVJH5uPJzCqKFOfHFfXw/0DfCmgPx7tM4hZijMEZnA9rB8nLukjxYVb1xhaTPQsP+D6/3Zj+L5y
	HfN5j3GtpGTO3mJLvW96mDzRZSvQ/RZx6gIk8UjMx/Cgp3HUh+Rg8MFntJ9DbFG1ydNZHOiAmZ7
	jIgvvqArHS4QgMXvHBosNPE0djlD0zMMXmS7ZA95zD6eOOjw5YxKFmuCRPZ/UQkBzD7PKraFaki
	C9p0MoQB0bR47xnfBRHB2bZTLURHfYX5Q=
X-Received: by 2002:a05:6a00:190c:b0:837:e9cc:d474 with SMTP id d2e1a72fcca58-84e593ff0efmr3181609b3a.2.1785044320319;
        Sat, 25 Jul 2026 22:38:40 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5346dc8bsm1600912b3a.61.2026.07.25.22.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:38:39 -0700 (PDT)
From: "shaikh.kamal" <shaikhkamal2012@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH wireless-next] dt-bindings: net: wireless: mediatek,mt76: fix 'spacial' spelling
Date: Sun, 26 Jul 2026 11:08:17 +0530
Message-ID: <20260726053817.17409-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_223841_130277_F8E7B940 
X-CRM114-Status: GOOD (  11.09  )
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

Fix spelling error reported by codespell: spacial -> spatial
(spatial reuse). No functional change.

Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
---
 .../bindings/net/wireless/mediatek,mt76.yaml           | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index ae6b97cdc44b..e51acc544f15 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -221,7 +221,7 @@ properties:
                     minItems: 4
                     maxItems: 4
                     description:
-                      4 half-dBm backoff values (1 - 4 antennas, single spacial
+                      4 half-dBm backoff values (1 - 4 antennas, single spatial
                       stream)
 
                   paths-ofdm:
@@ -229,7 +229,7 @@ properties:
                     minItems: 4
                     maxItems: 4
                     description:
-                      4 half-dBm backoff values (1 - 4 antennas, single spacial
+                      4 half-dBm backoff values (1 - 4 antennas, single spatial
                       stream)
 
                   paths-ofdm-bf:
@@ -238,13 +238,13 @@ properties:
                     maxItems: 4
                     description:
                       4 half-dBm backoff values for beamforming
-                      (1 - 4 antennas, single spacial stream)
+                      (1 - 4 antennas, single spatial stream)
 
                   paths-ru:
                     $ref: /schemas/types.yaml#/definitions/uint8-matrix
                     description:
                       Sets of half-dBm backoff values for 802.11ax rates for
-                      1T1ss (aka 1 transmitting antenna with 1 spacial stream),
+                      1T1ss (aka 1 transmitting antenna with 1 spatial stream),
                       2T1ss, 3T1ss, 4T1ss, 2T2ss, 3T2ss, 4T2ss, 3T3ss, 4T3ss
                       and 4T4ss.
                       Each set starts with the number of channel bandwidth or
@@ -262,7 +262,7 @@ properties:
                     $ref: /schemas/types.yaml#/definitions/uint8-matrix
                     description:
                       Sets of half-dBm backoff (beamforming) values for 802.11ax
-                      rates for 1T1ss (aka 1 transmitting antenna with 1 spacial
+                      rates for 1T1ss (aka 1 transmitting antenna with 1 spatial
                       stream), 2T1ss, 3T1ss, 4T1ss, 2T2ss, 3T2ss, 4T2ss, 3T3ss,
                       4T3ss and 4T4ss.
                       Each set starts with the number of channel bandwidth or

base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
prerequisite-patch-id: 912014811782d33538ddb17f00b64c15b364425e
-- 
2.43.0


