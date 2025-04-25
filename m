Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D10C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 14:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xu08WpWbP9VRkJIe5+B7WyB4NPIRhaxkc0XM7hm0jVU=; b=gBAmbrbpGPIcgOmE+7aLNtxdGa
	+9uooTT/UnU8B6gNJ6e1+H0X0usy6jDXnKOhzrNlbMdFMsURB1bm95McNb8sgVkmRck2tin47PWAX
	ILfJeT+IrKMQlCfiXAXrqo4EQuO/PRxFsOKVp4ibku04kv8dGwilg5CMhxlmip0qiFDzWK/xyAQIj
	die4yhE8FG11TTfZAqo+oZkR0NqPjt2AdjnCBM6w16LemTCnSzyiCB0DswGJLZHNZga3VG7xULbku
	s2obKZrQ2ClgPr7q9Sk6diwl9E9q+9D8Pa+4den3Is4FUVhwLDZtUxcqpFHy9q+ZrPAPEOyjtrFXY
	48L2OT2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KQa-0000000HUkW-0W3a;
	Fri, 25 Apr 2025 14:53:20 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HxM-0000000H5Ml-30ZD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 12:15:02 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-47664364628so25781511cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 05:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745583299; x=1746188099; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xu08WpWbP9VRkJIe5+B7WyB4NPIRhaxkc0XM7hm0jVU=;
        b=IX8iVb+exdzWuMnJ3VbeFauz+fqOUlomQx71PCUauld+C3e9A7W8EXb0+TwdaCT8Om
         KlsIx+OZVZDHfxAowOsiARuesrei2FIdJ5LIwU6Ba7S6SyaIzxgeR5UNQc++lSQV2EF7
         ZQYkKfT3eqa0klIU6zwNF1RXKSRHpoK2spSqTngrD76VO8IbQ9InwHsqpEWeU530O88j
         IevqEKb4Cu+TcBmZdsrbVgBbaTYdUCoTuyY3KZIQv30gSO1HXUycC62Z2s7YOD+apoYU
         lkOxNo/D2VxBmEeuVnAgcLrFHobP7FTJnOfCUVY1aKUaTMp8Nv3DgWcYmNEy45h6vAEc
         iGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745583299; x=1746188099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xu08WpWbP9VRkJIe5+B7WyB4NPIRhaxkc0XM7hm0jVU=;
        b=gvfbKPVglZuwDk6NaUuqAlCRCLNYDQz0POkfWV61XHTH7xdbyA80Ykt+Zdz2QFrxil
         pnIyW/DnwmIxzcWdbY4kgTxAAs9x6GePiMk4GcsP/4y9CoJIHG7bLO0gAnAJrISlja0u
         q3N/vc21PkQ/6H4RH03Nn5CdWNDxDmdOC+DxA2Vkv5PPSXdxbk9mGkNIFRbQs63h6QQt
         P3IT0oWudF64hpqmwq0SM1OwrX+YLlxhSuMOk9krunHYOiBD+Na0vFEewIrpI9O34N9D
         EUPw5/kxWYCkqM8Zp9JrXZTL8kl0IThAYdW/d/pbORDn36Idjxqc8yGQteY0fS6wDK8J
         QLzw==
X-Forwarded-Encrypted: i=1; AJvYcCUAvtazPybMlpNorwmIX0c2+m5cci4OkYD2W/Akwb1BTvqZqkTo7I3E+huS1NnliYOad/O70hneiXBEp6PA5g0N@lists.infradead.org
X-Gm-Message-State: AOJu0YxqW7luSoykhNuCiuIPbADRq+AJVBfhNlfYrjjDF5mJPzBJXtA2
	qm+bxJLuttIC/i5E8rbM1cApEmeOUjd5Wvc9XlKplef5qoimI597ldLgm3H02iemPZYJx1q8rs3
	gXwJiHiNdGzQ2E2Nvu46ChiWfc83CdsgD6Yo=
X-Gm-Gg: ASbGncsz7zqdX86HW1nWE8c8VXvEbwdw6Uj8V7H42+F2eLmgl4/+Vg1ZX1fSGn8EKdY
	CiCPkeDWs9Pkbf5eFQlHl0el1TeaJYDDwj1o+dBI2Qwfhk9Fi0pJg4gCARstoIWQAXkujjGAUyn
	EigsXJRkGzWZXZNMfvC2zq4RehpblJiZDOhEGV7X6+ovGBjYAI2CZZDw==
X-Google-Smtp-Source: AGHT+IGalm45BLBaTkyJlEQ78yqfTdEaLzyEHrABmorXnt1Rm8owTSj9BrL3OmFlL2yuC97CUZHOtQdTyCPwtz+wv2g=
X-Received: by 2002:ac8:5f8a:0:b0:477:1dd7:af94 with SMTP id
 d75a77b69052e-4802d4d0fd8mr29566751cf.2.1745583299424; Fri, 25 Apr 2025
 05:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250423-wmt-soc-driver-v1-0-bd8bf32521c2@gmail.com>
 <20250423-wmt-soc-driver-v1-2-bd8bf32521c2@gmail.com> <c38b3dde-f4ea-4812-a673-137d4727aefc@kernel.org>
