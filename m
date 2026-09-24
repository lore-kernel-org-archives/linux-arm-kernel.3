Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D4BC98304
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 00:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+GWLIwFpPKVB13qnLI5Bw0feO/05wfn2yVZo+nfxu0=; b=fLDOYRVxubN/QH2RZKjxa0X9RP
	dZnsyBq1Zyr9732W/qIzbSTpWRGpPCEK0s4D5v0ez4we1YBGDiGmxLVrHs8QDumWhqOOSaEtOhol1
	zKS9K1RHatikZxD1MW3awdakp0o0GKqDgih+wfJQhC3SK2bRpuOTOUU6LeJ2k2nh6mgZJI5d+m+G2
	HBrpcXfbliexvF7Ia75MP80NaA6kr9U7kFTGwxa/rvmfbvAQx8QHx8/NRo63/4nWlid30zMtZZFGo
	TNe1YJNjJJyYoVAOqtWapGJFMWPxPoWyCojMLdj6D8u3rPb0ImA2gAH4R9yZ/RH331Kad1zUTXP5O
	gj3JiUug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9XDG-00000009kUm-1Dyt;
	Thu, 24 Sep 2026 00:21:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9XDD-00000009kUY-3vIf;
	Thu, 24 Sep 2026 00:21:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E88943F94;
	Thu, 24 Sep 2026 00:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6D51F00893;
	Thu, 24 Sep 2026 00:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790209279;
	bh=m+GWLIwFpPKVB13qnLI5Bw0feO/05wfn2yVZo+nfxu0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jzQSwC+wFeBtS3T3yLqWeaGdao287ksBdEwlubwx+JX5xLwQLvUNZ+EawYWmxUD/4
	 JCcKYmkiwPbIa3FOtjrOz2R5CUcohmmLZm+DWVynYrMzbY8uimDb8mvqGV/QVGyq9h
	 VjAZEcj2bFnzbkp8VGW/DQqAzI/9sVwQFNt6lzMzyUwQRCsIdtF2CmBOiXtzFy8C/4
	 J01wkM60/5ReUW5kEWssq2IHUpnzyuwHfQQ59DiwQHPOXPiSuRzbFLzpJgDf7xRtk8
	 qEJsmypvEI7V8fZxr4jx7Ey/Iy124DamTXLiPtz8nwUbAsG6/E2XyiJ1iPdGjUphpd
	 xB9qG+32pzRoQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Yue Hu <huyue2@coolpad.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sandeep Dhavale <dhavale@google.com>,
	Will Shiu <will.shiu@mediatek.com>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH 6.1.y] erofs: Fix detection of atomic context
Date: Wed, 23 Sep 2026 20:21:00 -0400
Message-ID: <2026-09-23-daily-reply-0011-re-erofs-atomic-context-detection-6-1@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922200448.27724-1-artem@trailofbits.com>
References: <20260922200448.27724-1-artem@trailofbits.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

> [ Backport to 6.1.y: the source change is unchanged; only its location
>   in z_erofs_decompress_kickoff() differs. ]

Queued for 6.1, thanks.

-- 
Thanks,
Sasha

