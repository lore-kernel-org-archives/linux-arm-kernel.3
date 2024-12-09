Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA9DE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k8VP5kOfhoVqus7WQGQY41hMa5PPCwbCqnVQwI5Y/M0=; b=OcJ+dNiiDTO3pPz9IiIlmr+vHh
	w9yruzU+RhtXCixRLkHHAE1CBwSsvReDWpj7h+sjiQx6ORqFTphFNc8nVsCsatAyRtfnkKp+ulsEM
	N/ILCHHuaWHj6luesPPL9w/klpH1rAmlPReakz2YDyMTrhuIzhM4vgxeXGOLOz40/4fyCtKc29hFZ
	8Hz5NTtWdbMAS8XRx20l4Scia2Hj6vmjw17w7fzyBgTK4dvE7oRnaGagntGR+6IZfsAfGabqY0fAu
	jtImQmarzVx4s5Y3MGGeeuyxQw2fwTcniQBJeAmuPSVRI9LdTTGrRR+dCS6ycOAMsWLaFAi/+7uWQ
	N+H+qBdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdqh-00000007zpz-2m8y;
	Mon, 09 Dec 2024 13:30:55 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdmA-00000007yWj-344b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 13:26:15 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so3195077a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 05:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733750773; x=1734355573; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8VP5kOfhoVqus7WQGQY41hMa5PPCwbCqnVQwI5Y/M0=;
        b=EE9T4W6mF0j6yq1PQkgvhV+0VKb3x1IWjeMZ65CuC+SNN6OlfxZ6I8qGs5dhKkgwvp
         3Jk5V2oOqwFMMZzygDG+RH+iHwaMD5PZTuL7eksMRbf3k1B5Sg2Tgdgqw6PrJwzIcVjA
         01mxUHzpLbCAyZhsLfyhkgAJuzbNT8SE6UDnHbc4FwGRRb44xovPDC4Ygpl7GEizv5xi
         UpYDcL4ORqDGYaEOJRCLE3R9/BfoAOeL2bDTdpPEc9EzpvmbTSoScj0QRCLxIs666vNK
         MAOTYqBeugpSXQOkqeDFuqEj+2CXxQk+V04WYZzEIi2xdNBT+46pE/BDusVUTa3QTzo8
         EfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733750773; x=1734355573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8VP5kOfhoVqus7WQGQY41hMa5PPCwbCqnVQwI5Y/M0=;
        b=RA4mipju1b1uDFxFGy0tvvAOmDfHmkbn+fpE3BOaZjPLoNlsV2MDiZkV59Q9ecAnYD
         PzUaETxhuzCMoWQ/w4Ta0WxmEE4GQFePz6nx+UdMqPcS78/mrdk8wKAMRzCMB6MJYAaK
         VRW65/lzDt5UtmC7/4C30ElhR37vN0g4+fmGJxk04d9gmVXrqkQ2cNx7pkF+ElQu9E9e
         DBm8LXFXgRbO76CNfliXTj+D1pkJR0kPvGXzILl6/WPqMUIUSuiMWuyJ/x/KNqUTlciP
         ezCMt+oSWzm2xN5sRxLtRWGEhDfDO9t4ctt4x6YhGAgitUD0H6NJRIkR1YtJwgvBWYag
         1bHg==
X-Forwarded-Encrypted: i=1; AJvYcCUpTBLSr2MDzaG+v+y5pfVMzR8WDzpWZgvQp1WElFt62ucFVN2LoQbyGPJ4EO/TbqU2W3/o5aPKN4QOE35BXPSP@lists.infradead.org
X-Gm-Message-State: AOJu0YxjHAbqCWlI6hLcadZh2eLIV/46F8ybkoCRaJsAzc6e90tKl+wB
	s80nbpbpYlJlwT5HRZbi8mMGOFS3fAdrrJh4gDtMxo1urTYCHVl/3cFMcDRbIpp/pnQyeEb5ze7
	uTpCEJW2stpK7sU2M0BMvpXraCU5fglQ52phgsG76
X-Gm-Gg: ASbGnctvM7UIaWfXfki1wNoMn4ZV3lv3gjUCmxOOlZpRzBcY0MvFWQmZEaH/pASgt1M
	gNc3m3h6SAUw1awuevlv7zpP8SO+ryu0=
X-Google-Smtp-Source: AGHT+IF73eped6CD54oRoY4m6IhXLQ3vbzk/j3x0mL97CA8k1E6rPFedbfgYtvlPJSSkPh5QO7xPtyNpDaOSR7n7SkM=
X-Received: by 2002:a05:6402:2550:b0:5d0:bf4a:3dfe with SMTP id
 4fb4d7f45d1cf-5d3be7f01e6mr11120673a12.23.1733750772507; Mon, 09 Dec 2024
 05:26:12 -0800 (PST)
MIME-Version: 1.0
References: <20241209105237.10498-1-o451686892@gmail.com> <3279e669-1ee2-4792-9e10-8b40928de6b4@sirena.org.uk>
 <CAHk0Hov5k37=MtTBLWTj+Dwm4EXE0xGJS1Uc8xgyLtJxusqsww@mail.gmail.com> <c05f6ad8-2dc1-4ddb-b9c1-b2cddfe78819@sirena.org.uk>
In-Reply-To: <c05f6ad8-2dc1-4ddb-b9c1-b2cddfe78819@sirena.org.uk>
From: Weizhao Ouyang <o451686892@gmail.com>
Date: Mon, 9 Dec 2024 21:26:01 +0800
Message-ID: <CAHk0HotQ-=s+-FHh8pAOg10ivcRwqChG735qgDvuQd=4B1QQNA@mail.gmail.com>
Subject: Re: [PATCH] kselftest/arm64: abi: fix SVCR detection
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_052614_771539_84668C2D 
X-CRM114-Status: GOOD (  18.92  )
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

On Mon, Dec 9, 2024 at 9:12=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Dec 09, 2024 at 08:51:28PM +0800, Weizhao Ouyang wrote:
> > On Mon, Dec 9, 2024 at 8:36=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:
>
> > > >       // Set SVCR if we're doing SME
> > > > -     cbz     x1, 1f
> > > >       adrp    x2, svcr_in
> > > >       ldr     x2, [x2, :lo12:svcr_in]
> > > > +     cbz     x1, 1f
> > > >       msr     S3_3_C4_C2_2, x2
>
> > > This is against an older verison of the code so wouldn't apply now.
> > > It's not also checking the value of SVCR, this is checking the SME fl=
ag
> > > the check is against x1.
>
> > This patch aims to fix the second check (SVCR_ZA_SHIFT) instead of
> > the first one (the x1 SME flag you're referring to):
>
> If we don't have SME we should be skipping over all the SME code and
> never even looking at the value of SVCR.  Looking at the current version
> of the code it does that, it branches to check_sve_in if SME is not
> enabled.

Hi Mark,

Yes we should skip it, this is just a minor tweak based on the
current implementation, after all, we manually passed its value by
svcr_in.

Which latest code version are you referring to? I think check_sve_in
is in fp testcase, not in the abi testcase. (checked the -next tree)

BR,
Weizhao

