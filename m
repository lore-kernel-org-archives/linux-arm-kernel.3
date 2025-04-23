Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C1FC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 00:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1Ef4fMvCDjBHTzWgeVtIoFWfWa8h8Rtq+Wb1KlnpiU=; b=BC3znah/dYe/sZ4bwT520Mo0qH
	5NT4jeCNUqSa3yiQWsjaGOWO35011WHtYdZjBwAnnDy6BZWT3KzUvNTZ6Cc5a6mPGE05vn7+2SSjl
	IDVLm6yj7tmZM9FsL7sounBYZ4/8rWbGVt1sUcLWFWOKVE5fTu2Ukf2a9bRp0OaGbHuqaShTYXiBo
	VQbF3DoQc+DGDPzebql6qq/cfFu+bGyz8dv5xK8A9zbYg2/woVojbFS+s5UgGr0mayS75EczxaKT/
	jAg/uegaNbNUvdTG8AzYwNmety8XqaRqlI24Y5eoPmghhiI7GgldHfV/B1mhcHtMmgBbCy4PTm1qd
	C48/KSIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7OLd-00000008v1u-0tov;
	Wed, 23 Apr 2025 00:52:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7OIf-00000008ucx-1qdw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 00:49:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 221AB5C5D3F;
	Wed, 23 Apr 2025 00:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6FAEC4CEE9;
	Wed, 23 Apr 2025 00:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745369355;
	bh=YPISFp/jKbPQuxE02XZsEPc0QP7WqJn1oGY0PZr5WR4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vNVaW+PdmSQpmGC+UPEct4CiRUJRZhVszLCUcOQwLX/ExdnWiKsK1eklLNoUUUZtI
	 yLLH2DD90E3twxY/8UxhpLPUwcMdOlZPcQCQh49zR5Jz64+cx9s3ctAhrgYy0pt3BV
	 T7xJ7Pk6SpW2jeOnl3p0fn4J9ylmo0Y+Ygv+Ou0JvMOxZRsCTyzr4Ywzm8OnTNpANq
	 QPx6xanQqawJCDlixsdHHeM12Nn2Smj5IDO/li1ZxnipHn0RkHBlnPFEV82NdL8ChK
	 BaiL0dmIAjbOuFcDF5lXFtwKD2NZ9DlW019Fcy1Ok7yI5TYOpHk7sxxcTqnhWr+pFI
	 BFb/aWngh97bw==
Date: Tue, 22 Apr 2025 17:49:14 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Sunil Goutham <sgoutham@marvell.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Geetha
 sowjanya <gakula@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>,
 hariprasad <hkelam@marvell.com>, Bharat Bhushan <bbhushan2@marvell.com>,
 Taras Chornyi <taras.chornyi@plvision.eu>, Daniele Venzano
 <venza@brownhat.org>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Helge Deller
 <deller@gmx.de>, Ingo Molnar <mingo@kernel.org>, Simon Horman
 <horms@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Sabrina Dubroca
 <sd@queasysnail.net>, Jacob Keller <jacob.e.keller@intel.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: Re: [PATCH 2/8] net: octeontx2: Use pure PCI devres API
Message-ID: <20250422174914.43329f7f@kernel.org>
In-Reply-To: <20250416164407.127261-4-phasta@kernel.org>
References: <20250416164407.127261-2-phasta@kernel.org>
	<20250416164407.127261-4-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_174917_546995_3128E1D3 
X-CRM114-Status: UNSURE (   8.00  )
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

On Wed, 16 Apr 2025 18:44:02 +0200 Philipp Stanner wrote:
>  err_release_regions:
>  	pci_set_drvdata(pdev, NULL);
> -	pci_release_regions(pdev);

This error path should be renamed. Could you also apply your conversion
to drivers/net/ethernet/marvell/octeontx2/af/ ?
-- 
pw-bot: cr

