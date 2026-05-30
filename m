Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF74CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 09:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oz3YRZffQ26ZGbOw1AGWWjvLi6zaQG9IZbhnachZ1JQ=; b=yHs8TethJZGLKwYFyIdzGZvD1D
	tq1UESQYOUeReYcs2wXHnT/bapyDX3BV/q0emKnQEQ2hGdpzg72SVde3rlyo64OELKCRWyj1Ki+vW
	Wxaw7NC94HQV1OfqlV75X/o6Wqch5YzsnylZoQYQ14CbDTFN9uvn80qOk9woOiuJxwWR2/1gaN63L
	em5zLPVLaJthQvA1+NI0hcYdAYtilKAPiIel7EymkmpfcoZyvSAnMtclxzlYaAyKg14l9bHrd/0Rv
	zOTEB09G4R9d84WWl6jKGzsmNAmQFpx3d/RRLRFKz6biEk/2cNcw/BT1fyLtmHT6L7PLRHlSV9TSV
	H6nBHJaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGI2-00000008bVo-1VUb;
	Sat, 30 May 2026 09:47:34 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGI0-00000008bVR-0uKX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 09:47:33 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-8c9166b26b4so170475306d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 02:47:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780134451; cv=none;
        d=google.com; s=arc-20240605;
        b=O+SthATq9g5kMLjRKkycvsZcHGhRm+XOEcQmsflNgQRddS8k+NsK+mutpCxTs3b3zu
         RGAMq+Yjvx5QsqvKKLgilLZ6IfOFXU/e+vPHs50+sjuyhrv+OYeaL2yQGXM7QAkIzUdj
         kRsdFQV0vl1tChhrZ4M1N33wle8Tm6j386tTQ9aGF3Pra3DJ/LGWNUvaYXxtnbEGSg70
         ixP0jlRVsITMqr6+5Mliz7xCQWQjEHMTzXgNYqsspQJYUXrpeMbnAhZUx+syPQ0t5X5y
         QO4tJyJNGuGLuQ8pHGMe27u/ZeoO5SNCc2WMv7Hp06jwc/hzb3ntifSChbyGRTkrLZRX
         LUjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Oz3YRZffQ26ZGbOw1AGWWjvLi6zaQG9IZbhnachZ1JQ=;
        fh=LdQC6COVITInupk7/G2IFRZJLN4NBTmc3+OSt9ZI+oI=;
        b=i2wMezkenonofwwCxqHrbQ5i3B0upJ9H/P1I6DWf6riRWe7qZ6qpu7TH2q+sPV642K
         bDoxfVGUSmqALHOLnmetzaVp9PKdOMK0R68aqUrUcS2dcOMb10TUhNl7aw0a0hiiIh2d
         cwQq/u7MVf+sdsRqAL8DLISimxiYzW6GUzG8O6dtyXqNhWGtJ0i4LcgdEu+JJJ6PDeO9
         3mRdUK/aWsrn5AA4aZvE9gerePc1z22c4loTqTznGlVGyybYhzXjlGEyUIfZGiTY4kAx
         jFY+CGgwBknWbOO6860SZHQZHdrKfFDf9sGMRfcavNL1vvVXkgCNAuGd/70SfVfuq4CJ
         UlZA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134451; x=1780739251; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oz3YRZffQ26ZGbOw1AGWWjvLi6zaQG9IZbhnachZ1JQ=;
        b=lAnHQZSwtrbiCmzOpO6SUuenUfK64v4Ek9lea/d+3q6lvu5y4ZhhLObHIxp3D8O4BH
         o8pEsTtbpSn9ZkaW/dFauyqQi4Y01nQ9maidCGEnao19wJrlzjxFg9adb0ELZWqHoxmg
         iziYeXbHmyIJtDYTHgHQmMOwWx7Rgp2+Gx52C0gNczKQuz3BI7RKnHLjtd+ftN5r+h5S
         GkqoEjwmhlmFfpG56wLIbHque1j4vdmUVMc2LUeK5vvf6BrZXFZHqOapelVjOAcJjCtU
         IMZ0vuabiRdK2FSzXYqnnVrfpZWNRO2xmXJk2/G/rlTY1oPlqPQXxsAIwIa5Ok3DnhIl
         hwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134451; x=1780739251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oz3YRZffQ26ZGbOw1AGWWjvLi6zaQG9IZbhnachZ1JQ=;
        b=p/pS4Mf3JxHjrmscDns3pnUHR+6H5i1NIMh/onaC0WsfaUlBezE/BpmysRpUxs9Gb+
         T5YQOVrImePTV5l3I2jeSEfUjrkn3MQ5VRvhE795cEG03X1AI61IXas6nCloif8Gyk5+
         f9HO0iHlTpgWL2rj4tnbu75BvSX4pzCZ/MyZFL3U1QYKWAFNsOh1vhYRnPGIM7RvP7Bn
         RwR8dN7xCShUYzwuSHF+TlWZZAM8uB3UrnrmknPQ27SwBFLEBoJ/xb0y4eo2+63FYVgi
         8LYRE9Ftk4giMtgnrdJgtSwxyZSvBueRVc2mGJI8e8XlkPGuoXe9mjIgUzDXGF9JRbjz
         VQgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+jZ5mfGsTF8LOR+n5XOiDjO2GPKjpHyf+ksGaGqJr4smzQ1y35jxl38O/AsIg4ZMQh+YNkK/Rw2Ek4focVBnID@lists.infradead.org
