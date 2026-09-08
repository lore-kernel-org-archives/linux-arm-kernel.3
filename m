Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7DFC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 23:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+3nLzSILAYs3qmpLkeoZcGFoXxWf/bBrMplbZ8qrRk=; b=3lt9B+lF0Xf803dfpQZaW7wETM
	89CAdgvgIh6mpEYLHjT+8BboMSjQNj9p7hwfIzJ+g9Peza/Nbb7Sh65za3HmcUryMGNXjHIGlmt5H
	UgGCOg0mrJTyHUPwVJAjr02WYczYXen6eBfxoNaHfHs3Z64jKsZaUUMTW8CJcxsNzWzij5p9pAGd+
	ZuJd8m9ARFpNH2CYn9fHczYC/jtlyraY/Tvxf9Cug8c6TA0ZPcSrnBl9yFri0NT033M5iJXEe0OOn
	uzJBGUknYweNx0HLHDdZHjDSY8XLm+8S61hpNUNs5RhtkgUw7lkgha0nTzT2/Hki4W+QI7VJ5WnjS
	2c7gqUTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x45IR-0000000AS0L-3mmh;
	Tue, 08 Sep 2026 23:32:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x45IQ-0000000ARzn-0CTK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 23:32:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7+3nLzSILAYs3qmpLkeoZcGFoXxWf/bBrMplbZ8qrRk=; b=hwiyxtGB3XMud7ZWFAAZmn3rH9
	LVEK05bRqjXG3vswkOgQwtkZqyjwy+w4VW8e5Bw3+CKsdYltkOQIcoWft1sWpgyLbDYi4oJGsrvEz
	m4Ig7hTY399G9YvsLlnB370mLHkfrIVUsZA20rsmDZAlIJQQLjnWRzeTbeWUvxQCJ7ot3dCaJAGo2
	a8T0mysnzGmFQBYoJhI9eZ216xneZU90Qd5zhqmCGrU62n5GgylKYX9xbPYGv8ufkANJbRxctF5Dt
	dqoWC2yYHR4jG3OSTUekFXDCHfWcyPDmEZNkaGEj9e2h0UCLnJkUKMFlYmkek1jerGk04j3+RCwAx
	q3TyZBZQ==;
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x45IM-00000000Vxo-3DDw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 23:32:08 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-6aa9606ddadso3627522eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 16:32:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788910323; cv=none;
        d=google.com; s=arc-20260327;
        b=IScpQ14Foj31YUmwfEzd+K2tmM6jdOoHxUfaUfl32Q8ueCg1IW7hkYW391sX+LS5cL
         xx13q/QWapXYzqQLBLw9GLJ3uey6794GEzzZ9ATiEiKDrJ4HFEkmexvwShQO+tvwAGnq
         EF9fkRF/wIoyR0jTo4aLqXbe3+PQxy7pu6VWilLK0Ru22zrEft4KAwEUzU7PH8AbnpjD
         8mPKp5BU+3VPJwDUSstDDs28l471HK5EERY73NtHyzBBFumXSy5y0ZER5Ycrm84A+tIS
         VeGKUqMvObuyf5LdJJ/x9g5AJAfxOrk72Xjb9bW5g35mzIPCvYpPLlzNFoGZR3CPsM9g
         8dgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7+3nLzSILAYs3qmpLkeoZcGFoXxWf/bBrMplbZ8qrRk=;
        fh=CnGbbwasi4ECTNx5UR/OR8HWIo5ulTonmp9S03js8tc=;
        b=KsoMjwk9mSd1+KoguDWCQS40RF/+H3DqUUlDAYOEBdK2diaQYpynlJm6fbf68otavs
         MCL+UDwWgn9nePdsOjxJXoaNjLb+aduYXeewEmC/CY25KKkjHIDBaeyFIEN8OtjCLHMl
         ku/wiC/759ATksLuAj345ncTUJ1Nt9c/mT2S5I6jO+g2mCGrvD986cXBZguG0B68UINE
         peHdBM/GYSpPVPoNfOZgv2XglCyrHoL3kieDM/pBmf88T3kco7e5VIkQcdXaDW7Cpv/z
         wWvMF7e4p3onGjyAu6wu35CfxW6ggBuUIbKrPpzikKALACoszxVmg9tpVweBIRh5ZKRy
         ROPw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788910323; x=1789515123; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7+3nLzSILAYs3qmpLkeoZcGFoXxWf/bBrMplbZ8qrRk=;
        b=snm2+vby6pHm29HLCZCju0YklV2H/iYM7aZMFluf715p7DA0OB9t9yoFaEprzGS2bm
         PPmoZKxs98wERKbMGrpRiXLIjLKhseX0/xQPEnotm01OsaVBy1bTh4Wqtw9YmmGOsWx3
         3felZQGEZkM5upFW81y4TBLsx6WV6UF8opGlcd+n9ZgMtbih6DUD96GHSxdWNn39PD4V
         O2Jop6OgMeMzd0kZGHdG4gTsXjn5sgOTtS7Q5FfqzRH7BzyZQZQfUjqWF5JQFiJroXhl
         2s1L/IPcdPf4t2eY3Y2xejKqaUwAEGAA/wZXPGB6UwzSDohfVlqdAX6TdBLmTB3UKiyh
         oDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788910323; x=1789515123;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+3nLzSILAYs3qmpLkeoZcGFoXxWf/bBrMplbZ8qrRk=;
        b=rHmYjoiudATLpLrwM9d4WUjU9lrVCfeeuhOIhVsYb7I8X2nSqrBvHuz1EvRW6NQmFF
         P5APoNY5fmshV0mNH3k3i3M1CpWXmmxM5roCvD8DZ4YsaRtiDUiGZ+soVoTwFsG4DAsL
         QjrEZLQcJwgelWSGLzFc1LCk8vT1yf1zUUqFFyz0RIUzlmWi621bJQxE/9PXOsoQciYq
         AChY6fcVwsvHBtS3aifXfegeMwx59jNKWzi09mJSkPdyXGQ6byuErPbpAiNfMTkFI46E
         Kqwe3/joHAmbZX7FKG0MPQMmUqJr5EIxdSFRBRBPEzXI1cq30E41sjohjocJPmarnrNz
         KC1A==
