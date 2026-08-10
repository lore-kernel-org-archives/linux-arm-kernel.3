Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0623AC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 07:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Vyr/Jv7jK4HllQmorQFVSN5kvsKl7FtMVXtkglpHtc=; b=uqLqNFyMFhpUOTOcm0kxfPGdPj
	m2p86otIS3XoG2sILYCguH1YPwsSlBOspFF8Eie5muSLTm9cH/qwhuPv53UXygRg9zJEBgH+Fq1pD
	8CG2jAWb2hYJL6SdnVQ3ivVEKlvS8tsZpA+eFQSbGBVed5saHDUOdW8oCNz4wAAEcbD40OHd+q8oe
	hi4+PbK1encig08DLMJwKbOEEL4atzWXHhMruKlYIuzm4lFFyWzVv5mhMEKHzk0rqhO0T4gmG0Ud6
	Bu90sDLAYMIGRd2fS4YZZ2WdsC90qWN84KublO6DJ/5xtFolViDnufOwoEsGKNuH+TJ8qEBaIpTAV
	YKTamHlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtK5s-0000000BAcw-1KWz;
	Mon, 10 Aug 2026 07:06:44 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtK5q-0000000BAcZ-06v3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 07:06:43 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-39faa67fab8so9628641fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 00:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786345600; cv=none;
        d=google.com; s=arc-20260327;
        b=BAEnbl1ag+DnkNAhrnPMe5jUY8PhKNzp6j9nq6Nzzta0dbfoE0Sxb92FzSqrBn+wjZ
         CZteSNleLSMcXMM9sYodKHZ3o7KetqCi/PNjG6LHsPVO3IsAa/rUYQs5Y1WVBOV7bpze
         j6hqQubRH4tdOojvOG4C+ZHOWuTN7hlID+MCS3AOo4M0jMeIzyaFPRj3bQ6t0FWuGgKs
         ipwlezJKiiX8Avja0WnGGJSpDiANn1wjXTTJkoHSVVn9bwFogmymFPZ5M9hSWb80V1OB
         Gp6ZDwULHzZv7Tuwu34m/gojK8cL5YQWBXPNgoRtm/kxWbjy/JeTInejpnh0sz9MPbs2
         ohRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8Vyr/Jv7jK4HllQmorQFVSN5kvsKl7FtMVXtkglpHtc=;
        fh=I35gX20MEZYrGpEC/X+jx6Vx01dvEuYHBYMJSIvQlxc=;
        b=d+BcYJJrmjDNc9dHKGf6NC9TMVIEzyVZffgCcH1xCDaFIBHEtV5r3o2Xx7ADahGUxI
         W+icWegTISgfwLbsWEVC9L8DzjjCd60bkea99+OjlcvijPdIC1AvKIUQms0aPd+mSTJU
         qjXL9IINIByZ3q2HsgKCE77KTprWCCOX6MR8ZcI/Tg9uQQYBkok0qLq9y/OZYTX8qcMg
         iE39co00qWUYHr746ZQ377uKj0o99K2RTmB1wBYNKDM55qdemAli6sKTwRfpbE9qJqoX
         AppxlcTd7nkffjO5YfR0sm2jIOQ9NtPS60d/GoIXK1aqmxXsHLteG814o61421dPoC1i
         ngZg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786345600; x=1786950400; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Vyr/Jv7jK4HllQmorQFVSN5kvsKl7FtMVXtkglpHtc=;
        b=BD4241M0v6vSPof4GsbSn1ECXVE6ca+jsl2XfBySdoFEpcsukqYHBvN+DLSVgOPbCk
         zPuajrZgtSyEHZaUQ15piAjNuFj2t1gZnHLUTZEYw86X/kX7rfkp1rAjtGN4ka5a94zI
         u8tg+1S3qzq2DfZyc387BMeW4/+4eGGBOQ5ps18FmRUnBRAsLRSbuQg/iW/8HVj/kSk8
         s4yrlzLCBwse/8wJhQOl6TFB9+3V9E8mX2kHUg8H6tUIePbjq22nJQE0OYc/nPAYEa0S
         8gwH51gd+Uaay2klGpMB+NDyyAOS/HWM7IV3FwNPl1DII8fbjQQIH2Eo9atqIV86QdMR
         E7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786345600; x=1786950400;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Vyr/Jv7jK4HllQmorQFVSN5kvsKl7FtMVXtkglpHtc=;
        b=cVt4xAuu9/ADy8RivvuOtOSl0y/tCjpWFk2q4w0WmlefmG573EZMGZHW9tgMvQYnhX
         d0ChFACWUSyZMvlXW1xQwLEPuq5levBBi4KP5PPqa8ewfr0I5vhTWyQTVVHP9SUZ08JC
         Io1HZI2GoGaTnrgs6nrss+ISZJOM3Ryf4kU5sL98Ycu2gXRIS7jM6ruYTaMfqwLyoj5V
         iylg5PyaAAJiTXkJ/8aMJhuddI+Sl2i6H8x/7/vZZv4Tvt88dqeJEB9zb9RqJR0GQwxj
         dThr7gXvifrWe1R+bzJRCOjxbHCucBtGA7nhfB25ToFoxkQGUpPfiLyAcrIoXgv2ugjZ
         1JFQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZLcKfhR/WjeTccaefYQbxRawJJBOnTnv2nE6v8vK+9B+Nf92TStn4GNH7mpqh7hqHAn1jvNGW0Z14OjkrghPU@lists.infradead.org
