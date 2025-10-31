Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAFDCCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 09:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rfyBZJmdoTsV5mASRVjVSK13eALqQJfbT9fGRd81eVU=; b=WL2ZFQbwmt6U/ZhTomiYhlJDsv
	t6fmOnRV4prT3H1KfXYz0TMVsyvEmrPZGFTLtAyHxMsbw6kiVOaJMCVC3KJxmsuwIyKpMGTBYrGD4
	5hPMgIENZJ+8IjDA9NQnhmnXn08XzPoBAQEkQ43+UvC1IMeP6DkNIN0j/6oO97xr16rQGKvH8/l98
	EWQJC/duBNHJFlRGiKZc4Pojwxc7lQ66c9uFGxxp2IfJ6cI+inpC8SefmLPwyrRMWZ1n1S2pr7rgI
	6oOatafKwooimuRzEuZEc+QFzaFHAx1/S405VeNW6AmmZckSGSvpqdRBeV7rXyzzQZ29CrXEUcaiu
	3LAt9TnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElUT-00000005oWV-2WKe;
	Fri, 31 Oct 2025 09:32:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElU9-00000005oUJ-3MLi
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 31 Oct 2025 09:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rfyBZJmdoTsV5mASRVjVSK13eALqQJfbT9fGRd81eVU=; b=IGhfqL4GrK/B2WAV9+53fJ3WY/
	AfZVZSct3KgrOt5JD7Ykrnld97S4T3XS+S4DwGCl4LYDJTrg+jyLXZ4L2Abc4l0R2pJiuwT1BiwdY
	+HSRyr6nZeE1SFvX3ko2j3kKjIxNmBE15cxJeVX2oh7bdXGO2zyMevVIrfBieDG2PiplXvqHX6XUw
	li+9Y4kMSd6jA0ZA6QU4xR0GqdUDsDsWQ7GiKy2lZZPdRhPFAPcoqqwtPq6sscT+qsj5RkPEp/fpe
	fXmnuBLK38zE56Qg+zfxZITg0Jcjgqzyl6e1r4vnhvRxj/zq/bEpEWAocuF2IqoxDr0inIr3FbZXS
	fES6AIIw==;
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkcN-0000000AuhE-3N5I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 08:36:21 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-63e0fa0571fso2585113d50.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 02:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761903108; x=1762507908; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rfyBZJmdoTsV5mASRVjVSK13eALqQJfbT9fGRd81eVU=;
        b=AOPBiSA2ORarS4nIX5SdZZQ2XdnII6Zdpy17rYh3ENFrvyZOu/fah5hF+X8ulKRNpY
         K2tWOYD2SDnxPnOxI3svSt3dEOTvgn5ReSb+7b4N/uFnXzKrUAh5HuUhRminyE5cgfFH
         //0Gp91r90RWsVPxc5Yi3qtcQO14U4sQW/yKDACD6ssqKSagzO9QVBnM+/qZile0kQfQ
         xyb06V6aYCEN1gLspNDgP+oCJU9rJn+MIbWvCaukfnajw3jNMc31YA/czrf6ATZdb+FO
         LvzhzzHR+M/pS6ac2N7sv6rpIEqehviPHNZPPXqsEHWTMt/FTvf0vBbhFG3lGbgwn+2F
         MMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761903108; x=1762507908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfyBZJmdoTsV5mASRVjVSK13eALqQJfbT9fGRd81eVU=;
        b=vHWt7hHDhHyeLnlNVyGkoLZEDG3gUgpNCaRNwgnLMZOd6J0qLEnBTmcsVYKzF4q6/F
         QvWWe93g5MdIi/JCCOdlC2Eg9gl21H0JyFNm8W3x0eJmM1BDMCDBg78+nggDfCTjJTQQ
         18K0T0kcUA8Wwt8f56kJVEcimcFw9ZZWlZ7WlxVAZt/YKYcUrbLhsnF1czUF7RCwOlC/
         bOVpE59n7U6vmJztGxkRprEc5ShHbUsScrVNGUwC6TrJrq02uLGZRpJCndEo6EejEvPM
         h0bbcxnP9GnLGZBNBt807ku0EIrl6iipfsQMaFNcPmgiopSV/qS0/gfHrghu9qhxIPoS
         /NfA==
X-Forwarded-Encrypted: i=1; AJvYcCUhm2AhqPSu4Gh7FugaXMhSwyR/et/3XLR6zOITgmLNjqe4Ox7klJWkizzV5jrxI6WliOH2z6dXvGCONW0pueY3@lists.infradead.org
X-Gm-Message-State: AOJu0YznhiZF9kbePRMtB5fhDL8Yn6yBIfQVHoa8O4ktd5TjoqLZaRAJ
	y8kBRRGtzaYIql66aJKx1crRYJkX0+YBKfDyiY8Jy0L+ZVWf2RUTDib5yma7UbBw3JE62G+QcC0
	Nehk1VYASbRuUgHhHKzeHeL5z/y32apZGitj81IHa0g==
