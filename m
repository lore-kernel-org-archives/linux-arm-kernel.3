Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6B1C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 16:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SEyx7mXp0CBN5U4A0GlAKryjyrraw4ilP0q5c6hZVxA=; b=iH+DwjQ2eakBSklPDPmHYPdWhU
	aOihk1YBNIFWj9hp6CBRDU4SL4C7lcRM/l4cK/ug21I3vs3gTgZsU3Jy5+C7JSJc6+ll97vpzQtdY
	LRvqNJqHEW5C8SrURMPfoVvdKJLWWik13gtXZsDoCT9+fhBpwB0M8iQ7mnnkeHmzgC38EnFBJcSni
	LU8ynI8oOqhO4/CzTPxaGflXaucIlIktw5J9fAd5/BrDGg7epZO3htJrHZP2tNHuyFuJODpAdSEHX
	cmgMv7y/DhtCkTYXdgYCzcXcwL67ILDUAAe9v88TgBKl/QasD0GINGo5srweEjtypwyPsD5jRX03Y
	i4djTjMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtbC-00000000C0R-1yWS;
	Mon, 21 Jul 2025 16:42:46 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrQq-0000000HVm7-3YCJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 14:23:58 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-612a338aed8so6602591a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 07:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753107835; x=1753712635; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SEyx7mXp0CBN5U4A0GlAKryjyrraw4ilP0q5c6hZVxA=;
        b=z0vvV0wPlIvmMHa8HHAIUueiLvTdI0f3019hcbFLTpUltC1PGIwNorJ/Z4ipI/0TkK
         vnzjmlOqchaio5IGz7j4i4M7RW3hkrwonHM/TFwxRoR/6Qdd/Z560OZaudopmEgFQ0Zu
         2fhWvfu1VeMwnwZaNEMhJdTY8AhpoU4sj+N00NUEmpovYt1q7QRL1lRUZ4saRcof3HOT
         QQtDXNyw2DmU1FunvOJ137/KQwtI8mc7/kvneZVGbeUtisNTm3xrx2RqfuXcizhOHmsg
         aZmzHZyI8cKcTuVkqt2qhkD2wEf4kq2RpwJjKJY1W3Sm05+SYClVujrDe11qfKLyp66+
         CBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753107835; x=1753712635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SEyx7mXp0CBN5U4A0GlAKryjyrraw4ilP0q5c6hZVxA=;
        b=Yg7GQeWaknxsTN4uezita2iz7mrofqg4pgwqgktUH4HpoFDwu33DG/vyI6Ls9mEPC/
         MQd+qzH5QrodNP3sSZio2Pe8z3wxE4s5NgnO0wHJRBAX13eJr9GaoOBI8EHUTQygYz/H
         tcemwCuIId4j1OQXZnqVjSh2fr6YS4GD43LzKYRPLbDxNU9RJoLPDHmbAf91prmFqkcn
         omcXwlWynJ3S4m6Sc6VVQg0DvSsdzDSaYPlrMU2BxqSaYtJfLBfAedPLYaCOfUvfEYQO
         gBCleCnlmFEqCd4vZhQoSqoFJEK0pPiA5MxY05jj7q+23kEmZMG/8dr8ksRA9PSyOrtb
         m6ew==
X-Forwarded-Encrypted: i=1; AJvYcCWoufQsMqLL0J6lfAHvzbo0xKE3UUN8kC8Nj8icAUqCXlEg9X4y7IubtmGYTNJSpjFc2Krt71cp4NtbPBUwG0JZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwsSjRXxFt+JGZMSoGGxeyhB7GA872YY0PmtnbHMg2Hzjs3IEOA
	/iMdMUNDMcDc31Aja0s1X1GzKaL0sCSATYdHOfMiGOP/poyFKMD7150Linmdvl8iYAy2IDwgUtt
	Ol0sgtErXsWLu9V7K1DPlDWN615HaoVlKNX2Oinw+tw==
X-Gm-Gg: ASbGncvQNUgB882C4yKgkU/AeojK7abeQOAZNNlA1Dqb+xha/3a0fOXI3pt/5E/G0sY
	A+JCTkxTYhnk86giFosboM+WwOoMbE/amhXPybkEkJ76JF0iNV4xS/VVi3EOY3zaq1q7MIQLhh8
	TlUlX9JxTTeCdd5G5i+EODMz7thv32KPGMZuG5GObDi65zWDOlchhw74TxdjKMddt1SURPMBWJl
	6K8ic25AMtppy7nqzZN3stzDidFxfYSoM17V8nswQ==
X-Google-Smtp-Source: AGHT+IHor38rIn1pKQ8nwqf0yJIzbBDIXbeXdkm2JdEKFu+t76hq+Bk4KT28Qumkw/JEGQLQ2XhgOcoW88Ao9YcH/5g=
X-Received: by 2002:a05:6402:1d55:b0:612:b057:90ab with SMTP id
 4fb4d7f45d1cf-612b05793femr13050702a12.17.1753107834605; Mon, 21 Jul 2025
 07:23:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
 <175224423523.783161.17907302929832941912.robh@kernel.org>
 <PAXPR04MB845959EF2767C96794EAE6DD8854A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <aHkNS51jgV5ulsNB@p14s> <20250718082033.GA25126@nxa18884-linux>
 <aHp-_BRk7Iz81OFp@p14s> <20250721041823.GA4844@nxa18884-linux.ap.freescale.net>
