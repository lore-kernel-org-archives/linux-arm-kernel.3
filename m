Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392C5F9D0D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 14:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AnsEV6VHaHqEew+Xa56Ltrfs2MD3YtoIUeXjaty5EkY=; b=PSwuukAFxpvApIpuzFcEb0rsbZ
	QZa7pyyoYINiKawP5hLg5rt4clG13hY9NyKvKDiwsZzif5hF/0Eq7N5z6Jv62ncmFZ8ic7jtXEizt
	iKBDZxKYaxw4PalKIKHob4Wy6njFhieuuSDrlhqgnAQ/wJVkbHgS/akoxpi+nHVChSeLU/7oQBs1N
	0/mwIXtTTBkwVfH53SjzR4GNBb6dfJuUCtzcOA+afmr84cbJm2N2Y68tGWK42IB/P/GdgtK7E4PBO
	ub71O1HTAfUCWG6cYirdx6H25ssppdP8OjiTwN7W+N/xI7mELuFjdb5O4+ooPBEspfnzN5lrruZTA
	6OvuE02A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCesI-0000000HSxf-1QTf;
	Tue, 14 Apr 2026 14:36:22 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCesF-0000000HSxH-1gIt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 14:36:20 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43cfd96354aso3352965f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 07:36:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776177377; cv=none;
        d=google.com; s=arc-20240605;
        b=lW0Xb1dGQPdu+6OupXsezxTCf0sbxjgPiJmyrtd2StaHBiTz3IQcqG6hVckkYRxtGf
         4GheojJHWlYYKswiZRDeS+B7n1Ao7jvYUe4cxS0CQJ0r2AV9uUf0AmzQFxQO/1RQFcBO
         pvb1I4SDHY2wrR+2kLiS1gXIQ+oWodfV4baMsPOHpzOrvHMLCfjibxRA8IPElM/AHkhS
         HkY5Ni3DagX+uHeIwvthsRYchm1WX0Bnqo2zm0XEo7H8dkOtahYaU+ZGknh+wlhznNkd
         pldnVy0V/+jnRLgUYt0BU/muYfArI6lHwu1qrvPpkXmDBf0Tm3eFZdoEx1dq0eorV8xF
         CvQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AnsEV6VHaHqEew+Xa56Ltrfs2MD3YtoIUeXjaty5EkY=;
        fh=+AdmV5FHTXWRUItcEFQQU+KN94RpsgNkS1WGQlzJUg0=;
        b=YbJGCaOPqXJgDObF/FeSKl6rciFl6b+BTCSajzoRJuqWlWDbqCiIdCC4FJH8/GUZFz
         jU/UTTq3Sg/alefci4UMEwd4OMzLDgNRiAhV5A5CbO1fRQy2UdP8OzZAZoHPa6u93DX7
         8HG0jkJtlR7U+w6wU7urt9jACBU8AplYHMOeiNcHhNfZMKdt+m4JfY5aEgekKiLtz/58
         k5kM7qp4nU6V7dmK8sdMT81Ac44kD97N5RC3RJuYSwrHMPPNBqoyVVuhEcoc8sT/LZII
         p7IoBNQiBRFxz0S+84FVoK5PMK7tdQtlZAHyqymvDov1tBLf89kCeS09Q0+TnCD9L1m2
         UdoQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776177377; x=1776782177; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnsEV6VHaHqEew+Xa56Ltrfs2MD3YtoIUeXjaty5EkY=;
        b=eeVbT/gIxi4xIAMqLnacfxqSN4dSgUn5dZo+YbTC4brWyBJ0lxyM9v1IevwOD09SGt
         FAmxZmUFcAs0GPrVCcpouvP/cIRPH+gO9eENtYmiAa+GaiNNj7R8foMe2vV+O2R2abxu
         LY1o9I/qJ0InNJIuvhZhCzlh8XjfY3DlCzwIen1JkWS8738NX7kebhhCyjIsYCnNaEc1
         qTVEZF1b/gWbCeR1KFK/Ge/lPz16meIWaWAIiOsq5O4XBDJvMeiFf3yHcPN5u3bIwU7M
         ixoCn3dXofY8hqv54++pRma9eJsJGk8eDF0K/hprcTlQmiOrPUsrHlwWNAvSfrdMyp9S
         +gkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776177377; x=1776782177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AnsEV6VHaHqEew+Xa56Ltrfs2MD3YtoIUeXjaty5EkY=;
        b=QALhMUemFZi1SzofJRp/IFFDYHf3SqxBqGiu9aI29ZtnCGEl2xuGU7VEJds7mpEer0
         oj02YH1MXb5osfMIKzafbmzt/6YtADbHNFnQtiKqCG+MsOlacleeJwYPRjVskdfJSgog
         pgZa/KEoxbjVUWk9f9j7n1lxA7aDGsvmbRdIoHwqGQG87fDaMA8F74oVCNkFs9lHFArR
         z4eVBBK76lsq0Opt30LHF0coeScVmIhT7Ay+5NKuj0xZEqf6Cbe/nzZkRWZQVqs/0wO7
         TU8ruEf3d313FOJO0TC3Bc5038KSZZEiqqPvsI/tUyWJhQl9Ny9YpD5FqH2BcbroAtgH
         aH7Q==
