Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1484CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 15:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0ujevqgQXDHfoEPkvrwGuNuwg0PASas1+bZlJQ1jQU=; b=WmTGQIkMA0pdjyyqasX7qli14J
	kPCuuz4HMt90cPI2Jf3qHd0CqOH2bwN7GremcdYI0uonrLuWQUCZQtGINg5iG0MSbQsvj3CSXOQhS
	05eX7fiFi39v7fMYT7xuz3aVIi+chXz2kqz/IYUO1xtoWLD5yxVP/2xtDU9y+fACqr08hlR1vOJIC
	dHXYsNuzjurQ1pkF6bDbiCGrm+v2b0ZZDvWOdEgHaMd8FjFffRA/KZ58szzlMnN5P/CbI/HXe390b
	UQJe6XuJcDftVcgny7KeDovYrypY8DbInc7j8o3VzpOTA9ENza9u2XhGX7z/6w52KjqeygwId+PMd
	ERhzqitw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMovH-0000000HC2B-24EU;
	Tue, 12 May 2026 15:21:27 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMovD-0000000HC0l-3yjp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 15:21:25 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-67bc8609a9bso10389233a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 08:21:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778599282; cv=none;
        d=google.com; s=arc-20240605;
        b=cE9blR3JH3cTFjlW0kqBvFv98722CCHtPqCE/2XLKVNxUxot7HK7enUd24oj/Rp83h
         +jV6IxY1Khf7KbsYkcntlR00/Suj2u9GZZUlM7CMdL1T8mI6oT9d/086WdWsHy1SfyAB
         quIs9lzDpDdlQb92LYuypZP4vj0o1ULpXF/v0YPYi/wDj60J0Vj9je32eY4Xnm7SrhnP
         6CoH2vVLxtg28j06HJVmCmUqKjpnmgvNhjks2eBlMUGeOIJgCVrRD5kFFB6S7h7zZmA0
         Vx3rnG67M76xS9ciA1VnRdy9REaauEHmBGQ2amByPbbVscbSJUdTEF8yPNY+UgpsYiTQ
         HoXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t0ujevqgQXDHfoEPkvrwGuNuwg0PASas1+bZlJQ1jQU=;
        fh=eFK2CPAy6W+QYDSo9DPIu0Tmkys9/GVYFVj8PsFhxtk=;
        b=PzWYi8CnIYpOxaDpV6oNKAmfKwLWpzuZItd9iJod8zg85UdgNDacfRqAA2GpcWqFB7
         MSs9nWwYivg2hXKGJohUWuCMQMDUX0vEkHkLdG3N4ZikdG8/BMwbkkJ8NSwWspJps4dN
         TP8HJMSgW/AYBeyy2BZ/SPbBcIv6+fXNB/EBSFeJG0wVH2l2+gsJNsEJ9OzSYix3Igzo
         4q67BYCeRcN/MLwENQLpeItlXMR/0+KCYmCeNGxRvm6m0oDm+tr1fSoJ1poeEuqGs7D3
         OZ5bd2vN7MZ+ALxpIsXR4PO8J+dkbGV10/NuKAg3orEqpMccgm5DtVV0aV/fgpJ6a3YM
         +UwQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778599282; x=1779204082; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t0ujevqgQXDHfoEPkvrwGuNuwg0PASas1+bZlJQ1jQU=;
        b=iJA/jQiE/Hk/fAv9giPvhcCIKT9bZ8mrjE3+VJ2r05eca+4W+9z5Qzod4tp/JU5ddI
         zhBJMfoyTPM8fdks0642x2vOUMrLqJX5Luc59Bp6Gbp4BezHyXiS41zo9xC8Y4UcwCik
         8K/FkLdmuF6UFL8nmj1A9yqUesi34w3hwohCKVdJeLua1qr2hUMlA46IrW58zT+VK9oA
         3Fd/G6XBzHE+mX1+AbJdC1e/++Eeox7M9NoCxM6fIUkSwAdoVPWRZiOEFPsftworrZO3
         b0mToktxMnW0wyIhilKrM1XPObddV1JXc4UNhvv3dOoNb8ig4fryJADas1CnIMHTSc1Z
         ynKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778599282; x=1779204082;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0ujevqgQXDHfoEPkvrwGuNuwg0PASas1+bZlJQ1jQU=;
        b=rJC2wK87lrGLN12BBcRuHXglnxgaJZefNmvXXYlNjqYZ7DnEj/evpDWfIttw51aFrS
         rvvEPjBQAhPzKsydw1VmbYf/icfu3C7QuRlHL7QvLbw0ElyxKmz1S8IHdvD81U6kOXMW
         cpg2y6vvog0w86y++g5ssh7H+1oXP0mJDovAGlvp1XarMtgzVlSI2Rm7XlcJaL0S4hUo
         o1ZknUTuFGmy29ygmCvGgqnGPUBpe4XiylVmcuc8X8gWtoC9MZuhomVM77M8a8Bzb1f2
         42hGwl8H/3sHaXKPkZ0I8zaD/gZosy94ZIuicgR8+a2BV2wm1H/SisjzkICljxJej05/
         ReDg==
