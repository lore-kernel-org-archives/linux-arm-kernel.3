Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E5BC88E45
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 05:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWSKXBlRVQK4HizOnCRfHvGpk/soRBqoRAazsxuWHOM=; b=vLzGv14Z4O6hyd5M7zb4OCPgEc
	AC9oyhos3hNzWH/frMJf+Fp3yJYh5Uf+dtk9DC279kqKhqAy8jUCS9rCGV+oVIcZIa7Fxic29Bdy2
	JPV69bbGuppXpPGNFCDUjHgZRtrcwb2JWd5mQqjBFjXDL7wn49uXt+RVXHgd26qufM2Ty8JfkQWFu
	NbimBjRzXTlaErM+/gG0LtDEIIpcfZ/HhQSpq8+jvjyaoZHkXZ4CPRrlKzgJcGol/kZyJgrzuGBpz
	NSWFGZUEwKh7Y/mw9C4oPeAxwJJULjialNEc4ZTXIMR1DQgZ02Z1UHivmpt1LKwniDGswQYd3oN0f
	hUQ98x9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Gfi-00000000ZA4-1yXd;
	Sat, 12 Sep 2026 05:53:06 +0000
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Gff-00000000Z9j-3oX0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 05:53:05 +0000
Received: by mail-yx2-x11.google.com with SMTP id 956f58d0204a3-66f943b286fso209988d50.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 22:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789192382; cv=none;
        d=google.com; s=arc-20260327;
        b=BXtBoAflYJGSGTgMlyVpY9uBK/LVK526l332n6bn7s+CFXkp2rIXvv+sfpX7xwIOh+
         VXuCAnze0HIFEkGklaCWfgGHIhGpQPZ0iuwJ2AFo73ePZwpnbOh7bktvmH2+FvApzA3Z
         kpi3c6HKF16Yp2Tn9SWDAVI3bKKCXR6VywBXs5cahOZ7/M7XTDOX9CAudaIbIz5EPCfN
         dgQt2CQDQ9okCASf5a2Z708IqD8bdFEwWkqjrslldV9xZ88+lqBQRqXfkFlESIW7FbKo
         1tUcAsvHDrmeygGIbapbWRHb72b6zFWgVBBN/sCNExuBb9H7JbMWZh531KE9gXca5nU2
         qxrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FWSKXBlRVQK4HizOnCRfHvGpk/soRBqoRAazsxuWHOM=;
        fh=ck5O4UR/xLqc5plaN3At9uIgmouj1bS5WwqRsv3YCeE=;
        b=Q/E6EGyhdetD7x6Ahxmi4oWU4qTJ6pqYUO4OJSoHNdsVnuJZBxcPN55NAU8sZUmNjK
         0EdT9pYIwzeTMPz6Gib4pJy4kFSiqvEilVWlEO6R47AOoooSuMdzQdh8KWuVvRJ+62JA
         nIjiWyaXv1ARcVF0pjLz1OIPmdYeq9fYglQb8VgbYJ4dtzIZ59yHJR16YjNMW/H35VO9
         Qftgt5LBuOKscO5cP2nUgpKjeRvUyMoAK6ghOEARizMQ0ogGumLxfDm1CzVxOu5r41WO
         K1+deb/FYpgKLZSmY/nXq/krb6wEWcP0AoNX8krOhBSjOGmlten5n5uNcSJCKOUNqJK+
         o0Qg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789192382; x=1789797182; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FWSKXBlRVQK4HizOnCRfHvGpk/soRBqoRAazsxuWHOM=;
        b=SGAE0gdeleYQs/uKYPW/lORNcjFtoBBIcLdGzuV0gayAcq0Wcm/l5IAET1/7p030G7
         y1h03v3if8bZ8p9jAS0c0AlWQIvVWo8c+cuYO2JJHufcqtgLKibNl8bL6tWHObPQqZ3w
         gDi9lRwecWMfUovIkyEVpbo3spIBo96kHdjS7XuYz2XwbjM8VBR94IE/xB2to42S7kYh
         OR/qHRv3oLjtAfQTMqEmAPW8m3v6ldMsEoMUwQ+jhkDqVREzxaNOVC5R+ay2zDKtRtBM
         Rz2cwL3rV3XacgMl79c/YhROXAnXf6ks1dnE+nHO6ACQtGSJyqKahet0PrHinbcmuWk2
         4UKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789192382; x=1789797182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FWSKXBlRVQK4HizOnCRfHvGpk/soRBqoRAazsxuWHOM=;
        b=NXhxSsupRBnyWrMYwqta1xd2pL6a7VIUDlGhUg3TyNkz9T01oFYp3YpTc1GyhXKyaa
         LVQjzYmWyOKyY0WjCEXu3GUXmyys3V9Q9b9QifBjT6e7qPB+AvfwusebGGpBdBdHVc9V
         Gl5fsOxhKjz8ykKoAZN5o1NSghRDaqiRbG4gO8IYhbmTjv3/6WC0HHt+ipggIGzDHX/W
         8FSybuBuXVo62m/2bWSt7o/5gJwEnNg5mTeRY6QzG3uixo+QqE7viYH3+pH282sIcrWZ
         v3hhhKNx8ZL+bnaaeXAZ8gYvUKS+i6StiEn9t1YpgdB1yiJUFn5o4EVfVir/99ZzedOJ
         4SQg==
