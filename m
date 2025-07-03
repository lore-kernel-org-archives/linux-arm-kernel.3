Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C85FC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 21:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQvW7uv8h7VjoxjI/7AQUIIRYv1qWvjecjEBCTXw3Kg=; b=Dfjhq/YUp7q+hyA72OCuZPpVUt
	8KNDvbeYgxACo5kKNn5vqqys8nRb0K96vausfcm38VqQLjopbBzSO9PyngHrQeZkW3UcfqHtQMi4F
	+eTuXOzSlF+4tiKKBiaZgR+WzfPO3YtISSin+qkwz8Z05zbSGQhSHboCU3MmFD043Am+SQCvblEOx
	XT5tMopH2QHeaaSsSESBe0AkzLTfiVTeqnPpLq4zYR07QHs78PepLD5iUwTPB2Fhy02co7GMdqnel
	5yCj7YTXKW/aUgjKsMvbFK5Q4YUo57hLm8OEkv61umRJXjTIAf5yPN6vD6dKNEJpAAwQwd081OabK
	psOFxppQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXRRg-0000000Cc55-0mqO;
	Thu, 03 Jul 2025 21:26:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXOPZ-0000000CCxx-2Bhp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 18:11:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C21EE61151;
	Thu,  3 Jul 2025 18:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54A4C4CEE3;
	Thu,  3 Jul 2025 18:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751566311;
	bh=VkIlwgd4byBd91qWdEkLK/tbWjhRo/xQa76/hK2+qYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i4QhAFfJxzBP6eDj7S/rqEadSTALJZGw8lbX49bsX+XyJ5tZs+g0wDKNXZNi8h6Ax
	 lKroWL/fWjKzVUuGGD1FoAMC72kq9L9CLsLTxYDrYhsqoAuXraNfbrQOkdKfOyo96/
	 BznzvmGLAGk32hT81BFM/w0roHsSuF34Ub0nB6VYWdXQTYQobAQCvk/ZaumvGuIS9w
	 Fa9VS+oSv1Ki59sQzZcGVuDIpYvyybFhpDcDMp6ZTx2uYsl5M8kz5ZP2xOV81/M2kP
	 mK3owdxKY5SccqjGbens4jXLUeVaiKRoAbHXCxN61paL/ZcnZmNmxR9JqVifUpmpnR
	 aZlXd0ssexXDg==
Date: Thu, 3 Jul 2025 20:11:47 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	opensource.kernel@vivo.com
Subject: Re: [PATCH] i2c: busses: Use min() to improve code
Message-ID: <gheuqazqnfbnxhdjcubhdvnfw6vsjspanllkwblbf63ifll7d3@lchelksxegdw>
References: <20250619142609.323082-1-rongqianfeng@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619142609.323082-1-rongqianfeng@vivo.com>
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

Hi Qianfeng,

> @@ -422,10 +423,7 @@ static void st_i2c_wr_fill_tx_fifo(struct st_i2c_dev *i2c_dev)
>  	tx_fstat = readl_relaxed(i2c_dev->base + SSC_TX_FSTAT);
>  	tx_fstat &= SSC_TX_FSTAT_STATUS;
>  
> -	if (c->count < (SSC_TXFIFO_SIZE - tx_fstat))
> -		i = c->count;
> -	else
> -		i = SSC_TXFIFO_SIZE - tx_fstat;
> +	i = min(c->count, SSC_TXFIFO_SIZE - tx_fstat);

I think it's safe enough not to need a min_t(int,...

merged to i2c/i2c-host.

Thanks,
Andi

