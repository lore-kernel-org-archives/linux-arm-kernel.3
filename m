Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9612C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 08:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKFkCkwIghfCr+DM5CXjoz3KrgfvHy+jPlJJIScrzXg=; b=OJs6RKIldYErcjZNDA/s2WhNaZ
	imMehnpWof9qmwjfqAMl5aOMePF+2HfJQskfz6lbP8B10zqfqTmILVFnERE3NZjy7dLz9zNKzSkRW
	D7Pz5Bp/dUxulEG1k+UXL+Sl05hXHZh4JhO5ofzk8MeiL2dOPpLuwi1fMD8pIMf+mY9H6KZxwdqBc
	xcEzvCk9wOc1HvZzzYpswZYBytXXQlDqbBmtLK9Oi9Qy33rqzXai+mkiTVsN8TwbcTEpFLHNkT1tq
	eGqbm7eR6vsxFCOcxjAOD16cUO4WwhqxEsJ8TsUijMQXUmiVRiF6peJ8eHFwPpWZkiJClEQJvMaV1
	k2JaTb2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udldm-0000000GbcN-1FeW;
	Mon, 21 Jul 2025 08:12:54 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlbL-0000000GbPx-3VAN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 08:10:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E68B544380;
	Mon, 21 Jul 2025 08:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753085418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SKFkCkwIghfCr+DM5CXjoz3KrgfvHy+jPlJJIScrzXg=;
	b=a3/WvkqMro8djZzEjYoTOpL8ApbW10+o2OdBWljK6/GULQv3HQCrw3nmy1Hli4rINv3NdY
	6vPkg17fGrhAw8aCVgfgbmSQoSn6k6z8HXFjPb3EvD88dAqU5/pfFUDFtftFegQKfU+uFO
	A6bvphZwJFoc8KJTcYQu47dDc+TESugpgzaLQHs6S+v80sleodXQTk2NeL3FQ29wIpIgtY
	mL9Hse9JKcUlI0k+3ZhINBn/uldVJrjskVmKdKp0gwd4MM2vUSpElhjCE5yJt+Q0s7rNdO
	RVr3FGUJgXKDMcQWZmfJiqfQjZyJIJSkBw1kI7PVDtwAFUBtxIfUudoFZI/sOA==
Date: Mon, 21 Jul 2025 10:10:15 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: jackysliu <1972843537@qq.com>
Cc: maz@kernel.org, tglx@linutronix.de, antonio.borneo@foss.st.com,
 anup@brainfault.org, jirislaby@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip/gic-v3: fix resource leak in
 partition_domain_translate()
Message-ID: <20250721101015.1183e89b@bootlin.com>
In-Reply-To: <tencent_72EDAD7F6E52D8FB5933030A569A08AEC406@qq.com>
References: <tencent_72EDAD7F6E52D8FB5933030A569A08AEC406@qq.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejudehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepudeljedvkeegfeehfeejsehqqhdrtghomhdprhgtphhtthhopehmrgiisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopegrnhhtohhnihhordgsohhrnhgvohesfhhoshhsrdhsthdrtghomhdprhgtphhtthhopegrnhhuphessghrrghinhhfrghulhhtrdhorhhgpdhrtghpthhtohepjhhirhhishhlrggshieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhin
 hhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_011024_544989_5C5FCC80 
X-CRM114-Status: GOOD (  20.09  )
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

On Mon, 21 Jul 2025 15:28:04 +0800
jackysliu <1972843537@qq.com> wrote:

> There is a device node reference leak in partition_domain_translate().
> After the function obtains the device node np via of_find_node_by_phandle,
> it does not call of_node_put(np) to release the node reference
> in both the error path and the normal return path.
> This causes the node reference count to increase each time
> the function is called, causing a resource leak.
> 
> This issue was detected by rule based static tools
> developed by Tencent.
> 
> Fixes: 87228532e7e9 ("irqchip: Switch to of_fwnode_handle()")
> 
> Signed-off-by: jackysliu <1972843537@qq.com>
> ---
>  drivers/irqchip/irq-gic-v3.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index efc791c43d44..61c1d404b726 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -1821,12 +1821,16 @@ static int partition_domain_translate(struct irq_domain *d,
>  		return -EINVAL;
>  
>  	ret = gic_irq_domain_translate(d, fwspec, &ppi_intid, type);
> -	if (WARN_ON_ONCE(ret))
> +	if (WARN_ON_ONCE(ret)) {
> +		of_node_put(np);
>  		return 0;
> +	}
>  
>  	ppi_idx = __gic_get_ppi_index(ppi_intid);
>  	ret = partition_translate_id(gic_data.ppi_descs[ppi_idx],
>  				     of_fwnode_handle(np));
> +	of_node_put(np);
> +
>  	if (ret < 0)
>  		return ret;
>  

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

