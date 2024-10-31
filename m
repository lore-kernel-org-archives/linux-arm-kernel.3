Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B2FE6896F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 10:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T35wMVs1MNW3myHz/mrvwXNZ7HSH/Zu34Y04Hh5lKAk=; b=M0ApBWm5jdcYCaXAzCVKfn2hBy
	U+eYNzTEowYUVJ0ECNqU+k8PEVqD5JsaFIWOSwVkwy3ZjSOSbGBOB7iC2Xze5nGgCFxyc0ln/DsQr
	p1OEoz1Fjax9+rFTa9n7aEAYWg8LBfNsSOulWfg9Nfhkj6iLVh8AARpfgD5Tyj7PPcwxSu56N/nbt
	+5GInnhpuOqP5ogYYL9u739rwPbg4FwQ+8M0LDe4ISfBi5j84AcXNQuL3s1ft5W0GR/Y0ekukcjyd
	d7kXHOWgIPGrD55Htyy4NvOsCI8TWlUe3bxnFN+vZoRBf5CLSm/g1e/5qOxqPEKKSfC7k7u5PvRde
	CrXDjXKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6SC6-00000003CKD-2JHJ;
	Thu, 31 Oct 2024 10:14:22 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6SAJ-00000003C1p-0H4r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 10:12:32 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e290e857d56so687517276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 03:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730369549; x=1730974349; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T35wMVs1MNW3myHz/mrvwXNZ7HSH/Zu34Y04Hh5lKAk=;
        b=ps68sSn5Squ7i0Ru8KrsyTbF7ECuIxHyxRy6C5V2S7l546BZMeUHNkyQOOiBxk+d7o
         9Ch3+cIjvSaqcN2bxmNVNhSMGrE/8HOfKegQ/bvg2l9L+uZYQV0scj6/Cvzi7ju7lpQd
         bwJcRP/tAGXZfce4s9ajelsrK7BCcKY6Q2aQFZ/tCI9albHB9iVy8/qGgFxdIv2cCtWH
         9GGF29xtBxbcZDKoaqJBb8krvSjc/UGxxCL+48XOY6MOocuTyEvIGouKzgNXN+YB4c+P
         oj89qEFvr/8TfB4obTKKJqvsTFMgYxh22v7L94FR9xl0zKXXlOlBkfbYRbL4ZG/jSscW
         6txA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730369549; x=1730974349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T35wMVs1MNW3myHz/mrvwXNZ7HSH/Zu34Y04Hh5lKAk=;
        b=nWARLYqBFM54BwDdpgvww8Yat5ye2cbsR9nFJ6p+pdAPSj8sBRPK6a7HcKpIOWbWKl
         RuiQPL26GG/js4ZRMlBQpd9fzUms9EKS+TuZmn4Hz0Smi9w5gFAXdxF4ORCVK+cW00dk
         oOEOv4yS1/BqXUp27DnWcVLb2MvOJ8SN3sXKfmwdhAZQoUih9FCXkSUVLbhGoswTrnUD
         7IZriGuF5DOVqdP0XLnv0GtJjlqsDz9YkqsNKYh+OXf2dzU7zeRzruW3AggdKJ3S9hpF
         VhsETfS16lsLW+YF7zVxTxspF3+2IkxIfB+R1bEEnQ8ki3cWeQLf+Hp4wcgCra3cxSUT
         z2Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUb0siePjnplFzlrPIWARq2tryPgPKWuFCpIJX/BXlwiAJBSYbtgRq8rX00Kaf8LkAPCpb6jzcq7yWtyl9Ud+Sj@lists.infradead.org
X-Gm-Message-State: AOJu0YwycBGRKEyZCYaDMw0zTD+lhTsRHtCAFsh4LCeG+1UQJBb3714S
	pYM9iAASW4QIsWCxNcTqVhrYma8IUp9hJz2SSr/Dz2Y0cM/B8SF0AaHRwt8ZqnW3TTRovb7YvZY
	7V9gRQ/G8WKk7DMsmJE58JBbfY+D0m0pvfad/6Q==
X-Google-Smtp-Source: AGHT+IFa7GpMRcZBsCmM7CXrwXH4F/9S0bZVX2rOTwZ8gwWPISz40Itv+XpN30B/P4QqbSfNO35YnVdPLxOpi1AIrVk=
X-Received: by 2002:a05:690c:ecf:b0:6db:9b55:80df with SMTP id
 00721157ae682-6e9d8acaffcmr188192657b3.33.1730369549381; Thu, 31 Oct 2024
 03:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240906-lpm-v6-10-constraints-pmdomain-v4-0-4055557fafbc@baylibre.com>
 <173029317079.2440963.17313738472826934777.b4-ty@ti.com> <CAPDyKFptHq6xkKSAmeHsEuhBoEhzvudcMf2+nG08MFPwnMi+ew@mail.gmail.com>
 <7hv7x9qsvt.fsf@baylibre.com>
In-Reply-To: <7hv7x9qsvt.fsf@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 31 Oct 2024 11:11:52 +0100
Message-ID: <CAPDyKFpdgg+kM_Ot5GPTpMUtjmBF-pUhCeRpVb=j852_7qm=3A@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] pmdomain: ti_sci: collect and send low-power mode constraints
To: Kevin Hilman <khilman@baylibre.com>
Cc: Nishanth Menon <nm@ti.com>, linux-pm@vger.kernel.org, Vibhore Vardhan <vibhore@ti.com>, 
	Dhruva Gole <d-gole@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
	Markus Schneider-Pargmann <msp@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_031231_172116_43CF7551 
X-CRM114-Status: GOOD (  25.24  )
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

On Wed, 30 Oct 2024 at 20:43, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Ulf Hansson <ulf.hansson@linaro.org> writes:
>
> > On Wed, 30 Oct 2024 at 14:01, Nishanth Menon <nm@ti.com> wrote:
> >>
> >> Hi Kevin Hilman,
> >>
> >> On Fri, 06 Sep 2024 09:14:48 -0700, Kevin Hilman wrote:
> >> > The latest (10.x) version of the firmware for the PM co-processor (aka
> >> > device manager, or DM) adds support for a "managed" mode, where the DM
> >> > firmware will select the specific low power state which is entered
> >> > when Linux requests a system-wide suspend.
> >> >
> >> > In this mode, the DM will always attempt the deepest low-power state
> >> > available for the SoC.
> >> >
> >> > [...]
> >>
> >> I have applied the following to branch ti-drivers-soc-next on [1].
> >> Thank you!
> >>
> >> Ulf, based on your ack[2], I have assumed that you want me to pick
> >> this series up. Let me know if that is not the case and I can drop the
> >> series.
> >
> > Well, that was a while ago. The reason was because there was a
> > dependency to another series [2], when this was posted.
> >
> > If that's not the case anymore, I think it's better to funnel this via
> > my pmdomain tree. Please let me know how to proceed.
>
> The build-time dependency on [2] still exists, and since that was just
> queued up by Nishanth, I think this series should (still) go along with
> it to keep things simple.
>
> Kevin

Right, that makes perfect sense to me too. If we discover conflicts,
let's deal with them then.

[...]

Kind regards
Uffe

