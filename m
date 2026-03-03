Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BDBEDA691
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 15:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gD2a6WR3H4tVJC77g+1awJLOtzCGL8fqkwjycUOG98g=; b=nv9XgXXj179tIxhM8vhyCKtrUx
	F/eKuHKR7OYb//aXliYWgyCOMD+RNODsxiqc1QA+H73DwG+vdTsPkPeJHRQCppClI7dCAizfkXgJ0
	HrM1U0oGYbRK/P7DmEJnEc8oLXFHBc0yQBApBXn73Q8Pc56rRqg/ljNb1TzaSaDJb26GowSXAC+G0
	cZmYwaq1ERtp4OEfGafPKOiK4niYZ9OdhDhfQ1AijguqEGThIU1LcAWbF2CfjVdHxjxNB1+FX5zHP
	fjBopgcqz6W/yRDTY4BzoEA8++fXWzGwB9KVt1YQnRU/Ma+XJayl8tfevt46gmnR43GxGYEb5z0xD
	UNGTMIhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRy0-0000000FSRU-3TAU;
	Tue, 03 Mar 2026 15:47:24 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRxz-0000000FSOu-0A3z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 15:47:24 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-3870dec27f4so37218031fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 07:47:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772552841; cv=none;
        d=google.com; s=arc-20240605;
        b=j2qpNaXHULqcy3Us5/d4vxCrnwo0gK4p8soJlIXc37uHh+SJqEQOXqUHWf+thG0Y58
         EH9vGHpzoLoW9U8XvHRPP+bnhCp/3FeqXXTJGz9UWczSdCIFGqWOLnXdTtValJAgJ9Pv
         84J4O789pVT/gTH1gSMH2FN8DPtFsPFArICFgKevGtR3ltCVFcOz/FrtASIB54B4mpKP
         EXg6jIP97902N08owCZdpPpNSTKtOBNxd/LqGpUC44odFlqYGRhTFssUY0XN5/Za52YP
         Dn5+HfuqrCCtcIdXHh+yCFXMr20artL/LUEiegbaJsE/WHXW8RijAuf5IC0ycRTtFkXc
         znPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gD2a6WR3H4tVJC77g+1awJLOtzCGL8fqkwjycUOG98g=;
        fh=MpQe1UZ7IOsj3ahau4q+lJ+gf0ddbVFP/tWKJ8MT7e0=;
        b=C7XpxBbwc7/921iNoc62EwVfTGGiv0SEvB9B1Yt0KfMCABAHMPJX/8B/CSqGRiVp3z
         5bHDGOlS5Yh4vLY5nDbnwneRIhE5b9TFrFnt5dthxLxaXW1fjUOCoBeiZ0XaFXWduq1d
         WJVrh99mgTDNXNIJMD0WD2dRdvBiOcSRF/A179mcUxmIYveFI1nzyA3ae44UDgtsAAlA
         l1Wt2C2SXIdnDVAm2dOt5FUyUTRhGvuChxofKyr9X1ojtWWjjsPIYGndmj/WjGraKhjC
         Ae5b30E7DQB//XVxAr5MjmJtbxOG3t4iftGrcsUqeRskZtZ2Zb3k9pnqUwH78Vhncq06
         HHgw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772552841; x=1773157641; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gD2a6WR3H4tVJC77g+1awJLOtzCGL8fqkwjycUOG98g=;
        b=J6nbe7aBSUplPQCu1tPg35RElFMLA3Vd6U2pbjHyu2zd6ggJR+sVkdOzmWbaN2SrqI
         qAo8pNL2PkZG8ujQze4hk7z1x3gf9TF7DesG5WJHDC7EAJ6WgZPaXf4QbDTO9Hgi2SXe
         M8OqBn+jDN6O1aCkU1y9Mr+iNanyW5RPZ6ysO548TmV88TBnwu8sbssnTJVQ12iLJXHs
         myNfHdaSVMlvkZHwaPF0Ebsn2Ygz2kSAgbC3yf0Jn8JJMuD9q6JDVKcvYj/p82XaccnS
         qdVgH1M5BaicjGYjcCgX7z1TyypmaxrAYSwfrJ3zVC5UtfJDGxOGHcXxIxqkowjysRDx
         cZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772552841; x=1773157641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gD2a6WR3H4tVJC77g+1awJLOtzCGL8fqkwjycUOG98g=;
        b=OQE8FcBZTfm1tYCJSTQqaqh9ZcbL1PwnsL2yuopDCY+s9XPGHKJC3rn8LYPg3FAkpr
         fd6ZiyioSqK+qaTFwT7HppWmkA+w1V1t/CJNudWLrNjU5b4Eu2TaZmcZ3p9cXxqOv/rU
         Lsj0hHxds+AZYNxAFKEToMM2150UYeyat0HJFVtrzsHhicBGK8X1NDH2xzv5grj3mNdA
         BGwJGC+2FeLK/wRrKGwZbNd3ge6wnt6SU+PZDfc5LZ0P0eXk5vCrZRZPoTfHhzSP2L3O
         NlkFiWBe1FFE56GmTrLkJ2FCF8+euWpDVT9QZg47qR6YWuCwbImlAQrQkUYXqIsjrDn+
         zC8g==
