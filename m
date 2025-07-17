Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6FEC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 09:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SoZi3uH4bM8ut3s23CSSIKzUfpDb/RYJxJSCVL7F3f4=; b=wqbIaXWpViW/sQP6aEk0BrWG8Z
	24d3/bHHzh+f2/Wq+Ss+mP/MaJ+boy3gJb7HdUSQ3n7ZQO6GLLPp1iqkownmq/X7znwamY6AkJpJP
	2MFmc4MMo+k3uQhXlpwloRqv9Wjga6O8WESLtdMCw324rcqKckOJf7l7hyC9mODDFja0lPUmX7Ehk
	tAf9Hhe0GMGQDw5MCdRnwL6aM05FNqKvt4Zy+dOJFB1IXvs4ufstBGOQ108mz5eYEhsbFI2LP+FAz
	jfm/Kih3vrlvbk+r2vmE4ZyQVXPZ7woh4QzuAZb1miC6p5Z3YblKJ+2b8EZ76ol53KT6Y3m6aJrL5
	Pxo6eS3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKiW-00000009hj8-1lkx;
	Thu, 17 Jul 2025 09:15:52 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKGa-00000009bfR-1U5d;
	Thu, 17 Jul 2025 08:47:01 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4ab63f8fb91so6825811cf.0;
        Thu, 17 Jul 2025 01:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752742019; x=1753346819; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoZi3uH4bM8ut3s23CSSIKzUfpDb/RYJxJSCVL7F3f4=;
        b=Zf4nl+7+ziVJuHaO6upliQgbt4MIchRbdmogn8wiqIbClZUNW6OYK5Z+lp5KuquxS8
         7me6x0X9RrrdVxIdknp+oPpwY+Irm/rFVpYDMKRn36oRW78GkAlwprKALEVysdyQ72mq
         lC2MUoyhIbIcBtWlnzx0iTsFj7p7ehIo53YmEqfTH7F2gD25l0zj6DyaVOyDwQH0CQbA
         tli9wajuNNbSMRX+ezTpRPJI+NvTmjI9bK57Chh3ttwlRtwBI3tHMuGkp06wccppSRCK
         WFoTp+3C8/JAroMiVqRE2smvue1yiRSUEhjUCdKXDWNyqNCn3rR0cX1lNP0V33ZB6HvL
         rbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752742019; x=1753346819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SoZi3uH4bM8ut3s23CSSIKzUfpDb/RYJxJSCVL7F3f4=;
        b=ao7FJ/YeRmEA1WJCc1ILFKY1z9Z//Xfooz00f0saNhIdmd9U8QLOJN1de/mdw4l50f
         fPa+r2arIQk8TDGwg2he6o1bfVng1zOxPlX8zM+91YuBCaJmM0Z2+aFtdi8Zx6VKC+w/
         PI2EnjO9k0G2IJ2jJbV2WvZW7Knzdkyoim+T5ZpO/TxIIFR2FnREQexEzazNB5+2abDS
         EZGWVuLqWERnqObgFOONecQlylMVfHCNuMQc1jI1bv6mhUR3xZFyinikwz37bM9BP+RZ
         P8Za7HYY27G7YwBFg/b4GIMFbruqYI6KHs4HEuOV+bsQ4mrc3iFH+lHt/naKdUCq/Q/C
         UQ7A==
X-Forwarded-Encrypted: i=1; AJvYcCV+8+olZPIGIq1LwQhMuc3Ef1ioC6vMGUpOe/ed6pq7mxw5IdHdGo9UObtp0IkWu5xUFpGhnNugxe6ZIEH0Xdup@lists.infradead.org, AJvYcCV0iQL300KsV1honVvyLmJx0A3W8SQ5/Yrc0AqLWEhRuPqIpt3s33Ceipu9nrvntVLZrgktgrPZLiXlJzYu9k0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw56qcr1UrED5hvoj5+SVgQ9+v6TxsVw7VRKQrQDoOkizQO42ZY
	xhszI1rUqIZtmUtPe7Np6rvnmDbIhFS4RGAfzMaXxNz+nypMgHNarMT6Nz9Rv/NCKYTCdjBDFJ1
	rZgfSfqZ7gAIycgfUFwVKOvukfaUVQIU=
