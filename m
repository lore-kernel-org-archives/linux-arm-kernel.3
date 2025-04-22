Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DFBC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 02:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4af7Xc1+5cnfHb5k0WJTCxDvRo5jrtAyH2B4OstKv4o=; b=cVE7VzHZCpdnnAMHO5ukno+fZU
	NPBJYeRnwWdG+D9gi99itAItXLpftkYc98C6g84mplqKGyXY+VexoGR5oZjtnlJ2tA3JvgxMhzsHy
	4W/tLjG+mpyfY6h5bRXe32p/6miKa6sVBSWYChnLryhubQLOWMbNozNYlf4MEDGykfqNuLFkFDAZF
	WKrz5l03RFNxxmDvmqVBV4rGmomPA3rVxxoR1o97cFnV2FpOuL4pSFcWngYQxjkca52pqSrWsrA95
	41vh+iYp46V6Z8n5mxvXzqIO2su4LAlCXe1RmyAvSlz5DvffdgQ3qMW1cZpkb7iXnshb/DRPWoOBo
	Lm6pR5VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73nQ-00000005h7s-44zg;
	Tue, 22 Apr 2025 02:55:40 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73Fv-00000005aMr-2aK0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 02:21:05 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39c266c1389so3336648f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 19:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745288461; x=1745893261; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4af7Xc1+5cnfHb5k0WJTCxDvRo5jrtAyH2B4OstKv4o=;
        b=x4OPSOdQI8KVet1nk+lpPO03L6ULYGxSNiMbz6d4wBhM4zZdr8O+HiisGeGUNBizCt
         hdyDSEyfyJwBS2h2rXFgpeEPAS+bOKyNXMWiEZIrR1L8ih56FWiHLbpjGLjsuS8GI1ib
         fkKxJm2h0OKDuRLHLxSnaiNPV+n/X/izJJQymVpHOtBn44gXrW3vSnJpUxzsZGPkwwWM
         OSCB1GQXKuNmPMqpaINmTJ+AGvmIC9r2NNBgmS0Oy+pLhvPJjvg3T83rp+ubzYFLj+Fk
         FbtubPzzXtwbRawnlWFLLey7EMYgdcvt4v7VLvmeBWwmiwYrMeVYOhMy5zEgBJQXtKEQ
         AFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745288461; x=1745893261;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4af7Xc1+5cnfHb5k0WJTCxDvRo5jrtAyH2B4OstKv4o=;
        b=moEN8TWh1Oed+5w+m9o7KCHKNN38lhTzP5G7EOF8svcItcw39PBzoTB3rTKChA6Ukj
         ChI2xeKJxECh/0tT41UJo7T1oOQYJ3f0RC1BNOFsJGyE1j7M4ufdTiwrm+TL9F1yzu12
         a9cexsQVG1Fhzds4htbOy6jinXj+gAd5xasDKvsob/k/GLnpjTWGUciSUKAw1qmXf/6B
         Q+FOxciWyx3Wl60vwjvVmUBMraXA0TVYvsIZTOA4C/59Mr017S4UwwaNhfkIf7awIuqU
         Uay9sBZLZ7UpwNWn6OyjADI9xVEY1tuCtpABuPCvcEzdirSKVs2K2NxaA0rjJvC390/A
         eCgg==
X-Forwarded-Encrypted: i=1; AJvYcCUqneNWr0PuKcKgJIkb5cpeCzbEzAqQQ1ZkMofDl4wQlakYasPSfXN6T/iTHM1qMEUfJ6iXdJ86pzRWBVDHuCpt@lists.infradead.org
X-Gm-Message-State: AOJu0YywLj1AWguc1FQLTvu3rIpD2MyIETmo9Nvf9icesAeWLLvQIHAJ
	TrTgzBY84qwkVyq8ZU3glA0Xg8Mu6+8zrSMcagg5R5lv5oRsx7UdRnnyH29OIGU=
X-Gm-Gg: ASbGncuB+AtM95bHT4ToC3MnaYkCXM8xik7Rgm9oKSOAtLRR0uq1aDe6Bzva+YU0rli
	4EyliQAsONXNpXH8kXuHQC921KU9h9tQ30yk6AHfp6qidkSKNQS/pOrlwZC+kU/I1zYs8+fTuGG
	gscvdBzZLUBbFlE1vF4hsRvl0NPG6dYC5IUKys7zkTEoi6Q2yaRiMKbU0rt0du4eyUjTQFye467
	60aTROC3Um2ubDAsUDg26w9TN6BZysPK/IhS5yBmOsq0dBK4VlfHP1f7Sx+kn47+0CuKmE2p+S3
	S9iiSs16pB2eccZ1xvvcHX+7CPq5yaMUzEXC/ER6
X-Google-Smtp-Source: AGHT+IFgeV/8j5th33piQmdTquaU2Z4bEmnQQNcAV7T3TABQNERWr1QfIiL6vJSAQOiHKjbGoM4Bwg==
X-Received: by 2002:a5d:47cf:0:b0:390:f0ff:2bf8 with SMTP id ffacd0b85a97d-39efba2ab65mr12333940f8f.10.1745288461621;
        Mon, 21 Apr 2025 19:21:01 -0700 (PDT)
