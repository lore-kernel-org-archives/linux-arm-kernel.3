Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2E7E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 09:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cml146Fs5k+G4PjNChFTpGbRGu78pseB/DaGmrlqOVo=; b=g0Xy1acui41xlM7CgWcYdEstmp
	vgnMXuyEVzaojgW/SYt6onRG2fAS5iI83CJg487BkzU43VfyKRUTLwU4NSlY+cKQ4B1r1ow1Odaki
	fwG6MBSNU9LlgrSWMPtarz4OV3xYGfm4Rbp4Mlwp7Jeq7+E8QiutSxvvKlMy0uWgL+EiNztf8KhuF
	16Xbz6GxvrH6GeWOTEXp1I8dwo3NWarxI0Ftx9E/s8f/Al7PT0MC4+67fpbwGryv4NvIO4ono2nOS
	pR247tt0SKRRLw5CADozlFFCrzYOIyu29G4mEdER9fzruGfi4vSI7vquOoca4I+KPWKbHilazgHD8
	5G9fCvUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMOcP-000000067lI-3ny4;
	Sat, 14 Dec 2024 09:39:25 +0000
Received: from mail-io1-f41.google.com ([209.85.166.41])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMObJ-000000067fG-0reM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 09:38:18 +0000
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-844cd85f5ebso209283239f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 01:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734169096; x=1734773896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cml146Fs5k+G4PjNChFTpGbRGu78pseB/DaGmrlqOVo=;
        b=LxW7y002RQqyF68FWo0ox6c8s1gTBu9rB4C4k239JQWhguyLXNAj5b/BMm5hvlXDh8
         9ZpPI7hRsUjzt8MTv4ejTJ7xQk/05G9+fFuo8AXvvkHPy+/RGcZiaoz6Pf0EAxNOQqcp
         iim11uE0MGqdt7nOZ8GaeSWhHnBHSwqHKOfySliRiQ17F5dEk7jesqOcLScSm+JXXUO0
         /p6n4QHnH/o3QCYQoD+oIUXUhmjFDolzDmnk16A0DFeWFJeU6b1trpGz85fwiZijZYrI
         d9GsjDllgD9GFFrv2hmSaLxAodC6bhnBYcpHIBragFgdBZ/qdUf7IO0uVPf2YgP+JBKf
         Q0CA==
X-Forwarded-Encrypted: i=1; AJvYcCUwoIOzm5qfMraaShLTPpL8mDpPImRvZial5OTbJBSyOKISF2UQkDDsk2rrapARC6uQPmClrfTy/3xeaJaOB6jE@lists.infradead.org
X-Gm-Message-State: AOJu0YypJFjmv5nnCxYng+wcKB42mQdRR+Khe9kQbbAYj0OMgt/0/WJJ
	CsZlIzLxAUhbc6tR4L08WM9yr6CZdu3CFgjQPBsqm0UVCdNRAghgAPYrWcxa
X-Gm-Gg: ASbGncsSpHv2/MkitInKGjj+aHwyiDJHhTqi3OlIWUiJxfEUwJe4xqiEwQtJ1zCWWzJ
	au99mWKNsca98yW91AvM509FsN7bJeaeGIfHsQXW2+i+jCpXKq3eOfz+6W1kzhdisME6uIaoZRN
	g5bG0ZM4ntqrpxwaJigyLsm6ImJaztV16a6F5xUEpxjFK4b6b1DvZ94F0XpT+bztzVmuidoZoPW
	5k/d9eW+XDvfvgKcHBElr3WPJ5uClpVOeSiCETrOIJibsWnSpC/amIe5XJK8fUVrJVWkwHtu+oE
	Gja55/MwAAGj/g==
