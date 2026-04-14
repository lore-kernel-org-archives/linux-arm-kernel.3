Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0C2F9D0DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 15:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3mMVtHum7zPwks+XDXBRlehlKpwvf1Ihn9S56ZO2pRY=; b=m2CxxxrF9RsKG7dbbVObS6NMpF
	fZsBA1x1aXrboU9W7IAmOLhd5x8zyNOBoJAuTt6LnlUwKbM8iO06w6RyITJiClNaprHL7Tx5Yr254
	M4IqZtjWL6CpCp5adVN/Db/DC3eG2TBYecP9BolT1sGde4n1nNSyOzITWY8UVbY2XfkpnGUUM/cyD
	sp8axecj6Q2dCUk5JpMs6hCHreTqnxhgsB+MkZkTpmkWu3j8zW2nCNDRmiHo9HCb0DUYOfC+vRFsT
	FslZipfEZFMC2JPn2PUJ4btsneOLyWQxl7g1/evDg83H2ycDbeQ2XUGNiiCvQF8uAIKQxfpzP0XuB
	CVUrgXlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCg9o-0000000HZEq-22Db;
	Tue, 14 Apr 2026 15:58:32 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCg9l-0000000HZEU-37D9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 15:58:30 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43d7650202fso1932990f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 08:58:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776182307; cv=none;
        d=google.com; s=arc-20240605;
        b=SS1quuI3/l3i4wfy46VzT24oV/j/kJWU9MMsM2Ay/VLAEko7WW3Jv4rlP5rmtKIodi
         C8jHLrKp3i4zazqflPzKJs0UpJEdnT1k/prZR8qQfTjO9oHCE4CuQpKj5rqcpjcgXo99
         8cCigg6MITiPz3vsCCogOcaXrEJLotfYrTmA7UCrHFFnzqDROBaoBuW5vNjb9YJ4Ftpe
         4o4e3/iK8INfiB/wHrpvL+e9n2uwSyP+D/lwVFdoyUhfAPhYDC9veqcu8RGZ/U01MylV
         s0C94CDpo6dymBEXBZ58t+HAvMzMogrgTLD3uqhAc0J9Fa8PIMiX1DJkVKqYB2CQD/wk
         FRVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3mMVtHum7zPwks+XDXBRlehlKpwvf1Ihn9S56ZO2pRY=;
        fh=USmvDBSIvyASCTBx6X6hUzTyZr05oZApzZx1IYu+VqQ=;
        b=k73xKUW5lOtohL+092bI/3H41f5OGmI8XT943jJ8nGmtunagUE8JsqfSGBogoNy95q
         Lmdtrm1rkH0G3jNKj0OosF3EAqT33px/m7O9Bg9savZvSDviOEu3fy4AyfEuTom9p6U1
         R++K4+hoKVGBsEBHeDgP0XkfNtJknPS3YYjOCHcZIOoOIYUiWtwTM8AaIiTPXx1SAxuc
         UANesc7KxUKu0/PEmXDdcwPPnx5ZULMiLl+aE9Zrb+Mt60BYimGX3So+VjndrNmbL8K2
         /ejz5iVf6KuKKQQ3axKJNTmFG2UqQgxT8wLRffA+XtbVtwR9LMfRq0nfLHFlHRfwtHQs
         l5vQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776182307; x=1776787107; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mMVtHum7zPwks+XDXBRlehlKpwvf1Ihn9S56ZO2pRY=;
        b=Txp6Vs50Be2a/hVtGeiaL6zB5bTvQTURbQjDJx3HndYIATXeSjHA6C1IsTx5qUtI2t
         kj3kgKclpKBNQYijeSXgvheHluXlcfPKLBRtgIhR9pHnA1eG42/nMsjgM6qgw8ilSe5K
         uIZThRikwfzvtZUJUSJLVjJtEbcd6gubfxE86lCv3o5a89WSWkqVDLkN//5tA0pt6DRK
         WUeqqkjR4jDakldhhi2VFS3y4sU7WEgLgptuVdnx69IyZb6BhMOVvYT+a3QCXKlwh5BG
         mnM9T+otZTGWsngqm/OmEYxmkF6WN2B+X9v0Ykk/KBQ17xKIGHfUtwDQkkuvW033AZsv
         fg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776182307; x=1776787107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3mMVtHum7zPwks+XDXBRlehlKpwvf1Ihn9S56ZO2pRY=;
        b=P3ujhKLQuYoqO1r635s7tjP7rPNABNArbZbYmNyHcSi6jmNE8I5mPFm46HCY0e+OS+
         sxEpZ4iJDNk96sZgFH5ya1vIaS0E/1feio8Pu+NiGs7Q0dGQ9TBA4Lr9OWmAp8tYnZVZ
         IrmlhaSQonSpS2nKsB6FFQvg2izZaSFny5+lxnC9WSvlajlyzRnmh79egfMPnzG9Wrud
         OpgOM38751qIl9SiEcDW657w7813EMatw9tjZWRYeuGe96GSPK+KZ80Pq6mtVhf40Gj3
         4rpYgY5oK6A32JLSXmn1+qkyMMdgbXYNFFRMlPNvf6FmFkOrZnZZujLB2dRJYJdDn/8Y
         mfZw==
