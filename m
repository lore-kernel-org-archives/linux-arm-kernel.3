Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA0FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 18:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3Qc1STNEB1yk7+zuWvJIvGi5r/g6z5PQsnptk7pOCk=; b=iEbZ1nDYCLz+6I12oSX0cWJ+V7
	3ABpHcO7LygnwJUfXZJaagbxXAc9TE1O2wNYFOnXsdVlgPqfXbehHDSIyWWBIPiDG3cJXlskV2Y+F
	XRde1sDitXXTNUxp2vWhb0oc7AH82RrlS0oAMeFw5LQgT5ZStMNbEGRyTVvU3I2rVlcTRfCWx9TIW
	kKochUXaYNz+kG8inbcRTj7Al4fEWmJsYvWNd1oYQ/M1RlG1L5iIr9qFQMrnA2a946QP2BuNa13XR
	t55802g4sXvaKpVoF0WIK66g3bq3FEY9t/CfC3pRY/sHbJLeSPpws5dgpfTgOR48cSKdjq6BFjZLG
	H2yr/bcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3fgt-0000000GHLo-231z;
	Sat, 12 Apr 2025 18:34:55 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3feR-0000000GH9S-35ZF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 18:32:24 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-523f6c14ce4so61447e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Apr 2025 11:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744482741; x=1745087541; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3Qc1STNEB1yk7+zuWvJIvGi5r/g6z5PQsnptk7pOCk=;
        b=SnW3nG3TItFmiNljM7XxvIKum2vpRoQ2BSBD4s4DB0ojV96uL7JRvaT47QmtLQVFGE
         llAHN9GD0px7/lNSGvP7upzFfbysSQ1FZRCmdcF3wwiSLf45ziBlDu+3hohyya5fhufk
         n+MOBC3NKst7qkKNs7mQBJAvdZWHAHcv6yo3C74fMcYccAQWHyTBlCSjHn/nLyoly4qY
         v5LP6NFWQl+T2Kdc1H0oaGa1ofdnUHNAHa1B9er5wL9i7Vp6AUvRf4X/aWE7RYEOuAVB
         eHB6AqE9ir0M/uB+fAJfK2evdvkzGlhKSvNEWdXHRtQG66ODumnm9TRxqjk7KxBBFctK
         wZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744482741; x=1745087541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3Qc1STNEB1yk7+zuWvJIvGi5r/g6z5PQsnptk7pOCk=;
        b=Ewe5jHObaYDRHfDS7A9m/RGhpzH/3zZ2aj0SLTpIBYRzP34z57qbdcOYQhiK6KumT1
         kS69zP/596GRy/ORRFcjuAULbWtb2rJ9wKCG7+GJaTMai2dLYz7jUCMBAiM9r2hDcp3G
         pkjMsaw8GCvBxeXPRhuzS9NdtBUwAHsKH2nMMoVUKJXiT14gjScvICscnIQD5JheyuZU
         9AX8uZ3afB9IQw6Rc1ArZQTnTq/y/YF0/BdDA6GMkydRNB/n0jluim3M1U99J14i6hJM
         BTBFURJ3SZulS8Fvg1HQppQ8XyHrT7ehtQPnuuZ6w7YrXvNezU4NH8phq7zfol5ZIyiJ
         W/jQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+4+NRWDcYtoMccAYGRJTF4TYWOlujX/+NfsIEFUB2r9NW85Y1xgBXf+OyYcBnR0Zl5EaIh2TubcHOat4tn2/7@lists.infradead.org
X-Gm-Message-State: AOJu0YzHV0bjTziMm2ftD5M2+LeMtNTBd0imuOZwOxgmjajSrP9ytMBL
	adRgOOe6oopZkU2EXfjL3CifLHWItamachj77WN33HTyne4dhCqDaPvMcFwihbDoLWm/jbVs4dC
	EJwSnwxLv+rTONEW6VeDLqyfMyg==
X-Gm-Gg: ASbGnctaj24P2roKf3pVbH0QB73p5CIpegv4u7NC0HXeBNAw3GywduOP1qWzb8i5EK1
	eHyniDAjgOt9kjJkT1AF9nFtDDVCTn2sgsaiyqyN6enoTgCqGMHppTPKe45gowNK4lYGDvKXeFW
	Y0Wf/sgBPvuPk14+1rF6LmRTc=
X-Google-Smtp-Source: AGHT+IFCaLFGAxkVT2lKsAkCtftPnKhBh6OillpidkjEeNtDizhqaCJZ4mRNIO8IrtKoYG9vlpMmuPDQ1K3J4xbTIcg=
X-Received: by 2002:a05:6102:15a3:b0:4c4:e3d2:25c2 with SMTP id
 ada2fe7eead31-4c9e7836f75mr1550793137.6.1744482741062; Sat, 12 Apr 2025
 11:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250412180831.3252963-1-chenyuan0y@gmail.com> <0081fcd8-da99-47b2-b136-3ea04232046a@stanley.mountain>
In-Reply-To: <0081fcd8-da99-47b2-b136-3ea04232046a@stanley.mountain>
From: Chenyuan Yang <chenyuan0y@gmail.com>
Date: Sat, 12 Apr 2025 13:32:10 -0500
X-Gm-Features: ATxdqUFVNadBq9M9pZcwFONeYCEW6qDbC52ykl-YedCykxT8ppzW_PXwHA1Fxys
Message-ID: <CALGdzurRtHLOokUH7GOhmkDkzBioDFt1iJ19eSbrjyeWW7p4KA@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: scmi: Fix possible null pointer dereference
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org, 
	viresh.kumar@linaro.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_113223_774535_5F083017 
X-CRM114-Status: GOOD (  12.60  )
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

On Sat, Apr 12, 2025 at 1:31=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Sat, Apr 12, 2025 at 01:08:31PM -0500, Chenyuan Yang wrote:
> > Check if policy is NULL before dereferencing it.
> >
> > This is similar to the commit cf7de25878a1
> > ("cppc_cpufreq: Fix possible null pointer dereference").
> >
> > This is found by our static analysis tool KNighter.
> >
> > Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> > Fixes: 99d6bdf33877 ("cpufreq: add support for CPU DVFS based on SCMI m=
essage protocol")
>
> Henry Martin already fixed this in commit 484d3f15cc6c ("cpufreq: scmi:
> Fix null-ptr-deref in scmi_cpufreq_get_rate()").

Thanks so much for pointing this out!
It is good to hear that there is already a fix.

> regards,
> dan carpenter

-Chenyuan

