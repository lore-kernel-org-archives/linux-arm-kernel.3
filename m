Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32405E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 09:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svw3hVWhjLUsKCnyMo5bW6Ng4sD85ogIrMfseX9wbyA=; b=D+KATT3OH+vCio+klzAqiyH5dc
	ad8OAVf7ZdTBQB30AXlj2cAQlESM9j+XCyYGqF7wj3lp0+jis4utExeta8iNaiTgEZS3Z+At7bAsS
	/XTqxocw//5Y5F+rFhXr4VnfCAjhlvY5URb6w6PxCJWpn3CjyIxg21wl94Chg9V/k2rnB9lI0VF7w
	lnGbCUlMKJ86dzB2BT5ZtdXEzLL9z7YjkK14mk19lmLTlt8b0wlzhXejrCJUmIp1m0+kz/Zb7MVQc
	3BuJ422znAS0fW9Y/LGTtmhkYMgzyAiG+dQkKArx9Rgc+FS1JfQmASjJJakWcvdMXP4LHcSF8MOpX
	FbZ1N/xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8Gx-0000000FNpU-14g6;
	Thu, 05 Dec 2024 09:35:47 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8Fu-0000000FNg2-3yQW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 09:34:44 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-724e5fb3f9dso581150b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 01:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733391282; x=1733996082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svw3hVWhjLUsKCnyMo5bW6Ng4sD85ogIrMfseX9wbyA=;
        b=VPRRZ1GXXSBlUiM9PUrZ4+gfVa3o8EGEbKAqZdGFJtR650LBC4SSkCgHg+yQRU5843
         T5fuhbt6Df+AeunaBk/AJPj0Ta4bzA7R9aorcuFQHamRKdXHRTZbDxlx7cSwb01IlZxZ
         ImdqRiagwYnWnUt1Mc2QxZxAflt6pHXOLsTh9xQB3KEkm0Hzs/WSmPd4elumoV7fVAxY
         GcdmwXnBXtUpqRo19zQvrfPpexn4PuToX4bepvLo0Y+BRvzIECQ1ImyhpJE7NlLyKNof
         KGXFf3cWBqiRGNG7AwUhvjzvZKosMJV6hrdtmPnomvEFNXumudRy+Hczansve9nGWRGS
         mXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733391282; x=1733996082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=svw3hVWhjLUsKCnyMo5bW6Ng4sD85ogIrMfseX9wbyA=;
        b=QN7TLG226r0vUdP5c72+2rJVDrc09jYgZMX3ckn33PXfTqiEN2dLKguivXxPi1fLxP
         1xqTfv2zjj2lMjqy1pdO+NoWhbH5f7I72788YzWWDStCmF/oYwEChhexnkct4yLqudRb
         JM2UuMwVWoDWm1bCpQk9wH37twQvI4o8iGZtnS4/aaf5HI7s/Wbpy24lznePO2lm7n9V
         ze9CdjrB2b40AdifpsXrOC3TFVgCKzFEJRL3TwP4KD105MyVMoeux2m9zT7ZqUxxDqSb
         Nrc7Sk9kkWPWB4V1tcPRijeTUEAjBq9L4avnA+JiCyykutlS/lUNrq7vkZUEMHOAhuby
         riig==
X-Forwarded-Encrypted: i=1; AJvYcCUyQMQ0khKYKyygJCkQTq6SbPo2579hyXtuXlS0W1ZokFG706qqBTjnyxsPv1ANQtO0uiqBH8+wK2DIKN78FWnk@lists.infradead.org
X-Gm-Message-State: AOJu0YwwEBhfLgCP2pjGNOS7tuw3ppV5hAiE3h+bktRyjTDgrEux09Za
	Fe1q8RYpWk6EmzhnXrC7IDC+uheknTKXtg7mtlk300K1D0ZB0iGN
X-Gm-Gg: ASbGncsq/4PLYgsCjh7xi0S8lhEaln1uBwuVjpJbUIP7pxrYnlDHUqagTVGwcbtGHgs
	ufTf/JCy4/tLRZJ20FWdyThyr35+C4h9CnLYKdR1V/gQDy3OhyubNIBfzOpc6SdOFhhSVayg6WZ
	zkAuqLP2vYEvh2Uyc9tyMHQTPF6j0wlkDkzxd8YuSnty2x8q5a9ZgA6AeR0ezyjWROuPUoWdBgE
	GkT50knem5Yz4ZZgCU24qUTT64a53CPYzFqkDGdtS5Axs4=
