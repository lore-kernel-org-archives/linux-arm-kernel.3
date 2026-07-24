Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389B2C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 12:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEXE20UjUW8jHA9L8lniOLjS5XVJAtQYjXALCmuoPVQ=; b=FVv+zJoSZ0vboH7Kg4g5k98lR9
	GY0yJhRBiRQWrAn+e16e7EmyKCO1ktughi67crs1tjDuUkYAvh95Eib7V2urMuYjMm1QyjcArJkFY
	yQDWy0klF3gOADI+QsWP7EQorMn7gqpTj0lRzhBLpEzZQjNvy1mQwzC1g0nHnYsdczadkzHytfyVo
	/43q9LW8Ot1tLe8PZUqKU1HmwxAaM99WH5tJw/PkpKeEAtV6A6j/ZL+cY1tWgzG+pBIshQP2j5ffE
	Gpa1bEzL4gNUxcFAT6Njb6pwDzwu5n98mFpEORsRN4cl34BTCRh3Zlrq7QYuQDbaSOD5S7XXY1hS5
	3yguHnFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFA5-0000000GOHF-0Pmu;
	Fri, 24 Jul 2026 12:37:57 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFA2-0000000GOGj-2NYR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 12:37:55 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5b0231a3e86so346334e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 05:37:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784896672; cv=none;
        d=google.com; s=arc-20260327;
        b=GKM7B5UWd5m9b2Vg5uB/ydK5MXSzPvZuOgnx08+/Fg9MwEGIO8TWkgliR1KzpKGtfk
         yom6vcLkOwwdvHu0DAEbANNZZSVuTboFne2+Mtc0pR6s6JS7TXAgjn4oxqsau3t4JtSz
         SVb+BUhbatPMG6/P6OonehBm+SYGPCWUMJ3vq7MpId19JB14sC6HGicA5q9JxVJtETjj
         9P/vpOga/nRjtlUCZna8CC08B0WNcEGhNC5cV+nxKCn2Ufh8jwKWrx/03otq0PanQWHk
         fXaXmn/mdxwNPD/BQYrn43rZ9A2U1jtrAQ8bAHLp6W4HfHXOiYFg1aCSxihQdkVi5W3G
         f6Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vEXE20UjUW8jHA9L8lniOLjS5XVJAtQYjXALCmuoPVQ=;
        fh=SF19nsk4S6rITeQJeLyBc96d3SYZaZWDuzKShgycMtg=;
        b=Ci44XyHPO2TwRjlvxEZTfYsiJZwU0zHB+RKfNROnET0IYLepSn8sy63yh8k6qPX1jy
         nM//zcBdhu7qKqkRxJkxclLsVq7cFGU0jt3tgoZ7rhFjl00FgX4A+Kjxj7fxn+1kj6Fo
         7knYgUo/bNhjuzGlygwdiH8HDDUud8DngtoC36xJ1GiAVIP3RlG/vqkuC9chOkRHt/J7
         qv9GEuhXnfx1Mr5pbOtl8rdWgiIyqMd/Vd/zogUOM68dMJWsLjlQSRdJeMC6RNuDYaXJ
         n8in5NXiOn4U/dGw4QUChUwnSmu0fRJYHmOPoF042ETAEfrthFN7ar/iBOZHMMitRAvQ
         L+zQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784896672; x=1785501472; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vEXE20UjUW8jHA9L8lniOLjS5XVJAtQYjXALCmuoPVQ=;
        b=ZiT+WM+iBmEH4u8JizxHTR/+HLYAz92LniwQizIOUoCNsYi4uYylaFu4VoHA1JiiHk
         5lKneh4jH8hqDldaFJ2fL32tyy1thGsCFbBoZdGbkzogpWMfytu/putaagsKoDuwmp/3
         zVFScrOht4af1dohwhLJArS7qe5ke3Cmbva63O+mMqS//E93WS8DvjpvQ6GAvuaWvUKg
         iki+J4H3KhKgUBFlmBRiU/P8r3qe+peqnxQzz+xT719VSL64ZVTUqPQIQqaKtgu/TPsI
         xeVpmwE+1IJvSVqlAZbsZQaE9iXXtTioRSrExkcY+6q17iHw0CMMeBqyJ4Im2RWyvQ4b
         Q1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784896672; x=1785501472;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vEXE20UjUW8jHA9L8lniOLjS5XVJAtQYjXALCmuoPVQ=;
        b=k0deor4mmUfBeQrSDx03TxA2NMooOQfUwfPb4uKnOzi/TNw1VD/0BDyGXbO1XZLwad
         j9YZOdEk6Al4x6cX4jGt1Hf2JRb1SbPqusAW2nmrpVu/CzCPUr/Cp3X3Cqnm61UdVxxe
         OT0q7uBmD5sGrCI59JHmwt9YfmJxJNilSlLfkD3E4JYq9LkCFup4JeN7Wm1Re8Ny8dVb
         NFejb3fTO8mAuXdRuWrQn+IT+vcZNzKa+/cAdIFHzzsKuQW7ymJuSH9Vg9yzhZJ25kKO
         saK+ezEaO+k+/x/jgaWTlGLIW2bfCiTZclRgv8VTCeU8jI73TZ2atSyJt0Yd/VF11lTz
         Mu9A==
