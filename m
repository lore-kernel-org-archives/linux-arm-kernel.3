Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB75D46BFB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 20:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07rf/uTuwqt/mx7z+xU8g3Kvog0c3ZDUc5m6W+iA6DE=; b=EhtI4tONSbEYkB64LxpLNgeHY6
	sUg/aoAYzoi3H0gsUMUUpOdBIVKAgQtjelCCjezvpW1O6j8MkXk4durVEqiX1oAqSj8S9JOpA5f3j
	7vjaFtxcf45vm527yEYs44Tm0pP8ftJWdu8Te4oxPXmXzUcrJPGHcfCG8ig+LRf2/u225utLurjn4
	g76Cx5CXBkwO/5ROFQt28rFAy6yNXpw/s70LugWN8oYJA22QyROC8VtdkBRKoTySZL68OyZ50MrfW
	8rGBG9Y1OXg8Tn113trYwFmzjQoeBhMsLqqX3fPdMlN6sXC5Di9YNdkxUERRSeZaR8XMqjlyumk3a
	ty17MhdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCCv-0000000GlmM-3gwR;
	Wed, 28 Jan 2026 20:32:09 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCCt-0000000Gll7-1luM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 20:32:08 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-42fbc305882so213086f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 12:32:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769632325; cv=none;
        d=google.com; s=arc-20240605;
        b=N7VrcC8zzESqZbVUcucAnKLbZmw4TaRWTvy5XuOsPfchpeoGNpHa48xX+QxaSERBYW
         iD0eD4qA6qU9QDkjqQ8H/k26g9Qu+j7mphRh8aEtsFOVzTSJFaZ5lstZmcB8twuC3p8s
         0ps3q9/pvFz1EGlVeQRzUXsEiRCc6gxJRp5xtT372BeXz8rI/BSjkefwMcu+v/QgbN2J
         qO2xxNdiO+Sx/oWTmumOVUNqd9Lcti+WT7GCmmhoWtlZQgIMgHXotlwwdJzPP18yBRuJ
         N1L5ChWLA5uo3uxusJX+3yrVkiNZN0GWbv6e3ebPU+AXD/K2wNN6/OaDofbAkuYjtask
         NTcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=07rf/uTuwqt/mx7z+xU8g3Kvog0c3ZDUc5m6W+iA6DE=;
        fh=nFwI54Y4+7Cf36HmweqPwiHArFl7z7/zxuPHQt7F+cY=;
        b=SURerPtAJoG8WKX4WGYoSpcFTJve2gjzYMsZMSYdhn7ZrLqrzB0iiCFkVbcXTEj9uX
         YBGTJR2aI+qRiGkP4VXqPDB2pnRkH44/RAAdyrKbpUy5G1ToGcdkvvLTsdWa4SWVBGQ4
         zW4fW/CySCdtpWhbEXfiuyZRd1R0ZiGgvcgFc8i5mSzwz1RifnC1C/1QcBhmXUeoo52O
         5b9hGRpYcTmGsF8EfFQQ2SelAFt0ttLFa61AcQ9v0QkibhMUeMdLCsVdtbLEXkumuEP7
         wJP2L3t8TaegX/0Xi21ku52wBoGGOnxEsu1eUtGJj+5jWrqUdWGcBiU35Kea6zk7jYJu
         N/sg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769632325; x=1770237125; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07rf/uTuwqt/mx7z+xU8g3Kvog0c3ZDUc5m6W+iA6DE=;
        b=A5hfhP0iOjTxy1hBt52YG03TJXRxxLt2/MMisOhNiv3KK5v6L380rlDRMKFJJ5Wo/S
         Ffy5wcduCUrGXH7x9X60NScqgNswuckUs7IeAHQoq1bP8YOUKQiD+hSQ4sqQBtn8rD9D
         pbjBr3RW3zI7OsMG2n7eYVyPElouSfhdces9Qoc6G0lvjtPF1fziI4Kn6ZU6BHSmg4VS
         8jEYAPBD0/GmXkuZOzYWvqbRO5TKvjTRjdDZzvmYWGNKglj3YIfau2a64+9QXYgqWRX/
         oSAULRIa93v3vYP/aCZ8QEqA4+hIjAAjiutKsTAY/8gJ4faK8HTCZRpxzUGMTLqtWTB7
         FFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769632325; x=1770237125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=07rf/uTuwqt/mx7z+xU8g3Kvog0c3ZDUc5m6W+iA6DE=;
        b=IpfhZoVQphSBgRq4G5USJbIVgeRdL8hi9FCXM/f8Q/G2UVXT+Mq4odUtbV19a+9V2B
         co7NXMiRFrvspMiTDezRnGOZw1VcSvxZRx3ROSQ7MVuJ0B1JCqcQaFHmY/XlgCjZ4Xzp
         TxGn/YyB2cUmli8dVl8oMD1fxyYkW/jgVZRyq3J62n6idhy6s7/pPbowmhHcAv4HAUyw
         dR714V6SVedrhP2ifZITYH+dlGFL8+c8Rh4LT49+ejuQxgyp2Ts0UIAk26vKv4hXM/qX
         LRDJ8r3mifWGyZMXhnLnuom41DFdGl10jAs54fQ0y4hxRAbiQI4XPdacn6KnqIr0Fall
         DlFg==
