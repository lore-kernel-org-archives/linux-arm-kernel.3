Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDE8CFA45F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLwni55Q0o3LkpPoGPWHU+nZClL0F1PcEd+W91uMukA=; b=oQaXbj3P5qf55FsKYTe5EAxllg
	5tlzkSZK+TJVViG+VqFelb+sqFuGybrQ7a+2LiTmRcx0o0vGOiYzAZsAI2QA6woeBilVbELGPeSQ5
	BND2M8eQ15+EVRi1cRDQYUkif/yN1eEjiu/phPU01zwIz3Ymr371xsMuqZ2pZLNoCJcCnWA2ODygn
	FB3Uxg3JwrCmFup1rlscq0Mkm3Oz2mWCP9umxCy+bdZWwJNp8cJBjQS5/97SIKho/TTr8tyUn9dph
	NcKpwU3Jnqq37qo2wjoqlM7Bj2IKqlic5gRNAOQlPLJr+2EFJeQyraei9OzTjPwpswDbZYnQ0GX45
	7nRncP/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gwD-0000000FevP-0inG;
	Wed, 23 Oct 2024 19:22:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fYO-0000000FRbT-1gH5
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 17:53:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FLwni55Q0o3LkpPoGPWHU+nZClL0F1PcEd+W91uMukA=; b=m6ULLC/DeQhP6vfxZN+FFf99EJ
	cwjZdGSrDT84mlHueSAWRgI7KAndiJYBU0zyQZaOhXIGXdVs+PEXuqwAYHj/i8kbDEaidY4XBgxVd
	2L5SAzyiTZBeNUcP82Oik/j2OWInQ4PyPDtiHr1cRwBAONnjG0Valv6PD9I3J+/vCS+sk15rQfW8w
	tyev81VWV4MNNsJ1ZbhwtwWalnFUo/VxF+x7+aA4jPwr8SD4wtYxA4lj9X5HqQuwwe9Y2lq5n/QEy
	Q+mRernGFgK62l3zUHFKxrpErUedozmOqyn0V5Mhqtyhtz8QHH1n9XWyXdCrcOODfjA05bggzNoWR
	gckAdm5Q==;
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fYL-00000008Vt9-0WWr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 17:53:51 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso30866e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 10:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729706024; x=1730310824; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FLwni55Q0o3LkpPoGPWHU+nZClL0F1PcEd+W91uMukA=;
        b=GJj03yQeQpIqb8BS1Ld1XjZp+PLq8fuN50Gs52Jbf3hebIix0kPAWd6AXjwIK3DeiL
         yJXYpHBnB9J+/SzOKvhTOwv6iCHI17bfomO7ubbSEzJV/L8fPRafFXGOgu45nu8CWJxH
         cKbNCqWMQA1aMTxJWq2OHQ5WEokow87WrzFKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729706024; x=1730310824;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLwni55Q0o3LkpPoGPWHU+nZClL0F1PcEd+W91uMukA=;
        b=oY/b5XsSXPXe4S0jDG2eqkHzMymDFxNebmT5vxlzyEVldQSBY9VsPRPbVrQs946C5g
         m8X4J6RvOBQvC4Cg38ADNL9nPhj3lQrJIaIBtDcY1s8xF+K3LupocjSRa3x3SaMG4OWU
         bfGPGz2IruQA9EZwGXvFm52Ine5mVBxuR3gGn24eN82uNBwl6ETN3u54cH0b7sJNXOLQ
         c4ceiNzfb+LtqDhlt+i6vwoW6xOw9gKKzqeHWbM5wCEtRoyYRhMfzrhbvMSIOnq23KWa
         gO/I0V6EQwJio12Yv0f0oK7jr7jYk1ScdoZjPzckuO6OZWcO+ab6cgnH0SW5KjLo9Qxr
         GEOw==
