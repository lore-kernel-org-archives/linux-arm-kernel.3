Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343ABCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 13:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lUlOSe5A8lNERyF+m/EbmOxMTZ4XiY1F/mU41HusoYs=; b=xMLhBsLNjkAzJ2CYoEd4ESr9ao
	OGNaChYPDkAB2vwW4Tn2FerghfAMAZcGbSiEwHe0w1VDbL4SVIUmtMzdmKooit+p0ht1HJA1iX37D
	47up4T3rJYQdsZvuw6Egle3yiubRMUuiyUEAAcfvzeKByaGL2l+1apcHWTgCORgQa/iLwhSIoZtNL
	8juWtwMHNS3IME3QFJLniHkjQUuxQKW/p8rYzdECThlIlXGnlAqTHap31uMehN3cW7oFOLxSZJACe
	NW1rCiN3IJMj714xfhiqSrD3dBd5LonOevxHjEgIm3oqLCrstLt/VZiB/Bf23SIA3XqhUFVINPcNP
	dXKBI0zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDiVU-0000000GUaG-0DS4;
	Mon, 05 Oct 2026 13:13:28 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDiVR-0000000GUYi-11f4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 13:13:26 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49d05d51553so12577465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 06:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791206003; x=1791810803; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lUlOSe5A8lNERyF+m/EbmOxMTZ4XiY1F/mU41HusoYs=;
        b=ELn9TZ+pgCEd0dwFFbaUwISj+gIqFA9+Omz/zKp/lPBUXnumy7fpkKuTyODtujmt9f
         BZ9sjW7BN3hCvqpaKGemIhNZE89P//trzz9Ab1n5AqqiUWNsPCKYE2qLa5VMopBBfK8A
         6dHonrt/vyq4djGpXuzkrEL8oY2/Pct5NZTAeaqETpFjc7U2lqBxhTgVT0sEqYexARE6
         8tEepSQFuxR6vJVWf7OwXPKAIFbGTiPwCgqhW9iJ1OKicC8qkFZhQ5o1iWE7v0yxdcjl
         hMfsewf+kJ92Fg42KdKqtwrX9fUOZXGMEZwjbC+VjsWRrUq2DLnZtSq8XX3Q9X1Ns6z2
         kufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791206003; x=1791810803;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lUlOSe5A8lNERyF+m/EbmOxMTZ4XiY1F/mU41HusoYs=;
        b=lbk5JUZVVUrgh9JOMNQl6yJaAqgHfspgmy3ozT8g3W6QtYmA5zXk2M3hmRyoy3g7pm
         F1euiH6kau+y6K80emVfGIH3+U8hYW5L9gDjvHUo81JaQtzFOJVcBlKlizLHjEERLUxo
         CfZQFkpfg+m5RMWFMaWFjQiVRTYcIqqM6TINi4kY4Jp0DC3V0VuZ3jkMDD9X7yYbZ/zt
         BiPmpSWm1Ci9CJ6l3FZX9ijnlv+Eo8oIvFOqF1sWdM2NIsRxu6I0xR7cplGAaamhg8f1
         XBpw0P5dXGrG+IfrJ2e2XCtMznpuo0/cuNnOeJOxNkbYsbzpN/NVuwGnmcRcwFYKDo0m
         0slw==
X-Forwarded-Encrypted: i=1; AKwUvBx2EMblz1zdeNduCQP4NVh1aYoMA/09K6oYqxjXbXPH2NedvtTF+y6kb+y0M8hvioOWi0K6a+ThJtrliKQrfmsf@lists.infradead.org
X-Gm-Message-State: AFuF++nf6FctxvtQiGCqtTzuF0DdTHZd0Huuzz3BJBp1FrVHxF51kXYo
	e9btLkBHEa2j8ChAJd9ePF2NE0K6Cz1leD+H18ysvqiczFnXQQ5ysfFh
