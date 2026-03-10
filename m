Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C5CFCC9AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 03:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9IUAxs7VdJbIzLXaHTJJ0fopPqXXR7atfJlc6YXf10=; b=K7YmvXE5mB98ey759sgckEaa0U
	Uh+9F/PpPe8ibZWpdYDuPtXlUwmst6bEAF63lbF70KHKdAe9UxsFxjYJmfejF7R+62yEy56XoXLJe
	wKsP49rIMrBaLyszHjPjLKuQoTdP7M0SnCIf4e2QX2HxP1WMDSrzrZJx91OqlSvZJq/pN2zYc7pr8
	itdtc+BJKSGHkfvgNY584eR/JjLS9+hq2HEDitQurcI8/vmIVXEcxuUhSSiXWA+Q13cLCKpDdPq7D
	V+msM2hkJxYg4i9lkksqVtuaGlzFPU/5OQkJTgEQpo5JqT1f0tN4Iv/PsDNDRwMUdsSzSk2vOAbHD
	CmHT/ZzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznhZ-00000008dxc-3Ks1;
	Tue, 10 Mar 2026 03:24:09 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznhX-00000008dvV-2hDY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 03:24:08 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-41706b23543so1793805fac.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 20:24:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773113046; cv=none;
        d=google.com; s=arc-20240605;
        b=lrjhX1jg5Ae3OjqRRekhcY3sUyNlXPIuCcQJ426L5GqkPepsrqiYCBIIcufFvbGE6d
         Eza/SlvQAgz6r42IyNF8lpgsXmpAxqlOzVZjlnhz5lErFKOmK1UlXVCdp/YPqzhlxveW
         zL1xasH/pYKXP1Z65QCgnU6X8kh7YT8hkEvG+nD4Uf5pnNr0s3iBpIr1cKpQ/WHi3o/R
         uBTUr1gGSQTYs8SbwUy2/SqfCM9QDc5mI6foREXaMblo9LjT/HMBJwBS/Io0Iax2WIVd
         WtBUorZ4KIHX3vwpbmr7qSw6Y4Ai5Dxj/s1D68JkPK6rG5esevzC2Z00ez44TrA1LHfg
         0VZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a9IUAxs7VdJbIzLXaHTJJ0fopPqXXR7atfJlc6YXf10=;
        fh=uNAl3nJgsZOIiRprtaPBaiU+xqeyYNPCyGKmhSY+QFU=;
        b=lipkCKUc9nTSFGybDRQVl4KgbYO/lK9dP5yh4U4WTiG38NQ9Mmx5L5A4/0RuuZNTxq
         L1Wd9J2UOydjh0eL5jgpIUU82oEtQB7U1SgqA0t09Kzr5Yl3iyfmXbWbb6Q+Rj4ddPnq
         udSrmwUSO5pLWXrdoGhPAlJwLalbSVpiRZ2vXqHq80cvKi2NzoPzz1FB1koXmf4tnSWV
         S4uxt4RKcE7v90audAns2lG5mlOkfac4fsFGjLiBwj3WiGW6Vj0EhJOfbo1yAs/nET0z
         owaNpq4h81xpwfperx1JlJsvUVsL3YIQC5pyfBWplLR8lKeKSSuVLY6X0Vgeq7HdHSaY
         1W/A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773113046; x=1773717846; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9IUAxs7VdJbIzLXaHTJJ0fopPqXXR7atfJlc6YXf10=;
        b=HFmXMuLnO63acliv+N9nop1i+mcEIgBqQRSgeohvFbP21b5ykmRvH4DgQcwWEd1QY0
         jw1grbSPkDk3K0SDdCt5NM6TjOKJWDmQRqakHWsXxaBc7oRkJWtWgHr96UJ/Sa5XNYCw
         H4pzcZgRnvUpT71B7MaB82ybTyrzhnrNNQPyNYUxiVQyokdX+7f+MwpAQ3HZ8AruSRwN
         77IYmNB6noue7S7UUMoBFxP/4/ww5DaiKNDFCuyM3EqIrMCdCrcYR8BtBwqI0G16EVWR
         0KUY4QupfKMtNSvdvQtOG9kAvuxztF14RRQtP0zn+Y0ubzLFOfo0qrz3xHRbDTgqDI3p
         wptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113046; x=1773717846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a9IUAxs7VdJbIzLXaHTJJ0fopPqXXR7atfJlc6YXf10=;
        b=GEE/iI2noMjKQCHxX/tBhZmoT+vS67uwFM6yJL3YhB0AO+LjnYTKqxKj88UaObli2r
         jGKTJlNqOFoZ+Jo0dmIpVGs61Mm5WuPm/t+TMvh+o0i9uClB2SZXJ3NCBYBtn2yic2JP
         Gew1ks1E/IzIrOgNhwPh5yfJrOPPZYON6H4ZMBu7AH7R82NNDShoslHc4FQYhVtKovEP
         pIL0Sj1OY3cvQ4k0qN9dGsVJIggUiL/CDaPL+vJdYwboNlfPxZn4pqR1VgslgVpxRYO/
         tvNy3xpAVkoAeyml0WAR04O+CuNyzfLY5MyGJ5kYy13U87bWMXbetmb6tH2qWZBHYC+Y
         2ALA==
