Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486EDCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 04:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e1OWgpFFIxOk3dfWQqvqIcjTsWA7OcstglsC81FCqyY=; b=elX9TONdgkwo1yke8x4WShsQz+
	5rAk8FuxHoxkXEzwpQDsfhy3B2c5o1gIb14C6M7AkxJTkzwKTXJ0lLCySOwPHppEHqAuAG/rNrypS
	LNHiHKiMpFIPO9+cgn3SGxURABEEV1wMPUeW2At/A+AcMZSc/bch8VFFdgfifRi2+/+4BcdmDN+pC
	dpAiLoR8GXU9+gIr7Emzvjxd2KIJFz7TelOx7uLmqFXUMudTlwJXYsHBWodMQEjt4Mql9v6AF8HpY
	BiE9SR8qgyUt4N5jKhvDseFVoXe2kLPcwEX2nLtoI/mIXAuhTuMQvKKClCP0qoML21lMGlsMrU1Sp
	z5i48Phw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPY9T-00000003Rlt-1kKC;
	Wed, 20 May 2026 04:03:23 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPY9Q-00000003RlA-1WiF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 04:03:21 +0000
Received: by mail-qv1-xf41.google.com with SMTP id 6a1803df08f44-8acb3daf2aaso76676616d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 21:03:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779249797; cv=none;
        d=google.com; s=arc-20240605;
        b=HZ4258bk/jlcq4sqpg+Lg34keUzkDZQpPVLaTaZyi+IjyIEYriRPCaz0yl+C50UFDV
         EdzzYrL6552jAt+Dm+ePeZkVJUL4I7s9WwvYv2Jr7gkgPGS5fkh795b5+K8gYt74VrXI
         yGGqB4N/uO4z3+3lUZnTuwbz79ahjKEEbbhqVBOVu78RlI06ozIgx0/AYYgV+jPldT4K
         KdjDjZgyX1jCUn5NmFQZQBuYJuoATHMOw/yO45aJnujrSISgu2dy2Y79bXUoI88jix3+
         MDx6CGjnov8gAN1MZu5Q2GQCpSh/XnXBmcUugWV+GolcsTivxIid+SE3IfDMlcxrC4en
         UCow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e1OWgpFFIxOk3dfWQqvqIcjTsWA7OcstglsC81FCqyY=;
        fh=0HdCF94co/Cf9jak/Z3t5wEQVpA3tiUvXuxmZJWPZI0=;
        b=Tj8OZfDwKLq24KQPMXGJJ72bQpAAU51we/Tu364ZhL9EAR9x0aPpf5Spc3MMTDOX+Y
         32ibSeAUb0YERApB7dLkZOzSYEQqQynWyK7W63v7bdXVAaeJ0v7elVfIRRKQ3rcdneN3
         chXBxmNwFs4EjSA5gTWCFZ7rFpNKY47leSxBzvZz4003aR27Ve/ExdZn88bTuJNqrWSR
         /+V10Uq55hK2vD1ePEK/BepA8y/Yl9lc1R/sp4+uMd8zE/igxIyuMBOixDlMab0YuHNA
         N4wh5CBiwPh9y+4KPpWSa+i7FsVLweZaLtgOXPEnzM/09CCS3uHwVP1bCXzncTosmWJl
         XHXQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779249797; x=1779854597; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1OWgpFFIxOk3dfWQqvqIcjTsWA7OcstglsC81FCqyY=;
        b=BTKj7SW9KPS+1VTax9K1OEBUrUcJYx9fnfgEfuGYTY4enTE/3jj7kqp3b+8RtMWbs0
         18o9I6BqWllcav7//Nw6Nf6HgovLTpPV2Ji5hFTsPwfHsqCSOyMxgi2Q8W4SSx/hVu+E
         pqew8Aw6S6IM5V1xQSMv5pk3vRPBd427npkhO+onVUoKCo6u3mi0+aCx6cvhaiC1pr0N
         KxYTbkFA+h/jLQvUNTlQH+Wewja/2+bLNdoenwbhboQOQpSZgRgaH3KxXz7/Gq0BtWI3
         sIQ2+VxmJEwwpR0rZcR1s52OcDHjTQTwXCiRm7bsB0yGz+Fu/fstQ7iQfbiTwhcNS25v
         exPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779249797; x=1779854597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e1OWgpFFIxOk3dfWQqvqIcjTsWA7OcstglsC81FCqyY=;
        b=lWR8qEgTuVWZZlYHdCJn0Xc25jwufxsxmvWGKDoRj95CQanhJ7XKIbfNsT8Jgdli08
         MJlcVn1c0LPgVVfLe4hiB/loDFa9Ej1j9kD8f+JsmNW/1tjKsgVlf/Drp/EnZyyHMni9
         9+6/QqezjJxfee2a3GIRM48WHpBWQbtitzsA0/kvEvyOOo790zHcIHRaAtBp+79mSL02
         4GczQvop/pPgiUdeUqczqo2QwAyFgfhVPh/h/tWd8IavuZde+rX/s7R9UXc+vgroIpk4
         CJLygoad9qGv6pxMVyKkGjaHdXeiPWbTJBqgys/prY77L0UOO/d2yJ+CmmVB9cAwJTzX
         aRkQ==
