Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C279E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 16:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/8HBPCwyuNycmVKwayvf4SiKQB/PKOeP06ko+JSfEI=; b=ekEuJ360R4XtjMVl3tmypONMXD
	gYcyxvf5sW0dDD6eOMr8tquu7/6kTFPJ0ec5kZGKoBphF8kYrA6oyqNLw/IYju552FEoaZtSHvz8N
	vOvl7Iu+3M2dC6Cc3z7ahprcx9kYGf1HqN0+cprS928J2xH0tJezZfnW61nMB7oQKSCI+uIgV8eoM
	jdx9Pcu8ADFNHXuaUMyCERF1mvjzi3+FEGOs8/v/I3ZDqLzBCwqJtWWsd2F9bNZeHdCrmuD4ez+3T
	+vSXCjXksqAqPme2TuDvY2aLyZM+RrpWFcT+ibnS7tJyHRQfgpyjMyTP8RDUiFNpUCKppj997J9Xl
	SDT0P+Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3Yk-0000000CB7S-0CPH;
	Tue, 10 Dec 2024 16:58:06 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3Um-0000000CAYS-3y7W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 16:54:02 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso3344037e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 08:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733849639; x=1734454439; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/8HBPCwyuNycmVKwayvf4SiKQB/PKOeP06ko+JSfEI=;
        b=hmQnR85U63mZcGvu+drBcTAqyVTYVlAfOSTGQe/QV+dibwXRV/lcbEA+L+11dIErHC
         slyVMSy6LPfRyQFldlZ1xSxRMGPYYA6h6ueRMRRTLYqAvzOcuMR/0JyIm7vID1NvUu1E
         RmZ1Pge1OGiHiBchuLZR2EPaRELlSb+/z2nBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733849639; x=1734454439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/8HBPCwyuNycmVKwayvf4SiKQB/PKOeP06ko+JSfEI=;
        b=DjplrTGQz98Q2UGb7C2WQvgGL4nnMp2xkQpWYnAwi90RcHEk/Urb9T9mcTlT6rfgsX
         3VO30o2FHzispGBzW3w1N1y3xEOY8/ObRtFsBL8Rg8+YvkOnp6nXR/Gi/f4FdLCQ+585
         GRozzGUm3FxaGpXFPGZKcYxAC/kSAehJBJypWCaiyOePDWyaz8f5MVd3As/g6ijPAVHC
         joCUH1Iyk7D78P0+j2yqh+FEbZ0ypKi2OoEfHmPwcawl6FNEVE9pMYYX65WyMv/5PrZ6
         yD5CW7aeSe3oTiRBHkMMh5fOgIQbh5GFVdG14bwAjKGLUsk3Hc9sP8L8vbpmHniInpfN
         /awA==
X-Forwarded-Encrypted: i=1; AJvYcCUUqQ9C4FfVJp31tVOqx6UmD4vjY4+eibqNWux1BhY6/9/BmQVPimQx7Cad8O3pl/vzgXtaesrl3cC/fKc740TX@lists.infradead.org
X-Gm-Message-State: AOJu0YypUCtCU0ZDW0fJqsOWdddlmsXV0iwQM4nlkOV9M/et+U9xMu/H
	CHEZmC2F0//Qf73ZV3Y6eWVODbI0GruAafa5DMO1soMdOBXb0JtvXuZcRLG1ijdiaLLNIXc6HWQ
	uiw==
X-Gm-Gg: ASbGncsL7Mlt4loCu5CAoFqlSCNzmonBPqXdM9AtdJ2ACvpUfEOsS48qDoQYeKN5hIb
	y86mPklN5QwkRAbQEdIlPFXpmtC6N6ZED6pn97slDEdd8OPcwIZBYA1E8lELRLJJct0d5S1j3Wn
	mrGc1Lzi8GZ3nNfOqYHMegcFV2saM91IyooNJbcvN1oA46De1Q5/4hbWbmwPT5JwD3AyySrnTlO
	P4bPZZDNWMq/Cou0FLrFSPjxYdMRxOts9Ft7AhBYRs+2ygrnCpeX85M1WyFrtkAFoHpmxoOaQi9
	iOPeea6KoCrdppErlA==
