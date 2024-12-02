Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1924DD7833D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 17:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQCZQFm/Hy1MHwkX5jLkA0tNVkhJURg3vANRXDWaSHc=; b=1QCM77mqN/+tQ6hfRcyPfCQOqB
	yVPcP5veDKVbP29rl0FPBHw7EMgIS++nLk0dLMrCagQDy13tOzMivrnMSxxDDWpWPxX33fT54swb1
	Bm6OtUUarZ9m5od9bH6DtdYFQL+hZqBFafigj5FO94z2qG+xyJvPT0BJM/GyCoTHSQkMAPwCOTavP
	LwJYf57lxgahcDx89mLAXFsmeqXXZ36S0Sic+wnxZJZe9IhkOpKZ+/W0FRxQgmnZ67xo4Hz6aF4Vc
	0ej0kY7ZkmSvtFqg2i++ybg4kRoKQmX9jP/7986kwwqTiXhZKSQAVQ/PE04B/iuL3AFg6Bt90ZQSj
	NDJAWOkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIANF-000000072w3-0Znn;
	Mon, 02 Dec 2024 17:38:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAGW-000000071Mm-0T2t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 17:31:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F32465C4E46;
	Mon,  2 Dec 2024 17:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7305C4CED1;
	Mon,  2 Dec 2024 17:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733160678;
	bh=L/oZvplMWyjYBTTB3dGyV8dscK2uL6BBwnEFQQl+ZXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YpGSM3Xra2ozAuzs8ny8KKPd0JrUMqMNXJqLfrCrrsb/HxMW2NyNUSk+4SMzaxM4A
	 Q5CcAigbgxl/lATHtWVlqHv7ZYzfaXX6efhUeZhNIdlzUq3Usp6DdkZt0B7z6iTpHK
	 xvaU7TAWQhDZ1p+I+YFU8P0dn1ceFfjCMvaN7WCKAqDXN7id/zbQ/yGBn+LYCTl70K
	 l6t4w56FSE/lyXgREkAlYwdNl2TlrmO/OevmUjL4k3X/AvTryYj6Skvb6RQQ3Rn0ID
	 WS33NFReBiCnkrDXq0dLiksoyJT+fwLxlIT0nmBjAVTsNTb/ilSORU9V9QSa+j6o8M
	 B8o+LPQxQQDWw==
From: Vinod Koul <vkoul@kernel.org>
To: Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>, 
 Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241107114656.17611-1-colin.i.king@gmail.com>
References: <20241107114656.17611-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] dmaengine: xilinx: xdma: remove redundant check
 on ret
Message-Id: <173316067527.538095.8720061974027462596.b4-ty@kernel.org>
Date: Mon, 02 Dec 2024 23:01:15 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_093120_197448_DAF29BDB 
X-CRM114-Status: UNSURE (   6.43  )
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


On Thu, 07 Nov 2024 11:46:56 +0000, Colin Ian King wrote:
> The variable ret is being checked for an error and returning ret
> and the following statement returns ret too. The if check is
> redundant, and remove it. Just return the value returned from
> the call to regmap_write.
> 
> 

Applied, thanks!

[1/1] dmaengine: xilinx: xdma: remove redundant check on ret
      commit: 0f31c0912286f84b34b15e39b286db8f4765ced8

Best regards,
-- 
~Vinod



