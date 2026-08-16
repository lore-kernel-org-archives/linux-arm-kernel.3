Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A91CC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 18:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K87DdrzV6T05ieuNKPZOU2wz5knyEjMGfCEK8pz9YqE=; b=LKF40zBYcrjQXIBLackEgvJTKW
	pIGtmPtHrTbHYRODOp6GCkbIvC13io/Fa9U0v5YLLMM90TCnTOZiyOeJy1o6KwxNpAJchoGQdTd9i
	yCN49qcxjPE2wS7IhXM1beBc3Uwn5X8p/4tnf9a5+KaKPsyqQJmr+Nd4j5x/Ko9s/uD+iCSz8jirY
	g0Z5l2xOiJqOU3DP7fjcSb0H3qS4ReS1QrJmrVaLt/kZAZZeFQwGHP2+XOvMyICNi1ZSIG5GeXaZr
	7RPCW9CU8ZJ+Y0fH5ek9Pjn0leMJswD9ntVi5uMWbmJ0ddfbpSLoEHN9E+d4gRpaVNhcOWcL+moRg
	50TG9JXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvfzr-00000005026-1zyu;
	Sun, 16 Aug 2026 18:54:15 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvfzp-0000000501L-0rfA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 18:54:14 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-664ae043b7fso358619d50.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 11:54:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786906451; cv=none;
        d=google.com; s=arc-20260327;
        b=DK3DSuJVFfXukpe1UxenvUXs2FGA3CfO7ZGqdQrcp6rSUZ5Urcke1Zt6VDSFkSJCvD
         qUeNuNSsWf/m3Y5QckLUUcdNNlkMCf9gSnSgEF6noax1UO0Rq9eBvHVJ0fsgFCU5xCIX
         GWAzlQ9ImR3ICdC0lmnVayy94j3FJ4I5R4F8Eh/NU7NG+2IPmhy7KAGnE9106jfY5DaH
         4cMQfimsyFbGDxd9vhG3g+ft4Nb6P7hezucN7p58DDL9W9Qjo3a5jl/NBzuvLpBkXnjF
         73KCQv/zKa3/+xUQUAFihsPH4sVFkPKGqN3X7JkQ8cIJvomShas61pkS8GO3loay1KCs
         39/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K87DdrzV6T05ieuNKPZOU2wz5knyEjMGfCEK8pz9YqE=;
        fh=lbn+sHrgStq7HjZt+OL55iCwttwvSLchkhqT9Bdegog=;
        b=rFgmNcSoqDwzb/msgRtyMEts+CXAY86vDdoq4IL6E2NtV17P0elZwpeLuqucCg14UG
         R/dJzxuwJX9FlYZl9Ishc8REdooEtJ6wcUid8NlYvcsWqlGBclwuEM0htA31wZ9UO5U2
         EvtFJL59cg3EgstRA8MaD5hq12QQaUdGhsj9vPiQBdEtYJRtmyWjOA2S2OANXu14kv93
         7CfZiLVasYS48h3OZYBhsWhfzWc4HFX58c9+0EaYheZJ8O7m5EctSYrMWHh9VKweQkwO
         Yog+XGv0kmYKJA67724oFKrjjr6fOPPr79R7wUJegIRnNeuJBCS6ZQbcUruqrWPd2n1Q
         iahQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786906451; x=1787511251; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K87DdrzV6T05ieuNKPZOU2wz5knyEjMGfCEK8pz9YqE=;
        b=XibtJhHE4RdBUpLdlBB0yzkCMbvhBVcgHwUIOZSfzXWEwWOKTKyNhsf/GqGLl/e7DV
         FI+N0RJl8Ux+8D+EKKI/jwWTcAGlw34hhUL2cg761AFAX7T8EX812zXVNKYxUek0d1m+
         Gt5RdyQdbBkgJ7xkR05RYTyjfzX/87YtOVo2sB8ti6X6ymNbqbXqzzpuntha6h0vvGJz
         tA/2+mQA5aoVzlCXy7K+Rcuddxh+ejNUaOmnqPYSIwquq7gYRint7lSKPfP1X74he2ml
         3aC5t8RcKO343Oq3298ueW+NOuuV/jvfAkzBXYY+KKVAtJNV/mv7SZEC/G84triFGTO7
         S8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786906451; x=1787511251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K87DdrzV6T05ieuNKPZOU2wz5knyEjMGfCEK8pz9YqE=;
        b=s1mJ9jR74WrUHpjjSxKPpzkb6rRbPiFUL663ZIGHRssLnQ+ur9nNVk9NVqKlGYFye8
         WG9H9vi0Bev2xou67WlBdLgO3I9D6Ce4f9vC50Jg6UlOsFeimC8mwVZBvENI74Mbg9cz
         roCYbOq5BmklvnQ8KWOokfFzGJvvWQDuOps9uId0YRgKzEREF3ekGh3DGkEOKpMGEzGG
         wZ3NbmbvB/Y0z5PQR0VR/DoYny0r4+hhuP/p7DkxxRG2MTHwGqgA8EEd9XGhnYqR7nzE
         ZxUK1WIrDJ8q09LDHmUO69QIwVaH7jOSph43UnyqFF4QdETkBzIJNtmXWmrt7NDw9MJa
         iyYA==
