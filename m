Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E964FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 15:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPUu0Cm27qIygZI4ma0gwbXy+SSkhZVphR3VJlTtVS8=; b=rYFQqP+CvvUqD8YTqlMljf4dAB
	sfJpLyOQntYuTAWH88pPh08tGp6DVFlY6IahEThWZMNxanq2xgVrHH8oRQXlvoJbllq0FMZFmhsAm
	wwOzM3p9JMuE755g1gLjuoLDqOO3CruXTls0liapHApv2N22Hl8W4I8HFqY2Lc+86SUwDHMaBrEpG
	J2JKovw0N+j+kwjWgg5cM8/5p9EPuCGpdB/MxH4qdoRHgdlej0ngLp/cCGJmumZUGwC9ZsGGMVIxk
	5h71CWwwCYUMZZVPE2CTjNv50XITWWwmXCYKosg4bdekIzKnPjKhbdk6le0+ZdwdWyA1XKAh1Exn6
	DSRMvPIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH1Nf-0000000FfJZ-1FxP;
	Sun, 26 Apr 2026 15:26:47 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH1Nd-0000000FfIj-15Ar
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 15:26:46 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ad4d639db3so46106615ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 08:26:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777217204; cv=none;
        d=google.com; s=arc-20240605;
        b=FV44eqkETwDh8ezTgv4RV6tFvUKNxObCruIV+SYZNzlytwRBITjf8MlWw55edjI/Br
         iuTw5aelXZT2zx1K8T8QTI5novdoiir/1e+KUZIQ+bhXvhkYSBE028jI7gN0F69H5Fv0
         SVUtOhmfyuq6FvFcQ8sHSKaclWDePRWmLsfytwIOSU+bmIbOstZCEznegxV0OQFgALJm
         aG5369hUsoAV64n4/YVJycLa0i+MpoEgiNcFIZx5CarNwKLEvZ+EOYwNjDYJasjM3PcL
         YOExWgDcJahcA4j8DKrAVZKphW3MHdBkoCymMe8YZO9iHLftU/e7TyKS9UehtnI+XYNW
         sf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oPUu0Cm27qIygZI4ma0gwbXy+SSkhZVphR3VJlTtVS8=;
        fh=2KFH9omt76sVwcaOrHkGlT0xcNFMffwhnl5QAzVu0do=;
        b=UNo13yEraspx2v1Qvfm4VTqQJmlF0hz6QWZoabDtupQfha5CpVd+2JoavdmR6xouLs
         G/UZ99NNCUnsZz8X5twyqtDFU7j0ahoWEVmnzY4WjN/USGjpTcsmmfKT6I1IkaMmCu2K
         +S9Q5pG1fi3GKrNfMor5b/NTrHxx0q1Scqj0zKTYvLILcfeEVk2AgyAFgVcdPoDJ3bVK
         UrstFh5NCW3Sagy6Pyy6dfy5NeuXG26DQ9KCiqPNPiWuDRen3VOmggcWtqruThutwJ2J
         wP0zgOnSmMLmRjMaUQfFYEDcU+7M4IY/8zUOeF13+6ewbrndJoEM7CceBT4OfqjWMkMl
         VocQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777217204; x=1777822004; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPUu0Cm27qIygZI4ma0gwbXy+SSkhZVphR3VJlTtVS8=;
        b=UQr2Drtus9Z0ZeIjP2W7yzEUW9aNA/BvN/fHQcScRP0GH2KvasLiqmQGqoDgrdT/mY
         CmbTx4QsufTiqQ7wGyrjk+4DOMgoAjdNTU7G0gCmYuEYJZ+t1qZSFwvc+jzFUJ54ogfU
         LlBw3jTCmzCerKYs0IC4NolQJGoUCKvCbZbB7X2U33bXTbYDQxdcpeHoQ/FGK8vOYD/x
         sxXcQz6Q3JVhPsHj1xFpme522zdxxfaddV2tSLOtpnzzKnVx7ZW+xoyqzt6Q+MJJA3Rv
         UUGQELgPgiEeOqB8p9EGl3WvRSIXKKzQ5ERlEUk2xI/biJMHNs591R1AlJvF3nH+watT
         WmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777217204; x=1777822004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oPUu0Cm27qIygZI4ma0gwbXy+SSkhZVphR3VJlTtVS8=;
        b=KQyJXTVDMh58RLqvLGSQI25k4Dsd6y9Z6A85gesqqzdAqTTtcLDuVWFhYH2T1mTRTt
         PhmnbUqPw6oT+4rowqyVrwLkrg+oulw7XiaP+2sUbK75aOc6AQaNJiELwRjzmbzVGvhL
         gNt6lXqkd6RJZdYjWRyEkSqrxrqgt5UAPMUOxhJ541qE3fHgsVlQbLZXOxq4nkC7M4Qm
         mm2u4x2xhQRxcYQixi83pXt2Fbv9GFZ/ID4bGyr0H9RQlBGPG/7TPt1qRO5aNB+88z9H
         D2xdLWGqme7nPOaLu5GKj52DlGwsGPtYpD2ajrAjrAnoWQveTt4Vl0g0NrPITTfz2Mb0
         wtWA==
