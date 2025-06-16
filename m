Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBC9C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 18:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRkanMyHzbvASGAIOLwBTk6NBsnPr1k7u8c+UBq/bhs=; b=i4akPYd3rklTabgy7uqm9Szcnc
	wnV/9Jkl2WmaKOfMddlF3Dr+0TbxZVZCSPiB5r3GQhaC+4eWhRGG/MitNLbRgfr9aXhbUB2tp02iH
	EyvNTQISw8lYF6xbdGXm2TnfYCK4jH/0UMd4qcFSYkTd5SUf5OMk9zBY9T/NRnNc53pdPbUmcvPzl
	QpxrTJu1UkgQmAczrUTDlGTvhk7aSMDkJxj+RRmDaiICSPBrIVwhEB3g6ZWPczmDlQoLIlNVpuf8D
	RP8iQLZTWlS9mB3ftoNiLBxOE62DaG3zUinTzs8jK5iKMX/D/zIdImnYT0RV+FiYw03gwNnP0bOvE
	pZe5z5Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREaT-00000005EQB-0B9E;
	Mon, 16 Jun 2025 18:29:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRCvf-000000052Zx-1GHa;
	Mon, 16 Jun 2025 16:43:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C585943C99;
	Mon, 16 Jun 2025 16:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC899C4CEEA;
	Mon, 16 Jun 2025 16:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750092206;
	bh=vgKHpIin0g9uK+ECZ8DMrKXid3Ki24jEuiHE83QJT/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qyrmHN1PY/IDHQIPV4xvG4X4qZNHhmrYs8nSvy1/puhkpIkaUuwi6mmuN/uQqdcj6
	 3g9s5HDJQfphHob0LMaFN5vjPW1mw/uON1YQh5ZeIs6lytBUWTUwhGEtLd7AkCQwvm
	 b/+UhCLWxr6qOGDpdw4VDZmttbLtuLUe9G5h+O5yGQS4Pe083ZPhxsKHlhNg6KZR+s
	 Ok6LcTc9sLwy1E7+ZzEseaJmmCudJYMsYh+ONmxjkvQiAiY9/M8jkcMk7qjYAPoaV7
	 TqWbaL540Pi7SgwkPpWQH5dX51moq7+gDFL5xUz3Yr1TQt5m7ZimFElSjrDLzveLGa
	 wDWhmQ8Rv2FxQ==
Date: Mon, 16 Jun 2025 17:43:22 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Always check return value from
 airoha_ppe_foe_get_entry()
Message-ID: <20250616164322.GB4794@horms.kernel.org>
References: <20250616-check-ret-from-airoha_ppe_foe_get_entry-v1-1-1acae5d677f7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616-check-ret-from-airoha_ppe_foe_get_entry-v1-1-1acae5d677f7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_094327_355705_4C172E12 
X-CRM114-Status: UNSURE (   7.75  )
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

On Mon, Jun 16, 2025 at 12:27:06PM +0200, Lorenzo Bianconi wrote:
> airoha_ppe_foe_get_entry routine can return NULL, so check the returned
> pointer is not NULL in airoha_ppe_foe_flow_l2_entry_update()
> 
> Fixes: b81e0f2b58be3 ("net: airoha: Add FLOW_CLS_STATS callback support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