X-Forwarded-Encrypted: i=1; AHgh+Rp490cC1K+Og1rgQ2XElGKx0+825M3INK4lZJq2kW3WLlrYxrTly/eXYKWYDcH85nIXz8KG5ulDnxvZZ0Ihd5ML@lists.infradead.org
X-Gm-Message-State: AOJu0YydiuC7ArU/R/HJQ8bGtl9z7frgeMHMdaheZrKQd7eCI22iMOPj
	QxxL5pvWvIGpVak6uDBBV8As3hQPDNZcgwANiSpKosy1PD4VLrarAMuiQLZ/Md0iIgRxdYzBVNT
	qV36YXEMxtywOehtZaWUZN09sQeghivg=
X-Gm-Gg: AR+sD11tl/oLNiH2GueJiXkUDIPR8cyiz4ilkNxwqvjU2IBba0MlYMMoyuYZHHGP8LT
	k3tBQLh8btKYEncHt3YjI+CIAA2jFylvCBDxBZAhPd2/Nz3/PlM1Kf6D0a9+i0CK6wZqkSk9+d5
	X0neKpWtAdLjZ1iXfW4mJLKHYO03xupNsgmqKVwZ225H+UtDFCayiKyv/eeOmGxC+k8plzySR+j
	1OYthO3YhU3Z4N4OvK/OUcvDleYxs1lPCpteqokod0qJKD3/9tq4keti0GvkvOEyx3uUkJzZyYD
	WPRrH2RY6bfL+1Fwh/UL9++WCgxXgDgOwElJvpOtRsl18cEN4SrLs46i2N0vLM/FpGyLq6GnD+9
	M
X-Received: by 2002:a53:d004:0:b0:668:6e5:16d9 with SMTP id
 956f58d0204a3-66c72cbb9c8mr4687899d50.2.1786906451288; Sun, 16 Aug 2026
 11:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260815130556.68876-1-royalnet026@gmail.com> <20260816041233.3566625-1-gahing@gahingwoo.com>
In-Reply-To: <20260816041233.3566625-1-gahing@gahingwoo.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Sun, 16 Aug 2026 20:53:59 +0200
X-Gm-Features: AcwNN1Uh4_l9nX5DwMZE2uVyBVHcgamwlhxHxsLdAI4oiEGskahB9NDY4Ow6O_8
Message-ID: <CAEWPSH54fhzKEYR1cgTskNgKryDEMaZOY1y5aFdKQQyzfKbYfg@mail.gmail.com>
Subject: Re: [PATCH v7 08/10] accel/rocket: add RK3576 NPU (RKNN) support
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, heiko@sntech.de, chaoyi.chen@rock-chips.com, 
	alchark@flipper.net, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_115413_301882_0A30E650 
X-CRM114-Status: GOOD (  26.51  )
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

Hi Jiaxing,

I ran the discriminating counts on RK3588. Details below, but first a
source-level observation that changes what my result can tell you.

Neither mesa-25.3.0 nor current main contains the modulo form in
rkt_regcmd.c. In both, BS_OW_CFG (0x4050) is emitted conditionally on
operation->depthwise only, with no dependence on output channel count:

    if (operation->depthwise) {
       EMIT(REG_DPU_BS_OW_CFG, DPU_BS_OW_CFG_SIZE_E_2(3) |
                               DPU_BS_OW_CFG_SIZE_E_1(3) |
                               DPU_BS_OW_CFG_SIZE_E_0(3));   /* 0x36c */
    } else {
       EMIT(REG_DPU_BS_OW_CFG, DPU_BS_OW_CFG_SIZE_E_2(1) |
                               DPU_BS_OW_CFG_SIZE_E_1(1) |
                               DPU_BS_OW_CFG_SIZE_E_0(1));   /* 0x124 */
    }

