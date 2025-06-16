Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FDCC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 15:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uPBAGZy6R1PjnTGdxsiEYdDy+NUG1t2EFZNMiKI6egA=; b=UNpm1vajCAz0GA
	fVJA+v7w3dkLy3PWSLQV88fzWD70anoCG+slbcCVZhid9UMDkcL8UbegH9G8BGQzt2FgvkXPBwf7L
	Rh61jF4VTOsh2WMwd2JZQjU83brBOxkWv1RL5dP/n7FGycCK/hcvXtRqA0uA6FE1BVpkDRtIcmk5A
	RMaH43IGlrun7vAO4cNPem2vPPZOvtb0uNNuSYH4/m2hcPXmQBuPavfjM85oQPTDbYfawww3S+IVW
	PXnqiIh7Ur4+x49Y/ExiIvr5qwAhhlE2OK3s8y9nc1Yre3iJfofiz6NRpJP7GoxU1gr1tiHwN0kz2
	qIX6xV/yxFvu1OCVuZPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBjA-00000004pj5-0Vis;
	Mon, 16 Jun 2025 15:26:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9fE-00000004VHf-305b
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Jun 2025 13:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=uPBAGZy6R1PjnTGdxsiEYdDy+NUG1t2EFZNMiKI6egA=; b=Axf32rO/oHfD4zkeEkzeZlg0kp
	WO95fx01oI/zhbApHlQY+Bwwg6B1eczvMmn6yknMT8dqkJeFNEmm3wOOZfQhAbT5TRDCWP6x6Str8
	xiDXC37aeLK99a/Jvz1tX66AyYjgYJYyfPWUGyS7OcbEL81foKc+lV9BvhDr/e9nwHuoH9EA/CvIG
	tNqcjs6/HGBpyExK2IE/bGsTOCd/SALu4oJjgYY0mdWL4ctOJ6hDHC5Oo7ggyudFibro9/TI7YRXr
	TCrsWCqayjqYh1tG+aonHCypd3nCdsxhjuTl/WSt4l7rq341YgFs09qVZlDRKa78r4CgJP2QrpRNI
	h8RUAs7g==;
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9fB-00000003aQD-3JHm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 13:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750079637;
	bh=uPBAGZy6R1PjnTGdxsiEYdDy+NUG1t2EFZNMiKI6egA=;
	h=From:Subject:Date:To:Cc;
	b=I6KwpY03w88PFgiWEf2PmautpWVe9dZGZTdWKrhOf0aHsSlZTZAcWf4qW3uPN/25n
	 pPIcnBuY49xhsixkLINKjlxQRU9emTcGcTKB+ORxw+4v7yICvZgcqwmXUeff9CrJ/o
	 HBC14x4EOgZKGbqKbDUcAEcL2Ia5l9A+bfaUlPeEjQPoEf7bH0a4ooFEU1UzH67QBF
	 1zAyoTG5MwgyQaXtziDa6DJcJmFigh+iatbuzLwU4fZjE6wIM31gdtcMS8oqa9ZCTG
	 sDGz57TESvcZBSMAGjGi6L6V8JVTCFO+kJKamaFVwDQpFU/XfbcP9zqCttLzLJWzB5
	 CUNdX8WNfOYLQ==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 596AA685DD;
	Mon, 16 Jun 2025 21:13:55 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v2 00/10] soc: aspeed: lpc-snoop: Miscellaneous fixes
Date: Mon, 16 Jun 2025 22:43:37 +0930
Message-Id: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIEYUGgC/3WNyw6CMBREf4V07SV9ACGu/A/Domkv0kTb2luIh
 vDvVjRx5fLMZOasjDA5JHasVpZwceSCLyAPFTOT9hcEZwszyWXLGy5AU0S0cI0GyIcQYXQPJMD
 Wyr5XViutWBnHhHtRtufhwwnvc/nPv3BylEN67vJFvNOvR/z1LAI4dM3YSolK2248mWDRBE85z
 SbXJtxqPbNh27YXhBDrSNwAAAA=
X-Change-ID: 20250401-aspeed-lpc-snoop-fixes-e5d2883da3a3
To: linux-aspeed@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Henry Martin <bsdhenrymartin@gmail.com>, 
 Jean Delvare <jdelvare@suse.de>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Andrew Geissler <geissonator@yahoo.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>, 
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_141414_595031_1E9454C3 
X-CRM114-Status: UNSURE (   5.82  )
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

Henry's bug[1] and fix[2] prompted some further inspection by
Jean.

This series provides fixes for the remaining issues Jean identified, as
well as reworking the channel paths to reduce cleanup required in error
paths. It is based on v6.16-rc1.

Lightly tested under qemu and on an AST2600 EVB. Further testing on
platforms designed around the snoop device appreciated.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=219934
[2]: https://lore.kernel.org/all/20250401074647.21300-1-bsdhenrymartin@gmail.com/

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
Changes in v2:
- Address comments on v1 from Jean
- Implement channel indexing using enums to avoid unnecessary tests
- Switch to devm_clk_get_enabled()
- Use dev_err_probe() where possible
- Link to v1: https://patch.msgid.link/20250411-aspeed-lpc-snoop-fixes-v1-0-64f522e3ad6f@codeconstruct.com.au

---
Andrew Jeffery (10):
      soc: aspeed: lpc-snoop: Cleanup resources in stack-order
      soc: aspeed: lpc-snoop: Don't disable channels that aren't enabled
      soc: aspeed: lpc-snoop: Ensure model_data is valid
      soc: aspeed: lpc-snoop: Constrain parameters in channel paths
      soc: aspeed: lpc-snoop: Rename 'channel' to 'index' in channel paths
      soc: aspeed: lpc-snoop: Rearrange channel paths
      soc: aspeed: lpc-snoop: Switch to devm_clk_get_enabled()
      soc: aspeed: lpc-snoop: Use dev_err_probe() where possible
      soc: aspeed: lpc-snoop: Consolidate channel initialisation
      soc: aspeed: lpc-snoop: Lift channel config to const structs

 drivers/soc/aspeed/aspeed-lpc-snoop.c | 224 +++++++++++++++++-----------------
 1 file changed, 110 insertions(+), 114 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250401-aspeed-lpc-snoop-fixes-e5d2883da3a3

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


