Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20F3EC01A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 08:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ewr7synVuzHzHm/axWuA/egZCARyhrqnQ6eWhyHoFrc=; b=HVN4wDGt6o4mSyleBAcIIyUp8o
	/CVortZqcrPO9TNycC28Pt/ALLynfK6ALj/Vcd5/SSOWMe2IQqapif1xyhr77w98Ra/7s9hOpsHG0
	iPY0Be4odgt3Quch7HNszzAs3v1BP+jluCLxcXzHCnjw9NLiOUVKzkVDwvp4uUoO7FoyXW+S1IfwW
	53HX0nrhsTQM3KwzeOr72yzDYd2sgU43a2N4YVREEYUpT8rB2VbPqlt93eUy2l3wjmiIP0kqZbrI+
	/i8f4gOBlgsM0j0cJ+pqrfXSE1Ls5xZLJ5/9Akzk64sBZvqqNVeBIZ22ZYkBs8qMauXOVOIg7+mDy
	NqNbco/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4acA-0000000GHBg-0h3e;
	Mon, 23 Mar 2026 08:26:22 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ac7-0000000GHAk-2DmG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 08:26:20 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-59de8155501so3825025e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 01:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774254377; cv=none;
        d=google.com; s=arc-20240605;
        b=B+SLas48S5XDDC4Mkx/IlXEmEoFlwX44AcPkwBlgct8dO0/KrF0sG1YvaRdEVP4aTZ
         cC5nl6h9T3Gv4vGp37fw0crLKPjG3NqTREjQUlTnqF8cSTysTAQHoJ7347NCCcrDQTns
         WpmQv2birmC0HFnR3J2xrQAb7SSE5nBfu8KveF1dhF5Cf9C79Hmpehz/OckxEYZgwQwk
         DJ2ej4n42MjrXYp0pQhraQZo39pF5+f6TDh9O2IZNEgbXgsyEdkWoU9A7wvZ1kWKb+sE
         mYBw1xXdreyFdVBzaDcIeDYvTXeV564pvkV5lalsFWzcccFmkjMXPGRAaV83H2pLB9Vc
         y68w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ewr7synVuzHzHm/axWuA/egZCARyhrqnQ6eWhyHoFrc=;
        fh=eWBQM9uCHPJEE033nb1Vo6/S2Qt5m2ty3NRs68an2lU=;
        b=A/vdTxZqRHteU2tTBsHHHnYuyU803CY/vyqgAR0szKndSJG9U7lhGTlnf5PB8cIfy5
         fFyqq+7bir6hxkgN6HzzSNftFfpUtt9VARtr+zcOFEtw6STFM7wUmFQ8OyGZRSlevcd9
         V3ZL6OfvooNGbhl5f5Xq4TuvQ11eDv6ItPM0sbFI8UYWI3NLJHEkpvR/jFM14JbDb8mg
         u6Mj6iMaNiMA9RwyvDxPXv5WVeZovaIThF1bCfdCX3qpDmh8qJ/0mOYsyOGc5ogHfPbO
         PkaR+guxINjWtRMZWOKQdycGBvwmoqq6x7XnKBkDtALczh1NEcKFYWBgPkkMWx2Fyjzm
         Fqig==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774254376; x=1774859176; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ewr7synVuzHzHm/axWuA/egZCARyhrqnQ6eWhyHoFrc=;
        b=JJWX+SJ0rWzAlPLiuB6PwPQXHIaY6P3FHSD69HnJ1LRO8pe0jc7BgCp+p++jHeW7TH
         CXU+LzNosPFNJIRn5Zy25sy+S3tvD5DrJAj6aWmRUTezXiO2G5gLW9KqyZDe37n1xgdk
         WnAmDFWXuOwtAuStJGDYe4V5AnYEVzo/GfQhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774254376; x=1774859176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ewr7synVuzHzHm/axWuA/egZCARyhrqnQ6eWhyHoFrc=;
        b=rDJVfv0M7ASLTHu94lCjObayxrqrQibkGnptdQHvbIy1iC5rGY+HLXphzc3v49Qg/3
         cjhMmc3XzfwaYGt5n5IO7fdu0lMHuFnQvDz7j6YU8oJtMxZPfzWecMXzmyrTbZN5SK7Z
         pkf6DzyHz5t//abyd8eMAgzd4A1SxysfbVhLdV4Y9J40Xs4++K8uC5bvqdxvTuATUiFY
         M5hN21CmvVwSVv3mp6mQk0L/kf536pRxvv/FHWtcjts12h+4aKdE03Vuu2ZXHbfi2dNE
         4qUHJ+J6twrjOnQUPvc0IAEhqh/UhYtmowFRIh+AuLfnalLDdWCHhI8p+NVgLT6jHjDu
         bz2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbbRe5mIhw/V/B+xSUFGgVO9ifBRmW9kt638RcwAO4/U835czH5BHJb+INcLypEtD/mNcPLASsnPWI4CtCuKGM@lists.infradead.org
