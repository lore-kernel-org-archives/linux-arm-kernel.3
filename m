Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1F5FA3727
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 00:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRbbVXHTYPc2VKqPCXqyRbK5cNEYW6ST5IZJzvZ/sWc=; b=SRz9IRL67u8T8gQMfrS8hKHNHc
	Cf+Ip+471ezCjelkbem5C2L3QWaIifdKD+8IptLZeE8FR2KUJpn7TNqCecHe0pJ4ZMMTCQzIgWOWX
	/ssPZuaFBoIa7Vas1tN91K5U4oSMz0UjiveVU7BbKpNc6NYe0ZCCbTYajZzi04xF79uu2klPO4l1c
	bBi0xHlrVpKowBeyBruCVR8eOD3aaE5iYRaILUfRJ3qnaEOXMLExBob7Te/t9E0htEKoe/inCGqzb
	SWoRCs4noFAKfXzG58ZL10FA6o97z8pK9/lYxzHVwIPG2Ky0pMPrQQQmxOx2tuib0nwx0rbxTG3w+
	YXNJIveg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbpDp-00000008nuX-3cpe;
	Sat, 03 Jan 2026 00:10:21 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbpDi-00000008nu7-37bj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 00:10:15 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-43246af170aso171277f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 16:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767399012; x=1768003812; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRbbVXHTYPc2VKqPCXqyRbK5cNEYW6ST5IZJzvZ/sWc=;
        b=L0kcno+Z2iiTZZZbek0TKAd3H2B3/eGSwlgIhh0KSCz3TSlI1v38ryJX/H1KkOJi5L
         IML+AZ4Yrty4I6E0JwczQahaonEfeoFoh674Gw7RWdO8dmeGDsRfZuXreFle71ObUrWm
         wHQ4696/sMli3ACw62Q9ctSWayBxvG4psKq5BAM2h7YJc6We/xin5+H/xhB/ePwsC6Tu
         iIZNpKIs12goqBNh8lkXtI9H8NEv2QfX0bDKnTrLvYsIy9y9una+1Pc0EZU2sZs9T6rb
         RN2ulcKf+Y0x+KVDK5IuqYhM5OkknXpgocweHs+bolnbU8sKq5KqcVnGSxHsmf6kdhHZ
         FLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767399012; x=1768003812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hRbbVXHTYPc2VKqPCXqyRbK5cNEYW6ST5IZJzvZ/sWc=;
        b=hQP3svfgTwTWr/nSmWaBar1cg/eR49orn9nLLnouDDkUsAODwdy7F8YikIXs2KKRrD
         B+koLDiwBpSB2IrUJH+DwRvwXgsptXwNAFNyXIu0r6k4ojIbLoIMvXwKEAp4OLmP/XLZ
         LVtAZw+Ocu8gvb6Pyxg65n7PltK4YMeGUIK16X60ctlvaVQzpVpLhI/sMkem8ioEAgL+
         hrS0rfXQN3hY67BtgtX+wny87f2dNcRCLsELlaUs6dMA8p+Hba2OFJYGr5Ev/TQUGfHg
         aL7/EMI4ord6gWtB81c+jGBBguFAb7igGkfwswW8kjBsEihfcb3ur2kGi2Hrpe01dtEZ
         zM+g==
X-Forwarded-Encrypted: i=1; AJvYcCUsMu5ngHPMFYh+Mw5tMu5Pi1ZUfKPUw9RXwZ7mo0wILwX4LG7EkT8rYZjxSpFMuPV8/fyZRc1bEIEcRjU237Bs@lists.infradead.org
X-Gm-Message-State: AOJu0YwNz5IzcfFEhqNWvuH974Nh6opo9iwkxnlOJCk/IyIIyVD9N1Lh
	mvbZ7UZJiTeG9xP4mvCto+o56rB649XdqUUIYPZrlKdj+6CxWm4lqcIC4fM+f3/HIb7DemPDT0J
	DHu6KAeeqXSQLrkQWlRI4ruCn1ryCIRw=
