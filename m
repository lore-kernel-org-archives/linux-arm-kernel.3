Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A6AD767DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 15:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PsNfyZkAbUdRy3BMPYsQyztzSUGdi05Vyd/UT3Z4MOk=; b=pTC0Asgv9JEDEohQ/rcr7I4vOK
	7aM+yprCFZIi5IwOcnVgIO86KdjsZpyD50+x4RcJKjeXzGQcluOeDKllpRZNTno7ev1usiRsByRz7
	cgEToYeHkVi7bxcKGginHqYxU7onKjy6shigb6bl5nG7j2ll/WLRc4EekQ34/D8kkMOm6HlXE667Z
	+Q5it/QWBh9yt9srKRfrOyyKkgOukdboWVIY+PFjgZV4ydJOOku0jEEuYmWMbSgr5gzrgM0v1e3jR
	QyeIl8Iz1VLm5gn5ek2qhpEJq1uJBj0sMXJUGX6Z0BuSDheu5x4NsM6cbiaJ4KuLriRMBPHNDtChy
	0eghGEmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6XSa-000000045qm-2MI4;
	Thu, 31 Oct 2024 15:51:44 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Wt5-00000003wbG-29vO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:15:05 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-6ea4add8a5fso10109157b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730387702; x=1730992502; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PsNfyZkAbUdRy3BMPYsQyztzSUGdi05Vyd/UT3Z4MOk=;
        b=dWVPOfC5XNibTAE01XMyALD8c486v8UDrc/Y+2SOVagu0FZXYE7nde7QpA4k+Gp2YT
         iqZ2d4NfkwDrQUkLO5fSkf38P85MtgfZaYomU50esFCkm+2XtkWsU5sqIDKtacywaRl6
         Hzl8zHAJdTSocxpN1ZEfpKjWdMU5x2UY1sxGMP1wdiTX3MC7MfUULZ4pQML41ZR+XMQl
         VQNVglqwDvY/9Fg3zIUa3joE5Y2LvFbEwDv8vZzE6Yh+KK5xt3kRpoqAmqVC/yHRQlhP
         ZAsfv8ltR6iUCG43kHJyYK55dbfYTGnIJoGgxCDjN6UPgAK+bS7hyu03aAA/xButg8Tq
         Wq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730387702; x=1730992502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PsNfyZkAbUdRy3BMPYsQyztzSUGdi05Vyd/UT3Z4MOk=;
        b=pIyy9nbaGKq+8kcMY/c8HfUwQayOmYjcrhAxTGXZl8i9eSeuon4WjMH0X1Ibc+q1R0
         qhW6kh6yWSOCEbLqvQ6ED3SHJubmXxC/HSAPhjSJaJ8yFiF8Z0XZfpyTyAxoRmY/uIHM
         Y6xTww2n/UnRCT7j+H9KBHr8m2bavc1xj3BWFuCNhubFC3wb0ZJR1GvXvujGUklSbV8u
         hLZoY7ehvBAaIwlL8+XxgheaHWPfDz+M0hZeDF4QTjQEDMQWaGg8oDKckUWGe86wavY2
         N2D26l9OUUsQXR4nDVHKoz87AaQ4Dk4fkbNXWoa/xbpmZSUzLCAJnIKnliYfRSDC7OnI
         PRdA==
X-Forwarded-Encrypted: i=1; AJvYcCXcaxGfWA3TfvfQotSDBlWeUdh0ldCw14PpzZuJVgxym2ylKfbygB5dkqELhn0NyA6Es2AfsKRyrpRMVQDUhsHG@lists.infradead.org
X-Gm-Message-State: AOJu0YxVAVTeuAe8DVnOihKgGrfaKPVPcH1krDPh2VszrEvP7+REev0Q
	XRseav7jdChXOSyLK1vuflYQcGn/5GFyAw+md/93FwP/POYzlfUjYWfBGP6EBpqTnoClHbS/lqp
	9k0Ekbg5vwpDl/D7gFuO33HmC0Oj0LhStZTHTcQ==
X-Google-Smtp-Source: AGHT+IEzbgAkvn+Kbd1W59aqNXrS5kqasKo2UcyReXDn6RNKVnLzNobyJmTaqWwwzBvxE1e6RcSS33ZES6nefnm8xiY=
X-Received: by 2002:a05:690c:3803:b0:6e5:625c:5ad8 with SMTP id
 00721157ae682-6ea52542f0dmr43442727b3.37.1730387701805; Thu, 31 Oct 2024
 08:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-8-4cfb96d779ae@quicinc.com>
 <omn34rwurlxrjckb5d6xb2brg6zwcizonmqyfckvngk5msrfav@b3i2bdjk5vw7> <2aa768a4-b0e9-4b2f-8d74-736a88cf81cd@quicinc.com>
In-Reply-To: <2aa768a4-b0e9-4b2f-8d74-736a88cf81cd@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Oct 2024 17:14:57 +0200
Message-ID: <CAA8EJppZyJt_MWrafSKReuCXy0RtEAQ6VE-kt_Fp41eFpsW2SA@mail.gmail.com>
Subject: Re: [PATCH 08/11] clk: qcom: gpucc-qcs615: Add QCS615 graphics clock
 controller driver
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Stephen Boyd <sboyd@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_081503_600633_8A84E74F 
X-CRM114-Status: GOOD (  13.15  )
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

On Wed, 30 Oct 2024 at 20:04, Taniya Das <quic_tdas@quicinc.com> wrote:
>
>
>
> On 10/19/2024 1:58 AM, Dmitry Baryshkov wrote:
> >> +static struct gdsc gx_gdsc = {
> >> +    .gdscr = 0x100c,
> >> +    .en_rest_wait_val = 0x2,
> >> +    .en_few_wait_val = 0x2,
> >> +    .clk_dis_wait_val = 0x2,
> >> +    .pd = {
> >> +            .name = "gx_gdsc",
> > .power_on = gdsc_gx_do_nothing_enable ? Or is it controlled directly on
> > this platform?
> >
>
> On QCS615 the GPU clocks are directly controlled by high level OS.

Is it one of the gmu-wrapper platforms?

>
> >> +    },
> >> +    .pwrsts = PWRSTS_OFF_ON,
> >> +    .flags = POLL_CFG_GDSCR,
> >> +};
> >> +
>
> --
> Thanks & Regards,
> Taniya Das.



-- 
With best wishes
Dmitry

