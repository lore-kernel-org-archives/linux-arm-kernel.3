Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807B7CCF2DD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 19:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/ksvhxDAHEK6GRShjDfoLa3UE0f58CuM5UI6afaKhU=; b=yCFxEpsHzEuJMKg4p1j3DrlQVX
	fW1iP6t8gVUygiGxF6lK9WcacA/pGhs77VtNd6HhaS7cnJ+X4FYEEL006wey0bOeXpD7m2lkO6eEF
	mPwWbes+OJukScTqlUPLEw90RlRnWsAjUttL9rJWD12fqvMiGtcLrwPvq/4xHijIWwOiGyfQycmmF
	8ec1N5Ijt+Uh++WYjd3UbDdxGEMXT6w253340lj/+Hm8r5hEwf2wIuCWSWRvo9U7n0zp0ZjZIqfVB
	hsG8D+hQykoC7zBp/telRk9/cNiXHLkPfgqGeIixnWmUSoUKpScEpP2UGeyTLfnVb0G+INu2HGOjY
	rC9txkdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhusf-00000002mSO-1y1B;
	Mon, 19 Jan 2026 19:25:41 +0000
Received: from mail-qk1-f174.google.com ([209.85.222.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhusd-00000002mRk-0YIy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 19:25:40 +0000
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8c538d17816so608863685a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 11:25:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768850738; x=1769455538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/ksvhxDAHEK6GRShjDfoLa3UE0f58CuM5UI6afaKhU=;
        b=TRk05vXsFisd9nML9rJjW9h5sGUSI1FO1DuS+L0ZwECRC0WeItsvMO0bi4VM1+RwNf
         ISfVGSSMri8dbZW0R3P/P+hQfg64o38TWSLyHRLqzqWLGRhK8r/A0cj9GCkDrIGorwj9
         K7hXW3YCufO9x3G0mhDqHJ0KuL07wG/ppwj2v2x3jx4aS+BsEKvLJSu0qMLsEw2ahXJq
         DTiRFElnXqIMn1qwqQ6Hhb2HygnQEVhZoSvt5MCTIs1wa3oP7QDuYg9If1k6NOlKclFz
         iBm3QKTpGXjZXLA8amjlmJ2s+JwJC2yOmY6V4vEPAUAR9mSNijTUHGMPfnpitEtMX2MY
         dQcg==
X-Forwarded-Encrypted: i=1; AJvYcCUztnt5SteZYiXIreSkmhkqf/uJ6gV9aZBSWU/LYw52gJSUBLTbYhsqJridevDQ7wABzo1yx47oYIx5KqtWnAb9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4s2SriajlfCDNoLrkb3T5l3O2sw7acT/jnbAxqO9Cjf2ycLpF
	N03qGsrhZu0Z6AEpj35fNI3JrnLpKQHsd0zRK+Jy1oxNhLCClIzRqyblaGSGi1x9
X-Gm-Gg: AY/fxX605EyAYh0vT8uArgiiTZTxm+STjKadSNNmqJqmnBRqwqempfTBwMLoNeCkdH9
	CQmKAFT2DkL9w8iyrxPEM+oeeFIlvm/5yjQz2+8CSfyJ9Hf8vLKRLce3do1nssnYIAfxOoWW14Y
	DPSjdJkfukNYRqioM7M2B2SMReEnhY/NHd3J1zikdqjU/On5aYwEkzEDoNzQ5ncA0b8deocgkUF
	u4Gm3QcGTp7WKzY+zXIWUxMcx1oPpYelXUknyUeSYMpkVGsLNg08ZROhzeTvdhLGBo6skRfRRJ5
	P5Y1qqq7PCk3o/61EzbN8AbsYJgTTYK+m3KgNbPFuKt4SMN4RuisSuJoO5Ukx8Ec+jc5iMhVusQ
	heXVZfuBO3VQ6aLywRX3xoEbboDFj2WOAfE86p5111ni7NLN+oc+QcUO8wLF2jXoIa8Vkt1o1AW
	2Q3AnS66xcmf4YMOB8ofaffzVuL3Ee5lgT/k4ElHxMMYhr1HDzX2Ma
X-Received: by 2002:a05:620a:2802:b0:891:a6b0:7cda with SMTP id af79cd13be357-8c6a69631a9mr1886573185a.81.1768850737531;
        Mon, 19 Jan 2026 11:25:37 -0800 (PST)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a724eadcsm860052985a.29.2026.01.19.11.25.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 11:25:37 -0800 (PST)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8c6a7638f42so563189485a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 11:25:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6qiAV7013Mc/N79wd61upgf1WRaVeEVx+F1raSmEcDQDirRjN6y4D6in3N1aaRQA8Hd8B3HiRCFhDD1YcYtWm@lists.infradead.org
X-Received: by 2002:a05:6102:dcb:b0:5dd:84f1:b51a with SMTP id
 ada2fe7eead31-5f1a720e344mr3315725137.43.1768850261678; Mon, 19 Jan 2026
 11:17:41 -0800 (PST)
MIME-Version: 1.0
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com> <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jan 2026 20:17:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVG-2qucH5dB40CO=8Haw080NqxE-zg=GyVmD2njs-ibg@mail.gmail.com>
X-Gm-Features: AZwV_QiDYUVl5G1JTvUBamxzE_5VCyogXoHB30dVWIYjGOrIgN6mvoOLoE2_KFA
Message-ID: <CAMuHMdVG-2qucH5dB40CO=8Haw080NqxE-zg=GyVmD2njs-ibg@mail.gmail.com>
Subject: Re: [PATCH 1/8] of: provide of_machine_get_compatible()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_112539_177728_9D1B2885 
X-CRM114-Status: GOOD (  23.89  )
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

Hi Bartosz,

On Mon, 19 Jan 2026 at 11:40, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Provide a helper function allowing users to read the compatible string
> of the machine, hiding the access to the root node.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch!

> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -434,6 +434,19 @@ bool of_machine_compatible_match(const char *const *compats)
>  }
>  EXPORT_SYMBOL(of_machine_compatible_match);
>
> +/**
> + * of_machine_get_compatible - Get the compatible string of this machine

... the first compatible string...

Do you see a need for adding an index parameter?

> + * @compatible: address at which the compatible string will be stored
> + *
> + * Returns:
> + * 0 on success, negative error number on failure.
> + */
> +int of_machine_get_compatible(const char **compatible)
> +{
> +       return of_property_read_string(of_root, "compatible", compatible);
> +}
> +EXPORT_SYMBOL_GPL(of_machine_get_compatible);
> +
>  /**
>   * of_machine_device_match - Test root of device tree against a of_device_id array
>   * @matches:   NULL terminated array of of_device_id match structures to search in

> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -426,6 +426,8 @@ static inline bool of_machine_is_compatible(const char *compat)
>         return of_machine_compatible_match(compats);
>  }
>
> +int of_machine_get_compatible(const char **compatible);
> +
>  extern int of_add_property(struct device_node *np, struct property *prop);
>  extern int of_remove_property(struct device_node *np, struct property *prop);
>  extern int of_update_property(struct device_node *np, struct property *newprop);
>

Do you need a dummy for the !CONFIG_OF case?
This is only used by drivers/soc/fsl/guts.c, and FSL_GUTS is selected
by MMC_SDHCI_OF_ESDHC, which is OF-only, but can be enabled
when PPC || COMPILE_TEST.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