X-Forwarded-Encrypted: i=1; AFNElJ9rayvZIXP2wrR69Bz4HnHEN2CEb5dJnY0iPyFIRhkjCmm/U02+b2ycF0mdy35AztPPxyMfY2iHMC3yhx4e36LO@lists.infradead.org
X-Gm-Message-State: AOJu0YwhyqZ23XTrqbChHsBfsqr6vuGaFnCRyluUPlWm3NymAp/L1UTl
	i0y+tz4nY3YYSS36S+QQlQTb0ErrKzRg4gkeFrVRNhICkQ4fU3xU00Rmh2L67w7DgQW3QSM7p0U
	8z8qZBrqdZ7TDv1BzSuVSURZ6gDk0A975LI8XZcgMWg==
X-Gm-Gg: Acq92OGrkDDUqFWdm8zq+jktecfH/iDN9bBG8k7ynJ8lijkFOtXy2mBaOrQKcjTOqOC
	t/XucPrPqfdL0iGoZwxo7hZhDGd+TuMpmRThp3b+TaGyk1nbpLWS3ElJrvGV7lpXQsDvB66zX+z
	3AxXYVPb+P+JhwHkJBNfccPNaIa3ShaB8bZiOGjqcU4UwB+OWe3jCF4Le8Q6Z3/4NHXqNonLiUw
	Ell53dSy8sv3PA1oxSUjXyGav1RTQcqMMybtiyIkTBECUHhLTV5qeT6ci7HDHdsN+uNq5bbPDPT
	4IybQ2JvZYVR2dogZYqKliVvHNq90WTiIf4EBeNJVg==
X-Received: by 2002:a05:6402:4315:b0:66e:8ca6:e79f with SMTP id
 4fb4d7f45d1cf-680cf3642bbmr2086182a12.13.1778599281971; Tue, 12 May 2026
 08:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <472f85bd-42c2-40c6-abfd-b76924797069@ti.com> <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com> <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com> <c6f68ab5-271a-41ed-b285-75b739f1edd6@amd.com>
 <87850f70-5275-4393-941f-d01146a9cffc@foss.st.com> <da3b79b7-9dad-48cb-b552-cf6df445899f@amd.com>
 <08c815f5-ccbe-404a-95a1-a549aac8a55d@amd.com> <CANLsYkz8HpM_8eS7DjN_jmYs4T7P9xY0jYmdiAx5WO=_1zvFpQ@mail.gmail.com>
 <4ae35920-2539-4b12-8dea-efd407b8aaeb@lunn.ch>
In-Reply-To: <4ae35920-2539-4b12-8dea-efd407b8aaeb@lunn.ch>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 12 May 2026 09:21:09 -0600
X-Gm-Features: AVHnY4LT22IVt808sLwJL3ajF9BoO5QglODlYYWO0TdL8CMLNQDb8uF-T1sOSus
Message-ID: <CANLsYkwBk0KbN-k9ce+5=oT+scdZ3nU5AOr3Fz4zT=0AFzghDA@mail.gmail.com>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: tanmay.shah@amd.com, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Beleswar Prasad Padhi <b-padhi@ti.com>, Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_082124_017480_FBB9CBCB 
X-CRM114-Status: GOOD (  18.55  )
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

On Mon, 11 May 2026 at 12:18, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Arnaud, Beleswar, Andrew and I are all advocating for one endpoint per
> > GPIO controller.  The remaining issue it about the best way to work
> > out source and destination addresses between Linux and the remote
> > processor.  I'm running out of time for today but I'll return to this
> > thread with a final analysis by the end of the week.
>
> How many of the participants here will be in Minneapolis next week for
> the Embedded Linux Conference? There is even a talk about this:
>
> https://osselcna2026.sched.com/event/2JQpx/building-virtual-drivers-with-rpmsg-key-design-principles-challenges-trade-offs-beleswar-prasad-padhi-texas-instruments?iframe=yes&w=100%&sidebar=yes&bg=no
>
> Maybe we can get together and decide on the final design after the
> session.
>

I will not be in Minneapolis next week.  At this point I think things
are converging into 2 main takeaways:

1) A serious refactoring of the protocol to include only what is
available in the virtio-gpio specification [1].
2) The specification of GPIO controller number in an extension of the
namespace announcement [2].

Shenwei proposed embedding the GPIO controller number in the
endpoint's source address [3], something I'm ambivalent about and
still have to look into.  I also have to read Tanmay's latest
comments.  I'm hoping to be done with all that by the end of the week.
With the above (1) and (2), a new patchset will be required to reset
this thread.

Thanks,
Mathieu

[1]. https://lwn.net/ml/all/afjyH5JT0JS2j0L5@p14s/
[2]. https://lwn.net/ml/all/afzIABSh1xtMEGbf%40p14s/
[3]. https://lwn.net/ml/all/PAXPR04MB9185BFA6E7375FAD0B15B021893C2@PAXPR04MB9185.eurprd04.prod.outlook.com/

>         Andrew

