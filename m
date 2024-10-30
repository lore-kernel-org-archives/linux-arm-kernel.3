Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3274D6B6A6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 16:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eh9Rgk7ggpbAIfmbuIxK8vjEN7ZF46nd11xU/V0drIE=; b=KBOnCer/zthqGCOc+sc/guT+CF
	sCfWfe9J4MrQg/q3FcBylwECmHwx/TYrbpLwPFdXoi15FupIy0lVa63Es7YWVZHwuUozPmROmmEFA
	Oue5fKa4xA3khUDEPFeSIQAwmgn3MhGjTBhCEElolFv60lP1TVk0nHr/UfLCWuYee5WEe/l/NNgPZ
	bqK7kMPa6gEqkH7YtMVo7s6pos3EHpLI2PiP+9st2qffmaOiUVaMq5GdFmHGWjhdf/eNVJo9E+FYc
	QKR6FD+sHnU4bizWOzzSk/kZV8BiG2NFoT8OkT89eIEUmU6ZJZymhR0UH4ZMmTYus2twkBpZIuPqH
	Gr7TRL1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BAK-0000000103B-3DNl;
	Wed, 30 Oct 2024 16:03:24 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6B6D-00000000yzW-1KCK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 15:59:10 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7187e0041d5so1624693a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 08:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730303947; x=1730908747; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eh9Rgk7ggpbAIfmbuIxK8vjEN7ZF46nd11xU/V0drIE=;
        b=CoTMRRNkW90zTNrya66FuS3kgno0n2fACffM3y+RX/hE4iBDcS10Kz0BKK+YCmdPdy
         NF7+QGw0M08FLGfOTSRVZa0ZYG/ju+HMZoGHtpKpj+qDwlFQ3zC1T+440dx2INlMhdgX
         54TlptwCudVnkcG/g56N/8aYsN5h2O1JrWxrtOQTXl4MzEtU4zOiLRx/BomsIOpU7prC
         /xxOqU6heS/k288T+giFAl5BtH3yLLqqxG/sjOZangmEfWbeBNvLtUD4P/IWk1fdBl5k
         c//Mp1ERC0jVJcgu3KHh8oxCG/6LwUHhZyXi6ogIsiLKehxyeMiW+bQMEmbkb5EsAKyy
         0XEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730303947; x=1730908747;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eh9Rgk7ggpbAIfmbuIxK8vjEN7ZF46nd11xU/V0drIE=;
        b=qUHxwoGaC4+jucNVvYGqtA4xb8sCfXNUhYPUhmPxwcmsqu772+J1/9egmj0gA4Yvga
         X2g7BAypIVudOD7+Rkl+dZwAh744/DdY/ZGZRd8bi1HOIuX/14jE5Ypi3U2P1uC1YR3j
         PRuDZuN6J43iL0bUBMkO+kDqCPmZ33KQDVgvOJcAanuymj9mll1vkxDay6n0nF/M9n3b
         shvovZdNdlr8bdSctDYmMvIptO6hzd6D66R3oj/sjCMXOVgbx17V1ojTPCvhjWnrazym
         zfkyiSn1pd6V+AeukVcd4NYODIMzAxpB9721iBKpmcxwTc19v95/FW6kphD+JqDWq0m6
         c2ag==
X-Forwarded-Encrypted: i=1; AJvYcCVQ2NDIpi1Mw0mbt9Zg1L/8KV8fd+aUVkvwPAe3eM+TS3oNrAVRqKMb+xnOmubuBPekSX88Pj/al7xiJxN6heh0@lists.infradead.org
X-Gm-Message-State: AOJu0YxBau4O1utrX19cW2UYAYOQZUKkpcDYsDCGXa2cibyYtbu8wdJe
	j8/nX93ksCVJx46GTYbdgu8uEd2JiqXiiPw2VWrvE1DbX7My4lZcTuEWql22khLmta1HvhNK1nW
	7yzeGslhS0/SaXcibs/ZbNo/M1usJ5VpdtLEQ03fGb8cu2PaR
X-Google-Smtp-Source: AGHT+IGcvdh6hUVAY/ghEqHaTdX2aYhEr0HkUHbGO2MLJDsO31xGVP61B+nN11Z8X8ZW3LGsIq5cI9Ila4LMFwxgeNo=
X-Received: by 2002:a05:6830:912:b0:718:1109:9626 with SMTP id
 46e09a7af769-7189b4cb6dcmr122701a34.6.1730303947477; Wed, 30 Oct 2024
 08:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240906-lpm-v6-10-constraints-pmdomain-v4-0-4055557fafbc@baylibre.com>
 <173029317079.2440963.17313738472826934777.b4-ty@ti.com>
In-Reply-To: <173029317079.2440963.17313738472826934777.b4-ty@ti.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 30 Oct 2024 16:58:31 +0100
Message-ID: <CAPDyKFptHq6xkKSAmeHsEuhBoEhzvudcMf2+nG08MFPwnMi+ew@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] pmdomain: ti_sci: collect and send low-power mode constraints
To: Nishanth Menon <nm@ti.com>
Cc: linux-pm@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, 
	Vibhore Vardhan <vibhore@ti.com>, Dhruva Gole <d-gole@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
	Sebin Francis <sebin.francis@ti.com>, Markus Schneider-Pargmann <msp@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_085909_417479_D6844690 
X-CRM114-Status: GOOD (  28.27  )
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

On Wed, 30 Oct 2024 at 14:01, Nishanth Menon <nm@ti.com> wrote:
>
> Hi Kevin Hilman,
>
> On Fri, 06 Sep 2024 09:14:48 -0700, Kevin Hilman wrote:
> > The latest (10.x) version of the firmware for the PM co-processor (aka
> > device manager, or DM) adds support for a "managed" mode, where the DM
> > firmware will select the specific low power state which is entered
> > when Linux requests a system-wide suspend.
> >
> > In this mode, the DM will always attempt the deepest low-power state
> > available for the SoC.
> >
> > [...]
>
> I have applied the following to branch ti-drivers-soc-next on [1].
> Thank you!
>
> Ulf, based on your ack[2], I have assumed that you want me to pick
> this series up. Let me know if that is not the case and I can drop the
> series.

Well, that was a while ago. The reason was because there was a
dependency to another series [2], when this was posted.

If that's not the case anymore, I think it's better to funnel this via
my pmdomain tree. Please let me know how to proceed.

Kind regards
Uffe

>
> [1/3] pmdomain: ti_sci: add per-device latency constraint management
>       commit: 7c2c8d2651b5ffaffb2d5f723bd5b0493bd66f36
> [2/3] pmdomain: ti_sci: add wakeup constraint management
>       commit: 5a2d997b1bf8b05379309270063d7b9bd3767dd2
> [3/3] pmdomain: ti_sci: handle wake IRQs for IO daisy chain wakeups
>       commit: e8f35dc8de8c3216d28dab51b962bb31f20934c8
>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent up the chain during
> the next merge window (or sooner if it is a relevant bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
> [2] https://lore.kernel.org/all/CAPDyKFr9isnz66B+n5y3=QO-ndB05JKZN3kgXO+kXBn7ofcwMw@mail.gmail.com/
> --
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
>

