Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2309AFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 04:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+wgx278PuWohl1935Byl8WX7gkc8WHJmkUS4pGdFI4=; b=jZAlsPhgltQkHfJd2EV91VEz+V
	Ax86z3NI8M/9S3Fwqp6gYCGhH47dQ2pbev2HyhQl1Lo7zmsqEjh+3u6Njfsc0g00JJbbRY9ix/x+v
	3WqUCsmOsOyo0ftPDJYsPNgrMg+XTUUbAqmWVMkZ/jR8hzAFZU0rDzIXvPzMvKVGLtYP8mLu9UVv2
	m3/z53yFRsndXAPz5rtX/tNDiousPDI//3HfjD3AGmKeHdOS6zq6Z/W2My4l92WU0LDfQOeyoQudd
	UNap0aqUaYOIXcB/XyqggKdWstkOR9x7QCMqUA/7/WFik3CBGAkPnoidGohbnInwJXok3cdsfc052
	VsdEKe3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwMY-00000002ukE-3WSh;
	Wed, 29 Apr 2026 04:17:26 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwMV-00000002ujX-2IuS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 04:17:25 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5a41099fa86so10722624e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 21:17:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777436241; cv=none;
        d=google.com; s=arc-20240605;
        b=lJPGF4e/92IfCx9VxJ/YgpC9k5YR1w7ry0lO7vG1Pr0JFtQzxZKHPafTDJTBBp0tyd
         XHMIxtL6QLrkQte/9b64qjZLirbTpDYlJW2gnJxs1qofXfTVgLa9MNROztmeJvAsr6k/
         0Fb/PwMxdPE8jU4efqEKIsc0VIWM6Ww4Rd+jHHz09sSunslR5wN3vCu37G6HrfEFNGYW
         QYkAuxFe99DSc98CUznvuejIBa/tOBXmeLB06rq2DrEGZt0YnuabIQISw224nFTtB6Il
         L/3xJn1kZYPYdkBgjGBoq9ZFDid2+p6F0wbvXHnLb0Enp3kR89MHyBCju8ZXSp61pSce
         QU4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S+wgx278PuWohl1935Byl8WX7gkc8WHJmkUS4pGdFI4=;
        fh=p2RbnjG3ig7mr/bwaCQEtDMQV7UeTfEqqSuLLDyq6wM=;
        b=e/1JnFhVupzx5Y+p2gjZSQZF50UBXEZ9d8oEb8iQEtzYJ2YRKk3Jecec5Dr3ddqA+E
         tCXRHz2eqa2CXTblrYF90il8skj0LdqY830UUk8Jx6Hr/5vTj+Dz6L8lJuzIcWsuFzYW
         1riowDe4DENJZEyLhT6sSIB3vZJErZZsSs1uWKVf4RU2osCSyouQQJHA7U+w/2BbBvw5
         yqoQENiJsckD/7lafv8uT5vhhAmFtbObYvvd61H9aRP10kSGd++Ox1fpFsD9cWVobE1G
         6NFp3y8xJGiZeQMFvVvXKOEq8xxI0YGg68XKHDDZ9ywoXmHpfJEBlZAX0VXzZYfn6Bnf
         wb3w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777436241; x=1778041041; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+wgx278PuWohl1935Byl8WX7gkc8WHJmkUS4pGdFI4=;
        b=a4SXGlDip4ZzTX0GoARm+IXGC9z2oiZFHRsf11xQfKuh9m3x1nJlwm/79AJfSB4+ng
         DzXV0XTAuUTXDPu3JvhVLpw5KvZCXPDpqw871mnkpcsvtZEvjlSsRHfKvUFOlOOIT7f9
         aYZ1ufTd/sTWy9lRvWrtkfXCZ/4Ds43VyUJL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436241; x=1778041041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S+wgx278PuWohl1935Byl8WX7gkc8WHJmkUS4pGdFI4=;
        b=YGV+aJDyfDP3h9qUYBmcS+w1ena7UJRFJU+F8nLcrBGl0MHu+X9rD94XmzkdFhc1Rj
         lb/MnDY0fj94aQM2WlwLX/Pjn86Un6HLu8HaHMdyVMwk7GqFAojaxsFT16D+3AJLmIxq
         IFaHTg/K882MEql1evtdBuNM1bt5BvjGeddbiAc85wgWm15fFUMXlKQz9G+WaUtMVVCt
         aysMAI/cTst/k7ceY4SOQFt2YkaGchU6ZDQ7YqMBShXm4n73US5EN/eXmhJxc3Qqvn9J
         akjrMqI+3z8eC/rfh7ECWLfIfzCYnP/WjNouSjIbjLjdLHLhl02piVr9a1+8S7Qy6ody
         0S+Q==
