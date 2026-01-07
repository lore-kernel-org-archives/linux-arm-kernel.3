Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665CECF6C0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 08:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mFaMXhDDX4mIOiIicRcCfjH2Zgh+XyOijOnMOXqUIAM=; b=F0/IrzBqPpJOJW
	sGT5DHkvcGZcs7mrYdqXRwbBpt1GwAunE2svSgO55AyBZPeeaKjSXZwx1S9GiYdBQ2YF4NZ1OXVm3
	saDX4J2O8EydZ/0acsV/4qJJJCnr4etl99l8K/rGR4Oo4KDGirtPIpSDRQnQH7AfU4Ijr4Fv8r97W
	N5S6siN5Mx9U2eupKToWzQz7jhQ4mdPdJb9M2s7tYSugEY6hoFr9jn1hEpgewWneHHz/noJavlfWv
	0ZaY/q1fojZpK0FZP9CnaZXAdUjR+VT4CHXqVq1tX+wFsz6rSRgnaClXa6WkeOV30xJ37Lslwuf3V
	VBdDZHr4nbgr2U9VLpxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOvS-0000000EPdJ-2BG4;
	Wed, 07 Jan 2026 08:29:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOvQ-0000000EPd1-489E;
	Wed, 07 Jan 2026 08:29:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 101836013B;
	Wed,  7 Jan 2026 08:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6738CC19421;
	Wed,  7 Jan 2026 08:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767774591;
	bh=HQW9+MChU3xfZrpOjQ72SkTW5oqkPjogg3Ob9cZ2vWI=;
	h=From:Subject:Date:To:Cc:From;
	b=cYLmz/D1gWWf2RKRY7d6SbaCBwqzDjux/AhaEnMh1ddjl8LaCwDafgYEHTx6gGD1W
	 Zxc2YnJKHyec3L7oCalZ9YPkD7L8fxiJQQ8Ef7lXCAwCU+cJcL5reYPXkyjTkGgOzb
	 H6TLdKHXXgfo9YYcLWlFxy7gZvxN/SA51DuQkI5lwTiaUJNxj5Q4Re8pezqxu/FLix
	 8cuSTY4DMtXMcxbSIx/jCEWjgRSrnQVec/Ekp06pcBLrJAuWoQ4LDdhr5LeuBSTsnJ
	 a+AupEf3JMtUkRK5y5eUDJ+Hr3XSGja/WeycI8hhz6tnkqWk1d/iQSZ3/xMkdJZ3fv
	 SpllhAs8LCG1g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v2 0/2] net: airoha: Init Block Ack memory region
 for MT7996 NPU offloading
Date: Wed, 07 Jan 2026 09:29:33 +0100
Message-Id: <20260107-airoha-ba-memory-region-v2-0-d8195fc66731@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CQAxFr0K6tmZmEAdZeQ/DYoAKjcKYjiEaw
 t2tJC7dNHk//78ukEiYElTZAkIzJ46Tgttl0A5h6gm5UwZn3NFY4zCwxCFgE3CkMcobhXrdYFF
 2J3fIvc1LB7p+CF35tZkvtfLA6an17dFsv+nPWfx1zhYNFo3xwee+1Xu+kUx030fpoV7X9QNgc
 nPWvwAAAA==
X-Change-ID: 20260102-airoha-ba-memory-region-58d924371382
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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

This is a preliminary series in order to enable NPU offloading for
MT7996 (Eagle) chipset.

---
Changes in v2:
- Remork memory-region entry in airoha,en7581-npu.yaml
- Link to v1: https://lore.kernel.org/r/20260105-airoha-ba-memory-region-v1-0-5b07a737c7a7@kernel.org

---
Lorenzo Bianconi (2):
      dt-bindings: net: airoha: npu: Add BA memory region
      net: airoha: npu: Init BA memory region if provided via DTS

 .../devicetree/bindings/net/airoha,en7581-npu.yaml   | 20 ++++++++++----------
 drivers/net/ethernet/airoha/airoha_npu.c             |  8 ++++++++
 2 files changed, 18 insertions(+), 10 deletions(-)
---
base-commit: 8e7148b5602321be48614bcde048cbe1c738ce3e
change-id: 20260102-airoha-ba-memory-region-58d924371382

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


