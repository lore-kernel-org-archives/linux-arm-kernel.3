Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD1CC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 18:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQXvLoc755Zeopr1jhLxVeOi9RC9xqVsyqCTBDdev7E=; b=s0uQsFETexrl1G0wQG22IgnYi9
	8h6h5DM4s9HolnGeJm86awn//uYohqWpm4/cx2TmDI0V3F8F3J2Yc18Z45edghVV8UxqB0OfRzVjz
	fM7Tx7itzMY3e7NYI+ijUvw6OVs3NgRwZMkw7wcVP1D3gIA9DZlvB1FUFzLu3r2e5fMr5NFqc/4lS
	MxcMWhUgc6XLPbT6/VQtLeON74sq0iws04C03gUiad5Ytl++1LLQrOCfg66afrx0ZpYejqm6eSmGI
	TGhK0uaFKT2839JWWRsOK8MxWe+5rOADgE60MTlRWYNw0m2I3xdP647symi3Cf8uGLbA0c4N+E//5
	03PcoXEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twmfK-00000003xbn-3KL4;
	Mon, 24 Mar 2025 18:36:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twmdR-00000003xFT-1cwj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 18:34:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 325B243C49;
	Mon, 24 Mar 2025 18:34:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E7DC4CEDD;
	Mon, 24 Mar 2025 18:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742841292;
	bh=y0BX7r8ryEWjMxOOO9xrdurEHkOyQxtBaLfq3+2msBM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=C1ndWjuCBM1XTyGk+PbUv3bAeqUBsI3f24qAxf75F3b2S0gBLd/gxLK1M8CTwycGR
	 EGEq+rV4FcPUlMjmWU4JOpNtB3XdC+BC5Jqn9AAWoZ5lDVqq8C96oFOiv6LAfclzM5
	 Z2EopyxqpZmamZ0gLvM6yuMsAzi8tCP7HkvlvRs9ytQICu82Vq+ySL3Sd7/Xzemijt
	 qMHfgbc0K18Rxf7iYK4nD0HtFXlIfQcqfY4OUCdg3e006ueekYleJb46lZO21O9bY0
	 Kv7yZS3Qa03m826wLjqxcA2B7ONVeKA16uJ7ok2OJ6CqFsdByI733foISPHls3XQqG
	 Sj0nP2/SznzyQ==
Date: Mon, 24 Mar 2025 11:34:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Ong Boon Leong
 <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH net v2] net: stmmac: Fix accessing freed irq
 affinity_hint
Message-ID: <20250324113443.215c036f@kernel.org>
In-Reply-To: <20250318032424.112067-1-dqfext@gmail.com>
References: <20250318032424.112067-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_113453_448890_86F0629D 
X-CRM114-Status: UNSURE (   7.16  )
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

On Tue, 18 Mar 2025 11:24:23 +0800 Qingfang Deng wrote:
> -		cpumask_clear(&cpu_mask);
> -		cpumask_set_cpu(i % num_online_cpus(), &cpu_mask);
> -		irq_set_affinity_hint(priv->rx_irq[i], &cpu_mask);
> +		irq_set_affinity_hint(priv->rx_irq[i],
> +				      cpumask_of(i % num_online_cpus()));

This does fix the bug you're targeting, but FWIW num_online_cpus() 
is not great in general. The online CPU mask can be sparse.
You may want to look into finding 'nth' online CPU instead of the naive
modulo as a follow up.