X-Forwarded-Encrypted: i=1; AFNElJ/d1K0g09hHgBnUFbOm4eq9F/+Trk117QeBW2gg9YF/ztcv2YP9JhuCO6D3qFZla/8IvjwhrnA1bd+pFbQo8T/s@lists.infradead.org
X-Gm-Message-State: AOJu0Yw28tsUXem9qJ2bB+vJH8pB0owEHK3hCTwg8cfzfHzy/On/NqjK
	RXwpqCNsLo1n5LXEBGaht0KqEvphJ+r9dAMNitifLNENkYb6SzWEQss/fH2ZYrfq1YgiuQQRYj2
	gY/6FxXn9pzVEPK1zrg91hk0xrmX3f98=
X-Gm-Gg: AeBDietKK2OAKEA6o43+UG+5Sq77mqEzgHxdHQhAWhCU1AKjf8ySAJ8mKtL8MVa3rtL
	TsUvNy9yZ7UFsdUO1v2J+M4mpccHR9c1jrAKaXlBVS+uwOAbN9iwI/GuJk+XTi8BIrqlEV9BW+4
	roByhrn1LRuQ2s7rpyo0OljM4NWWBWDJ2RN8rC6MZfEZ78qP7En83cVwvu+NgGPMG7uyTZKoMea
	/MzzBrMbKN0k/aZZxcFOmVC+IjhiU38wQKF1oKNoBYhxy3uMSaQnmCKao/Tp9TScHIMgn3AVBDe
	UHe3Zaa5jstHijrz0b1IL8vTGgg3roSGaRrq8awOZw+Jor8dCkCEpCg39wXxeYdaIKZUA+JEj5H
	INHnxS6bUyp7oSiRv+cOWZ7hRVqMchWUBIZmP
X-Received: by 2002:a05:6000:290b:b0:43e:a703:3665 with SMTP id
 ffacd0b85a97d-43ea7033872mr4250710f8f.25.1776182307210; Tue, 14 Apr 2026
 08:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com> <20260413-kasan-v1-1-1a5831230821@bootlin.com>
 <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
 <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com> <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
 <CA+fCnZd31GzdpEqR8VhfK4JtUKyyRMgbBoAbeGACJgm7WvB6Vw@mail.gmail.com>
In-Reply-To: <CA+fCnZd31GzdpEqR8VhfK4JtUKyyRMgbBoAbeGACJgm7WvB6Vw@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 14 Apr 2026 08:58:15 -0700
X-Gm-Features: AQROBzCLeOrIcZKaiQb6Cd-OuEC8rfDXHtXvBFTPGfyaVO0Jqt2FWke0BxyjjQs
Message-ID: <CAADnVQKv5y+gq=TnOAEXSqgBRpmHNjwqCfxpLaw5XkcbQ+23bg@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 1/8] kasan: expose generic kasan helpers
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, ebpf@linuxfoundation.org, 
	Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xu Kuohai <xukuohai@huawei.com>, 
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	kasan-dev <kasan-dev@googlegroups.com>, linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_085829_811533_F4F2BD60 
X-CRM114-Status: GOOD (  23.71  )
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

On Tue, Apr 14, 2026 at 8:10=E2=80=AFAM Andrey Konovalov <andreyknvl@gmail.=
com> wrote:
>
> On Tue, Apr 14, 2026 at 4:36=E2=80=AFPM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > > ACK, I'll try to use those kasan_check_read and kasan_check_write rat=
her
> > > than __asan_{load,store}X.
> >
> > No. The performance penalty will be too high.
>
> With using __asan_load/storeX(), it will be one function call to get
> to check_region_inline(): __asan_load/storeX->check_region_inline.
>
> With kasan_check_read/write(), right now, it would be two function
> calls: __kasan_check_read->kasan_check_range->check_region_inline.
>
> I doubt an extra function call would make a difference in terms of
> performance: the shadow checking itself is also expensive.
>
> But if the second call is a concern, we can move kasan_check_range()
> and lower-level functions into mm/kasan/generic.h and include it into
> shadow.c, and then it will be just one function call.
>
> To improve performance further, the JIT compiler could emit inlined
> shadow checking instructions, same as the C compiler does with
> KASAN_INLINE=3Dy.
>
> > hw_tags won't work without corresponding JIT work.
>
> You probably meant SW_TAGS here.
>
> HW_TAGS will likely just work without any JIT changes (even the
> kasan_check_byte() thing I mentioned should not be required), assuming
> JIT'ed BPF code just accesses kernel-returned pointers as is.
>
> > I see no point sacrificing performance for aesthetics.
>
> With the change I suggested above, there would be no performance
> difference. And the code stays cleaner.
>
> > __asan_load/storeX is what compilers emit.
>
> For Generic mode. For SW_TAGS, the function names are different.
> Keeping this detail within the KASAN code is cleaner.

I think we're talking past each other.
We're not interested in KASAN_SW_TAGS or KASAN_HW_TAGS.
We're not going to modify arm64 JIT at all.

This is purely KASAN_GENRIC and only on x86-64.
JIT will emit exactly what compilers emit for generic
which is __asan_load/store. This is as stable ABI as it can get
and we don't want to deviate from it.

The goal here is to find bugs in the verifier.
If something got past it, that shouldn't have,
kasan generic on x86-64 is enough.

