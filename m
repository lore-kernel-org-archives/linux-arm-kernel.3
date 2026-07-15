Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81FFC4450E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 18:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbDYprAtTAaUYhTnGvnNHpzVJY8syKc/fpVU22ZOJTI=; b=GoR5RvVYaHaJQTjUmQ80q1+rBw
	3ivj3BBMJtgD4RgUPrv668mdH5unmuZ5rnrTpp7Zij2F7q7BUql7zVTze3Qc0aKvpcFa18u82hqA9
	MzdR2kTPdEJU/MaMyamd0xyC9g8bS0gNVprkLIdQ2pwLxq9OjqMFI2Alx3pjL7WQXPc8uX5bYi5cR
	lVpUx98QRvLPWLC8xOYyV/KejsEc0qNAahwEL8hlBP0RQBo8Uz/JWJbLgBZ1rHz7d84pKlrdNMllD
	dZIPe7aZAqcSRAZQWNTeZmvd09a7dfofd+IMOwu6IbdH/ejinuSYbPzx5M0azeLFsM8n6a17AeoD6
	etpBZWEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3zs-0000000FckZ-08uX;
	Wed, 15 Jul 2026 18:06:16 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3zn-0000000Fccb-1rw0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 18:06:12 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cacef7d299so10335ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 11:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784138770; cv=none;
        d=google.com; s=arc-20260327;
        b=iZXWFllv0S+KHP2EeVGXsq2oPjXrHxyap4RO1S+6Ses4+yilV92udR4xByjtvhIebJ
         OCrSR3GFLnWLkduh7mLqL5gU84kXGHScb5ijRWsF8IDs6O3Um9OzdeEUU34vB4ivRZ6K
         rWE8xYwJV4jea6q1qQx5/XuRlgEftwXMIzg1mqNosQDexSERJbqTRArdc1DoVnhLcUL3
         oMG73kTGvO+CQ4vyTqAsviXFIZUOGUtKWHxbYSFEhiqubgZtHKSwWvzVxrUv+EfgSBIv
         vY6FCulT9mJ2GV4bZolA9RNt0t0l5KwO2Ofbd3wb+5UIqpg4/XXlpur2U4Bf6GQ0MGOc
         iIJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pbDYprAtTAaUYhTnGvnNHpzVJY8syKc/fpVU22ZOJTI=;
        fh=SZNfnqOVfJoGqUvTgGoQh7zBWXjBwTG3yulKAjCSi3s=;
        b=bWV7UhWuBQWPRQHyQ6fsG53q50Azmkk7+MFCIfm3ah0/QjqmD0APHoDvM6tpYRprPg
         k0/B+yZYu7bwWm15Nd2WUdKKLVxgoSBMsQeZKThhGHinKP7nrO08fX9a4QSwYD+oeg7P
         t1OguhA5vPmOX8tOhKsW8DjxW4TZFMoedkojd+84jW28nstsdcGLlvidy4JgWcH+FxyQ
         y5eZWCVgeWaHY7ajG1eaq+zJiI4wVPka7cSJulKltML1k21axYT9MsUeyxGyVdKh4w2o
         Of8qEkI+sRPGneAa4nwlGqalYYyrgRJxFxgDzeII6H0L6bhthlVmBPVnw5FGAcGp8bp3
         ZcqA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784138770; x=1784743570; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pbDYprAtTAaUYhTnGvnNHpzVJY8syKc/fpVU22ZOJTI=;
        b=okZPdajuYytO4IKHbzeb6fNdKINSrWbexcvRqXYCzUaS27K20jkQbspNV8Nm9024Ir
         UObu7BcXyTtQ4VvmQ2sSxmChCohVlI8UlTnJTE4RgoMdG8p9gdmTRAVNmkcnseWrUJUA
         E6n0q2Vcbvvz96AuaEPglEkWprZxj5slCFLJGMVEEJyG+YP7cbhCJiOcNi+/6Rm31pmw
         oSqM8y8rVSZgYvSTEsskuwHDR4Q2frKm6kT3BQcKhMGbvO+j8DiBXc2UPg1sw5SUmFl+
         yCFUsqCsqQZxfO84oX1jOdtevK05bxeTDuLnt/Oq0t0y4iIo4eFzHoDBZPkzoAl7xSaP
         e62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784138770; x=1784743570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pbDYprAtTAaUYhTnGvnNHpzVJY8syKc/fpVU22ZOJTI=;
        b=XxRJWhCGvSu26rVPv5Ox6B6qlPQT7BkmTvEgSQeHGvBQ9y2Ja11ii4iDjUwV6Rgl7a
         0hFJrqWYxTyv2RWZGDRX3QyyfWAfKt1KPUqyxqSEjgOTYm3bJZkTK8dj5ftWT7Ccohqm
         D6gertiD+anU3RYRJ13djJxZox6k4OTl5WPvZoPl8gwmOCUiyUfElBjptRaUv43L3Wx3
         qEkkkY+P2uQWYcZoGH3LdBKuEDoG5fl9CH3pS0oQMtJlR/kax6fx2ftMyF2eFAPwGhol
         MiBsmtVoaoWj7fWfn33n81bgA8Lxz47NNII4qWlMtCHkSF838y9BeX72NJiC74G9LIug
         McRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqC527jOnwmz/xXo2oDlwtLpq2ic61z0hyn0kicRmDc/q/pSp0jVKw4rT3eQm2Z6VdkSX7I/PMw/pO94Iky+q2Y@lists.infradead.org
