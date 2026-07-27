Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2408C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 19:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzxsUu8EEz6aogAVQCyar7okPKydIEKaNYl3cOU+cbs=; b=jB4KhxAGbCPZLvmkgt7j3mYL5Q
	40AesPy8tZeORa6G7Ss8oZF85g3jL5hEap9BQYjkfVa64m/+SYb6HsicN5Cjx77DPydMH1hKurNL8
	8/wRQkZ7pDsGLT5ZeB7kTPrgljwrpjY+Cn7Op6Q5+aN4lU+RSzpwappblsw9LqaYj0qFXpJB6nSIn
	+wMgAHWixMOiA6KUdP98rJn4FGFHaknPGgbSoZl3q+i0JklU56qdlFjA7iVW467g8W4gd913bMzQM
	zIe7PDFJBxeML+5rWv1dORb6oIEh9DJhSQ+VaX8AJoJm22pnCjy/rH7Tcn7y5OzRJL/Wm99lzOzWb
	GJhd0QJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQuY-00000003kib-3FyZ;
	Mon, 27 Jul 2026 19:22:50 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQuV-00000003khV-2uHk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 19:22:49 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c1c24ec9525so504474866b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 12:22:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785180165; cv=none;
        d=google.com; s=arc-20260327;
        b=ha1XQBanfvqftLoyNHRu5kOGKou7s56Raqv/JSoF14kQVzBAlRMz+vHuBr9tcn95bk
         kNPWcjAgdp72LF9IQC6nE1jcjLoLsAfYyXNpj1IlMNVoCueCu/aqmmlSKBaE7iDXUCPa
         QjI+U6OehgeyMc79qeK3DztFYn64QCcZV5QyfNkjOkXY0mTpAx5qdAJxguHwVVISAE2e
         yztfxRAaUCaUiHbpwsAJKK9G83k3cKM5sSojowG/u9WbhkUcIYowN78XDKZuzkRjt0ei
         I0/45Iba99cjtBuEQ2hPZHBMKcx25F7IKXMCdx1bYr19ISQQhFhxQkXO41JoGXTXj8LX
         2s3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PzxsUu8EEz6aogAVQCyar7okPKydIEKaNYl3cOU+cbs=;
        fh=f0m3xsfcKrIzRDE0aiWWbKVMU7KogUWcqPRix3U8pXc=;
        b=sVIl6SXCN7OcXbwaFWkHseGjfaSDqkvDrP9dVfT9HwdFEpdTtlcZjDEra/DYmi+YdB
         RX7FVJuAPxqpNMR44JLoIA0oE5G6m9oOGit1Bvv9ND8bUepsWsUt0Z62rRptjQ/WVgGM
         BsPodbwyAh/lQK1ZDM3lSDdTmQBfvXubykgVDNCtgH2p5HtFdj0lZB6u/99l5inB8Htx
         jL1i90NckMPktniOZi/eySNr9lNnTyd1z2mc1PHuEJvhUGZega27q2yEjn+H+U1z7C1y
         IlDE4AW9aGHPW1gL9IhZBUStHd6N3d6sO8dTYLMsz1xZ8iZGIsh8itB5f9e9SB8ldVB7
         S5Mg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785180165; x=1785784965; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PzxsUu8EEz6aogAVQCyar7okPKydIEKaNYl3cOU+cbs=;
        b=REh6gRccMCy95qOj6eDb+X4yKv566itbJzSM20+ImlNzmaWY6NDrvnsDLCjrefVaPk
         oXLqHMBjWgNVBB/QCwEzxm4WDhNugF8LJqHcOth732z+wyNaQgpxEz2X54Sla1NuTF+I
         HHNkrTQGVgfz/7FbQlN6t7qgtSKt0Kx+p/UP/khIuO8zrUuwz02Z0/uQynsEfhPzvvQ6
         5noP9S4CaJHxopRZWu0fdgCDdHW4acEcpf92Y2cpwQeutSTp778ABHL6dOqZAPxLps24
         zc95Xu+ox3L1BIV9b/LdcqSG2HrnQx1uhjJGgW0BF/LCxY7v1rc8/BIt7dFXeHgRml+6
         URgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785180165; x=1785784965;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzxsUu8EEz6aogAVQCyar7okPKydIEKaNYl3cOU+cbs=;
        b=ciQY2pqQO/VwzecpWRb8/BLzFKclBrN5j9YF4/+cSS673xnCTW5VBsUn0UZk16DWLm
         t5oAtsRgnpkbrneyeTopmuwR3Zxw3ofZeHtedacWhw+3jlFze7KncOqkgjreN29PAjjW
         OUvV1GX4okhBMoSNKRwJ6owBTeOxddVtlCkeexaSNJ6qs3LdGEwfpKhWBI8xdy4a5CGn
         azLABfnajnZIq5vtwNmJsekBgcfFlrfRQ3xwn7pSD0w7DhBJ6It/WTZVXkFTKbDjEeEZ
         vv1t8rvlA01n0BlnctzznWJLTwr57AWhAOSifSu0LNrmx2KSZANLYboXxSLzgLjtjUKw
         hjrQ==
