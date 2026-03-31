Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878F0FF60EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 09:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QuCvn599COW//1DtmRcEag0zAJukE3mULPcfdxWmbHI=; b=uuilmjBjz1gTM2wSKl3lY5LQ+K
	VJfTEMMuWMYTVN9Yn7BDMvca2IUCXwTD1AO3R9rih8kyjgsRyxFgnajB9bEhI2xvsQ3j9MDUo6L3U
	PzaVexsCYNoziKMAPJFy63eG5sSyejK5LqEF4Ty2KAwaUiIraKsY1HZQgJc1RmBeKR5C6kyNgcQIF
	X56W+/hM5nxzE+c0SUcpRY5rvOvkGB09z6TThD3JFNt9fR5KrTGRpL9jXawmX8oYjuHyzLkrd5CHx
	rgyu9tNkM9UeEokrQ52rkr3tDQD/yKOxbXgG8t1WT0nfkwKjg2CB9MQdy7W1ua1kfKzwH90Q2tB9l
	bGMSOF8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UzG-0000000CeHa-1xQL;
	Tue, 31 Mar 2026 09:02:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UzF-0000000CeH4-0DNs
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 31 Mar 2026 09:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QuCvn599COW//1DtmRcEag0zAJukE3mULPcfdxWmbHI=; b=awYI5l/n7RY2WsU8oG2NBFDsGm
	lPnaLUBPkcJlJTug1TTA4z0GEzpuhT4VP4Vc/vtodeggGzpyyIHdlJRqn0No2+X2A3ncPfymfpyld
	ZWXtom1NS5/ZgeKFYDNw23QRSnW/tPT+ZdQ9wnnlEHqL3LOXOkXRvOoC2qM/RmRBnPycrnQ9v/gvp
	16L1qZnZFaUJAO9h4uygQVZobJ9jb+KGIOHFlB4p1xrm3R3SHCSNqaD1TRpthzHTPPleEXpksv5Nk
	NjjlsTRzWZfLvUX8+VBd3B3MkhgbqIqyqAjgLFtkGF1WXhBVS6oAKD189pEl11jNguJPiTyO9BaSH
	wY0XGB8g==;
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UzB-0000000FTo4-3pk3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 09:02:11 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5a27b5ad832so6228632e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 02:02:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774947727; cv=none;
        d=google.com; s=arc-20240605;
        b=Hxukntyf25pWOCuVDn3pEOlBp+IomLswGXkXTsyZuyr+p9fXj0Xas/tcCA9G7DsJWt
         bRlL504PQyyHbD0HAlItCyYXim1kKHXH9GPYIXYfDTqhpYZlsnTJKs1iAcnAAJMp115B
         MfECIvHvGMP95iFeHCJOVqNz88YnlaEgbo13I2kwRzkimEDWunKm7SDVYFIsGmI++NpO
         Z7o2NePREHNj7YKueYGtXghuPF8N+IQzHJvWAAr2V4dBsYqhmFxPrbBIOTfhc7U6QfSv
         aAw/meF++WJsWSwejGbjZlaykiefi0NMmacAdSdrF3cHQOH5GjlGJKYxd+FXqvwll91S
         SEMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QuCvn599COW//1DtmRcEag0zAJukE3mULPcfdxWmbHI=;
        fh=9NNFGVVZl0jjvcyCn7r9mmjL6HU7cCtPiKyszgK/wNg=;
        b=XTrZU6IlgyjZXK29z+PKZ5uRv20zMtxIlbQUcLj+nPKBPql22sGVaGwTZo6NSUEVMZ
         FjQx1JxGQu9JJTuH1c5BNl4cF/ji0jwx9LNU8vkfcMkXHtBqMn3utsfDqf6xkKTsTW3I
         rl4wXO1Otp5dsteWexuPdccftli2Pnk5OItaBKFkvwlYcrbWoCuHrYBRiUC/TePrOh33
         5KyjvLtTaIkjhDoE5li9sPoY+Mj8N7e+bMN5uAvYT7N83qR9gQ+RTPlpVQQQwGM6Bsv6
         m3Bt+W/v/uUsn7nRltN2k64glwT+HbkKrbEZ0I9Ot0dkLyKrxfen2WTSO5WicQDYMACJ
         4eKg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774947727; x=1775552527; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QuCvn599COW//1DtmRcEag0zAJukE3mULPcfdxWmbHI=;
        b=XZzE9dL0qVv7f1HBbBJJtS+GXJwkGAHsxRVIBHc/WggHRYoEy/iiY5xjUVBcKFDSQO
         hayF3bbDTlXaud7m1Ug/mF66d01wNDq4W/TOFx9n4KjRbi8JbovOQ6G/3Rjm8X8EoEzQ
         TqOvpom47rHTt2DJMTznCEc3fey3O737Pzw8XS8xwFzNoN2dS/6BePbhNTdu16Q/gVhg
         /Cxgv3JHh447trD+vtNJzSJhoEHdPiBdnR9e2XTRdu+aG/PUzt4ci9+VLtAWWQa/XRry
         rIgYbCHHjOFpjeQbU6HCfF2EfNaCKasAm5hZZ3qkmrBdnjPXnynOBxxlN+TWEJQBq6LZ
         ZKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774947727; x=1775552527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuCvn599COW//1DtmRcEag0zAJukE3mULPcfdxWmbHI=;
        b=ARqwa74SuM/8nld+Mpq2Cwmr9eUvCxl9HBOV/4W6Z7OZLi59Um3+cRDSZgNz7DzQmK
         9tC4XTTNbwJAAAvZqC1Bz8Y6rSDrDPXHCws3kv0j6ItxTzHGYzCKhadudjXrrjE2Qjwa
         ZsjLG1QZUdOWx+DA6JaHEtC9fbJ5OFfMV22pKIoRijYGG77Bo26hZxqy46mHIBsz+JdQ
         Dd+DY8u589qbi6TwQM1ylIOmY9Dbb82V1rmo4KA8MLgSFePzIYZULSreJ7wpFGVNsL9m
         UVlCkYINUjKpgHqHTadihSpFxZVNqg+SLufDDR/BSfCB1JpKGx6HqOpP6WfeHnc6ycbK
         GixA==