In-Reply-To: <20250721041823.GA4844@nxa18884-linux.ap.freescale.net>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 21 Jul 2025 08:23:42 -0600
X-Gm-Features: Ac12FXyw4hdh1l-EicP3Q_nexU8h_sXbH3xvX_eih-XxJ9DgAS3dub9_bfFRYgM
Message-ID: <CANLsYkwZz4xLOG25D6S-AEGFeUBWwyp1=ytmu2q90NyEpkoX9g@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, "Rob Herring (Arm)" <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Frank Li <frank.li@nxp.com>, 
	Bjorn Andersson <andersson@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_072356_890552_B373A737 
X-CRM114-Status: GOOD (  36.49  )
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

On Sun, 20 Jul 2025 at 21:08, Peng Fan <peng.fan@oss.nxp.com> wrote:
>
> On Fri, Jul 18, 2025 at 11:06:04AM -0600, Mathieu Poirier wrote:
> >On Fri, Jul 18, 2025 at 04:20:34PM +0800, Peng Fan wrote:
> >> On Thu, Jul 17, 2025 at 08:48:43AM -0600, Mathieu Poirier wrote:
> >> >On Mon, Jul 14, 2025 at 11:52:05AM +0000, Peng Fan wrote:
> >> >> > Subject: Re: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
> >> >> >
> >> >> [...]
> >> >> > New warnings running 'make CHECK_DTBS=y for
> >> >> > arch/arm64/boot/dts/freescale/' for 20250710-imx95-rproc-1-v4-0-
> >> >> > a7123e857dfb@nxp.com:
> >> >> >
> >> >> > arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb:
> >> >> > scmi (arm,scmi): Unevaluated properties are not allowed
> >> >> > ('protocol@80', 'protocol@81', 'protocol@82', 'protocol@84' were
> >> >> > unexpected)
> >> >>
> >> >> Same as replied in v3.
> >> >> This is because [1] is still not picked, not because of my patchset.
> >> >
> >> >I won't move on this patchset until this is resolved.
> >> >
> >>
> >> Not understand why hold on this patchset. I suppose you may not
> >> understand what the error means. The warning is totally irrelevant
> >> to this patchset, there is no dependency.
> >>
> >> Others added a property to arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
> >> &scmi_bbm {
> >>         linux,code = <KEY_POWER>;
> >> };
> >> But this "linux,code" property not landed(missed to be picked up) to DT binding.
> >>
> >> This patchset does not touch scmi_bbm. I could help address the warning
> >> in the other patch, but I do not see why "linux,code" under scmi_bbm node
> >> could block this patchset.
> >>
> >> Please help clarify if you still think to hold on this patchset.
> >>
> >> BTW: with [1] "remoteproc: imx_rproc: skip clock enable when M-core is managed by the SCU"
> >> merged in Ulf's tree, there is a minor conflict with patch 2. Please suggest
> >> what I should do with this patchset.
> >>
> >
> >I was afraid of that.  The best way forward with this work is to wait for the
> >"linux,code" property to be picked up by Sudeep.  I suggest you make sure that
> >he, or anyone else, picks it up for the next merge window.  If that happens
>
>
> I respect you as maintainer, but there is no reason to block this patch
> because of "linux,code" property. It is totally irrelevant.
>
> Even if I help to resubmit that "linux,code" patch, there is no chance to
> land into 6.17-rc1, both Sudeep and Shawn sent their PR to arm-soc earlier
> before your comments. You could raise in V3.. which there was time left.
>

I don't know what you mean by V3.

> >everything should be set for you to resend this patchset when 6.17-rc1 comes
> >out.
>
> Because of the code conflict in Ulf's tree, I will hold on until 6.17-rc1.

Exactly

> Patch 4 and 5 will be removed from this patchset in V5. The two patches
> should go through Shawn's tree, I will resend them in a separate thread
> with "linux,code" patch included. There will be no more CHECK_DTBS
> warning in V5 for i.MX95 remoteproc support.
>

That is a better way to proceed.

> If you have concern on patch 1-3 or else, please raise earlier. As of now,

If I remember correctly, those patches looked fine to me.

> patch 1-3 in V5 will be almost same as V4 with only a minor code
> conflict resolved, with below change
> @@ -1030,7 +1030,8 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
>         int ret;
>
>         /* Remote core is not under control of Linux or it is managed by SCU API */
> -       if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
> +       if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API ||
> +           dcfg->method == IMX_RPROC_SCU_SM)
>                 return 0;
>
> Regards,
> Peng
> >
> >> [1]https://lore.kernel.org/linux-remoteproc/20250629172512.14857-3-hiagofranco@gmail.com/T/#u
> >>
> >> Thanks,
> >> Peng

