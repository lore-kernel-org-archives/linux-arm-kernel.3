Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE11E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 12:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYspswNAJVbjIJeGSav8oevdZS2Al30TlAOrfrWoHgI=; b=SbaSLMj+9hXrMUXrb4fGz1/gAd
	wTkwOt6/hqDbySqcy5pyRkHs6RFLsTaeF3E9CQ9zWJiARrZT62NKIoFvUzzyK8AcR6gjtq4jgwiUl
	gBzUVpebLcompw8L4B+l5gOtoadt9V0SalwTYhTVzXzwCf+WaVQWNO6EBw8WZo2aLyUFRNboSj9t6
	U1Y0hgR/RBG/ftrKE+TNnr5WjsYYLCWUcULhnYCISwveO4016boRJecsgtA/82Ltw/Yv8GmVSivD+
	k2x4LccrNCyiC9txIv/kOnjOsfSTADIAtVwDGcZWcKufeEe0bU3JaSMEbfBGkXCXtJvQ1RzHoheud
	sT8sk77w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJiQ-000000057Xk-1sRX;
	Mon, 13 Jan 2025 12:38:46 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJhB-000000057Id-1uhM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 12:37:30 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2f43d17b0e3so7415736a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 04:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736771848; x=1737376648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYspswNAJVbjIJeGSav8oevdZS2Al30TlAOrfrWoHgI=;
        b=MQyi+T0f3vrmMVi3H37uCG7SvzKXGLEVVCdTyeKSaf9qJpzC6aNc/dtIjcPPA15UXD
         jKbWtbO647moDRAKScp8bz8ZcAqGzC2nQZ2451G+YxL99VG8SjR6j7tuD6YhQdI6zIjD
         ElFzgFwMQX0Vkyclp+AjP4WtYYI+gOhfdqYHkEvveGrHT5Y5MOMFeAIrCzFsszG9idCd
         sXITsO4xF5Qy5+lOlyyw3a2XEj4PTfLG73vpuT2AIvABS33c5h5scnUyk7+p1+x0ZCPj
         ySMnStnHJpTZ5ysytIOKwLMWiOXbNNyq7pWvrcT8b/JoUEmdCST4PXp224hs/6yrRR4E
         YJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736771848; x=1737376648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYspswNAJVbjIJeGSav8oevdZS2Al30TlAOrfrWoHgI=;
        b=IClPLNPuSPGWNsrInUwtbCsntYgE5L9r/sQV9IotAHxakil8uq/bTmg2c/atcdWg2X
         4Rj8NuLcG9GUb104fDY4uYZ26ian4QIC4D8ds5LXMcFVI0X1BkGX7sjwB8+E+qLAi15x
         fr+HY9BHR19P4oawaDgG5H69h7vCFmAy9Z/WSNkJKoyFANT2ei07UvxIZvnl0f4KLuLl
         OZZHPsy5THvPKx2seIR6U5A7bK1L/xY/Qa6U2xFXHMdbxeEov28ZcDJqFlD2TONMs+aQ
         IxP5pVYHnKfmxOqlPPVBjrMCpdOhUW99JPN3v7YSBzACnNcmZxeJyVD9GNw1iuEvbDLk
         Dm/g==
X-Forwarded-Encrypted: i=1; AJvYcCUE/bKTeucbCOFROxjgPhB/wKNXrNYoXtXWKW3MWkiizNSgcIdykroOkiQHG6G1EtHSX8YGBiFsk0z2SSVQnA1Q@lists.infradead.org
X-Gm-Message-State: AOJu0YxpSACkyU97NmoBwkhU7m6z4dbIsxyTI2+MuKtDxYcVx1GSxgtQ
	+KgEjbLDz4oiqvbo59fQU/wiZRi4k6i/kKd+hvjGQ4S21/PVzM6Y
X-Gm-Gg: ASbGncv9sMMij2uxopvx1WXkT5t1ybVX+wWXLibZQ5xs8IhKNSm/mJJ0RDWeMaNCbxf
	EYGJQrkRm6MuVkK21hZbCvnuKPBQCF7GzX84tb7uZVDsRVtARpCR+p7sDlfkhFzxqKvo2R5adGv
	cMi163acd5lO/qtMRZXaIzoQXzoTHzwpKIGJSM5CM+zcNpTf6cVrx7W34RtyaH8ia6EVsWqGtHu
	aZmuZb1YhyB2Yt6vdXIooUq60XhWeQuGjAaPG/aHxoVdmkqYQYaJA==
X-Google-Smtp-Source: AGHT+IHe1pVSKvtAf8tEME92BvPU8bFiXiKYwUp2o19enb2ske+ljaAhyVZKHCMtZv5/6JQqhbrv8A==
X-Received: by 2002:a17:90b:53c5:b0:2f2:f6e0:3f6a with SMTP id 98e67ed59e1d1-2f548f3979bmr32049199a91.14.1736771847927;
        Mon, 13 Jan 2025 04:37:27 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f5593d07cbsm8624004a91.3.2025.01.13.04.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:37:27 -0800 (PST)
Date: Mon, 13 Jan 2025 20:37:10 +0800
From: Furong Xu <0x1207@gmail.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, <xfr@outlook.com>
Subject: Re: [PATCH net-next v1 3/3] net: stmmac: Optimize cache prefetch in
 RX path
Message-ID: <20250113203710.000033dc@gmail.com>
In-Reply-To: <f20c339f-5286-477c-9255-e2e1fbeba57c@intel.com>
References: <cover.1736500685.git.0x1207@gmail.com>
	<b992690bf7197e4b967ed9f7a0422edae50129f2.1736500685.git.0x1207@gmail.com>
	<f20c339f-5286-477c-9255-e2e1fbeba57c@intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_043729_513918_E0DB94BC 
X-CRM114-Status: GOOD (  12.71  )
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

On Mon, 13 Jan 2025 13:10:46 +0100, Alexander Lobakin <aleksander.lobakin@intel.com> wrote:

> > @@ -5596,6 +5593,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
> >  		} else if (buf1_len) {
> >  			dma_sync_single_for_cpu(priv->device, buf->addr,
> >  						buf1_len, dma_dir);
> > +			prefetch(page_address(buf->page) + buf->page_offset);
> >  			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
> >  					buf->page, buf->page_offset, buf1_len,
> >  					priv->dma_conf.dma_buf_sz);  
> 
> Are you sure you need to prefetch frags as well? I'd say this is a waste
> of cycles, as the kernel core stack barely looks at payload...
> Probably prefetching only header buffers would be enough.
> 

Yes, do not prefetch for frags is more reasonable.
Thanks!

pw-bot: changes-requested