X-Forwarded-Encrypted: i=1; AFNElJ8V/waTQD8EIWJeFvDF8mULJuOatAM11F8GhybN+9WUf4qtEn3H4sCszCDI3heeyhbEl9xZ6WxTnkpUs6yBbxSk@lists.infradead.org
X-Gm-Message-State: AOJu0YzSSf96nPBmL51+rhENP1ktuQ8Z8BvRivTs/v9Xng6mwU+b71cE
	u07y59d12NZNGDCtIQBh/2fuQErQr09d248ZoWWejfGu8m/VnpBGPw+YOi9SiuQyypmO/qTaxxC
	Ydn/XANd5fruueIMSic5jwG6MODpy9Tw=
X-Gm-Gg: AeBDietlz+jD9voP1f+ibkg+C9/55GdW5KXdZDN9stl96Kr5JVwSXOEf7nQb0S7rXIM
	+vyf1lDfGbpPzI1OI/P+pld/Hp81BVEd3UKT7LJaS077tmcS7KimhYcpVonHMD5/oRWFDB8Hq8v
	qXkET53B6VOmclATdK0voV6b683Zd5SV/J6IxTndxzJ6lCN3AmvbFxNnsoDS/QoEhkt47nigeqT
	l3mi648sptARopHIzh+8qAEWos+TKZ5HMbwiWwUjXOZj1VGKNWdl8KM+z3gI9SzFe/wrvN6uScy
	LMlkRUN2lsxxHK1QiO5IwUOo7Bfp5ENdZ4rCJxPSukzl2K3z5WUkc1sry2HS+Rel6aUu/Ak4edU
	0DA/4myAiNDwJ4DFSHc4L8J2GiQ==
X-Received: by 2002:a05:6000:1a86:b0:43d:6e0:9458 with SMTP id
 ffacd0b85a97d-43d642c08b5mr27685966f8f.39.1776177376758; Tue, 14 Apr 2026
 07:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com> <20260413-kasan-v1-1-1a5831230821@bootlin.com>
 <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com> <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com>
In-Reply-To: <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 14 Apr 2026 07:36:05 -0700
X-Gm-Features: AQROBzD11iC8gAKSEnmD0t_Id88yG4ZENQr7azgzst5W9dho6pOaDHcgJ_Mytlo
Message-ID: <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 1/8] kasan: expose generic kasan helpers
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
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
X-CRM114-CacheID: sfid-20260414_073619_470943_995D4FCD 
X-CRM114-Status: GOOD (  20.78  )
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

On Tue, Apr 14, 2026 at 6:13=E2=80=AFAM Alexis Lothor=C3=A9
<alexis.lothore@bootlin.com> wrote:
>
> Hi Andrey, thanks for the prompt review !
>
> On Tue Apr 14, 2026 at 12:19 AM CEST, Andrey Konovalov wrote:
> > On Mon, Apr 13, 2026 at 8:29=E2=80=AFPM Alexis Lothor=C3=A9 (eBPF Found=
ation)
> > <alexis.lothore@bootlin.com> wrote:
> >>
>
> [...]
>
> >> +#ifdef CONFIG_KASAN_GENERIC
> >> +void __asan_load1(void *p);
> >> +void __asan_store1(void *p);
> >> +void __asan_load2(void *p);
> >> +void __asan_store2(void *p);
> >> +void __asan_load4(void *p);
> >> +void __asan_store4(void *p);
> >> +void __asan_load8(void *p);
> >> +void __asan_store8(void *p);
> >> +void __asan_load16(void *p);
> >> +void __asan_store16(void *p);
> >> +#endif /* CONFIG_KASAN_GENERIC */
> >
> > This looks ugly, let's not do this unless it's really required.
> >
> > You can just use kasan_check_read/write() instead - these are public
> > wrappers around the same shadow memory checking functions. And they
> > also work with the SW_TAGS mode, in case the BPF would want to use
> > that mode at some point. (For HW_TAGS, we only have kasan_check_byte()
> > that checks a single byte, but it can be extended in the future if
> > required to be used by BPF.)
>
> ACK, I'll try to use those kasan_check_read and kasan_check_write rather
> than __asan_{load,store}X.

No. The performance penalty will be too high.
hw_tags won't work without corresponding JIT work.
I see no point sacrificing performance for aesthetics.
__asan_load/storeX is what compilers emit.
In that sense JIT is a compiler it should emit exactly the same.