X-Gm-Message-State: AOJu0YxaknZr1/aiNi6RqOqEvqKtWH1KAGLrfP7bUTa6CHwUGqOMQ+cM
	acLEuR00Fv7iC0KrXdBs0DnevyN+Jwf7i6Ijc/zsi1dp3RKo//b+2qBhYF861nStkZFZiej6gEz
	Wx4GhTgYCvMk6o3t3tG5VOkWOBULnWVwp0AlRl7m0
X-Gm-Gg: ATEYQzxThQACWNMb0QYDfcigSSOFI6r9usaBLYKaSPja/GITDXq6+GMHFXAZ2whzL6S
	Lzx2qrjYtQlnPaBy+0oV2l4f6ZPbztYMVFOuXJG/+aiD+mAHCE/SuioLDFady9TaZ2nCv4fWm2f
	3ut6fMGMiOGyu7Cu3o4ZbxSPSBMNwRcB38MNCENDk2t4abJ7NSvNvpTD3mcWHFgz0wy9Szm09OE
	XGGbUD51UDTWrokY7Pzi18tljfXP0koBhDshIGmu7PjPnMJQn6xh+zVF9Uoc6pHKcAV7Jyj53F2
	7nT8snc42dP/Epj7BPWl9EfxrxJzaTa5ga0hXw==
X-Received: by 2002:a05:6512:2398:b0:5a2:7aeb:e7b3 with SMTP id
 2adb3069b0e04-5a285b5a313mr4975966e87.29.1774254376478; Mon, 23 Mar 2026
 01:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260320072440.2403318-1-wenst@chromium.org> <20260320072440.2403318-3-wenst@chromium.org>
 <20260320-dashing-crocodile-of-emphasis-2cc43d@quoll>
In-Reply-To: <20260320-dashing-crocodile-of-emphasis-2cc43d@quoll>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Mar 2026 16:26:04 +0800
X-Gm-Features: AQROBzDENi91NMB6TuyZQ44MdmtHHQSMpI0v-6B3nRxQpz8HCuyYhfE2FGI06HY
Message-ID: <CAGXv+5ESnhsVfu5pWf1DEt35+10ZKTgJ5G6DuJC4s6yEpRH_YQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] regulator: dt-bindings: mt6359: Drop bogus
 vcn33_[12]_* split regulators
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_012619_692662_7A50C718 
X-CRM114-Status: GOOD (  19.72  )
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

On Fri, Mar 20, 2026 at 5:54=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Mar 20, 2026 at 03:24:35PM +0800, Chen-Yu Tsai wrote:
> > vcn33_[12]_bt and vcn33_[12]_wifi refer to the same output. There are
> > two enable bits in the registers so that BT and WiFi drivers can toggle
> > them separately without any coordination. If either bit is set, then th=
e
> > regulator output is enabled.
> >
> > Unfortunately some of them are already referenced by in-tree device
> > trees. To keep backward compatibility with them, keep the vcn33_*_bt
>
> So you drop "_wifi" regulators breaking the ABI, no?

Indeed it is a breakage. I kept the *_bt part to cover all in-tree
device trees.

But the representation itself is broken, as explained in the commit
message.

I leave it to the platform maintainers to decide whether this "breakage"
to fix the broken representation is acceptable.

Note that there is a similar issue with the *_sshub and non _sshub
regulators: there is only one actual output for the two. I'm still
asking the vendor for hardware behavior specifics.

> > regulator. Also combine them for a shorten regular expression pattern.
>
> Instead the duplicates should be deprecated and driver should still
> support the "_wifi" variants.

But it doesn't really work in the driver. You cannot set different
constraints on the two, especially conflicting constraints, and expect
them to work. And if you set the voltage on one of them, the other
will change as well.

If we want the driver to support both with _sane_ behavior, we would
need to introduce some sort of alias lookup for both reading
constraints and resolving supplies. The driver registers _just_ one
regulator, and both DT nodes resolve to it.


ChenYu

