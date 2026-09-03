Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E58C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 13:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DtTW1L9CteYH31Afl0XmISOi/CVI+FNzcOwRvC8l1k0=; b=PJmg4gfylKhQle
	sEztzWWtSGwvfuu3zlXfV36jt1hgxFdgCpyG2ekjZ6vuZxJ3phdxx2BMLalyKFhvoMavS8bu878Zc
	xTgT2hIpoZ9y1A/TXYmeCoESY3vP4Jo97vK8UQCAV6WisKilKxj/F4FRWqdtPZg4Ds5HjiTK6Yv37
	0nZyBE/UMFND0i0XX1rQoffEKCa5tLFN4wZKqg3yPey5y6e9+sDi7wuQv8+OsHol9Gw8HM6k2rnLJ
	DUbQGel4ONZWqHhmJEhNFugVoBr2CAV8qH0lE75/ngzABFYgFHbidf34xoC5okQsuKidagD+MBCqR
	z35tLiE5ntvlLEu4UeBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27ye-0000000HSI2-49Gl;
	Thu, 03 Sep 2026 13:59:40 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27ya-0000000HSDt-128i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 13:59:38 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id CEC80EC035E;
	Thu,  3 Sep 2026 09:59:34 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 03 Sep 2026 09:59:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1788443974; x=1788530374; bh=Dt
	TW1L9CteYH31Afl0XmISOi/CVI+FNzcOwRvC8l1k0=; b=fBVcwxLDlK5CO5P5iS
	A2jvf/ucOLhZQ3UMEJvIbL98vDmxIIP7RxkbBia42vL3OFrj/aiC2zI9wbH8YCpf
	GUjxdBNXVEUbSwDYw8Ec5cgXfuXNrYofQEcTkELYk80c62vOOupCxa8+EhFvGgRX
	jkKqGO4UiG2irKSZGmj0oe/XWGt7GCNQmDMpVdelSh/bUBaBZC8P1LeEQYiGj12g
	2NytmVBs5Xow3SKrLwmWKNP9nYGnN2FyBjlPEjSXKwzpyDS4aG6sKYBNUVBVpBqq
	NZjIqt43AU8Lpg7CJ76CCIhBQa4hWKSnWJ2hnFFbaU/wsdcWoZ4uJe7rX39cdCiI
	i5rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1788443974; x=1788530374; bh=DtTW1L9CteYH31Afl0XmISOi/CVI
	+FNzcOwRvC8l1k0=; b=pRp4FOBzSHxr23+Mc59tQff6FHBmFntR3EgqKZSv/XOl
	T9kZ3VaqqWkL0mE3z36gChEADWWwhiGzkrE0ZA0ePQYHTLBwKonImkFNhTG36hm+
	9r0iEZ0X+FvlslfV9ewbx42pM8av9Th1Q7GTeJox4UEGkvdzyeHMBK5mgn4eo5lC
	6U11WhwWPgQSyRS61EB8ZVLEMA/tY3mxxqSnLfPzoQBMeg2lX67OFONrzL0cH4tl
	+3k1w1s6zH+BHBdrT2MASzRHAuo5yppEQtbZGdEfipGK/hkFMRqKUXdDBR6jMq65
	eYg50/3wom2O/3mklg3BIzp1KxC894qKu1wVA4oyAA==
X-ME-Sender: <xms:Rn2ZagW3OPgjvxuwSgCXMsCHmoUagTBEdfyv9E-4t8-Z9_4N0X0Zhw>
    <xme:Rn2ZagbWYXDMbC1Y7XYlY19W5P8fV4ZnpFdqL8V9rjaavJdAGYncpnXslqjhgEXHk
    pJEESuehANyxJ2eZW9Sdo7lqbnyGg8s2jonZBDZjl13c_IHo0Y6ZUB9>
X-ME-Received: <xmr:Rn2Zavy9ygk5xxqxr0TZEJh4GckgR8n4_UXemMGtuBMncltZFiQ0uYM0FmcYEWpiAIuxICuzZMyRFDKp9bYNcTusmVkbW9KH8dLK2Q>
X-ME-Proxy-Cause: dmFkZTGzA2xEus0Ux9NLq2ASgukLUme45vhECBV0qD4rY9LY6YMcVHp+TmAWmzJEYZPlqE
    /Bj2TASFACbeo4vHchm0M1fcb6ISBLnjUCtTM0/dbphHSSA7Ei9/0xo8RJoESuKHGYcrmL
    jhd3iPrgMhqerCqFXiKSO2EVgL72BaApgAQ/cWISRsqHEV7QkVc3wB9kJ+bZzJHUub1JTz
    smDC1gS1Xg4PMpMxw1XVj2u/qYApAg/pMnr/4dqMjhJ1vGXTxkyj2+UzyeMMX+mUe6FvN4
    XLTViPbw2UTeWgp+1Lv3NhL9N7G4HEtziybuIcIi3n+IUYYf0T/NekBvltfrq2y4BCT0ZB
    vTJLFk954C/TRrp0Bw2QPcXxywnoEiBv3/bgws0LVCkZu67dFazBgVnMSx3oegrZTTgYYv
    9E0GqAlJQkTxewWIY2dq119SOBYCx9K7f+DU37bXYDPqAdFNGu29pB6p8Qmfq+TG3erKok
    +kiRywlv0+jItuGRteGK4hGMjloRlxkhwPz9hqfgKwii8pDi/UYPbu3Py7PGIW+5BiIid2
    UrOuzBCuZi9D5qa397kybCTNDTMV5vZk8d6zCQIkGfolEXDWtMflEZyyC2MroGiaNztFpF
    ck3XZuRNI37bbaZ/Dkm0bH9+V1u6JI2gNf3U5wLQ7kzmeWafqWYKECNnGtCg