X-Forwarded-Encrypted: i=1; AFNElJ83KnT23NKQtLlU7ZGMvtVpwJ+60MOLPSYCjLDRTe+rr04NBaB3I66Jra61fefAGXHvVYJf4wf3/qQuDzN4SvO5@lists.infradead.org
X-Gm-Message-State: AOJu0YxR8Thrk+dzWVED63HrptZgF7EmQ4sQdV3J43Uh5sDHs34x+ki5
	Q27yDfDOa9/ncYwMDXVeW15345UCI6zTvBqs4UXWxYXQeZC696SCP8VYyZA13YfFRemfAop7nBe
	iqV5bkKAkOJ2UnhRBzyyfwSBc82vU800ZTXM0o2CI
X-Gm-Gg: AeBDieu9YS8Gsf8PGOgl5FpYb7ACjdSMReqTNf0gSMypJi/R4717lEhP3mgqL4VVPOy
	bqqQaMG04yFmf7xyUc+pYczKBzRJ2ApeJ3VlDehiwwUgDvdG2U3csZyBF7up14Io2DZ4yEGxMfA
	rYjTyj5uCtIZykQ4SRNUbJyxRqjBaEGQ4ff6yL4c5eCgFH2W5PttKZzRzfBrVIMD/E9NMIOvT3Z
	X2X/rR+5tP4lz1HpTBLv9YYDUV5+3ETHbID3X+W3ozPjX24g67hW7hgrGAybXkBFxuY9lO8WYp2
	I3NniOnEKGF9M7hAvw==
X-Received: by 2002:a05:6512:3983:b0:5a2:836a:ca47 with SMTP id
 2adb3069b0e04-5a746623733mr2096698e87.20.1777436240634; Tue, 28 Apr 2026
 21:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-6-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-6-briannorris@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Apr 2026 13:17:09 +0900
X-Gm-Features: AVHnY4JUF2jGqzImUjvVT0R20VSVC4ANB99NMBVznnvWckelDQ9DcqAgZCUM5q8
Message-ID: <CAGXv+5FZ0kTqrqWEu8AX_1cxtEQD0urr=FJO=Van20h75_Z1Xw@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: mediatek: Add #{address,size}-cells to
 Chromium-based /firmware
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	Julius Werner <jwerner@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_211723_684861_4C2FAB52 
X-CRM114-Status: GOOD (  17.57  )
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

On Wed, Apr 29, 2026 at 1:12=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
>
> / {
>         firmware {
>                 ranges;
>
>                 coreboot {
>                         compatible =3D "coreboot";
>                         reg =3D <...>;
>                         ...;
>                 };
>         };
> };
>
> Notably, the /firmware node has an empty 'ranges', but does not have
> address/size-cells.
>
> Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
> non-translatable addresses") started requiring #address-cells for a
> device's parent if we want to use the reg resource in a device node.
> This leads to errors like the following:
>
> [    7.763870] coreboot_table firmware:coreboot: probe with driver corebo=
ot_table failed with error -22
>
> Add appropriate #{address,size}-cells to work around the problem.
>
> Note that Google has also patched the Depthcharge bootloader source to
> add {address,size}-cells [1], but bootloader updates are typically
> delivered only via Google OS updates. Not all users install Google
> software updates, and even if they do, Google may not produce updated
> binaries for all/older devices.
>
> [1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
>     https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
>     #size-cells for firmware node")
>
> Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
> Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating no=
n-translatable addresses")
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