X-Google-Smtp-Source: AGHT+IGGByayQpZUFnuuK54B4xfgnuxti4ZXFGpFEg18KahQT7dWybOnF+z1/CV1gszt9ZR4jHsBdg==
X-Received: by 2002:a17:902:ec8b:b0:215:19ae:77bf with SMTP id d9443c01a7336-215bd0d8999mr134561575ad.19.1733391281860;
        Thu, 05 Dec 2024 01:34:41 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8e5f172sm8672215ad.69.2024.12.05.01.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 01:34:41 -0800 (PST)
Date: Thu, 5 Dec 2024 17:34:31 +0800
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding
 <thierry.reding@gmail.com>, Robin Murphy <robin.murphy@arm.com>, Jakub
 Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com, Suraj Jaiswal
 <quic_jsuraj@quicinc.com>, Thierry Reding <treding@nvidia.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Will Deacon
 <will@kernel.org>
Subject: Re: [PATCH net v1] net: stmmac: TSO: Fix unbalanced DMA map/unmap
 for non-paged SKB data
Message-ID: <20241205173431.0000779e@gmail.com>
In-Reply-To: <Z1CVRzWcSDuPyQZe@shell.armlinux.org.uk>
References: <20241128144501.0000619b@gmail.com>
	<20241202163309.05603e96@kernel.org>
	<20241203100331.00007580@gmail.com>
	<20241202183425.4021d14c@kernel.org>
	<20241203111637.000023fe@gmail.com>
	<klkzp5yn5kq5efgtrow6wbvnc46bcqfxs65nz3qy77ujr5turc@bwwhelz2l4dw>
	<df3a6a9d-4b53-4338-9bc5-c4eea48b8a40@arm.com>
	<2g2lp3bkadc4wpeslmdoexpidoiqzt7vejar5xhjx5ayt3uox3@dqdyfzn6khn6>
	<Z1CFz7GpeIzkDro1@shell.armlinux.org.uk>
	<9719982a-d40c-4110-9233-def2e6cb4d74@nvidia.com>
	<Z1CVRzWcSDuPyQZe@shell.armlinux.org.uk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_013442_991536_CC8A6D1C 
X-CRM114-Status: GOOD (  17.04  )
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

Hi Russell,

On Wed, 4 Dec 2024 17:45:43 +0000, "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> So yes, "des" is being offset, which will upset the unmap operation.
> Please try the following patch, thanks:
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 9b262cdad60b..c81ea8cdfe6e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4192,8 +4192,8 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
>  	struct stmmac_txq_stats *txq_stats;
>  	struct stmmac_tx_queue *tx_q;
>  	u32 pay_len, mss, queue;
> +	dma_addr_t tso_des, des;
>  	u8 proto_hdr_len, hdr;
> -	dma_addr_t des;
>  	bool set_ic;
>  	int i;
>  
> @@ -4289,14 +4289,15 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
>  
>  		/* If needed take extra descriptors to fill the remaining payload */
>  		tmp_pay_len = pay_len - TSO_MAX_BUFF_SIZE;
> +		tso_des = des;
>  	} else {
>  		stmmac_set_desc_addr(priv, first, des);
>  		tmp_pay_len = pay_len;
> -		des += proto_hdr_len;
> +		tso_des = des + proto_hdr_len;
>  		pay_len = 0;
>  	}
>  
> -	stmmac_tso_allocator(priv, des, tmp_pay_len, (nfrags == 0), queue);
> +	stmmac_tso_allocator(priv, tso_des, tmp_pay_len, (nfrags == 0), queue);
>  
>  	/* In case two or more DMA transmit descriptors are allocated for this
>  	 * non-paged SKB data, the DMA buffer address should be saved to
> 

Much appreciated for your comments and suggestions, I sent a new patch to fix
this issue. Please let me know if you have any new advice.
https://lore.kernel.org/netdev/20241205091830.3719609-1-0x1207@gmail.com/

Thanks,
Furong

