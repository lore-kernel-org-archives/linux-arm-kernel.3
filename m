Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6A9C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 12:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x84L8D3771uX1JRAz3DeEhkLMS/d3fFl7+pMbK1JIwc=; b=G9tcZgm+RgFfgdklFvTdEubiqY
	PzfjTR6H4VdznDThtpW13ZobCMGK2PmXZRFkntR4dBSexduxEmYwaHFaHZtMsbimmxl0TnSijP8yq
	/0b9R9mTji22AhHv+17L/GiVbeIjcXEP4edecxBvfNAwwCujAbJgjyk996kqgBsQ2cA7QsbKUjXd8
	RZJmeavfaIOo0vARlcBJ9gPLtVZerqTIjxwnhffOsuDWwCd1yeFdRW9flj8sLPKJuRkUqW36pLJ0d
	g0r/X20SIvLY2armcx+BuOkhSDvF57GS9Rp9zoQv70ELhPdNN8nkrFSmX/95wyoDcM/FDQykA81Xx
	azrzH0SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x267T-0000000HFjK-2T0y;
	Thu, 03 Sep 2026 12:00:39 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x267R-0000000HFiw-0HCP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 12:00:38 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2d7200b2e15so25778085ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 05:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788436836; x=1789041636; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x84L8D3771uX1JRAz3DeEhkLMS/d3fFl7+pMbK1JIwc=;
        b=kWN4PkKHL7frP8hexV1Ekg3TmMA4rSL9GkpUSGdoyFWsHvyDp+CTUj5Mulj0aQjeZv
         Dl0cdKbzSSB8xfjKIeb5Ru1h9W8Jotv6R0SUDDZotxf9X9Y/H1kMML7IoI+9tHtsRw0+
         zwhK//y0tEgF/VWeMJp2uwK5RBr0LsoHm8O1AZIZCn5mXQm7UyowiS8MV8N/pDjAgB+h
         tjr9PaL1x+JglzSYcJv/TtXg3SPkNfcRqzjj32b/8qHf1iO6uIId59LLxh1MNbSa/aJS
         QFunQ8o5kVH9899yC1zdSshM165f7rGCBr61a/iat0OsDMQnyqdEgfODY5YwcoGc8WTc
         ertQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436836; x=1789041636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x84L8D3771uX1JRAz3DeEhkLMS/d3fFl7+pMbK1JIwc=;
        b=WXFRQZi1qJtB9VX+EL+pVsdXUMZT2plIvowjPupdJf/3Hi/bpo2FxI2GZIhr4aE4Q6
         Y+DCZZt6D7tgK4vrDCB0wnXxkMz9On1l2HvTQo7IB/TmsTcmsEvBJWHDl/nNd5SjeXEn
         ytbuLxT7NQPa6suoFOld+Bkgp/9ZiGMLPQwkz4rPdzPUhNSCCs0HQJQRd7R+GsK5qsvc
         XF6L0V/vp93bESNDtnnB3k2z3aur5gQy7ANgo3Xrpa9N4QX6jZ7YapmHeFEAR+1KEMV9
         CpEj8y1IcYICEz+cl9tts7/xVPxlhEDPoE5WrBote4E/lIvTudQtDf4vc0pec93awOfR
         D0iQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTjXM4D6HAnTKoPz0Ss9b2aFj12Twfhg7MxpTUpOfigN/OYMSQXXdvSR4FKCFnhjc9D+pXif8iM8Euodtl5TIc@lists.infradead.org
X-Gm-Message-State: AFuF++kGrFYhRBpHbL1DrJ41hRqgW+SpUplYQ3NwRlc4Rx4mE5N6x8Lv
	i3ERuqhJlsLC6iBu/Jn68ej3OAmKb60ZmjwLjRovYKWSCIeXR6I68X9Z
