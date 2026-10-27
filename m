Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E4D606AEFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 11:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HJRIxmrP;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D2rTnLxW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ESrymycrercx4WKj26TQ7uSZll8hEJb6wB1OeQMp6h4=; b=HJRIxmrP10zfYm
	QXnH1oEfTV9iJOWqPijioTXZTRzsAqoJ2j7Ybqw0hGogspUiVogKhQmyjVTILWOlvguaadEV7kZFP
	yYDcJifeA24cpgxpNcHVmjmNzGMKa7D4vX8dyTG+ghINnWyOkvl2GOezzvDyOAKFAHwrZI66wkphx
	w8fYu8syBGCswnGe0wDHLG9wt1spHnWJ6BKcYPR0wrW2pmX2QLuJtCdrUAroEmAL5oiykDUHhell1
	r74d4u70YCEZ/ZCTJWvqV4OWm0pXnG4wdQGBZ1cVlJ3Zfmw4A3ixaM6qVSLpuJORN4aF1muCNIyTs
	NYF+nF5A8OgD0XG9P/Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfWn-00000004V3O-0clQ;
	Tue, 27 Oct 2026 11:39:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfWl-00000004V2x-3f71
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 11:39:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B576436FA;
	Tue, 27 Oct 2026 11:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9CE1F01441;
	Tue, 27 Oct 2026 11:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793101179;
	bh=ESrymycrercx4WKj26TQ7uSZll8hEJb6wB1OeQMp6h4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=D2rTnLxWreQ1s1Y6cgPUBRVLtKP6JYx2+VP+nxQNv+ttH/zBqn6TRNVrO4BgtCVmL
	 tkg1nK8xAeznPqS1pqWXKBdCmXnVNlXseqTH6utPH5M3go51Ab8vCls9tgNQypRLPT
	 bIviSrxGui+cdC/lk9EIeY2IxjBOiictbxdSipI424d3eF6UBpy+V2XX9B6tc0lXrz
	 XTg9vRkaUYk6UdP0vFlQ+cVUv0Ay4+xGKUwMbzbCGkxiUxrXMs57YTGeadLfbaKX8W
	 KbTgJOUwIHpiVSrLU0vn4AlDNEq5PydPRKq/ewB/gg07hexkpbVxQxbebkogkvq7YB
	 G556og/lLTaog==
From: Manivannan Sadhasivam <mani@kernel.org>
To: =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Fuad Tabba <fuad.tabba@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 bcm-kernel-feedback-list@broadcom.com, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>
In-Reply-To: <20260923180703.3901185-1-fuad.tabba@linux.dev>
References: <20260923180703.3901185-1-fuad.tabba@linux.dev>
Subject: Re: [PATCH v2] PCI: iproc: Use __free(device_node) in
 iproc_pcie_msi_enable()
Message-Id: <179310116074.5889.9680127168162481618.b4-ty@b4>
Date: Tue, 27 Oct 2026 17:09:20 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=345;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=AMfRuaK4nK36sJGSTedCARE9MAMDElaKKgH32J7UJkw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq4I1wvm+ljiS61ncvUtkHNTAGJfy2y5saSepTU
 j4SfktlDWKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauCNcAAKCRBVnxHm/pHO
 9Qw/CACCDBzEYt25olPXuF1nIV7tYt36WXS35jOKneSXhrBxNZEaoCMUM5CXDWPx1H3r46uryS1
 eoVjDr7BOHqL9+d8miPMDYgRti1HfbHkQA0jLKfe8cQos4nvIdD7VNtAsb50YxNo59pgAYegLnn
 eliaQ4hh0jgJaBIVkluiHBfGnagZ+SWaMdUIijc1e9lUhtwRbj8lrKrr37BhKDbDm0dju5fouk4
 90/9hG4dWN/QA5uz4Imf94X7J/2ZN/aegkyWQ9+3bwm+9//IBe4huQcvbHXnpyOepBQOl1Q2t/g
 Qu3wsWVc+XFuB1Xyg5l1zh0IecZFFe83lujk9jJwKebC4TJ6
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 23 Sep 2026 19:07:03 +0100, Fuad Tabba wrote:
> PCI: iproc: Use __free(device_node) in iproc_pcie_msi_enable()

Applied, thanks!

[1/1] PCI: iproc: Use __free(device_node) in iproc_pcie_msi_enable()
      commit: f27468551f99d80c1f08be5194e9e520beb23908

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



