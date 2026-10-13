Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDF4CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 12:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPCqI76VDLf6A6OD3FPwbH85jg0U2eYBPW7UJZyjAkU=; b=0FfPxAwykX1/PisdZYCN9ySM0c
	uIfBI6bCTbRR39aTXF8gwEYudDQS6bQWd3DfbOK6DJg8h0JybfdUCPukScJhfitVgfQxwdXmKJgw2
	hw2X81Hxu7yh4/amYLVsdLySpOZ2s1pfAjosiPtnXF6SSPWakwTiMhQrpNXR4Vj8iTOQe04xnWGz/
	BC9glGm7cGjG2r0YcWMBzOqllJ1td9vNirJg+AewSo1NGGaYKfrcX3BF5UsLDYvdCqK8GcphFCXEl
	TCz8IxFuwYKDjXMWo+iK4x7dZRujGjR0efGVmkj5GRvkThzvBXlB6MysRqdr67djKZdPJaZGZJR/v
	+WNKyJhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGbBd-0000000CmCf-3syO;
	Tue, 13 Oct 2026 12:00:53 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGbBP-0000000CmAz-1cPj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 12:00:52 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-67718201466so2038944d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 05:00:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791892836; cv=none;
        d=google.com; s=arc-20260327;
        b=oZYoptT2FNNFCUfDonBhjFfx0enHwPCJyHCJpU3+tXuQ72kchRDBN9vvo27k+j4rWU
         T36HpEakOnnfx9Z3YVSoKQ4PRNMN0Q2Snb2HB8h72aCKCu+LQkIXZOUd1CWiKvpEoAec
         nrL6HeMfchyni0LasTsLmy4i0rnjqe3h8w5lpKSC6Q3Uxs/Uaj1WNZw3s+vYyZhvaF6M
         PLdslHTUImSanw2P7uC5m7e18Uf1KNYmEP7LM74/DSwaQ7rAijyaWLkPCynp0cpGqig9
         bWwA+yFZ9crGd75FWJYCsobepSRy7scdGccyNWPaYM7QhBlpAVmewE9t2Ub4267NTaul
         n7Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pPCqI76VDLf6A6OD3FPwbH85jg0U2eYBPW7UJZyjAkU=;
        fh=IF5CokOIQpXXIAl34KuzdP4OsDis9+zZLWFb2Xt4WX0=;
        b=hxL8LHs6sV2n83A8FiRjB2d1BiZ/VaYSkkPTqCMfbGSVhBLe42PqLFSD/k4W0Sy7EO
         b3i/0lhnyZR3okGv8a2Jt97dyKndUcoUiE/q2ZND9h2RXcfkTguWpuJ6MYJyW9xYTVp8
         8duTBQs/4vJ9HJzPTEGoH/QuuQG6YY73LdcOBnqThlY2m1hy5Mcq0zdgasOR7x3OTwpP
         YAJOh0m23h2qjz+l136mUdSmx0eivuwjjTC9jwDGtmnMDONagEU90/TlbltF80X1HvKs
         LP1kmu2auLKQEmjfqGhBw/isBzaCekmcPuwHRCbyq0SsI2fnL2YyoON4Utgw3/h35xZw
         nZhQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1791892836; x=1792497636; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pPCqI76VDLf6A6OD3FPwbH85jg0U2eYBPW7UJZyjAkU=;
        b=q41Y2+fSe/V9L8mq3mGYEzF0zaSkqJL07xiAX1XBzTPBj1kH+kiYBPER6qCV61hcLV
         Exz3txWn6UmwIwxASmlqkxA1Yvrm0OTHzpZsLLUiBJ8MQ94rEuhOrwtzQQV70vV1RvL6
         /F1AFC0RVYFwzpvb7wpKQkszcCM0gsKmp2gSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892836; x=1792497636;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPCqI76VDLf6A6OD3FPwbH85jg0U2eYBPW7UJZyjAkU=;
        b=RZiSjDuFpfRN75CHjBvOrv1O9GYnBefBV5tTOZAaDY3glDMV+61yMHD8JyXJR6auea
         An2iWIOUvnkQDZiogQDcL/3gk4/6PtkW0WdgtGQ19yW3uGVE+KWXshOQZb/cHBpl6Ed3
         ruUVKfzgJj4llao2nsuILW98K06XODGREKf2n8sJYWmz0cdXkVaUmy5CwhELVpydJGXx
         2Y3AfgtshehaeCG23y/ejjPeq3lBtXA0M9eW6avkm3cmiw5wRiGz5jZVjKxLmp95Gq7v
         5ViZ7093BeT7d9949T7oS+MGNHvkLVzCoRsFhpFj0KAR1aNlbEcP2Xz5WNPakrLVpuOX
         Hvuw==
