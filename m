Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29DEC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 09:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHgurkr3hfzIhUm3LgtYoYaBD5Ipt+sR4+jQYwAKKxg=; b=InQ50u1D2thASNVZwtAsOHSWgx
	NR1kDsn9Kba2r8WUBONw8PipCr8w+NiMh2ChRtPfkH/a/omP5z8xaeeRWqqZStG6QncL+WIyQ4kiB
	vtnHbHyIHQvec0jio/G5XMTQQfLRNipt9R/uqH78eII24Q/fhEvVIpN2OADbIFOa9vCu2rEfUl3mF
	k+IMBzZPkAswTrpt05tunTnYszo1wj/3I40v5pTIpzlxRxd1L2yJgeIbYAHF9thES32pwMIphorlx
	kISDuuLAIndauM1OM+bBjazeiXhgXvDbUZ/IkBZyHNsN6IVeqW3ZCKB6mT67lnnN38od5rdRufgjK
	GD9iGtUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nlL-00000009qf3-2fMx;
	Thu, 10 Apr 2025 08:59:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nU4-00000009mpI-2z2f;
	Thu, 10 Apr 2025 08:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=PHgurkr3hfzIhUm3LgtYoYaBD5Ipt+sR4+jQYwAKKxg=; b=wVDaAKIYQLbajvye4IbWs10b1p
	/C3Ez7SoN9FvjdXQ3wyMQwdQqvl0I+sukLGw675cakYQUpv/KWIAegmQSiYrbA7n1dDK1vh+RGRA6
	Qlle8/0O/SEhx3WO/v3DwVV7wg7ggwzQs99YUxN1drFtvJYjvH2fxsCExdvsImiLQE5eou/BZf4iS
	r56xWG/gi+UUDOAjoY15WK7Bf5J3YW0axV2hC37g/sspKK26lOb0uDsloxTrpTfmhMcoJw98pNOss
	s5Hc58KIstJg42996lQmlnveFW5Gil2s7Clz6ZOJnnt2jytJDT/fKI9d/e22E990+6GUZPbXEUzoy
	aVgjWJ7Q==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u2nTu-0002qP-Ux; Thu, 10 Apr 2025 10:41:55 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	hjc@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: vop2: Make overlay layer select register configuration take effect by vsync
Date: Thu, 10 Apr 2025 10:41:42 +0200
Message-ID: <174427445692.820310.6392572128244429943.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250318062024.4555-1-andyshrk@163.com>
References: <20250318062024.4555-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_014204_740334_92C85718 
X-CRM114-Status: UNSURE (   9.10  )
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


On Tue, 18 Mar 2025 14:20:17 +0800, Andy Yan wrote:
> Because the layer/window enable/disable is take effect by vsync, if the
> overlay configuration of these layers does not follow vsync and
> takes effect immediately instead, when multiple layers are dynamically
> enable/disable, inconsistent display contents may be seen on the screen.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: vop2: Make overlay layer select register configuration take effect by vsync
      commit: c5996e4ab109c8bb5541453b20647eaaf9350f41

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