X-Google-Smtp-Source: AGHT+IFCdIAF6Zt57tR7EPdEbqt+SIdbMdJG82I0hFAWE9Pe3gqCQHd2DVSQAloBHMyDuFaNQAM5+Q==
X-Received: by 2002:a05:6512:68b:b0:53e:3a01:cf4e with SMTP id 2adb3069b0e04-540240be724mr1466616e87.13.1733849638774;
        Tue, 10 Dec 2024 08:53:58 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401bb10a63sm896198e87.175.2024.12.10.08.53.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 08:53:58 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso2783121e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 08:53:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXi/rmSUuncoaflTYNMKb3fHQE5SE69Py/7UO/iKp7qsqvjwik5KJ9UHja21dMTaQL8kBt4PR2ABz6/Rml6p7OF@lists.infradead.org
X-Received: by 2002:a05:6512:318b:b0:53e:3103:b967 with SMTP id
 2adb3069b0e04-54024108256mr1868839e87.35.1733849637744; Tue, 10 Dec 2024
 08:53:57 -0800 (PST)
MIME-Version: 1.0
References: <20241209174430.2904353-1-dianders@chromium.org> <20241210155604.GA15918@willie-the-truck>
In-Reply-To: <20241210155604.GA15918@willie-the-truck>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Dec 2024 08:53:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U5xraosVuDGXxBN5Ajo0n=s50JZqtgQGPs1C9jM3YaFw@mail.gmail.com>
X-Gm-Features: AZHOrDk7WvPRzq9z4VNazAXpYtL75nSHpExN5slME765TfN80XYGbQfqOs7VNn0
Message-ID: <CAD=FV=U5xraosVuDGXxBN5Ajo0n=s50JZqtgQGPs1C9jM3YaFw@mail.gmail.com>
Subject: Re: [PATCH 0/6] arm64: errata: Add Qualcomm CPUs to the Spectre
 mitigation lists
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Julius Werner <jwerner@chromium.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Roxana Bradescu <roxabee@google.com>, bjorn.andersson@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Besar Wicaksono <bwicaksono@nvidia.com>, D Scott Phillips <scott@os.amperecomputing.com>, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, Oliver Upton <oliver.upton@linux.dev>, 
	linux-kernel@vger.kernel.org, james.morse@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_085401_000378_684C0719 
X-CRM114-Status: GOOD (  33.76  )
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

On Tue, Dec 10, 2024 at 7:56=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> Hi Doug,
>
> On Mon, Dec 09, 2024 at 09:43:10AM -0800, Douglas Anderson wrote:
> >
> > Since Qualcomm CPUs are all derivatives of ARM cores they all have
> > unique MIDR values. This means that the tables listing necessary
> > Spectre mitigations need special entries for them. However, those
> > entries are not present and that means that some Spectre mitigations
> > are lacking for Qualcomm CPUs.
> >
> > I've made an attempt at **GUESSING** what the right patches should be
> > to enable mitigations for Qualcomm CPUs. This is mostly me searching
> > the web to figure out what ARM cores various Qualcomm cores are based
> > off of.
> >
> > These patches get more and more sketchy as the series progresses and I
> > have noted that the later patces DON'T EVEN COMPILE. I have included
> > them to make it obvious that I think these cores are affected even if
> > I don't have all the right information to mitigate them. Hopefully
> > Qualcomm can come and fix this mess for me.
> >
> > I'll note that I am certainly no expert on Spectre. Mostly I ended up
> > here running `lscpu` on a device and noticing that it thought that it
> > wasn't affected by Spectre v2 when I thought it was.
>
> Whilst only Qualcomm can say definitively whether or not they are
> affected (and what values of 'k' are required for the loop-based
> workarounds), I can't help but wonder whether the current mitigation
> code is structured the wrong way around in this case.
>
> It looks to me like we don't have a way to identify a "vulnerable" CPU
> for Spectre-BHB; either a CPU has some sort of mitigation or it's
> unaffected. That means that there's very little incentive for vendors
> to add their CPUs to one of the lists -- if they do nothing, userspace
> is told that everything is golden and they don't pay the performance
> hit of a workaround!
>
> So I think we should consider turning this on its head and assume that
> CPUs we don't know about are vulnerable, having a list of unaffected
> cores that predate the introduction of CSV2.3 which can be queried by
> is_spectre_bhb_affected(). We can do that without the assistance of the
> CPU vendors.
>
> Does that make sense, or did I miss something?

It makes sense to me. I'm not sure I'd be the best person to actually
implement that, though. Maybe someone CCed on this thread could take a
stab at it? It seems like folks from ARM would know the most about the
various mitigations and which pre-CSV2.3 cores were safe.

-Doug

