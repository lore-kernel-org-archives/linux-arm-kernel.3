Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9BDC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 16:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sr7asB0ccZaz5S0P65JgVRXr504e+Wb6poeCHlmiVlw=; b=K8rdI3Nf/UzzgqpjLEZd5TSu8s
	5g/Bk5nAtuI51yl4IfSeIZb5o8hKX4RqlWxXHOabDIv9g62x/Eg8ZlyHV9DNOf4qVmGA0i+USunOf
	XkclN6f0SANGzxytmnwdo+q25Rp2wbS20m6YFj59zGiBSvjCzKVWVbwON7EahKysFxDZoZb6uuuf/
	PgUc8vcuVj/h9oTk+jk+/sYYhgnH9XpENbqC0gCgX1U8/8gjY8fpeJslxO2reZH8QnydQEiy0t2TE
	8bDui08RRSVPOxNTMhMdWQhBlp2SXVDJ2+mBEVcO50NkyhXuIVYrHrW8cYqm956ze6iIVoNwbzkvD
	9+0NTAkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEpA-0000000FirR-03LB;
	Wed, 14 May 2025 16:19:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDd3-0000000FV2F-3TqZ;
	Wed, 14 May 2025 15:02:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 012D461126;
	Wed, 14 May 2025 15:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A9DCC4CEE3;
	Wed, 14 May 2025 15:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747234960;
	bh=D5QrjYtZqdxl9aDAD4Mt0N5C+A1l4Okat5ZD8j05CX8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iYkEz35ghEPY/E/ZEsQiPGJVJ70ATHHNVAVhBU4YQd4KlA0o7ljoi31EUooIirf4l
	 L5QMIjyZqYu4M7IdQcxyO0LFT8tEGScl/+NdqWCVLF5DWwm9//jGp8YgTqhD2iul0L
	 rZ2X+hio3TR93rTlo0V5tMxEYQlqyv++E01kyLMz1EVBeMahtJHttcauIEUIjlJ7Ok
	 hT7leKp/L1ehnLcOJjlwBwkK2bR6fglZuh4Om/zoppilPOeL5qWNS6nN1hEiKZEVv+
	 IXLZZN7TLUfIaKswbtSJq6vVxiA+vQubPX5Fbamt9YnoYbzcwjvlZSpzzNdo5yQ+Cy
	 1yBGTaWr73+4g==
From: Vinod Koul <vkoul@kernel.org>
To: sean.wang@mediatek.com, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, 
 Qiu-ji Chen <chenqiuji666@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 baijiaju1990@gmail.com, stable@vger.kernel.org
In-Reply-To: <20250508073634.3719-1-chenqiuji666@gmail.com>
References: <20250508073634.3719-1-chenqiuji666@gmail.com>
Subject: Re: [PATCH v2] dmaengine: mediatek: Fix a possible deadlock error
 in mtk_cqdma_tx_status()
Message-Id: <174723495814.115648.10076437402947235700.b4-ty@kernel.org>
Date: Wed, 14 May 2025 16:02:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Thu, 08 May 2025 15:36:33 +0800, Qiu-ji Chen wrote:
> Fix a potential deadlock bug. Observe that in the mtk-cqdma.c
> file, functions like mtk_cqdma_issue_pending() and
> mtk_cqdma_free_active_desc() properly acquire the pc lock before the vc
> lock when handling pc and vc fields. However, mtk_cqdma_tx_status()
> violates this order by first acquiring the vc lock before invoking
> mtk_cqdma_find_active_desc(), which subsequently takes the pc lock. This
> reversed locking sequence (vc → pc) contradicts the established
> pc → vc order and creates deadlock risks.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: mediatek: Fix a possible deadlock error in mtk_cqdma_tx_status()
      commit: 157ae5ffd76a2857ccb4b7ce40bc5a344ca00395

Best regards,
-- 
~Vinod



