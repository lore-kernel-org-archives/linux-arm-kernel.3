Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C685AC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 08:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWjL7Zpc1RbXxYUhrkjehswpmSWh1RaKUZDsqI6aoKw=; b=2JDxhaSJGM223iZBS86QVP3BDz
	/qF1nDCQz96RXC/0puCKNxpbVAcYKB/SEn0tp8pDRrkSppA7tNx6hoHPHzG1XpMXxzhQH2LgucJL+
	kIE9xQFugG8rAPu7/iu7eZF8eh5GvBFG4YwSqp0mg+JHrH7pJ8VI9ec0QKSj+nDTBdJAJXC44Xi4N
	j3/WetyF5zFVnAADeYmhTM4GDoFPM9JKUUU70JdVm9o8VFlRAURncs9dGrCoSdhvNM1OH/BQt9FWf
	FOPFX5EEsEi70OLPW1Lj6qmjUZgzmNoSXuKWSByuYVeExqjwv5u18aEb8AfuEWWPzu69hpksxbhwE
	VsSdmjEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8kT-000000023se-1c4P;
	Wed, 26 Aug 2026 08:12:41 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8kR-000000023rY-0asC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 08:12:40 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-66d2529310aso610926d50.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 01:12:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787731958; cv=none;
        d=google.com; s=arc-20260327;
        b=rlZY+lD7fjmAT1IOK+xTmhvQo+PhbOwtUQySfsbfU9a9unRMJWEwaVp8bxh31hV10D
         yWeD3fhM/OFBjbJG6zZ0asA1rxaZ0/e+OMogpd3Nr7O6cYi6eLRtC11FA8eO4BEyra84
         peQZhPr9y9Jg+jfAJUxeE5UHJFzY1Z3YTl/+VrEEA93Ob/Y5xeA8bB2n1KFk+zZT/By3
         nCWBPe8o/fSToSOOyqhiAqzHZ9lYN/EPNdR3ollnEfxGF2R8VB3JcoUJcnTBry+Qb+ax
         FRl+7Imn3fNH7kmFlbWfb7+UKSqykXPcPWOSv4Fb8vGwVw/wuZjh9g/+NGErTAVzzofD
         ZdPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uWjL7Zpc1RbXxYUhrkjehswpmSWh1RaKUZDsqI6aoKw=;
        fh=dpHnRcSGUrPFdoIdBLL3HmdUWGaHZ5aPu9KzqKkIyoY=;
        b=rLOI1VlpCicuj/LRrxluSMX5/YAfWjHTsOROgTcyegAwmh5FRRhWdrQcnqDW6AMtUK
         VyEBv1UrWYvlFOcR0D3kIvRr0sRl1lqjGnEWHu5UM1PUfx/UfcVVlux/x1L+22SGrx9f
         JtfeGQLygh9On3KdSpgzlFmpSiqZ5NltamVmVgehyTQnA3BLDcUPPDoRN4JmMYTVQyLz
         qLN0lxnS4akFj+To4MD+lYkKNEVBDc4dNgY0/5Hs8gO0IbYspG90pF4X5/CgjxOc4XWa
         LbpvzZhQ50nzgPoeMxA75lwakN6GM9OO4bD9y3GiWzI5K3LPOiEcSPjTB8FbENKnSo6+
         ucqg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787731958; x=1788336758; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uWjL7Zpc1RbXxYUhrkjehswpmSWh1RaKUZDsqI6aoKw=;
        b=Z9kQP24wS2y+aeTcYlQcvc4jNWZVmPXLBTomwk1Js5UhEWJvAnsr5pRTgMhkl5uWx+
         PJBnPKXjm/fdqOGDKtwYUTR2l4A+/2aK8tKzNdGDzXDq1Cy+kMTTMy3YoOJn1xjZgqJo
         9SIKK1991sERWMu4u/9M7nzsyQF3w7eFWWzMa/JYymLfdfhmxVnqBlJF9Elp9TDiepId
         mJ0cgZcvZLKa93QKZyaYDZwU4/xmC/otY5p46qEDekBoaX44YdYhg5Q7VIl96KzmkjRG
         QfIKtknzrbOUkp9ZzUC+2Bf5qQ6ElOtNINl0vfQiuY5j4ZuUmE2OEN6u9hg/EHe9HYTG
         DIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787731958; x=1788336758;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uWjL7Zpc1RbXxYUhrkjehswpmSWh1RaKUZDsqI6aoKw=;
        b=YPTIeHMS84OH7FODodX8Zc9rvYVAvucRGbv89BHCVAaEyL1NPn5BeMJcqsQv9NqcKc
         mwyA8XQWPLgaIcUNb7HO4meyyptHyS7RK/7I4q1CVty/2wuhtcR4I0S9JR2shDhG21mP
         KAo4gEZP1BPuuEuT652FM/IQQeiqlFxP4SSlWip3Bz9TuchggSS4QTUEaT8EgZ+H3iWi
         trS5z0aioRHB6WFJEOx2ydW+LqyfTkG1/ausurh9r3tUAEk1CPVMLevvC/fKaAedtz/4
         EqCsfpEyt6dTcz3tCowWZJiewbsP6gisYv+aQ20lee9haIIePM8g+XHxssBUNpLo2M6l
         O8bg==