X-Forwarded-Encrypted: i=1; AJvYcCUEcgpNfChKuscN3CZJfFUMuZOULUXsaUvnYs7a/KhsvibhW8Gdod7TpPmdrK9JeZgvYdQP/iwTge66cWEeobW6@lists.infradead.org
X-Gm-Message-State: AOJu0YzHndSAx1GoIh+NgJcgRbaTPZLO1FcH5rRP621dFMH5yIBMGyYT
	+/ILabYni4weKF5pq8i2m9XSNUaSb7G6IU3FYGEn0A1gevCvu7KDHZfm8mwaL4y7kBfDvQ126oG
	mUK/fC2q2tvSPTVitL2QaXwtla3TnqwqA6uT2QFlmdQ==
X-Gm-Gg: ATEYQzzGVetvcPV69BnaHb7ENtkF3TRbAsi4974JRYwumfBAUSdncd9VwVezncEY+bF
	S/d3CFirqZp0n8Tmm7b/XOCJIB3YNXm5gPbscHsVBVloYLRbZZBI1SXvrAeyvNjsBBbR9jeP7zj
	T8fl2ztJ5ecxGO8y2Sd8jlxip2+EgG3X5u0LuRlUVmOOATl92meMhF9M4M/W/sG2lEaJ++AsREa
	aE+dHdurPAiuiS4qSo+LGOq9mE1VCjfZhgD5PfbzFUS/jljUDa3SIzCYOpxewlM0V7ADGYn9CuJ
	pEmLuIch
X-Received: by 2002:a05:6512:3b95:b0:5a2:78f8:60aa with SMTP id
 2adb3069b0e04-5a2ab92e0a6mr5921259e87.37.1774947727265; Tue, 31 Mar 2026
 02:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
 <177409907930.268981.5882592990447577348.b4-ty@b4> <CAPDyKFoz-sm0pfvn5iSYFY0mrW38vaGRZsFvrVPqsv7BsYxeWQ@mail.gmail.com>
 <1fbf5c54-8793-4585-be33-ded77019adb2@kernel.org> <CAPDyKFrK3NLwaii-9FEmyaTzUAuVkMkLL3rWBQwQvT-M+PzEHA@mail.gmail.com>
 <3bb6b71e-947b-4248-95ba-79852f743c1d@kernel.org> <CAPDyKFpOPC2stAJ262jdap-=ByY09AeQ0kj6p_9FTGJBx+Tu-Q@mail.gmail.com>
 <a417e45b-1632-4b14-9e3c-f7110db53190@kernel.org> <CAPDyKFomzokuF+UL8d0+Syk1FCG3jnUfy7rVr+3iC1GPZmH1UQ@mail.gmail.com>
 <c4d6b758-474b-409d-b553-fa4ec1df494e@kernel.org>
In-Reply-To: <c4d6b758-474b-409d-b553-fa4ec1df494e@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 31 Mar 2026 11:01:30 +0200
X-Gm-Features: AQROBzB7d4a8fUYE9ADAwNJgppR-qAENvrUiLIFB9dQe-2GMylgbIm_d4czfNl4
Message-ID: <CAPDyKFrwxVcLByHef7GjbyB+Du0bRbD=6_ELmmnMWW-TsjMhCQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v8 00/10] pmdomain: samsung: add support for
 Google GS101
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Juan Yescas <jyescas@google.com>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_100210_122998_7661EB6A 
X-CRM114-Status: GOOD (  15.33  )
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

On Mon, 30 Mar 2026 at 15:38, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 30/03/2026 15:30, Ulf Hansson wrote:
> >
> > Usually we want bindings to go along with their respective drivers on
> > a subsystem basis.
> >
> > Both patch2 and patch4 updates DT bindings for the power-domain providers.
>
> Patch 2 yes. Patch 4 not. That's why I did not take patch 2.
>
> >
> > Why shouldn't the bindings go along with the driver changes here?
>
> Patch #2 is pmdomain, so with pmdomain drivers thus your tree. Patch #4
> is not pmdomain, so not with pmdomain drivers, so not your tree... At
> least I do not see any pmdomain parts in that patch #4. It's a Samsung
> SoC PMU driver and none of further driver patches touch that PMU driver.

Yes, you are right that the PMU driver isn't touched.

Although, the PMU DT description added in patch3 and extended in
patch4, allows power-domain providers to be described in its child
nodes. Those child nodes use the same compatible string as the
power-domain providers described in patch2.

Kind regards
Uffe