X-ME-Proxy: <xmx:Rn2Zao2JATHnXi-2t8_87SGLyG24iwxOirgly6CA-rIxFwe_S9QceQ>
    <xmx:Rn2ZaonVwpntQAax7ZGPtnawEKcSa_xkJsMJoSBdCN7g6Ng5HOc9SQ>
    <xmx:Rn2Zav_SGFcKgjfonsB9Sgh2odQ13zDMDBjbCVEiacQawB1cc2LpUQ>
    <xmx:Rn2ZamL-z9G-ur3mYQmvAUzUR5uttBwx8WFKJfhblouDwjp5z2y-lg>
    <xmx:Rn2ZaqShLOWRsL1QkEe61awT9EAW8WfVEySO_5Bx8DgW9y9pygsgsprK>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Sep 2026 09:59:33 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH 0/3] Fix dt-style-check issues in Apple silicon multi die
 .dtsi
Date: Thu, 03 Sep 2026 15:59:31 +0200
Message-Id: <20260903-apple-soc-multi-die-style-v1-0-eeb05ea0c187@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MywqEMAyF4VeRrA20AYvOqwwutKYa8FJaZ1DEd
 ze4/H4454LMSTjDp7gg8V+ybKvClgX4qVtHRhnUQIacaYzFLsaZMW8el9+8Cw6i2k9tjqqeqLY
 huBp0HxMHOd7vb3vfDxMxJ8JrAAAA
X-Change-ID: 20260901-apple-soc-multi-die-style-625b2281ff68
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=I8Gyi+isa/p1O2wNWeROvhfqx8xw+u0txi6tLoZTgaQ=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqyZtc6XQ+WE49WcGjYdWrjtRWVPRp5ug+acYJ1rlWu39
 WbeD0nsKGVhEONikBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMBGxDob/vv/VXxhk367eVLjy
 k5DFY6Uj77x2pWuzv73eZp95eovJG4b/PopeW3RfOid1C52qOhoQd7Z70YY7ipuWTL3Zcj/50kt
 lZgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_065936_719087_38CB6A85 
X-CRM114-Status: UNSURE (   8.01  )
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

The MMIO nodes in t60{0x,2x,31}-{die0,dieX,nvme}.dtsi are indented by
one level to signify that included at this level. This looks weird by
itself and dt-style-check comaplains about it. This can be fixed by
moving the referenced soc nodes into these .dtsi files. Since the parent
soc node varies add a preprocessor define for them. The multi die .dtsi
files already depend on the preprocessor. Suggested by Krzysztof
Kozlowski in [1].

1: https://lore.kernel.org/asahi/e2365307-32d6-4ef9-9919-55ba69786741@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
---
Janne Grunau (3):
      arm64: dts: apple: Fix style issues for t600x multi die .dtsi
      arm64: dts: apple: Fix style issues for t602x multi die .dtsi
      arm64: dts: apple: Fix style issues for t6031 multi die .dtsi

 arch/arm64/boot/dts/apple/t6001.dtsi      | 11 +++++------
 arch/arm64/boot/dts/apple/t6002.dtsi      | 18 ++++++++----------
 arch/arm64/boot/dts/apple/t600x-die0.dtsi |  3 ++-
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi |  2 ++
 arch/arm64/boot/dts/apple/t600x-nvme.dtsi |  2 ++
 arch/arm64/boot/dts/apple/t6021.dtsi      | 10 ++++------
 arch/arm64/boot/dts/apple/t6022.dtsi      | 18 ++++++++----------
 arch/arm64/boot/dts/apple/t602x-die0.dtsi |  2 ++
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi |  2 ++
 arch/arm64/boot/dts/apple/t602x-nvme.dtsi |  2 ++
 arch/arm64/boot/dts/apple/t6031-die0.dtsi |  2 ++
 arch/arm64/boot/dts/apple/t6031-dieX.dtsi |  2 ++
 arch/arm64/boot/dts/apple/t6031.dtsi      |  9 ++++-----
 arch/arm64/boot/dts/apple/t6032.dtsi      | 16 +++++++---------
 14 files changed, 52 insertions(+), 47 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260901-apple-soc-multi-die-style-625b2281ff68

Best regards,
-- 
Janne Grunau <j@jannau.net>


