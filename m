Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F479D0BB7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 09:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Vw44/IGDHGVtbRZSIkwW6dgCJnRfKhP9Fg+fqXK0gU=; b=w/7Djr57y56jdAf8DUWx9/Ag9J
	HJfLCR0ceOit1+wG50t04hISv19rlRgSsAMYIqQ7JiKd5Gz4ttqZEtJ9AJ04s2RlgumNjwxoZh7ak
	bai1Bxk8SiVdOpgOA2i/04jB4IhCHs7T20LZmxyWpEguRCge8WcpA8aHWikVf9IBcKAobxe/1pRf/
	orq6Zbd2htt3XWoFJLulJOLWDM+7AiP5Wv6qd//j/ROQxGtfMDICQn4ZW9KfnqCJeHaT5nM79i019
	gt6/9/lGYLUU/YdsV/YGhzKnXaI1BxcpjkGCGePuTTnBdd/VxJhxcNdlBkKkn4aBgQk27vSuciVwe
	XRUAge1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uHp-0000000HV2u-0TfJ;
	Thu, 24 Oct 2024 09:37:45 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3u8K-0000000HSWE-2CM5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 09:27:57 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2fb51f39394so6709071fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 02:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729762074; x=1730366874; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Vw44/IGDHGVtbRZSIkwW6dgCJnRfKhP9Fg+fqXK0gU=;
        b=VrZpe38DEDxwkGFqj1r5m3x00xo1K6tCA8kE/AafTIe1Lb7AE1LrL/gyJGH0Zu/6ZI
         8SCk1i6f6FlhKHgIRtyvbp4Nb3AJNLuLjui6jPeFrp6Vdl9CPshDhlWL+goyi9SUDZ22
         6m7lPSD7e4pGcFz80DoB0pqlMCvUKAQCxkExXDdVnfDrgv3tRGYCCt2MnBwpjKkUKw7v
         OprARhp6i7BKnIMc+VmqBTShO3pqVOcrprqqE5A3GCINZatsIFdsY8xEcGchuhZktqL2
         n1J4I/hHBxnkoSzZTMhBPA762oGg00+xIc3DMMlx1GvmUXR2qZmWI9pXiuklq6wOzCAV
         fRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729762074; x=1730366874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Vw44/IGDHGVtbRZSIkwW6dgCJnRfKhP9Fg+fqXK0gU=;
        b=sBZtNGx9+T5RuIpiNezRF92GMnI8g3CSM2OO2VLm1tWwSO9kJtD+qbgZl8bASXYk4Q
         IOJZcNdtcV0iyPlcN/gf2T9FyhIO2Lfht59bL1B+oQVonLhnwLIl5uwZlli1ERgC+Ixm
         g0J2tMozh+ktWiCy84g4ebrmZd54tzHS/TU9kYXhJ7s3H10II7aIqTI1GuztSkGwuxNb
         TzZH9slVCjchFz8QYirPp6xuQPNcIUPRTrIbtghcTbIccgAYgYjrTdSlDR1AwZGQvWzg
         9qWfK+wXPkjzZZohzTYe9+g8JuPQzq5u+I22H/v5ldDDLKv8PPKSV9zqMsmLUdTlMDGi
         /miw==
X-Forwarded-Encrypted: i=1; AJvYcCVUR/6gl+7i4RMu0zq227LLLZjWEL7KeDvoLFdNFi54v0HIbKc9t1p+fMBQD7rWWJeXTV5vPhWyY4Z6gh1u7oLX@lists.infradead.org
X-Gm-Message-State: AOJu0YyYIh+cAxQpLKxDdMV0s+sf6AQ9rcPqW/GpbgTSc0OqsIz4PGIA
	MeQcqBjw51dhrRmHKtSPU/Om7WcFAkthm+tJKco6DPMLXitTzf5LvjQQpKQchq8f/e6TNREHzMr
	toRoznHN4L/pt4NjUp6CPK1CnefwS4qSp/jqbLA==
X-Google-Smtp-Source: AGHT+IHetJOx2pidhQpRaDpIjNHeL/hydkQIWL3Z96hrsPJKCCIgS3TJEmBSK/+jaQfDgZHeC3TUOPN5XVLUK3SwxLs=
X-Received: by 2002:a2e:6112:0:b0:2fb:5ac6:90f0 with SMTP id
 38308e7fff4ca-2fca8264708mr7213521fa.34.1729762074061; Thu, 24 Oct 2024
 02:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYt86bUAu_v5dXPWnDUwQNVipj+Wq3Djir1KUSKdr9QLNg@mail.gmail.com>
 <CA+G9fYsMg0fA-jraEvC==0a-22J97o-uBmbLJt16_ZKBpOT8EQ@mail.gmail.com>
 <4730e562-7d14-4f12-897a-e23783d094af@app.fastmail.com> <87bjzalhzc.fsf@draig.linaro.org>
In-Reply-To: <87bjzalhzc.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Oct 2024 10:27:43 +0100
Message-ID: <CAFEAcA_+9gA3AqJseY5=5hHOA3OjuGS8bjbGMbpkzFyy7Ggzyw@mail.gmail.com>
Subject: Re: Qemu v9.0.2: Boot failed qemu-arm with Linux next-20241017 tag.
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, qemu-devel@nongnu.org, 
	Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Aishwarya TCV <Aishwarya.TCV@arm.com>, Anders Roxell <anders.roxell@linaro.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_022756_595450_0D4E39AD 
X-CRM114-Status: GOOD (  11.40  )
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

On Wed, 23 Oct 2024 at 20:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Agreed. However I think we were masking a calling issue that:
>
>     /* Actual RAM size depends on initial RAM and device memory settings =
*/
>     [VIRT_MEM] =3D                { GiB, LEGACY_RAMLIMIT_BYTES },
>
> And:
>
>   -m 4G
>
> make no sense with no ARM_LPAE (which the kernel didn't have)

QEMU can't tell if the guest the user wants to boot
understands LPAE or not; it just provides the 4GB
of RAM, PCIe window above 4GB, etc, and describes them
in the dtb. It's up to the guest kernel to correctly
handle the >32bit addresses in the dtb, i.e. if it is
non-LPAE to ignore those resources it can't access
because they're out of range.

-- PMM