In-Reply-To: <c38b3dde-f4ea-4812-a673-137d4727aefc@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 25 Apr 2025 16:15:10 +0400
X-Gm-Features: ATxdqUFHg9dv2l091sWsrUupQVwQJ3q1a0X28XX0Jmt0SiDYrD-xa8cWrKC2sFo
Message-ID: <CABjd4YzQVQD1PCh3fUOzy_cwhd4j6q_N6zvb=kY4gFt-bn1Psg@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: Add VIA/WonderMedia SoC identification driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_051500_788516_9425ACF2 
X-CRM114-Status: GOOD (  21.94  )
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

On Fri, Apr 25, 2025 at 2:24=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/04/2025 21:18, Alexey Charkov wrote:
> > Add a small SOC bus driver to parse the chip ID and revision made
> > available on VIA/WonderMedia SoCs via their system configuration
> > controller's SCC_ID register.
>
>
> ...
>
> > +#include <linux/io.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +#include <linux/sys_soc.h>
> > +
> > +static struct {
>
> I think const by convention is placed here - right after static. It
> should be equivalent, just convention.

Makes sense, thank you. Will adjust in v2.

> > +     const char *name;
> > +     const unsigned long id;
> > +} const chip_id_table[] =3D {
> > +     /* VIA */
> > +     { "VT8420", 0x3300 },
> > +     { "VT8430", 0x3357 },
> > +     { "VT8500", 0x3400 },
> > +
> > +     /* WonderMedia */
> > +     { "WM8425", 0x3429 },
> > +     { "WM8435", 0x3437 },
> > +     { "WM8440", 0x3451 },
> > +     { "WM8505", 0x3426 },
> > +     { "WM8650", 0x3465 },
> > +     { "WM8750", 0x3445 },
> > +     { "WM8850", 0x3481 },
> > +     { "WM8880", 0x3498 },
> > +};
> > +
> > +static const char *sccid_to_name(unsigned long sccid)
> > +{
> > +     unsigned long id =3D sccid >> 16;
> > +     unsigned int i;
> > +
> > +     for (i =3D 0 ; i < ARRAY_SIZE(chip_id_table) ; ++i) {
> > +             if (chip_id_table[i].id =3D=3D id)
> > +                     return chip_id_table[i].name;
> > +     }
> > +
> > +     return "Unknown";
> > +}
> > +
> > +static const char *sccid_to_rev(unsigned long sccid)
> > +{
> > +     char letter, digit;
> > +
> > +     letter =3D (sccid >> 8) & 0xf;
> > +     letter =3D (letter - 1) + 'A';
> > +
> > +     digit =3D sccid & 0xff;
> > +     digit =3D (digit - 1) + '0';
> > +
> > +     return kasprintf(GFP_KERNEL, "%c%c", letter, digit);
> > +}
> > +
> > +static int __init wmt_socinfo_init(void)
> > +{
> > +     struct soc_device_attribute *attrs;
> > +     struct soc_device *soc_dev;
> > +     struct device_node *np;
> > +     void __iomem *reg;
> > +     unsigned long sccid;
> > +     const char *machine =3D NULL;
> > +
> > +     np =3D of_find_compatible_node(NULL, NULL, "via,scc-id");
> > +     if (!of_device_is_available(np)) {
> > +             of_node_put(np);
> > +             return -ENODEV;
> > +     }
> > +
> > +     reg =3D of_iomap(np, 0);
>
> of_node_put(np) here... although this will be dropped (see below)
>
>
> > +     if (!reg) {
> > +             of_node_put(np);
> > +             return -ENODEV;
> > +     }
> > +     sccid =3D readl(reg);
> > +     iounmap(reg);
> > +
> > +     attrs =3D kzalloc(sizeof(*attrs), GFP_KERNEL);
> > +     if (!attrs)
> > +             return -ENODEV;
> > +
> > +     /*
> > +      * Machine: VIA APC Rock
> > +      * Family: WM8850
> > +      * Revision: A2
> > +      * SoC ID: raw silicon revision id (0x34810103)
> > +      */
> > +
> > +     np =3D of_find_node_by_path("/");
> > +     of_property_read_string(np, "model", &machine);
> > +     if (machine)
> > +             attrs->machine =3D kstrdup(machine, GFP_KERNEL);
> > +     of_node_put(np);
> > +
> > +     attrs->family =3D sccid_to_name(sccid);
> > +     attrs->revision =3D sccid_to_rev(sccid);
> > +     attrs->soc_id =3D kasprintf(GFP_KERNEL, "%08lx", sccid);
> > +
> > +     soc_dev =3D soc_device_register(attrs);
> > +     if (IS_ERR(soc_dev)) {
> > +             kfree(attrs->machine);
> > +             kfree(attrs->soc_id);
> > +             kfree(attrs->revision);
> > +             kfree(attrs);
> > +             return PTR_ERR(soc_dev);
> > +     }
> > +
> > +     pr_info("VIA/WonderMedia %s rev %s (%s)\n",
> > +                     attrs->family,
> > +                     attrs->revision,
> > +                     attrs->soc_id);
> > +
> > +     return 0;
> > +}
> > +early_initcall(wmt_socinfo_init);
>
> No, this does not scale. This is supposed to be module_platform_driver
> instead of manually re-ordering code. Then all your memory allocations
> become devm, printks become dev_xxx and you can simplify it.

Fair enough. Will convert into a platform driver and use managed
functions. Thanks for pointing this out!

Best regards,
Alexey

