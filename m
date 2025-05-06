Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D82C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 06:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5PP8pPqPAlFWPzr7SqBRYCQHZuRk2Mb8hKI7hyMvQs=; b=Ppddi4xg+DXnmnll2qunmNi9nC
	9fk85KiV/Du9Dl+fMO+mwq4oapC7Kx6EPOHS0hqLfhxWRqo2c1sMe0IK4sZop+k63+Qx5QouxIZ8h
	DXG3Es03K3ZDBHw9hvPdKoLuLb4kVtE0RVlMXF5bpGIDPl5ULjImhZd2xTogi+PoA/eJTDCgr2fxW
	g7RIHPqISGb2OZ7ZtsSSOiAN1tJu6730ZEMNPV3/Tscg+OgJnYHrjs5EG3hIui9BS+6RnzoQwtuNf
	0keOYmEICAvLt2hgOe49EvYBmdarlUav3nf0JT4ZussefwN8m43xFj48xR3rpI3uMzU7fIDOJNVzZ
	ldhIgfoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCBkX-0000000AfaZ-0lKl;
	Tue, 06 May 2025 06:25:53 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCB4o-0000000AVCp-2BN2;
	Tue, 06 May 2025 05:42:50 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2264aefc45dso82311185ad.0;
        Mon, 05 May 2025 22:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746510165; x=1747114965; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5PP8pPqPAlFWPzr7SqBRYCQHZuRk2Mb8hKI7hyMvQs=;
        b=NUIMOB0JX+8yCyMXPKp9N+7I/tiV/E+Ksc3HoQXNHUUE2hE2kG7xFU0maRAqzHWnkS
         DB0wa1hyaWiBkvg4Uo2ADkgEU2rGlUicOnoo52HQDs7+pnO6Ka2YQK2/ii21UGEMAl2n
         bMe0Rp0wu/pgXBaI6dYGXErwI1ufeJXFKPcJUs5RrGDcISIIksZ+dbdSuD/n6H07IzU3
         zkkJyUALiTMHK+h78s/gxGMg/qry2JHOWNhTsV2fZfh5CUzcTtRXvARjiq6SJdzMh+W+
         cpNPAndPfYRhfbj252l+o4dU8gk5bV+1VdSOIP7eYFTJcdnse2oALkvCWp4LpkzkhAkQ
         uw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746510165; x=1747114965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5PP8pPqPAlFWPzr7SqBRYCQHZuRk2Mb8hKI7hyMvQs=;
        b=CdcJyYIPxKFLOL45QgNJ4IhMCl0u9KMLup5RLY6GoId1/qHImCA1Alea2RVwlW0ajO
         ueMTURmWLdKnQpgJ6FTy1KZjUDbdX4R3WA1wRGor1Gg3+P8iraEyyBEwhFtZVqd6lNJH
         lyqaOYpYbc74tqbgf9XIhzQNHhGDTfpekVeAtEzVzE8/IZeo/fev4ECqVMrwJThKra1A
         2d8C8dgPankYNcSgCpFs24jEQr9ce3cCKT9ZmbyE5t+sL+odfw8TFid3S/p+eRT4Z0+O
         +CCXwUfvjJyN/vN+uEqA8jyMKFlHg8sAkTJFZYGxIia5r/0AsMUHGV07wrVBQfIDEL3O
         oe9w==
X-Forwarded-Encrypted: i=1; AJvYcCUfZ06XBcSHcHAMaTQId+0zBHoVJuZ4agUxrZ/EjdRtcHECZrT5i8cGDTHLOJH44EjbOl3M7DtJFzuyWzQO@lists.infradead.org, AJvYcCVnC5tU3Pa4kP5B2vH4bQOaPIzrQBidFIpLH35b6zGSTo4YI5HWs1P/v2g5xAf7Z3T3s5KbImcUM1f6EC2QAdnBuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhogqL1bKZJd3z+PNR+5NFY2UvnqJu+tHwHvl0KxFzLhiNM6xq
	sZlZOXMbLMGmMoWhEwHm1bg2NlJ3o+KcAD0Q0VIWObZPZY1h5YAITgo3VPe6HcoQ6V4potrdV6j
	X62xawYezZ+5Jks47EODmCztPuTy4dYfa
X-Gm-Gg: ASbGncuD2RxhC5e9xuWxD/kh2HtHu9Uc5kMh4TXs7fuCbq1T+AtuJ2vFChnez72kOD0
	C6KlyV2y2u2FTK8vo2S3/qjaXoJcmvyD6uTxEfe896KBKsB8TM9cM9mz5CftFvATfCmMJgkR7pT
	Ylw0i1fqhTMnl9n9EWaJxq72WODgGasVQ7Ap80
X-Google-Smtp-Source: AGHT+IHWCctdzwcMCj5ZjU40zivptT8H7299TSSxDfB5fLI/6Bil0HTVn5o/o/QdVIGdyzwtB4e67QWfmRswaQICEjE=
X-Received: by 2002:a17:903:3c2e:b0:22e:3c2:d477 with SMTP id
 d9443c01a7336-22e1ea60099mr185549235ad.25.1746510165582; Mon, 05 May 2025
 22:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250505143700.4029484-1-christianshewitt@gmail.com>
In-Reply-To: <20250505143700.4029484-1-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 May 2025 07:42:34 +0200
X-Gm-Features: ATxdqUG_EIknxuU7AXpA0gnX9o4lB6z8IXOJ4Kfd6xvHmWt15cDgq86uJeQsSX0
Message-ID: <CAFBinCBmBotJL=wC2=oV-o7piGckoBvN3S6ofYh20fEP9sn4XA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: sm1-bananapi: lower SD card speed
 for stability
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_224246_558914_5EA58770 
X-CRM114-Status: GOOD (  15.29  )
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

On Mon, May 5, 2025 at 4:37=E2=80=AFPM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> Users report being able to boot (u-boot) from SD card but kernel
> init then fails to mount partitions on the card containing boot
> media resulting in first-boot failure. System logs show only the
> probe of the mmc devices: the SD card is seen, but no partitions
> are found so init fails to mount them and boot stalls.
>
> Reducing the speed of the SD card from 50MHz to 35MHz results in
> complete probing of the card and successful boot.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
> The same workaround of dropping to 35MHz is also done with the
> ac2xx dtsi; which has a comment about CRC errors being seen at
> 50MHz. It's probable this is the same although I forget now how
> that diagnosis was done (or who did it, Martin perhaps?).
Maybe Jerome helped investigate/debug? I can't recall and at the same
time: if it fixes the end user experience it's a win.

