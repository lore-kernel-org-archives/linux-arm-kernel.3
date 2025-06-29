Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D76C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 18:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8592xP+JE6KeCXGDCqNX8dsf7ApqXKNRZpKKe+gG7o=; b=KKCPIZ8Sqig7gSEM3InAAVumuS
	CIrdTbFZDGIA0zPG2i9Z1Z7HHV+++dw6pxWzvjTPq/mSUgO1pnp1zry23daWlFgewx4rqLL9bDG5E
	47FrKv3zA5Y7bF8xUmQcKkNKccZ9P6F4DBAfQsP6CVeuhYxpCXWmcpNZYDwd64DgPZBVKfIIRWNXy
	jlKTN+eXJMulePxux97JXPUCGH+k4BrplyISHPqYyKz8SUTvmhLnp0CbLDrS5g01ItooRWyj1V4CN
	Bxw5umYocTEsJl9ndlbcZdct4quy50M+AVteue33EH/Q4gNk4LnZg9LwR8abZITpFt0QHaSZZ9aNr
	gbwOEC1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVwxh-00000000aq3-3uN0;
	Sun, 29 Jun 2025 18:41:09 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVwuI-00000000aYE-2a0m
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Jun 2025 18:37:39 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-451d7b50815so9246425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Jun 2025 11:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751222256; x=1751827056; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j8592xP+JE6KeCXGDCqNX8dsf7ApqXKNRZpKKe+gG7o=;
        b=WQUPt9f9XVfEq297gu94DZ13zQqYHX6QPTKRB82r9i7IOH2NDBlwVMj6E6nS6ociCr
         1ki34d+3zKa4tf7F8AJzoUOa+pD+4VyOyKg4MoSuopvlIYrRHPlKEWw3wxYbuCpUX+rX
         Au68esUS0hZht2ktqKSRqFbA6UzulUKOX/j53/FGTxiYv7hTnW9Ll1gDd3SN7KLPUb28
         5CBhe1Q6lOJXt93agPZDJCZ8cqB1kCP0T+6noMl133NtBgWTZx4N8cwa2v9W/Y4UaGEl
         BSu14WXIooi8ZyQNT1kG+X4OqaiuHpI1yF1NZ2LgP4TBUa9l66awZX12ul/jiPS32hfk
         vygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751222256; x=1751827056;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j8592xP+JE6KeCXGDCqNX8dsf7ApqXKNRZpKKe+gG7o=;
        b=RY6meLx28evcTjvLLobe8R/aAOp3OcSnJuCt62Xq7HceuC14nq2nudW0c2KMO+td9c
         L3m7bPRZf+1oQ/fYfjMpu9dXCfTMgvq/RLJPNCdV+J9vPIKpnkjQYPOfoll7UafWXjD0
         Pn1z6fSQbpZ8Bs/IJCzxnFP0N4LetukOZSUe3X+YZks4voa1/7vRj0Vh20/wqyHkRCKV
         3T+eozo6yNDp/8YuJ+P6TV2lEwzHahrKyDKpd2MUsI+96pF3jKPm3UH8mHNcnTUW0xhV
         Rkcs2+XbZBGRNiqfZ+6kbWcsrwU+YFtB8orhaPSZxXpvadNF5ejUMWgFX/x+Ce7AEfMh
         m8OA==
X-Forwarded-Encrypted: i=1; AJvYcCVHhJ/7amWhL4WJF3cjQhSMX2MBPU477JP2soXYjZknMQ/K1w/zAQWjk59qTtt3FUUBplH5fe7acXgxcsGSOYa+@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0QFHBJTriubhCizta9de0TkLD0LjNZOp1GdsVBeLI5ISNH+TK
	6/isPodlNg6NDiolZVZYarKk/amDw6g14etU0BfvJtrRMpLGQ8J89mHQ
X-Gm-Gg: ASbGncucx38K1B/DkLU1qLxo0oCQuDhabSvsuuzWb0KD3nZfqpxiI6WMD9/8cSS5HSn
	/wdkH8KzblFMYfhJd4cGpd0BW9UcDqQmFL6vrGMCigmCg+94zvnhThfLMz1BxZEJ4YfihLLpHEj
	r2TbKjRFFZdp4lvHz/miZN+GuE6asd3KN5ftB4Xi/WJJTx7GaL6xE0nwkQ4bCyIc0EHiPM9l+/K
	7swSuxgrbU3hGrZ2UKqbLLq6B/pjC1AHQTbypfKA6CEpAXx6ePSNC/4hD8cQ9syez+Qu599xwb5
	N5ZF5c7tVBj3XbsyPoecM9qw50zQiRjbkVjCwRIQ2qHHqqy4iwt/YZnNG7r/DHo=
X-Google-Smtp-Source: AGHT+IFUvGyHpZ0G55OgsZ+L5rcXJKuJV0BFFbxOe9Gz1CCPK1gH8KNx/GR6MT+iyUETgIG6fe7iHw==
X-Received: by 2002:a05:600c:64cc:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-45392b98066mr92287515e9.0.1751222256133;
        Sun, 29 Jun 2025 11:37:36 -0700 (PDT)
Received: from Red ([2a01:cb1d:897:7800:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4538233c523sm141486835e9.6.2025.06.29.11.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 11:37:35 -0700 (PDT)
Date: Sun, 29 Jun 2025 20:37:33 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/10] crypto: sun8i-ce - implement request batching
Message-ID: <aGGH7RH8-yHVVz25@Red>
References: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_113738_654653_5ED79333 
X-CRM114-Status: GOOD (  12.67  )
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

Le Thu, Jun 26, 2025 at 12:58:03PM +0300, Ovidiu Panait a écrit :
> The Allwinner crypto engine can process multiple requests at a time,
> if they are chained together using the task descriptor's 'next' field.
> Having multiple requests processed in one go can reduce the number
> of interrupts generated and also improve throughput.
> 
> When compared to the existing non-batching implementation, the tcrypt
> multibuffer benchmark shows an increase in throughput of ~85% for 16 byte
> AES blocks (when testing with 8 data streams on the OrangePi Zero2 board).
> 
> Patches 1-9 perform refactoring work on the existing do_one_request()
> callbacks, to make them more modular and easier to integrate with the
> request batching workflow.
> 
> Patch 10 implements the actual request batching.
> 
> Changes in v2:
>    - fixed [-Wformat-truncation=] warning reported by kernel test robot
> 

Hello

Thanks for your patch, I am starting review and test it.

@Herbert, please me give me time for it.

Regards

