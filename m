Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9627FC2A072
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 09:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BCTvANCRPiU3AnLkxPXXg/pwM8FbUyQvzp1JSLEK3HE=; b=XKFLveYowHSEU1
	9rPvRcTWs958HGF/GQqtOD8f+eQPDbhJmwYLOj4xcP9NMjRvkD66pYkfKpVdruLCmp6bQf4crnwsu
	Esc4O/bg6cGYLt3SFRH9NcBbFz6RnxULppMgNZUmuzKlfH7StJK45zPE4VNBCXqVMhA61PsEl9sCA
	vpEQypEdY/9hTTzhZwHreAn2OaiTHFIdk1Mr8QSeVzDB+aIFikRP/JglL7jgbQunMfmuxlm9Txqai
	lQQ95NR8nJknOgxKXbldz8qTqgUWyDal6l4CY9MPVDuEiKW3AQT2XtjESWPzWxDFLzW2Ut/Ecu46c
	mQwH/qyucag3amf2Cpfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgUl-0000000B29b-1BQU;
	Mon, 05 Jan 2026 09:03:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgUj-0000000B27k-03s1;
	Mon, 05 Jan 2026 09:03:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A203B434E7;
	Mon,  5 Jan 2026 09:03:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2577BC2BD00;
	Mon,  5 Jan 2026 09:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767603800;
	bh=V+xA5EARlczpo3HEUeQMynrALtQ9E+tYDnkD4JHTyW8=;
	h=From:Subject:Date:To:Cc:From;
	b=U2F55jydFouj8ssrsi8tLLJro+12tJ8qOcq/0ZKUig63/+zmYLqe3HSu7vjOugnSl
	 n5TV5uVtZnLCIU3hp7EfNuuSLPosdJMF2atLJIM6S8WA/BRnnM/Ww+O9T/o4UBLvVX
	 a9tRXEPYGybck9uuTG7O2wECn8TJJHudLx9Q7vyEByoW3kBD9hfGN0/CMqDBZuexwf
	 JrB634HrDGdi6nibIuTzCmBxpwg2Vn7coozx9CRylYCf2Fa0Eu+DTFMmNZuAXGKTbM
	 xmQ3Eq1bxKhHjBdiNNp6AcvbMvSy0rQkLaH3ewU5vtda+ULEAIdCG6yq4hZC/hyFy0
	 3JRYFdvKgevRA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next 0/2] net: airoha: Init Block Ack memory region for
 MT7996 NPU offloading
Date: Mon, 05 Jan 2026 10:02:55 +0100
Message-Id: <20260105-airoha-ba-memory-region-v1-0-5b07a737c7a7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MPQqAMAxA4atIZgNt/Pcq4lA1agatpCCKeHeL4
 xu+90BgFQ7QJg8onxLE7zFsmsC4un1hlCk2kKHSWEPoRP3qcHC48eb1RuUlGizqqaE8q2xWE0R
 9KM9y/eeuf98PtGcaIWkAAAA=
X-Change-ID: 20260102-airoha-ba-memory-region-58d924371382
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_010321_081733_76659133 
X-CRM114-Status: UNSURE (   6.92  )
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

This is a preliminary series in order to enable NPU offloading for
MT7996 (Eagle) chipset.

---
Lorenzo Bianconi (2):
      dt-bindings: net: airoha: npu: Add BA memory region
      net: airoha: npu: Init BA memory region if provided via DTS

 Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml | 11 +++++++++--
 drivers/net/ethernet/airoha/airoha_npu.c                     |  8 ++++++++
 2 files changed, 17 insertions(+), 2 deletions(-)
---
base-commit: dbf8fe85a16a33d6b6bd01f2bc606fc017771465
change-id: 20260102-airoha-ba-memory-region-58d924371382

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