X-Gm-Message-State: AOJu0YyQX136T7DGo9rR+PQggPvBti8w5Uzx1DorE/VP0T6rLCdH7Q0r
	TlvMtLbUnIdNQ3B1XP8MeRbGpTjZBnJ/rzjqTTCANfjhBqDI1cfQW33115i7ws7UYGr61IGiBqv
	MmBUT/U2nF46c0RTo8neLUp+tyOYC7Gk=
X-Gm-Gg: AR+sD13iX+3rakW9gyMd4Q30RDspRob9TXXbBDGxLljIsFG0Foab8xdrd7ouf8EZ79g
	wqkWKCbQR4rPOTVHPk/Io683rOJIgTbd9X5vbTWX+0Tvhm8BmoMilVb9tSu6vlXhO4+KgwHenWE
	ab6wN6BCN2f3QNf67g/WYnI1Ek+0Q+55HLQDg25Cxbrics1FAVqxMZ6FwJgvJ/Fpu1OC1dONsZS
	m2L2VoqlUkJWGcWHEkyGmRSw57aM+OEJV4gNlUnGMaO6qk4R/NZxR40UPrRyu697GQiWO/tg1rK
	zEIyZgGSXLbYjHz0LvJENNw3mrooBmv+wUCa8w72c5gjJ+HA8Xovv9Xcv2/ScrBNtfWV5xMwTRM
	Q6Fwh8NThVC4x5vkrg0X8m45hfkUczQB8JFIpIEEVGyBz5R8vOGh9t7ZSc/A4QCuXz2Xrll9nFz
	mT93I+2z4XcfWjv/n6XQqRneBGf1f+km2+8B/qa2BT2Q==
X-Received: by 2002:a05:651c:515:b0:39c:628c:15ec with SMTP id
 38308e7fff4ca-39fbb20370cmr42017491fa.23.1786345599591; Mon, 10 Aug 2026
 00:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260810053142.27938-1-phucduc.bui@gmail.com>
In-Reply-To: <20260810053142.27938-1-phucduc.bui@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Aug 2026 10:06:02 +0300
X-Gm-Features: AUfX_mwwgXVwFIJAHgeFASTJpkj6tyq5vvwg3fFo1Zsxr234OStIioODHNuDBEA
Message-ID: <CAHp75Vfj9XdGY=E1-nDXhwu182b1ikoruzj2dGSp_H6kOo0SDA@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: ocelot: Propagate errors from optional IRQ lookup
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
X-CRM114-CacheID: sfid-20260810_000642_107617_A6985AB6 
X-CRM114-Status: GOOD (  11.02  )
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
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no optional IRQ is available, while other errors should be propagate=
d.
>
> Propagate all error codes returned by platform_get_irq_optional() other
> than -ENXIO.

Same comments. It may or may not be okay to have such a change. The
less disruptive one is to check only for a deferred probe.

--=20
With Best Regards,
Andy Shevchenko

