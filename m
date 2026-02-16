Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35E1E63F3D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 09:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=em6VPs2GZRn54p6b2nYQwPaDQws0EFVjZBMU1Ysa5Vc=; b=ouIJpOcPlVUir1lQS4HqdBEuKT
	to4GjiKDVLWrpNtCO+B8oVirez1iXg0pe/bkNlB0sbrpMe8zkreckHqu3wXZPgPeBylQog/pQJzF5
	PglbPqxCHI2NEOR/PS7yVuj+c3Ys4G+LdyAy/vbc9xs6G61InpPz1YU+yb3fH6wKoIHxGa8u+6X+q
	Eg5a38bK4t5qZ6tq4PXRUNM2VX9ZmnnyvbQq1K3nyt9o2NBqjBsjDiP8bIrvkaBK3dpd1D6d6ktNS
	E6bL55WmK7bUfpzcXstjw79ivb+rOVsFwt4P6V656S50VdZw4uqreVqJZ0HGdq+fnNdi1uPKJLqRc
	+pPHu8bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vruXR-00000006DbT-3tbH;
	Mon, 16 Feb 2026 09:05:05 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vruXN-00000006DZK-0StT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 09:05:04 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4359c54b682so261697f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 01:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771232699; x=1771837499; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=em6VPs2GZRn54p6b2nYQwPaDQws0EFVjZBMU1Ysa5Vc=;
        b=icZg+t/fx2yso7qfWAxKn/ySdytgjFNirqpII4fmXrQgZKsXKMotbCueGqbHpCNV/v
         TyZBEqSU9i0bCvZZTvk0Hp872GmA1NE7ETYtzWnQ1savduD7tMPe6j9qf0XKiHQgimU0
         WfjIrjefgh/jXKz/pzbqhmP2sGpGngBONgNtMFsNDlE4lRnQim7Ds8/ybW/cArteOtH5
         ESS/d2cE25XVqtQNwb73VeBPOijDCFiZKF/AqoaN/0NkEHtvSrIbCPldsv6LZoV/0QFc
         rBRvVuMuZ39xDaIdoX2IFBf+IZLbS4g0pu9V67qJMIFzB7+KPdErsyY4UkcvXfLmrleM
         rNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232699; x=1771837499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=em6VPs2GZRn54p6b2nYQwPaDQws0EFVjZBMU1Ysa5Vc=;
        b=Hkug3LZCFoz1i1sycCCnCjljtvNjDbXL86HfDF1TzEvis01hANr77VNG8A+RmEVOKa
         BSdOyD5YSp2JT5qrn5Yed6JBDXMu2vyig24EFxxkU7JsgjaH719eiDamw0MlpRTRJkEb
         nnG4JF5NqsTxHbFL3vcyariY/nUgyqKij39pY+jvfsdAFbzwLd9fAqwrmE1LtheWZSFV
         xq491PrUrhNRK53xLRy8vSJXVDsa3iHpmVfDKoXq/SfaH5bI5caLrXN6CDJ3QOph/mMR
         0RXDrQaXvcYisr8pYaLhUGHQeBzxHWbwktOK5eWZ0ktem+dRJ6eU0GUaWEdqP/9pyI7F
         YFjg==
X-Forwarded-Encrypted: i=1; AJvYcCU7kZzOwd1nz9JI1jnCU4JXVNCgrh69Fw9s8sT7PjIou/cQButl/x45fFcRX2XXHpHQemjtLJQrh4SHctNllRAz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+MXBL4ZK2giJGqp9oBqWbT/tKOhL+7vUSzW0Xtmug8maazrD9
	p1UqsW9el0tq6FVF4CWBmJaPgvnsqD/vRdU/l+gfKm5LWHtrqgk4nPco
X-Gm-Gg: AZuq6aKwYkAVDt4wqDjSAlmFJwkkk/yvulczI/ErjbtPtmu6mHSqhinIm+IVGj3W7CZ
	5np0LkrqqmQ4mtFrGLPrjKGFyD2NGB1fA1Of/jdmRXtvWVeSIHFQfPyxZ60VJ9T34dOXO8K8v/s
	OZEt5+y5PrGYkiNyhMhATZGyN/M5+hNqlxnAxgCM9GS5ZpD/gNvHeLIa7YemdxT/T9drBeNQCwh
	HQYhjdmB735LeL343mKf4iDnOD3sLnbTr/Qm/6XxO+EDsjE0UVYcmSIhWecGdqo8wJWEFHT3azO
	n18NgO9gXB2NDoZUcgN8Mr+UukXP1SUibE5yLL8rlSdNIb6B3a2RWzeLy+mDUAKSdbAMmqh3HoB
	hRmK8Bu4bDwvjkZEknDerV01F7IG6gm8G4H8eO4ODa5lUXNA04myZtY3AKEhE+fO/vSCkrb3A+3
	gPCuAUkUKy6g7oug==
X-Received: by 2002:a05:6000:2508:b0:437:72ce:8954 with SMTP id ffacd0b85a97d-43796af4d32mr10923244f8f.6.1771232698983;
        Mon, 16 Feb 2026 01:04:58 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:68e2:cc27:74c:c083])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8075sm24922456f8f.29.2026.02.16.01.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 01:04:58 -0800 (PST)
Date: Mon, 16 Feb 2026 11:04:56 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH phy-next v2] phy: apple: apple: Use local variable for
 ioremap return value
Message-ID: <20260216090456.23oko4jx5bcahq3p@skbuf>
References: <20260215-phy-apple-resource-err-ptr-v2-1-e43c22453682@jannau.net>
 <20260215-phy-apple-resource-err-ptr-v2-1-e43c22453682@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215-phy-apple-resource-err-ptr-v2-1-e43c22453682@jannau.net>
 <20260215-phy-apple-resource-err-ptr-v2-1-e43c22453682@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_010502_074794_71BA9A5E 
X-CRM114-Status: GOOD (  13.90  )
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

On Sun, Feb 15, 2026 at 09:02:51AM +0100, Janne Grunau wrote:
> The indirection through the resources array is unnecessarily complicated
> and resuling in using IS_ERR() and PTR_ERR() on a valid address. A local
> variable for the devm_ioremap_resource() return value is both easier to
> read and matches expectations when reading code.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/asahi/aYXvX1bYOXtYCgfC@stanley.mountain/
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> Fixes: 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Changes in v2:
> - Use a local variable instead of the complex indirection with the
>   resources array
> - Link to v1: https://lore.kernel.org/r/20260207-phy-apple-resource-err-ptr-v1-1-78735b07ed2d@jannau.net
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

I hope this can be picked up for the linux-phy PR.