X-Forwarded-Encrypted: i=1; AKwUvBxzx0kil4iN29kK5Y++3eNEkC32N3tWkmqmPByqKuGPdH7yP8eQXS+BsxhEqmq3k+Iam7x/ItIJvKAfgtHg1zN/@lists.infradead.org
X-Gm-Message-State: AFuF++nduvo7IbVyZGx3E2jAy+0Vd2jNhvTOEadHieuvpdxN5r5YradT
	YwMugfH4ct1/oo5s1G8c3lmTa8Rpi9bDB02B7dLr+OzY4Pxhmcoor2qqaR9Bv+2gHTgEmFcmoYo
	gHxeNwGXT596naz3ohCVZgDI+9dnAa3CPjlZep163
X-Gm-Gg: AYBFou3P7N+EndncBfSsDKgyuJr1gOLWwuMZ9twFZrb3YEE/DC93rJMFZsejXcv+Ilc
	AQzNzn8/7igUjfL5cld4KM/sWdSMAFFudsYc6RQ3aiHSNzRGyWy9oDluTWLNLNOSGCXAwx4m8y9
	gFhkQC8BR0vo8Q5cyBgVNhFQdi9c2DlY71bhNhbGA3ORByZPqnYDNS/H0Qon2BS52KG5liyacUt
	bDu0CzJnF72xpnbkwMN0sbFMLrxcgJg9DnUSTmVK8pc6HFzC/Z8A6HenyysSHTOg/e5eDVwLEQ3
	lz61cK6Obv1kBXjFzsYA8qhAXX47F4pwN4yZgRJ9U4/YtB65T+iC5e5W1QA7D2dsdVC0egiLqDr
	ZKtZX7Asqme0=
X-Received: by 2002:a05:6820:4b85:b0:6b8:319b:9e1f with SMTP id
 006d021491bc7-6b8319b9e9cmr15317381eaf.5.1788910322806; Tue, 08 Sep 2026
 16:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260710172946.15633-2-rdbabiera@google.com> <ao3d2TlIRqxbz4WP@google.com>
In-Reply-To: <ao3d2TlIRqxbz4WP@google.com>
From: RD Babiera <rdbabiera@google.com>
Date: Tue, 8 Sep 2026 16:31:51 -0700
X-Gm-Features: AcwNN1Xw1Y5ryO3wQ35hV6_NmfuyHI7Zbl4nz0Z-Sqsiz6v2x3IDE9LAtXts248
Message-ID: <CALzBnUF14HuRhAObW+HXbaWYpPYzqG_Tt0rrm1nF2OW1T1OSqg@mail.gmail.com>
Subject: Re: [PATCH v6] phy: Add USB3 PHY support to Google Tensor SoC USB PHY driver
To: Neill Kapron <nkapron@google.com>
Cc: vkoul@kernel.org, peter.griffin@linaro.org, andre.draszik@linaro.org, 
	tudor.ambarus@linaro.org, p.zabel@pengutronix.de, neil.armstrong@linaro.org, 
	badhri@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_003207_206855_76E65B82 
X-CRM114-Status: GOOD (  20.53  )
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

Hi Neill, thanks for taking a look. Sorry for the delay here, the feedback
arrived right before I had left for vacation so I wanted to make sure I had
proper time to look at it:

On Tue, Aug 25, 2026 at 11:24=E2=80=AFAM Neill Kapron <nkapron@google.com> =
wrote:

> Do we really need a 2.5s timeout?

2.5s is actually the hardware default for this transaction, which I agree i=
s
unnecessarily long=E2=80=94I set it here for correctness. We use software p=
olling
instead of the hardware interrupt, and in the product's lifetime 100ms is
more than enough time for the ACK signal to arrive. I'll update the next
patch version to use this value. I'll also program
TCA_CTRLSYNCMODE_CFG1.xa_timeout_val to match the SW
poll timeout so we don't let the operation hang on the PHY when SW
finishes its poll.

> The dev_* calls throughout this patch should have trailing newline
> characters.

Thanks for the heads-up, I will add them.

> > +
> > +     pm_runtime_put_autosuspend(gphy->dev);
>
> Here you are using the _autosuspend variant, but autosuspend is never
> configured in probe(). Should this be changed to the plain
> pm_runtime_put(), or actually enable autosuspend in the probe function?
>
> > +
> > +     return ret;
> >  }

That's fair, I'll commit to pm_runtime_put() here given we don't implement
suspend/resume on the PHY itself.

> I think prior to this we should add a check if phy_state is
> COMBO_PHY_IDLE, return an error and change this check to phy_state =3D=3D
> COMBO_PHY_INIT_DONE to make sure we are explicit in our state handling
> to prevent issues with any potential refactoring.

Makes sense to me, this will also allow power_on to only run once in the
PHY init/exit lifetime as well.

Best,
RD

