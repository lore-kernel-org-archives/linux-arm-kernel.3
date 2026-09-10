Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720E8C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 10:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dj7ImCNOGYFsdY/Zf5dsBKuP9RTLXw8w8T95YWvfhUo=; b=5Aj4u80BpOIxSWprpW6CQVG6ND
	YzE0OPvQtnzFrtuhXkb82GNisFe9z17vLSlj4UqTC+5xIQ+yJ0RQIkUjfpOgDcR4lfKxho0QILcG1
	dapi701hclrSZKk3lydLjLq+k3cyCWRheMvnbjrA17ZiWkRgczOFjjEwjLAlLLq210ZJu8DuWVpuA
	0q7Ox/22jLL/W7W3GSjX4oYNz1g1sppE+F5cfWCVcdEC/yKeyuUgZpkEiPi4dZHUhU6XarbqSa4O0
	dl8SYwZcACfKC7T/1q24ij0HeN3k9K2K++xSprMONEaVA2vK5ozzJly0xU0l/zAYC/PsbufUIYCrw
	1jOyQlKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4c9V-0000000E5SG-3vuW;
	Thu, 10 Sep 2026 10:37:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4c9U-0000000E5S2-34iD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 10:37:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7982143A74;
	Thu, 10 Sep 2026 10:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8DBC1F000FF;
	Thu, 10 Sep 2026 10:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789036628;
	bh=Dj7ImCNOGYFsdY/Zf5dsBKuP9RTLXw8w8T95YWvfhUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E4iqmfLVzbN2wGZgD+sOnb7QA+EU333VqRWrkxIcMi/A6M4FLQRbUCX8cpLq8isfN
	 SbhG72mbVfewcUYN+nf7dD2KW9Ax4T+0DUAswNCsG8DV3v33JdHCnq13DVQ1bbaQ48
	 JZLMnEiULSA+xo1dspSu1YIOkzBXQeSAQcqxs2zGBMb3UX3Y6AdkOaWfGl9H7tfGfv
	 w52q4NWOlU03Vd0X5Ne+dh3G8eZ0wiF7BAeno3rmbKvzKkAcYb63IkqscPm/vu33x8
	 Vm4dmxiOcRwA9X6a4fLe3Y/F3zGU3wefi6CKnqs/MTg0n7R6nC8jS46InhVgdnoJOn
	 hwIFE3CRWrWzQ==
Date: Thu, 10 Sep 2026 11:37:01 +0100
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
Subject: Re: [PATCH net-next v3 09/10] net: atheros: fix typos in comments
Message-ID: <20260910103701.GA40544@horms.kernel.org>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
 <20260908052602.27497-10-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908052602.27497-10-hemanth.selam@gmail.com>
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

On Tue, Sep 08, 2026 at 10:56:01AM +0530, Hemanth Selam wrote:
> Fix misspellings in comments, found with scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Comments only, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>