X-Gm-Gg: ASbGnctaEnpMdDJv/VFRy0KdkFz9fFs9ZPf686qtJsuQIGhskza+a9m+7zdci8mVah2
	tiaHf6Fc+iEuD0ooRNmSL3qHrrvN9ZtaZtHNLZW+SuwAMODjpifQDlWp/9QbgqTm92U9rqm0YKs
	OpZrVScuKf/vuJ/g2c2CyHEX6Vtnsl0vvZ6sFYGbnhwU5AghHubspsrDHlgFEVcM1mWAT+P/Ox1
	A+pKFjOxULHEMs7
X-Google-Smtp-Source: AGHT+IHjj5vn0+lqcDlxTyECjf51uWo+wHz/e3GDdA4Lfz1XnPAokoHWuCf3MPYFpyI+USr4C4GDng9B+wsuijb5spQ=
X-Received: by 2002:a05:622a:228b:b0:4a5:912a:7c64 with SMTP id
 d75a77b69052e-4ab93d49434mr62145001cf.30.1752742019019; Thu, 17 Jul 2025
 01:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <b6f8f705-f661-46cf-9dda-6f18f8658622@kwiboo.se> <20250717070006.192765-1-amadeus@jmu.edu.cn>
In-Reply-To: <20250717070006.192765-1-amadeus@jmu.edu.cn>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 17 Jul 2025 12:46:47 +0400
X-Gm-Features: Ac12FXzqkgYPLwPzfI0Wfzx3xJg_aHq911YS94XX9w26rk3khvCHNvT0xMmUc6s
Message-ID: <CABjd4Yxz=mrNpqgnHSgD0tr4ALH3YW9MvLULES568yHNFiPB_w@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: rockchip: rk3528: Add CPU frequency
 scaling support
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: jonas@kwiboo.se, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	heiko@sntech.de, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	ziyao@disroot.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_014700_390106_27150243 
X-CRM114-Status: GOOD (  16.31  )
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

On Thu, Jul 17, 2025 at 11:01=E2=80=AFAM Chukun Pan <amadeus@jmu.edu.cn> wr=
ote:
>
> Hi Jonas,
>
> > One possible difference here is that the actual CPU rate is controlled
> > by a PVTPLL where TF-A will configure a osc ring-length based on the
> > requested rate and Linux only configure the regulator voltage.
> >
> > I have no idea if the configuration made by TF-A will have any affect o=
n
> > power usage, but I suggest we keep all opp here because both TF-A and
> > Linux is involved in configuring the CPU rate.
> >
> > The measured rate can typically be read from a PVTPLL status reg, it
> > will be different depending on the ring-length, voltage and silicon
> > quality for the rates >=3D 816 MHz.
>
> Alexey suggested that we remove 408MHz, 600MHz and 816MHz from the
> opp-table. Do you think it is acceptable to use 850mV for 1008MHz?

But why 850 mV? Vendor .dtsi [1] implies that chips with leakage
values of L0..L4 might be unstable at this frequency with a 850 mV
supply and need 875 mV instead.

As long as we don't read out OTP leakage values, we should pick a
voltage for each OPP that is sufficient for all possible chip
characteristics, meaning the maximum of all opp-microvolt* given in
each OPP. This will result in higher -L* chips burning more power than
they have to, but at least they will be stable.

[1] https://github.com/rockchip-linux/kernel/blob/792a7d4273a59e80dafca48ba=
11438f43a6d8bda/arch/arm64/boot/dts/rockchip/rk3528.dtsi#L268

Best regards,
Alexey

