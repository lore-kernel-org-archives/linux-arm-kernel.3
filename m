Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD992E87823
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 12:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KoyfT3Os4pQtUDlujEebg6EiOL0R82EtKNerfIW+df4=; b=gzLiZiH1HHeREVX/s1tRWBLMkv
	gWeAHXFVbT8fVRVHcavsp/bH5vJpcKIYeQEogiSq6NgvkKpeAKpoYkYZM1VS+/0eQpeMqJRfrrP9r
	JD9d8B8JsLro/HPZ1JWEoh5dV1FxpvoH0qjE952unsoxCuafToZRyACVvFLQRORz0AgOiYEeyeShT
	3cEd+871PZZPt+oYV8lljltei/N67nqzmBMUctWKCxBTfkxhgQWRGC8e5U9nm1cUmpMYNF2ZiarKr
	n3x8TFtvSBaLD3M8Qz0Ta3R0J45oHr9K16m/KAvPoo1kt9XZln0UZiIrpAJqVslHBAM2RMM3cIM5C
	DEoj89OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnFmp-00000006cJy-37Ki;
	Tue, 03 Feb 2026 12:45:43 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnFmo-00000006cJe-0F8P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 12:45:43 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-655af782859so10152327a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 04:45:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770122739; cv=none;
        d=google.com; s=arc-20240605;
        b=KoYxq1nTqHEgrqA/d44Re76/zQ2aAQ+ibKpdEsPNoNsiP9fS3IyvGrZNSvlDsVOs3m
         LEHb+AltC+PAPQr1CZP1x4DbblfSiQyuej8q2JwrmjWlZt6DVMEquFKPNKxurP7sjm9E
         OVIXlBZXp+04MNuES6bZ0QVqH8jUZSQ8QFnh+OnWZktyGaiqDNUPgFE2JdhPZeH6NZxS
         0h7LZrUNMB+IR7mfl5dEM8RF45hMAcu7ebaKsK8vUswYC1Z8/PVF4TlXo6fw4QJ+0Rj2
         kihqyRsLIWsJApbzlup5STHaFoiK7QNdYBd/lY6nZtIQaMI0wpbzb0ecwebqgnOPz+DL
         ZkyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KoyfT3Os4pQtUDlujEebg6EiOL0R82EtKNerfIW+df4=;
        fh=WG4byInXzzM8dkcO+1EQdwxX0f7GGqsbgx8kZlm6PNE=;
        b=bIrUiZXDIWgXL4TiEO+pdZlTayGNHdVKtje1etPIdJWQ8NycafnIKbKFvUxBrNovrj
         KZeBKwzmoImzR7bcKM5YdQ9lUX1UrD1l/BymzRnFNXOfJcPArOEkHx48ahWNtQeVaPoH
         nKldpJnvtwv4S50rAiWTwPq4OqYS43z4bt8Ihya5Z0RAewyShZR7npb4cErs9bFCsf8G
         dTbz72QamaLDL1YGzca0iOGcP+tvORHgLOKspgiVcN6abKt1zJjhVlXi7hKG3Up15CCY
         cZzgE/6aEYox4SFJfTDc47bRPeU/4oGY0HMWo0xA8l6S2encqvxKfA5ZQK3QJ0RcQo7n
         HsEQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770122739; x=1770727539; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KoyfT3Os4pQtUDlujEebg6EiOL0R82EtKNerfIW+df4=;
        b=DaVtHh9+bJJNpQrRJB5nkXfcVDYVirmdasoU+/D+dmJbjnoloI3lZ1yDkhPhybOD7W
         epEaJTbz5CHskcwvmpzIhB5cLpMZBxORHSMok9a4tusrN9Y1tB4lx//q3Zs72gmyyHe7
         BplT5F/7gH4TKjDxmyim93OcqXaBHgv6Eg1j35A2XaSpuGIIIFjsKu/ThJh8TAXdYxxJ
         sJJFEeD2Q1FLoEzJWCjUdO9FAi/xquG0k2PmUNP4pbz9KLlN1cbgcAq1RFyHWKnvb3WJ
         K6sZbl1cg8Wcilm9ErsxUOdvkwEVJ/G+se8eaigsRDBThmkHfH3bNLaky5z5f/R04FH4
         FFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770122739; x=1770727539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KoyfT3Os4pQtUDlujEebg6EiOL0R82EtKNerfIW+df4=;
        b=E4IkB6SntRbEx+XgWK4xVnA3lgYNjL+cQiRy4MAijx07h0fcEXdKbVIcQ+zPNwoQXL
         PfcLt8FMdsS8Z36kriiP8sl4S277IsIa8otJBxPgwvumtJE65uaH5yG3db6iygXPhomL
         74c+dL1z0mYeI2b1FBy+YeJHCtXj8hgNeeip6EeovSaNJRWxMkb1X2HJvqMAtkaiPvB0
         ntaTSqPvVlGZjlvOxq4r+S8oqmkNqJX7q0VzPT8I9SVjinv0j3tCLKKrMrJZtL2v/fH5
         A0rBU9+gWrTIRqpaz92YmuC16LXg7tbUipIvTiHU9BZ3P76vifvzVoKx4PscqOJHyyDp
         Tovw==
