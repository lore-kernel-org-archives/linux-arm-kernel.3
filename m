Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E9FCF5368
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 12:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OgbVi/i2e2FmnWnQxf8m0K4GdKARclUd2e4HuJyv40I=; b=ZUvXnV/NLMkUm8aaQRBjgLka6T
	5Y5fTZRDeER5NdQS1V5Wm08pF71Icnkxcux397Nh7QXKzNWVoN+1GUD+j5IMrugej8AtrlLbj0B3n
	dRJ795IwCju3Q1BSirnaHX+beXUrj2vew8gWuqk4Ur2qYxj5fPxuRKraUCrTJwvhN5WHihIH58qnl
	0ATsGE8HhUdYrmVnyf5TnQqE1hhQ8S7cnzNgsiw9r9Be2V4EDf2PFq/DxmwSf/jRCSy/jpI0tknaR
	oSXqk9LCpYrzVvU2wP+2FIGUYy2+N0Gw84pr4rm6RytP60lCda7S3pd0kcuxEoM60rKUJM7LfSK5a
	sInnfCtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3aLH-0000000EIJD-3nvd;
	Wed, 23 Oct 2024 12:19:59 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZqC-0000000ECnd-1Gje
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 11:47:56 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43158124a54so9204115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 04:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729684069; x=1730288869; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OgbVi/i2e2FmnWnQxf8m0K4GdKARclUd2e4HuJyv40I=;
        b=j9leUU7ul+0/wgEKKPEv8EuYWNNl+wVNU8IABySM18veBtcHOfCNT2FDJTQ9Cdx3/c
         fF1YesVgRiJXk6lkdazn4ERmJ49kTwfuIcFZpuyqyjjhDZH+20magkCQEF8A1e4E0LpQ
         0Cp0tDB02zRHx0GOqAF+ex2nCdlcZgUlaglQo4junYctEMvx2p4Q0MD78iRZdyIWtFvi
         a02bR5L+35jk4d2ZeG6BkmC+WyNZ/+rIq++VAJn7gCEs1spCg2gLojZEWuMwAWJyxUbl
         9A+AQ93rHK/ODdSnYVlbkyl5lT9LGuN/kcFuVA+uRFq9XZzdl9Q81ZhymKkQZk58DL11
         vcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729684069; x=1730288869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgbVi/i2e2FmnWnQxf8m0K4GdKARclUd2e4HuJyv40I=;
        b=a3/6DM3nQ10P1r2LGrbm2ZZB42Y9FbmnfgpjVeCrVl9Br226nqhAyb0HuChrZpAfeB
         /XkNWd99qef4PCGbQEr53cG1r70VN73avgsXai6lxCZKxJRrxR7BDumU8m78EwDJhhyu
         pGNwNy4/IVxiJdI5PQYWCkhcvKUHZe129w9aY6kyy4T3B5a9XJCJAkE3E5T0MrJrFtq5
         N84YECKaFUQkAlP+LkmKSjyhBXorWcmA5sZF7sUvB7+u1htkAeB6KMV4BERI3knXXnTk
         5Ft9qwZCkR89haywit1HWc165x1ehwCJnGIShVTHu/xmkHFwXU8uPPUiyWdrZZeicrEh
         eT8A==
X-Forwarded-Encrypted: i=1; AJvYcCUKy0iIVBtXiJjt7EJGSot0qU32EhBq7xX/3/Y3mKn9ISUljQwFobiFwv4EdmbfTsUrtk0OXqU/St/uSs4toOkF@lists.infradead.org
X-Gm-Message-State: AOJu0YyM86Wps0FZs4Y68cXtDpnFM7TjCQ+IuAYdSMvRGsXwRRjFQ+x2
	Pws9A5V7X11A0p7g04z4MpsDxOUAAi7oyh+6AxG3Q/TcibG+5Fia
X-Google-Smtp-Source: AGHT+IFsl0LMOEc+eE6a6V7EEbrOWyNMM3oYwN8FcBYWoU6umXyuPcwsTMJnCTtKZSWtjLAMEmlNCA==
X-Received: by 2002:a05:600c:4507:b0:431:4e73:a515 with SMTP id 5b1f17b1804b1-43184144103mr9125455e9.3.1729684068910;
        Wed, 23 Oct 2024 04:47:48 -0700 (PDT)
Received: from skbuf ([188.25.134.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a48882sm8692867f8f.30.2024.10.23.04.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 04:47:48 -0700 (PDT)
Date: Wed, 23 Oct 2024 14:47:45 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Simon Horman <horms@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
Subject: Re: [PATCH net-next v3 1/6] net: stmmac: Introduce separate files
 for FPE implementation
Message-ID: <20241023114745.kxntjsjgzzaf4lvz@skbuf>
References: <cover.1729663066.git.0x1207@gmail.com>
 <cover.1729663066.git.0x1207@gmail.com>
 <49e20bbc94227cc4368dba01016df40dc711ad0a.1729663066.git.0x1207@gmail.com>
 <49e20bbc94227cc4368dba01016df40dc711ad0a.1729663066.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49e20bbc94227cc4368dba01016df40dc711ad0a.1729663066.git.0x1207@gmail.com>
 <49e20bbc94227cc4368dba01016df40dc711ad0a.1729663066.git.0x1207@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_044753_182639_5EC8A18C 
X-CRM114-Status: UNSURE (   8.36  )
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

On Wed, Oct 23, 2024 at 03:05:21PM +0800, Furong Xu wrote:
> By moving FPE related code info separate files, FPE implementation
> becomes a separate module initially.
> No functional change intended.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> Reviewed-by: Simon Horman <horms@kernel.org>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

