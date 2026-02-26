Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D631FCE070
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 12:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h21jdGJzMzU8vMvLduJlltIbngyV6SpuNptLYZWQ7zs=; b=tGJ/OErraCSVtipB/cE8ozBF0Z
	lHOC5LN+frbngtBzqWBQO6HTEXIShzD7AmoPW56PecuLEZOGXGfSmRSVDRvcjQxCVX6EF84vwWC+U
	TsOd+AgAe/p4hRnX+ms8LXq0sF/uCLizBz1gj+kldW232vPgZogp3bLdr1BA5MAVrPrWs792j85kg
	XJed3OSNNjgkhilPQzqGNrUx6j7nf9d0pNJtCGKIkXUssarIQS00vKDVfhJQMlF8I6LcObYJedfjM
	68W16++9tBXu68hwT+vqAQYs2AHwF7k45qzwZE7fcGKMsX/CgUbYEi6ZTvWiARtmsv/H5+Rf6mDAW
	+Jua30oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvarG-000000069P0-3QDx;
	Thu, 26 Feb 2026 12:52:46 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvarE-000000069Ob-2TSl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 12:52:45 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4398f8403edso635184f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 04:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772110362; x=1772715162; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h21jdGJzMzU8vMvLduJlltIbngyV6SpuNptLYZWQ7zs=;
        b=CDEOH9FfZZdrGIpLnfJZ3EmXhNYuAdEGafSbTULlhWIKbH0UgRYvj4cirzTrpxp+Ww
         CyYLkpwhCOoy4qiY/rQMUgx1Mxhlk/Yf3ysPg852EoOmXZgoeI3gHiA30hkZF9s8LDl4
         JtLDT46Tt6+BktBPmGMeRhM8O4F25OBepo8JV3Mp2hir+fq0BIzGsFQ78Y8O3D4U+i5h
         NrE5x9RlMQkGeTmyPlDQjfAGlwu2mqiaV/Nyd0h4UTEDuPjC3Fhc+AJge00Bomqg+MqO
         AYDWkh1p/lszLmPy6/ZjL3+I83qA7pRPXjBBMxbWpalSdWEBI2HYmcq9reHDKm8lFWiN
         pe4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772110362; x=1772715162;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h21jdGJzMzU8vMvLduJlltIbngyV6SpuNptLYZWQ7zs=;
        b=SnhDQ5usgzTq6Su3SNRLPRQ6wZUP7Mmlvo1JgKxdacw5JBt6dBGIoJXA8MtE4DnmpM
         zb7xksL49UE260a6EIeFfPY9ysCIonUJRG2t7+ZCE4bSU8wrGeMgshvU7/WpYJPtJWGw
         dsumttMxmZ5Uh6ccATRsipKYI3lC12Zub6A2Hkx2gwCld6uWPO4m0FMX2TplOaFDDOVu
         ammjKVnvqFXvNn+TBiFG06H0zrhvxQgKZkKsV8YJkhKevT9w9GBwNluERpulwaMtCRMN
         4PMIFRkANuS2m4zx3Vl5aEF5dP7heDdEkbTb9hloQUHkVfvnmazLLq46HNsINygx/neX
         Yudg==
X-Forwarded-Encrypted: i=1; AJvYcCXUbuOYtESRZGjkicKeTb2ddmfxUhG4S/tYCD0PDbCwAHaQISMuOlMrE9LfDRKDl9GLrgxOqWmViOChzqg/UZb2@lists.infradead.org
X-Gm-Message-State: AOJu0YyLfPGANI2/4ePDGzeUPXK8InuMAiLqqQOZT39frBhfGv4nKeSK
	7kcidFKrtwBtJlBbrl2+eiLebiqW2DLLey67ZNBleIzxDc4S+0U7lpyjbcHs/z9n1fI=
