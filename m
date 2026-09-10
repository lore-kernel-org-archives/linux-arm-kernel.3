Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44A6C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 10:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qtd5XclNles4vGCETAsVKWoTXXeqn/t7wuBwecKgM5s=; b=5EYKP9TtGdf5y/CNztOPHoFNaF
	oEn170KL28MEcOlnTI7gqfIoTfoq0G/A/MDjEF//dsq0AoYDlwrSUUffoZ1DVEMz7Q5jUXFglNhYw
	/0TyLnuKEQukPEk5SEoDZVSJFdMDNeoHNP5FHQiavBlPuJ/I1BEvSK0XYMmDXl4X2OkoP2eQyHShW
	KuxGmjrCNql+HRzbBnmsJStQOnFrjqjU0okAkrXibZ8uR4KFdTe/r14RHqrz/K/p7zDWHBbSlr+an
	PRSg2B1YkuaklVRiF4EN0I40n/U0b88Z4USyy7o7XcNWI+j1jrkNwsPOBLbi9UcUpDajqzpN01kDE
	inLPA7zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4c62-0000000E4vU-2AFb;
	Thu, 10 Sep 2026 10:33:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4c61-0000000E4vD-09TT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 10:33:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E53340570;
	Thu, 10 Sep 2026 10:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961A51F000FF;
	Thu, 10 Sep 2026 10:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789036412;
	bh=Qtd5XclNles4vGCETAsVKWoTXXeqn/t7wuBwecKgM5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Swo3Ty6MgIO56Mj42fDZBBdAuN2xIy2Hv0Z4uLWKYoMsA2NKyxDMeA0LQdTiU4UC2
	 AT5xQS+1baPV36U7PuSVWnVRJypR+OBJ4J/HK8cv3lPE0t4Iuo9oiD2+Eqy8Qwyi3W
	 3PBY+aN788jQE4qE7XUsbYB5lD7hUJopUADY+WFkSMESCjQrzoQRtkJbR+da8VRdfL
	 yqWW4KtqegN6DbUR0mgG9wuMv70ilSU51DQJoTbwns6+4dj8XxZiQxJ9XTFcfeTEXM
	 Cf/aXFebhNiVLGcwMD0H6XwMW6EWgouzRvNHPr8mf6BRfsqHkUtQ+2KQmTjpytks4+
	 tyyCd5aH4FsJA==
Date: Thu, 10 Sep 2026 11:33:25 +0100
From: Simon Horman <horms@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Snook <chris.snook@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	GR-Linux-NIC-Dev@marvell.com, Geetha sowjanya <gakula@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>, Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Manish Chopra <manishc@marvell.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Rahul Verma <rahulv@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Russell King <linux@armlinux.org.uk>,
	Shahed Shaikh <shshaikh@marvell.com>, Shuah Khan <shuah@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next v3 06/10] net: fddi: fix typos in comments
Message-ID: <20260910103325.GY40544@horms.kernel.org>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
 <20260908052602.27497-7-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908052602.27497-7-hemanth.selam@gmail.com>
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

On Tue, Sep 08, 2026 at 10:55:58AM +0530, Hemanth Selam wrote:
> Fix misspellings in comments, found with scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Comments only, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>