X-Gm-Message-State: AOJu0YxedmhgIp7CVICd/IylJJJF9PjP7xkO0xjurOREiOLpRniwRfXS
	9XiMUrEcDSO4F8lBUHhCYAVgFmecfWdlIN7cIYdQ11u7POBr3iGFncNzL0+Z2LIN/yFdoVpWWnS
	rjh6umCX81RsfoxtOXf1n5k71uVHKGbVJQNnLW8yq
X-Gm-Gg: AfdE7cmfpOncakFVxpeSROGctCAgnjX5x84yxgQCyjVJPUn7qypThEqe5ALvujqNWl5
	t9IiHn4tEyemPBJ4eedVLMLG9zV/5L+QanKjKBa+01ZkuQm/fK9fm6wOj5tVXpcTCYYGTOy20ek
	J2nYlNQATtf9fR8FUfiRdjT+BE29h/zqkEQDn5fpx0/qq/0BCoyziAbyoJChPbFO76Q5HzeNmL0
	mjV7t0mR4cPhsXOIY7M2lyFVLj4JkY5yt+sDZBut8pASAlEzz6b9uuiVETdGdcv/1PJ9Abl4XqG
	1SQzp3f1eNstObFrfyaIVo1Dztg=
X-Received: by 2002:a17:903:1850:b0:2bf:139c:dcf3 with SMTP id
 d9443c01a7336-2cf19639aa5mr404555ad.19.1784138769096; Wed, 15 Jul 2026
 11:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20260715123610eucas1p100ea97629de7a87fa67016275cfb38f4@eucas1p1.samsung.com>
 <20260715123602.51950-1-j.raczynski@samsung.com> <20260715123602.51950-2-j.raczynski@samsung.com>
In-Reply-To: <20260715123602.51950-2-j.raczynski@samsung.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 15 Jul 2026 11:05:55 -0700
X-Gm-Features: AUfX_myiC01IMInrfsYG52lU15TUIyRDhJY9tdWQ7zQwCgNUQoJkmDKfWc-MS5U
Message-ID: <CAHS8izOC=hSwB=nFhs5h8UP8knnfMTj7Zu=9trxZ5+vHN0dXBg@mail.gmail.com>
Subject: Re: [PATCH net v3 1/2] net/stmmac: Set Rx queue page_pool to NULL
 when freeing DMA resources
To: Jakub Raczynski <j.raczynski@samsung.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_110611_495354_BDBFDFFD 
X-CRM114-Status: GOOD (  21.36  )
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

On Wed, Jul 15, 2026 at 5:42=E2=80=AFAM Jakub Raczynski <j.raczynski@samsun=
g.com> wrote:
>
> When freeing RX descriptor resources, there is standard clearing of
> descriptor page_pool via page_pool_destroy() which does destroy
> page but does not set its pointer to NULL, which must be done by driver
> calling this function.
> It is not done in __free_dma_rx_desc_resources() when stopping interface,
> which is generally not an issue, because __alloc_dma_rx_desc_resources() =
does
> setup this regardless of previous state.
> But above is true assuming reinitialization is successful.
>
> In case of failure of page_pool_create() in __alloc_dma_rx_desc_resources=
(),
> all non-NULL pages will be freed, including those already cleared.
> So there is possible kernel panic due to wrong paging request at address.
>
> Fix this by assigning NULL to page_pool pointer on free.
> Also remove NULL check as page_pool_destroy() does check for NULL param.
>
> Fixes: da5ec7f22a0f1 ("net: stmmac: refactor stmmac_init_rx_buffers for s=
tmmac_reinit_rx_buffers")
> Signed-off-by: Yashwant Varur <yashwant.v@samsung.com>
> Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index 2a0d7eff88d3..3098971e0b66 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -2172,8 +2172,8 @@ static void __free_dma_rx_desc_resources(struct stm=
mac_priv *priv,
>                 xdp_rxq_info_unreg(&rx_q->xdp_rxq);
>
>         kfree(rx_q->buf_pool);
> -       if (rx_q->page_pool)
> -               page_pool_destroy(rx_q->page_pool);
> +       page_pool_destroy(rx_q->page_pool);
> +       rx_q->page_pool =3D NULL;

I wonder if it's reasonable to add pool =3D NULL; to the end of
page_pool_destroy. I don't know that any caller wants to ever retain
the pool pointer after that function returns, and grepping this
function I see almost every call site nulling after destroy anyway.
But anyway:

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina

