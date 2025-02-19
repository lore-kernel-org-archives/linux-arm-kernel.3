Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C20C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 12:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYTsDpF0WHouv71tUdRGcb6sg816+d86Mu3TaaGSsBI=; b=aPdog2AIiyX/Jqo/XJY3NRgm6P
	AsegDQMDpSIEBlGRdqztjbulGvaXBLewTf6bYC66mf74v6Cm9hoZgSGWrkQ1eVCFq8NNBWnHUK9EK
	vPvYcbokGeq+685TrnxxaqJAx9zV8gDM3QEnTSWVwzlmVms7Vlk2JtFAZlsygS54clVPN49X8oRSS
	ljJiiRGQmZWQU+NRBpKCqebbrQv+3udJW6ImmgJFtUs8iJB8Ko7XryIHlodZ3j2f2LAOUEXyaETji
	41hBBjg6gVnU5oz0ak+LlBQDN3Pe5N4PsDvPOuwM6zh9PEBbpho0cyPV6DhxtgafhZahZtnre2aV1
	tFWGqjsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkinC-0000000CZT2-0hiT;
	Wed, 19 Feb 2025 12:03:06 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkili-0000000CZ7Q-0bYl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 12:01:35 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-6f679788fd1so46732957b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 04:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739966493; x=1740571293; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vYTsDpF0WHouv71tUdRGcb6sg816+d86Mu3TaaGSsBI=;
        b=IdK+dldzkNELVCvPWe5nuYEdZ648Ko/POTV8YO56cf5Igotldywvh8YHlNMXmxy4Tp
         h6zfkML5UoQnLKK35fFtGqt+vfic9cK16scx6loMn30a/+UXzmL/acUnx8xK7PJu9/dW
         XGYExn+ex/v2cQbx4wDQRFOw5ywd6hvV7WHk0xeaUsP32rND/fjQ8Ne7Axbf7Q6YY/qX
         6OPgioUxz5wDm7bgakqyj0kdbep+5v8EM5Zz2BRcDcwXM0u+iRhSa1U2wF0slvhefDhc
         s+9xFslMbQlwfT4EinHFbtWNaecGAnC/9DH6emiz/ItHm7YIDLu1+hMn25uZQ8LQQLa6
         yCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739966493; x=1740571293;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vYTsDpF0WHouv71tUdRGcb6sg816+d86Mu3TaaGSsBI=;
        b=VeawPYXw4mcMxPxPTCSuw5+gxQAf0/vSKt3HBoDK5I4+B3QfKr/bGiW4Pxh8mA6JkP
         6QGfN370VVRdziA/xkmP1OF9/VTWIFT++JaPYlOfMtJ6QyGqYIEkS6D+WOLLo5K5V+0z
         6jkBSt5CqyL69eOkWgEDcivBs2UBhmBpidViEj5/9cI5ZUUSnDBt7iKgdLF7yen3/UWF
         hd8ynkz6gGngoJg5S6/YP4bTy2+MCJMAp8v6ncTP3uO6OuQvVjc+OxA5QBWlO52Sd4/N
         7XQYRoRojdT2afhFbKBCblrePIcznVloXMOBFilUvcTXpkM10E3Ent5GLZgjFxVryIDR
         gDmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRqDw69/FG6gmGoSGIqTmZ8A8440yzRRyOWhbAK5VnmD/f0MHpCgqPBCgi9UQoOv3lkl5NrUgidPH5RCsdYpmw@lists.infradead.org
X-Gm-Message-State: AOJu0YxdQvfSL8RG3du8fIVsNbW16mUnv8sHN6I95ttgL7ffqlz9ixJM
	sgfdrN6rtfWmxENP8gAF0tnEhsxIYBmaWDiUmcmiToPqAqLdO4z4lshNyX4pgeRtgYhYP9Xp2jx
	PNJPemxjJKuGegU8FmDJ/0NICVwAi8nqAouUSKw==
X-Gm-Gg: ASbGnctEsrMDRIHxrOaZJPb8ltLWyTFs2vAmPms/B/iFyY3OgaGW2yglYHCU9EG0250
	EiXcA08xRWYb/GFbSIV1EL6FT9nfcEUvUz+JVVig2fLxnHEZs5JgdzPGbwfv1RxXOA0sTNGv4Pg
	==
X-Google-Smtp-Source: AGHT+IHwtF2lE+o2tf7V8rxyFVuVJraHT+N4by5azk0Xzf2f0imq0Hfnj6hm9T1/3s7AUPcxCy9jdh/GuEmHhudS/Fs=
X-Received: by 2002:a05:690c:6d10:b0:6fb:a4e6:7d52 with SMTP id
 00721157ae682-6fba4e682f4mr35370547b3.35.1739966493107; Wed, 19 Feb 2025
 04:01:33 -0800 (PST)
MIME-Version: 1.0
References: <20250217140145.117086-1-ulf.hansson@linaro.org> <Z7SRpEE0UFHdSEmR@bogus>
In-Reply-To: <Z7SRpEE0UFHdSEmR@bogus>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 19 Feb 2025 13:00:56 +0100
X-Gm-Features: AWEUYZkRptIu8JuTeXLBSwgNPQUIMYEr8XMgdltcJUsEkVs_mX89-B_EamjzG64
Message-ID: <CAPDyKFrcBZCYjcrxPMuMrk+3yqa-2N4Q-qCPu-qmmQ-a6DfL_A@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update section for cpuidle-psci
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_040134_190874_B3B8F87A 
X-CRM114-Status: GOOD (  11.07  )
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

On Tue, 18 Feb 2025 at 14:56, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Mon, Feb 17, 2025 at 03:01:45PM +0100, Ulf Hansson wrote:
> > Add myself as a co-maintainer for the cpuidle-psci driver and the
> > corresponding git-tree, which I am already using for this.
> >
> > Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Sudeep Holla <sudeep.holla@arm.com>
>
> Acked-by: Sudeep Holla <sudeep.holla@arm.com>

Thanks - and queued up for next!

Kind regards
Uffe