X-Gm-Gg: ASbGncuEA00Oh214YMXotuS7VC6RpYljZ+BTGMuvMwWw6NK92j4cz7I6kCkhFUpRt3A
	+OeCWntc5ZVC7Ub3R+41ngTiE76ZVnK+Kfjqyb1/xZ8Qay1m1kIYWRX0Ijkajlsz2yOkPxDPsr9
	OyLvXaVhSv69kqqDnOaXBKYlHmzfPR64SssnhlZTQ3dx+JkFR6EsVGehULamlnA1u/0nl7rOWpG
	AUyH+GY5cOcRQxktjUwt/vOXV8QDBZlWhEzG2iR/YTI3DywRgTbWfiCaJfi8Kk+wAQZqROWif5t
	KwcCyR8X1FkBR81mcQMablR4H1mEiBHL1Hwzf+i+pFhAZPYrZ1w=
X-Google-Smtp-Source: AGHT+IEj9iIFsZIJy7VYK8k+eD82W99U6thDDvr3Il/rycdxbwYPZw7iXiAb8sYHSRlB0te//hksUCovkbAvYVNVBnU=
X-Received: by 2002:a05:690c:4b89:b0:786:5499:6340 with SMTP id
 00721157ae682-786549968camr624657b3.21.1761903108203; Fri, 31 Oct 2025
 02:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20251022114527.618908-1-adriana@arista.com> <20251031084101.701159-1-adriana@arista.com>
 <20251031084101.701159-3-adriana@arista.com>
In-Reply-To: <20251031084101.701159-3-adriana@arista.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Fri, 31 Oct 2025 11:31:11 +0200
X-Gm-Features: AWmQ_bmWyYlCW0A93XcRB_MwyaKSsdQLSr0mMsiasbGEhlTJwVwCdJ2Jtv0fY24
Message-ID: <CAC_iWjKEK6ardoCS9YUArhU-5UJfdb8cCGiiH=Ly=KkXTh=hvg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drivers: firmware: dmi_scan: Add support for
 reading SMBIOS from DT
To: adriana <adriana@arista.com>
Cc: ardb@kernel.org, trini@konsulko.com, robh@kernel.org, krzk@kernel.org, 
	jdelvare@suse.com, frowand.list@gmail.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, vasilykh@arista.com, arm.ebbr-discuss@arm.com, 
	boot-architecture@lists.linaro.org, linux-efi@vger.kernel.org, 
	uefi-discuss@lists.uefi.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_083619_973217_63BCB195 
X-CRM114-Status: GOOD (  19.52  )
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

Hi Adriana,

On Fri, 31 Oct 2025 at 10:41, adriana <adriana@arista.com> wrote:
>
> From: Adriana Nicolae <adriana@arista.com>

We'll need a description of why the change is needed here.

[...]

>
>  #ifndef SMBIOS_ENTRY_POINT_SCAN_START
>  #define SMBIOS_ENTRY_POINT_SCAN_START 0xF0000
> @@ -670,6 +673,54 @@ static int __init dmi_smbios3_present(const u8 *buf)
>         return 1;
>  }
>
> +#if IS_ENABLED(CONFIG_OF)
> +/**
> + * dmi_scan_from_dt - Find and parse DMI/SMBIOS tables from the Device Tree
> + *
> + * Checks if the bootloader has passed SMBIOS table addresses via the /chosen
> + * node in the Device Tree. This follows the standard kernel DT bindings and
> + * assumes a fixed 32-byte mapping for the entry point.
> + * Returns true if a valid table is found and successfully parsed.
> + */
> +static bool __init dmi_scan_from_dt(void)
> +{
> +       struct device_node *chosen;
> +       const __be64 *prop;
> +       char buf[32];
> +       void __iomem *p;
> +       bool dmi_available = false;
> +       u64 addr;
> +       int len;
> +
> +       chosen = of_find_node_by_path("/chosen");
> +       if (!chosen)
> +               return false;
> +
> +       prop = of_get_property(chosen, "linux,smbios3-table", &len);
> +       if (prop && len >= sizeof(u64)) {
> +               addr = be64_to_cpup(prop);
> +
> +               p = dmi_early_remap(addr, 32);

Please put '32' into a define that explains what it is

> +               if (p == NULL)

I think if (!p) is preferred

> +                       goto out;
> +
> +               memcpy_fromio(buf, p, sizeof(buf));
> +               dmi_early_unmap(p, 32);
> +
> +               if (!dmi_smbios3_present(buf)) {
> +                       dmi_available = true;
> +                       goto out;
> +               }
> +       }
> +
> +out:
> +       of_node_put(chosen);
> +       return dmi_available;
> +}
> +#else
> +static bool __init dmi_scan_from_dt(void) { return false; }
> +#endif /* IS_ENABLED(CONFIG_OF) */
> +
>  static void __init dmi_scan_machine(void)
>  {
>         char __iomem *p, *q;
> @@ -718,6 +769,13 @@ static void __init dmi_scan_machine(void)
>                         dmi_available = 1;
>                         return;
>                 }
> +       } else if (IS_ENABLED(CONFIG_OF) && dmi_scan_from_dt()) {

Can you fold the IS_ENABLED() in dmi_scan_from_dt() please?

> +               /*
[...]

Thanks
/Ilias

