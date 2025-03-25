Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CB8C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 17:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNJphZe+cGKq8bysr3MoIDj3XnpYCpJWxnnIqHtuOKg=; b=iVod893Exx0YLgxbcIloYaKbtU
	+V/ZrASK7CaOwbeBz4SD1XuAMFLxRd7Tvd2E4w0hb2yrO0TXwRtmxoik4dgJzrhnao/AOoFCcwi3z
	17T53ex/vbB962sUO61LxLo+65dB34Z4ulFLog1+qGm3uG64uuQRX7xRWC3bxq2CybrMPfKxiy9oX
	FO5V5zmmb6QYOH/LHW9nZVmVPMhDVYwtUAv5RKgwtFrNvu2jG/r3pvznL9wNql6AFPf+7khcHgP3G
	NVJsN1yy4dorJyG6h3YSL5F19I3je1pC87SzDJdfKYj2p4KPddBs14K74vGdF9NxjsSKxOR2NeS6g
	TD1G1ekw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx8Mb-00000006eIw-1QqM;
	Tue, 25 Mar 2025 17:46:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx8Ks-00000006e7U-0ZWC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 17:45:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AB7C43BB0;
	Tue, 25 Mar 2025 17:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE10C4CEE4;
	Tue, 25 Mar 2025 17:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742924709;
	bh=q0lIi5oDrnHfx718FGdRuP2hOnpXoXos3x22buNIZA0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Gwb/dM3QNVWGLwB1ZwIkuXjJgzv0s+l+0Mc4x1JO4DqH+Yy70Fn/VH9If2cAcOGB6
	 VnskFoo35tf/fheRfK/3tfHjo41x2vZi+J9l2J8/x4pfVDOeAg8ooCwCPNfbKwysHP
	 9EbIQsUDv5eRBpxioFLAFzOTDAbAoDkpYj6rLtHupQvmSFxGEOnWIiorgf1J2bxygR
	 YOhw63YxksWO0s2lraBp77z9fFFd9U4M2QMuX3x6ReLeR1DZt+CuQe0Hp56t9lOEgs
	 R+cZ1aPFCIQ7f2ounOrCIn8Bs0thcGfLRl9mNngAMJ9YxmMha01mqKiRLxAvqJPVLw
	 RLMytnsr4b5dA==
Date: Tue, 25 Mar 2025 10:44:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: <pabeni@redhat.com>, <edumazet@google.com>, <davem@davemloft.net>,
 <andrew+netdev@lunn.ch>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <kory.maincent@bootlin.com>,
 <dan.carpenter@linaro.org>, <javier.carrasco.cruz@gmail.com>,
 <diogo.ivo@siemens.com>, <jacob.e.keller@intel.com>, <horms@kernel.org>,
 <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
 <ast@kernel.org>, <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: Re: [PATCH net-next v2 0/3] Bug fixes from XDP and perout series
Message-ID: <20250325104458.3363fb5d@kernel.org>
In-Reply-To: <20250321081313.37112-1-m-malladi@ti.com>
References: <20250321081313.37112-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_104510_196825_F7536764 
X-CRM114-Status: UNSURE (   8.17  )
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

On Fri, 21 Mar 2025 13:43:10 +0530 Meghana Malladi wrote:
> This patch series consists of bug fixes from the features which recently
> got merged into net-next, and haven't been merged to net tree yet.
> 
> Patch 2/3 and 3/3 are bug fixes reported by Dan Carpenter
> <dan.carpenter@linaro.org> using Smatch static checker.

Could you perhaps add the customary

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>

tags, then?

Please also link to the reports.

