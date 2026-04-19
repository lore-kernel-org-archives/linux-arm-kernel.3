Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2137EA71A1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 21:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFrGrWFy/krqcVnxXtLhe3ZTOUNcitG9G8OlGBpdvQs=; b=5HCFrGCy/VNjlpFSPxVL/14+JU
	w2s6K1yy//kLnpd2sg7J9lp2axj4WNEMJS5oZHnkqjnQyHDA7PYVQ9rUVhaVDOnfxCA3UHSoRjMxg
	pbbVlJFabsFvGZMwVy2Y6PJ0KSwhj7sfJcGz+faiIHlOYWzVWolhVanUaJEfcVICb6p+MS4+LJGZc
	wTpXFKicew5b6CVCfOOq0b6dHP9t2szicNvuTQ2yQDpbSEuLUX2fSn0QDNg1xdpOpzz6Z2HvIkeEx
	y9sFzzy7Tj6CZpj6UDAV7eCl6wemVp6ux6iFGjVMLcyRCdQ8/POYVxLmRqf7MwS4ss+TRfpFhRoVB
	GXVOEeKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEa0w-0000000675H-3dEQ;
	Sun, 19 Apr 2026 21:49:14 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEa0u-0000000674w-28mi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 21:49:13 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso22883865e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 14:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776635350; cv=none;
        d=google.com; s=arc-20240605;
        b=I4ExrR2IxpYx9ovDliEPOFcQsG4V1hLdhH6/wIBzFZ4QNkqW96Y6eo9vSfQpypdMSh
         vZyHbTkTG9PElSLBcD9pqipGF0INMK9skczjIPHEBixvxAF89GcZKmI9opuJ+d1cAjgj
         ByiiuWn2AKFEGi9QmyCKHPGTa8SLBMmfC8vjexcbZUhfcA93eckWI2Q76yiHIT0p/pNd
         4ukmocFVJmBIlb5bR/ccDtBkBoFP+6mlq2lD6ntG1OU3+QJLLzTOuq1TKBOkd2ER9Oq4
         tVsViKJOnsA+d6V+wHYVHRpGWrOuFOESyU3dpNbmRwtuzVp4MOmd1GIMw5q2vulqS3We
         GFNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cFrGrWFy/krqcVnxXtLhe3ZTOUNcitG9G8OlGBpdvQs=;
        fh=F4qc5nmcEuLe0wRqoyw6safR4xiNqlexYQIvRIFfEFc=;
        b=IHuo1iLgteqDGdR8aLiFu3dFzjEq/DUqZbwwUynH4/RyqDGDW1jb2coY/iuti4viQZ
         MCJ1qjHv7zDTqu9z5phzSIMkm0Anvse8GVBNLDMUyBKPUS8gK6HgNVta/vI0pare62lY
         Gpcg6by5NwWGjtnXsj1oaUvQet+6DbMzQzMRJs9i+83FFwHrAYe+FNxYTJlaQXQ2xj9M
         0LskRuNrqZPm75M0icGc2Urfd/2D9eBDadZRXm4yQqIHXWzu9DV9aC/6twr5dGKo/4H/
         hvvur0fZ/fwsa3UbV+P6wSO2f/4bcAFp/P/2VU7GkKC6TN0Jw0uRsZRhACO9eAVhr9h6
         C35g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776635350; x=1777240150; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFrGrWFy/krqcVnxXtLhe3ZTOUNcitG9G8OlGBpdvQs=;
        b=WAi1vU1olVYKPzOJPfyGtq0hbpqh9+u5wOuXzoFKUNzaCUkEGKdmgeniyNoCB/r6eX
         wNS0jhvsmI2zjqB1abQD7qTKjSf+wJWOG83L9u03jHZs1aRVY0Dx8f3E+ljhW8JgpRpM
         to96FJwjjkM8EU2FGGwkS1Aq20HKtn+hCj2o2RZR6VvViqMZOpk+Th1R3JdeaOH4ZFML
         wAFhei7Nr3yJ6mwxOkSBTRbY+Ov0brBK4iYRGcGEZZLxi6JxkEkpLO2KEe+kMd4arXp+
         qJyHP0VLzVwEbtp62mrK6JBW8qMSMvWmHEPKhl5xpdHPu0fQb5qEUASUk2OZD/dR6EjN
         TXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776635350; x=1777240150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cFrGrWFy/krqcVnxXtLhe3ZTOUNcitG9G8OlGBpdvQs=;
        b=PbLyQWEXKrHv+c37sO/te0Cj9R88Aaj3OirKmCO0E2QznL1nbDKCw98cXmDwfVXxb/
         ISgiGviIZPajSax0pnR1fnRxoQW5sjLSpaAKVXXiTYQC4WWSm98WnpuPkqk5xwyrODQ3
         LZxjQuHea/KNdp5cUxaONmdtF4pOO4o5oL4+DibENa9AJNYEwlKNu25A6HEWDYUDcuOY
         pq2iL3qiGo3NAg6yC1t4ZhpgePNJExZomibS5h47IqFdOMfM9kMXOFKpArzzB41wEx1x
         e6LJcZe4Krx67BZzlOGtXWH+JYRAkqa6bRPcCMVxouOxb7FmrORxGdsUYMWBBVWMDFW1
         7WGA==
