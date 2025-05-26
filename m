Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EDFC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 10:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNDOt/KgMMP7lsIAa87g1prMRWTJTTagQvC31pmgO2A=; b=lm61RJ07PTY55BqZZsjli/SnYa
	JzxbV0Js/h+6JrHUhNkCo7Q1vbnD+DW50ofCKgHYzKLUC58PtrnLIGgyX4tHRX0H7/1nFBxV4I1Ls
	4H8VQYAaeOLnCinoOxYLUIBQdE1t1Mh6ubSP3Z/kqLI/xImwwzpNhbb+tQ7keZpumHGh8Al1WGoVw
	MCc2WX6+gGNrO6I3kgmeyCx8pQHs4xj4LxVE8uZ9aeL5eLaL7eWGqliVMA3Ol91ZpYe2ReAOvj3tn
	R2F2IsOd+d3k69G4/MTb6jaVPV0d6ZbdHURQZroZJFVd4pYddXy5tfSsYvT3pRj11DOCARB6+wee+
	kfqeO7Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJUr7-00000008bKS-2HYQ;
	Mon, 26 May 2025 10:14:53 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJUox-00000008bAw-2adn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 10:12:43 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e7d925ff60bso1256447276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 03:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748254358; x=1748859158; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wNDOt/KgMMP7lsIAa87g1prMRWTJTTagQvC31pmgO2A=;
        b=fUPZ1cfWcUsFIhNELXY1tFC1ZesyQ/0JQtREm1nlHfhQomXNPWgphchwBUZ0ptFxo/
         J1ab4dgNEP5Vu9Nl9bJheqUEA92yTe3uMXdkb+Pho74DarjmLR7g/Ugmgl/3SzENa7P/
         GlvpHk93xAOU1En3CqnAskmPOM03Hw+ea7RFJxpG53tSjbfwBKYjfYyjQ7ugiTNK7/Zb
         bK8JgLGOc3ajxdUBCmlLOkW8K7vg91tYNmmQusTO+rFmT8D3ZqWy4A3rRe5ji//dlUXE
         hse6Cu4zpVcPDH/LbD8KqBgVlSshzjH0yZWAvqfs1bSi8EeAqlydd+XBoBgTccZwqBCa
         zsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748254358; x=1748859158;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wNDOt/KgMMP7lsIAa87g1prMRWTJTTagQvC31pmgO2A=;
        b=EunSgeQi99Fqf9itsbkzhOOy/Qzxq9Tjo2lLGM55gBzw7LNJfuugS5+Hwzxl+nLr7O
         ypwF86wxV3GzSRjdHa1E6E6773FDsDnSjEVum3Qhh7gaYEx5qCLTNUh+acUYEeOk6xDp
         C3djHnBeprJg7NqJ08dD4MeKIOXk1rfXf0UneUQsNNMNBdhyMBczGMCBUMakOPW9fzo5
         ykBWNFcDjJ43QtguSgiFLc5zQnXZ64w5NxOMsnSOaPlChbIs171vBHEaviZU6zgL0g6u
         0fDqSFlyznxsSERi6mL3CheiDxq5GuE4cVtbUMV6HEuh9TxlQPOOVCu4zU1aQ2LtvwTe
         Rg2A==
X-Forwarded-Encrypted: i=1; AJvYcCUKGOAGbKQkXxQYKNQPTgFkFqA0YsQdRX0/PhKbXfWASbVNuo/m0X1NM/oy+6aDTw8Dgb0R3SD9lbs9GXogQm3m@lists.infradead.org
X-Gm-Message-State: AOJu0YxoGtJh00nRY7mNCHIWDC2GetEaFa9BLeykr25PzuqGIRcWf8MK
	raC0F/kxxqsoe39f0mF9lGmd9qpc82tR/lpWr0xcP1exrf33pQHij6rf674DWgwAsHR2UhYGoHN
	bSwBf21vWwhH/5QnOhCQPTAATkTp/m+zAiBYm9F5Awg==
X-Gm-Gg: ASbGncssJNh5ucmHgI626TP+MnI2FSsxiv/LqOgO8g1vuSmIFDoGQh16RxMOeoT+Imq
	IxiczCuDR0diNA+y9BNuoIy4AVr6lgOmvadTIsdn1k7VWf84WeRhu0IZT9BJR5YZz5+m4f4RjWm
	eyShhyPYLpIzPu93Ea+/wdjT5/T47RL9ibqvupmtNe+cdI
X-Google-Smtp-Source: AGHT+IHi2XOZ9dRIdDcFBl3BRRFnnGCoagXOgAmEZ2Ih20GPqbGzZkP+XJCYm0HJs1gaCBhpq5GmobfeIAleVXtAPSQ=
X-Received: by 2002:a05:6902:1082:b0:e7d:b5bc:aa7c with SMTP id
 3f1490d57ef6-e7db5bcabb1mr1985809276.16.1748254358450; Mon, 26 May 2025
 03:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
 <20250523134025.75130-10-ulf.hansson@linaro.org> <4a0ec467-b81e-4282-8e09-b7adc67eba97@oss.qualcomm.com>
In-Reply-To: <4a0ec467-b81e-4282-8e09-b7adc67eba97@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 26 May 2025 12:12:02 +0200
X-Gm-Features: AX0GCFuhoe61jaT4ElHv6kD_woYqu09-YjR-85TQ3dhfrASylj73JDHmzoEBPqk
Message-ID: <CAPDyKFo+DDuBiic78hdN6JVSO1iQbJTvJgPwYaO8Y8soaJyEhg@mail.gmail.com>
Subject: Re: [PATCH v2 09/21] pmdomain: qcom: rpmhpd: Use of_genpd_sync_state()
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_031239_655913_649E6F05 
X-CRM114-Status: GOOD (  13.93  )
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

Hi Konrad,

On Fri, 23 May 2025 at 21:42, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/23/25 3:40 PM, Ulf Hansson wrote:
> > To make sure genpd tries to power off unused PM domains, let's call
> > of_genpd_sync_state() from our own ->sync_state() callback.
> >
> > Cc: Bjorn Andersson <andersson@kernel.org>
> > Cc: Konrad Dybcio <konradybcio@kernel.org>
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
>
> note: the subject is wrong - this driver is rpmpd, the other
> one is rpm*h*pd (patch 10 has the correct subject)

Thanks for spotting this!

BTW, would it be possible for you to run some tests on QC HW for this?
Any help would be greatly appreciated.

Kind regards
Uffe

