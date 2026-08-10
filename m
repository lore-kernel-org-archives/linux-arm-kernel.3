Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3693AC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CeUXRKNvrjHpJenJaRbLI76VL/niBIfa6H9KqtDK2ws=; b=18rEICMFeASk/EkcxBRDqLT0dm
	uiTSkrL7zJoar0RXXPAqrnkxfGf3w/oEm0CvJ5tutDhg/q7xDiYtxgOC9TIeS5K5J02dQEoO27usV
	O10qF9nD+f9nYc9cLwLYTzYJOoVvILWKHAQPTwnM6W5szQzg2MS9lWu9vRF+TjxDAsRqlP9NwSrwt
	k/MaQ4R6etAFavCPylY7UT5ghE2MFzPIIpOLNzljBEbcFBxvVyyBOFMZjgXDpIHjuf9Ab5bQe3S9Z
	Zddh6+gMiK+9+MCUEBZeSvcJ1HQe7DVG8aA+uiDXFM4ifHH9NlyGMClbO/2UHZWwwtvWVMYBlkKPJ
	YmUq2yKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQq2-0000000BycA-1Gsh;
	Mon, 10 Aug 2026 14:18:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQpl-0000000ByaQ-1QRr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:18:49 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACjKs61959828
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 14:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CeUXRKNvrjHpJenJaRbLI76VL/niBIfa6H9KqtDK2ws=; b=OsMXW/8KgmMjHbZe
	AoyvJSO+/JhnfbuDbQ3oyZaLWo0zwkbPAE92jJ3Gcl2Z4Lyh1s71hM5J2MK86gxl
	yQ5J968Sy6B8pvKwAkUzmCImTUoyzjD8uc/RFc2yMqmMEGzxJ73unFlywxF3s35j
	fm6D112FbvpstBUAzFhOqwGrZGbwu6N/dcYRlqDNM2Rn/LI72bCvWOEJ65FlpXru
	umj1WBkHDQauhGpT7E3QmSzO2M+xDGp2mPW4jFuEtSvQuTBUJNcB+0xHks1HwLYU
	IUI7CPLh+giwbX8KwYlr1Pb5szWOTEstMLKUvKQrNiw2AFC2yImIgtvZqkZlGltt
	ltiA1w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy18xty3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 14:18:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-907c59bd65aso9101606d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:18:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786371511; cv=none;
        d=google.com; s=arc-20260327;
        b=NsMYnyralYxrjReKQ5eSoA2Cu8zEXwuvUEfnnXMGNqVGWd1eTzEgxOdoa2pX81Cfb8
         kldcTYEYL3zaFJaRc+AK6snhbdanLKZBrBx4YgNZLasRdhFpL9JXskhEa8y1wVGRqFvG
         e3LnPCeAnDDBqS42CeNJgzqie34hOXS9sGzwmboYXDdrV+zi2SwFwv5dMKcWjYpR3So7
         atJNOFxYRb79UcoFbHsB8N4BEDxIbl2Vbolyt1e//OplXyizGvEuhBlqDnBF4FVF9qhT
         obRqnAH6PGNYmJPp92gaoHRPpymxTBJ2iejNW55RxdBverXGOL0LYHqlWnXWpQZ0sSpQ
         vmpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CeUXRKNvrjHpJenJaRbLI76VL/niBIfa6H9KqtDK2ws=;
        fh=RvGCRwxMYzUyexcLWojpObw0hBSFUYFbQHgV6XAgLz4=;
        b=TDitbTkfvDehD6k6Om3LCRXChsOnQVgbJKA7IfTT04Oh06CtNJQVlDjc8YyKctmlYE
         +RZgdxxnE8kv2z+aJxlKNlk5x+wPCLBNwEFG9PMYGv/a1FCSZ2XyhF0H8DDPDB91+g/5
         8PbWl+8iJeDdyBbLTUhSgGb8HAqRUEj4WCEtst+UJt2ZTQd+r/8VKC/iZZHX6xPUGiT9
         m/ac4+pkMT7H4FqnZRd4cgAsc8bF90BGvwCfjmwfhkI/1CVA/W2zv4idQjPdNC7t5oKZ
         TTrlVyFc7uPE8mdO6ZOL194B1u63wFXm9CsuMOye5klTLnblHPV6MC6Wq0KKlKXlmJtY
         WMDA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786371511; x=1786976311; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CeUXRKNvrjHpJenJaRbLI76VL/niBIfa6H9KqtDK2ws=;
        b=D63cRuZLZYouNs8SByskc7Z4fxIcNcKukN/nsCxbDsxE8HFtsc18MVujnrP+mWj6Ir
         F5KOl3GovWsi0rgTbUGW4nLgvJxeyBaOxuvRcPKdHLSlflQ1YCPIroyLIa3v2c8Y4rJa
         JKj7bnXBX5KqObHTbAydkDd0yAXDB7+yB5fw24oA1wKPLECZV8U1RpWMryDt+haarU3c
         nWEnCaxhfDx3aoRNlQPj/b4fDtyEA7GNJ3K0HNhSf1gXLRuIaHZ8fqhu0aMcCC/2wvc/
         mCUIUudRXOSqv8FP9R/v/twZOgBDPcFmhxukcvbWJutcz+JhIMTbLESMOgu7esv6Hpqe
         6zeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371511; x=1786976311;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CeUXRKNvrjHpJenJaRbLI76VL/niBIfa6H9KqtDK2ws=;
        b=VsA0A8fOqvkhWMZIVdnX1NDwQpL0NG1lK/+bN0ATFudsOcstL6I70ibkKnIF5wjlzc
         Om3KRLsXs6PaIiWio928xc3XEMU2eEZK9nCFAFkscD5ovLLFe/6gorLjYDqJvIU6MUeP
         m1T841z410zpziF3BxGyidnyPZAHeytIrCThOGVxOvQAiIiLvtGQwB9amICJEZeqxnam
         h4qAt7IVZC/MulXbu4gpoYIjo8vC2a50T8zZ01Y+yWqc1WjvT6iPbkTXMNqohzZ8UZvY
         umMC5oV1qyBXvl3+TIvrReOrBG9c0suve36bodhobvYapM1harIcPr7aBxeivs6Ygfif
         QePg==
