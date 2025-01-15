Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE88E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 02:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRcnAFzvXdlWc4UHhAzH7Qrj8PlVITjNIxD+h/EtYRI=; b=BihXsw+5d3vLqRKDF2zLGHmyzy
	nKuHfzN+LX3otwM9O1oGu5EHEIzjZ2aJL2Y5s1ZMDFfTG8kkAK+dayM6FaSvfIqFphcoq+J/UQ8YB
	M/CcVS+HRBBGRJENAoyaNsBSRd081Coh5kXcDmiia87BVQawHR9UB24CNzDlIi5d3wcgJx77tUDil
	sxUtLbviI7jxWkIuW0MnskIfj9QK2CnKTBURET6aC5SIceo5ETbgfwGAOAKYgjauOyofFwjml1IKM
	Uqo5cmfPyV33oIznugiW8GGVGkSJfnPMpmcabohOAavcwrrDQIfgq/35tWK1rqMzkW16pxLfbSjDO
	aWkhHgAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXtGO-0000000AQUb-3Uaw;
	Wed, 15 Jan 2025 02:36:12 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXtER-0000000AQA8-3ceW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 02:34:13 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2efb17478adso10264030a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 18:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736908451; x=1737513251; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRcnAFzvXdlWc4UHhAzH7Qrj8PlVITjNIxD+h/EtYRI=;
        b=bjaKjkIbvZ1m72irpCJIfSw8osOttYjecpDR3UO/Pi6PlOJg+UWLfXKyh5Wgh9We/M
         Vi3QbcnzKFFh29ayA8scDp/i7zI0tJ2sVOdE+ewIPrbMxZ1OX0q+TZeAG2N4md7vKhCi
         4S3chJseofucrtdPokuv0oe3beAl3XOuECxezePHPG7/vCwIwJyfT72HqZF4z+sM/7dw
         8F+wWOB0pvWvFxNy753+Zhhn1XXoHwV1tPU1FnUBRSmQgre4aQUb65ftMwK+wYGwuXvJ
         9kvXJSRg3DaX2B3Sa5v53MjXJEOFSmtMUVTVCY7CaOOSARyT2/vlI1QYng2XlWHdlNvK
         Dpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736908451; x=1737513251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mRcnAFzvXdlWc4UHhAzH7Qrj8PlVITjNIxD+h/EtYRI=;
        b=JCC8VOWZZSS8ER+ewTg6roCYL3lzYcKk2LWw8Rrx+IDfN8qgdCIfYIdCgL52HyOGug
         eLiimJ8SKkNl6KDIrUjqCoOSIMLHKev4SPLKRkTctBSZic6TKB3SzSSzqnRcWPbBsrDx
         PJOJwgnAGH6ivBrDZhgxPYyWpWqpjklAOc4zF2Bh6kLCqK7t5cx39+dTFcUhPXWUgWM+
         3T2vVOn1XLZ6a381QcdIhw0XhPvjX5PclH+9ZIzFdd9tNJqXGtgaQf1Xztq95iYjbRlC
         CnT4qvG7uopYgM8svewm4n3rOFsedOEjaKZmCuhgDG8VPTClM40s8yACrHjZNzdz6UC8
         lYQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsd+UDOfOxQjvf1n4+9s1eu2UOqWTPQhLWyfi8bCragqDudUl1nLKXYmkYUD3dxUvq2uNgr2WlLqlMxIivjWwV@lists.infradead.org
X-Gm-Message-State: AOJu0YyPntT0AbegWLfaX+HyhQ5RJVn5F6+yyznuIUUHO9v4908lhKAc
	RFQnqlf4KUcQGTVi9N8QVfSx2etJKf4bMGESrGM71UYHuhmRG151
X-Gm-Gg: ASbGnctro9niZEedhr82e1craDHxAzjWmBEbAPoQ7wuDdmunoKsqpIymi1HqfInrhOI
	posGwiiiJQEwWz75zQY5ho2XGUMKDc9tln13ieC9tpL2ZkGLSqAb2DwiynavqvVm/fHKgdQm0oG
	VeBVCAthQDz+nF2fQT6gP4Kr3v8GmWpX95KeN81T6VFauPOVDz8Z2npnfpFmqrpB3Q2DzDlzk2C
	t1xeghbvMUJR5QxMFvvunbdXScbpfRkyQwOAMgz9twAvWV0yHRQlg==
X-Google-Smtp-Source: AGHT+IFb183ByNSb0J0nzR81UMTSxQR60wvthDYKiKHQfrnq8srKLOSDrRHT8CLMHYY7rlkQn7gsPA==
X-Received: by 2002:a17:90b:3cd0:b0:2ee:5bc9:75c3 with SMTP id 98e67ed59e1d1-2f548f09e88mr36058871a91.5.1736908450551;
        Tue, 14 Jan 2025 18:34:10 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c151cbfsm247347a91.6.2025.01.14.18.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 18:34:10 -0800 (PST)
Date: Wed, 15 Jan 2025 10:33:58 +0800
From: Furong Xu <0x1207@gmail.com>
To: Joe Damato <jdamato@fastly.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexander Lobakin <aleksander.lobakin@intel.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com
Subject: Re: [PATCH net-next v2 3/3] net: stmmac: Optimize cache prefetch in
 RX path
Message-ID: <20250115103358.00005b57@gmail.com>
In-Reply-To: <Z4bzuToquRAMfvvu@LQ3V64L9R2>
References: <cover.1736777576.git.0x1207@gmail.com>
	<668cfa117e41a0f1325593c94f6bb739c3bb38da.1736777576.git.0x1207@gmail.com>
	<Z4bzuToquRAMfvvu@LQ3V64L9R2>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_183411_906546_E9DE0359 
X-CRM114-Status: GOOD (  21.52  )
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

On Tue, 14 Jan 2025 15:31:05 -0800, Joe Damato <jdamato@fastly.com> wrote:

> On Mon, Jan 13, 2025 at 10:20:31PM +0800, Furong Xu wrote:
> > Current code prefetches cache lines for the received frame first, and
> > then dma_sync_single_for_cpu() against this frame, this is wrong.
> > Cache prefetch should be triggered after dma_sync_single_for_cpu().
> > 
> > This patch brings ~2.8% driver performance improvement in a TCP RX
> > throughput test with iPerf tool on a single isolated Cortex-A65 CPU
> > core, 2.84 Gbits/sec increased to 2.92 Gbits/sec.
> > 
> > Signed-off-by: Furong Xu <0x1207@gmail.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index ca340fd8c937..b60f2f27140c 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -5500,10 +5500,6 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
> >  
> >  		/* Buffer is good. Go on. */
> >  
> > -		prefetch(page_address(buf->page) + buf->page_offset);
> > -		if (buf->sec_page)
> > -			prefetch(page_address(buf->sec_page));
> > -
> >  		buf1_len = stmmac_rx_buf1_len(priv, p, status, len);
> >  		len += buf1_len;
> >  		buf2_len = stmmac_rx_buf2_len(priv, p, status, len);
> > @@ -5525,6 +5521,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
> >  
> >  			dma_sync_single_for_cpu(priv->device, buf->addr,
> >  						buf1_len, dma_dir);
> > +			prefetch(page_address(buf->page) + buf->page_offset);  
> 
> Minor nit: I've seen in other drivers authors using net_prefetch.
> Probably not worth a re-roll just for something this minor.

After switch to net_prefetch(), I get another 4.5% throughput improvement :)
Thanks! This definitely worth a v3 of this series.

pw-bot: changes-requested