X-Forwarded-Encrypted: i=1; AKwUvByIxLZ1YB0WMxo7TJ4oNUrSTnUdkgaqxM86QOLbudXRdIr5d59Dsa14PSs79sZepejJZSNlsermOPqddTAJt1cR@lists.infradead.org
X-Gm-Message-State: AFuF++khpKD9URi20DWcer4DPPB2ZyCnrFFym3dP/bgXtP1hpwZ+eDam
	j06dgxkJ3rNyVqWaOgrLFAjZoVFnNJclq+VTSQKGnPkKZ2FbH89h2Ann6rt06MQ35XdB6QXMbay
	gBnzJD8TRrKEmJ6toi8iHJSHYwB0MQG4aq9eDkQfzBA==
X-Gm-Gg: AYBFou2q3mAGueY6yUDZUGa49HMxKHDMgKxxF0aiqGA3XCK+WYzF790+t22PCd6mdL9
	1o3ueGcO8XXbO7yWpGaz7HKol+/pwBDr4OvPNmsdYHfYndolUjv6WDdd/pSZkGWpQJYqHAzROl3
	f8O1nYjsXZEMyi60N6OA/8ToOUp9A6XO5cKf1QAomotdTGoH0+nXOxAryB3GOgVU/pKhx0XmKbW
	8UAXZHF4nNmh7XxzubIneLPSD9HOB2U51UkfyUwjGGkCFP5tIvFPPCNq3OK74OmxORBtjAFLTd+
	7Ytuma5HEbvIdp1SUi8P4O9lCk9rf+1r2kMRixTZj0GeLnH/8ZBozLJl6yEgvUFx10Wano5uoMC
	dXDp8SXP3sZTflA==
X-Received: by 2002:a05:690e:12c2:b0:66f:c1be:84cb with SMTP id
 956f58d0204a3-67135a1d461mr326324d50.57.1789192381752; Fri, 11 Sep 2026
 22:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
 <20260727-exynos850_sram-v3-1-8627a49188ec@linaro.org> <CAPLW+4ntx8qLy9jAYYdT+XwxwKHjvisutqEi04oPEQny8auD-Q@mail.gmail.com>
 <DLCMHTJ9SYL0.3HW3W6N3PFYWM@linaro.org>
In-Reply-To: <DLCMHTJ9SYL0.3HW3W6N3PFYWM@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sat, 12 Sep 2026 00:52:49 -0500
X-Gm-Features: AcwNN1VD8BCzWQBSI8YU3zjpwgpLQB8VunevE0JIHRoygZZzTiTyguyvXbn5lqw
Message-ID: <CAPLW+4kS-75pC46xFSwb8oUUvmyTOysNGrei8h-My0=2d0p5hQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: sram: Document samsung,exynos850-acpm-sram
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_225303_999587_0B926E2B 
X-CRM114-Status: GOOD (  38.79  )
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

