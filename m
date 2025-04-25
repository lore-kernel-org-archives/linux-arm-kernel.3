Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A191C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 03:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMCG7PVJZT2ImV73Bv9BnKAx04gSVppKM7hgJ6w7nuM=; b=SU/2/rpBMCYpe5
	Ao3VfFfZ5E+HIG4Zi6F3x3vFp3U1trMmboEnQj//x0uwyiymp5nhzlu/eTb7MBdB8kFFsZHYNzKIL
	5NgKxkqWVJ21yY7Af/3Pg94jXppobCCRBWg+E0t96ynOTuwKIKe0qjslET/a89uwp2+sHb1p2Chf8
	xs698OvXFTATc9fGQeRNX5M9KN4pq0o6vUFgrhol7nWotsDENMMVJr8QsIam//rM0oH2imhSEDtof
	+G/Nkwce72e6zv5rdpPLVxiCfS/4ht3Zi8umB0AN9nc/qYNt4FEZUAJ55cA+Y1UYIMA/NtgI9c3Ik
	MZvwGrqNoPiZMmudsp3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8A9P-0000000Fsr7-0vC6;
	Fri, 25 Apr 2025 03:54:55 +0000
Received: from mail-lj1-f179.google.com ([209.85.208.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8A7X-0000000Fsgw-2lF3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 03:53:01 +0000
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30db1bc464dso18304671fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 20:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745553176; x=1746157976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tMCG7PVJZT2ImV73Bv9BnKAx04gSVppKM7hgJ6w7nuM=;
        b=RYKiqReTHo2bzv5tJf6IS1IZue5YFPUiNFPeEtaFbjmv49MHkv7LPoVXTfls45IU5z
         sR+d7AVfuaSdMXAOkXKLBJ/YYQPeFhGALMef+ycUlJHK1Fdj1YP789q2eoW1HkAGtXx8
         YRm42C2BWODPFgIenQhQ2kEaZ68T2Hx1kkLtTsBGqgdktZ8aFHd1dxie9sKnV7t5jvh4
         RB1kjKudMNDQwOgby7jXQQr3caGouGr2Lu4ROEwDKhP0LLNxzV7C9gpFSUiCzUwAzm+i
         4gm26Ii1VDrtrHzNa8IriICvJllzpxIUEgAkU0vyd3oUfnxwozVnGL6/3hD1Hz3jDwRt
         A0Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWzmVEKrGuZATqinp4KzGi9eEWZfXHjSOvQSqFhUsSaeDqq091nub2/tZxe3mUKjBFyXDkozF2tjvKAM1yPdL2Z@lists.infradead.org
X-Gm-Message-State: AOJu0YzEsPvF07B3wvnC7lwef9paeOWBJ2xxUHnHoUoAwmbNSpUTwi6r
	R/428BlOb2JQ1FaGJOyX3swI5izlK573/Wlcl4A5RgiViqtUAlgyDALYBoIK
X-Gm-Gg: ASbGncvI8nYPP4/ewcMWgqo4bfFdWG7ZFWY0SnY4qbYDa0nF4hpOjrocPTSUIVAy7LY
	ZKcUvNi8JjmmXi6cBlNDt5YH2UttQdMB5h3jJh2di8jeUfReDu/EuFq8DsEXFfpGSuDotH3G6jh
	MxIhx1AoXw9MWQYwofiRHWyTJHUfsef6aupcQipYbfLxFne6xHV1Of1jjKfntScdvlexzu5C7i1
	x+qIcg0CMvdvAQ0Asm8OSoPIaOdLXF6i5LTKRCI1IlORWaTwudsZ0ofHqYEKpEAHnqcEkcstYqK
	IhDmQXXway1y2subn9UkTYPKC7f174Mtx3rYEywgSBAPszZMuM54oVf6V0pyxqUI86A5o1OYmg=
	=
X-Google-Smtp-Source: AGHT+IFO6+/npA7KNoobay33NRyj+/nNuxHuSCc5LdRrdlhQs2+gMfJaOOv1FzbE0rzdcOEMDk2WvQ==
X-Received: by 2002:a2e:be14:0:b0:30c:518e:452 with SMTP id 38308e7fff4ca-3190644df3emr1393721fa.13.1745553176291;
        Thu, 24 Apr 2025 20:52:56 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b96ab2sm5434851fa.92.2025.04.24.20.52.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 20:52:56 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30db1bc464dso18304411fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 20:52:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXkLY3yPG4bnV5+27gV7vdxnubVGbCyE5I0fXwJf8UIzZ6MBsvnFZ23PsXOcT60TuI389ZUXvAchEwm0YMmCrUI@lists.infradead.org
X-Received: by 2002:a2e:bc90:0:b0:309:26e8:cb1a with SMTP id
 38308e7fff4ca-319081da5e5mr1615191fa.30.1745553175817; Thu, 24 Apr 2025
 20:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250425023527-GYA50272@gentoo> <20250425030006.45169-1-amadeus@jmu.edu.cn>
In-Reply-To: <20250425030006.45169-1-amadeus@jmu.edu.cn>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Apr 2025 11:52:42 +0800
X-Gmail-Original-Message-ID: <CAGb2v649ntfAEUdV5S1wM8nUGhvaOP-RBw07XcxwdbafbC2PYQ@mail.gmail.com>
X-Gm-Features: ATxdqUGezFuhR_KSYVB0KgNvKi6facsIdDbC9B14oLs_hkhyS0lMNSVl4JE789M
Message-ID: <CAGb2v649ntfAEUdV5S1wM8nUGhvaOP-RBw07XcxwdbafbC2PYQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: allwinner: correct the model name for
 Radxa Cubie A5E
To: Chukun Pan <amadeus@jmu.edu.cn>, andre.przywara@arm.com
Cc: dlan@gentoo.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	jernej.skrabec@gmail.com, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, robh@kernel.org, samuel@sholland.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_205259_696539_A06C44AE 
X-CRM114-Status: GOOD (  14.85  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Apr 25, 2025 at 11:00=E2=80=AFAM Chukun Pan <amadeus@jmu.edu.cn> wr=
ote:
>
> Hi,
>
> > It seems I'm a little bit late for this, but while we are here,
> > Can we also append 'cubie' to dts file name?
> > e.g. - sun55i-a527-radxa-cubie-a5e.dts
>
> Usually we use the device name (without the vendor name),
> maybe sun55i-a527-cubie-a5e.dts would be better?

I agree with this one.

I can probably squash in a name change (since I'll be squashing in the
SD card slot fix anyway). Andre?


In that case would you prefer to keep your current patch separate, or
squashed in so that everything is clean from the first commit?

It's up to you since you lose out on commit stats.


Thanks
ChenYu

> Thanks,
> Chukun
>
> --
> 2.25.1
>
>

