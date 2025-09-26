Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EF0CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 15:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DLez7ZSV6TyDztKlIUL1NndgYoVTL8lTqwL79D9Xc48=; b=cZ+AiaL7EyZ/wY
	/PUVKTvfIWthYXKB/TodVwCW4vX/d/MHg4vj6gbJmcums9T9V+4OKeydbZa+1U+wT2cgI/CUaDLWf
	NEzAoVCjN9tit5aQgMnO9ItnjjRWA4DYjyUK0dYeT9JKyIQsShrd4XOetcpl8m+5QCgfKnozpt38/
	r7t1Ou7I06ozRKtzTqxxRfmmxKkgpTQ5gfPzaQwVajTP+8i674R1pARSFdHVHo0sVUXYqZbFUYP2v
	L8JUPTRvy/+qvXJqOiOJtvEd1J+CQXm7JHr/IARN4jFwqmvxpcuDoQt+gdYT+0Pt3FBSO0doW+RJC
	G7B8mYZQbDhYdV2sh9fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Abh-00000002XAt-0fTR;
	Fri, 26 Sep 2025 15:43:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Abf-00000002X9i-2Zbr;
	Fri, 26 Sep 2025 15:43:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 24E9961EAA;
	Fri, 26 Sep 2025 15:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D37C4CEF4;
	Fri, 26 Sep 2025 15:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758901413;
	bh=kiQw1h1Bhq5/hBehSmba5mkf1vpWGZs7wBgPUjiAOwc=;
	h=From:Subject:Date:To:Cc:From;
	b=tNPR4TfNmex+GgVpRuaQwhJGpQVmEF2UwUhVjOQyTLK+XU8wrCimu8rdWzNMrv9bj
	 LrYHFZbuA7cuFGzOb5raIB+L4Mdl2/kQPmZabAoBhzFcxmBVDHKfwYsSgcxFHqS9Bj
	 wSPjZaW2ZZZoKGCDRUhs+8d+PAw14qzBlqU24MInxa2lzqRLQiINhEIKHuXp+N9CiN
	 ejEN4QOMaT1UF+a8rqMxkCJ3Y2t6NU/nbNGQ5Nil/EKWGuLEgh9kPMwuq4+0oCy23a
	 eNvpf6T18/2KP2Lxzkr/ZUxxJnS0XSCaK/mbkUysMiimBKtWOQy+nKTqjawzmo69v6
	 IYXE8FVWwCK7A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next 0/2] net: airoha: npu: Introduce support for
 Airoha 7583 NPU
Date: Fri, 26 Sep 2025 17:43:21 +0200
Message-Id: <20250926-airoha-npu-7583-v1-0-447e5e2df08d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJm01mgC/x3MOQqAMBBA0avI1A5kd7mKWAQdzTSJJCiCeHeD5
 Sv+f6BQZiowNg9kurhwihWybWAJPu6EvFaDEsqKQTn0nFPwGI8TO9trdJqM1EI6Zxao1ZFp4/s
 /TvP7fpwh/41hAAAA
X-Change-ID: 20250926-airoha-npu-7583-63e41301664c
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
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

Introduce support for Airoha 7583 SoC NPU.

---
Lorenzo Bianconi (2):
      dt-bindings: net: airoha: npu: Add AN7583 support
      net: airoha: npu: Add 7583 SoC support

 .../devicetree/bindings/net/airoha,en7581-npu.yaml     |  1 +
 drivers/net/ethernet/airoha/airoha_npu.c               | 18 ++++++++++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)
---
base-commit: 203e3beb73e53584ca90bc2a6d8240b9b12b9bcf
change-id: 20250926-airoha-npu-7583-63e41301664c

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


