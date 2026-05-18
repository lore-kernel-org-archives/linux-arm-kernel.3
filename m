Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0309ECD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 10:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTs49byiOKMbFqwJ3wm4pcmStKZPG6RE7CVuUJdE960=; b=RfuVKyCcHCw7wQUZsQIrxc0T4E
	TOAGhD/MMpMNpKWD7FcdKL8D7g1mnUV5ZtlMv5c8ylHBWGgMueM0/sBNyckucAg07JKrP2dlytMOw
	Hm6f6eoB9D1U4XqHWHM3yLhW6WIT2HxQLoQ/uPHgVOlTE2HOQvIgn781AhSKSLPSk0/IVpiBAezfR
	DAOlP5q7sPkHAPWtaRqtUh8rOC1exFEpO0H3sNtoGKMu7GESFeeFir8DaFepbW4MxkayeGinn0PAP
	1MG2XWOFpFFUsG6Sdob6blv/zomdFHXGEpDYm8r6o6kA82I4fLa3VzaI9q6GFfQXn0Ke3jFk0zrFI
	aoLdwobw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvRd-0000000FHyO-2n4n;
	Mon, 18 May 2026 10:43:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvRc-0000000FHxm-2mHr
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 10:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xTs49byiOKMbFqwJ3wm4pcmStKZPG6RE7CVuUJdE960=; b=pbG34fC/U4ha9oX+bwpX3xz1dC
	1IbSxrLxR441C62lDdWVUL3tcgsoZ7d0GnRPEMy+Jo695v2drvL9zZZ5vO7p9K1PTRAn5DWcHMeTc
	2SrOAhDvK47zhzVmXY+164Q/xAkvcLMCzgH2vdZLiP7KIIbHYnYKtffSQ0r781uJSkD9oLC01E+N0
	dNBWWtWKeIOvCboXQBN2qaqBJL8cmfzH0/37NVZe5npqa5rdR/eXH1Ho9uGIUvsGKoVX41IHMM7Bj
	6K0QDqIS8MeUswQrf5wz0bNi/lcXszGUqm2xVcbUlQFoiS/SNaW2lWXE/vw+27+2/wdhwp+UDeElY
	OwA8TALw==;
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvRX-0000000AnyE-1n6m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 10:43:30 +0000
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-6312d29596cso1625022137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 03:43:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779101005; cv=none;
        d=google.com; s=arc-20240605;
        b=O3Vs9u9R7YcHZr76OEAkkIlxfx8saCCCOU+NsMILGqNN2xHsgR4SvP0MDjprzTAy/a
         al5tbRZyyAx3RPxfY5H0qV6oUokw69HgpA+G7dGwFK861eTenrSv9RCShJ9FhGRrVsrm
         wdk5FJhzqINR0I6/nFjy2RVwXmFrIah7JZhJlZ+TItANM0hABkGToGsZHlbr1/R4exEh
         bqjtTfhrdQ6GBVEu0Gxgp01gSSyOu0INpYugciRTb6BF3t0tPKpZNnRKrNPFlHJ43Fcf
         eELK8sXEtzOJnYZGCWEwTyDU2MzkRqcPZVJ111VvzwnAhmvPtITI3/iTe3EmNzyihb5g
         L28A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xTs49byiOKMbFqwJ3wm4pcmStKZPG6RE7CVuUJdE960=;
        fh=cicxeujYazNxdNYD52c9ZH9UyQZumv75YI6cJquopEk=;
        b=bWXwJHdFqdUhvELS2VggNctoMbeP9xCry02oeLNPoMqoYYwAwS11MtcpgY9sHn0qXs
         KYlmKhTaWDSk8T4M7UfJsnpvAhl7wHFfYxgKYE61M9HxG/+jx8r0Y1rD2xXJS3OpZ0QL
         XawPQpmXywT1VDVhSpdJeaDPZtobkhd+s56lqvjwGb+MXp32aINUuVAO+2IY3AJbr6hn
         AI0PAMDd1jsL+Er32eNweH0uG5KNaRFQwkkCU7t1fVlT/308Fn40AEt5GplsSLU0yttw
         x9Ltx6dmAsuErOq+NPqygZNPczZ7hMTPrHE+n43bP1gmmVAxhEr23oHcf3EJd1NLK/ML
         glvw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779101005; x=1779705805; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTs49byiOKMbFqwJ3wm4pcmStKZPG6RE7CVuUJdE960=;
        b=MFttRdpJCdT/WNY3D80poUCtrJyIwXNCpB2Dbr2cPb5Rmm332ZoYwP3nsplYVivlTx
         GAlvCgnhP0fioZd6M145+d1USPLawYYa0a/mc7jQjcujkHrnEwNd2DoD4Q4fr5EgmJir
         V2wyXvsymaPbt3MFKCqX9qRXS1rJp6lMm+s9v23PCrQ+0mV9WNOsepmwgHTrwq9AYorv
         UqplXnEgKl4wdfj90RdxkZjDknHOp09eyXxekVza9a5a9GjsB+XoVpeFKqy4KhKbjhq0
         lHhD1ub/s79riX+sAn/bDLIzhKf83P8x1xjzFZ3d4s9MP/V2IA9Q37lVvgHQYbZA96QN
         Ufig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779101005; x=1779705805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xTs49byiOKMbFqwJ3wm4pcmStKZPG6RE7CVuUJdE960=;
        b=PIewyD9oVmGNFkQirJF8vO7wWpnyhBh2gBQggRadVYbsfVNpdGufGektipLnKyP3YQ
         ANLDPJehOOtfZHXQbGyjHJr69Bi7FfTdih/S069wfHmRYBLrHEUZNLJkDbPJy3ON8AyJ
         KQ2MzvLT2gR7iYZZ8uMM8+zll0QR6hlgOtKlU9Vdfq+uiXCSTWbKEx6lG/fcwAk85zlj
         CyRI/unN8HX866rlUQwBKsmzwvhO1JDWABWYNEKU/8hRLBjyMhrOHmK6vu/N2hnmWZLA
         cF1iuxkaSofbo2S/HQUJLPodSFxDelG9JaYEufhYrTHv5cbBN9Q00d/pjHesS85EaYUx
         79mQ==