X-Forwarded-Encrypted: i=1; AHgh+RqrYnE01m1Rs97U7TeCQzTJ5vdBXWvRhLtTaveLjy4RucNdxJ6wkf2yfBJXUpUae9JCEmrYepmN3ct87RSgRRz6@lists.infradead.org
X-Gm-Message-State: AOJu0YyK4RRnU4LapBv2PcshVy+E+5OPZxXnSsJs50f7XWQcTV0gABaQ
	FScXPG9JhdPqBc/8DpG0Zxj05/Jn+psXEOm61wCItBjw/ougIc/rhbAgcHLXSTiJg5eVKbYLRei
	aH3htPYAROlb4nmvZNT2s9S8Zs+kVGv4=
X-Gm-Gg: AR+sD137GY1k56bkiwlLMOM9aulDS4q9KOtcP0m8q/dqd4WXUfZrope6KWCF6Ix7pkL
	XIUlRUln0UCK19X8fYjltBSz4Wy5pX2+SQJE0vf8qrz4m8ABXg6dEcCc0kz6qDHNhQ9TtGoiyfu
	U9Dil/FB5KTJvfd34dx9g4U5nwc78QAFvLXrhpCCh9n5wxjKCCLcy81C1OhsBt36nqujlE1syjU
	r6HK0kAPPABU7fNB+uwBBI9cD5r7NO9WgMb33fIOAUYRNfKa3vFwCZXw9sz7udbYJrQa3koScV3
	eW0gWRGIlpEKLaPZv+p2RHKWHBc/6VG5KnyM8pdPZmHRPwqsECU=
X-Received: by 2002:ac2:53b6:0:b0:5b2:b004:ab9d with SMTP id
 2adb3069b0e04-5b2b2f6a707mr1282684e87.34.1784896671507; Fri, 24 Jul 2026
 05:37:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260724103212.41821-1-stefano.r@variscite.com>
In-Reply-To: <20260724103212.41821-1-stefano.r@variscite.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 24 Jul 2026 09:37:39 -0300
X-Gm-Features: AUfX_mwgknCi6WlphIv37dVpUoZ2x-w1U5-YTUZhiBpTOvf3BDpn5nA4L3y60I4
Message-ID: <CAOMZO5CkN4DidYgfMqMUuZ6mKC7VPR4Rq_Ux0kvcK0t8HhgqOA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx95-var-dart-sonata: enable in-band
 status for SFP
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_053754_651752_711D323E 
X-CRM114-Status: GOOD (  10.12  )
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

Hi Stefano,

On Fri, Jul 24, 2026 at 7:32=E2=80=AFAM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:
>
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> The 10GBASE-R port is connected to an SFP cage and requires in-band
> status handling for link state reporting.
>
> Set managed to "in-band-status" so phylink can manage the SFP link
> through the PCS.
>
> Tested-by: Stefano Radaelli <stefano.r@variscite.com>
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>

There is no need to add your Tested-by tag to your own patch. Please drop i=
t.