X-Gm-Gg: AYBFou2ZF810SyfJYiqF0uiBV6B19mKf0ztEm72HZhq2kAH3Rmk/awGXvjZYwvSU4Dg
	eVV27Futw9xR6+eFCCwGT2Lr6L3+Vkbsr1Zzi15IRyz4JNXEyKBt3dGYlceJi8yC7X1oJdlXfgA
	2Vl4TMtIx/ugtbcqENrhg7xh7V9/y4prVsBnVj728pCmGW/N/FAzpqLxFuykkDHZn2G+am1OnX3
	fHMdWF62Ln6GagBbg6fp3RiezwVtmYIQn40q5EbWZqhB61ikeBHs1c1J2bgIE3INKF++ULBUg39
	HsitbMxjn9N82hFXHfrzTCIBR4dKzL3/0jewxyzZYUp+pTuVM2QDdIZc7KwZl1ndiBHHHCYvcuO
	zNGC8bzuGu4r0RzTV+ovNqLOPO6SfHB+KcZ0ajXArIUHGf08PjCWBl8IInLlstr5j0XV2x6sdGq
	M5M2xk3R//QDcsHNEsaS83M0RphDveWbWJk+0qywvmDwd5ck1l0eALFh4+3ZXkAg80fMmEV/JxH
	5ElOEdVnCbwakWpgOkTv6RFIfeZ06sXwApCbASBIkTTfjATgg==
X-Received: by 2002:a17:903:26c6:b0:2d8:d4cc:be67 with SMTP id d9443c01a7336-2daec73f1d2mr160598335ad.20.1788436835424;
        Thu, 03 Sep 2026 05:00:35 -0700 (PDT)
Received: from ?IPV6:2406:7400:56:e503:ad72:fda5:83e8:be95? ([2406:7400:56:e503:ad72:fda5:83e8:be95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db01c4204csm8037835ad.66.2026.09.03.05.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 05:00:35 -0700 (PDT)
Message-ID: <c00f266d-b6c3-4988-a2b9-72c5e0389317@gmail.com>
Date: Thu, 3 Sep 2026 17:30:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] pmdomain: core: Rename genpd_status_on()
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
 <20260901111441.122436-2-ulf.hansson@oss.qualcomm.com>
Content-Language: en-US
From: Dhruva G <goledhruva@gmail.com>
In-Reply-To: <20260901111441.122436-2-ulf.hansson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_050037_115054_840969D7 
X-CRM114-Status: GOOD (  18.41  )
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

Hi Ulf,

On 01-09-2026 16:44, Ulf Hansson wrote:
> Let's rename the internal function genpd_status_on() to
> genpd_status_on_unlocked() to clarify its use.
> 
> Suggested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> ---

Optional:
An additional line explaining why this otherwise unnecessary rename exists:

Rename the accessor to leave genpd_status_on() available for a lock-taking wrapper
introduced in a future commit.


> 
> Changes in v2:
> 	- New patch.
> 
> ---
>  drivers/pmdomain/core.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 842c4169e290..6ac1ce18fda3 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -173,7 +173,7 @@ static const struct genpd_lock_ops genpd_raw_spin_ops = {
>  #define genpd_lock_interruptible(p)	p->lock_ops->lock_interruptible(p)
>  #define genpd_unlock(p)			p->lock_ops->unlock(p)
>  
> -#define genpd_status_on(genpd)		(genpd->status == GENPD_STATE_ON)
> +#define genpd_status_on_unlocked(genpd)	(genpd->status == GENPD_STATE_ON)
>  #define genpd_is_irq_safe(genpd)	(genpd->flags & GENPD_FLAG_IRQ_SAFE)
>  #define genpd_is_always_on(genpd)	(genpd->flags & GENPD_FLAG_ALWAYS_ON)
>  #define genpd_is_active_wakeup(genpd)	(genpd->flags & GENPD_FLAG_ACTIVE_WAKEUP)
> @@ -771,7 +771,7 @@ EXPORT_SYMBOL_GPL(dev_pm_genpd_rpm_always_on);
>   * @dev: Device to get the current power status
>   *
>   * This function checks whether the generic power domain associated with the
> - * given device is on or not by verifying if genpd_status_on equals
> + * given device is on or not by verifying if genpd_status_on_unlocked equals
>   * GENPD_STATE_ON.

Since we're fixing this anyway, It should describe comparing genpd->status with GENPD_STATE_ON, not the macro
which expands to that logic ;)

Anyway, nits only, LGTM otherwise.

Reviewed-by: Dhruva Gole <goledhruva@gmail.com>



