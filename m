Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BA4C56205
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0NCgKJNQYyisOrSyRYo+LoktmWrYev67LGXPZuiSqb8=; b=SrWveapNe5COU8FhAeCI2TDOWA
	7+/kDfat+CyO8FRT/SlunzE9iHrpUOUeQS/8S4MMFYQRq3GZzzFHCqTCAIMqQH/EfsRJiVx9FXcjd
	WLMTP45UrWS65Xg8kykiWc5JINNa5SS+Z+Jmy+w4uJG48nCUVxXL5qvtCZX9bjgpHv45y1AOn4D+F
	TflbLQ1+QNfRb6HKcFIXx6pTDFBgwsm/QZOpRRD5fDIva1+GvG6EetXPdEWCgOOaGAgnXKk177K5H
	hqPuOBDasOm6EeAP++wU6NivjwUwIlLUPG3pSmso2HjDE6lLXQJaKmPDlL0zYdMhmqI+oyfDI1NeX
	ommF6O3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1VS-00000006JUP-3JEN;
	Thu, 06 Aug 2026 17:03:46 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1VG-00000006JIo-02FQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 17:03:45 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so284951766b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 10:03:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786035811; cv=none;
        d=google.com; s=arc-20260327;
        b=Dzxh2NAd1NMrMC3+y5gjnE/hHP6YOuego9XMhJPIn0zxzRJphuj3D9tb34uz1GONy4
         YqwrivU2YDirC88+kSEcuVYE9E02UflD08AeHvQuYUi9WRNDj2APgyiqulnWdsEF3uRm
         xEp+iYUCKFmaaIxLVIr66s1dbR+Zw8yvQIR9D6BM8ZDFnno3K/hu1qNLScJgSvk1/1Qo
         QuGj9Fj4l2n9HvgG5duxyhcny8mwu7H2FUUtes38Sk2QzxvQCFG0arQ8v7x/nF8n+Ajt
         Y9k2bZBdhl68OlAg6ZnS3aCyQDz2eaPALHvPppDPAwkI5Q539KoobySRxnIcK/omEqGd
         gCAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0NCgKJNQYyisOrSyRYo+LoktmWrYev67LGXPZuiSqb8=;
        fh=hGXqubmvd4OjkaDIzX+SQi44TwnPsOchgyN9/7LhlL8=;
        b=C5e2IK45n9dso0LBIDX5MDrJZGH4bcqG+0ZkK+ZTLgNGLnunVSgZkSzAPQ93mQLRJc
         qxo7lriA2CWLkz7W8eqHXF7lh8L/eS3gbL124QC+x5UZ9dhNucDPch0drS8q0PB81LkQ
         mOEIg0TAvtve7oObRDo1YD1Zk6g+8rQwmxOJaVnQLv9A2aEt00319L/shtZ09V6Sg+NS
         VZ1woxWMfeLrklKnPW/NjlETpBO2sibiKKzmTtjKcITZ1y7DCp6sKes98XQxSDTN5h9b
         Vf6x15DYYZ7/vfymSoDKgykpLzTWrT1rCVAFfZgkzih6Z2EnZ0+7sMmsaQsTpnxgpwAK
         W8Bg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786035811; x=1786640611; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0NCgKJNQYyisOrSyRYo+LoktmWrYev67LGXPZuiSqb8=;
        b=YmR/Tx5lac/yYsKrfYaYQ4kGRIWLfydhW/CmWttgQdXzjw3X2UwSF+5N6Jya8KY7Z7
         BOHNHCtjknAbSg+J96MC+yY9habpXRvuQ3bZ5BT/vBfe24P+bRV1O039A2rFuwWLTBMe
         0b7AxpL1q+KxWafoA/nRmpYravcK9DaK1b9/F35jSdvGnElVVCChKFg8ZIB9EvguoNdW
         usZrMjk6fn9HJr6ahzbXGkhs6FRhE+ub/YxPE9vNsSfA62ll8AYe5ERgXr24XPgNcqXA
         rC0D6+qkgN+yMiVFXydGWWSIk+UsXWveCW3rmqZOzCVkucbVkKh0/l9LqBTj3+jR7qP3
         SWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786035811; x=1786640611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0NCgKJNQYyisOrSyRYo+LoktmWrYev67LGXPZuiSqb8=;
        b=hWKc+q1Ye6cUhhFPLpDJV1IOhOP7VZ29KPRquOrUFif5TRG7SmqUuhUJG8S8hxLmKU
         yrXH5XCaYnmrYB/tVRhQ3LD2soTy55nwMp3+bNBGRjTUY0gN+pXQj8rELLmgriScwNwp
         4zjMi7gLSGkWnFVuEWGDVdKY7/6H2Fk4ldK9ZIKUZZae3uxl8Xj2dffxWe5cQlNfPVBz
         3HE5azxpayqQD/5Wl6vNgOO4UAhNglV03HNmljiPfQ7LWkkHgXXFesPpsWfjMy5/iXAj
         vRZovRbYiS21l7RGuJt1MbzbWCyDclbyQyXq62XZ8WOxGRVeY8mxJlnUeS+XbFQ+D7DX
         XPkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rquodc1ZEafAsSL9+sAVreUfryFz/zAk0SvFtlvkgqmOC6Y4jp7oP4WSIr+F1UBmMZKUBkw7Y1y8h3l/u9OdPSm@lists.infradead.org
