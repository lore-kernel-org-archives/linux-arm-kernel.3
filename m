Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1876C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 08:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQk3EhYxqTA9sSVEy1cSFKfxi+PZ6VIeCkzzbrNRYs4=; b=SZ86F/tsKyd5I7oqsiIQFT4B9V
	hf79oZw7YjuAf3zPldOv0wRXLwkSDObDN4MptIrOEPxtR2vjS3HTEoKUS89if78iy8ZI648+ZnHvi
	LIVK99hrdRcT0kO7xPPO2Bny2Mj6qxh30N9nY25WLqCA3uH3Ao/Tz50IbokXcZBgVCxf2XO5Uj2xp
	r/Hj8zhEPfmOp3lgnibMQMwyiz45Q18BorPkUTjlKCCDcPc8wLPn1hY3KUq3uq86W+rVJs7Tm+22Y
	IzXXEti4ZXqpVwDNiLIGUVDQmquHRpPzxRQRm3wTI2G7WrO05zTlbv8dWUtd3Hn153LVyh+KbOrsE
	3dYf3gcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7NG-0000000E0Ur-0fJS;
	Mon, 29 Jun 2026 08:29:50 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7NC-0000000E0TT-2ufy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 08:29:48 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-c0c15bd6b8fso307008466b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 01:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782721784; cv=none;
        d=google.com; s=arc-20260327;
        b=V6MyveO1jaztFPzySa+evBoiJJmUipES4ob3nbMj6qqWrrm9b81q2/BhLBhcFMrLcF
         grhB+UMvVK0Ozm2TzKw5we+YIvBY7ZbOxuQzoKw9iMPdbSNyfstshwmJo72p7BPZbNan
         XsaHyKw3l+j1wUZ9IHGMhw3vrozzWg8w58ib9GoSUyMeOAD0qcwChQ8VHMjFiFaAly4P
         UtcqZyzvmFb+ron9kl1Z0/+mmtiErJNUJuVjKX6N0Szv9qr4ExtMq3HXl5WTscFbP6Ud
         aRrXq3oJUmrqqy+wTxdbNgg7nscf++3fBkHtRm/nay3wWtfjZuQYDcFzh8QPvDxECbUy
         SooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CQk3EhYxqTA9sSVEy1cSFKfxi+PZ6VIeCkzzbrNRYs4=;
        fh=C8tB3CkNNWvU7/qL52cBnr+D4xi5BLj7a+ygKwkGzEc=;
        b=prXa8oulBGcohymhZ470GZkEHDVu1JRPKsSG1Ju40a6yMLnIKVQRQNqS4zSHg/TSTA
         hwxzOyWTXAtcjEk2eJDTbKfTl0mt1Y+pT9FMReHlzgzFW85+FW88pqr9+tDQLfO8HKo6
         m/5lGAueYicPEt6Nj606/yngq5Bo9rmdKK523AgYHQAHWVLRvIWzD95TiUNs3zESHENc
         uRggK9+FTpwMjp5T6L4kN4DjCh7OleKpWjAg9zQI+itDgSnmtE+HX2uwqkM5NpNVeVnr
         BepbeHYJClKtPtoi38Pvh2dFdeOIcK4ITfmRtsKEuP6Xiv62vU4seLPMWi1KnUhIrgOY
         qP2g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782721784; x=1783326584; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQk3EhYxqTA9sSVEy1cSFKfxi+PZ6VIeCkzzbrNRYs4=;
        b=Xhj1caIWl/wT1oIm2TzfWJrCbPJNzmOdrwaeaLeEDbOjh5TBgPTYjdO1z48so7893A
         t7ons5w/GhfIjLdpi2qqMM+pc1jq9STWHpunz+kAnbBs0Y0dtzRAvKVdBzmGl2dp2Tib
         LkCn4QAAzxyrrWsgWPOgfK4JX+hOy++EkDqbcEiZ9Vry6uKYpkFqFqMcP0BnkJC/53mF
         TUBUnmazVTRvXQN9Cbl/+R/th07pbeBRe8MvpNXnaFyF7GPIdZiV3lQg8gJvTxX4ohk4
         oztATfDedJ39AnhYMUzTAvq/fKg4oInrSs4uLYDNQO2SUqSYIUwRONgDplvVp+K5MEdl
         G35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782721784; x=1783326584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CQk3EhYxqTA9sSVEy1cSFKfxi+PZ6VIeCkzzbrNRYs4=;
        b=pirbeKgj2syJDT0S1uB7RsLfasx64bFPgEdhLQluuVQXxpo5A9Y1GO/WYQrJG72Hu6
         K4jGLNscyvKg1z6s+vQGIPTH0YpdoqGWjZ5pG5+VakABNXtdjX0gay6HXAnzzM7zUf+R
         0BBwhxY6UDNXYLNHKMw4nCLBD/67s93jyBVXQC/VwHCJLvQjEK5st19ZXB9lsVMYdtAG
         xuKRs0vN+55P6DkDgAqhhUFMFkdr8z2G4vFalDllr5oMOgK4woehyLCzcY57VM8PlHYX
         9n4VWTgkbwGN8Zw/4uXybp9kgdNqgL2baFnb5dJstij+y76NJZVTuYD9GPVdqfFX1CIE
         EaxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFO3ZLioZnVy/JrqXMySZIrvbZ+A7C8CAVEe9WmJHAEwcb987KK9MqQQBqRtLt5Uekt2L7iEZlMvWPQu8DN0Qf@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf+ThVhgmjJPjqXJFNhAFnL1r5jtBcvSTNTDXCIEqJ2eBrtJxw
	PNrz9v4fRzFEBYJIwkIrUSLQYYdmiiHVI0mUxStMvge/XGbcGiRA0T8QIp3v7L4YpL1N5lcJuCy
	A0kX/wc7Utc1WQO3w+zzw1C32NGXGNbk=
