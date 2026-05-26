Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31491CD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 04:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjzT+YU+WzbbKcxJRdWZ4am57GNWqPjoWyeRr7PJJSQ=; b=vZcm+nmPjmyzxQdNIA2ui458C7
	a97Nb5rfZSuG4zrMiKEhaGlaEyYG/tkYGbohAfuC2c86vOAyuZzbvT8gtkjRUjNQ76SKFT0Xg7FsQ
	JaRxz0za+SkZ0rQOPmnFRYcRVsRNGRdehnQ0NVKuMBHyGlORwwSq1QH9s50I1e+uRjhZ/LOU1yJDZ
	/xr1QUpc7I7NZ5ExxatlYDAGDHfnKU0711M1zu/Eta2JPB5OadPWyYpn05qS/UO4tku7A4MSquxhK
	HIukTbe+EKtmjb/fUQewVEYDOMeyJHQ9hBthU+RmtX7akrLyvyrgrTzDUeMwps4kqGS5uTYFtsoVB
	jsYW9MbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRjEc-00000000zUd-0hPa;
	Tue, 26 May 2026 04:17:42 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRjEZ-00000000zU1-40H7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 04:17:41 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-36b0c968fe8so168746a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 21:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779769058; cv=none;
        d=google.com; s=arc-20240605;
        b=ZzDreOnbCtH985Ygf9BL2YVFdIFqbsVmLwa3XCEUqcZ2sRlGAr5qM8BhM3veDqFHyM
         QMialItl6Cr9tKkjpkRlu/d3dF/zbzrPFDRw7ILgLc4frweX0JCIE0P/pdRI9OqaHNnW
         1FjNzwm6HBZw1wVOShM3iylI8cu7P43YrOrazPX7hwYigziQVuQ7pfnvScyEhubNGiR4
         cVtl1L4bjnRjx1UwlXVfTxxmqN6BZV0Mgxj02oYfwlyWBu14b0q2pY8GflN6haJQDBGW
         cXjwvee9Jq7rDJQK10m2RFg8R9IVB3G1ufCPzwVHNk7XYSgNmfKixK/F2Mhi0sz5aRWO
         abag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AjzT+YU+WzbbKcxJRdWZ4am57GNWqPjoWyeRr7PJJSQ=;
        fh=KJJn36ggkO2/8rV0ozpen+Jxv4EQJCUhYCgdoJ7S9Sc=;
        b=eDnazy4ecoWK2RNPB1z29TO3zhzVSWwTuB6aQi7IyG4u/t+Wl2bGrxOoiSd+gXLwMH
         HonMjdM5HUrN51ioCX0mf2DEKIhwY2j57Hjevn2zeHIBUIzedw8ru+Y/V2DIFP/eL2s2
         krKLrL4erGqZELAZ5Ad1d6R0PCJdzNN0Zs+ywwvT6Zw2YJ6tyg+t8xiiH0KoqL2bYceg
         ZayLpYlXyfIZBQS5eRvKQjyfmY/IDPsLlU24P8GkwqfE886JhiWzrepe3fjSO0O/bWiX
         GduwYP3P7C3aT0MIxU/TNjfFBrrC3hYTJA+5YhA+vWMgoTaFRH1QH7g20gOqMajZLZ52
         9Bxw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779769058; x=1780373858; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AjzT+YU+WzbbKcxJRdWZ4am57GNWqPjoWyeRr7PJJSQ=;
        b=N3sTn0AyOaO6B7IEoyV8N+wpPNmGiu+Fw0/Z295Ql/ti7WeJXDX2isbPNzuu4PPk48
         D+UKmtaFGIL8hVqOKGvs1uJM2L1eD9HX2klcmbznoo7HjnIcBVI60QUwJyGMgfXs2kcG
         AAuKVdKjL01sy2Hnzci5U4pd4+ssjGcYnL/xDDkuhu89o/evcBTRFWnsJfQ7aM6qV9Ba
         9elPl6fs5fP49EjxVb92X0tK61b5HUkvyONUUfvi/hZVTdQGyW2PVTuaVQG3lRTmtyXq
         9eXQnQH7q2/wvsurd10hM577RdseG9q7LKa3T+yRFCaeqcDNrTy3t+mrmaITqIiM31AF
         sY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779769058; x=1780373858;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjzT+YU+WzbbKcxJRdWZ4am57GNWqPjoWyeRr7PJJSQ=;
        b=HtRQw5dU9Mu0bVQJYc8BoasfaaG4UtJOYhoIQUdOSsUxnX07Pz54jZuG/utHoSw6aG
         IWAOahL8h+E6aNB0aPmCjMABGZi0DelA7NtaTyyuRJmjZqhkLh0IPcbGuW0HH6Ibxvd/
         r2bkx4YqAA9tFPR57w+xCAnyfJREfjzSh+0tzOBugwAgyGhtVtgYPSiYLDoVTdz8vk6k
         UKNqZTvQzOm4Anlt/+KUaxg8nDuYRm4Rhdd1LNEeKcZ/Ejrwx3Ot8imd4Gh/UQybvbGQ
         /3xsQRznPQzudct8Adva5eTl06/CQL0wwz0wusxBicTf+Zy4W9nP1TE+1O+WcgxGPJ7e
         wR3A==