X-Forwarded-Encrypted: i=1; AKwUvBxgdVNtxrRG+6GvlS24jO1A05V7FwSffYsyMF/Kqu9Y3BgRt1kkvNR5+Tj/Vzonsd+Y99C+6ymMyWbZYwzymTXY@lists.infradead.org
X-Gm-Message-State: AFq9FYIm7Zcprbc987bEfdZI0nlx5UeS8q7j+iRM0VRpGIDaKHPTqrbl
	R4gBhxz7/14qtmlDjflm+lyX7dA8wnooslirBYnHChJ4mvuV4jnHSp7YwGiTUO/Drrc7/t0pefQ
	Y9fjs/7Q+NgqqIjD0D+19fCX+OVqCRY1iZpZmzYHaEA==
X-Gm-Gg: AYBFou2jLW9uHwf9OK/jWuMVY/dirL5wj/x9mPMk7uGXJ3Z0eixZn76hCJ43BupWU39
	PAsif6RoPCIkpWaNhxmMCo3SKmDvEdsJebKinutETOP/4+XXeHVfEWD3zL1wYMN9pxtULl/FCO+
	rO9c5wpt6b5XUNevcSt3oZNVS9M5vYazzSpKrGPEWA4v+//ZQWRIl/aT5+g7CPK4tLgMNLKeqAC
	p3quw3bGE9RjORzfDNIARghb3wvq6vdZIfeX+QCHiWA4vfGBOTRr3N7iqzveIeFO+XXHF0PNUrE
	SuAmvSfSUiQSspH1CsqF4ECiQPrMmW4l9ODslhgjDKgVgciitKJnaVvPT6HihYG0niwBHCYDPJ2
	5rdjZNl73vm6dhSI7RtaKWs6Yl3uwObmFcXA/vXKLuISQ
X-Received: by 2002:a05:690e:418b:b0:677:d67d:39e3 with SMTP id
 956f58d0204a3-67936767e9cmr4005406d50.2.1791892835727; Tue, 13 Oct 2026
 05:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
 <179070048452.199845.10870046832708018931.b4-ty@b4> <CABGWkvojte=RG=BJ=jvcq5HfUcYUZNsWNN+c5zDh-449VJ8Svg@mail.gmail.com>
 <ar2q8M7Sn9DccVBI@redhat.com>
In-Reply-To: <ar2q8M7Sn9DccVBI@redhat.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 13 Oct 2026 14:00:24 +0200
X-Gm-Features: AclHuK8xxG5WHCzDqDFRzliodJK57Ya-SC3DZoZtYPsOSf_tESDvqgcH-jYqUEQ
Message-ID: <CABGWkvpjZsDR=tOEeNfEGY3TWC0U3o=ZZE4BEWCx8DF7uBmt+g@mail.gmail.com>
Subject: Re: (subset) [PATCH v14 0/4] Support spread spectrum clocking for
 i.MX8M PLLs
To: Sudeep Holla <sudeep.holla@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com, 
	linux-amarula@amarulasolutions.com, Brian Masney <bmasney+clk@redhat.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Brian Masney <bmasney@redhat.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sebin Francis <sebin.francis@ti.com>, Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_050051_475121_931E336B 
X-CRM114-Status: GOOD (  25.23  )
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

Hi Sudeep, Abel,

On Thu, Oct 1, 2026 at 2:36=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:
>
> + Sudeep
>
> Hi Dario,
>
> On Wed, Sep 30, 2026 at 11:01:28AM +0200, Dario Binacchi wrote:
> > On Tue, Sep 29, 2026 at 6:48=E2=80=AFPM Brian Masney <bmasney@redhat.co=
m> wrote:
> > >
> > >
> > > On Fri, 04 Sep 2026 12:06:29 +0200, Dario Binacchi wrote:
> > > > Support spread spectrum clocking for i.MX8M PLLs
> > > >
> > > > The series adds support for spread spectrum clocking for i.MX8M{M,N=
,P}
> > > > PLLs (audio, video and DRAM). It has been tested for the video PLL =
on
> > > > boards using i.MX8MN and i.MX8MP.
> > > >
> > > > While at it, it validates the spread spectrum configuration in the =
clk
> > > > core before it reaches the providers, and fixes the i.MX SCMI OEM
> > > > extension, which converted the spread to the wrong unit.
> > > >
> > > > [...]
> > >
> > > Applied, thanks!
> > >
> > > [2/4] clk: validate spread spectrum configuration
> > >       commit: 109124b8ff43fb911d5b8790bb5e4c5684f72d88
> >
> > Thanks for picking up patch 2/4.
> >
> > I put the two fixes at the head of the series expecting them to go in t=
ogether.
> > Am I missing something for 1/4?
> >
> > And how should 3/4 and 4/4 be handled?
>
> I can pick up the other SCMI patches, however I am waiting for a
> Reviewed-by or an Acked-by from Sudeep for the SCMI changes in patches 1
> and 3. It looks like Sudeep wasn't CCed on the original series so I added
> him.
>
> Abel is the maintainer for imx in patch 4. I can take this as well,
> however I'd need an Acked by from Abel.

Just a gentle ping. Any chance to get your acks on 1/4 and 3/4
(Sudeep) and 4/4 (Abel)?

Thanks and regards,

Dario
>
> Brian
>


--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com

