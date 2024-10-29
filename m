Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADCFD2AB3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 13:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3b+jJZ61O2YJE1astG5gZoII4bdmJ7TLYj1iiVO0kNw=; b=IjWEpFKBn0FhSr
	9tesEfSaR1NVDNdDIinZdBFuV7Nc8OsMdvIvucXSLtzg/wfCutBITUdbuM5kVmHWtK+IOrq9rYQs2
	Xn2rdB2LlspVhsSwHaPkcwOLGAcAtDeAg0CU48JIKQ2KAhdEI1NZZbD75uVAltc1zzV/Z0/DSjNxX
	kXaqTakiQLSlgy1otzNvHym3D4CRFV9CP5CtQG4AeGMwGeFtKHcsuZdWnoOKaQyQkXq/4HHUylzap
	AuVm8CukOZA3pwJKdSRsldATqNjdYx0qa1zMLgmOTd0SZSi8r4c0ooGxPgapRoa2GH6GzyvVQMddS
	tX49PCgtcdWLe68EpRbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lqg-0000000EV8i-2rPI;
	Tue, 29 Oct 2024 13:01:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lAI-0000000ENdI-04sX;
	Tue, 29 Oct 2024 12:17:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 182985C5C81;
	Tue, 29 Oct 2024 12:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78515C4CECD;
	Tue, 29 Oct 2024 12:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730204256;
	bh=gPyUYPLZV8oxiK3WNdmSQuKs3a3P/OP4ElS0lx67Vl8=;
	h=From:Subject:Date:To:Cc:From;
	b=M7Br2nHRJWxxN5jpH5LxN5nGhvQ8VGYvIamrv9Qjss54fS1hKyeF4LLLGuJVggWpA
	 0SOxFEb0gdpfbBFmTKs6rUc1uMG8dtN+ENyrpTFjW3ifIhdUYpm1vapFoHsI1jA2gv
	 //nWPXGrPwS+mab27s2VojUcKNBP31NEPDWyFcMllyxsfkK1rDvxnhdrKxIS9Ectpt
	 sQWFYl3VvEe4JyrZTvnleBU4qR/uLv3R07VF5W8BFYKIW4SvUAAWcgFDkO5O60ZvFi
	 F73Hns2/ziggf8gd/SNPk690GE5ZB0ON3tEAWM56/A54fY4tjdSpu/WRx3CFsgIhRX
	 y+puIB6fenNBg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next 0/2] Simplify Tx napi logic in airoha_eth driver
Date: Tue, 29 Oct 2024 13:17:08 +0100
Message-Id: <20241029-airoha-en7581-tx-napi-work-v1-0-96ad1686b946@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAETSIGcC/x3MwQqDMAwA0F+RnA3YrnXqr4wdQo0aBq2k4gTx3
 y0e3+WdkFmFMwzVCcq7ZEmxwNQVhIXizChjMdjGOtPYHkk0LYQc374zuB0YaRX8J/3hy9jWtYE
 Cjx5KsCpPcjz553tdN1GjI79sAAAA
X-Change-ID: 20241029-airoha-en7581-tx-napi-work-312646caced5
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_051738_139261_18FCBEE2 
X-CRM114-Status: UNSURE (   6.34  )
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

Simplify Tx napi logic relying on the packet index provided by
completion queue indicating the completed packet that can be removed
from the Tx DMA ring.
Read completion queue head and pending entry in airoha_qdma_tx_napi_poll().

---
Lorenzo Bianconi (2):
      net: airoha: Read completion queue data in airoha_qdma_tx_napi_poll()
      net: airoha: Simplify Tx napi logic

 drivers/net/ethernet/mediatek/airoha_eth.c | 102 +++++++++++++++--------------
 1 file changed, 53 insertions(+), 49 deletions(-)
---
base-commit: dd1b082f015317091034bee815b97d911d7a2195
change-id: 20241029-airoha-en7581-tx-napi-work-312646caced5

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


