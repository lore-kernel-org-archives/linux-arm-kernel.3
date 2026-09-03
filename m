Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742F3C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 10:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sB2LZifEeupjsxCHsRGx0RoKXBpeYPjdfUIFuUgunMM=; b=COsIWP7/ZZrN9c
	8ZBjrejZUPOa4zrx/scICDViVLZl3yZT6jLAca76tc7qXjTB7FQkvboG0plXchczvvSWWRtg1vjiQ
	9hz6YKZUvVXx3TUkImlKGjEnswi2kPPNhdDwJ0Ar0Ov3sDJJyyiuERfQEFQZUTA1HK+j2TJN75KFk
	u5FCPH1NII61ycwPFFID8UOcp7ELdeTRMn32XtkHblCkcALyBeIa6fqtPDvieG8+TOt602imRqRA+
	l3+46UMjb70if9+JeIVYX33TGsld3pjAX4U6XS18Nd8zz0/ysFnw6cXh/nRHfmEIeafZHEFpcqzYI
	QLFp/1kqPvKvQzrVMn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24Jv-0000000H1z5-1r2M;
	Thu, 03 Sep 2026 10:05:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24Ju-0000000H1yj-06mn
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 03 Sep 2026 10:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description;
	bh=sB2LZifEeupjsxCHsRGx0RoKXBpeYPjdfUIFuUgunMM=; b=pdvzsGZ+KHwA0fTcvyoagIHJ+0
	D65L65PqM495j6pDqSpBrCKe+m0oW0MwH/3XB4WUzY/WTSBgGlxb7w6f45deUaYQAUjomlhSMRQak
	NPvmAK9y7E3Onw6GvctDZZTvLgoqbCn7WhwgCOlFwcqnNCU4AFbXdWgM35DoAz0HGG8BXqVlL6c2O
	CQmiV9AxCxH9MkFcfnbZ2vlf16t87epVUIiZNWs2UFND7QBKc/SGxzL2N269koc7bVdYDMpbRj1/Y
	z0/SN/G3EM+/26VxEJXdZyfBBJ6/7EthuNSzF7Mgg++qBRUwkLx5lUgAT5Ol3J47R1a6kb6JYQMtN
	OfMMiJwg==;
Received: from mail-yw1-f170.google.com ([209.85.128.170])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x24Jq-0000000CxVf-31tn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 10:05:20 +0000
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-86d43cdee51so19582817b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 03:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429914; x=1789034714;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sB2LZifEeupjsxCHsRGx0RoKXBpeYPjdfUIFuUgunMM=;
        b=i9n/J8qEfd3Vrr91UjlBUVyxhwaXqZtC+YCgiXGXpO3DTvSkI+0+V2ITz8jMdvW1pW
         xcpli0TOGCP/GDS13DglOrhcegNxGXYBvlVAd0glMyWZok3hiDXFMllg/zr0ltiVayON
         bVZzfqIzq78JPBslAi6SyNup5KUCbrZI4Vk0oSffQKJepB/vTHM0NtQ9BvBPMhJNgX+z
         dF77SzYpycuy3u4fnA8l1+EkTZmvABwtCrVtvboYYp3OTB0VCxaL521DTO9nOYUx53hp
         7t8OE6nfAR+tedFHHF7Nfj78hSDo+AlG7OZ5uGcBqdYJOe2sL/qfcduqtyU+k1ezQV8R
         iXqg==
X-Forwarded-Encrypted: i=1; AKwUvByMZw+M0Edt7KTw45dWbVPwY6Z7xgQvTRgRhGxld9+K2txHkHLf6TQ24CeLaqNrlt1VD/Zo7j9x4Q4PjSq183cQ@lists.infradead.org
X-Gm-Message-State: AFuF++kPZyEOrWaWOYoN4mmwScsAA9tHLYTb/GQeEP3sO3nX3tVahVEq
	LRIORPtGUIenO7FPf5jCME+beVXLcCPXo4Sn5neASdEHpLxFvP3lo6uWegKI2r7bSR8=
X-Gm-Gg: AYBFou1+DrmaGsQiKdnfS5m5AGn3c0a0yRv3LN46+xzPaX4ExypS3mVoP3Me4IN58nH
	tuMa09b4EjxsDPIg2MKCZOcOaDv2YYdIeo0dORgGG7u93dJ7fJ9hR/xmoxw5Rz/EBeEIodLOuup
	QfrxzMqn8D/SboA1rFJFJXaAvA0ja9bQKPN8Li8UfWvAMxlC4bq1+Q18LDdZ3tDSamUbj+BZfDD
	aOOXRPoV+9FFjkpEBnafPMng44iNjHC0/0iWE694F++I5ojIwPiN/H8HKPvWGgc4fPPh8gXzf7T
	3nVS9Lakw+zAN0dxlA8WPqoLxA01pcxehirIVBWE/EJkLQP1HBIhniRX2OLmO4Ii2ihQnBZ2Vq/
	OFf4FhO/EGubCglySDL81z9rY6D6y9LoGghjRR++Arg/T9OvpVB318Uk3lFsg3OJflFNN20PzzC
	VVhfgEiIHrJ0eQGbMxcvGLe7l2GEAdTrlK2ybi0ZZzp64IHvd87d7fclEOtPZHv8vbA38ub4Rxt
	ylTXh5vrUGd/0I6WVvtv5gi6AO4XgNshVv3rZrRLvfUZO7uQArt5n0nfhTCcXA=