X-Gm-Gg: AY/fxX6UAjo7158igw51Aaz6QyP2/ZQyRDxCJFy2HwnGrukgjoevOQNH950ZKXyCAhW
	Azst5Niq2yCVZ3DmKlkNaSQkQIHT2OxE799LLRnfXxIuZjUNsbxPNOPNheovtoV3YOztlO28iHU
	i7++whnADj3h9NZYh/dBMBs1pRMzuTzbFpLVQZHLUvnt+1vRnwB0VsLthRcVGQ8APewBNexS2IS
	icsyPAU/o+CiqLqskxfFEySAEqQompOPLzkSo05YiDWAZlEIUN569A/g8bdQX3CHJ0yxcUF5EoO
	t9k1uyqWc6GWcMPc2rQLGBygVBNc
X-Google-Smtp-Source: AGHT+IHvl69qBLpKV4p1MDyfuhCpO300taFssXMhLvd1fV9VFeOxSAmsqIUTrqiT+c7w4vbSzdnJpbQJ+SrOnq45F+Y=
X-Received: by 2002:a5d:5f90:0:b0:430:fae3:c833 with SMTP id
 ffacd0b85a97d-432aa3f7362mr1829054f8f.7.1767399012266; Fri, 02 Jan 2026
 16:10:12 -0800 (PST)
MIME-Version: 1.0
References: <20260102150032.53106-1-leon.hwang@linux.dev>
In-Reply-To: <20260102150032.53106-1-leon.hwang@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 2 Jan 2026 16:10:01 -0800
X-Gm-Features: AQt7F2pkrrjlef2itb31CbuPvCzoWrna2Y0HhA2oqYpnjBfMeP4AzvREiUTVP_8
Message-ID: <CAADnVQJugf_t37MJbmvhrgPXmC700kJ25Q2NVGkDBc7dZdMTEQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 0/4] bpf: tailcall: Eliminate max_entries and
 bpf_func access at runtime
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, "David S . Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H . Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_161014_819718_A3FE8030 
X-CRM114-Status: GOOD (  16.50  )
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

On Fri, Jan 2, 2026 at 7:01=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> wr=
ote:
>
> This patch series optimizes BPF tail calls on x86_64 and arm64 by
> eliminating runtime memory accesses for max_entries and 'prog->bpf_func'
> when the prog array map is known at verification time.
>
> Currently, every tail call requires:
>   1. Loading max_entries from the prog array map
>   2. Dereferencing 'prog->bpf_func' to get the target address
>
> This series introduces a mechanism to precompute and cache the tail call
> target addresses (bpf_func + prologue_offset) in the prog array itself:
>   array->ptrs[max_entries + index] =3D prog->bpf_func + prologue_offset
>
> When a program is added to or removed from the prog array, the cached
> target is atomically updated via xchg().
>
> The verifier now encodes additional information in the tail call
> instruction's imm field:
>   - bits 0-7:   map index in used_maps[]
>   - bits 8-15:  dynamic array flag (1 if map pointer is poisoned)
>   - bits 16-31: poke table index + 1 for direct tail calls
>
> For static tail calls (map known at verification time):
>   - max_entries is embedded as an immediate in the comparison instruction
>   - The cached target from array->ptrs[max_entries + index] is used
>     directly, avoiding the 'prog->bpf_func' dereference
>
> For dynamic tail calls (map pointer poisoned):
>   - Fall back to runtime lookup of max_entries and prog->bpf_func
>
> This reduces cache misses and improves tail call performance for the
> common case where the prog array is statically known.

Sorry, I don't like this. tail_calls are complex enough and
I'd rather let them be as-is and deprecate their usage altogether
instead of trying to optimize them in certain conditions.
We have indirect jumps now. The next step is indirect calls.
When it lands there will be no need to use tail_calls.
Consider tail_calls to be legacy. No reason to improve them.

pw-bot: cr

