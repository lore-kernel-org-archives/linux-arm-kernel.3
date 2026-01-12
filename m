Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F019CF45C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 19:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6JdDCpr5Va6UKBK3UkPIkJuU5AGn3aLM4FqYUEjdpw=; b=u2WGoJLbKi8bZfctNUEWxSQk2L
	NYJOK3zh6/oAAB8lfEKtuNIRC8K/ayA1BegyG1fibn2eW6TKwQp8/JNlZYjRn3+IDtk9wDz6d9O9S
	HPb2FDf/hQvIu5Sl2tz0Q6orGfwtoIPkhByhGuIVqTTqGApyT/qU+cmN0J/U7cP09eEMzrf/stLqW
	Mnp2AEwhJQ/jd2tV5Y+qfmb0KfdXbgtuKZ0GAlljir1ZwkBbvS2NG0htgAtGCiBiSgNNY/pZ4QXtA
	uV9ndJGk2bLUXGam2B2lt04wD+M/Tdfs926FUkP66hGqzGsyccq8Md/A0T2RENVyKj6Ny59Jtd6YH
	3W6G0Ujg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNDw-00000005xOv-1ANK;
	Mon, 12 Jan 2026 19:05:08 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNDs-00000005xOC-2o2N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 19:05:06 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7c6d1ebb0c4so5151838a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 11:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768244703; x=1768849503; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6JdDCpr5Va6UKBK3UkPIkJuU5AGn3aLM4FqYUEjdpw=;
        b=K2wpzADUYGewqNzRQ5VTk7zYOCNwFVrcyW1+uNJ3IWAhu81lzWtHCRYorCHJ1MCSEl
         hRmdA69Dlu01K4i+xQ8PAjH5EmP1WzZ7VoS350bnX59tL2Kf3osfDMaRZm/rRK/YpGH2
         fZ/RmDn38XiR8K3gDNY06IRCCQeX0xUhIzK5vkjOThWUvJHarQ+e6nTM/90qOVuIs5k/
         5vuSpGTZxN/PaVwRxcT4FQUMRmGI7rfKaHhukm6ODqOr9iLt0kIA45i88wBN8RJ4ZoMd
         +CdejLrtjkeNwneyZpOCq913S8U82SvVhKeuBW1Um8zQyCyb55lFRV+S+NPkmFS/ha6h
         ttHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768244703; x=1768849503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P6JdDCpr5Va6UKBK3UkPIkJuU5AGn3aLM4FqYUEjdpw=;
        b=Y3xEA89/uhr6Vndnr4wiu6Kx2clN0wTYwJE1NkL7i17u5BeTtv8Ssj9+7Ia+NR9lsI
         74sFaETdTBunmoyFijaapCpacqNoBAi/MKvWfzhYu0Wl0KzjuYSpF+9hPUgwiz4me1n1
         VzAI1DlgH2WJ0MU6+F+Vroam4eC3CrtLEwVFzpyN8tD0Zm0pPBhbalsnaHCUNPJwyEIa
         6c+Ysx4xn3pNgLkS0ILn4M5PTC34OxQQWPVRe7B5ocBgXX1hC89B8t0fPxDDtvWwjjZu
         MawTR4FgL4KfcffgvMcdFNuQUzj0Pt31KZHBQm/yLl99YZseUS8HrdhxylXgcLHQNdjT
         8j2A==
X-Forwarded-Encrypted: i=1; AJvYcCVyqahCp13qYQ98k3EifLlcy58synELzwTbbLXvkhn7MYqhpegoRS5AQbUMuSNjA+/VyFzWwTrQ+nL6a9pERU1j@lists.infradead.org
X-Gm-Message-State: AOJu0YwG06UyLmf2BHm0wxHt6NpcINuif5/nNbPXoWTEFRC/2EuZOuQH
	EZhVLqLxK1QORUayFP66SWUphjrspZzZgAIBvwwwPhMi0GHpy6lfjL2NJ/5AsiD/hsNKx23klbi
	QpqNrgbHtEby4blsSmt7EWTXiyMLtiNg=
X-Gm-Gg: AY/fxX557W4i5sOAgl+zEv8AAGpZaJhN85BKl5SHwr6MoiSNRj39DGPFsPMjkAMUpuB
	nxPxKzjw5J/LgHMNSL94Rli92iIIxzG2IuG5zKFr1GGotTDIgu3+6PdgYI44r+/J6/FdfJ7QU3B
	JsG/m2H56uOlaK/yQzVffbXskrMyAxNkI5oTwe7vhw6BzWD1eaPayqCvHncwvgPQX5UKTSoPkpi
	vUNa4COumB7BpW26Vh32+AnYNYbOwbrNY/pJtmxrJaKWSw6ZUj9Nnugg3+eXjArEBPcgRj+67MR
	doKpexM9AwqhAwbmMRQ8A35KPSI=
X-Google-Smtp-Source: AGHT+IHHyYehd5mDk6S/HFO61FhRHsv9zqO6J/OOUvbop6YA1ncswgg4NWPhmsAGF3o48IKByactGMvO6pcP1yVqREg=
X-Received: by 2002:a05:6808:1311:b0:450:b361:f48b with SMTP id
 5614622812f47-45a6bec253fmr9406966b6e.56.1768244703218; Mon, 12 Jan 2026
 11:05:03 -0800 (PST)
MIME-Version: 1.0
References: <20260110010715.1610159-1-mschirrmeister@gmail.com> <67ccb8f6-f9bd-4266-b79a-b688bd6d030b@rock-chips.com>
In-Reply-To: <67ccb8f6-f9bd-4266-b79a-b688bd6d030b@rock-chips.com>
From: Marco Schirrmeister <mschirrmeister@gmail.com>
Date: Mon, 12 Jan 2026 20:04:51 +0100
X-Gm-Features: AZwV_Qg8Eexu6GQgEzbvpbPVbdo7RYBJ0P9SC7lhZliBG8Czm_wfF3LbmThMdSI
Message-ID: <CAGJh8eCw_d9WwEh37_7fp-pxkNvTYDetTiDue-adby=pskqxKQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] mmc: dw_mmc-rockchip: Add stability quirk for
 NanoPi R76S
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-rockchip@lists.infradead.org, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	heiko@sntech.de, ulf.hansson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_110504_711789_C554D3DE 
X-CRM114-Status: GOOD (  11.30  )
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

On Mon, Jan 12, 2026 at 2:32=E2=80=AFAM Shawn Lin <shawn.lin@rock-chips.com=
> wrote:
>
> > Evidence of the failure in dmesg:
> > [Fri Jan  2 01:28:02 2026] mmc_host mmc1: Bus speed (slot 0) =3D 400000=
Hz
> > [Fri Jan  2 01:28:03 2026] mmc_host mmc1: Bus speed (slot 0) =3D 198000=
000Hz
> > [Fri Jan  2 01:28:03 2026] dwmmc_rockchip 2a310000.mmc: Successfully tu=
ned phase to 233
> > [Fri Jan  2 01:28:04 2026] mmc_host mmc1: Bus speed (slot 0) =3D 400000=
Hz
> >
>
> Does this problem happen with all microSDs or just *a* microSD per
> your description?
> Have you ever tried to disable SDR104 support?

I tested with multiple SanDisk Extreme and Ultra.
Yes, I have tried to disable SDR104. Also others for testing. Nothing
made a difference.

