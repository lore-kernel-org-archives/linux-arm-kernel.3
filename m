Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67D1C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 06:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxjstwkBQOk6QUT87q4wxhxzpU2PEHtx6dE5JyiPO4o=; b=df6Tx3uCU5en0gFa8nE5XaccZ4
	aFKFAVgEkbG8mPY8GOOiAM1zQgy5lKUpAM4KRk73UiznCTrmJHPqgMiMQD7WrN9YpAx+FGQeWPKPF
	I8PvS3kWL0jvCgAzrnZCSl+u+Yy0lhNGOfYpmDudMs7UvBoPlEOlgsmOZgxeeud20tr4xTc/GB5M3
	9jk2MKy8XSjxb8z8elB0r6IaSznSJn444CYfFjsNvDopmOvKFR1trJz58EQD0Xqq59MsqaicxQ8ZO
	DmnaLlT3KgqggYU86pQHZtdeg562wxah5ghNSG+GEr2l6QQfxVHcFy0tV6U7b1ZYqbMrx9IbRXhqe
	p6acvzMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuljk-000000023ky-3mfJ;
	Fri, 14 Aug 2026 06:49:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuljk-000000023ks-0QPL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 06:49:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 77D8D43B9A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 06:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE4E1F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 06:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786690191;
	bh=xxjstwkBQOk6QUT87q4wxhxzpU2PEHtx6dE5JyiPO4o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CODvIqCV0wIxr2ln9MNgk7/qOtwKhUkfx5lZ6YQSvZbomMi/HSrdEvKUc6pZ/b5pX
	 wH4KPA3TpUNCiKRrkzvrc6Is2lRhJY1Jp0J24F79LjB3pPKqEnZCFXuk3IiseIlAk1
	 T0t5Fu1aXNwIXyhVzmzblRsaQFMHyJeD8qj5ZN4aGPDLbOUId1UOyekdoZIOO7tFqe
	 UJqt2pwiehGhGEP9vTrqkRj+lV0bwdAx4EimJdX+bgno1WXu7hMlwSB83I4KHBAIcp
	 UnR7iAkOLCEvmabvtkbaSYRXVY59Lp9S0KbyS490Um0TjQyQX3HAJtHCdRc96xIEAq
	 wCojw5U6juqGw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c74c469e8so4171921fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 23:49:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpkLyt2U0VcL3ZUSj71sOfTg88rDvzcFxD7fH6MlCWz50Mm4l4hkInQ3vtYMO3XtmYUOzxVKdsfUJvykpOBjcvD@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl1frUrD2X+U3Bp8X31+osfWPaVU89KWQHs3mR2oKTmeUl3Ylb
	P36MPFJW1BHtuCRe1ymvsjPcy0fOqF3R6ovdgpQ3A9IObIG7R8PHHqxyUT8kuyfJzJGSUMn2t7o
	AXk5LZtbbSNucCeXiwa7Nh45ORLY8Xhk=
X-Received: by 2002:a05:6512:a34e:b0:5b1:4cb2:e7ca with SMTP id
 2adb3069b0e04-5b4591160admr347073e87.18.1786690190146; Thu, 13 Aug 2026
 23:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260812185057.1573-1-kmehltretter@gmail.com>
In-Reply-To: <20260812185057.1573-1-kmehltretter@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 14 Aug 2026 08:49:38 +0200
X-Gmail-Original-Message-ID: <CAD++jL=UQ4Hfib6EMPEChMpKQbSqPAmzQtshfExJ9XwhwqgErQ@mail.gmail.com>
X-Gm-Features: AcwNN1WFlX7_hVVMh1i8hPh20ULBcn1G97k3AmFAgBCam2Flx6G5Ldh53SgOZhc
Message-ID: <CAD++jL=UQ4Hfib6EMPEChMpKQbSqPAmzQtshfExJ9XwhwqgErQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] ARM: alignment: fix LSR #32 and ASR #32 offset decoding
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Xie Yuanbin <xieyuanbin1@huawei.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Aug 12, 2026 at 8:51=E2=80=AFPM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:

> The register-offset form of LDR/STR may apply a shift to Rm.  Per
> DecodeImmShift() (ARM ARM DDI0406C section A8.4.3, "Pseudocode details
> of instruction-specified shifts and rotates"), an imm5 of 0 encodes a
> shift of 32 for LSR and ASR; only LSL treats 0 as "no shift", and ROR
> with 0 encodes RRX.
>
> do_alignment() special-cases RRX but not LSR or ASR, and IS_SHIFT() does
> not filter these encodings out, so the block is entered with
> shiftval =3D=3D 0 and the offset becomes Rm instead of 0 (LSR #32) or the
> replicated sign of Rm (ASR #32).
>
> do_alignment_finish_ldst() applies the offset to the base-register
> writeback of the post-indexed form, so the emulated access itself uses
> the correct faulting address but Rn is left holding the wrong value.
>
> Reproduced on ARM926EJ-S (versatile_defconfig, CONFIG_ALIGNMENT_TRAP=3Dy,
> gcc 13.3.0) with a misaligned base and Rm =3D 0x1000:
>
>   ldr r0, [r1], r2, lsr #32   Rn advanced by 0x1000, must be unchanged
>   ldr r0, [r1], r2, asr #32   Rn advanced by 0x1000, must be unchanged
>   ldr r0, [r1], r2, asr #32   with Rm negative, Rn must decrease by 1
>
> All three are correct with the patch applied, while a lsr #1 control
> case is emulated correctly both before and after.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Please put this into Russell's patch tracker:
https://www.arm.linux.org.uk/developer/patches/

Yours,
Linus Walleij