X-Forwarded-Encrypted: i=1; AFNElJ/RcCOpwF0+rD98g3zwTF+KkSCs0ckyBVuLLClGXXD7X+DoSuC3CaMfwFw/UVlyhwO5rclLMhOsNmQMqRfryWnC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3whjXMO/pjAH0QBobz2wxiwSAxLp3kOVndFE0x63A2+s3Zlc9
	hXfwIqMQ+P1BEl3hV4u4ypvNem58XioJlJoVQuERBYT7G/sOTcPquESFjw8scLj/YwVeQJZ62lU
	R4dmgm6+gvhUocND4DfUBhpjZQQFZzOQ=
X-Gm-Gg: AeBDieu+sWzqqk2fp1VFIkYcCwGAvkCjISMaWOcMm/sWPp2jR/9zZBgdspQwagE10Rh
	/ZoAsX+gz/yTei7OF/j+N9lCYusWHN2JFjnIVLK8rybevD9AMrkbgEurZXgE+8LSSpHOEIp44uw
	e1Vu8AAN7arBgxNCSdU1p3jzAvqjV3UA/+YXQ/V4fEVvOwxXrQp5SAn15FIeKpznUeSnY3mksF/
	Q5qjXaz1ULg6fK4b+m4zBErQ5bUazR6ltzIHoArWWDBEm0bNGw+duO65iKxULzg4Enb/yVD/fp2
	a3F6JiyeEds/gmDR2TRMkjkOEJdxk31sWYKWwAhpEjqhf8LMJuDV71AGMgNMpuuKygEN2l/BmyD
	wn+OtN5pj8DeCGzxnrZVus8MKu7/tslk=
X-Received: by 2002:a17:902:ce09:b0:2b4:5d87:a1fd with SMTP id
 d9443c01a7336-2b5f9fd21c5mr414476575ad.27.1777217203962; Sun, 26 Apr 2026
 08:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com>
 <CAKxU2N9_Nmk_apUZLSCGssXpwxYOz9k99ggRcUM3EPGUzaVi7w@mail.gmail.com> <20260426114118.7ad8b130@jic23-huawei>
In-Reply-To: <20260426114118.7ad8b130@jic23-huawei>
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 26 Apr 2026 23:26:33 +0800
X-Gm-Features: AQROBzAaYDomYsrasutwOHUKLQNNevm2fkTAMklUdCnv3oJkdjE1Eum5JhBFxZA
Message-ID: <CAN4SLj1_45OG+1AdzCfNiV7T3VX9tpQTcX8krsTDruhtYLzEGw@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: meson-saradc: fix calibration buffer leak on error
To: Jonathan Cameron <jic23@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-iio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_082645_301914_27DF8FB4 
X-CRM114-Status: UNSURE (   9.11  )
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

On Sun, Apr 26, 2026 at 6:41=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> That is the minimal fix, so we should probably do that first
> even if we then circle back to consider if __free() magic is worth using =
here.
>
> J

Hi Jonathan,
You prefer a minimal fix here?

Best regards,
Felix