(mesa-25.3.0, src/gallium/drivers/rocket/rkt_regcmd.c around line 234;
unchanged in main as of 26.1-branchpoint.)

So I take it the (oc % 32) expression is from one of your 102 commits,
fitted from vendor captures? That would also explain the extra bits in
your two constants: decoded against registers.xml, 0x80011111 vs
0x80011011 differ only in bit 8, which is the LSB of SIZE_E_2 (bits
8-10). Your working-at-56 form has SIZE_E_2=3D1 and the failing form has
SIZE_E_2=3D0 - and upstream's non-depthwise value always has SIZE_E_2=3D1.
The three data points are consistent with SIZE_E_2 being what matters,
rather than the modulo-vs-parity predicate as such. Your values also
carry RGP_CNTER=3D8 (bit 31), OW_SRC=3D1 (bit 0) and bits 12/16 in the
reserved range, which upstream never sets; if those came from a vendor
capture it may be worth checking which of them RK3576 actually needs.

Now the measurement. My runs are with upstream Mesa (main,
26.1-branchpoint-5505, clean checkout), i.e. the constant 0x124 form,
on RK3588 with the in-tree rocket driver (7.2-rc7, rockchip-devel
base). Standalone minimal models: CONV_2D 1x1, 64 input channels, 8x8
surface, uint8 asymmetric quantisation in the mobilenet style, output
zero point 0 so the hardware's clamp-at-zp cannot mask anything:

  1x1 conv, 64 in, 56 out:   56/56 channels within +/-1 (47
bit-exact), maxdiff 1
  1x1 conv, 64 in, 88 out:   88/88 channels within +/-1 (81
bit-exact), maxdiff 1
  1x1 conv, 64 in, 120 out:  120/120 channels within +/-1 (106
bit-exact), maxdiff 1

Reference is the raw CPU implementation per channel (not clamped to the
zero point - same lesson as operator 28). No channel had a constant
reference, so the matches are computed rather than trivial, and no
channel sat pinned at the output zero point. The three jobs also
happened to land one per NPU core (per-core IRQ counters went 0->1),
so the result is not specific to a single core.

Since upstream emits the same word for every oc, a
clean result at 56/88/120 says RK3588 does not need an oc-dependent
toggle at 0x4050 at all, at least for these shapes - which is the third
possibility your two forms could not distinguish. It does not tell us
which of your two fitted forms is closer to what RK3576 wants, but it
does suggest comparing your fitted values against the field composition
above rather than as opaque constants.

Happy to run other shapes if that helps narrowing it down.

Best regards,
Igor


On Sun, Aug 16, 2026 at 6:12=E2=80=AFAM Jiaxing Hu <gahing@gahingwoo.com> w=
rote:
>
> Hi Igor,
>
> Thank you for running it, and for the unclamped reference.
>
> Your 1001 does not discriminate between the two forms, which I should hav=
e said
> when I described them. DIV_ROUND_UP(1001,16) is 63, odd, so the parity fo=
rm
> gives 0x80011011 there and so does oc % 32. They differ only where a coun=
t is a
> multiple of neither 32 nor 16. On RK3576 the failing one was 56, and 88 o=
r 120
> would do as well. So your clean result rules nothing out, and I am not re=
ading
> it as support either way.
>
> On my side that register turned out to be the whole of it. A 1x1 layer wi=
th 56
> output channels had timed out in every round it ever ran, 32 of 56, and w=
ith
> the parity form it is 56 of 56 every channel correct, with the old form
> reproducing the timeout in the same log.
>
> You are right about perch.py and there were three of them rather than one=
. The
> inner maxdiff, the interior statistics and the raw row dump all assume a
> surface with an interior, and all three raise on a 1x1x1001 classifier af=
ter
> the useful lines have printed. Fixed here, and checked on the host at 1x1=
x1001,
> 5x5x8 and 56x56x64 before flashing, which is a check I should have been r=
unning
> all along.
>
> And I will re-score operator 28 against the unclamped output. The max(cpu=
, zp)
> reference does move channels that are not wrong, and reading an empty
> convolution off it is the kind of mistake I would rather not make twice.
>
> Jiaxing