X-Gm-Gg: AfdE7clIln6gE8TzAq1tzARqGGNZL3KdB/bam6OQQtz7RTTIk4XZVxzgqcCAs6m88Mu
	5sk80UckTDKsZ5b91w3D0Vq293ud2ucA2rIz0sHVlFstsuEpasKNBYCwssFKAljbGfKesKkt6JJ
	89pmhK1iU3sAfF6h2NVPOMnWoDx1ba7z70pGwNn7zPcStQTq1Aem8Irul3W9hdKspVaFTmUvjc8
	qH5OUQMzJqHxyPpIdkM7SHgxilcV+a0iAvLfXrMrH4HEbWZFYZQv8MQFIwKKqMb6w/88oHRtcyM
	Jdyf+ohSm/Y=
X-Received: by 2002:a17:906:9f8a:b0:bee:f541:1dca with SMTP id
 a640c23a62f3a-c1205eb8582mr857638766b.28.1782721784045; Mon, 29 Jun 2026
 01:29:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260627225755.1710837-2-coiaprant@gmail.com> <20260627225755.1710837-4-coiaprant@gmail.com>
 <20260629-fabulous-muskrat-of-romance-cd1bef@quoll>
In-Reply-To: <20260629-fabulous-muskrat-of-romance-cd1bef@quoll>
From: Coia Prant <coiaprant@gmail.com>
Date: Mon, 29 Jun 2026 16:29:32 +0800
X-Gm-Features: AVVi8CfWsSLK-1uKnZroe1Q5sLbgUiQYsXoAa1H7uKEtrkvHKF52rbw5QkyqxSM
Message-ID: <CALj3r0iDFBLarResDZA0zCKUmkXwfV7dPN+fqAK0jBF7yRLmUQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: arm: rockchip: Add Graperain G3568 series
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>, 
	Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_012946_755605_2C7ABB66 
X-CRM114-Status: GOOD (  18.35  )
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

On Mon, Jun 29, 2026 at 03:12:XXPM +0800, Krzysztof Kozlowski wrote:
> On Sun, Jun 28, 2026 at 06:57:56AM +0800, Coia Prant wrote:
> > This documents Graperain G3568 v2 which is a development board based on=
 RK3568 SoC.
>
> "Document"
>
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submi=
tting-patches.rst#L94

Thank you for pointing this out. I have revised the commit message to
use imperative mood and split the overlong line to stay within 75
characters.

> > This series also have an SBC series with the suffix "box".
> >
> > This board is development board series, not SBC series.
>
> Remember to also address Sashiko review.

Okay.

> > Link: ...
> > Signed-off-by: ...
> > ---
> > ...
> > +
>
> Looks like you just added bunch of format-patch and check-patch
> warnings...

I have re=E2=80=91run checkpatch on the entire series and fixed all trailin=
g
whitespace and other formatting issues. The patch set should now be
clean (except for a hardware=E2=80=91list line in the third patch which I k=
ept
intact for readability).

Apologies for the oversight =E2=80=93 it was late night work.

I will send a v2 with all fixes shortly.

Best,
Coia