X-Gm-Gg: ATEYQzy5ThhG19WzBEC4eV0rbaaweK8t4/CaAB1Z1uxSWho4L6xLwrvm1Yydl2FH0Du
	5p1591euhPFIyrRF+AaOP327J/26aYDKh1YsFGedNlb4tGdg4eWZg0X2hA4q9gDY9Q5Qr+v9VnT
	UlL+MpjL+SSAa1a0fDx3F72kktiMix4ARqdy1ZgIQTt5H7K1DtEDEAzMA/xeyRkriDkGA/88cbA
	LeEPgNCzxp6fY9qJd5IkCodQ2uLIz0NgaPLccbUs8w1WcmaHWPV71Grx/W7CiOwvLgJFFXXpB2e
	JOed+ikQAQ30vGWQKF4i8JbhU5Lg9BcuBIm66qKwr0ykeR/2Ba0iwJA6THUx59Y9CKpnlNgZF5O
	DgnAwMxpIFzbc6K1L0H7HHN+U5QNm+ivLk67roQEjkAKwjty7nLYSVaicQ/uAdhQ2DZ6lp0sMIJ
	bXIBFkuB2osFctFf526SBfQ7EKw8+HFw==
X-Received: by 2002:a05:6000:2c12:b0:439:56ee:d65a with SMTP id ffacd0b85a97d-43994302470mr8038842f8f.50.1772110362338;
        Thu, 26 Feb 2026 04:52:42 -0800 (PST)
Received: from draszik.lan ([212.129.82.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439941a2d34sm7596696f8f.38.2026.02.26.04.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:52:42 -0800 (PST)
Message-ID: <92969f1bb04f41c2ad3b9a17d8ba652defa2a29e.camel@linaro.org>
Subject: Re: [PATCH 0/3] arm64: WFxT fixes, take #2
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>,  Mark Rutland <mark.rutland@arm.com>, Ben Horgan
 <ben.horgan@arm.com>, Daniel Lezcano	 <daniel.lezcano@linaro.org>
Date: Thu, 26 Feb 2026 12:53:31 +0000
In-Reply-To: <20260226082234.26707-1-maz@kernel.org>
References: <20260226082234.26707-1-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_045244_649821_7493B2EC 
X-CRM114-Status: GOOD (  16.94  )
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

Hi,

On Thu, 2026-02-26 at 08:22 +0000, Marc Zyngier wrote:
> After my previous WFxT fix went in 7.0-rc1 as 29cc0f3aa7c64 ("arm64:
> Force the use of CNTVCT_EL0 in __delay()"), Ben reported that it isn't
> playing nice with preemption, due to the use of the timer workaround
> percpu variable. This series tries to address this, and propose a
> hopefully better alternative.
>=20
> That alternative is in the form of a new "virtual counter" accessor,
> available in the same way arch_timer_read_counter() is, except that it
> is guaranteed to be the virtual counter. This helper (a function
> pointer, really) is updated on each CPU boot in the same manner the
> counter accessor is.
>=20
> This is then plugged into the __delay() helper, providing the expected
> guarantees (and resulting in a much nicer code gen).
>=20
> Patches on top of -rc1.
>=20
> Marc Zyngier (3):
> =C2=A0 arm64: Fix sampling the "stable" virtual counter in preemptible
> =C2=A0=C2=A0=C2=A0 section
> =C2=A0 clocksource/drivers/arm_arch_timer: Expose a direct accessor for t=
he
> =C2=A0=C2=A0=C2=A0 virtual counter
> =C2=A0 arm64: Convert __delay_cycles() to arch_timer_read_vcounter()
>=20
> =C2=A0arch/arm64/lib/delay.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5 ++++-
> =C2=A0drivers/clocksource/arm_arch_timer.c | 5 +++++
> =C2=A0include/clocksource/arm_arch_timer.h | 1 +
> =C2=A03 files changed, 10 insertions(+), 1 deletion(-)

FWIW, I was observing similar traces from various drivers and can confirm t=
hat
for me, on Pixel 6, the warnings are gone again with these patches applied =
on
top of next-20260225

Tested-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

