Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C711C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 16:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ImV2tWTmsy2q/yEr+1DaD06Foo/cyEMhoVGfzs5E01c=; b=y+ctdXQrkM2a1m5Uh7ikjMMo4F
	h/sTJqx5tIAAeuG/1BYoAUtW9AQEadzbqWBHvG0jIgaBOz23FTCKO4Tj3bB/3qb2Klum1pn/qSewr
	+ngX1wfp+fBxVQ7WVYvyHDI7yY0C9bwbs9EI/oELhK3mKqkuvKeBrNzro4A7uD+yZ5Be90qUXmTav
	X55QNEuJotHPOnQAuymdQ8e/ZNGQ75Yrync9FTZHSiiNqvR4JTAtr86Dh/KzwVI+m1sfvuJhv2qJi
	SFQ42gXGJe8csPO49dveBA3gbZbcbqeKoSEybh1bs40JYrOjzsuDOpSp0MOis5VTVvU8zPyAbJ4qT
	9YQ5OA0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvw4-0000000AlD9-2pqG;
	Wed, 18 Jun 2025 16:46:52 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsLo-0000000ACYz-1tj7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 12:57:13 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e731a56e111so6289207276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 05:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750251431; x=1750856231; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ImV2tWTmsy2q/yEr+1DaD06Foo/cyEMhoVGfzs5E01c=;
        b=bGJdNfOUnYp2FyICwGSlXueSK3e994KZ1MelCRXszM7mGkDLZvY008AvXokZh8shDY
         Jv2kir0qyQW4ZGX6v+8OEvohJlfmmVZK5y7Soi59RM4uImbOvdUg0k7fLUSSc/Zi+o9J
         Xr7IXSL2SmC+382M8GbQoc4fkRUeWJ3ouGY34NCMXCQg692WXlhwlX4B/9m3Dxy94mFm
         gAMNgKmQfH7EkCzJzEYinPSdKHZfslkzC1zjZtmuV424Y57rlI9AGbi2/B7TA8kIV/kA
         fmroFVnGruZN+W2A0OSwWCWo1Ml0olwMZhw3Cl7u86hN/nOSLm3TkDnUgZtC61U3Ta33
         5jeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251431; x=1750856231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImV2tWTmsy2q/yEr+1DaD06Foo/cyEMhoVGfzs5E01c=;
        b=gb34fANzAOeoQN81xG+qZhOCikUb6M8UFQntBKu/Nj5nbaRKwUpLduUQk3QJ2YVKvn
         cfALc/5mIsgoZl6uzvAbTP6eBFJbuL171nmJd63xaWU8+PjqZ/lcspqvUR++aIEQSPy3
         TUqZMZHf6zOlMs5hYHstoYXOKtBpYUasSA3YJKI0OmTOeGXSGjusjYHtSRwGI9BfNyzy
         xagO/lRIsAXJIfF2PnC6Xs1H25NPZKsqaps16ZT8ZAtY0jWHB+EqD2cY5521fYs6Ra2l
         33zVs9pAEq/mC2ppG+q6YzOND4ipgV0sa5/1iKznwy+DvFuxicCsH5kfo/5zr3MW1Mtb
         w6iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpwByfXHjrjfq8nZ7ru4HRDPfP8GtswOKrAq1LmwCwebjDl+h8g9w6zALTqqgrNp8eQzfKLpiMmmvcaoNs0Qjc@lists.infradead.org
X-Gm-Message-State: AOJu0YzdyDb+Fr0EAAkqwHcCE3QknLSWI1qWkaWnPo2xbjFeLxBFKNCs
	qV4hC6FJ6y1bwD0wB4WDa88l6LsWajVK+IHsicyVRHYCu13/OlL5ZfQnDXUy+lhrcNdgFqIzzSk
	TtgWMVjh7zOlwEEWarZG4dtz0rpay0u4CR/OQB8Jk1Q==
X-Gm-Gg: ASbGncu7K0UUtxuZNJQNs+2TmmZJYp6y1cRceaBwes3zwpF9rbBU0Zb1pYqajlFhxY9
	JLE5B0k8BFz8TWGJbmfhHe3ouvqzPb2NQTSZ3U+uLz+vuRHsVb1s+qqhGfc+OmVXnuLe5u2TtTi
	lMrIvunWvXCQapAsD6d+mZNT27ttgFqqUImIWkJ/U4KfmvOzTpEzZPFQ==
X-Google-Smtp-Source: AGHT+IEyQuheTBiE1KNn6YZq2gnYBnep5nmoSzdbAY5+FjuWnU41fcajc0wk6HzHKqHouIVNOHfqKE34E1wAn8AbOSo=
X-Received: by 2002:a05:6902:108e:b0:e75:c2d7:53d6 with SMTP id
 3f1490d57ef6-e822ac5c6e6mr24203748276.13.1750251431566; Wed, 18 Jun 2025
 05:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250606090802.597504-1-lukas.bulwahn@redhat.com>
In-Reply-To: <20250606090802.597504-1-lukas.bulwahn@redhat.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Jun 2025 14:56:34 +0200
X-Gm-Features: AX0GCFtmn4waDQnDGcBuyuBWKSA5kWVg6aNQw87L31M-o6t6ciEMxOkcF-FE8sw
Message-ID: <CAPDyKFoPdqfz-3+XAMpg23VzaLUZ6xXJvmknQH7pjNZLPq6eAg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: arm: scmi_pm_domain: remove code clutter
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_055712_490268_C15E541A 
X-CRM114-Status: GOOD (  17.49  )
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

On Fri, 6 Jun 2025 at 11:08, Lukas Bulwahn <lbulwahn@redhat.com> wrote:
>
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> There is no need to introduce the boolean power_on to select the constant
> value for state. Simply pass the value for state as argument. Just remove
> this code clutter.
>
> No functional change.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/arm/scmi_pm_domain.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
> index 2a213c218126..8fe1c0a501c9 100644
> --- a/drivers/pmdomain/arm/scmi_pm_domain.c
> +++ b/drivers/pmdomain/arm/scmi_pm_domain.c
> @@ -22,27 +22,21 @@ struct scmi_pm_domain {
>
>  #define to_scmi_pd(gpd) container_of(gpd, struct scmi_pm_domain, genpd)
>
> -static int scmi_pd_power(struct generic_pm_domain *domain, bool power_on)
> +static int scmi_pd_power(struct generic_pm_domain *domain, u32 state)
>  {
> -       u32 state;
>         struct scmi_pm_domain *pd = to_scmi_pd(domain);
>
> -       if (power_on)
> -               state = SCMI_POWER_STATE_GENERIC_ON;
> -       else
> -               state = SCMI_POWER_STATE_GENERIC_OFF;
> -
>         return power_ops->state_set(pd->ph, pd->domain, state);
>  }
>
>  static int scmi_pd_power_on(struct generic_pm_domain *domain)
>  {
> -       return scmi_pd_power(domain, true);
> +       return scmi_pd_power(domain, SCMI_POWER_STATE_GENERIC_ON);
>  }
>
>  static int scmi_pd_power_off(struct generic_pm_domain *domain)
>  {
> -       return scmi_pd_power(domain, false);
> +       return scmi_pd_power(domain, SCMI_POWER_STATE_GENERIC_OFF);
>  }
>
>  static int scmi_pm_domain_probe(struct scmi_device *sdev)
> --
> 2.49.0
>

