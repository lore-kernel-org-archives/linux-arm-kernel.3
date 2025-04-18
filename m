Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90685C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 10:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IiDBnIbN2ErdrAZnJdVTPEl8ORr2jBX+0bJeY940wkA=; b=A5yMbqea5lVQqLPseDUpS5a3Fz
	5tFBqjLVgrteAtiNeozii3UvKBmaYvvFuEQtfnCLzeJvf187/4+iHkvpSiMh7wiHs2i2awWaD0lEG
	jJ7uo576AxvuSQZ9HOY3eRwcBMqDraKjxlMeTa1Fg9dJbRmLZ0wtgfTlkY0kqmjRliNLWS2FPyJRI
	j91eXFdl8YT+M+GIZC/xjNzLuDZCvvhsSmjDjXKFHsX7uIRNuZU0Tkkfr4rD/cx4+MqQaG7T7Q204
	gpfbLcYHOh9CdZ/gK9jvTWF5Dr6HjJ7Y/v7PIFjqzfio8GbaTXCaqyyiT/BZ73KLSRz5lXZq72/ES
	TnDIxutg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5izt-0000000Fs9L-1DxG;
	Fri, 18 Apr 2025 10:31:01 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5isg-0000000FrAO-2ZJ9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 10:23:35 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-abbb12bea54so265235266b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 03:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744971813; x=1745576613; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IiDBnIbN2ErdrAZnJdVTPEl8ORr2jBX+0bJeY940wkA=;
        b=No5EPfj4LRK8cXOsAVcWeLzsNWXWjvawrNFQuaHO/LUtCSPH4axuP2y76SAM/p9PA5
         6nAKQHETSlH5JD1CWEBxiEez0opcm293Uhz2nNEPty1JiWVhlgD4Ibnnpn79xTNyd91T
         4evtg4fRbUeYNd73nQmlc993Svu1O0MA5m2sH5Sp4D/7tcm1VtniPuHxVxsmC35wk3mo
         SG1Pu31U2tyJzm7qp2M2wAhrdhY9UsI77VtolxpUEZ/eHpaTm0N9cWMDRdIa9nygubiS
         rmsCiZxSBPE+MpL86qa1BgbQ9ymer/jQrFsqRHc7GYuoJeNCiDLMMh3qK02o7Tk+tVGk
         Nwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744971813; x=1745576613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IiDBnIbN2ErdrAZnJdVTPEl8ORr2jBX+0bJeY940wkA=;
        b=D9DwfsDFc+e9VpkhJE2wTqWMx3IDCX7JWXHizLAdX4Lq2XXPN9svZa3xcVjHfZ6gWE
         7FEYNhGTSokht0fg188k4ZcF8LxGTcUe5y3KQ4RJBWZ3nFQFC1uo9FSkdTiB1SxnTIhp
         yjk+a3eSEUlaKStrMpv266X+6jYgNrLeQfQMmPmtaUvXjgr5LEOcBM8284rW8fLmGmOG
         j9hz1TTAZqno7/lvyGRfrnWwh64KT0sWqkDSU++cXVcQEwQK+SCByEE9083vVz7EuoGf
         CGT1cIskmzRUeCsdeozIbIPyIQXVMxAgCcU0UffYB9FaWxs13GxW7mJfux1XmlV+ICqV
         KtxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCBx3KvG9Y+iO6JJ8zLwL0p6lk6Ta6dF6itLP9ksHM9Y0EPz/AVCKB7ptNKy9iYh9Q6j1u9Tbqs3Hrx6PzFxFa@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5R8quMBEamOay5qeejy7e4oYFPPk20Z3rJr4foxwq3rXY7/65
	W79N5nVYBUoIrNLJRxAcwouzHNIazBjI5GXL1WSy6AGQpNQar1yaXfLF7gcxSxlTglhMI/aMBkB
	V8L8=
X-Gm-Gg: ASbGncsS2xGRZ+ZHMHRR/Xdauh+mc7qAscKmF/hr75v1/s3QiKIBfTsdpZGCNTjZKa7
	KE6GscTivu/9lO7SBnepR8nT7FLuBVsjlEoVf1K+WpXFNqrjgYMABLIldZcFZHtDF/N0Rb4BOkL
	wPmPh/YE9qXmF5LggdO71rLqyXhyBkLNML3IPK6YkTrJzL6IxjyW9f6NguFj6DsF6qYTpOGMFjR
	easkjGqwZElMxINTqMOsE+wvj5haoH6ewlSpVeVkqE+uoMoC8GcJ3TfsfkoLiZ6y9Hesvf//W3z
	PBcb/jJ2EpGRPn8yaAjS91/nnTdWaFGNzcqsot8a7d5LPATdY23/JOM7v+qHHAWg4JL09mU7Xyl
	poj9zEzpavD61KA==
X-Google-Smtp-Source: AGHT+IEhVsv0Ij1c7fYpfyCnxhTynvdaKQ/MYv7KemDDNjedaaUCumCbBnsf/IltIZ7kk3yXig1l8w==
X-Received: by 2002:a05:6000:2489:b0:39c:11c0:eb95 with SMTP id ffacd0b85a97d-39efba460e6mr1527952f8f.17.1744971382884;
        Fri, 18 Apr 2025 03:16:22 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493377sm2340627f8f.62.2025.04.18.03.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 03:16:22 -0700 (PDT)
Date: Fri, 18 Apr 2025 12:16:20 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rafael@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
	matthias.bgg@gmail.com, npitre@baylibre.com, jpanis@baylibre.com,
	nfraprado@collabora.com, wenst@chromium.org, bchihi@baylibre.com,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts: Fix debugfs unregister on
 failure
Message-ID: <aAImdJFvfLTKe-TY@mai.linaro.org>
References: <20250402083852.20624-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402083852.20624-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_032334_642720_7017CBBF 
X-CRM114-Status: GOOD (  12.86  )
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

On Wed, Apr 02, 2025 at 10:38:52AM +0200, AngeloGioacchino Del Regno wrote:
> When running the probe function for this driver, the function
> lvts_debugfs_init() gets called in lvts_domain_init() which, in
> turn, gets called in lvts_probe() before registering threaded
> interrupt handlers.
> 
> Even though it's unlikely, the last call may fail and, if it does,
> there's nothing removing the already created debugfs folder and
> files.
> 
> In order to fix that, instead of calling the lvts debugfs cleanup
> function upon failure, register a devm action that will take care
> of calling that upon failure or driver removal.
> 
> Since devm was used, also delete the call to lvts_debugfs_exit()
> in the lvts_remove() callback, as now that's done automatically.
> 
> Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Applied, thanks