X-Forwarded-Encrypted: i=1; AFNElJ+TdEEHIvCeTmNRwUOobXUAq0FMHEF0RPtmO2BehEoOTbMigs1VnMBRpZMu0uAkLwugQ39vaS7StG2Hfz2zFtN1@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+8fqgmXjjZYLASBialOEHPmo29fkc/I9yGyMbi0oilbZmOuzv
	FHeoYjMFy30RRc5y4IM6IQEsS8rDLEILP4DvbEgjtkffBbTNZEakF4gK6xKxTbISZbiYQC8y8f4
	+pcUjmg7Vq8sD5cM1Zu8am6hH4RMQm9U=
X-Gm-Gg: Acq92OHhXyb2nHC/ylvX4xcaROpJeCTNEYLDhOP/gID7SidDZY1PMOY6vNHua47N51/
	1vkvwpGlEGbyGDHipKYfw2t7CAUcvAqZ+d1qefITOfbe1BeWgY5VyIzp8UiJ24jh6ZlH/y85A96
	/tOpMMlaHge23XdWVASfAwmkabVJS1lL9IewFEJ/+cceyeakuKudqcBgM8xNVEq8ALg4ciM0IrN
	GvsM09Rg4DWBi/9atbgio6vTMGBIB13gd8wIZ1IihCfI/u1j0nI//Fusr1V33bh/5dKcQB0DmQ9
	U2NeLg==
X-Received: by 2002:a05:6102:3048:b0:604:f029:224c with SMTP id
 ada2fe7eead31-63a3d3257b8mr7204165137.8.1779101005079; Mon, 18 May 2026
 03:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260409-anacapa-devlop-phase-devicetree-v2-0-68f328671653@gmail.com>
 <20260409-anacapa-devlop-phase-devicetree-v2-1-68f328671653@gmail.com>
 <20260409-foster-stability-f77b38c6f7a0@spud> <CAPBH0A_K39218+=QHJuEY+SbFk-nCnM=Z8RQMdHBK7SkCj2QtQ@mail.gmail.com>
 <20260420-garnet-goal-4a284a8818fc@spud>
In-Reply-To: <20260420-garnet-goal-4a284a8818fc@spud>
From: Colin Huang <u8813345@gmail.com>
Date: Mon, 18 May 2026 18:43:14 +0800
X-Gm-Features: AVHnY4KBv_ZQdvkIGsbW-uxlaqMRSavFFGW3n1uyRZHosIHDc_Hzt105zf4NdjI
Message-ID: <CAPBH0A-nVtt_KynVyThZUVD2CShoeOuMniwpOxs4+nPHcri7MQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: aspeed: add Anacapa EVT1 EVT2 board
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, colin.huang2@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_114328_069424_A57E03AA 
X-CRM114-Status: GOOD (  13.08  )
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

Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B44=E6=9C=8820=E6=97=
=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8811:36=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Apr 20, 2026 at 01:41:30PM +0800, Colin Huang wrote:
> > Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B44=E6=9C=889=E6=
=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:36=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > On Thu, Apr 09, 2026 at 07:40:26PM +0800, Colin Huang wrote:
> > > > Document Anacapa BMC EVT1 and EVT2 compatibles.
> > > >
> > > > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > >
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > pw-bot: not-applicable
> >
> > Hi
> >   Could anyone let me know, what is my next step which I need to do?
> >   I can't find the changed in for-next branch of
> > https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git .
> >   Thanks.
>
> You wait for the merge window to end and the maintainer to apply your
> patches.
Hi
soft-remind for these patches merge.