X-Forwarded-Encrypted: i=1; AFNElJ/gvKL9nLEECEeq8y1K4k7DTuF5Y4iVMMK0rTjcHeZEoSDikijFV9b1xxj+GERTelSmX5mZimqCzgbCWXcHN5nQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxCApCJuR8kgSXPyf6FHMU2iDeqFjQHyi05C2B7gYGdh7zrVo7P
	SPXDK2jloNuUAmqNruOmWGqi2fUM9pUmj6cRY+gOyhLxcLS5rWok2i3d/W6hCH83HYQcVewNib6
	pEV50/Gw28aliD2lo+eV7TeXnxYekWlQ=
X-Gm-Gg: AeBDievvBqHasd0jbzlddjWnVxIA0m5ofCwyoaSOZ2ipz5Op8SpeBv5Bl9UwNQ1nv79
	6m2ixupoywBUxNMahHDXCcAxyduoqiJ+VVo3jtQqkJ4Dz899XOqdcf0CQCszqyvB75ZRZEejeVY
	o/eBNPBKkYkfvm7m5sgBg84wS+Kvc7Ua36bh1yhsRLaqY7HrX4TbpWlSQXItmPL9y+Ma4KHXTAv
	LcnrvcgX6vh+wCjf4Yjd4VR+/WTyxZLnS8d6JEu5YJqCs3A+5IAb/9y1KhZtcdvZ2Q2GB3zzYth
	uTI2uc+DmcNM2O9CMio1hSYHcJTa2KNwO8rVxraifPLn4BjNYfMw
X-Received: by 2002:a05:600c:8909:b0:489:1b10:d896 with SMTP id
 5b1f17b1804b1-4891b10dd45mr22100635e9.0.1776635349567; Sun, 19 Apr 2026
 14:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com> <20260413-kasan-v1-1-1a5831230821@bootlin.com>
 <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
 <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com> <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
 <CA+fCnZd31GzdpEqR8VhfK4JtUKyyRMgbBoAbeGACJgm7WvB6Vw@mail.gmail.com> <CAADnVQKv5y+gq=TnOAEXSqgBRpmHNjwqCfxpLaw5XkcbQ+23bg@mail.gmail.com>
In-Reply-To: <CAADnVQKv5y+gq=TnOAEXSqgBRpmHNjwqCfxpLaw5XkcbQ+23bg@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sun, 19 Apr 2026 23:48:57 +0200
X-Gm-Features: AQROBzBeG23-litRs0f9sM5oKr7DzVV_-wsJjyIfGuOE5YpAx7fmmNXRz9M5Gbk
Message-ID: <CA+fCnZe-b0Qqbo5gGv3HN20twquQETDfYYkE1r9tPr9zUFbW9Q@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 1/8] kasan: expose generic kasan helpers
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
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
X-CRM114-CacheID: sfid-20260419_144912_603312_2787B964 
X-CRM114-Status: GOOD (  16.44  )
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

On Tue, Apr 14, 2026 at 5:58=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> I think we're talking past each other.
> We're not interested in KASAN_SW_TAGS or KASAN_HW_TAGS.
> We're not going to modify arm64 JIT at all.
>
> This is purely KASAN_GENRIC and only on x86-64.
> JIT will emit exactly what compilers emit for generic
> which is __asan_load/store. This is as stable ABI as it can get
> and we don't want to deviate from it.

OK, I supposed that's fair. You did throw me off point with your
performance comment. But if you decide to add SW_TAGS support at some
point, I think this discussion needs to be revisited.

But please add a comment saying that those functions are only exposed
for BPF JIT and they are not supposed to be used by other parts of the
kernel. And in case you do end up adding a new config option, guard
the public declarations by a corresponding ifdef.

> The goal here is to find bugs in the verifier.
> If something got past it, that shouldn't have,
> kasan generic on x86-64 is enough.

FWIW, I suspect HW_TAGS KASAN already just works with JITed BPF code.