X-Google-Smtp-Source: AGHT+IFcAAYJl95u7oS07NobKDKUdhcvxVAwcr/FqjyIZn3whj8bQuO5erFE97uhbWdD8D/XpcUgvA==
X-Received: by 2002:a05:6602:15d1:b0:843:f220:fa3d with SMTP id ca18e2360f4ac-844e8a97e52mr674464239f.7.1734169095817;
        Sat, 14 Dec 2024 01:38:15 -0800 (PST)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com. [209.85.166.50])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-844f62583f6sm28356539f.14.2024.12.14.01.38.15
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2024 01:38:15 -0800 (PST)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-844cd85f5ebso209282439f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 01:38:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUIxibpSbtvnI+lraXlV2EwDkDu6GvYL0iYSXSv+8nnAIsirM1IoPa5R/oSlHJ3ZN9zDOilwKN9KJjNOPOoRiQI@lists.infradead.org
X-Received: by 2002:a05:6e02:1541:b0:3a7:776e:93fb with SMTP id
 e9e14a558f8ab-3afee2cfd8cmr67761055ab.8.1734169095423; Sat, 14 Dec 2024
 01:38:15 -0800 (PST)
MIME-Version: 1.0
References: <20241214091937.203842-1-lsahn@ooseel.net>
In-Reply-To: <20241214091937.203842-1-lsahn@ooseel.net>
From: Leesoo Ahn <lsahn@ooseel.net>
Date: Sat, 14 Dec 2024 18:38:04 +0900
X-Gmail-Original-Message-ID: <CANTT7qi=wZvOQP4PFEi7300MbNjsJ2q=WXceHch1BUrtL-WFDQ@mail.gmail.com>
Message-ID: <CANTT7qi=wZvOQP4PFEi7300MbNjsJ2q=WXceHch1BUrtL-WFDQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: mm: fault: replace the behavior of fault_info[18]
To: lsahn@ooseel.net
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
	Suren Baghdasaryan <surenb@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Mark Brown <broonie@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, 
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_013817_243229_60644733 
X-CRM114-Status: GOOD (  18.00  )
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

I just figured out that do_sea(..) isn't the right function to deal
with VMSAv9-128.
Please ignore this patch.

BR
Leesoo

2024=EB=85=84 12=EC=9B=94 14=EC=9D=BC (=ED=86=A0) =EC=98=A4=ED=9B=84 6:20, =
Leesoo Ahn <lsahn@ooseel.net>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Replace the behavior of 18th element of fault_info with the 'fn' member t=
o
> do_sea(..) and 'name' to 'level -2 (translation table walk)' based on
> the information[1] of the latest reference manual[2].
>
> The information has described in the chapter, D24.2.40 of [2] and
> DFSC[5:0] bit (stands for Data Fault Status Code).
>
> [1]: Synchronous External abort on translation table walk, level -2
> [2]: Arm Architecture Reference Manual, for A-profile architecture
>
> Signed-off-by: Leesoo Ahn <lsahn@ooseel.net>
> ---
>  arch/arm64/mm/fault.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index ef63651099a9..b1c08289a5cc 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -863,7 +863,7 @@ static const struct fault_info fault_info[] =3D {
>         { do_page_fault,        SIGSEGV, SEGV_ACCERR,   "level 3 permissi=
on fault"      },
>         { do_sea,               SIGBUS,  BUS_OBJERR,    "synchronous exte=
rnal abort"    },
>         { do_tag_check_fault,   SIGSEGV, SEGV_MTESERR,  "synchronous tag =
check fault"   },
> -       { do_bad,               SIGKILL, SI_KERNEL,     "unknown 18"     =
               },
> +       { do_sea,               SIGKILL, SI_KERNEL,     "level -2 (transl=
ation table walk)"     },
>         { do_sea,               SIGKILL, SI_KERNEL,     "level -1 (transl=
ation table walk)"     },
>         { do_sea,               SIGKILL, SI_KERNEL,     "level 0 (transla=
tion table walk)"      },
>         { do_sea,               SIGKILL, SI_KERNEL,     "level 1 (transla=
tion table walk)"      },
> --
> 2.46.1
>

