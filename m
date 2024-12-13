Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37698E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 11:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWArevjU0mU2CCv7uZjGDXiUHM6NiZagD8tQ0bApQCw=; b=oCZR/QOKV4iTVGLLo4PBo0n3Ps
	Kdo2CKq+rGBk+VC77icdZ5C8wel5770AKZBPM3gJGCT3dPu+UynxPRBj1tS6Oqyf8EZK9EzaBXSMb
	2et48sNcxJVYMRHZ14tEGMAY6lytMU5vqm8vJKg7Ml/qQIbOQ4AgzgKE6C/bATlH45fTyHqQl1EXm
	gBl0xyHXQINBXasJo3lTOi+5EMo5aBA7kaClz+MirM6l3unrGUtCDWlbt+C1nrU06qDggJUASbd7m
	YW2gfHl1uwWHtNZCZpfbpQT5mxJrOsZFYGu4SxrP8xUuZjVC3CedEings0rA9OIgAbI2BIYh38ZTC
	Ka6D5pOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3s0-00000003Z48-14AN;
	Fri, 13 Dec 2024 11:30:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3qV-00000003Ymd-393B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 11:28:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 868B55C6AAA;
	Fri, 13 Dec 2024 11:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BCAC4CED0;
	Fri, 13 Dec 2024 11:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734089314;
	bh=eN8rZXOXDHaELFjR0t0A2r2ABEAI7iFbmY+N5Uhtm3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gm3kpjOJ+AcMtgcLn/y89bm8fvRCGXMc4ZpZ0oT9/JvsXICssqe8EWSzTcN2E6j2W
	 xdW9PP5xrWaqy3VQlLJ2AnEiuCU8qfs1IDliVkEFAKt3r6h40sJbxmJZOBdwZOLwhn
	 UYhZDPtqq2ge+25gwpcL0j62PfiDgNxP6d1V5BOSTvgGZtwqtyqCkghJtZ2OKnAumg
	 3RFTjE9bSPqNdRZwQtDq3wzHEtOMNkkk8eWO+ZcmrvyfGzOP2Vhcjy9WuMJAzjJzZr
	 CgQLEcsv2fLgQaCnsByXqQaYpeeVotb5qzXZs31Ee/KdYEi3K4eX3QP0s25N6f40l+
	 WcM6Nm4Yt+hHQ==
Date: Fri, 13 Dec 2024 11:28:29 +0000
From: Simon Horman <horms@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
Subject: Re: [PATCH net-next v1] net: stmmac: Drop redundant dwxgmac_tc_ops
 variable
Message-ID: <20241213112829.GN2110@kernel.org>
References: <20241212033325.282817-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212033325.282817-1-0x1207@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_032835_831854_F1FA4094 
X-CRM114-Status: UNSURE (   6.75  )
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

On Thu, Dec 12, 2024 at 11:33:25AM +0800, Furong Xu wrote:
> dwmac510_tc_ops and dwxgmac_tc_ops are completely identical,
> keep dwmac510_tc_ops to provide better backward compatibility.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>


