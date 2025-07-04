Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA725C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 15:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjG6krBKsTsQzxiUiao38idBoOrhUxlYC9EyW6WDU3c=; b=OJWv8IkZfu6+vl0NcHN08sUQK0
	QLJZNRi7K+9qip7LQbLAIXeoII62zx5qxBq4Wc9UiUYF8XEA6KkWGxhBAiuoptEbJKmQspHHbfRjM
	BAjBm8or/acKYUI+fNRH8HwyHn3pAelc3rciOKbbkYi86OtSgV1yz4u0nxKUMnyD0tC8eHZz59Z4B
	Xtlbuq7HRbHSHAer8BryX5EyWrd/paOxNhO0heUvvzim3c7CaSM2uV+PjquxgWLz+xnFr7HE0S7k2
	R1LeajlgfATge4jcMNvD2FVwsbN87eubE2ns2ZP+fU0nDUEp+x1lHVO8/CSmIx+OSueBZK7xAZqku
	dVPOSUCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhtY-0000000Ek3c-2v7e;
	Fri, 04 Jul 2025 15:00:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhhY-0000000Ei5G-2rz6;
	Fri, 04 Jul 2025 14:47:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D782D43647;
	Fri,  4 Jul 2025 14:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B40C4CEE3;
	Fri,  4 Jul 2025 14:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751640463;
	bh=jwcVzcOp2LjEkMGfNXiETyByGfXvf0/LAVTF7MdWfQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n0O6zElYoWbmZPP62cHIicYkg9GvCc4BngwLsq0dhP3JHuG6080LbkeE9dT2X44J0
	 8cjfLBtQm1+kC3BeST7xFCi/y7AauHxUuUyBf/7c9mdavwY8hMspOAlUIasbuY4dz+
	 F/aa4+Ewkzotdx/iAEQHPXUNII2iIV9Y7S/QH8NNKNi4vI+7D3BjY+1DxcwIo6oquh
	 WUcqs7dUk4rn8dUlPEYnuF5/GAwtkp1Rt+NtIxmpmZXs4ZbnvZcZQUtXOfcHYENiGc
	 ZWLr6ohYJYngdlFj0PbJDTVCYTizi79LQO7hKCWPvJH7sTRLpthtuwe9a1x5GO4uzr
	 9OGtnxU4LljJg==
Date: Fri, 4 Jul 2025 15:47:39 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 1/6] net: airoha: npu: Add NPU wlan memory
 initialization commands
Message-ID: <20250704144739.GZ41770@horms.kernel.org>
References: <20250702-airoha-en7581-wlan-offlaod-v1-0-803009700b38@kernel.org>
 <20250702-airoha-en7581-wlan-offlaod-v1-1-803009700b38@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-airoha-en7581-wlan-offlaod-v1-1-803009700b38@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_074744_747407_0D24CAFB 
X-CRM114-Status: UNSURE (   8.67  )
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

On Wed, Jul 02, 2025 at 12:23:30AM +0200, Lorenzo Bianconi wrote:
> Introduce wlan_init_reserved_memory callback used by MT76 driver during
> NPU wlan offloading setup.
> This is a preliminary patch to enable wlan flowtable offload for EN7581
> SoC with MT76 driver.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