X-Gm-Message-State: AOJu0YxVtnLOw0ZX4zGSCCREPzxcsCIAJISJbAohztMcsXF3mm4kODmm
	Sk0nxQ8IWAqvnZKdgjMnUfvvI34ywUBRVIa4ObS7Hqkc7taJkxawer0js/pcAASFxPBvOLeC8md
	5lZztgU0d1AqSKoEaRAMix+6JYpywbjk59QFJaOZGVA==
X-Gm-Gg: Acq92OHwi3xS6K4pYhsF9EtNCbFOCUXczusBj2BS4MNGfMqeOW2DjHHiKQimMXHMf1N
	Uq2endIXzs+0wc35DSfDI6pghAmdpSQxp+bGvmn/Z1lelh90FW2fXKaNxvDhgd3DaBAgoHUrVNI
	y2Pi28YwGbRv64wKsFUV9C+HU/WgLJCAWGxcaKIwEuXJExF4nh3sPSDZ3iaGd45Y0zg+UdOKtr6
	LUYAiNMwNHMBgrt9EMqkw6aHwEablhg3zngQav6TuOj6ODrnAKyzH9GT/IqD6ZAn+Q6IfNlmNFA
	74RYWMnScOtS/KtdokLPilVhIo8llEWUaig+P+tscVZDqH1l+mEmgDgISJBte7qaDARs
X-Received: by 2002:a05:6214:4389:b0:8cb:e63e:2a3c with SMTP id
 6a1803df08f44-8cbe63e3005mr34797466d6.1.1779249797374; Tue, 19 May 2026
 21:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260517025348.96906-1-enelsonmoore@gmail.com> <agxToDJ6y_ciI1Oj@willie-the-truck>
In-Reply-To: <agxToDJ6y_ciI1Oj@willie-the-truck>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Tue, 19 May 2026 21:03:06 -0700
X-Gm-Features: AVHnY4IY_fMI--BuZa7VRLVP5pFmw-knlMw-E4eUheCxJXohulDPvypeyMWMXpQ
Message-ID: <CADkSEUgoQvEHak-wxp0mJok_6_PgraxqZcDL4aut_MHhpYXoVw@mail.gmail.com>
Subject: Re: [PATCH] ARM64: remove unnecessary architecture-specific <asm/device.h>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_210320_411676_612B54C0 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

Hi, Will,

On Tue, May 19, 2026 at 5:12=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
> Do we need to add a generic-y entry to arch/arm64/include/asm/Kbuild
> so that we pick up the asm-generic variant?

No, we don't, because device.h is in the list of mandatory headers in
include/asm-generic/Kbuild, which means a header including the generic
version will automatically be generated if an architecture-specific
version does not exist.

Ethan