X-Forwarded-Encrypted: i=1; AHgh+Rpyr9tzjImGvy4q5+rC5qlsyXxWcfe04TPV+VdLzuS6+LPoJG0HsRtfY+XYlQn8q7oFbGGMg0tKrvUrtQmv5ZxD@lists.infradead.org
X-Gm-Message-State: AOJu0Yzga2iN87Flp9z478yzWYkOwGswy+qCwdtPVbFR6YH7V0hGZ8WZ
	AgvQ83USEblD/cp+Q6RgZMm/7utLgklexv6Wss41gN77I+1eIz6sYyVgA8uD5bUtwJzz1ofXgHp
	cNr67sQQnccMLdtbPWGA4KoZ2nfSe0XdAMB/8sdnNKAdRSp9ZSm+yq680/sjdS/lva1oUYXJlk/
	t7jfX2Va0W73jh8RUi2McaM8AkbqtxX8XNwH66hQlf95Dt2uHb8MFX
X-Gm-Gg: AR+sD11A9MA4mzG6FRW55PKolIAfb/Q/lL29yoxOs9TM2imeXGjFJcDNVVRDg489OzY
	yyIpGaUXK190OHMviJxfmr80joZneVAzhWiQQZT/T7dJl6L7PajJU/SoSbmN0YUrkS/pzQD8UX2
	e7DavFocG2pVBa36cv7qIWyM3oyZFX3LM6/y0ZaNW289y78vf5oaE5yOcvog==
X-Received: by 2002:ad4:5c8b:0:b0:8f7:40b8:e8ab with SMTP id 6a1803df08f44-9088108f7dfmr495728966d6.3.1786371509566;
        Mon, 10 Aug 2026 07:18:29 -0700 (PDT)
X-Received: by 2002:ad4:5c8b:0:b0:8f7:40b8:e8ab with SMTP id
 6a1803df08f44-9088108f7dfmr495727846d6.3.1786371508926; Mon, 10 Aug 2026
 07:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1785941595.git.geert+renesas@glider.be>
In-Reply-To: <cover.1785941595.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 16:18:17 +0200
X-Gm-Features: AUfX_mzXC69ugD711wUFTUYf8_epBYn0SrqMBsnLPgmbzyeuCwMrcI960ZDYq8Q
Message-ID: <CAPx+jO87d7H92KSR7R7ObR05sM2JcHBCo+YuUf_1gE-KwhR7CQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] R-Car X5H CPG/MDLC support
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyMyBTYWx0ZWRfX55fgIhXlS5b/
 h22kInnl6ILVtjDIu2WvXyfiWlcQ51FapRs4cNFaHOEt5x5UMu1EsRwxRyQEqbPKtaJuNfHbcWm
 h9ltzu1cY5UF/Jafw+9joGDw5p8r+zU=