X-Forwarded-Encrypted: i=1; AJvYcCXpoQn0dloI+7PGa2biME8tjkIexBPZhnHbGlVlyjncOhXLlsIH2TJjcwTy8eNmaNcaFF+nMynKiNIK8SgXp+/8@lists.infradead.org
X-Gm-Message-State: AOJu0YwuFigsC+suHyGWSRcJG/8xQV0ifjzwJXkEtMD9idIeoj6YXj4Q
	sxDe5rdq0jL+X/NIZr/szSq82Fqj0Xgu2cueL92OKtngTwieKx3iUAnhCSOHkXqtZX2vtRCAIzU
	pKCcs7h7afGOoM5gUz/zzE8mrzJdQNEY=
X-Gm-Gg: ATEYQzy9BKblOLqSzwF6J5x/UnwFsxyKd4zw85GHcD2Fv8WHvqoqkuw+kqmadE/9dpv
	eCYXiMGJGrJsUe8Oocdx5d/77dlAgue3LSB95QHaKCLbk3TRGJE55EJ+Uwhu2xyQWAl5XpDqRTC
	WxEjlwkVFTHqyw4MGepsoMDjtbfZ192xeHAdhtp0J8pVAJW1y/NwmLIjFYY3EcO5HNMJzZ+uSOE
	xQUYyoKZj6g/NI6+pS5Ztwg2sWyMlrC6PSWJiaCNhuEAkGY0R1qmDSSw+2phLfHcj6b9mxbIxvq
	8Pi7hFPy
X-Received: by 2002:a05:6870:a0b1:b0:416:42f9:8d86 with SMTP id
 586e51a60fabf-417568d4325mr1271236fac.10.1773113045873; Mon, 09 Mar 2026
 20:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260216181002.3475421-1-dianders@chromium.org> <20260216100943.v3.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
In-Reply-To: <20260216100943.v3.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 9 Mar 2026 22:23:54 -0500
X-Gm-Features: AaiRm53275_H0CT6bFAmFiNzU5-bzNSMm5pKGBVqlCEoP2LLCsiLm-21V_J1GP8
Message-ID: <CABb+yY2RKJgyNQ6789ua6s8C4tuOvhWqdcS16_4yU3AHjAiv_A@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
To: Douglas Anderson <dianders@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Frank.Li@nxp.com, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, festevam@gmail.com, imx@lists.linux.dev, 
	jay.buddhabhatti@amd.com, jonathanh@nvidia.com, kernel@pengutronix.de, 
	konradybcio@kernel.org, krzk@kernel.org, lenb@kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	lucaswei@google.com, mathieu.poirier@linaro.org, michal.simek@amd.com, 
	nm@ti.com, rafael@kernel.org, robh@kernel.org, s.hauer@pengutronix.de, 
	shawn.guo@linaro.org, ssantosh@kernel.org, sudeep.holla@kernel.org, 
	tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_202407_721914_C0144722 
X-CRM114-Status: GOOD (  16.30  )
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

Hi Doug,

On Mon, Feb 16, 2026 at 12:11=E2=80=AFPM Douglas Anderson <dianders@chromiu=
m.org> wrote:
> @@ -249,6 +255,28 @@ int mbox_send_message(struct mbox_chan *chan, void *=
mssg)
>         if (!chan || !chan->cl)
>                 return -EINVAL;
>
> +       /*
> +        * The mailbox core gets confused when mbox_send_message() is cal=
led
> +        * with NULL messages since the code directly stores messages in
> +        * `active_req` and assumes that a NULL `active_req` means no req=
uest
> +        * is active. This causes the core to call the mailbox controller=
 a
> +        * second time even if the previous message hasn't finished and a=
lso
> +        * means the client's tx_done() callback will never be called. Ho=
wever,
> +        * clients historically passed NULL anyway. Deprecate passing NUL=
L
> +        * here by adding a warning.
> +        *
> +        * Clients who don't have a message should switch to using
> +        * mbox_ring_doorbell(), which explicitly documents the immediate
> +        * sending of doorbells, the lack of txdone, and what happens if =
you
> +        * mix doorbells and normal messages.
> +        *
> +        * TODO: when it's certain that all clients have transitioned, co=
nsider
> +        * changing this to return -EINVAL.
> +        */
> +       if (!mssg)
> +               dev_warn_once(chan->mbox->dev,
> +                             "NULL mbox messages are deprecated; use mbo=
x_ring_doorbell\n");
> +
Does this patchset leave some such clients out?  If not, should we
drop this block and return -EINVAL already?

Thanks,
Jassi

