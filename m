Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF70BD29C36
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Mc75eeKcOhuOxEB+mH7yhfNNnBNqnhdYpGNBwRPdppM=; b=wLL4goI5JPizbG
	5YPfkE2oFYo5B7eVZssNs8Ep2Vgn3YQKTBWc24AWUxSXmnJSAO7jF5ZR/K6JA1wRbO+7SFq1KbgMI
	Eb4rNdjf+iB1NBjzRPEjuvzgu9GOMuhZW1ux2c0nn7jY65T2Fg7U+8KFSIVGUcLvHO5fyl54vkOLu
	INb5+Dxxd+Tj2XKge0TTCIji5MeZG37h8wh8bUWMBJsaEV3uxASImY24Jkqo1EfKa/jw84tgah0pt
	UWGIc8lmJxBADBJf/WGoAKYgvyhEwOoHBW4WrT6YNQYMJMQhdC0pA3a0PvpBl685RLTQ+mSgL5UDy
	IDnYaWT55LyemZ+ZQM2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrFe-00000002MA2-39LL;
	Mon, 19 Jan 2026 15:33:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrFc-00000002M8v-0byt;
	Mon, 19 Jan 2026 15:33:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC25640875;
	Mon, 19 Jan 2026 15:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68535C116C6;
	Mon, 19 Jan 2026 15:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768836784;
	bh=qCOlgkLkBdIOO3vDqA1UxzM+1Hg8d2IVWg/s4RzhgoI=;
	h=From:Subject:Date:To:Cc:From;
	b=XpN06rJVi7+SvkWosx9xeQnxKLhUcZJ72DnQjIdXkU1eQ8Z+C5bJDAzfHqDm22jre
	 73wvZWs3v8+SmRW7J5e0bGrHHe0sn53anNLctBNXWSwy33i9n7vd+7MP4MAsIVGdLO
	 GkQg0qlURR9ZiqGJfMZ/yVzxvtYFslxk05FKj8ob5yl+rr2QGoEAUEtZefD7yEdsXQ
	 8LvfQgL0mhUslduSbsnha7g5X+xhT/dwLMtHCeq+lrgSTpFc5wlnAFR1whD9hCLUZ0
	 IqGo6OxpPEf5w0alHlRv1ruCTluliBU9uajmFzQZOoiOcYap0yF9NU26P8xUQ8nYes
	 FDETolMeEDdzA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v3 0/2] airoha: Add the capability to read
 firmware binary names from dts for Airoha NPU driver
Date: Mon, 19 Jan 2026 16:32:39 +0100
Message-Id: <20260119-airoha-npu-firmware-name-v3-0-cba88eed96cc@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBCF4auQrq2ZThGIK+9hXBSYQqMUMmjVE
 O5uIS50ocv/JfPNJEZiR6PYJ5NgCm50vY+hN4moWuMbkq6OLRAwAwW5NI771kg/3KR13N0Nk/S
 mI6lT2gGgUUZbEc8HJuseK308xW7deO35uX4KalnfqMLfaFASZA2lSosyyxXYw5nY02XbcyMWN
 eCnpP9IGCUsqlLXqAEh+5LmeX4BTtcbywsBAAA=
X-Change-ID: 20260107-airoha-npu-firmware-name-34e5002a1a3f
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_073308_205612_B3F3F641 
X-CRM114-Status: UNSURE (   9.44  )
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

This patch is needed because NPU firmware binaries are board specific since
they depend on the MediaTek WiFi chip used on the board (e.g. MT7996 or
MT7992). This is a preliminary patch to enable MT76 NPU offloading if
the Airoha SoC is equipped with MT7996 (Eagle) WiFi chipset.

---
Changes in v3:
- Roll-back to approach proposed in v1 using firmware-name property
- Link to v2: https://lore.kernel.org/r/20260113-airoha-npu-firmware-name-v2-0-28cb3d230206@kernel.org

Changes in v2:
- Introduce "airoha,en7581-npu-7996" compatible string to specify the
  firmware and drop "firmware-name" property
- Link to v1: https://lore.kernel.org/r/20260112-airoha-npu-firmware-name-v1-0-d0b148b6710f@kernel.org

---
Lorenzo Bianconi (2):
      dt-bindings: net: airoha: npu: Add firmware-name property
      net: airoha: npu: Add the capability to read firmware names from dts

 .../devicetree/bindings/net/airoha,en7581-npu.yaml |  7 ++++
 drivers/net/ethernet/airoha/airoha_npu.c           | 42 ++++++++++++++++++----
 2 files changed, 43 insertions(+), 6 deletions(-)
---
base-commit: b4e486e2c46f754a515571a8ca1238fa567396dd
change-id: 20260107-airoha-npu-firmware-name-34e5002a1a3f

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