X-Forwarded-Encrypted: i=1; AJvYcCWGdAza5hZaKRSyHIxziCvbKDD/PAtDoR0d7QlbUAmGRetDgz87gPz+eZSnogvyPcMlkMN0wfV7TmELSc9vPWpW@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd59Ink5rFxfh7j4IOgQ6kt1WPSlCrivHES+HNvbI0jIkc8CyU
	3IRbVpD3pVE/LJncRRsnTbFSex2L+DejEqxPWCqD6ntltSlQMgY3cBLWql0fdxJLKK8RdwBAUdW
	j7X9WI5SvTUYKhpT23kKEvxdgeVps8SBx4CedYgNArQ==
X-Gm-Gg: ATEYQzzrpDmwLwGcN3E40TAD0RwoHZOzgIpWtu+FPOxTggW2WD4Z4FKCnF3AwUXCxkV
	GvB7/C5AtGlYGocEKqBp2IVVupU5fJSpxbLInENhAoLZz2c0zLdZKt4LHdYeuKqWjJwva9TYjcq
	PIAHPMoOGJOnl/ESphW+AEPuHvnx5Hjh7Pv+WgZ3DID48V8fHwiTV8qmPmg9899SsT+99Kew0e8
	ATdw7scQM0sC6Q7IgiuPDu+PyVi3wQpQZOoIi653aoxaWY6/kBZcPu6rototQ3T1/8FQ7ukrf38
	Gpdc6UVgECk6RB1xLYU=
X-Received: by 2002:a2e:ae0a:0:10b0:387:a16:ee83 with SMTP id
 38308e7fff4ca-38a1c40121emr16229581fa.11.1772552840006; Tue, 03 Mar 2026
 07:47:20 -0800 (PST)
MIME-Version: 1.0
References: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
In-Reply-To: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Mar 2026 16:46:42 +0100
X-Gm-Features: AaiRm51Gkmd1147qVAzeBw_Z4HEuTsOKVPJKFQ1XaM2VqwFLZ9phmWOW4SQBHOY
Message-ID: <CAPDyKFpCCoCH+z8MGhf84zLQbQB-UFa+JxkxMCGxcHmcT_1M+A@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] pmdomain: samsung: add support for Google GS101
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_074723_116172_3451A82D 
X-CRM114-Status: GOOD (  23.57  )
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

On Thu, 5 Feb 2026 at 22:42, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Hi,
>
> This series adds support for the power domains on Google GS101.
>
> There are a few differences compared to SoCs already supported by this
> driver:
> * register access does not work via plain ioremap() / readl() /
>   writel().
>   Instead, the regmap created by the PMU driver must be used (which
>   uses Arm SMCC calls under the hood).
> * DTZPC: a call needs to be made before and after power domain off/on,
>   to inform the EL3 firmware of the request.
> * power domains can and are fed by a regulator rail and therefore
>   regulator control needed be implemented.
>
> Bullet points 2 and 3 are new since version 4 of this series, and
> related changes are in patches 1, 2, 9, and 10. I can merge patch 9
> (SMC call) into the gs101 patch (patch 7) if preferred, but for now I
> kept them independent to make it easier to see changes compared to
> previous versions of this series, and because patch 9 actually applies
> to not only gs101, but to many newer Exynos SoCs, and to make patches 9
> and 10 themselves easier to review and reason about.
>
> The DT update to add the new required properties on gs101 will be
> posted separately.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
> Changes in v5:
> - add domain-supply to binding (patch 2)
> - Link to v4: https://lore.kernel.org/r/20260128-gs101-pd-v4-0-cbe7bd5a40=
60@linaro.org

[...]

FYI, I have reviewed this and it looks good to me. Although, I am
awaiting a new version/confirmation about the last DT patch from Rob
before applying.

Kind regards
Uffe

