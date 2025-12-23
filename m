Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58488E6F093
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 14:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXk1VOuoW7BEUukhlZyJ3NuW/oY22UfKwCnOl7TbnQw=; b=YZ/Bo0W6onUe0TAC98YZrLKi5x
	91VNsQYmOX5g2m7Np0toxkVM/PdngewMnk+VYzs0FjV36HQ3Kc55XzI/7I6YEjHBaA76REni5FYC+
	xG+CHDfwLeSweLlTOSwDW0saNfotYLFMlCILz+JdCQ8mbtmsTS9oPqnpxkShw2PVEBIY8ZWMP/fDL
	wku3HaypDrVnQpC9Wn/g3nSmATO7oTcuzW140T1Z7v8njWJwqZE1IEAsIpcLxcbyePw+U/GNEW70a
	8QkVlTXuZvAYY2NGKx2D0AMVHfVm/c/8VpbvqH2B5UdMjj24KhP7xoHPvKOEad3uwc0/CGumNZa1a
	lURoYwFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY2wQ-0000000FZPK-3hq5;
	Tue, 23 Dec 2025 14:00:46 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY2wM-0000000FZOj-3gKa;
	Tue, 23 Dec 2025 14:00:44 +0000
Received: from localhost.localdomain (unknown [116.25.94.210])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2e4b91070;
	Tue, 23 Dec 2025 22:00:25 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: bmork@telenor.net
Cc: amadeus@jmu.edu.cn,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	shayne.chen@mediatek.com
Subject: Re: [PATCH 1/1] wifi: mt76: mt7996: fix mixed FEM check of mt7996 chipset
Date: Tue, 23 Dec 2025 22:00:16 +0800
Message-Id: <20251223140016.235771-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <87fr96tp7w.fsf@miraculix.mork.no>
References: <87fr96tp7w.fsf@miraculix.mork.no>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b4b82da7a03a2kunm837becb939d506
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTh8YVhkdGE9LSBoYTk9LSVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSUpLWVdZFhoPEhUdFFlBWU9LSFVKS0hLSkxLVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_060043_124920_8E87A0F1 
X-CRM114-Status: UNSURE (   6.25  )
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

Hi,

> The problem is that the patch breaks the other device variant, which
> used to work before.  If we assume the eeprom data from Zyxel is
> correct, then this variant is iFEM.

Do you have the specific model name and what the RF chips are?
The eeprom seems to be fine.

Thanks,
Chukun