X-Gm-Message-State: AOJu0YxW/BfcE6qDlPLZbf2wHJT83zb6yCVRjkQzStANktaeCwqhIIkU
	qC75D7o5j+hBU99CoBlU0Fl73+90W/5Ah1qgglfOJgPpAa56UJvvS7n0ksC/00kzb/QUJgz14w2
	8g4CcaURwvT8MVvl+flkk0d+DK+j6Kv/QXreY8nH7
X-Gm-Gg: AR+sD11aLVFVGOwf++NtOV5YPndfi2zeeEnPfEAyals506NnOgltqJ3NOsa+jsPUTVz
	F7mqEHfNvqwLKO/mnWMvfj57+oymVUHNGkF4JJjwiUdOEzL1XLfFx9367bk1stigc+V8ZvZHSOL
	20p2HV8PoWWNC0aGfukFqkSIGhUJAX1kaNJ8WWr9JaboD97yKK1Ra/M5s+nch6Ad9Ybx4vlI9cE
	gCj6jWCULAzMNHVU/QSjUjuZaJ7YwKv/jet6qn67yDaMnxTd4otFUwUo21jwJiSWoCzJF+LXB+e
	tu40VDCetUJNpQWVqee5nHZdDqIK+N36LF3kgoQ/rcPEbsYftdA1K9AU4kYHN7JEYOJT/2zynp+
	vdX9TbA1OjdsyQE/09DFeIJKwZ0JXbRYVf826+NxV7Lbv9xohLjfrUaTo
X-Received: by 2002:a17:907:7b97:b0:c20:53c7:488d with SMTP id
 a640c23a62f3a-c207324a87amr163705766b.14.1786035810196; Thu, 06 Aug 2026
 10:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20260805045522epcas5p39659721ef26a447b71e860c2990a60c0@epcas5p3.samsung.com>
 <20260805045514.1599433-1-maninder1.s@samsung.com>
In-Reply-To: <20260805045514.1599433-1-maninder1.s@samsung.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 6 Aug 2026 10:03:18 -0700
X-Gm-Features: AUfX_mwqECj1UQ2bXhTbYiugJepVhA28sAZJAaRUqvRHhnW-IzM-GwfSkmGLA-A
Message-ID: <CAKwvOdk=ydGGmeDnoYYNLhe0pSmDZ1FgSoB2W_985avY07Ga7g@mail.gmail.com>
Subject: Re: [PATCH v2] arm: backtrace-clang: fix wrong sp usage for unwinding
To: Maninder Singh <maninder1.s@samsung.com>
Cc: ardb@kernel.org, linux@armlinux.org.uk, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	onkarnath.1@samsung.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, r.thapliyal@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_100334_087760_18A5F286 
X-CRM114-Status: GOOD (  22.81  )
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