X-Received: by 2002:a05:690c:6d84:b0:860:607a:93d2 with SMTP id 00721157ae682-86c478e734bmr58039127b3.0.1788429914403;
        Thu, 03 Sep 2026 03:05:14 -0700 (PDT)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com. [74.125.224.46])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-86c1918d51fsm36431217b3.45.2026.09.03.03.05.14
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 03:05:14 -0700 (PDT)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66bd7857841so2976858d50.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 03:05:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxN3wWaFMKEWBlnDwq+p0dw2T7Yv9XefF/kwALUUClwUOnCK/Kpj4nBG9d1J+ZLEy3oLCbetZ0pUdj6cE+PwrUN@lists.infradead.org
X-Received: by 2002:a05:690e:4890:20b0:66f:afdc:b49b with SMTP id
 956f58d0204a3-66fafdcb54bmr290871d50.0.1788429913913; Thu, 03 Sep 2026
 03:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260829094758.23248-1-tanure@linux.com> <178818026093.2318126.3676223463693214854.b4-ty@b4>
In-Reply-To: <178818026093.2318126.3676223463693214854.b4-ty@b4>
From: Lucas Tanure <tanure@linux.com>
Date: Thu, 3 Sep 2026 11:05:02 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+17CLQ_4-rcj0KD6kzPWnChQfD3irCR7-h1bGH9hWiD7A@mail.gmail.com>
X-Gm-Features: AcwNN1VRB2D0FTXRpcvHAcbTlWB5xZQpxaG0zutz7J3nfFbo_PpnG2ATadEMYz8
Message-ID: <CAJX_Q+17CLQ_4-rcj0KD6kzPWnChQfD3irCR7-h1bGH9hWiD7A@mail.gmail.com>
Subject: Re: (subset) [PATCH 0/4] arm64: amlogic: t7: describe the VIM4
 supplies and keep the fabric clocks running
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Jian Hu <jian.hu@amlogic.com>, 
	Ronald Claveau <linux-kernel-dev@aliel.fr>, Brian Masney <bmasney@redhat.com>, 
	Chuan Liu <chuan.liu@amlogic.com>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_110518_991776_EB81CFE1 
X-CRM114-Status: GOOD (  22.46  )
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
Reply-To: tanure@linux.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Aug 31, 2026 at 1:44=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On Sat, 29 Aug 2026 10:47:54 +0100, Lucas Tanure wrote:
> > The Khadas VIM4 has needed clk_ignore_unused to boot reliably. Without =
it
> > the board hangs at random, loses storage and corrupts memory, and the
> > failures move around from boot to boot.
> >
> > Six of the SoC's PWM outputs drive the board's voltage regulators: the
> > always-on domain, both CPU clusters, the GPU, the NPU and the DRAM. Non=
e
> > of them were described, so Linux saw the outputs as unused and switched
> > them off about a second into boot. The regulators then drifted away fro=
m
> > the levels the bootloader had set, which is where the corruption and th=
e
> > random hangs came from.
> > Thanks to Chuan Liu from Amlogic for helping me indetify which clocks a=
re
> > critical.
> >
> > [...]
>
> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogi=
c/linux.git (v7.3/fixes)
>
> [2/4] arm64: dts: amlogic: t7: fix the pin groups of two PWM outputs
>       https://git.kernel.org/amlogic/c/ae7be5c58a819259e5eb98a3abfa608424=
78f2ae
> [3/4] arm64: dts: amlogic: t7: khadas-vim4: add the PWM-driven supplies
>       https://git.kernel.org/amlogic/c/1e5a53bd16ac501e68463e84023d1bff54=
3cc696
> [4/4] arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM
>       https://git.kernel.org/amlogic/c/406292fd75f95aa3010fec95b5beb5a8b7=
e3ba3a
>
> These changes has been applied on the intermediate git tree [1].
>
> The v7.3/fixes branch will then be sent via a formal Pull Request to the =
Linux SoC maintainers
> for inclusion in their intermediate git branches in order to be sent to L=
inus during
> the next merge window, or sooner if it's a set of fixes.
>
> In the cases of fixes, those will be merged in the current release candid=
ate
> kernel and as soon they appear on the Linux master branch they will be
> backported to the previous Stable and Long-Stable kernels [2].
>
> The intermediate git branches are merged daily in the linux-next tree [3]=
,
> people are encouraged testing these pre-release kernels and report issues=
 on the
> relevant mailing-lists.
>
> If problems are discovered on those changes, please submit a signed-off-b=
y revert
> patch followed by a corrective changeset.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>
> --
> Neil
>
Hi,
Please don't take this. I will submit a better version.
sys_ampipe_nand should not be critical.

Thanks,
Lucas

