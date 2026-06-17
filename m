Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8BACD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 20:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yI7oWojBBWCFZtT5GkeyArJgGoTs0Iz+VhD0IZ6tAKI=; b=krSCZJ+ZFOF6PL1h9+SPjCRhmY
	sCwncOglJZ6cTPH8VdGqyHmWhRDbGte5zHjpPiblHHxyYhXBgWVXydQzKbWe5jYmeIG8aUhF/IblO
	r+si/3ZqY5MJ35+GVvvf9M4SmbjkgDGuOi5X3YaLvCB0d42FvARY6BP3qWAKF7qFdLHiYsIbP5iPI
	bWLbKNfQ4lHwxwk8dG9aIwFxNvDQSOP04M3It7DFqZMXGH+dwXK/xqW2aELX5ufSHSy+rkPCj4mCb
	M00eVB/L4/+5/qy3b3Eg8J6akvimoz6Ec9a+Qotqn/2rlIntvc84mJXqKve3LDT5QksuUa1XbzsYp
	DU0o70uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZxH2-00000000KcV-2lqX;
	Wed, 17 Jun 2026 20:54:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZxH0-00000000KcF-0eHU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 20:54:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2EE7B6001D;
	Wed, 17 Jun 2026 20:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 412D51F000E9;
	Wed, 17 Jun 2026 20:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781729648;
	bh=yI7oWojBBWCFZtT5GkeyArJgGoTs0Iz+VhD0IZ6tAKI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=djxb4RDrAOu/bmeS3G3q6kZTONzLdub/v3XZ89XiXHCBOzxwATOUPjT4qECXrAI56
	 Ya1wiMu1Vt7fRvp1K/PlEeoJW1cTkZ71S5HdpYAx15KXUR0wKbzrkM9YfDXY/vEKcR
	 4AZt7u/WdJM0zPEdE5zAfudRpdKVDyVXtZrKfC4fnuChVldPp0ofY14Rcw5RDX6zKf
	 VIytAwUMoq7mEu0S+DEZ5CbUZnB7xqJ0xmWUQcFKBRakMEmPiWEf8bR5kePKfS8qXo
	 ISTz3SYznNKs02+YwNdn/8JIvoBF0UhKDOTuMQCZyY/aitBGP1bW3is3i1EKkc5za3
	 H7KFZf93vQC3w==
Date: Wed, 17 Jun 2026 13:54:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: <keguang.zhang@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-mips@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] net: stmmac: loongson1: Use dev_err_probe()
Message-ID: <20260617135407.6ff54e27@kernel.org>
In-Reply-To: <31630db0-85cb-421b-8ebe-bbae07521533@intel.com>
References: <20260615-dwmac-loongson1-v1-1-cbcf5bc01d9b@gmail.com>
	<31630db0-85cb-421b-8ebe-bbae07521533@intel.com>
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

On Tue, 16 Jun 2026 16:42:18 -0700 Jacob Keller wrote:
> I'd probably also argue this may go against the desired goals of
> net-next with only wanting such cleanups when in the context of other
> larger work. Of course that decision ultimately belongs to the maintainers.

Yes, feeding const EINVAL into dev_err_probe() is pretty pointless
so if this helps it's just by "saving" 2 LoC. I'm not sure it's worth
it even in context of larger work, let along by itself.
-- 
pw-bot: reject

