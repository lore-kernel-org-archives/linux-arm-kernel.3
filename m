Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4819CC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 20:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tiT2BZFLvjpYhgjv3NWjjKZqqKvHJampIoV0mL2vGD4=; b=tvO6VDgu/GMNfkAZ1Cmcf286zL
	SxSLIeFxZFVxoWcXAIv35B6Siz+kM14zK4H4+eQBX1kXMuXzMYBefJsLMvYtKNgTWeNJzXCdvRoSg
	IxUKmRq81CJj2tv44y/da114il+j8H65cwwvUNKu0njap0kuCKiiDQctFo307TRe4rXDqFPjpjkLG
	qcOfe4dtoYTmPYHjKO7skP43sZ8wXva+XaJQ0nCQ/ZwS+VMjWYZI5SfBMxYUYyptVG21ZSps0/vL7
	VfsOVqUE9RF0rYZoEGfSYnWrlx7tGusiqlLLxaD+uACMsjYa6Bbswyo7HkpbaM+NDzFXISE+4/xnk
	PHiLnr8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0QpW-00000009t9i-2Cpx;
	Thu, 03 Apr 2025 20:06:26 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0QZx-00000009pKb-1vAS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 19:50:22 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-30c461a45f8so12764341fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 12:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743709819; x=1744314619; darn=lists.infradead.org;
        h=in-reply-to:references:user-agent:to:from:subject:cc:message-id
         :date:content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tiT2BZFLvjpYhgjv3NWjjKZqqKvHJampIoV0mL2vGD4=;
        b=bnRxfFKBCE4MgAkyv/fuI3GofouflbVU5SAyv+kdvxgSZDoSLImoSYdG9qw6EMFo+2
         Ngm49sfs1WFEuIF1wj3t3au8ptVykJuEOSMwj2Q42vh76E4m5k7ICNKoyNzNQ/iRTJXc
         fQ8hI4fmWeKudZxJ2+egoSL56Hh13VLlywHHyzKaZr+ezzHzSt/Rycotgbvc/lRKOJJL
         rI/2l/gEAhn+wxBOAaKn6YkoJda0Z3XCxbWtwdLghuQEavGcBFYpArwq87Fh/q6vvQHK
         DLKI4+2HIeomLh+uUd8eF+/ppK54vSwjFTGtVYxh/H8nzC5FUNjVl61ed5QmAhjNZNX9
         S5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743709819; x=1744314619;
        h=in-reply-to:references:user-agent:to:from:subject:cc:message-id
         :date:content-transfer-encoding:mime-version:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tiT2BZFLvjpYhgjv3NWjjKZqqKvHJampIoV0mL2vGD4=;
        b=ZKMhciwfT8pulIEmB65vTkCPJIln6ZhkTwPXMk0JqBJkN4plNh8juP/vuI7AKgA4TD
         RzCcqv3pmGMt3FdcazrmNIM6GdPJW03xIAr4GS1DNez8LROVT9JUyuk6oG0ZgblUoblf
         oE7khpSor9OEBU5lqq+9PjD37ccrrKymTQZLNzkqv5Ymrgzamg7KtQAYzOD1NcuYD26h
         W7I38nQKhZVlmUVOIbxMRvhVfc7rhGi+jhIrEFvGuV3rB+KUe/xKqYaN8onJTCeEQa9U
         eHNmYP/1og8I70knoyiCQBOCIGKbuI57meUZtee8pJsbFFtw17kM1hpMDYu93WanOvcr
         bekA==
X-Forwarded-Encrypted: i=1; AJvYcCXJh7TSIAzU1GIvk5BuDURbE3uaanuFcCeTsO57qkKPRpsd0Gf7pcfvU9citSgT6bubGswkRlhpY/9DKkC2JpLa@lists.infradead.org
X-Gm-Message-State: AOJu0YyruKps90G0/pGLmChn8sPQC3k9c6xfQwpAEiZlv+/+QxnhFhrX
	av3qM3bxlv4NEGOww/0sUxYngOdGh6KMXfrYqjvvdp0WhQ5oiKK89Bw0vlrZ
X-Gm-Gg: ASbGncuIKR9ZEOOcFpvdGQBkwLKdT3CbEqT/OUycbP1YRSLgsZRlaryhobFhRJqQIx5
	0ru3tJCgkOwRhGr9Hk26+0WaSXcUVHenPp7nsiQtvoZq2jsOVWyGRqyrHLrdTTSehvswDzgm31G
	o/92g/bl/NgaKd/RDp0Gffy2TJ/nBDNrgmuG3OPe27/B6SVsStX5tLhNWm8MuY8U54NwfK1hGM0
	T6zbfzXkyvFfH+NcGUBdUGLiEWNNZSoQsWFAFiktFO86JzawmsVN/1fW/o9V1lybpxx/9DPmwQF
	4t3YGqm74ECrVZbfzM6GyIVD0DiWAVkh1y/mlko=