X-Gm-Gg: AYBFou175u1WlJFMYV0CCE1tFqNbjvarY+mvh45wUp5JtuBvWwM7+itMsHMePJlxM9p
	qXD6trEHTaH3qk49SfC7Q1HHLKu05vmCeP0WBxn+Y3HEuLhHu2PQsFdPHYW+oAUY+nlGhHHJF2K
	eP8ci7tOWzyJjLn1fssLMwHebmlokj8WmaznHkOspjYN0y0DuUnPVj8sJqVv4YFU9h27jy5kbot
	iE39UuSoUWNQTro52dH/dufv8myVwd3OLXcltLmVivqNVQGdUFKK/zeoww08mLkYcfHnL0RW45b
	UOrieAqMeNUPwzmYMikchmJ5Tw3gr7kh9g76fEM+xCxs2wfYv5Nps3z2q42xXyDDn4pcmpug0vo
	JYLVWmlUk//Y14IrKUEtLu0r7s7EpS3bMjiY+bL2NRwinutdNvrRnobFzdhRSjAth1FKKiedMdq
	kLLApl2kmLu4PsdQx9grlashArIUlBDpxudlhC5yuNAJyo6mHQw+3Uwdd/qEJC8lE2U1n8ip1pM
	iApk3V+tBK1wmnVkrry+1slwnt1tBdW+RfdBc+wdiDJ0NakSzOfIha5ea5lN7AxpBNxVJaqGQtX
	7iLruGe2YEYA0GuQyHncerOtauQTS72EUNb0uXRuzFKnaJH6Cxf1/7UBqXEVrRdy8ZehS+09ejd
	QzYR62yO510+fVrwNjwbghFLUmYNvs4L8p4xwPJ2U0KzE/24aDQ6TWUk697lLWKy581gBN/25yt
	OROgVJXA==
X-Received: by 2002:a05:600c:4705:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-4a1680ffb88mr122325845e9.25.1791206003215;
        Mon, 05 Oct 2026 06:13:23 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027734b49sm343621165e9.10.2026.10.05.06.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 06:13:23 -0700 (PDT)
Date: Mon, 5 Oct 2026 15:13:17 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Conall O'Griofa <conall.ogriofa@amd.com>, <linux-iio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <git@amd.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v4 06/15] iio: adc: xilinx-xadc: Use
 guard()/scoped_guard() for spinlock locking
Message-ID: <20261005151317.00001df3@gmail.com>
In-Reply-To: <20261005094205.1045874-7-dileepkumar.nagavarapu@amd.com>
References: <20261005094205.1045874-1-dileepkumar.nagavarapu@amd.com>
	<20261005094205.1045874-7-dileepkumar.nagavarapu@amd.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_061325_305525_A2EDC583 
X-CRM114-Status: GOOD (  12.81  )
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

On Mon, 5 Oct 2026 15:11:56 +0530
Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com> wrote:

> Use guard() and scoped_guard() helpers for spinlock handling
> instead of spin_lock/spin_unlock sequences.
> 
> This removes the need for explicit spin_unlock()
> 
> No functional change intended.
> 
> Co-developed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
> ---

...

> @@ -677,15 +670,15 @@ static int xadc_trigger_set_state(struct iio_trigger *trigger, bool state)
>  		xadc->trigger = NULL;
>  	}
>  
> -	spin_lock_irqsave(&xadc->lock, flags);
> -	xadc_read_reg(xadc, XADC_AXI_REG_IPIER, &val);
> -	xadc_write_reg(xadc, XADC_AXI_REG_IPISR, XADC_AXI_INT_EOS);
> -	if (state)
> -		val |= XADC_AXI_INT_EOS;
> -	else
> -		val &= ~XADC_AXI_INT_EOS;
> -	xadc_write_reg(xadc, XADC_AXI_REG_IPIER, val);
> -	spin_unlock_irqrestore(&xadc->lock, flags);
> +	scoped_guard(spinlock_irqsave, &xadc->lock) {
> +		xadc_read_reg(xadc, XADC_AXI_REG_IPIER, &val);
> +		xadc_write_reg(xadc, XADC_AXI_REG_IPISR, XADC_AXI_INT_EOS);
> +		if (state)
> +			val |= XADC_AXI_INT_EOS;
> +		else
> +			val &= ~XADC_AXI_INT_EOS;
> +		xadc_write_reg(xadc, XADC_AXI_REG_IPIER, val);
> +	}
>  
>  err_out:
>  	mutex_unlock(&xadc->mutex);

Since you've moved the spinlocks to use guard, what about replacing
mutex_lock/unlock as well?

Otherwise this seems fine.

-- 
Kind regards,
Joshua Crofts