X-Gm-Message-State: AOJu0YyM52Upj6PJBDX1onowN2tBlBgOG0t2osYhExR7tPq1jjj9CDND
	5S8eMy98E5ilV3wV99IdVWjDLc1SD3Gyvql6q33pcA0YO4oLv49+bwNnXuyW44CldiRp4vFaQ98
	wu8vWNb3fY7KOTj0rygc2I9R53gt3JRE=
X-Gm-Gg: Acq92OEolBFO2O7Ia7EASaAGsjkoP0yhfM4Wux1Kvu1AUCyHT5H+d1qDCuGI90G1ejg
	5QuJbW5ONY2OZYvn5kp/46gdhOm4D6GgklaDpMcq7JZjRI6m2ismSvaBnsxQydXuQ9+raiS5Vcs
	LDvXIwJo1EGgDVG77FtaUCB+XgY6sQAHuIVF0tp1cXPwMsvIGouxf1bcWKo4qnSpvoEUoka2+72
	7XOgFqdsLPeuEa+qXgNsPNbWpMGDawLpBVxLLJq0irYW2vNeOrAd7kGAiF3ZddDErI5Sw+7LC2r
	JXtZu9GYBzRsDRZ1NpRSdm9RqDw2l/4fCPUmafUzniRIcLkjR2K5UPx3s3dGLVZMT2Uk1C6pSba
	7WyY=
X-Received: by 2002:a05:6214:3207:b0:8ca:10cc:fdbc with SMTP id
 6a1803df08f44-8ccefd98b0amr53330036d6.23.1780134450763; Sat, 30 May 2026
 02:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260530052812.115994-1-manishbaing2789@gmail.com> <c8209301-774e-4ec5-8685-c8453a84ae61@kernel.org>
In-Reply-To: <c8209301-774e-4ec5-8685-c8453a84ae61@kernel.org>
From: Manish Baing <manishbaing2789@gmail.com>
Date: Sat, 30 May 2026 15:17:19 +0530
X-Gm-Features: AVHnY4KAZWNK2RT4qjWm79BISQq-qXuvBUOBtqIHpTd5Bcj1PcsZbOxPtlj136I
Message-ID: <CAJvdc_f4MPNcUn6C5VGB5f_mmyeq2jQ_Ln-4CWxNTF7fcXhsQA@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: sound: atmel_ac97c: Convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: claudiu.beznea@tuxon.dev, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_024732_274910_3142BA4F 
X-CRM114-Status: GOOD (  20.11  )
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

Hi Krzysztof,

I sincerely apologize for the massive amount of noise I have created
on the mailing lists today.
I am new to the kernel patch submission process and made several major
workflow mistakes in rapid succession.
I am stopping all patch submissions immediately.
I will hold off on further submissions until I have properly verified
all in-tree users. I will then send a single, consolidated patch
series with corrected terminology and constraints.

Thank you for your patience and for taking the time to correct my
workflow. I will do better.

On Sat, May 30, 2026 at 2:50=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 30/05/2026 07:28, Manish Baing wrote:
> > Convert the Atmel AC97 controller binding from text
> > format to YAML schema.
> >
> > The binding constraints were updated during conversion to align with
> > actual driver behavior:
> > - Added previously undocumented 'clocks' and 'clock-names' properties.
> >   These are made required, as the driver unconditionally requests them.
> > - Removed 'ac97-gpios' from the required list, as the driver
> >   treats the reset pin as optional, and requiring it breaks existing
> >   .dtsi validation.
> > - Fixed the ac97-gpios array in the example to use standard
> >   comma-separated formatting.
> >
> > Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
> > ---
> > Changes in v3:
> > - Updated the commit message to include the reasoning behind the proper=
ty changes,
> >   addressing Sashiko bot feedback.
> > Changes in v2:
> > - Added undocumented 'clocks' and 'clock-names' properties which are
> >   unconditionally required by the driver.
> > - Removed 'ac97-gpios' from the required list, as the driver treats
>
>
> Srsly, stop. I don't even know where to reply...
>
> Best regards,
> Krzysztof

