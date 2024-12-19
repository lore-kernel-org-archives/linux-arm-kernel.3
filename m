Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2178E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 19:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2m+neTvn1J6jwPLArnz6aBhDUV+liWIisQpaER4E2BQ=; b=aZgmcpmXCd3MDHqtr/dCQGBAD8
	3GhfO/RPJ8gs0Irt3IhIJZo9CdCsUTfeGqssUziSPin67yJIbxLPd3ebZOSjf2Sy4p7IfIHZcTE9b
	gKJXVsbSORmOuTIJvC67D5G8uGozjTIqym68n42pmi8ZuFFxOOaU+JLiPSpM6Aj9zwHRuSQDRw8bb
	TElbhiZotyUeCFp9mPVz2vtT5QH9fuhiBARKGLO3msz6tkvh6NNbMqii4tk8n2wQrU66O8ifEfZx/
	bUKJokO/yjTKlk9Ibkb1sb4+3nsTaXm2G8LIPvbPlilIMRIyefZaFzQBRe3JUw5vDfe/6NnVmqg+7
	YlAyAVfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOLyU-00000002oPC-1zDU;
	Thu, 19 Dec 2024 19:14:18 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOLxM-00000002oEe-0gsk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 19:13:09 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5401fb9fa03so1169502e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 11:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734635583; x=1735240383; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2m+neTvn1J6jwPLArnz6aBhDUV+liWIisQpaER4E2BQ=;
        b=ZqiKC4KRc15u68/FWtKn2d5dY/43dxa3fu9kHJp5kiUcVXh3GgxeWVU2wdQhTA3Owl
         0lxZvXOT42Wz33pmBnGA6xUf1Fw7xAJqS+1Q6xrOqCHR3z9UQrJqWvrbm2M80Ne7GPaJ
         jh1jeWCWdCPi3Mxc9I3rRl3bVYfibPwxdNQzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734635583; x=1735240383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2m+neTvn1J6jwPLArnz6aBhDUV+liWIisQpaER4E2BQ=;
        b=RY/XTJ9H08ND/AINbr/9z8yrIhd3BsDBMA0FR14PxcxTLoKDjVuAMAE6IMVlICqcUd
         CO3kcYhSoEivxUUY4Ik69MSxaCFmlOy/3kR3ZaPxSVj7JzOlqcKJGfUKjIyZAFPIW9VB
         iXJFBQAS07f9h/dhtVuA52Kv7au6PrTz1d1ZQzRE3tL8I+RlyWR6s6EcIXxXVBjQhyhu
         cctkInxjgfuwuomTl+7aF4af+2I2PAHVLAbzR+7xt3EXaP/fvbrB5HBv3VFbWAQMG8Lv
         GI1Fp7hgVj9vSciaMC5qfOGJzboZHdrbMG5YYCKt+DtX1XyILXdcixgW2OZpBoRNxBvu
         HW/g==
X-Forwarded-Encrypted: i=1; AJvYcCUR8I0yf68/7i8ks3gsw/AbVPt7vaPqGViQDU2mdOXs02Fh4fOAnTt4LhVTjTp6YnkD3SDMSbEUfn3l20q97TD+@lists.infradead.org
X-Gm-Message-State: AOJu0YykAgXSUu6xZNawpg8zIYMhJrwiyWvZRsTPucdYqD4IMEQQiDXL
	Q1XSup+h3OygwMP34umlwZ3cDk0xhUsX8eiORseb0q9oasqoUQmSSpqhM88/jWibK72FrVyPtwB
	ruppP
X-Gm-Gg: ASbGncvIz+y5yk33utnxqgnc9L6pNcvJCW0p+aeyERv6u9oyUjErB06UY2qvmK//hln
	McOjCTF73ks/KxNI7RT2BYAWLDdhR6Sor67DAoFu1AsAvydBYiHHPBb2DXOX8n3Xcs1LRFrIoI7
	ufQLp1QF4C31quGYQJpjKqyLXKXaUheXxcVMQA/+SgDJ/284mjDUkVgnT5KJ/rypQxKQvEulr9/
	UtwLK7ff5wkJxGausYP1AaIoOrn+Hvpl1zY3upPthndqmMdpNQoMZaaDYjfziT0tnRbo1pRBMCN
	QsTCRHcIxmI+ld5Ehmhd
X-Google-Smtp-Source: AGHT+IET1JS1mT6Sl/4HcwmFyZR3R5BjEPOJ9ISQz3GhVTdJaq0Bc8EfsLFRzTUVeh+R0ou2rC2VkA==
X-Received: by 2002:ac2:4c56:0:b0:542:23b2:8010 with SMTP id 2adb3069b0e04-54223b282b1mr1129290e87.23.1734635582593;
        Thu, 19 Dec 2024 11:13:02 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f782csm247853e87.38.2024.12.19.11.13.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 11:13:02 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5401c68b89eso1271161e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 11:13:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXhytoFSbJvr4mhPABTyPQ8grmPM6OrYXZOrW75dPvK5wkN8wQynei0RMefNNFLCQ6nhdXKlPAslbprNM4lfdaV@lists.infradead.org
X-Received: by 2002:a05:6512:2384:b0:542:2192:44dc with SMTP id
 2adb3069b0e04-542219244f6mr1395323e87.28.1734635580713; Thu, 19 Dec 2024
 11:13:00 -0800 (PST)
MIME-Version: 1.0
References: <20241214005248.198803-1-dianders@chromium.org>
 <20241213165201.v2.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid> <20241219175128.GA25477@willie-the-truck>
In-Reply-To: <20241219175128.GA25477@willie-the-truck>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 19 Dec 2024 11:12:49 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WhzZ_v1+WPpG9839JwN=fKyiY_T1M37RAU_e9cHy4XGw@mail.gmail.com>
X-Gm-Features: AbW1kvZhv1mh_PrrK_8tPeTV4O5T1QFdsJAfISMEvI9OCn5vId8bs6RT8MrmOxU
Message-ID: <CAD=FV=WhzZ_v1+WPpG9839JwN=fKyiY_T1M37RAU_e9cHy4XGw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-msm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Julius Werner <jwerner@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	Roxana Bradescu <roxabee@google.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	bjorn.andersson@oss.qualcomm.com, stable@vger.kernel.org, 
	James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_111308_226231_96420B82 
X-CRM114-Status: GOOD (  18.05  )
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

Hi,

On Thu, Dec 19, 2024 at 9:51=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> > As of right now, the only CPU IDs added to the "unaffected" list are
> > ARM Cortex A35, A53, and A55. This list was created by looking at
> > older cores listed in cputype.h that weren't listed in the "affected"
> > list previously.
>
> There's a list of affected CPUs from Arm here:
>
> https://developer.arm.com/Arm%20Security%20Center/Spectre-BHB
>
> (obviously only covers their own designs).
>
> So it looks like A510 and A520 should be unaffected too, although I
> didn't check exhaustively.

I was hoping that newer cores would hit the supports_csv2p3() check
and be considered safe, but I guess the white paper explicitly says
that A510 doesn't implement it and is still considered safe. I looked
up the TRM of A520 and it looks like it also doesn't set CSV2P3, so I
guess I'll add that one too.


> It also looks like A715 is affected but the
> whitepaper doesn't tell you what version of 'k' to use...

It doesn't? I see a "k" of 38 there. Wow, and Neoverse N2 needs 132!!!

...though I guess on newer steppings of those chips they'll just use
"clear BHB", which seems available and is the preferred mitigation?

