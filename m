Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7227AC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 06:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BMS947NNKFPLRfvtLju1EWeI0B+oJCvSrJJrI8dbBl0=; b=LnJE65Y9FxujUbZRcszic1p5Uo
	9mF7jYPEiJqK8vU8QUDlgSWId8snQrtZiKvaC9h3oagHjxMB5V0f/c8na3q2C9LgVCeVtupRacy/a
	8ibXF1q3/KowtkKhAYENnok+HnsEJKh3ykU1mOdTjg7sXHvhkuKM319DTIfCt2bPmvrKHpeRigaO0
	Wk5r3yNtMll+ljh84+knIgnY/BEjNt5OgtKhtgUY6k9s2k+lAaUcSuyrBR2IDQGGUAOEl9tNC9+zy
	ORu0162r6Xci8IKtKoY1rFLwod8H0V/JBhnRDSEL/A5GUU5tPEqfH1+aTifHy0hgTjI6Ulv0uS0CG
	qL6M+s0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJwR-0000000B9wm-48AJ;
	Mon, 10 Aug 2026 06:57:00 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJwP-0000000B9wK-0uNY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 06:56:58 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-39c7ce122c7so10550781fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 23:56:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786345015; cv=none;
        d=google.com; s=arc-20260327;
        b=fxHw5Czcm9lDMOo3IcSfxjLAEvMcRoRYtPacIyxEYgmimk2gjc42h/trMeyl7YPKsz
         M/4Cq0sxs7X5FFMLOOPuBpDmQw7Vxv/O/rZ9ZxoyS2PTSOH7rcTgyojKEEzUHAGKQ/hQ
         Mk40ceHhM5rS46fI9a44wYI7+Wz3eixmssOEfqrfH7IlegCS7RUmVLX49VRCpH4wtmFV
         rMUgR4/Sl42gawlVFY77McGR9hk8ao6GiVww+pNjgjO5TVffJCVAHaZVO7ekO7xpOyfv
         qw7+94dVERsOOwPXA5jFWFbFwWylyT+2l4cfHU1+kvDKEYrVHb9QDD8qCyLvJ0MQOrFF
         ndmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BMS947NNKFPLRfvtLju1EWeI0B+oJCvSrJJrI8dbBl0=;
        fh=qn9dtFO7jRKuR7U2FLvgqsOh8J8laepzVEJAhYaxhOg=;
        b=gQQIDZQ2Hf2du2+P8WvSsM5oN1LsH2f0bYhkgHgQb/xoez9anV0XQPHLAOQU/Y3YFG
         uUR2V68Ji4+v1SiMSx23ntyqa4ikne69w/gYAtGqC0gd22lQipsz7Ypk2ts6Z9IUoepK
         FXlEiOFcF9OHo89lORz5dnUwSsksMh4t38+itMUbLImArFp9yBLNsylD6B8xZ2nwPfCg
         ABbMo+mGwKM1HT7CAqdIJ052sYX3CtjWRozJNDwgZXl3HDIScdIP5yG0NuGn2pEJTPIo
         oD+fLVxEMJRe2/5sq60+YBlHJNtZwUMEyfgF3glZ2v6S+7CEew7l7xCP4zytg+d15fS8
         6eaw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786345015; x=1786949815; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BMS947NNKFPLRfvtLju1EWeI0B+oJCvSrJJrI8dbBl0=;
        b=NjmDjgYY4ii0V17NbHkMA8P6ANh66eZlCWBjw5sr2vHUvJEUEjVHzePRG1XuHY8wXd
         cApoe29ELwrfPBzh/ZDJq8h+xapiwJxeVJ7aYAVKLoS887WK7DrLWetI9Fcl5nFJ248t
         7Znxx5PmtxjMVtcCIIr2tWR6e6dXNjJY6b3CGvRH1j2AMc8FqCVA0E4+xb1gAygJGaqC
         h8SsXufRueCaGZ3oDa5sDDylr1lO/UmDflqtW6UG5nJdOq+OmSSJjC8GuXo9QLIL8iXs
         KVxJi81iMUu57qqaNwKkDybrEAA9pCOPxStkJypsgg2kAsj2x+VIG0a9kX+70S+7ZVvl
         GQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786345015; x=1786949815;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMS947NNKFPLRfvtLju1EWeI0B+oJCvSrJJrI8dbBl0=;
        b=g205hdwXngSC4wcZZkp+kstgcmNrMloHaRpjO1fckPVH6Z5oqEEcEar6yi06HCamLN
         e7IfTPFFIORWGlG5a16jxk0VPHK8X9lUecExi3/A4GX+lOO4PMKxNtZZp1HcmHDlrHZZ
         paDwzIn00HksssYYx2MBm80mNe7Tq8ck8PvRbQYFDu4+vVTMC8pDDQw9hRkC1c9IFaxF
         SmBh7QrlZoeIRR42LUG7lZRlVw7SclUtj149LLPrcav6K9elEIZJN5FSmrcFiEYh97Jr
         5IoEse6zBV/rFITzDdvUILY0suEiwEAybIVxmKpp3CvfjJyrWVfaByr7j9xNRDIXhWFC
         tF9Q==
