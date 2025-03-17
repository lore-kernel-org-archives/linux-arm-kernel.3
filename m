Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B36C35FF8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 18:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBkKHAzTqa+xksRRazDieHBfGhfHpGzD6yxGXylUmA0=; b=HCbkYpuyW3HiIJaeLxOa2Bhzpv
	FqAu6pLIgTx3K7PyYI2dKssV6aNYkMLJuKX1acLwxmVvUmYbGdTWoIsMbBu81vZMG4bV6nY6Wkfgt
	nUudElzXHxfbwBEUeJ2Wv8KVsNUKlZJr05siqX3JxUxXEWJiXhpPrPlJE1VmNEH8/pwof0rTTpBn5
	4FMnFmYJSHnF+GV+/+YXDheTFnXghCCQeg/8s/WfHS9/a165S8n+rXj7ZJ4l+1T8LUrD9qCqkAti1
	iAuNVqf+G9A/XcV8OTXh5WNoZA7KpHEHj1rD3e6hlhoGxB1GdcHfl50gDZvSZ9M3U6X6H9ejIWnq6
	OKqnmuiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFHj-00000003haz-05wQ;
	Mon, 17 Mar 2025 18:33:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEDE-00000003YVt-2HDN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 17:25:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 78CF25C5576;
	Mon, 17 Mar 2025 17:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91C5DC4CEEF;
	Mon, 17 Mar 2025 17:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742232314;
	bh=momHyGXw+AovseM4wvJIW2+gQCMWVLHanY3SYEvfQ8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fMvqPTAWX6/bdN4s35mnfMNzXCT0nS4WZFkNB/KnTGQO3iHR34AsnbMNLi7/i0K8d
	 h3FRtqIhwBUs2gLMCpo8OSH9B9lRDfelaS77Mkb2PbJcb+HmQWeisE3AT5ra1Ub5R2
	 qSxKZUrEbVKxvOSMgrWdzW66AMR1t9vih69ZLSPuqYJ2wgfu6CT4hPLaQyAeeEy5ov
	 kg2ngncAiDEvGNBOYrNnkK9e7M61+HM1+YEAAOhnlQlOPU+cb85htlJYXZLo/iKiiD
	 0b9pevrbpOh7e32Z1XETr/EZfu6OJ5xJGfrrICUSgIE+SqA63j8ch0MUdUJ0JO9ndS
	 XZ+lvmzmjylfA==
Date: Mon, 17 Mar 2025 17:25:09 +0000
From: Simon Horman <horms@kernel.org>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Dan Carpenter <dan.carpenter@linaro.org>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v1 1/1] stmmac: intel: Fix warning message for
 return value in intel_tsn_lane_is_available()
Message-ID: <20250317172509.GH688833@kernel.org>
References: <20250310050835.808870-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310050835.808870-1-yong.liang.choong@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_102516_654488_82C56BA7 
X-CRM114-Status: UNSURE (   9.76  )
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

On Mon, Mar 10, 2025 at 01:08:35PM +0800, Choong Yong Liang wrote:
> Fix the warning "warn: missing error code? 'ret'" in the
> intel_tsn_lane_is_available() function.
> 
> The function now returns 0 to indicate that a TSN lane was found and
> returns -EINVAL when it is not found.
> 
> Fixes: a42f6b3f1cc1 ("net: stmmac: configure SerDes according to the interface mode")
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>

Reviewed-by: Simon Horman <horms@kernel.org>


