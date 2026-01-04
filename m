Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E65C2A062
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 17:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBhKTVW2A45Nv9kmZP6nueEkojROXPwgQ6nw/FmKmZw=; b=0OTNo8Py5+9bWSnvn+ZfGl470K
	jNaaOIrx4Abc8dVT3uA3wCPt4QoCq/lAL6Jp48Cl17Ji1NGjXXMx5GfvPRLc0KSnzsK1Sc/BDFML6
	CNiUzYgoEBS8K7boVmsZPZ3zyRthgP2RNyLOE4EBRu/UmyBLWFgLNU14u+3yvGfhJa5NKu8uZ9H8/
	Oms0Hra9dLrf45eoZKSWr9PkGU1glbq5IjGTRskwAS9Fry/LtDuXxBgix0ypkCWjFP8+xEzGWWmta
	dZPE0AEkld2dubKSsvDUyc4N/U5+8lqxjYn/ii02i/VvR48BPMjuR4Hc/GftuTzH+DH86tJrP/zo9
	A08vp0RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcSMS-0000000AMvP-1N2U;
	Sun, 04 Jan 2026 17:57:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcSMR-0000000AMvG-0b5q;
	Sun, 04 Jan 2026 17:57:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3486C6011E;
	Sun,  4 Jan 2026 17:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85112C4CEF7;
	Sun,  4 Jan 2026 17:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767549469;
	bh=GogI6KoWMG7sQcRQST4tSXHnHsU61K4n/uzTVM7dT2U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eNlmOwGt/ErVXDeQvrb5x/qUdjhqLGFlCC5iP6wYoNNvUFVP7cv000yCvfbY9Xm+3
	 t0bz76FZmYWEyQMjc56C/y8XInKLqwSmjpGLbondvk0JTc5JxPQgyTX8tLj4dIng8/
	 ExnUx4fTaZhZNsOUunMIUh7D9KDaKIEjIB8ETkd7VcEuBSysYTkyEvkvIlix/9SbFw
	 k121A6v0zYiVfiXUrRFD73zwSDF6lacJKsWuHqsCQI1b8yuw+snggzPOjY4rU++Qnf
	 WWkxV1i/NQdTfXrtbab97ljbHLNU1R0vyrBFrPidwil+oZDy6+pLf2SpYuX7Vp9nqt
	 2+uBB0ndeE5dg==
Date: Sun, 4 Jan 2026 09:57:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Fix schedule while atomic in
 airoha_ppe_deinit()
Message-ID: <20260104095748.70107b9b@kernel.org>
In-Reply-To: <20251223-airoha-fw-ethtool-v1-1-1dbd1568c585@kernel.org>
References: <20251223-airoha-fw-ethtool-v1-1-1dbd1568c585@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 23 Dec 2025 22:56:44 +0100 Lorenzo Bianconi wrote:
> Rely on rcu_replace_pointer in airoha_ppe_deinit routine in order to fix
> schedule while atomic issue.

The information in the commit message is not sufficient.
What "schedule while atomic issue"?

> -	npu = rcu_dereference(eth->npu);
> +	mutex_lock(&flow_offload_mutex);
> +
> +	npu = rcu_replace_pointer(eth->npu, NULL,
> +				  lockdep_is_held(&flow_offload_mutex));
>  	if (npu) {
>  		npu->ops.ppe_deinit(npu);
>  		airoha_npu_put(npu);
-- 
pw-bot: cr

