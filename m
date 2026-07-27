Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4DFC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1SmbzoOaveCBKG/5kCVa1IYcMqVrJpItxE2AKQiVrg=; b=U8tlcFH1+tsaJ8YrKSJPY2Bhye
	gG05vtBl5N5zpGkUFsrKGCAfuvK3XDzheWmIfTO1Tum9ajPhbQxUrg/CSB8L3oC/1ryEpfHzCHsHa
	sA1UP7XgUychD+HHkJSBzDruAjhtdH36viwlFdgOiqEAzHCzP07openXZZ5MjoN8+nHhWunOU2GNp
	EF9px4bU8lPdw4+brVRFrB2ie9ep+YlTnyXctfFvhnoCZvELsdY1xa2+FjHM5f92M4umAPxhN8YNm
	TrtmlvADNSjz63oUSEcWgdQwsOUY5mqgUW8WPs8n/hN+JoZgdvPIiJ1yvrEs6MiwvdfqUiAgoIQtT
	3chIALDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRUQ-00000003nbH-2klc;
	Mon, 27 Jul 2026 19:59:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRUP-00000003nb9-1nNR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 19:59:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E720D4372F;
	Mon, 27 Jul 2026 19:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459041F00A3A;
	Mon, 27 Jul 2026 19:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785182392;
	bh=C1SmbzoOaveCBKG/5kCVa1IYcMqVrJpItxE2AKQiVrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ebk4xxw+UbSLOvIIUXkJNcMLukV4QfIcHE6tWSNbHevUwShk6K19/Aqm8Tb3Tosk7
	 i0YZjwYJbHhyviI/5LEcN2K3W+bul1ltiYJ7hd87wYRH1CEUa4aod/Xe9DH/0C8J/1
	 dxIPBQk34KrZd3++tFmdBqPaH8Wyxt33H0k5oKHvVCEIYsRlys71TTFesceH17licF
	 XViBjs9T1Qku7VqesMOC/gMRMLPW0b4Y8CjDvSWYdb/b/72qPrVS94YgsA2qN0wOPQ
	 FcT0Gr2eqMcbn2eHEVnZDS3rq/8w6S4YJJGRzKAqZj0xhcWQvbB9jqx7GqQYUhpZVF
	 B/PzT8s+WPy/g==
Date: Mon, 27 Jul 2026 20:59:49 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Xixin Liu <liuxixin@kylinos.cn>
Cc: arm-scmi@vger.kernel.org, cristian.marussi@arm.com,
	Sudeep Holla <sudeep.holla@kernel.org>, mturquette@baylibre.com,
	sboyd@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] firmware: arm_scpi: reject DVFS OPP count above
 MAX_DVFS_OPPS
Message-ID: <20260727-solid-cinnamon-kittiwake-1c0bd6@sudeepholla>
References: <cover.1785118770.git.liuxixin@kylinos.cn>
 <bfebdb68118c.1785118770.git.liuxixin@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfebdb68118c.1785118770.git.liuxixin@kylinos.cn>
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

On Mon, Jul 27, 2026 at 10:19:15AM +0800, Xixin Liu wrote:
> scpi_dvfs_get_info() already rejected a zero opp_count, but still trusted
> any larger value from the SCP firmware. The shared-memory reply only holds
> MAX_DVFS_OPPS entries in buf.opps[]; a bigger count over-reads that array
> and then sizes the allocated OPP table incorrectly (garbage OPPs / OOB).
> 
> Reject zero and out-of-range counts in one check and return -EINVAL.
>

This issue of out-of-bounds read is present since the original SCPI DVFS
implementation. So please include the below fixes tag:

Fixes: 8cb7cf56c9fe ("firmware: add support for ARM System Control and Power Interface(SCPI) protocol")

-- 
Regards,
Sudeep

