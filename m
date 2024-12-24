Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62A0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 19:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SqEo1aNWDrC5Ttbs/Jo6cIUBSX63aHeSqn5BsDyKIY=; b=JWEO6Vc7eRG74ivt7Rg2ySJtHT
	kt0ow4VnRj8KpIBoI3Tb1uOL1IVQ0fcVaQRDB4WpgleqV1lvgNdvkmhXll1VgvmbRynEazjQx1v9b
	bmigWYRH0Qhrapl+XoZKRkBqFHq+bqtvLOnTHWwLfZFZlmdjBbdVsKjY458hWoHrtRu/9MSA5Upao
	IpyahhqwRRMZTRf7++euXOnjscJ8rBWa7n0xqEkc3SAtxSdK0gctyggSui3pAspRMlLFIZaNGP4Tn
	SH5nk5UDXsfwPH2MBQjNE5XmifDu0/+Gi2pFeBj5BfeVwv6aGWWcfcU2sAjt0uM6hBpttJI8wUIt/
	BPPgSiQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQAYK-0000000CfI6-14tR;
	Tue, 24 Dec 2024 19:26:48 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQAX8-0000000Cf9T-0H3C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 19:25:35 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-3022598e213so57289821fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Dec 2024 11:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735068331; x=1735673131; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SqEo1aNWDrC5Ttbs/Jo6cIUBSX63aHeSqn5BsDyKIY=;
        b=gurF+VdvdMuD/Zq5nV9227d62lpeHNgHmzWs052YkYPCVsf+004nGtyhzYrR5zBQZb
         CPTbFSveub83pCxtskOiAMm+x+NDWD2pmsRCgbDLiHIU6hzIqlhAEqmuiaxHbzvG0pXs
         +zx7lA8qrHvqDPc3Xz9n3z2b+wxNcetcKjm8Mf7GavGQ5YFxewIM+c1Wynf9acwEZGK7
         fgjH996tPGrg1d/vzfXjV2cdPTolfIzH6DoIvMdbVwvsujVG7s8/KYKqIEKkk0I0n7dt
         iI+lzM6B+Xj2Ki7aHClBKJOEFhwerHgwEyrPh/wBV/aA+QscG1DkFGmJWK2EOaQKHJ3Z
         Ywog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735068331; x=1735673131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SqEo1aNWDrC5Ttbs/Jo6cIUBSX63aHeSqn5BsDyKIY=;
        b=QBFDCIAyYVN1v1ASOPqkxKWwdcWjSjB8/++SOPMUNnXv38ZdBVYGW95Iigr4q2ufo9
         HOo9cm/ngumtuGnDNQSkNiL22Kb/24thGk44cMeJpMWJadTTf9Kc94OxSJkHwLf3zytm
         CLSc7J/MdE64bPQgIVF9h9LZVWbsp+JnxX/uHloSOts0v+CptiwWZjWegbrARMBC/+E4
         wump1FJ2eEPrT47e3VxRAQp+FJBTl0hKLd2N2FDRmFIvSGqNCd6vfopJ2JdXHYtixS2g
         ih8Z4Fwsjw4AKrs32/P4JFg5Bn73lkoBCQLH530QfUb1+zpwrL4S3qpFnf1NbyU1LNWx
         nNqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhw/SUOEZdoyA1TNnvAADBWwpSGN6KSr+lK6st6YnRHL3qXbWjNPH+tLd8es6OS+1ODFw2eag82D0LeyEIHb9p@lists.infradead.org
X-Gm-Message-State: AOJu0YzHArVIYx9a7pVkXAHNa3wCPzoXyfVTc0OKVBDLKaxfMoBiFv1p
	IJF4EuqtUQeLtfSr9SOh9CcUWu5jq0QBO23C/s8MDbo/pBW8ohCYIv5nwC203WS7MFgFlxt7gqZ
	lebjuFIYeRSzmPZ6zzb+uvm/RjPsL6aEY2lacMQ==
X-Gm-Gg: ASbGncvakPa8mkoDbsv0tT/dfxUYGS8sL9q/9zNkuBQdjbcp0dufC4vLxMpml+s2QvL
	3WJlY2EIRigGiFm05J2P8Fwc63qpbxRxOgSpK
X-Google-Smtp-Source: AGHT+IG/8JqtB0M6AxWpHXOtz7rwR0de4QYIM5YnHHPVPKpBrtBcn3OBIgsu0A45P3fz13gnMOy91DF+DSqQUZfUxcc=
X-Received: by 2002:a05:651c:1a0c:b0:302:3534:1fba with SMTP id
 38308e7fff4ca-30468547e32mr59744411fa.17.1735068331233; Tue, 24 Dec 2024
 11:25:31 -0800 (PST)
MIME-Version: 1.0
References: <2200295.irdbgypaU6@devpool47.emlix.com> <1811814.VLH7GnMWUR@devpool47.emlix.com>
In-Reply-To: <1811814.VLH7GnMWUR@devpool47.emlix.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Dec 2024 20:25:19 +0100
Message-ID: <CACRpkdaAMu9WtD3a_XXGEwMfyFx6F-a263COna13eUWB0vqbcQ@mail.gmail.com>
Subject: Re: [PATCH] arm32: simplify ARM_MMU_KEEP usage
To: Rolf Eike Beer <eb@emlix.com>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Yuntao Liu <liuyuntao12@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_112534_131583_7867E7EC 
X-CRM114-Status: GOOD (  11.06  )
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

On Wed, Dec 18, 2024 at 1:13=E2=80=AFPM Rolf Eike Beer <eb@emlix.com> wrote=
:
> On Montag, 7. Oktober 2024 15:11:40 Mitteleurop=C3=A4ische Normalzeit Rol=
f Eike
> Beer wrote:
> > All current users need to add a KEEP() around the argument so the value=
 is
> > actually kept, which doesn't feel very natural and is prone to upcoming=
 bugs
> > as the name suggests that this macro alone already keeps things. Move t=
hat
> > directly into the definition.
> >
> > Signed-off-by: Rolf Eike Beer <eb@emlix.com>
> > ---
>
> Ping?

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please put the patch into Russell's patch tracker so he can apply it.

Yours,
Linus Walleij

