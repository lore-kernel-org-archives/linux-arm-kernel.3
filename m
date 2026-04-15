Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E48F433C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 21:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVNSdN/IGQFU/FzEa+qLZhjNd/7KMiuKKWMMzHsAtAk=; b=lIMH0T+6Z8O2aA/TBCAOv8my5b
	HotiPtRMLU5Qm3vESC61JU7s9A5LQuzOeUH4b6eV7ZFBdS6CV6ki13ZxRyh6Y4/ccowK20ih9SYsl
	Vrh3ScGhr9bH1cAoePbvfsQ9JU3691Rr0UojOhkz2M1Q6GaOqI3bFzQ6cF1kEvCoC1wKJ6CsS1QHr
	u6qR4neyZUFrDu3Nc1Nf52zpwDNRp68FuwGmbu8eEQeNs0Gy/zGcb8U9wXW70pqzCTHXAZqs3ve+M
	ijRh5CWlVmwdhoAPQR+o3bQOvg+2UYOE4q9Kgm8EwMtOI5vti5/y+0LitgrPdxLSkBTZDRY6rgbZp
	NViK7LJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD83C-00000001dwR-0xKP;
	Wed, 15 Apr 2026 21:45:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD839-00000001dwH-2lIn;
	Wed, 15 Apr 2026 21:45:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 63ABC60120;
	Wed, 15 Apr 2026 21:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFCBFC19424;
	Wed, 15 Apr 2026 21:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776289530;
	bh=TloyhXzq1/puv4FlbKe8Oz8xg8FNU3IYMfZDWHPrV/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PKJesj/YNj66howsILU57gfaa+CNkRtkBgDHXdB1Z/vtuf9mw7D1Px3axPT6PwRq6
	 D2YjuY0Xw0o2cpF9meweSpZE+KUYX/nWHk17SCgaCPVAKuLomhhVSMSIAtypAS72I5
	 ZRWLfJqkE5ULI+XVpb+19BezYq9OE2owfQpVtRPvl+kvMOqK4WjA6KhUyj8ydwqIeW
	 J5teVddQ0Ea960NdadH0OUHiAkj4XSTI/BXbG/YVvjn7l7D7SNUjHUHrNrd4f+C9ZP
	 s7YuZb7aA8huA+Z17TIVwB7HOZURSTr9B42fQDffnhjPdIgGHSeDRyOIHpXe9BDuWP
	 8mDOjTi02pg+Q==
Date: Wed, 15 Apr 2026 23:45:27 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: adlavinitha reddy <adlavinitha.reddy@mediatek.com>
Cc: Qii Wang <qii.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v1 1/1] i2c: mediatek: add bus regulator control for
 power saving
Message-ID: <aeAGeh-tXDLL-Kr_@zenone.zhora.eu>
References: <20260415125833.2579133-1-adlavinitha.reddy@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415125833.2579133-1-adlavinitha.reddy@mediatek.com>
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

> Thank you for your guidance on formatting and submission rules. I will study
> the documentation carefully and ensure I properly send patches in the future.
> 
> Regarding the multiple submissions, I sincerely apologize for the confusion.
> As an intern here, I encountered some unexpected internal email permission
> issues when trying to send the patch. In an attempt to double-check whether
> the email successfully went through the server, I mistakenly re-sent it a
> couple of times. I will be much more careful next time.

No worries Adlavinitha your patch got in anyway.

Have fun in the kernel community :-)

Andi

