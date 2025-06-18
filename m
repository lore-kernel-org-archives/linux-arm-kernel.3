Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB90C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 07:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=57aKzeu1I0Z8r4VtQPVgn+nBrMr5R7k20mO4BbYd+G4=; b=IxZdbXNJI6dFLp
	YatpufjcFK5N0wrSHeOLashbE0E911mt/ZWn+oM4ROxRw9o9dNdn1igZXX92HsIX52UlVlpfVfYYE
	GWgN9+omaOKVJtJ6gV8+yIqkPtUT3QScm7ufBqTKBCe8IuOV/JUUzDx6keebPUaGM5iMQ9eygZhAR
	utjLgu/ajaWywEx8VKcpd7DcW+jaotNQ0Zn3/6Wim0PLpyfssa6yYHTuaXSkAfCkWi2fUVMlaMcuG
	8WRQaDJR79s2fOVN2yhG7pJl2fc7Rn432ZIXrUSxtX2WdSg9zIfLlepQD9a8Ic6PI0k++E+VOSpml
	hKTWVLD6PhecPkPaE07A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRnZT-00000009Kla-1zC8;
	Wed, 18 Jun 2025 07:50:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRnXF-00000009KSH-1cH6;
	Wed, 18 Jun 2025 07:48:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 885286112C;
	Wed, 18 Jun 2025 07:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA4CC4CEE7;
	Wed, 18 Jun 2025 07:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750232920;
	bh=+/zmf0Zit1fRNlUV5u/lb+nGJi/dBvp3kAUks71W9P0=;
	h=From:Subject:Date:To:Cc:From;
	b=PquaoUNyLF0WxQ6Sx6Up9q7eFUUOgbvrZCWwkUXyfJw1MqfsvLprQF1mFmeu8jvAB
	 atmT0aOFdO/6dUYvl443aWq0i/eTS5HC6oGQLvJd+KPF+RIn1InVRFONm2IKEcvxFM
	 i5oCSTwzd8IWqNzxnXyUP1Ay643J+RVzJEgtysUR4fiEYze6AZ7gnnJZX0afYPsORF
	 gaINh7JGOtbCyf3dOBiUgEKH6ezjAjV19jmyYOhx8yYCN2hFHcsMH81TmxzykLFdRs
	 /myrgGgy/2VyjTt/a5GchaBHgckNiayogkYSkNOsTA3BkL+kuIbFXR/juh9vntN7Ca
	 CqNUsQlhDIJuA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net v3 0/2] net: airoha: Improve hwfd buffer/descriptor
 queues setup
Date: Wed, 18 Jun 2025 09:48:03 +0200
Message-Id: <20250618-airoha-hw-num-desc-v3-0-18a6487cd75e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADNvUmgC/x3MTQqAIBBA4avErBsoQ6muEi1Mx5xFFko/EN49a
 fkt3nshUWRKMFYvRLo48R4KuroC43VYCdkWg2iEbFTbo+a4e43+xnBuaCkZVE4uyg2ul5qghEc
 kx88/neacP8CIWb1kAAAA
X-Change-ID: 20250618-airoha-hw-num-desc-6f5b6f9f85ae
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
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

Compute the number of hwfd buffers/descriptors according to the reserved
memory size if provided via DTS.
Reduce the required hwfd buffers queue size for QDMA1.

---
Changes in v3:
- Target net tree instead of net-next one

Changes in v2:
- Rely on div_u64 to compute number of hw descriptors
- Link to v1: https://lore.kernel.org/r/20250615-airoha-hw-num-desc-v1-0-8f88daa4abd7@kernel.org

---
Lorenzo Bianconi (2):
      net: airoha: Compute number of descriptors according to reserved memory size
      net: airoha: Differentiate hwfd buffer size for QDMA0 and QDMA1

 drivers/net/ethernet/airoha/airoha_eth.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)
---
base-commit: 0aff00432cc755ad7713f8a2f305395d443cdd4c
change-id: 20250618-airoha-hw-num-desc-6f5b6f9f85ae

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


