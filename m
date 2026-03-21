Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE6F1099B56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 01:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJPOl0WCCHld+CK6DDvwPDPxmFR1ok8LRoHMSH472Iw=; b=oTpTI7n9W7qKUp4q4mb/FMZhok
	YkpQ/XVKczkUPFHXIFsFyzzm8/ntlMBiaE+iXRgs4U7gX6JU0pcmO7DFWe+oDxXHp7xiQ17p7StY4
	6aqHnxIrF/fc+oBDkmC3ImpWGXfuAb6kguV9IeCXsOhekgfSipspdj4t3hLXpOKGUO/3BoBjq5UH+
	UtZuqL+O0q5tw9U0DBJKqHuIBTWqsxJqTQCOKBSUWMLYfwh/VOHNEffLvyzkxH1+W4Fks/uzyY3OS
	BseQudzwE8jJsokdnhQqQ3XJZP6DpTzjJsAD62JbkqkNZNK9oMMpzaBsra0BgYNDw0qbUC6y7CVG1
	Dx0cClEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3lBb-0000000Dsvx-0nfP;
	Sat, 21 Mar 2026 01:31:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3lBZ-0000000Dsvl-42wv;
	Sat, 21 Mar 2026 01:31:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D136560126;
	Sat, 21 Mar 2026 01:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B763C4CEF7;
	Sat, 21 Mar 2026 01:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774056688;
	bh=Ol71JvZMsV9PQXvwimEzBO7sWgFIqMYJwJfSQnCmfGM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tl7LyCxU6YyWR+YWjI7EgmDJfyX35ZsGKz9yQjcWJ4d/wSNv4FdaUvsD+L6KLhJ9C
	 M61BN8uPQInLHN0bfhsOOX6GSluy5aKCR7A6590QTCg1SojrgDc4Ih/1enmKBhaQKi
	 +2wpgp8L/dttRpCeO/0aUbp9l/HMma+aONlaiMJlwMNq6vhC56NTG3P53rE61/5kjy
	 hPXwqbmG8Sij4Y2MAKWb8QVc4xS37hO1Fu2xOsolSegC17pR9Su1vkQUKwKEqHsX+x
	 nawPOr3ZY2i8DyEJs93jxsxLRYa6w8ieL51I6tJ9H+i5I/9+uWSpITBOYK7x6tGdsM
	 V9gd9noLLSxsA==
Date: Fri, 20 Mar 2026 18:31:27 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Reset PPE cpu port configuration
 in airoha_ppe_hw_init()
Message-ID: <20260320183127.22b360be@kernel.org>
In-Reply-To: <20260317-airoha-fix-ppe-def-cpu-v1-1-338533d8e234@kernel.org>
References: <20260317-airoha-fix-ppe-def-cpu-v1-1-338533d8e234@kernel.org>
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

On Tue, 17 Mar 2026 17:40:47 +0100 Lorenzo Bianconi wrote:
> @@ -155,6 +171,11 @@ static void airoha_ppe_hw_init(struct airoha_ppe *ppe)
>  						 AIROHA_MAX_MTU) |
>  				      FIELD_PREP(FP1_EGRESS_MTU_MASK,
>  						 AIROHA_MAX_MTU));
> +			if (!port)
> +				continue;
> +
> +			airoha_ppe_set_cpu_port(port, i);

AI says:

Can this lead to a NULL pointer dereference if a port is not fully
initialized?

In airoha_probe(), all GDM ports defined in the device tree are allocated
and the eth->ports[] array is populated with pointers, but port->qdma is
left as NULL.

During airoha_register_gdm_devices(), the ports are registered sequentially
with register_netdev(). Since register_netdev() drops the rtnl_lock(),
userspace could react to the RTM_NEWLINK event of the first registered port
and apply a tc flow offload rule.

This would trigger the following call chain:
  .ndo_setup_tc() -> airoha_ppe_setup_tc_block_cb() -> airoha_ppe_offload_setup() 
   -> airoha_ppe_hw_init()

If airoha_ppe_hw_init() iterates over the array, it will find the subsequent
port that has been allocated but not yet registered, meaning its port->qdma
is still NULL. The call to airoha_ppe_set_cpu_port(port, i) will then
dereference the NULL port->qdma.

Would it be better to check if (!port || !port->qdma) before calling
airoha_ppe_set_cpu_port()?
-- 
pw-bot: cr

