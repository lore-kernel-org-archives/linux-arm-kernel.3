Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECE8C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 09:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qqCVPwdqyK2Ili+2+zXGFMWFYgYIwIsQtKu/VjLpL8=; b=n4AOjQ3Hund3hAxOY8cgcj3dVW
	K78op8rceEpmRJ+EKwb09hdXBdtsd+ixK2AzjbqPLkgfSRde23GBgzYcK/y9scAIrqlAj5RVFhIBQ
	2VHZNYc79mv61C1MdcTp/9z2fdFGcy5pzB+yT5ommlaOK3CdfjqvPt8hcsrrmZLYKE+0bdpQ7/M0H
	e2d28QyZ7jiU4GkKmvC56huch4odJCGgoIrZz5rk39WG86iQKDGyyYH90+WdI/1+jxClYE8zabaBu
	IHHGPPOoxxCJ6e5hDKqw6mRbSZr5FcunmgBs2nv4Ebq2nozdAtYmBIEGZhJ2qo1ZqX1N+C22UTmat
	D26nV1qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJh0-00000007SSa-3gCr;
	Tue, 18 Feb 2025 09:15:02 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJR5-00000007OPp-2vQY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 08:58:37 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-220c665ef4cso76142775ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 00:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739869114; x=1740473914; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5qqCVPwdqyK2Ili+2+zXGFMWFYgYIwIsQtKu/VjLpL8=;
        b=MuV51nFuQkws6SC1FoHjGatTAQPvCmUG36R4cXnN8zFb1u8+Elkp8TB4cMgn+oKTmW
         6hzPUFwhUyKt5NOJ6tHiRMCwJN/dJBgygLGzhxkDORSCmw0ob6Wryb3id72uB83Y7VhW
         eQHtCqbNRgBTseztLYnMMnHP1j2dPDj2POhkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739869114; x=1740473914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qqCVPwdqyK2Ili+2+zXGFMWFYgYIwIsQtKu/VjLpL8=;
        b=pcC/4mphOkXW78udN80G5XpP+Z91sNLgkKTJBLkYb75HYGfvZQxR1hA4vicr8eCvJN
         C37BO7CNIbxeXU1vfaXBJh0BagUiLS5wMTefeBFBND8/Y30bi4VaFn+W/9t3l0n9KGIt
         xRBgkgvEWjdR51ZJS4gXXEFZwjJwPDQ8MeTpsG5ehXIGBagEyTSCJbjIwBxzHK1EggTX
         rs94NEHnGnqcpOHnxSyqX/dFOHcz22qhgXEgZoGubqmVlUUOAfICdUmG5z3QCkv8jWPv
         RnN4l6z/E02+NELHiPzlcCzm186N6bfakEIgqVFuSlYownD2qXhVQ1Mxoq8spP19DNTr
         6tew==
X-Forwarded-Encrypted: i=1; AJvYcCXTLzsGzYV8YrhCCrJ3exSSsyPw2CoWiAQKFHATRrXm8sGMdzKUCESSp3OsCdfxiux/v06O37rZ/h+RnEfS83u9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0JF8U7CbOcd4xWTANYqh40cFv2gNwjTYbtamN89bnGcu8MaFC
	Jc/V0lYwHwSOdYw9RVcAabO5NOqE0DSP3knXv4NhR9ttukNseilVa0SBsu1Srw==
X-Gm-Gg: ASbGncuUCD6mCZgQFDT8XCD2FZkVdOqcCM0ShZ/muIxikRSKIhGsfSV2mfthnvsyoND
	yaWfoL2g18zLcMsrq/R/80UUL7iaZc2MpnpD6QxIzueA91M4E+CIDu4SjtTn8wf4fJI2CwkjHSo
	FrduwP6skpmg9w5hDRfp8g/a5sOTaqJBSPPnVnH8lEc1EJlxQM2pcTmcSAC2P+8UxcXdppHt+gT
	2S0tGZy3ckwuE+iL43mQzPmSFg/VMm1yQNxrMb+mgTPrqrgxONuj/cM6R10CrEAB1aG7SUz/vw0
	1IKQG2VuRQ9liPqbQ4A=
X-Google-Smtp-Source: AGHT+IEEOJtMg2r+ExCu5k7nAqe+yfuyqpapvJqV+nJnjxWfgOfZJYnuiAmofVtL8kqiPugF9s2+qg==
X-Received: by 2002:a05:6a21:790b:b0:1ee:a914:1d64 with SMTP id adf61e73a8af0-1eea9142045mr12447625637.28.1739869114293;
        Tue, 18 Feb 2025 00:58:34 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:e8b0:5a6a:30d2:a33f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm828296a12.51.2025.02.18.00.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:58:33 -0800 (PST)
Date: Tue, 18 Feb 2025 17:58:26 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Eugen Hristev <eugen.hristev@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org, kees@kernel.org, 
	linux-kernel@vger.kernel.org, johannes@sipsolutions.net, gregkh@linuxfoundation.org, 
	rafael@kernel.org, dakr@kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
	tony.luck@intel.com, gpiccoli@igalia.com, pmladek@suse.com, rostedt@goodmis.org, 
	john.ogness@linutronix.de, senozhatsky@chromium.org, quic_mojha@quicinc.com, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com
Subject: Re: [RFC][PATCH 07/10] printk: export symbols for buffer address and
 length functions
Message-ID: <20250218-175733-neomutt-senozhatsky@chromium.org>
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
 <20250217101706.2104498-8-eugen.hristev@linaro.org>
 <Z7RELnyWRLietj9b@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7RELnyWRLietj9b@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_005835_762273_BED879B5 
X-CRM114-Status: GOOD (  11.04  )
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

On (25/02/18 00:26), Christoph Hellwig wrote:
> On Mon, Feb 17, 2025 at 12:17:03PM +0200, Eugen Hristev wrote:
> > log_buf_addr_get() and log_buf_len_get() can be reused in another module,
> > export the symbols.
> 
> Err, no way.

Yeah I think we've been there before [1]

[1] https://lore.kernel.org/all/20230905081902.321778-1-hch@lst.de/