On Fri, Sep 11, 2026 at 11:20=E2=80=AFAM Alexey Klimov <alexey.klimov@linar=
o.org> wrote:
>
> On Fri Sep 11, 2026 at 1:42 AM BST, Sam Protsenko wrote:
> > On Mon, Jul 27, 2026 at 8:23=E2=80=AFAM Alexey Klimov <alexey.klimov@li=
naro.org> wrote:
> >>
> >> Document "samsung,exynos850-acpm-sram" which represents an SRAM region=
 used
> >> for ACPM communication on Samsung-based SoCs.
> >>
> >> The SRAM is consumed as a whole, is not split up using child nodes and
> >> properties related to this are not required.
> >>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com=
>
> >> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> >> ---
> >>  Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Docume=
ntation/devicetree/bindings/sram/sram.yaml
> >> index b83fc6831947..b9c4d4f3199b 100644
> >> --- a/Documentation/devicetree/bindings/sram/sram.yaml
> >> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
> >> @@ -43,6 +43,7 @@ properties:
> >>          - qcom,rpm-msg-ram
> >>          - qcom,shikra-imem
> >>          - rockchip,rk3288-pmu-sram
> >> +        - samsung,exynos850-acpm-sram
> >
> > Is there a reason we can't just use "mmio-sram" for Exynos850 ACPM
> > needs? I can see it's used in the gs101 device tree like this. If
> > there is a reason for this, I think it might be a good idea to
> > document it in the commit message (probably in both patches).
>
> But isn't it already in this commit message?
> "The SRAM is consumed as a whole, is not split up using child nodes and
> properties related to this are not required."
>
> Also: https://lore.kernel.org/all/5797be19-8886-45a2-bfce-eb7d5f0df6c2@li=
naro.org/
>
> Do you want it to be re-phrased smth like this:
> "OSPM ACPM should parse the SRAM and discover essential data (e.g. queue
> offsets) for establishing ACPM communication. At this point it is not
> expected for any software entities apart ACPM to use SRAM so the SRAM is
> consumed as a whole, is not split up using child nodes and properties
> related to this are not required."
>
> or
>
> "The OSPM/ACPM IPC should parse the SRAM at runtime to find configuration
> data (e.g., queue offsets). Because this SRAM region is dedicated
> exclusively to ACPM IPC communication and is not shared with other
> software entities, it is represented as a monolithic SRAM block without
> requiring sub-node partitioning."
>
> ?
>

I was thinking about something more like this (in addition to your
existing commit message):

    "mmio-sram compatible can't be used for ACPM purposes because it
requires child nodes to be declared, which are not needed and make no
sense in case of ACPM."

basically to answer this question directly -- at least if I understood
correctly what was discussed with Krzysztof [1]. Other additions you
mentioned might be valuable too. Anyways, that's just a suggestion, I
figured if you're going to submit the next patch series version, might
as well provide more context in the commit message, but no strong
opinion here. Also, feel free to add:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> I hope if there will be other software entities then we will be able to
> fix it later.
>
> >Also,
> > should "mmio-sram" be added as a backup option (after comma) in your
> > [PATCH 2/2]?
>
> Sure, I can add "mmio-sram".
> The compatible =3D "rockchip,rk3288-pmu-sram", "mmio-sram"
> and compatible =3D "qcom,rpm-msg-ram", "mmio-sram" are used in such way.
>

On the second thought (after reading your discussion with Krzysztof
[1]) that probably is not a good idea, kinda defies the point, because
for "mmio-sram" you'll have to provide more stuff in the node, right?
So I think it's better to keep only:

    compatible =3D "samsung,exynos850-acpm-sram";

in your [PATCH 2/2].

[1] https://lkml.org/lkml/2026/4/14/523

> Best regards,
> Alexey

