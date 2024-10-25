Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232BDD11708
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 07:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Yot5CVMrhD1GTtMp0Szbyl+xfW+qQ/vMp2WrwCQU80=; b=wMCdL2c73m4JFZFF0cY1k3XFmz
	O/DhADKyYY9uJWeOR3Y2hDFccrKv2dETioLhmZ4fOVAwC3hSZZMi9uxAnyFMtR51r4ryrRa3YEZEC
	NZOgRn59PuoHMmE7KSA91SuiQzDwlbyzfmfj8OOHML+lmBStdRSyHe4GSf55wYh9pXbLNvGgJVbY/
	op4GUfqk+Lc087/04ZvljUJwCW1Wj6eTPCms8WLXBdAWCTCmAOhvDMApCRwNUCgVcYxS6uvd0/1sP
	3PNlwPw+mZkb9MxJrlRRDJx67kKTyqzoEYUIop78WJc1O4yyic35fkp4bkYEsAv0KUFe2gk5MKM+n
	GZ+1mLRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4EVe-00000002mOr-0EKR;
	Fri, 25 Oct 2024 07:13:22 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4EU2-00000002mBQ-0OTs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 07:11:43 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a9a68480164so222127866b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 00:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oldum-net.20230601.gappssmtp.com; s=20230601; t=1729840292; x=1730445092; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2Yot5CVMrhD1GTtMp0Szbyl+xfW+qQ/vMp2WrwCQU80=;
        b=uanZlhj/Wph9IhT5hOYRkU4wLEXZDtytZTjz5LfMpU4SNwyBmY5Z06j3tKNR0TuguZ
         gMUW6bgF62961VZRjTjQ14sQoC0Zp7LJKFy22kj/+STr0rRgo5Xo2IFPVHtSJEbQl5Za
         q3TvYzfAyCnvMBS4zOrLQvdxdWnv4wVk3rbnylkHB3WiwrRt/GtWcdVaflDGApzz8NmU
         Gu/Z9Oy7wTgywPniY06nIndlDLxuNIQAmUo3Iq2SkwuNGfmMCPORb18YKT8OeJjv2cXU
         eJ9zjZtSSMy/NGXj7O5WttYWpaf7XW20l+IYPgPIR2gXm15MLTbH8bOHHh6uk5UcJrfH
         Gm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729840292; x=1730445092;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Yot5CVMrhD1GTtMp0Szbyl+xfW+qQ/vMp2WrwCQU80=;
        b=ckUZHZGkATO6BDjV9uK3k9dDyzFOPCfi5DYB+u3CsJPaZP0hVFkrUd1l72q7TLcpqZ
         pJuEswy/nrOAEi9CjjdYWLMIUekEwFKoXfdJ/KGD/W0ScpAfj3qjpHAznizKjH++g46M
         kucbPTXWHhKIruPFwx8EI+N+wUb+M9O1h43SgqN1U6V/smvAWAbi4yZpLDKBha4oRgEt
         KDfibd5VXIi99+ju9L0PUjbqITAMOQsriXg5vkIo0AGduCVsk9IzX/jHobrPALD6pMie
         EFTpaKpzsBjHFMU2uIiXxS3qBMlbg+ERksTX1UNGmbpS/GzUEU6Xk6Ul4D7tkTpPCu2W
         nxiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/qgr5+4XxgwkclUEYnjej+GQBRUhPWYMU8vvGu2xFLUxI4qJRwdXBZ7PVn8tbHE6e2JNy6s8U8d16EIZOczEp@lists.infradead.org
X-Gm-Message-State: AOJu0YxlRC5gDL436BxWhfywsJYqepBsXtu04nQuinPMFAqcNfHWblDl
	UR0rPXuj6xgJdkd0PQanQta4GbSZlbxV33CgGPmhxO538y3KZmMl6CpiOkbfcXw=
X-Google-Smtp-Source: AGHT+IGBdf9M+MhMVkkAf67M7SvMWvUIw/h/7r8rJ3Hdx2EtRLd3htedYCpRhV8dD7bWUo1PL92GzA==
X-Received: by 2002:a17:907:3e9f:b0:a9a:bbcc:508c with SMTP id a640c23a62f3a-a9ad2710a64mr438727766b.2.1729840291504;
        Fri, 25 Oct 2024 00:11:31 -0700 (PDT)
Received: from [10.1.0.200] (178-169-191-169.parvomai.ddns.bulsat.com. [178.169.191.169])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9b1f0298e7sm35760066b.75.2024.10.25.00.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 00:11:31 -0700 (PDT)
Message-ID: <3ace1329d4ef99b87780d0ef07db179d27d04d44.camel@oldum.net>
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
From: Nikolay Kichukov <nikolay@oldum.net>
To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>, 
	torvalds@linux-foundation.org