On Tue, Aug 4, 2026 at 9:55=E2=80=AFPM Maninder Singh <maninder1.s@samsung.=
com> wrote:
>
> show_stack() can be called for any task, but c_backtrace is always
> unwinding frames based on "sp" register.
>
> Which leads to printing backtrace of current task instead of
> required task.
>
> Try with normal TC:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>        for_each_process(p){
>                sched_show_task(p);
>        }
>
> [7.433271] task:kthreadd        state:S stack:0     pid:2     tgid:2     =
ppid:0      task_flags:0x208040 flags:0x00000000
> [7.433633] Call trace:
> [7.433640] [<80113418>] (dump_backtrace) from [<80113510>] (show_stack+0x=
14/0x18)
> ..
> [7.433676] [<8016749c>] (sched_show_task) from [<803cb324>] (meminfo_proc=
_show+0x6c/0x930)
> [7.434019]  r5:8158e300 r4:8b4882d0
> [7.434024] [<803cb324>] (meminfo_proc_show) from [<80365788>] (seq_read_i=
ter+0x148/0x4bc)
> [7.434045] [<80365788>] (seq_read_iter) from [<803c044c>] (proc_reg_read_=
iter+0xb8/0xc4)
> [7.434060] [<803c044c>] (proc_reg_read_iter) from [<80377104>] (copy_spli=
ce_read+0x228/0x308)
>
> It should unwind frame based on passed "fp".
> (CONFIG_UNWINDER_FRAME_POINTER=3Dy)
>
> Extra sp manipulation is needed only when c_backtrace()
> is called from dump_backtrace() with "frame =3D=3D fp" i.e.
> NULL regs and not current task. (Suggested by Ard Biesheuvel)
>
> Otherwise passed "fp" should be used to unwind backtraces.
>
> With fix:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13.933732] task:kthreadd        state:S stack:0     pid:2     tgid:2    =
 ppid:0      task_flags:0x208040 flags:0x00000000
> [13.934165] Call trace:
> [13.934604] [<80afa1a8>] (schedule) from [<8015426c>] (kthreadd+0x124/0x2=
08)
> [13.934654]  r10:8100bbf0 r4:8116f440
> [13.934664] [<8015426c>] (kthreadd) from [<8010010c>] (ret_from_fork+0x14=
/0x28)
> [13.934691] Exception stack(0xf081df9c to 0xf081dfe4)
>
> Signed-off-by: Onkarnath <onkarnath.1@samsung.com>
> Signed-off-by: Maninder Singh <maninder1.s@samsung.com>

Suggested-by:  Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks for reporting the issue and sending a patch. Thanks for Ard for
suggesting a better fix.
I assume you all know how to submit patches to
https://www.arm.linux.org.uk/developer/patches/ ?

> ---
> v1 -> v2: don't ignore sp manipulation completely, instead use it for NUL=
L regs.
>
>  arch/arm/lib/backtrace-clang.S | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/lib/backtrace-clang.S b/arch/arm/lib/backtrace-clan=
g.S
> index 290c52a60fc6..bf9738070af7 100644
> --- a/arch/arm/lib/backtrace-clang.S
> +++ b/arch/arm/lib/backtrace-clang.S
> @@ -107,8 +107,10 @@ ENDPROC(c_backtrace)
>
>  /*
>   * Switches the current frame to be the frame for dump_stack.
> + * (Only in case of current task using current registers)
>   */
> -               add     frame, sp, #24          @ switch to false frame
> +               cmp     frame, fp
> +               addeq   frame, sp, #24          @ switch to false frame
>  for_each_frame:        tst     frame, mask             @ Check for addre=
ss exceptions
>                 bne     no_frame
>
> --
> 2.34.1
>


--=20
Thanks,
~Nick Desaulniers

