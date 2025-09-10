Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE27CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 01:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxlh3AJ76sbpWmAnYRTyLTELgkVNAiDa1hROV3mBUWc=; b=kG1T2uZuFEX47126MMlo+Dxhd6
	VvEHPgxUyd7IH7TcGVhJlOugSY0VBnfX2b6+4uNw2XW+s5cCiIr7WmGaGp/r+yZTG7nZddob39K6e
	OUfPR3aLRQ06veoGlVtHD57TJvUrS8HFm2727eC6wRwZtD85rKG9GEllCDeefi2ywNjuO5kx2f/NZ
	yX/HXBpHQ6mKZnM4MGgCKc3mznpHRoGHQSWfYJUggxVDrWQREZthgeBPnX2R5qQX98UVOm++9UOpx
	ia4QMiwrSers9zU86atG0gcsByMx5XLayghH9/jXtn4b10snk19qW74oehz7fwbiX6e+JAO/6H11o
	GtoGdjuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw9RA-0000000BLcv-3cs0;
	Wed, 10 Sep 2025 01:15:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw9R9-0000000BLcO-3tqu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 01:15:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C0FAB60230;
	Wed, 10 Sep 2025 01:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6C6C4CEF4;
	Wed, 10 Sep 2025 01:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757466949;
	bh=cxlh3AJ76sbpWmAnYRTyLTELgkVNAiDa1hROV3mBUWc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=u4/lJImwhptY4sOT6NZoJ7bqQ4r1Ni8t3xFkLQ8PRTKy4+1dlGVEaou9KHTDVbIDj
	 F8SjFUNFDgYpOhAg9e1moGt/eKSoAbaDo/GeiBXPx3EWyDTcb7GZ3jMfEkn60WMQMB
	 AGW8hDkoqyVVi2S0vBemcUkZSEidafBQibN1ffg4XI+UlZkq9Smm1J9Ce9MQHlGwOj
	 lMPEaF/3TEOTuKpIsqLjzNtyujkP3zW5AK/w9p9KhYE+7f3fJQDxtaUEaJVUTtYoc3
	 cTqbvSdYrv2h5bunigBwd4MZbcu7uGk5qUy/qVF1F6+F5uRn84h1zYPcQ0RB0dWFCz
	 kr1Y41UEIIk+w==
Date: Tue, 9 Sep 2025 18:15:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?5p2O5YWL5pav?= <conleylee@foxmail.com>
Cc: vkoul@kernel.org, davem@davemloft.net, wens@csie.org,
 mripard@kernel.org, netdev@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: ethernet: sun4i-emac: free dma descriptor
Message-ID: <20250909181547.0782840f@kernel.org>
In-Reply-To: <tencent_0DDFF70B944AC1B7CE9AC20A22D8DA3C4609@qq.com>
References: <20250904072446.5563130d@kernel.org>
	<tencent_D434891410B0717BB0BDCB1434969E6EB50A@qq.com>
	<20250908132615.6a2507ed@kernel.org>
	<tencent_0DDFF70B944AC1B7CE9AC20A22D8DA3C4609@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 9 Sep 2025 14:36:42 +0800 =E6=9D=8E=E5=85=8B=E6=96=AF wrote:
> Thank you for the suggestion. I've reviewed the documentation, and
> setting the reuse flag while reusing descriptors might be a good
> optimization. I'll make the changes and run some tests. If everything
> works well, I'll submit a new patch.

To be clear if you're saying the driver is buggy and can crash right
now we need to fix it first and then optimize it later, as separate
commits. So that LTS kernels can backport the fix.

The questions I'm asking are because I don't understand whether the
upstream kernel is buggy and how exactly..

