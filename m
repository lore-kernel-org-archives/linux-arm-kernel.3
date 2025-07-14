Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA752C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 09:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEmmr4XGYIHTUb8r2LHfVd1MIoDVWAOSUqn/NEpPRbM=; b=D7yZvAwtGbALX2TVCegrqHgSlw
	w1tBZjM7b64mDa5oEVg42Ld0wRH3FDL4EcDq+aGVnRBbwqiK4TNAgGwd2Y7ZoXY+TcIwdTs2Pjx6K
	Ccer72TyW/rS/c7ia83j5YdfqI8b4sayrD9ufgV8ENrkVef09xnhiPPhrgBTCFdXIGJpqc6UKafqD
	Qj0JErf5ox5yjP0Y1b/JD2UfmWIUzb7zHy4JnopiE/8J9BfYGW9rNJ+0ynNBz7fUeKAyTjGX6Ksv8
	u7GznbKFlfHWjqCsY/54hF5Rfktlb7Z3Ul3vhPenTl/mKb6HmSp4V7nggcQteniaA54xLCPOUsEN5
	a/Wx78bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFtT-00000001qUG-24Wq;
	Mon, 14 Jul 2025 09:54:43 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFaA-00000001nQM-3phY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 09:34:48 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e82314f9a51so2940686276.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 02:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752485685; x=1753090485; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vEmmr4XGYIHTUb8r2LHfVd1MIoDVWAOSUqn/NEpPRbM=;
        b=TDdsHy+eTIn9iAB4sUOH8l4UuHVTI5e1YI4ykpYaASCluPbSghEI3IQKKZfBqcWwoj
         C67P/NWK9BgIMJez7pv9OOBNxs6cJmvjmtEjkMjBznMm9DIFZUNJYpGoJPFYuhA15w5l
         NMUdhSeXV77WgSUmnwFM7cFsxJW7+X+qKTDe6+CEWyYy3jn6LQsr6a8oIHcjyElbF79z
         WJ1KxjSrMVmcQ1QxvAJOn5JKePkfFyYGVPzmHvKZ5Vu6KD+VTzA2i2aFpCn1LRWOonNT
         wYpG2D2f1C7uLMPBOn8ubHG7wDZ9fg4uQUFOAoZ3vwY2AoSA8cjhCpxvI1QNNcUwma+j
         xd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752485685; x=1753090485;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEmmr4XGYIHTUb8r2LHfVd1MIoDVWAOSUqn/NEpPRbM=;
        b=opeMaqOrA9tkKCdEODj/U6dePLMPmaQBbSl2/6xvePwbL/z2jV7McOqqy5Aa2z7JkM
         5H8gXlnNIboMkwYvOMzM8BvWFHpDlxYvnRgtbAz4pKapbV8CrW4i9mTDmItMiqlqEYHm
         FIf2vqNpYd2V1DwQ5cftgnuXLe46OVzCdC1rYEoQgt1IT0s9YsQhhNWCAnG5JQwLmmUg
         1tcGUUC4QB8dMuoOnR6KZCqjhL8LmBIMUltRR5V643fkFrVnsiBEvGM4+4jjcCrEKOXb
         6zTBXCp8mePml/UoPp5+rUzCWyxmIkh6rGzZ/0xAEiN4oOvRAxGeiXUgWLVTFFVJ1nc/
         uZPg==
X-Forwarded-Encrypted: i=1; AJvYcCUelKVfxUCp76AVdMkuJDunE7p2SrGpn15E8hUnaUtVhRumjg3xezpWblGkWMNhd/lpWEgBoRcc/5pYqmJS1AqW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6f8Ktv+vlcTCZlTDCLw7k7gUMlbl7564bEetA1/073XgHfTD8
	xJ1QooHyVaNqpqn2OVB/0CN/5YrCUnuOo0BAw7jQ7mcagSSpqTs2S0b2iv8hw5iDGKZkQVxMP19
	RgjIojL25NCllnE9LFkSE9QWq6b2MoGkMlF5gC+PU7A==
X-Gm-Gg: ASbGncuZW7uLntnfpHBQDeRm/jaEO3ObUZK0TYoUjCtl9NqXdn4Lk/jRnUmzr6LOb5c
	uaneOYjuHscz6/WPrPTcLas9m7vnV0CFrSakPivGq8vHMIyiUiGwXz1GMtcauPfA/kiXogWEyfc
	H3F/ruyGEUDUsb73U6lSa8GjlKrOlf/qVpf+/fZc4TL6RquP9f6ZRtNKcF3uXD7o9NNnhiufaVQ
	bUM4lbmuouLITseEj8=
X-Google-Smtp-Source: AGHT+IHIlg2QgBnKLSKe6umOG6mLkyHuyOGa5CDuUCJGRmLch13uGRl1lyUH/fje8e3UhcJpXB/eeeAkkqwb0eDhQ3E=
X-Received: by 2002:a05:690c:628a:b0:70e:7ff6:9ff3 with SMTP id
 00721157ae682-717d5f3d391mr195973477b3.35.1752485685299; Mon, 14 Jul 2025
 02:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250711114719.189441-1-ulf.hansson@linaro.org>
In-Reply-To: <20250711114719.189441-1-ulf.hansson@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 14 Jul 2025 11:34:08 +0200
X-Gm-Features: Ac12FXwf4BfTjOB0bq-V0l481-9ls28bgQwLelpMu5ij-cJg8s7O_Ow2nAI2D7E
Message-ID: <CAPDyKFrouK9b8Gd+DYg-=BE0dYVuiwy3+Jkrp1=4dDXu90gDTw@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: samsung: Fix splash-screen handover by
 enforcing a sync_state
To: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_023446_965128_D2D1B35A 
X-CRM114-Status: GOOD (  23.60  )
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

On Fri, 11 Jul 2025 at 13:47, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> It's has been reported that some Samsung platforms fails to boot with
> genpd's new sync_state support.
>
> Typically the problem exists for platforms where bootloaders are turning on
> the splash-screen and handing it over to be managed by the kernel. However,
> at this point, it's not clear how to correctly solve the problem.
>
> Although, to make the platforms boot again, let's add a temporary hack in
> the samsung power-domain provider driver, which enforces a sync_state that
> allows the power-domains to be reset before consumer devices starts to be
> attached.
>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Link: https://lore.kernel.org/all/212a1a56-08a5-48a5-9e98-23de632168d0@samsung.com
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Marek, Krzysztof thanks for reviewing and testing!

I have applied for this for next!

Kind regards
Uffe

> ---
>  drivers/pmdomain/samsung/exynos-pm-domains.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
> index 9b502e8751d1..5d478bb37ad6 100644
> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> @@ -147,6 +147,15 @@ static int exynos_pd_probe(struct platform_device *pdev)
>                                 parent.np, child.np);
>         }
>
> +       /*
> +        * Some Samsung platforms with bootloaders turning on the splash-screen
> +        * and handing it over to the kernel, requires the power-domains to be
> +        * reset during boot. As a temporary hack to manage this, let's enforce
> +        * a sync_state.
> +        */
> +       if (!ret)
> +               of_genpd_sync_state(np);
> +
>         pm_runtime_enable(dev);
>         return ret;
>  }
> --
> 2.43.0
>