X-Forwarded-Encrypted: i=1; AFNElJ9Sfa16CIs/2UY7bSbAG/U/OyR/ldn26vEGa+9duTY/rCGL9kh2w3mHb13P3V0DoyUynYRBgH3P07MzdAHUsVsi@lists.infradead.org
X-Gm-Message-State: AOJu0YyU+Z+rcoV3gs4nmTiHHoQv6VdC/EKkgOV5t9MFOkx3MioUUCFJ
	ISyK36X8Z6wAgBTgFB/JAFEmkxhnk/qWFI4ydN/CZKZ6fP4VjvfUcK6K55Joz3aXCPp6WoPSDaU
	PTHGPeXOFruEppQQVi1wT+RU28jnLEMQ=
X-Gm-Gg: Acq92OHyqSPM9VAoqRZTifi1FpYGbvrHPCaeE99SDRFv+JJMlWabrNI1RS7yeBZwq+D
	PeJC5FlJ21tioKHge9qtxgYKmJBQzAQeURb+C2mxoMs3EjR7fqPL9ficsyf19HSmqptp1VL0xiP
	dpUjThRZ9/+XrtHML7GpcdekSSVwy/cC7cHjFDKMu7ZZVRDyG1JxY69RosQEGIhe0YayyBrwipo
	5cMHqdfpeTkVgOeHw/J8Z4kJ4qMntJQeDuZKi82R5ap978U7NjngWaXYQ+RhgzRfrB28VAu/JJy
	DsfEOF/+Es7erSRRO1P1AaYdmraq/IZ6rcom8kFc/jbF6lnq
X-Received: by 2002:a17:902:ef11:b0:2bd:d7b5:83ed with SMTP id
 d9443c01a7336-2beb07001camr199500955ad.39.1779769058465; Mon, 25 May 2026
 21:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-4-phucduc.bui@gmail.com>
 <CAGb2v67aXgg8BmrtVVBi+_n32OBcQnQgEUe3XdRp6Jj=aEr8fg@mail.gmail.com>
 <CAABR9nEFGOX5GnQ9qpJY-T-92dA_kDcVS+qBz1ior590G_x6gw@mail.gmail.com>
 <CAGb2v66accoNhStHGhnoUM0cw3fyCxfuvS1a-brL9C-ZO07ChQ@mail.gmail.com> <CAGb2v644whCr6pRSfGMuQ=5afUMbfC2Y3W_kjdMdp9+5+kJhJA@mail.gmail.com>
In-Reply-To: <CAGb2v644whCr6pRSfGMuQ=5afUMbfC2Y3W_kjdMdp9+5+kJhJA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 26 May 2026 11:17:27 +0700
X-Gm-Features: AVHnY4KjIHp6k8PI6oQzPKSFMzC_yNK4NVye8enq3FNJPQ2UT-iy1gcG4S--peY
Message-ID: <CAABR9nHbwNheKRSzevSBnD+YyLeYVDA4FLH9AN8Fo1uX596rSQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence
To: wens@kernel.org
Cc: broonie@kernel.org, codekipper@gmail.com, jernej.skrabec@gmail.com, 
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, nichen@iscas.ac.cn, perex@perex.cz, 
	samuel@sholland.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_211740_010784_1E16E36D 
X-CRM114-Status: GOOD (  12.72  )
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

Hi Chen-yu,

> Oh, and you could also add that the resume order should (normally) be
> the reverse of the suspend order.

Thank you for the feedback and clarification.

I can certainly rewrite the commit message around the idea that the
resume ordering should normally mirror the suspend ordering.

However, I am still slightly unsure about which ordering should be
considered the preferred one in this case. If the reasoning is purely
based on suspend/resume symmetry, I wonder if changing the suspend
path itself to disable the APB clock before the SPDIF module clock
would be an option, which would then naturally lead to enabling the
SPDIF module clock first during resume.

From the hardware perspective, I originally assumed the APB clock acts
as the prerequisite for register access while the module clock mainly
drives the functional audio logic, which is why the "bus before module"
ordering initially seemed more intuitive to me.

So I would like to better understand which ordering is considered the
preferred model for the Sunxi audio blocks here: preserving the existing
suspend/resume symmetry, or enforcing the bus/module dependency ordering.

Thanks,
Phuc