Cc: aospan@netup.ru, conor.dooley@microchip.com, ddrokosov@sberdevices.ru, 
 dmaengine@vger.kernel.org, dushistov@mail.ru, fancer.lancer@gmail.com, 
 geert@linux-m68k.org, gregkh@linuxfoundation.org,
 hoan@os.amperecomputing.com,  ink@jurassic.park.msu.ru, jeffbai@aosc.io,
 kexybiscuit@aosc.io,  linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-fpga@vger.kernel.org,
 linux-gpio@vger.kernel.org,  linux-hwmon@vger.kernel.org,
 linux-ide@vger.kernel.org,  linux-iio@vger.kernel.org,
 linux-media@vger.kernel.org,  linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,  linux-spi@vger.kernel.org,
 manivannan.sadhasivam@linaro.org, mattst88@gmail.com, 
 netdev@vger.kernel.org, nikita@trvn.ru, ntb@lists.linux.dev, 
 patches@lists.linux.dev, peter@typeblog.net, richard.henderson@linaro.org, 
 s.shtylyov@omp.ru, serjk@netup.ru, shc_work@mail.ru, torvic9@mailbox.org, 
 tsbogend@alpha.franken.de, v.georgiev@metrotek.ru, wangyuli@uniontech.com, 
 wsa+renesas@sang-engineering.com, xeb@mail.ru, rms@gnu.org,
 campaigns@fsf.org
Date: Fri, 25 Oct 2024 10:11:27 +0300
In-Reply-To: <20241024210120.4126-1-m.novosyolov@rosalinux.ru>
References: <CAHk-=wjw0i-95S_3Wgk+rGu0TUs8r1jVyBv0L8qfsz+TJR8XTQ@mail.gmail.com>
	 <20241024210120.4126-1-m.novosyolov@rosalinux.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_001142_517282_D29C40DD 
X-CRM114-Status: GOOD (  33.26  )
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

On Fri, 2024-10-25 at 00:01 +0300, Mikhail Novosyolov wrote:
> Linus, Greg,
>=20
> First of all thanks to you for taking by far not the most harmful
> actions to achieve what your lawyers very kindly asked you to do.
>=20
> Unfortunately, already a lot of highly qualified people have started
> thinking that you acted very badly. Of course, there are questions
> like why removed maintainers were not properly notified and did not
> receive any additional explanations, but, to my mind, it is useless to
> try to find 100% justice -- it is not possible. Overton windows has
> been opened a bit more.
>=20
> Usually the first contribution is much harder to make then the
> following ones. A big problem here is that now many people even will
> not try to contribute to the Linux kernel and other open source
> projects: their pride for themselves, their homeland, their colleagues
> has been severely hurt (we are ready to fight for all that).
>=20
> It is not clear what to do with this problem. Any ideas?
>=20
> I am sure that people from any country and of any nationality will
> have similar feelings if you act with them or their colleagues in a
> similar way.
>=20
> Thanks to people who were not afraid to say something against this
> action. Chinese, Latin American, African and other people probably
> understand that they may be the next ones to be dropped from
> maintainers. Hope that we will not have to form another Linux kernel
> upstream one day...
>=20
> I am sorry that you have to read a lot of text from people who you
> call trolls -- it is hard to keep calm.
>=20
> You know, you have really made it much harder to motivate people to
> contribute into the kernel. There is such problem among developers of
> hardware that they do not feel comfortable enough to show their code,
> for example because they think that it is not perfect. Let=E2=80=99s take
> Baikal Electronics. They do publish their kernel code, but in a form
> of tarballs without git. They slowly, but constantly worked on
> contributing support of their hardware into the upstream kernel,
> fixing not Baikal-related bugs by the way. One day someone told them
> that =E2=80=9Cwe are not comfortable with accepting your patches=E2=80=9D=
. And they
> stopped their work on upstream. Now that man has been removed from
> maintainers of previously contributed code (code for not Russian
> hardware, by the way).
>=20
> What do I suggest to do? Well, I don=E2=80=99t know, but I do not see dir=
ect
> legal reasons why doing this was required and why patches from Baikal
> could not be accepted (the fact that I do not see does not mean that
> they do not exist, but please show them). Politicians and activists
> can be shown a finger in some places, by both developers and lawyers,
> at least to prevent them from being too ambitious, when they decide to
> break something working next time... But maybe I do not know something
> about truly democratic regimes :-)
>=20
> Thanks for reading.
>=20
Hi folks,

I also do not consider what's happened here as normal. The maintainers
removal stands against the key principles and values of our GNU/Linux
communities and the FOSS ideology. Values and ideas most of us have been
protecting and advocating for since we can remember!

This hurt so badly! Really. This is betrial.

Even if this is now reverted, or the upstream kernel is forked and a new
upstream kernel repository is elected, the history of it will remain and
haunt us all.

Turned out our beloved and "free" as in freedom kernel has been
compromised by compliance to a government.

But this is the Linux kernel, how could this have happened?! It is used,
improved and copied all over the world, not just one country! Why did we
let this happen?

This is a precedent that tells everybody what can come next, due to
"compliance" reasons the kernel could receive code produced by a
government institution that serves not the Linux community, but the
governement.

Surely it is not just me thinking towards what can change so we never
again have to comply to a government of a country when fighting for
freedom!

FSF, any comments on this?

Resist!

+rms and fsf

Thanks,
Nikolay