X-Forwarded-Encrypted: i=1; AJvYcCUai9IczahqaQcn0Ifg2SX9ChNaXNC88ZTx52VO+AkXz8LHyW5p5HSig6xZov4FXXAt6cB5zxzMTSSIXLOCjIi8@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ0z9rEPIuzmfiutRBBHn80pZWVD6Frh6VdPcIZ92VruJhqTRn
	9HB18g15gCqoQtJA8YLyavLRD5fpBAAWnPytNnccAbuhlUczz25WaVyTvvmWcnhtSp9cXGYVdu+
	w26k4w2L5HepywaGI+mpG/woDG1gLcLI=
X-Gm-Gg: AZuq6aJTLmpmp/9AlD381s1X4HCFvMsPopVC9g1BEVrP3Zxv8kzJcrT1/RXKOalzIX/
	6Si4qxvG17xlbdF0hQdbFKXO0TMuHD45bvIiXG7qtvaXin7mUPjxYF0fwicjep0qm1X4OVqFt0b
	s8zWwaq6p0EwX1BcSxg/c5xo0t/QmiosjONEC7cFr2azT11Di8aPtrUZjHbrXqliPNtJtD3TCfV
	PAupUj/f4QZjBcZeHF6ELXYfDCq0hN4rwFzvesYAvRkVnWnlVyl6Z/aoEczFnFgerKfBCKFr86a
	kYLsvcrX6zDmv6PO
X-Received: by 2002:a05:6402:2742:b0:658:17fb:4890 with SMTP id
 4fb4d7f45d1cf-658de557b0dmr7582231a12.9.1770122739020; Tue, 03 Feb 2026
 04:45:39 -0800 (PST)
MIME-Version: 1.0
References: <20251021165212.749372-1-a.shimko.dev@gmail.com> <20251022-rugged-archetypal-wallaby-ecbecf@sudeepholla>
In-Reply-To: <20251022-rugged-archetypal-wallaby-ecbecf@sudeepholla>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 3 Feb 2026 15:45:28 +0300
X-Gm-Features: AZwV_Qj6FEE6eaVt-7p5On-NoVPJ3F-fwGw9PBBGPKesyT86MTTFVEHHqRcyLok
Message-ID: <CAOPX744bwwZHEODktumJbE1MUyfDgYj3vrexT7GRBZ6BTrECXw@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Add new sensor unit types
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_044542_158196_9EB68E02 
X-CRM114-Status: UNSURE (   9.13  )
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

On Wed, Oct 22, 2025 at 12:22=E2=80=AFPM Sudeep Holla <sudeep.holla@arm.com=
> wrote:
> It is still alpha, we don't add anything into the kernel unless it is
> of beta quality.

Hi Sudeep,

Just a polite ping.

Is it still too early for 4.0 bet0?

Thank you!

Regards,
Artem

