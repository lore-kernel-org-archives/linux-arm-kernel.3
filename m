Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F63BD6A22C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 20:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3t3j3ES+KMYiY+uHRfv46SZpfLjb2BlkXR6mS0oLpes=; b=ofgh1OdXEWPROL3AIYzph4R7PP
	vaM5VjPRBBkIl+XZxwKVGhqjEUdzrHbGB9ojMt7G//6V7N8AUbXzEZTtBXprQuXX08Bow3Bfy0IvT
	m1LsrtdIvADN7H/83BvASEYWofltgB8lAB14/MXEDK0XY5804yJMxLv4ehrf5B42B1yfZQ9gWfJo2
	pUghPm2/AyEG4zYfMgOpZsRb/2cD8ycDuT3ebYpie9VmkzMOcxFdKKMUHWdCP2MDoewUN3GcWdjmh
	qwm9PNkfg9OFk8UQhi0cJVCzkjZ2yHkqZHR1RpVQjbxM5LN1iwbOfICmIXmzMzJ7JG0p6UttlRjB4
	thf1CsJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgNk-00000000kSt-0uKe;
	Thu, 14 Nov 2024 20:24:00 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgMo-00000000kLe-1s0c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 20:23:03 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7ea8c4ce232so1028153a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 12:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731615781; x=1732220581; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3t3j3ES+KMYiY+uHRfv46SZpfLjb2BlkXR6mS0oLpes=;
        b=HKxEdlEEfdMciIrnrlpzIgx4x72LCYgdTNkdPieuEL5snRGCS7K/bUuSeG26gq9ZJh
         TDOUGOfrxFLXwznTyuMxb66vY1Ro244qGUSlLikxkeS4O2K1o9AUx7UzDMpMkQbiJkEU
         ZFR096QR933Bdyw2U1stFGfzqO7yv5vwVElflmhmgE9MvsemHT7MW23iq8ClzAjNlxtX
         8kWcDowSmxNfZtcwU+T9nsDV6KRnwhRb16e7q8AoIDlxtNaeu8dL0ozQKfq1ROGaKM6V
         3Iew98K5S5cVaGWf8ckM6o5absb2R4nBDMgn0FVEx6ICWsRTTsSg2Od6ddeqEi5xG5Ny
         nFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731615781; x=1732220581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3t3j3ES+KMYiY+uHRfv46SZpfLjb2BlkXR6mS0oLpes=;
        b=goB8jTCPE4D1gVwLXU95ZxO2ft1jBxXjCa8DjE9DWHS+mkuIDzGjorvMpQEkqN+7yf
         msbF+m3LjqZpifPbnZGKEu5bEK2UBxCGHv5pEyCfiyAlyQWyjAmh1tfdDQidFOZxC5cb
         0gsu99TOpfTcCk2oGu+/N+l89aUVQlaQZcP6r8me8RuFXM0QPcDWgmDeSZoMvXUA4kQC
         DhRYoeSXHvytrDTR/YkzkHlrv0wFm1Sl/miLwFPuVlmFpjdjm1DrMKv35b2HJDGkMfLF
         wELK/WEt3YM0mWwF0fLqWfiUpDHWwKYWy+hSR0jzAGanFJ74AyLAm8/axPf59sOJUj7f
         hLdA==
X-Forwarded-Encrypted: i=1; AJvYcCWTiFyYa5hT+ejcTZLTCg5xqwvbeOumQug7qJ1oThao1JVTHi5lNKBOxkOkHLyNtOKHdsMdYINwvLrKQ1g2gmZn@lists.infradead.org
X-Gm-Message-State: AOJu0Yww1ua4Zu/+C1ihzZvViiU9ZllW9zFVkweXGDBhWYBc/gXD2z3K
	kdBs0eYTJtJPZ6vHyoUPf4AjXMbuR0Yj3glYppuJKHr55KjsMgNLSQZGoIGrp0o=
X-Google-Smtp-Source: AGHT+IEWrtvYg0ycOEPvYgPz1j1Z/Gs2uiPWVaIPMlwwfbfV9OSuuEkejTWFwmCY24eOW9B2M742Dg==
X-Received: by 2002:a05:6a20:7346:b0:1db:e9f6:8dd7 with SMTP id adf61e73a8af0-1dc90afcb5fmr65998637.1.1731615781071;
        Thu, 14 Nov 2024 12:23:01 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:d240:c440:31fa:1568])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72477120aa5sm39076b3a.79.2024.11.14.12.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 12:23:00 -0800 (PST)
Date: Thu, 14 Nov 2024 13:22:57 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v13 4/7] remoteproc: Introduce release_fw optional
 operation
Message-ID: <ZzZcITZq/U9SOqnP@p14s>
References: <20241104133515.256497-1-arnaud.pouliquen@foss.st.com>
 <20241104133515.256497-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104133515.256497-5-arnaud.pouliquen@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_122302_495366_4E45B757 
X-CRM114-Status: GOOD (  24.40  )
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

On Mon, Nov 04, 2024 at 02:35:12PM +0100, Arnaud Pouliquen wrote:
> This patch updates the rproc_ops struct to include an optional
> release_fw function.
> 
> The release_fw ops is responsible for releasing the remote processor
> firmware image. The ops is called in the following cases:
> 
>  - An error occurs in rproc_start() between the loading of the segments and
>       the start of the remote processor.
>  - after stopping the remote processor.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> Updates from version V11:
> - fix typo in @release_fw comment
> ---
>  drivers/remoteproc/remoteproc_core.c | 5 +++++
>  include/linux/remoteproc.h           | 3 +++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 7694817f25d4..46863e1ca307 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1258,6 +1258,9 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
>  
>  static void rproc_release_fw(struct rproc *rproc)
>  {
> +	if (rproc->ops->release_fw)
> +		rproc->ops->release_fw(rproc);
> +
>  	/* Free the copy of the resource table */
>  	kfree(rproc->cached_table);
>  	rproc->cached_table = NULL;
> @@ -1377,6 +1380,8 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  unprepare_subdevices:
>  	rproc_unprepare_subdevices(rproc);
>  reset_table_ptr:
> +	if (rproc->ops->release_fw)
> +		rproc->ops->release_fw(rproc);

I always thought that looked hackish and brittle.  I am trying to find a better
solution.

Mathieu

>  	rproc->table_ptr = rproc->cached_table;
>  
>  	return ret;
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 2e0ddcb2d792..08e0187a84d9 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -381,6 +381,8 @@ enum rsc_handling_status {
>   * @panic:	optional callback to react to system panic, core will delay
>   *		panic at least the returned number of milliseconds
>   * @coredump:	  collect firmware dump after the subsystem is shutdown
> + * @release_fw:	optional function to release the firmware image from ROM memories.
> + *		This function is called after stopping the remote processor or in case of an error
>   */
>  struct rproc_ops {
>  	int (*prepare)(struct rproc *rproc);
> @@ -403,6 +405,7 @@ struct rproc_ops {
>  	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
>  	unsigned long (*panic)(struct rproc *rproc);
>  	void (*coredump)(struct rproc *rproc);
> +	void (*release_fw)(struct rproc *rproc);
>  };
>  
>  /**
> -- 
> 2.25.1
> 