X-Forwarded-Encrypted: i=1; AJvYcCVXNEQOiaV0CGs4/x68IEg333FWekxH6Xa9VCvC2c5xNFEOTQtxjP0SRzv+F/3kM2pe48F1Uz6VkpAu5V1t0zGw@lists.infradead.org
X-Gm-Message-State: AOJu0YwkvftKPYIeE8BY57cPxPtDwftlrsBbt1JJQoddHqHZ9fXiFRXP
	o2Low8uzf+HqtO5LrE+Q9dt0R38zuzLHucnQPcbSvicAdxd2+ColXrD240qIVCJEcPj+2Xt8ki0
	3XEEjEg==
X-Google-Smtp-Source: AGHT+IGlWPFXFdGLBMt6vrAwWGkJmCfOmVAhMCcQp0CUBjJQwLOOfdBmKBX0DsKeiPAArIZEUIjQrg==
X-Received: by 2002:a05:6512:118a:b0:539:d428:fbd1 with SMTP id 2adb3069b0e04-53b1a375b3fmr1918659e87.55.1729706024240;
        Wed, 23 Oct 2024 10:53:44 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a224403fcsm1121377e87.280.2024.10.23.10.53.42
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 10:53:43 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so67611fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 10:53:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWmDlblqymRBKr+fZ9YVZBqiAhtBVheTi7Io3DQrR2esIxbZXoJWLGHjkT7t4mS9zIMD910axKKmX7fWsb5cknT@lists.infradead.org
X-Received: by 2002:a17:907:94c3:b0:a9a:8042:bbb8 with SMTP id
 a640c23a62f3a-a9abf94d4b2mr369489566b.47.1729705563762; Wed, 23 Oct 2024
 10:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <a08dc31ab773604d8f206ba005dc4c7a@aosc.io> <20241023080935.2945-2-kexybiscuit@aosc.io>
 <124c1b03-24c9-4f19-99a9-6eb2241406c2@mailbox.org>
In-Reply-To: <124c1b03-24c9-4f19-99a9-6eb2241406c2@mailbox.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Oct 2024 10:45:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
Message-ID: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
To: Tor Vic <torvic9@mailbox.org>
Cc: Kexy Biscuit <kexybiscuit@aosc.io>, jeffbai@aosc.io, gregkh@linuxfoundation.org, 
	wangyuli@uniontech.com, aospan@netup.ru, conor.dooley@microchip.com, 
	ddrokosov@sberdevices.ru, dmaengine@vger.kernel.org, dushistov@mail.ru, 
	fancer.lancer@gmail.com, geert@linux-m68k.org, hoan@os.amperecomputing.com, 
	ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-ide@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org, 
	manivannan.sadhasivam@linaro.org, mattst88@gmail.com, netdev@vger.kernel.org, 
	nikita@trvn.ru, ntb@lists.linux.dev, patches@lists.linux.dev, 
	richard.henderson@linaro.org, s.shtylyov@omp.ru, serjk@netup.ru, 
	shc_work@mail.ru, tsbogend@alpha.franken.de, v.georgiev@metrotek.ru, 
	wsa+renesas@sang-engineering.com, xeb@mail.ru
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_185349_345321_8876B3A6 
X-CRM114-Status: UNSURE (   7.85  )
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

Ok, lots of Russian trolls out and about.

It's entirely clear why the change was done, it's not getting
reverted, and using multiple random anonymous accounts to try to
"grass root" it by Russian troll factories isn't going to change
anything.

And FYI for the actual innocent bystanders who aren't troll farm
accounts - the "various compliance requirements" are not just a US
thing.

If you haven't heard of Russian sanctions yet, you should try to read
the news some day.  And by "news", I don't mean Russian
state-sponsored spam.

As to sending me a revert patch - please use whatever mush you call
brains. I'm Finnish. Did you think I'd be *supporting* Russian
aggression? Apparently it's not just lack of real news, it's lack of
history knowledge too.

                      Linus