X-Forwarded-Encrypted: i=1; AHgh+RptxlGxcvRVBQysy+/JFk4p/rm44oX4u94cCpJ1c4zYejpp4uGdLvAJawiRCgf7oFPB1GAUUGO4iftfbHCfaMMv@lists.infradead.org
X-Gm-Message-State: AOJu0YyMVDTwmbu5hI9cHsirDcpc443KEYrzPQp5KcIv2KBacT0wnVro
	lRLmqOF+p1yv89SHo5wJKFFZz4l+PkEMxdBVMVfkrbA73NZGWauyj+OIgIxmFPxMo2Pow8nZAgO
	c/a5NMbxUP/j+SmkQA/y64BT0mzTmp0E=
X-Gm-Gg: AR+sD127+FZfndXFtdrT1y4hGraB7ReImNpXzGZxgJQvWH3nm7QxINYlCFSN8CvhvBI
	mUuHeXfcvdZDMTwU0aEfrDU2n0tXaHr5pXPCzgZKaH2Mb5McnitxDTe3b+IHNiOCxlqO4QINfML
	kv/FcM8J6TtS0yZoJ6R7e+aNMOsjPVLQZHSGQlD69Sd8xrnR+x8P2Eo/uvzyfKVaj01ZvwgfCrZ
	COD1JjTcBESBVLdhrEIKz+syaNzz9wtx/N3SMjxe+5r22fUP9tPpdvhbffZHJCAzn/57erfsxVc
	UU8B6V8b53+qB6x/rNhqdzUIFIQrtJxiTnMNM6IZmSFZ5Okj2Bog6BYdzpX4gVqDiusPm7bkmpp
	Lye1tv/IAQc08Oo569NE/QGGxx93exmBAE4/cKy2wtENhSxxR+sTMg/GSq0cv43NCLTiSx12Ep4
	YrHA3DuAnw7p0uked4hEPLJA65ThfoU+gJFGghXO//XQ==
X-Received: by 2002:a2e:a54e:0:b0:39a:fd6e:cac6 with SMTP id
 38308e7fff4ca-39fbb31824emr47436021fa.25.1786345015069; Sun, 09 Aug 2026
 23:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260810053142.27938-1-phucduc.bui@gmail.com> <20260810053142.27938-4-phucduc.bui@gmail.com>
In-Reply-To: <20260810053142.27938-4-phucduc.bui@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Aug 2026 09:56:18 +0300
X-Gm-Features: AUfX_mxLdCvPxJ92gnHLx_UxcvhKNs2Up4fndHZdjA36eDXzEudJco6-A7yijvQ
Message-ID: <CAHp75Vf2XCh9RZ6cT_ZAdZpT4mXmrYu+8CNwzpm_Ra4TrSZhsg@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: baytrail: Propagate errors from optional IRQ lookup
To: phucduc.bui@gmail.com
Cc: Linus Walleij <linusw@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, robh@kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_235657_278124_5281B365 
X-CRM114-Status: GOOD (  11.88  )
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

On Mon, Aug 10, 2026 at 8:32=E2=80=AFAM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no optional IRQ is available, while other errors should be propagate=
d.
>
> Propagate all error codes returned by platform_get_irq_optional() other
> than -ENXIO.

On this platform (ACPI-based) there are no other possibilities to get
something meaningful that can be returned (deferred probe). The rest
of the error codes will actually regress since the user won't have a
pin control driver at all, instead of having it IRQ-less (which is
doubtfully useful, though). Have you considered that scenario?

--=20
With Best Regards,
Andy Shevchenko