X-Proofpoint-ORIG-GUID: uYemHEDg4Ukm6wAznWHSDDpB68ZbG4oi
X-Proofpoint-GUID: uYemHEDg4Ukm6wAznWHSDDpB68ZbG4oi
X-Authority-Analysis: v=2.4 cv=bfZbluPB c=1 sm=1 tr=0 ts=6a79ddb7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=HDY4BLWKCFmduH3Fo1AA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyMyBTYWx0ZWRfX3mqGLwQQYMIG
 78G8Qc3MtLkIj0XYBbnabqNv8cDQ+yBD9RSJPaK6KI/301uJR5lwMcDy0kJqSRfi3yPY8rEIEjP
 YpO0l/7yFAXCVtIf8H20oyy193EtrK6g/6FPsDIwAlk1NMmUu1Zp8UzyjRicRsxh3WpZKEi6/+5
 V4JGAS4ZYl2hFDWZNu/ny22eK5ISJ7vAAFuTRKu0bvKRM78Zl2zTZorpFfzhwopPcgLt7DYW8nf
 OyTkjETmHV2uPhUlSa3ZqP/7DO+pIp7mioG4KO0mFLIIu2amn0t5ZlTdKfBlJzS53ZpO9Lk6Vdc
 TRfaPv72QMBsbpRmBHPul8pfxLSSGhkv4zn+muUFrPkBCLJ8oF6154cp+AmeHKecCUZj0CnszZi
 TTYnvdKYiyaS7qybXsg0ZNuZSEtuR2kT/wwqmKeHN50SFBonzGhq8h+3JeUe6hnvbSNeJ/NDYNy
 7UPVZHualKMYzIJXN2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_071833_517674_CD8316E0 
X-CRM114-Status: GOOD (  35.81  )
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

On Wed, Aug 5, 2026 at 5:21=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>         Hi all,
>
> This patch series adds minimal support for the Renesas R-Car X5H Clock
> Pulse Generator (CPG) and Module Controller (MDLC), to aim for replacing
> the dummy clocks in r8a78000.dtsi with proper hardware description.
> These two components are closely related, in the sense that they are
> both supposed to be accessed through the ARM System Control and
> Management Interface (SCMI) on the Ironhide development board.
>
> This series consists of three parts:
>   1. Patches 1-2 add DT bindings and DT binding definitions,
>   2. Patches 3-4 add minimal CPG and MDLC drivers,
>   3. Patches 5-6 update the DTS.
> Note that this series depends on v7.2-rc2, due to the use of
> <linux/device-id/of.h>.
>
> Changes compared to v2[1]:
>   - Add Acked-by, Reviewed-by,
>   - Add fixed-rate clocks to kerneldoc of r8a78000_cpg_priv.map,
>   - Use devm_clk_hw_register_fixed_rate(), drop unregister_fixed_clks(),
>   - Drop fill_clk_map(), as it is not really needed until SCMI remapping
>     support is added later,
>   - Replace <linux/mod_devicetable.h> by more specific
>     <linux/device-id/of.h> in v7.2-rc2,
>   - Add a comment to document only always-on domains are supported,
>   - Consistently use /* sentinel */ for zero sentinels,
>   - Drop trailing commas from sentinels,
>   - Sort MDLC nodes (alphabetically, by label).
>
> Major changes compared to v1[2] (more detail in the individual patches):
>   - Add default support not using SCMI,
>   - Drop everything related to SCMI.
>
> Note that this series does not use or rely on SCMI in any way.
> SCMI remapping support will be added in a subsequent series (old version
> at [3]).
> Full hardware support without using SCMI could be added, too, if anyone
> would care about that use case.
>
> For testing, I have pushed this series plus additional work (including
> a rebased and updated version of [3]) to [4].
>
> While I know it is getting late in the cycle, this work (especially the
> DT bindings) are a dependency for about any R-Car X5H progress, so it
> would be good to have it included in v7.3.
> Hence I plan to queue the clock patches (1, 3) in renesas-clk for v7.3
> (Stephen still hasn't merged my earlier PR for v7.3 anyway).
> Ulf: It would be great if you could take the pmdomain patches (2, 4).

Patch 2 applied for next, but I left patch4 for now as it didn't apply
cleanly (drivers/soc/renesas/Kconfig had a conflict), thanks!

> The DTS changes (5-6) can wait for v7.4; they have a hard dependency on
> the presence of both drivers anyway.
>

[...]

Kind regards
Uffe