X-Forwarded-Encrypted: i=1; AHgh+RolvHjxOCN2C7Sr+siiq7M2FC4e9L5/MsJUZ2wv7+lWo5X97S0mur7AvFiYcdSHFccQhbVY34rBeevD9BwtLJrw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7gqYuN8VikegFHTz/pbqy+6NodiB3Oa2lP7CfnJnr9/1ae6DX
	kzF6foqDwSjZ/7lnDTCowaksaUAywk9C3SyV0OTn81JRztquRUY7ZWDV/QIuaAfsLsJi58PmDQT
	7x6t+99kTM4vOIHCXzymi/FrjkQfjmLaVuf9r4GlE
X-Gm-Gg: AR+sD12/nkLDScLJNVbIJ35/FK89zuIX1FrS3c7bjqvoDt97N4STF3fohWA7d5yqEbf
	PSsxWhBESig7uU/UIjxp0ZcJMYTuBZRY2V8sTq8xObGhkpjFkAQV5r0IH6ffI7xxdNXNqWsvrEw
	bJZ0IzvwEGJr2uCKrGzX0+b0E0f+Fg1I7NtYOzr1Zh2/H4OUhClbfiw/1fQRRpIv/wtlmLu57kt
	XmKpxyoZ3JpnvswY6z8e9zkuV1dfwX4heXuufsBXUAcpu3FjRlpuZdFuSDMetLBolJDPJCCG+nO
	icRnx8LY/hwOBFWBxupRO6YamXv8CGQX8PnbyEFsPg4NxtJ5WDqEFkbzbj1Ic5WMD0i5KVo6aQ=
	=
X-Received: by 2002:a17:906:eec3:b0:c1c:62b4:1ebf with SMTP id
 a640c23a62f3a-c1f692f28c3mr17259666b.60.1785180164098; Mon, 27 Jul 2026
 12:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1785153469.git.hongyan.xia@transsion.com> <eb38b41ae1b3216ec69fb45555ef5df57efd7b8d.1785153469.git.hongyan.xia@transsion.com>
In-Reply-To: <eb38b41ae1b3216ec69fb45555ef5df57efd7b8d.1785153469.git.hongyan.xia@transsion.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 27 Jul 2026 12:22:32 -0700
X-Gm-Features: AUfX_myNeo2p_4eMOzizBRqY-lBcfNbJZ5LCrTo2tmMUomZNZli_Ze8j8wrUS8M
Message-ID: <CAKwvOd=HeG=z1j2qB-SX3NQ=62ERr=KpQNZyqqp2Qy4kZ54RLw@mail.gmail.com>
Subject: Re: [RFC PATCH 9/9] arm64/debug: Mark debug exception helpers __always_inline
To: Hongyan Xia <hongyan.xia@transsion.com>
Cc: Will Deacon <will@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, Oleg Nesterov <oleg@redhat.com>, Naveen N Rao <naveen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Jiazi Li <jiazi.li@transsion.com>, Pu Hu <hupu@transsion.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_122247_781773_B23C9A33 
X-CRM114-Status: GOOD (  14.11  )
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

On Mon, Jul 27, 2026 at 5:25=E2=80=AFAM Hongyan Xia <hongyan.xia@transsion.=
com> wrote:
>
> From: Hongyan Xia <hongyan.xia@transsion.com>
>
> Static inline should be enough to actually inline functions for most
> compilers, but my Clang-19 somehow thinks it's better to outline them.
> These tiny helpers then live in normal .text sections instead of
> .noinstr sections, violating noinstr.

Anything special about your build or config?  For example, we've seen
a recent influx of bugs around AutoFDO not inlining functions (despite
constant propagating initdata constants into them) leading to modpost
errors.

Can you perhaps share your config so that someone else could repro and
take a look?

Happy to follow up in our issue tracker, too.
https://github.com/ClangBuiltLinux/linux/issues

>
> Mark them __always_inline so the compiler can never outline them.
>
> Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
> ---
>  arch/arm64/include/asm/esr.h       | 2 +-
>  arch/arm64/include/asm/percpu.h    | 2 +-
>  arch/arm64/include/asm/preempt.h   | 4 ++--
>  arch/arm64/include/asm/ptrace.h    | 4 ++--
>  arch/arm64/kernel/debug-monitors.c | 2 +-
>  include/linux/kprobes.h            | 8 ++++----

It might not be appropriate for the changes to kprobes.h to go through
the arm64 tree, but maybe it is?

--=20
Thanks,
~Nick Desaulniers

