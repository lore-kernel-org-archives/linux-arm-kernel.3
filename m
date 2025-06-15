Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A167DC71150
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 08:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4ml8sgPpLF0KKeUn/LoITFfWypkzxkwGlJzqXXaPxog=; b=iA25i3xvdDi0gT
	pjstZmGwkOKJ062VHhWizbyEPK94ism8R/+WBow5OEfEGuTB9b4fRjUWWIfvyaVJWWxw2SNxy5L0g
	RCxsmTQJc/A6zLI7KmJVTCPYql1otc6wY7edoOXB3otFhvONmWFUftWjvcKhFVn4svqIzEVPJsCI5
	hEipXn2lyHlD7uVqXUb9esV1Rbk4L+4RW+zRTIDqwGimS7bno4FZw9N49m+oxWE0Efs2SC2puVrfQ
	G62ctlhOH3xM3KYjKI9yfVW73U8Nwpg7wFu4Br9NBld1i8INuVXS0a1BLfb4yRCfRXEM58JteZ8U0
	M6yRRVjUWYHgQO4kjf/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQitt-00000002Mbd-3mel;
	Sun, 15 Jun 2025 08:39:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQirg-00000002MV8-2lqf;
	Sun, 15 Jun 2025 08:37:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 28EB6A4F58D;
	Sun, 15 Jun 2025 08:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05ACEC4CEE3;
	Sun, 15 Jun 2025 08:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749976638;
	bh=ya0FHPPaoMwryR5s/tkb+Pmcvo+q33+OAufiSPMpG00=;
	h=From:Subject:Date:To:Cc:From;
	b=XNVoBnr0M2veZfT3I7ngWIgveBZLJzOQYaOujnjzIaos4jpnp5duh4xUibNY9PAyb
	 42+UcBAS31Ss0whhs7m8EQ0rxpS8ZRmvblDivX9FtKrEU0zhkEpqVMjvUq4C9IUAwH
	 gcDc0rnUO7EZbfjt24xEfgwgEM0BER2/ZeTHEXQsH5zkGZb5atoyaCiMGcexkA7MTj
	 ZYpjVARGTTUxknvO+YLsuggPKXaUQYRSo+fl4YNV5J9b7/eJg3AM1TvkLuE7FjpTN1
	 zK+OkaQA8Ed6M/N/WrWVwFYX3YPjQdhdSCU711pitN+ujP3QHEWKomY1fiBUD241Br
	 0ue5b9IX2ELYA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next 0/2] net: airoha: Improve hwfd buffer/descriptor
 queues setup
Date: Sun, 15 Jun 2025 10:36:17 +0200
Message-Id: <20250615-airoha-hw-num-desc-v1-0-8f88daa4abd7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAGGTmgC/x2MywqAIBAAf0X23IJKD+pXooPolntIQ+kB0r8nH
 YdhpkCmxJRhEgUSXZw5hgqqEWC9CRshu8qgpe5kr1o0nKI36G8M546OskWpRiuHam2roYZHopW
 ffzov7/sBzxMXlGQAAAA=
X-Change-ID: 20250614-airoha-hw-num-desc-019c07061c42
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_013720_767531_93069BA0 
X-CRM114-Status: UNSURE (   5.42  )
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

Compute the number of hwfd buffers/descriptors according to the reserved
memory size if provided via DTS.
Reduce the required hwfd buffers queue size for QDMA1.

---
Lorenzo Bianconi (2):
      net: airoha: Compute number of descriptors according to reserved memory size
      net: airoha: Differentiate hwfd buffer size for QDMA0 and QDMA1

 drivers/net/ethernet/airoha/airoha_eth.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)
---
base-commit: 8909f5f4ecd551c2299b28e05254b77424c8c7dc
change-id: 20250614-airoha-hw-num-desc-019c07061c42

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