X-Forwarded-Encrypted: i=1; AJvYcCVjNDlcrx342RKRYKhSUpSVye0osjYUOuTnU6/aLKAKbmFWeaNn4XGAf9lm625vsWFszc26wT5+bfLOd/aoJa+S@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5cQnLpPuJ7I/jUSiqmYPQL99G2E3M0dr0Qg/SbR2zCeuEFHUk
	mXG8NuhgK93eC1Nmmkw80rsSfuExKEFHPfCFJqe9/1Njb66iRPeRcPmh7YNyOwdweqDO90WD5F7
	XPHJHKipYmeS13Y1N/R0nmXV/obAjXUA=
X-Gm-Gg: AZuq6aL3maKoRHy/IIbzlNAmhBdiIFFxEPVa0vDloCaFiZj84kMEFI4w40KAGQy/Hyy
	li4I5loa/bqUpZLAeWMnmMvzTGCupl4UGinCBhzf0muYC4uDt/kYXXai3mOD0gPN3rXhz6YDwhS
	NWGSFw4x6N4Ht2u55WWxUGT4VytvvYlJBSCm30ZbyBsEUsCuujiS/8KfT/wPM9LNp9N1SK1pZ+N
	ToOw8a8UWire3m82O01r2EtQAZqUVmOpid6iBj2jyFZor/uTN+YHmQTNfrHlAHrdCU5+sZ1Yr7d
	kFH8oVL6n7IKPfUZMTNkBc7yn5nRXIJ/wHumHPaWv0lrQiOg4xPgdWebHoFwHCeEjIMikl7pmkz
	x3yG5ptMazbrqSA==
X-Received: by 2002:a05:6000:2404:b0:435:9653:e154 with SMTP id
 ffacd0b85a97d-435dd074b2bmr9812358f8f.27.1769632325304; Wed, 28 Jan 2026
 12:32:05 -0800 (PST)
MIME-Version: 1.0
References: <20260128150112.8873-2-leon.hwang@linux.dev> <e64c4137e7f262e6fdab272e8ee44c8a129a36eb6d0186914375d6ba20d88474@mail.kernel.org>
 <65231eeb-1f00-4af2-9234-a290ea3f6585@meta.com> <a10afa70-29b7-48ab-b241-8b0f602abe2f@linux.dev>
 <CAADnVQJV=e2VgQzkpsUQwexhaVZMs7uXHCe1Fa6VwbVNUMPghA@mail.gmail.com> <7dbcc5d5-476b-46e5-9e4b-b260d24a51a1@linux.dev>
In-Reply-To: <7dbcc5d5-476b-46e5-9e4b-b260d24a51a1@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 28 Jan 2026 12:31:54 -0800
X-Gm-Features: AZwV_QieHaFto3G-1e8bEUtCESnVn4_ZZwARjehTdXUH1XxE0kv7X3Eh3iZgKp8
Message-ID: <CAADnVQKdZo4Qm0z-qedkfQHZhq+tW4MuRSzM5-zAGYX-ZQTiaQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/3] bpf: Add bpf_arch_supports_fsession()
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Chris Mason <clm@meta.com>, bot+bpf-ci@kernel.org, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Menglong Dong <menglong8.dong@gmail.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-patches-bot@fb.com, 
	Martin KaFai Lau <martin.lau@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_123207_490121_7894B586 
X-CRM114-Status: GOOD (  25.17  )
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

On Wed, Jan 28, 2026 at 11:09=E2=80=AFAM Ihor Solodrai <ihor.solodrai@linux=
.dev> wrote:
>
> On 1/28/26 10:49 AM, Alexei Starovoitov wrote:
> > On Wed, Jan 28, 2026 at 9:34=E2=80=AFAM Ihor Solodrai <ihor.solodrai@li=
nux.dev> wrote:
> >>
> >> On 1/28/26 7:35 AM, Chris Mason wrote:
> >>>
> >>>
> >>> On 1/28/26 10:26 AM, bot+bpf-ci@kernel.org wrote:
> >>>>> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_com=
p.c
> >>>>> index 5a075e06cf..070ba80e39 100644
> >>>>> --- a/arch/x86/net/bpf_jit_comp.c
> >>>>> +++ b/arch/x86/net/bpf_jit_comp.c
> >>>>> @@ -4112,3 +4112,8 @@ bool bpf_jit_supports_timed_may_goto(void)
> >>>>>  {
> >>>>>     return true;
> >>>>>  }
> >>>>> +
> >>>>> +bool bpf_jit_supports_fsession(void)
> >>>>        ^^^^^^^^^^^^^^^^^^^^^^^^^^
> >>>> This is the actual function name in the code.
> >>>
> >>> Ihor, I think the script parsing review-inline.txt chopped off the
> >>> part of the review where AI was complaining about the commit message?
> >>
> >> This is the email body pre-processing in KPD, yes.
> >>
> >> At some point we decided to remove the commit message before sending
> >> an email, but now that AI reviews the messages too, I think we should
> >> just send the generated review-inline.txt as is.
> >>
> >> Alexei, wdyt?
> >
> > I think KPD is only supposed to trim the header until 'diff ..' line.
> > In this case there is no 'diff', so I'm not sure why it trimmed so much=
.
>
> There is. Here is the PR comment with the review:
> https://github.com/kernel-patches/bpf/pull/10868#issuecomment-3811930805
>
> KPD trimmed everything before the first "> diff" occurrence, as expected.
>
> I'll try to fix this up in KPD. We should probably search for the first
> line starting with "> " (a quote start) to trim the header correctly.
>
> Alternatively, AI can be prompted to avoid generating the header in
> review-inline.txt, but that's probably less reliable. And maybe it is
> useful for local runs, idk.

I see. let's then strip the first 4 lines ?
(commit, author, subj) ?

tbh this one was unusual. If it repeats then yeah '> diff' is a wrong marke=
r.

