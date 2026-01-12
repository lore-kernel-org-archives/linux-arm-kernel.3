Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9623CD26D9B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 10:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W/DvSN49heYgB/+z6Tbnmlxskn5YaNJEiOs8x8sn05c=; b=DnFrEtPPBbtIhw
	ahSbk+VNAY3MwCT4PE9iN9dnVDjtHBrwM4iceKsuYn+mJI4CVDtcU3BuKk0j/fDWL689ZKaWs+xO9
	8n//OzJLyWLYaynQXxGcmlWecUZWsidmhL1FZoN0llj9iksHnxUXJz+3+Hg18aqNFNTmvtutgJUL+
	S+hv3PMF3TSDSjOc1kvQz2HeA05v0Y/NPyz5fKEOr2m2H0Y1hI6dJlSnMRxR8d0i0arCnHM/SGieI
	P8N4Z6fw8J0hwjK9QL3D2Y6M98nGbgCboAu2zwAthnuq0HlU0oXelnnK/7Hey3I0T+oz0P82gjbCy
	4/kCQi6/9krcuI5fhAMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEis-0000000579z-3kc6;
	Mon, 12 Jan 2026 10:00:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEir-00000005792-0qq6;
	Mon, 12 Jan 2026 10:00:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 13E004331F;
	Mon, 12 Jan 2026 10:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7248DC19421;
	Mon, 12 Jan 2026 10:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768212027;
	bh=nNjcBRPDxW9Qm7zjbNWDFXwpKcSEsn9avwvDkyGys8M=;
	h=From:Subject:Date:To:Cc:From;
	b=eMFOq3UmpspiU8rXlnsf6nEjVGD+VN/KTi2/totKywtwrfRT6A+y+yC8sp0PLWy1g
	 xKDE60+fh7cL61cbSBut9dML/oCIvjuy5l5MZ/sFx++WvXSAHUo3SnEFqHKZehzWqf
	 kMUAGyek0dp4fuddT7KEVzDHGZVQeTEJsEre1tsl9jkWNZi/APXRZF4PC0bjcqsjeT
	 1tH6K6qdDPylNcee0KJLwBXGWzqSrWyd4M26n/STXvpcxvmnYXPh3SBSqKChKottM+
	 66K4LnpFfVqeXqRwosq0fSA/84GgLi9xPOqWdFwVkDNDAE7p2ccr5B7XDWMwJzqzR9
	 H4ThjTf9ctJGA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next 0/2] Add the capability to read firmware binary
 names from dts for Airoha NPU driver
Date: Mon, 12 Jan 2026 11:00:06 +0100
Message-Id: <20260112-airoha-npu-firmware-name-v1-0-d0b148b6710f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqFMAxA0a1Ixi+Q1h+4FXmDoKlmYJUUPyDu3
 eLwDO69IYmpJOiKG0wOTbrGDPcrYJg5ToI6ZoMn35CjFlltnRnjtmNQW042wciLYFlJTeTZcRk
 g55tJ0Otb9//neQHIquMeagAAAA==
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
X-CRM114-CacheID: sfid-20260112_020029_286816_9BC60FF8 
X-CRM114-Status: UNSURE (   7.12  )
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

This is a preliminary patch to enable NPU offloading for MT7996 (Eagle)
chipset since it requires a different binary with respect to the one
used for MT7992 on the EN7581 SoC.

---
Lorenzo Bianconi (2):
      dt-bindings: net: airoha: npu: Add firmware-name property
      net: airoha: npu: Add the capability to read firmware names from dts

 .../devicetree/bindings/net/airoha,en7581-npu.yaml |  7 ++++
 drivers/net/ethernet/airoha/airoha_npu.c           | 42 ++++++++++++++++++----
 2 files changed, 43 insertions(+), 6 deletions(-)
---
base-commit: bc87b14594e30720a5c1546c24e0f5f08d34eb40
change-id: 20260107-airoha-npu-firmware-name-34e5002a1a3f

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


