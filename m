Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2912FCD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 12:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eaRVw0ksze4pMdMwnejVPQNu/p5iHH1dKv1uIsvyi/U=; b=3UbVz8W1Jg0MZbZT6Llkhlg7xl
	heku2u4uqL2ezO8uUQkx0CpgxbI+8zzEmHvD1xN6q/N4cp1sctLlIJzbfEaZ4hBIf//LyTmICvZTj
	g5WqWylpXfO/93OeVnSFb0NK5LLow30xws08HhAS8eYAzwDVfSOTYZgbiNMrZabQnC33RS288TqFX
	mHOL9QqiX86tnNz3iwfqVBYHp2IREaN/9TvcaDDZaEB5m4J15ITGgdUOdsecYicUTqfVsDWTaECp2
	NLnXTlFAYBUTv0Vpb4/5SxZ0Sge6sSDY/hL9AQGF/xYpCLLAaz8nTNTFdIu8egDGmuFm5Y4SB70ey
	5R65v1Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTF2-00000000aYV-2xuu;
	Fri, 05 Jun 2026 12:01:37 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTF0-00000000aY8-0HN7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 12:01:35 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4891b4934ffso68695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 05:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780660891; x=1781265691; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eaRVw0ksze4pMdMwnejVPQNu/p5iHH1dKv1uIsvyi/U=;
        b=e4CrlgpVpTFrUpVDekTOz31yoz3Y798MvpUKnF1T6SLY1y+Z3WyJml9VgRE8hTJsW5
         djFqnqSoA1fVEILO+TCZ+1XNZXakpsLKsnrMfHYsjPk0sIrebHxCZ1+tIHpL5EBohtkQ
         +77FYbsLDe5P1j++LxrufAlpUSCUNbzCRVpurxjmKIoYCsdd6auM5b0U73FXAqk9ViAO
         P9jfjtBp6JhrrIEN5xMSEpDx+EpxZ1n7YLxeA31mURII8lvw2+witS1UpAZ7C0ak357/
         n5njAGKOIdnrrrECvFGkwtbc1Ms6JfEpQJRbed72NncmubWsJgfaZ3Mne2q0pG77A2Ca
         KaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780660891; x=1781265691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaRVw0ksze4pMdMwnejVPQNu/p5iHH1dKv1uIsvyi/U=;
        b=Mp5T8aT1MqnKfIb+UUEE4myMLQhZDwZdhvRKuk3yJaXQpMy8ShvF038hh1XLN08E2j
         0dec77RjVtB8qititVcqNF0CH0p+n9n645IfkW5nZ9FRRxojnLWmowctFYQxappKLMgB
         ZPdUJ55fOuJMPLCFSY8SPDnA7ZUrNA8SsNmIeFc7nPzGpS0XLtSNSuHKN1qFvnbxcC4t
         8rEqzEtsAOnf4/TPehpx+7St61djmI7aBG9upS/9aPmERrep4uqKm6LbxA8PwZYjESMK
         qewio8Xk//5i/MqLHm+wgZlIgI6SxJ2aIi2a3U4TCRlGl9qWA1NC69e79aIOqeHK2+lX
         ZRZw==
X-Forwarded-Encrypted: i=1; AFNElJ8EabFNqMKl1/uQa27Lyun3jvpuFUyqDcffFp8tmA6s7H+tVK64Nn2lOmZfD6RgIKYcBLzfvoTIGzuIx36qAuPY@lists.infradead.org
X-Gm-Message-State: AOJu0YxCFXRk8gRnQHknFQFi5lSn2vEjrigDVrezuB2gl5tTu8vHGUyW
	CqkrrpKA08GeZ/SmZZom3v8tvXsKhk9HtcQsw8CfLirua6PdQNwKfxrCD/BinhuIm5Qfs1KM0i+
	mZ8XY9g==
X-Gm-Gg: Acq92OGfo0YCIUyXNn4T7hLSjjNy4FLSulTeMWSQ0WEW487sD/Z59RK5rQWkX3H29Oh
	s07iIemdzpN5lj9hsGvsZ78QTVMuZqMii1mOouuEibimZAPIMxoUvKkzbryXNB+/Hx7hrNMdBsw
	xo1HQImJOkFq4evXoMarUblZo+4AiO0XtWN91dAchiATxqnaXuDUNEN39Qp3dYWzKH/lLxAaEH8
	An7QOyIkgm9bvzYk7GrwcduJW6lA4EljVOcHdhSTdXpUKHcr3p2vaNb+bHMu/DkcFP8mgc1XPMp
	sv8VjnrLCcufGfoJ0AAFEL+7ik7ai6shoOeE7czLDhxvWJy5cGlebLmXWk81kMAfgLJTGpW+N74
	XdcqH0iOx99g3pCj/Gscor23Aj9pCBC0oF0ePFiSf/4lE/2ScBxF2KAI0ENOdO33JH4XP4x+VjT
	oP02Ao+iY0Mb8bifuxpHCEFdbtB+XxAzW8iWvYV8B1XPPRRGKVspgtqb2ygy9Lzt+9sKNQyIImP
	jA5HZGQ
X-Received: by 2002:a05:600c:896:b0:490:ab15:b9e8 with SMTP id 5b1f17b1804b1-490c2c782fdmr493135e9.2.1780660890657;
        Fri, 05 Jun 2026 05:01:30 -0700 (PDT)
Received: from google.com (220.71.199.104.bc.googleusercontent.com. [104.199.71.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc4082c3sm144221845e9.13.2026.06.05.05.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:01:30 -0700 (PDT)
Date: Fri, 5 Jun 2026 12:01:26 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, catalin.marinas@arm.com,
	jens.wiklander@linaro.org, sumit.garg@kernel.org,
	vdonnefort@google.com, sudeep.holla@kernel.org
Subject: Re: [PATCH v5 1/6] optee: ffa: Add NULL check in
 optee_ffa_lend_protmem
Message-ID: <aiK6lgW5YFWSMTxf@google.com>
References: <20260526151934.3783707-1-smostafa@google.com>
 <20260526151934.3783707-2-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526151934.3783707-2-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_050134_134300_08A05B2F 
X-CRM114-Status: GOOD (  17.39  )
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

On Tue, May 26, 2026 at 03:19:29PM +0000, Mostafa Saleh wrote:
> Sashiko (locally) reports a possible null dereference under memory
> pressure due to the lack of validation of the allocated pointer.
> 
> Fix that by adding the missing check.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/tee/optee/ffa_abi.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
> index b4372fa268d0..633715b98625 100644
> --- a/drivers/tee/optee/ffa_abi.c
> +++ b/drivers/tee/optee/ffa_abi.c
> @@ -698,6 +698,9 @@ static int optee_ffa_lend_protmem(struct optee *optee, struct tee_shm *protmem,
>  	int rc;
>  
>  	mem_attr = kzalloc_objs(*mem_attr, ma_count);
> +	if (!mem_attr)
> +		return -ENOMEM;
> +
>  	for (n = 0; n < ma_count; n++) {
>  		mem_attr[n].receiver = mem_attrs[n] & U16_MAX;
>  		mem_attr[n].attrs = mem_attrs[n] >> 16;
> -- 
> 2.54.0.746.g67dd491aae-goog
>

Thanks for fixing this and for including my other patches in the series
Reviewed-by: Sebastian Ene <sebastianene@google.com>

Sebastian