Received: from localhost ([2.216.7.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4a4e9esm13748087f8f.96.2025.04.21.19.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 19:21:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Apr 2025 03:20:59 +0100
Message-Id: <D9CT4HS7F067.J0GJHAGHI9G9@linaro.org>
To: "Alex Deucher" <alexdeucher@gmail.com>, "Fugang Duan"
 <fugang.duan@cixtech.com>
Cc: "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "frank.min@amd.com" <frank.min@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, "david.belanger@amd.com"
 <david.belanger@amd.com>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "Peter Chen" <peter.chen@cixtech.com>,
 "cix-kernel-upstream" <cix-kernel-upstream@cixtech.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: =?utf-8?q?Re:_=E5=9B=9E=E5=A4=8D:_[REGRESSION]_amdgpu:_async_system_error?= =?utf-8?q?_exception_from_hdp=5Fv5=5F0=5Fflush=5Fhdp()?=
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <D97FB92117J2.PXTNFKCIRWAS@linaro.org>
 <SI2PR06MB5041FB15F8DBB44916FB6430F1BD2@SI2PR06MB5041.apcprd06.prod.outlook.com> <D980Y4WDV662.L4S7QAU72GN2@linaro.org> <CADnq5_NT0syV8wB=MZZRDONsTNSYwNXhGhNg9LOFmn=MJP7d9Q@mail.gmail.com> <SI2PR06MB504138A5BEA1E1B3772E8527F1BC2@SI2PR06MB5041.apcprd06.prod.outlook.com> <CADnq5_M=YiMVvMpGaFhn2T3jRWGY2FrsUwCVPG6HupmTzZCYug@mail.gmail.com>
In-Reply-To: <CADnq5_M=YiMVvMpGaFhn2T3jRWGY2FrsUwCVPG6HupmTzZCYug@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_192103_667701_52A9F629 
X-CRM114-Status: GOOD (  17.53  )
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

On Thu Apr 17, 2025 at 2:08 PM BST, Alex Deucher wrote:
> On Wed, Apr 16, 2025 at 8:43=E2=80=AFPM Fugang Duan <fugang.duan@cixtech.=
com> wrote:
>>
>> =E5=8F=91=E4=BB=B6=E4=BA=BA: Alex Deucher <alexdeucher@gmail.com> =E5=8F=
=91=E9=80=81=E6=97=B6=E9=97=B4: 2025=E5=B9=B44=E6=9C=8816=E6=97=A5 22:49
>> >=E6=94=B6=E4=BB=B6=E4=BA=BA: Alexey Klimov <alexey.klimov@linaro.org>
>> >On Wed, Apr 16, 2025 at 9:48=E2=80=AFAM Alexey Klimov <alexey.klimov@li=
naro.org> wrote:
>> >>
>> >> On Wed Apr 16, 2025 at 4:12 AM BST, Fugang Duan wrote:
>> >> > =E5=8F=91=E4=BB=B6=E4=BA=BA: Alexey Klimov <alexey.klimov@linaro.or=
g> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2025=E5=B9=B44=E6=9C=8816
>> >=E6=97=A5 2:28
>> >> >>#regzbot introduced: v6.12..v6.13
>> >>
>> >> [..]
>> >>
>> >> >>The only change related to hdp_v5_0_flush_hdp() was
>> >> >>cf424020e040 drm/amdgpu/hdp5.0: do a posting read when flushing HDP
>> >> >>
>> >> >>Reverting that commit ^^ did help and resolved that problem. Before
>> >> >>sending revert as-is I was interested to know if there supposed to
>> >> >>be a proper fix for this or maybe someone is interested to debug th=
is or
>> >have any suggestions.
>> >> >>
>> >> > Can you revert the change and try again
>> >> > https://gitlab.com/linux-kernel/linux/-/commit/cf424020e040be35df05=
b
>> >> > 682b546b255e74a420f
>> >>
>> >> Please read my email in the first place.
>> >> Let me quote just in case:
>> >>
>> >> >The only change related to hdp_v5_0_flush_hdp() was
>> >> >cf424020e040 drm/amdgpu/hdp5.0: do a posting read when flushing HDP
>> >>
>> >> >Reverting that commit ^^ did help and resolved that problem.
>> >
>> >We can't really revert the change as that will lead to coherency proble=
ms.  What
>> >is the page size on your system?  Does the attached patch fix it?
>> >
>> >Alex
>> >
>> 4K page size.  We can try the fix if we got the environment.
>
> OK.  that patch won't change anything then.  Can you try this patch inste=
ad?

Config I am using is basically defconfig wrt memory parameters, yeah, i use=
 4k.

So I tested that patch, thank you, and some other different configurations =
--
nothing helped. Exactly the same behaviour with the same backtrace.

So it seems that it is firmware problem after all?

Thanks,
Alexey

