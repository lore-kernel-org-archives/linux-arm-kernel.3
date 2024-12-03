Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72835E74AC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 18:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tv0/FtCsUcuTGQ+jsoiF0iOjSni5uFgH74oUN7PTxcM=; b=IHqSkGfSqErmbnyeNxJnKpyrPG
	dDTKbECCwJw11QY6CzO+68VPMWQeEMEfVJhR9lThfgkXQiLXoZzhmULC2fwZKrjL+y5d3ITnUffxf
	alGnMIcF1mgnLuEc8hJsN7WCaT0cxy1+kePWmkHWm8VLOGxMZVJptauNol3icbSjACVtvwSTXPPcn
	3HKVtycmV0yJ64mjkZQWV4RsDXDKZ+yYUWjS6AylFzzGmaylU4HurVF6LXnXP3gLwNkWXvN+QETUS
	hMF3KiheHzozzANIh2Y+s/Hh0Fq5q+PoHRf9RUCh1C6obJUJv8VFTzFDi6Qci+Jye3Tx1bOLNcitw
	8ylaMygA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIY6o-0000000AQ4k-4AsC;
	Tue, 03 Dec 2024 18:58:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVmi-0000000A66S-2546
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 16:30:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 63A21A40E0C
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Dec 2024 16:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F35C4CEDA
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Dec 2024 16:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733243399;
	bh=Tv0/FtCsUcuTGQ+jsoiF0iOjSni5uFgH74oUN7PTxcM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ti9pdhA+K7R/MPEZB9ABHCXpptFb69ykzeorjO1rSowT+A1f1/5qsxBMP9aRP5y2O
	 OAKylJF/RCg0sYh48Rb9frTmiNMGek+mCyy6aDOUhouTxm5B2yG1fXBuoPKPM8lrR7
	 HK7c/XG29FNkOe7ozwcPw9kkTFCuArWHMOoL+m4OfYxK0iLKHbijYR+lJXpMxBk75B
	 UE+lUdwXMRCA1+DrAiC8nw6gZAyYSOH76Rb1FkqS7z/QTCjbEUtuVsDjr66tTk1fTI
	 zTGk5nGOSiP1es4Mz85xnsfYlRjCcqWseLp2wpCcno/hvOP34AzgraYIWEaYgUkh1m
	 qfInz0nP1ZKqA==
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e38938a55e7so4784125276.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 08:29:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVxuor1XVcD9goR7xp53JwdDa9Ih22yr7BJywZoTr2jrKqg9HCoLWtKGYjLX5PUtVRahDrFivKIxZxgSZiPIScs@lists.infradead.org
X-Gm-Message-State: AOJu0YwVzs4nn6jNECR0s/7Zyljl/tPqyt1GEMzxaiXE1Ep6dmYzWH7B
	Z3DwrAabaLA8rcIWjNPHrI2KBrfar5lu2MDqTA5iGZwcBrcJSukYAknNHQSEExWd4jXTZPcuCLF
	dLcLYB+B4dv5tCqmosEoqd4ig+w==
X-Google-Smtp-Source: AGHT+IEjhzwVUw3GpUhAyfiDrfv9x9+EZvaLuj9fZM6qMK5uI75t59+f1FnfnDvhq+imIO6/SaFkHANqNEPhKwxddCU=
X-Received: by 2002:a05:6902:f89:b0:e30:e39b:9d72 with SMTP id
 3f1490d57ef6-e39d3a2a894mr3508084276.16.1733243398164; Tue, 03 Dec 2024
 08:29:58 -0800 (PST)
MIME-Version: 1.0
References: <20241023185841.1183706-1-festevam@gmail.com> <20241024-pep-proud-d714705c9ddf@spud>
 <CAOMZO5BSZ4YAZ7Lqa3eGP9Wx=Ed7cgug==_UZqc7F57=XCJv3A@mail.gmail.com> <CAOMZO5AgQxd2_gkcPSdhfSDArEEkBVvo_yAW3hdHVXtHH5FyAg@mail.gmail.com>
In-Reply-To: <CAOMZO5AgQxd2_gkcPSdhfSDArEEkBVvo_yAW3hdHVXtHH5FyAg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 3 Dec 2024 10:29:47 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKeAknYwaR_VRfrT7bHf9q6iNMyC9VV+dNBPd5VZNTLAg@mail.gmail.com>
Message-ID: <CAL_JsqKeAknYwaR_VRfrT7bHf9q6iNMyC9VV+dNBPd5VZNTLAg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: timer: fsl,imxgpt: Fix the fsl,imx7d-gpt fallback
To: Fabio Estevam <festevam@gmail.com>
Cc: tglx@linutronix.de, daniel.lezcano@linaro.org, krzk+dt@kernel.org, 
	Conor Dooley <conor@kernel.org>, conor+dt@kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_083000_599195_414E3946 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
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

On Wed, Nov 13, 2024 at 11:57=E2=80=AFAM Fabio Estevam <festevam@gmail.com>=
 wrote:
>
> Rob,
>
> On Tue, Nov 5, 2024 at 7:48=E2=80=AFAM Fabio Estevam <festevam@gmail.com>=
 wrote:
>
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Can you apply this series via your tree?
>
> A gentle ping.

Daniel should apply this. That was my assumption and it was out of my
queue (which drops the chances of me ever reading this ping).

Rob

