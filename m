Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A55DE6F062
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 14:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odFhpibLPvwuhQLLhb1fVT+w+/dlMBz12uJSK00SoM4=; b=b0tXdo5KS/k9EmQMQkzxTTtPR/
	7/nrgVL90TqmqjY7c48KVoJNtwwYmDRefgDQ36Hb9tNYa7O9og+yp/Sa80lgU0Of0yWEcBXxgr2ua
	NlJOgYtcQewAqebO93rxepvnzmUr3fCMJPQiDQlAxWT8NbmQWWxkCYQ0KE+Sw0GIkyk6xakvMvHTS
	j4Pxh13HW6dyzkJta9+AlXDd4XdrCxNt0HpTvLNQn+gu5xuBMV35SauES3W/3Z68NxLvqNZLE3M7/
	yo1xbYxRl16bgViAIHD79JWbTSfPN2yJ6ImuJIfOLGp0NNQGZao4J0DGQalvWU8DZEkqkUaHkk3Z6
	lPHjMV/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6szH-00000007OpS-2pzn;
	Fri, 01 Nov 2024 14:50:55 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6seJ-00000007LDR-1Sxo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 14:29:17 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4315dfa3e0bso2081325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 07:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730471353; x=1731076153; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=odFhpibLPvwuhQLLhb1fVT+w+/dlMBz12uJSK00SoM4=;
        b=kIEtTmItJDs8I8lHSdm1F27v/sqS5KiS/AdMZs+I5jiQ1j0EbkzNOfFft+IW7Jr4At
         BItj5yLAl4Zfg6dufGkbtwLsvzEIvB/ua/TAqFfGuGEDg4QdjkgsKgEj1hi3rrIhPmJV
         WE+qo8bkfXohZI5mAfzo/oIWVWv6WHFiPR2PsYsdHh6ep46w/N4ggsTbugM/4CWwU4Hg
         8pjzd0GDgFWFHxDO9yqL1Yv+HP9d8enPTo6vQ+xODetn43/8bY2rArjN53mnr2Tsql9U
         2HMbmyy9efs8ZiJ2V1y6Fi9p2nmSpcYQ67AM5NLiipC1AFTEbvj6npLUh8ycil2oJFtH
         mvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730471353; x=1731076153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odFhpibLPvwuhQLLhb1fVT+w+/dlMBz12uJSK00SoM4=;
        b=WWSRTa+WfWT7HB2cwA8EL7OgXLV3K0Bnn3lG0BFf8NzPJA7hRjVc5saHe7hiWgceQU
         HtqNhttFpyErRZHszlnkSMPC0ixTG/wOq4OOcm/W5v1aVNXAFh7OQG1/YASrLutdYMyF
         kSaobydnRbPciCur0oNc+h/qoLNjYlGU5zbNETgK+tzZ8Fj7wA39kXEmZlSxwJQsqt9K
         0ogz2GHmVfGRj5eRBOCscyzS5f0TgDtDYa65s7SB3pnOB13hTZ1EANdHmzoFyHmqWjmN
         +jwOr/q4royycOGGUqvQR8nrW/XhD7yF2mUmYnokegrHFJ98osE3Undro9vmcyL1OHVP
         X33g==
X-Forwarded-Encrypted: i=1; AJvYcCUKYgcHyDDiz6Y4J/Ceyo9XV5Ff2tFIn/uAxMQRy3c+uydSPR2T5hgf5eB8Gth8+cbNqeQlY0dWYNASbH9Jx5wS@lists.infradead.org
X-Gm-Message-State: AOJu0YznQFJBvU/ksYZEMTJFUY+zJaQ5VpA2hQa34IWkLM1TXhPeEr0r
	Ylv0gPQ88mniDVnyO4YREwJrcsfGR2R4iiEyrt+8u6efxXGajlBu6nKPF/Dq
X-Google-Smtp-Source: AGHT+IEEMVRXqLdwmJV7pRqfFpEUN3/kmvstqI5JyyZgowwwoXMF0vgEs0QQNJ4tL3FcNqLPsYwFmA==
X-Received: by 2002:a05:600c:3542:b0:42c:ba6c:d9a7 with SMTP id 5b1f17b1804b1-4319ad08603mr88397485e9.4.1730471352892;
        Fri, 01 Nov 2024 07:29:12 -0700 (PDT)
Received: from skbuf ([188.25.134.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d685287sm66007415e9.35.2024.11.01.07.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 07:29:11 -0700 (PDT)
Date: Fri, 1 Nov 2024 16:29:08 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Simon Horman <horms@kernel.org>,
	andrew+netdev@lunn.ch,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
Subject: Re: [PATCH net-next v8 0/8] net: stmmac: Refactor FPE as a separate
 module
Message-ID: <20241101142908.ohdxsokygout5mfs@skbuf>
References: <cover.1730449003.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1730449003.git.0x1207@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_072915_443325_AEFC1BB3 
X-CRM114-Status: GOOD (  12.44  )
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

On Fri, Nov 01, 2024 at 09:31:27PM +0800, Furong Xu wrote:
> Refactor FPE implementation by moving common code for DWMAC4 and
> DWXGMAC into a separate FPE module.
> 
> FPE implementation for DWMAC4 and DWXGMAC differs only for:
> 1) Offset address of MAC_FPE_CTRL_STS and MTL_FPE_CTRL_STS
> 2) FPRQ(Frame Preemption Residue Queue) field in MAC_RxQ_Ctrl1
> 3) Bit offset of Frame Preemption Interrupt Enable
> 
> Tested on DWMAC CORE 5.20a and DWXGMAC CORE 3.20a
> 
> Changes in v8:
>   1. Reorder functions in their natural calling order
>   2. Unexport stmmac_fpe_configure() and make it static
>   3. Swap 3rd patch and 4th patch in V7

For the series:

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