X-Google-Smtp-Source: AGHT+IGrorQ5FuPYZrThDMKqggO+30FvVsrfYRiJVo3DlRU9IYpzcb8iazeM0Ji9ePXvEuZWbPYtLw==
X-Received: by 2002:a05:651c:3232:b0:30b:ee67:2ba5 with SMTP id 38308e7fff4ca-30f0a11e9f1mr2353721fa.13.1743709818547;
        Thu, 03 Apr 2025 12:50:18 -0700 (PDT)
Received: from localhost ([89.250.166.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0314b94fsm3141731fa.60.2025.04.03.12.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 12:50:18 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Apr 2025 22:50:17 +0300
Message-Id: <D8X9JJGPGDNL.1OTKIJODRFKNN@gmail.com>
Cc: <arm-scmi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Peng Fan" <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: add timeout in
 do_xfer_with_response()
From: "Matthew Bystrin" <dev.mbstr@gmail.com>
To: "Cristian Marussi" <cristian.marussi@arm.com>, "Sudeep Holla"
 <sudeep.holla@arm.com>
User-Agent: aerc/0.18.2
References: <20250402104254.149998-1-dev.mbstr@gmail.com>
 <20250402-hidden-unyielding-carp-7ee32d@sudeepholla>
 <Z-1gY8mQLznSg5Na@pluto>
In-Reply-To: <Z-1gY8mQLznSg5Na@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_125021_496683_004CE418 
X-CRM114-Status: GOOD (  27.62  )
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

Hi Sudeep, Cristian,

Thanks for having a look on the patch.

Cristian Marussi, Apr 02, 2025 at 19:05:
> > Please post this patch along with the vendor specific protocols mention=
ed
> > above and with the reasoning as why 2s is not sufficient.
>
> Ack on this, it would be good to understand why a huge 2 secs is not
> enough...and also...

I've been working on firmware update using SCMI vendor/platform-specific
extension on FPGA prototype, so not posted it initially. I'm open to share =
the
details if needed, but need some extra time for preparations. For now I'm
posting a brief description of the extension. It has 2 commands:

- Obtain firmware version number.
- Update firmware. Firmware image is placed into shared physically contiguo=
us
  memory, Agent sends to platform micro controller (PuC) physical address a=
nd
  size of the update image to start update procedure. After update is compl=
eted
  (successfully or not) PuC sends delayed response.

	Agent ----     start update         ---> Platform uC
	Agent <--- update procedure started ---- Platform uC
	...
	Agent <--- (async) update completed ---- Platform uC

I've faced timeout problem with the async completion response. And update c=
an't
be done faster than 10s due to SPI flash write speed limit.

Why not to use notifications?

First of all, semantics. IIUC notifications can be sent by PuC in any time.=
 This
is not suitable for updates, because procedure is initiated by an agent, no=
t by
a platform.

Secondly, code implementing  notification waiting duplicates delayed respon=
se
code. I had implemented it as a proof-of-concept before I prepared this pat=
ch.

> > Also instead of churning up existing users/usage, we can explore to had
> > one with this timeout as alternative if you present and convince the
> > validity of your use-case and the associated timing requirement.
> >=20
>
> ...with the proposed patch (and any kind of alternative API proposed
> by Sudeep) the delayed response timeout becomes a parameter of the method
> do_xfer_with_response() and so, as a consequence, this timoeut becomes
> effectively configurable per-transaction, while usually a timeout is
> commonly configurable per-channel,

Totally agree, usually it is. And that's why I didn't change do_xfer() call=
.
Here is the thing I want to pay attention to.

Let's focus on delayed responses. I think delayed response timeout should n=
ot be
defined by transport but rather should be defined by _function_ PuC providi=
ng.
And of course platform and transport could influence on the timeout value.

> so valid as a whole for any protocol
> on that channel across the whole platform, AND optionally describable as
> different from the default standard value via DT props (like max-rx-timeo=
ut).
>
> Is this what we want ? (a per-transaction configurable timeout ?)
>
> If not, it could be an option to make instead this a per-channel optional
> new DT described property so that you can configure globally a different
> delayed timeout.

Taking into account my previous comment, I don't think that having a per-ch=
annel
timeout for delayed response would solve the problem in the right way. What
about having a per-protocol timeout at least?

> If yes, how this new parameter is meant to be used/configured/chosen ?
> on a per-protocol/command basis, unrelated to the specific platform we ru=
n on ?

As delayed timeout is IMO should be defined by PuC services (in other words=
 by
command), new parameter can be set directly in the driver. If we talking ab=
out
per-protocol solution, using DT is also a good approach.

> Thanks,
> Cristian

Sudeep, hope I also answered your comments from the last email as well.

Thanks,
Matthew

