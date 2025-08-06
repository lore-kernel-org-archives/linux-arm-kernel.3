Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E0CC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 01:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=793dCkPLvCc/LQ1zS3ZrNrBwKQpA1X+iahg+16KvZgE=; b=hagdhi2/ZYKdzY5AWuE0ukw2v1
	NE4X0EDfYNpYK3Q4ihbyiCQnGJILAMperLW7/mBAaDeh+Hp0ZLxvWZpfF/a9j9KVubkqc5cle6uuw
	fQ94PeCCPCpAPhuU6YvRt6EeLZ0q7eQ+S5zVLrnLb+4Hc/SkQP4hUpVbVk+kkMo6W+2QmvQinckOr
	KLOIXhBqSi90kIV9naepHTRd6I72WHGIpKwbvJFEJJzqdc67gk622L8AcZSG7ARjmO3SapSUEzp77
	NVSaCOkcLtcsj1GtoN0pxlm8Y9TJmLHmgHYTOOEa2su2dJcqCupKM0vviwdFMx5n6Foilkr0deGMS
	rxJ3gFqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujSh3-0000000E6Yp-240d;
	Wed, 06 Aug 2025 01:11:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujScx-0000000E67Q-3C3o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 01:07:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 622D35C5E9F;
	Wed,  6 Aug 2025 01:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6213CC4CEF0;
	Wed,  6 Aug 2025 01:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754442454;
	bh=793dCkPLvCc/LQ1zS3ZrNrBwKQpA1X+iahg+16KvZgE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QuPb+2134pQ8T88W22ROE/t31GTl88ZEiSIzyRTKJVxvYvVEOIL2QkS4JiiqO3DXQ
	 5SOcTRsOEDwbKIaU3HoyiLK12Y5DzTCd65RTVhfsSF/LMhWF9Edznyv+tIaJ6mmT3I
	 d6WhrgoFEZJ4kzwGq+EwXos2M7N//bRnZMXMpU3E324FvxV9HK/zZNPOPrGCQ9aC+1
	 /lwmSpFwLkgyyU5hRV78mh5Rkz+LPOnAdnWDUPt3KYLXQTGaFT+j5FIRQxa7aTqnT6
	 dCdXUTBOboHJrKIU+nLKo0khXhvkO5ZQRDZQGaGHeE97u0k7LegOWj5v/B+v5ZlU2s
	 yF3hEgfrY8fGw==
Date: Tue, 5 Aug 2025 18:07:32 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: <namcao@linutronix.de>, <r-gunasekaran@ti.com>,
 <jacob.e.keller@intel.com>, <sdf@fomichev.me>, <john.fastabend@gmail.com>,
 <hawk@kernel.org>, <daniel@iogearbox.net>, <ast@kernel.org>,
 <pabeni@redhat.com>, <edumazet@google.com>, <davem@davemloft.net>,
 <andrew+netdev@lunn.ch>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: Re: [PATCH net v2] net: ti: icssg-prueth: Fix skb handling for
 XDP_PASS
Message-ID: <20250805180732.4e756498@kernel.org>
In-Reply-To: <20250803180216.3569139-1-m-malladi@ti.com>
References: <20250803180216.3569139-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_180735_843509_87B86AB8 
X-CRM114-Status: UNSURE (   8.21  )
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

On Sun, 3 Aug 2025 23:32:16 +0530 Meghana Malladi wrote:
> emac_rx_packet() is a common function for handling traffic
> for both xdp and non-xdp use cases. Use common logic for
> handling skb with or without xdp to prevent any incorrect
> packet processing. This patch fixes ping working with
> XDP_PASS for icssg driver.

Out of curiosity were you able to use the in-tree XDP test?