X-Forwarded-Encrypted: i=1; AHgh+RpAdykjiVpZPNVwygeUYUkkRPtU3YHOTUZgVM2OQXtl2jPI5mh8dMi1JNFQ1MLYINeL6kmJ9bUdJoNxMFV+vNWj@lists.infradead.org
X-Gm-Message-State: AFuF++lzcpzGcWs6XiV5zm9LoDHNn2N4DBBCDZNtUR600V2RQx6/D1AC
	P+QzGFa069q7fjEZXenbMSY2vjCyBckZgCD7SBi87bGl3v63ClBLxdR9lilaoQhSu2GqtyAafUd
	xIkYTjtc58JFaRlnjOeq4X2nTJzXekSw=
X-Gm-Gg: AR+sD12vTpmTs9Fgh+1OEEmzUhiYWQnkJvF/Lw8rTnXU58v2Q1uGJwP60DhF3TBBGyF
	tjMjdh0mXvL4J9+tkIjQQ6zbnIIG96fBPrlBCIlKCitNSoVSo7BqCfk9iVyJHqsnJUHWE60y73/
	XBc9/kmYCXBOF7dF9P0P2cCDAZxuHc2D+cykdMqEdrC3WbV9PgXq4fMvZDN6Az0lQPXus99KHhY
	a+7HUU1ZUFx8qbixTjJbBMfu4C7ZTkKn4XYkqMxv2b72OLhL5pdOUAH+5Cwne/1UuCfUuTK3iI5
	lswCtBgzKGnWeJzZ5aT7H6VXdT/GyfmqHzxt3a2QaWB+m2U=
X-Received: by 2002:a53:d00e:0:b0:66c:fb45:77e2 with SMTP id
 956f58d0204a3-66d2575a752mr1255819d50.28.1787731957855; Wed, 26 Aug 2026
 01:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260808093016.2738659-1-lgs201920130244@gmail.com> <218fb204-ad8d-4005-a995-6ae931fa9942@kernel.org>
In-Reply-To: <218fb204-ad8d-4005-a995-6ae931fa9942@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 26 Aug 2026 16:12:25 +0800
X-Gm-Features: AcwNN1VIwYHf-K-salUzkbrUObzNrM3k5T8nRh7TzSvSmg4UxobHgtjT9MejMlA
Message-ID: <CANUHTR8Mp2d16Va2uxrnwSw5ro353T9czc8vMvzUvn61Pa9eaw@mail.gmail.com>
Subject: Re: [PATCH] crypto: rockchip: fix autosuspend cleanup during teardown
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Corentin Labbe <clabbe@baylibre.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Heiko Stuebner <heiko@sntech.de>, John Keeping <john@keeping.me.uk>, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_011239_236402_F5D3D5EA 
X-CRM114-Status: GOOD (  20.63  )
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

Hi Krzysztof,

On Thu, 20 Aug 2026 at 22:49, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 08/08/2026 11:30, Guangshuo Li wrote:
> > rk_crypto_pm_init() calls pm_runtime_use_autosuspend(), but the
> > autosuspend setting is not undone if pm_runtime_set_suspended() fails
> > or when runtime PM is later torn down by rk_crypto_pm_exit().
> >
> > If the autosuspend delay is set to a negative value while autosuspend
> > is enabled, the runtime PM core increments usage_count to prevent
> > runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> > during cleanup, this reference is not dropped and usage_count remains
> > unbalanced.
> >
> > Undo the autosuspend setting when pm_runtime_set_suspended() fails and
> > in rk_crypto_pm_exit() before disabling runtime PM.
> >
> > This issue was found by manual code inspection.
> >
> > Fixes: a216be3964c1 ("crypto: rockchip - introduce PM")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
>
> You sent vast amount of patches, all separate, making it very difficult
> to track and respond in efficient way. Do not do that.
>
> Group your work per subsystem.
>
> You were asked to clarify and respond to incorrect fixes statement. I do
> not see how you clarified and responded at all.
>
> Best regards,
> Krzysztof

Sorry about that. I should have replied to the earlier review comments
explicitly, and I also should not have sent so many separate patches.

I will group future patches by subsystem and make sure to respond
clearly to review feedback before resending.

Thanks for pointing this out.

Best regards,
Guangshuo

