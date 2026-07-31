Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FD4C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 13:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q07s+fTeCEbc39agdRyb/qs2zGQJBvKVPPRteZKniHY=; b=OE7kLcyxJAD0GHVj2FIfxjJWrR
	e8eAPLcpj77Z5E2vEzBeB+6IfLhTcENioWU+NM34cUj4LTdgoqWE/JUGFVqBUgpGFmgk+fHAcjc3p
	D9nwXlRdbYrXRDwuUUm8PEIhUQSJT7Y1FumXt5jFV3uoSCIKoFxuiQgFY8it3xB9+B3H9DKROa06o
	Oe/dJpNo+e1vW70heN8oEt380XZBp1H0U26bR9qiJ4k/7FFpIYFdM+UOew09LEi41fLSc1OXA7k6H
	UEayDB7bgJJrRHoqhzYqqqk9MFvR9BIJv/1WGN1g8ZbmgNZzc21/PAuKStlq3peJwlxqWbBEMseu6
	VY8hyqhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpnge-0000000CeRo-2AIQ;
	Fri, 31 Jul 2026 13:54:08 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpngc-0000000CeR8-1vmp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 13:54:07 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c197eaaab00so160113166b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 06:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785506044; x=1786110844; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q07s+fTeCEbc39agdRyb/qs2zGQJBvKVPPRteZKniHY=;
        b=PiSEPvm44RqPtJv/jCGgtQUF0ISEcFzO9QPrIcmZy1cNg3vAuGVNm4AlRBCXvJGQ2z
         01Tu3/opuvVS4mLYXNzRF5SwaCkPF6VLuMamGvu30Pu4zUjBUb/TBWvZz8Z2JKzOTucs
         nnKBBXRtLSu6RKylrlmYiOzQSJatKx50qcP2PTK+8aIQrEKV3o0FN5QcWBHSgdNkE4lE
         HPlGrqFuzZjtCjKbpl/ILo+74bu9bmhmtZBL4l5lRek2KiPJsWprQnhbQsBll0JYYb5v
         yvC+MG4Mh5LGxv/8+oMx1XumCmHvVLuKMj0tNe6EXJayn+XA456+qvBWdYctSoiFG+NX
         mlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785506044; x=1786110844;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q07s+fTeCEbc39agdRyb/qs2zGQJBvKVPPRteZKniHY=;
        b=EhRprRe930udfdEzKKfvVDTBIbrM9BRbWX3W8uwk9TnnyyDD+UGpeIkxJ1DbLLHJAH
         HrcQnFi6hCp3Wp4CD7HMCxLCLlKJUkAybRJbxKKj46JcTJrfwYJGZmaXaTyaj7GE5VSH
         xQwBexiBihmOMnZqFxvMjMtruejfdzgMIZtlM7IKIZtpbNbcQIfQ/x6U481Vc98ylgcM
         gbCCQOAsHjiGHaqzBmKaJb4wGIbGqgkoF4SDmR1DfbUwokhPZ8J7XL+g04mfOBkXeFaF
         nBo04WWIENh5dHQG7uUqQxyYJfEqvRsgTCTuJpAtPP41ymzRqy+45xt+aDJ9WuwiU2Xg
         ciFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp6Zij5TaBDFFzdO8zzfrpZkIgotxPqZwUKgHJ5Bd1hlA9v9zndk6ahLpj3DbRzsU0RCYpj2aXlnBNQ5dZy1UC3@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0W54xhPIippTVhMi0xEGg5uzw4+qIlR8Hm08QaZjLmLVELsjF
	2Dkhh4vCKbT6fuiAoYyzbj1Pb6CGWkTBAmQT23MnJDO9SwyVvaGXodJy
X-Gm-Gg: AR+sD13vkrIus2TN5N65x0cWYhJYy5tDPrJbxfCXWvdl6LLAxd6ypTLxUBcyoTAYTk8
	tV6T+/Bz2/Jm2kQMuc6zr72K/dAisYDp/h4EAp429e+ffyVUu9R6vwDn4x+zu7yUnP4xAy+pSNj
	1g3zt5Cr8FDFCMnIo3WGSlWoS9yWQ+arIRfBksw3HB6QsLqK73Gc3LZdR/3Fya5q/zKG0bVUTTv
	7eWgUk2AjGOdlpmAzvUMoF4Hx4ctvp3BRWfi+C+lg5zQUjT2+V+sVD+Nm7RG1qm31Suy5wbSaZX
	MJXb7yXDU2f+WKg+R4m8kMV1V30JkthP/kQG7GAIvIVHe37c7SeCJM6exUu3/vNQUE67J78FPJo
	P5JtAFSy5jX5nARxUi9MxNrJPzeLS9PCoD9LuHzKHQp1Kr3Z5aMiaDdF29y54vwPNzFgWmfWoQs
	RFSkfFytxxiKihmiWLYQ0y1T18VWW4cywIuNm3a+a4yRP0cshhtxb1Bm1dIYLtZcgtrnyjkaPLu
	4Ux/1iUcyA7XI/6ccVRlDuQt1IAqRz6iv/4S8lXHzdh/RxP3QMSgua/ttY9hsQ9NPTtgE5APbbB
	TzakAIe5QH7franYCTL0thIG/7LbT4yNlCVahX+s+Bm0Y6D/Gc/4AJ/qrVXEJdOfT5dw73w=
X-Received: by 2002:a17:906:7945:b0:c19:fb6e:5fec with SMTP id a640c23a62f3a-c1fd23ccb41mr126779466b.18.1785506044262;
        Fri, 31 Jul 2026 06:54:04 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a8d0-bc01-6d31-3d12-3a11-d2d0.310.pool.telefonica.de. [2a02:3100:a8d0:bc01:6d31:3d12:3a11:d2d0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3ca3b53sm165306966b.24.2026.07.31.06.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 06:54:03 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:54:02 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 4/4] serial: imx: serialize imx_uart_ports[] lifetime
Message-ID: <amynpoQscIXD0fu8@gmail.com>
References: <20260719221014.44354-1-kmehltretter@gmail.com>
 <20260719221014.44354-5-kmehltretter@gmail.com>
 <2026073011-crock-utmost-6392@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026073011-crock-utmost-6392@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_065406_502845_7AA42A76 
X-CRM114-Status: GOOD (  10.85  )
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

On Thu, Jul 30, 2026 at 04:31:51PM +0100, Greg Kroah-Hartman wrote:
> >  
> > +	mutex_lock(&imx_uart_ports_lock);
> 
> guard()?
> 

I'll use guards for v3.

> > +	unsigned int line = sport->port.line;
> 
> Why are you reading this outside of the lock?
> 

Good question. The local variable is unnecessary. I'll remove it.

Thanks,
Karl

