Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F8EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YAksXXcYTs7qreOl6ykQXBvBHyCNYeVnc316wr7L798=; b=MouOleX1LqyOFz8D96ZBUy64YE
	3HUlQ0nMfHucIUpogwT0LnHlqWIk9NVLlQuW6S90SJCYeTiH3SWeTC3R2REkR0HPNCxTLqo2EEyN8
	nCTnYnggUcsohhbFwl0WuGK/nZMRUnUCBJU5zHUsvqV+io7cph+gsIZvdO5YkXmC5qgzkIR/DMIWj
	MRXWR7yz4kGjFWkLj0jHAkB8rOFzbl1V8oFJYvGQeu74kjdL9o37SPbQp6GvxiSI3/WN8q6PGkNTr
	RjMVY+iVOCDJIDD89924mtYMIrz5A33XN1Mpnn4XlQCGNWrS/ehUhAHzeaty/YxecGOqmUeFmhimA
	2pxDQLug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbsd-0000000Bqox-1fFW;
	Tue, 14 Jul 2026 12:04:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbsb-0000000Bqnz-043B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:04:54 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBNtEu231160
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 12:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YAksXXcYTs7qreOl6ykQXBvBHyCNYeVnc316wr7L798=; b=gmCTbNOvkkQQpDE7
	WXD2MuP7stI2PhhR6m9lpRh1z2YICzJdC+2PemJb2sWi5uUH2dHiIzphkM+yoiiB
	59oQY6vUmBuuDkAWRUoJCrSTHgXAtkSc0lQ4mGSWJ8W/Prr43ZWKXLsO6Zz0Y5js
	ZgMzc220iHs2jLL6DiRc1R2dfSn55rxqWZ96fq0JrUB3eYUU0eMytj08MT0X+kN4
	qw4fhvR92SSAtAq3+IKEn2n82M88v91ywjkrkzp6ChZBP2mp7xaQk6Tb9QglSO0A
	9LVAtYSGzjx6fgrcAM7R1iK6nIZlsgbTGvlKy3eDjJGffWkIZKlzuAs4NkHy8VE+
	IQNTiw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p3h33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 12:04:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c26012cd0so60908901cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 05:04:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784030690; cv=none;
        d=google.com; s=arc-20260327;
        b=FKxT2f1amJPTfH7BDv+vTmyDS52/5yizNn2eN+B3ZBIHnUjJweawj5SCNKnGWypU0N
         O/c2F56bv2wjolmuIw8rydzZa6XHWh1nNzODirfd0sYhGqJwBLSi5ryLuuvixh5zKX0P
         pGjYvFrAHnBa9DoQhuHirX1zAB41Q91GP3hiuT72sRU+GiIPG8nDovm02lRE6udfZGV5
         kMYBXQWOdGmJsY1yWrsklyBPMybqPtJHeT7zKRJ5aJlajl4NSurBXTYaNsqpPZT3WgM9
         xP62QWRChOpWXFqLQkNYxGbtyR7K/8+6VfJtA7fPe49ONg0MICZf8Vql3jHgJrI3SrxE
         /5kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YAksXXcYTs7qreOl6ykQXBvBHyCNYeVnc316wr7L798=;
        fh=oTBPw9tPZLy39uLH5VAB3a5guSqw6G8x8LyU9qIBhoY=;
        b=Exkr2WaYlNI6vETWmG3XywZiRIvOSKqdm7KdauqSDwLuZ6ykilCoxYBilYA3UFbfG1
         /BobPcLO3IbewxIL4HSQa6/I2qKr/qNa96oYozbMEaguKjTutVm67o5Pi5pqkcdeq/3L
         hWeJaDIOkXUu0u+zz0SwghZM1pGcsKcFmOz9fhW/e365vpdBxHAg/1vFPZkbzr+htIO9
         Owqm5XWnH7Wqjpyu9gATpa3QDp/ND6yyemeSHMTUWNG1lBYxBeWl2byn3NCYPskQ6PUU
         OBpuowMfoNgUHQJzwWeFE/9poXtBigRTM/SeqrfH5BU1ZuS/Sstp9FrYt1R1vso/XetB
         /R2g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784030690; x=1784635490; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YAksXXcYTs7qreOl6ykQXBvBHyCNYeVnc316wr7L798=;
        b=dQhBc3vo7ecGgsR8Al028bN8iZcvYj8hPndM2jCf+vyCVxV/201P7Xzcw+xqNz9lgB
         UeeuJkCSFRmAkzZOl8Tkpr7lJ5dVCMsGRbLoCeKbF0qSnevoxkYstssTQ5epcPlnN7s7
         iPkeo4bT3eFOpT7Pi5MLMvARFS+/G2XLz4yTz4TgkYMj926+s7vkrL/kaF9wGibXlSTm
         ppuC8MwlJ3l6hpdt6kQGfmqHZ+ZbheiUEWXopOh6Ka5YdztLQFpZNFnLzTpXmwOBXdD5
         /qQ0LkBxYAYKWBcN+3B1lJME0YRHhNLK9UM3VeGrWGJI8a96GDw+o/VWHGpo15KKpPmW
         8Jzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030690; x=1784635490;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YAksXXcYTs7qreOl6ykQXBvBHyCNYeVnc316wr7L798=;
        b=eJyj7DndRVOw+cHP+/TFQQAntZAPifu+z9mDWzuHKq9xB1wxCG9tTcKqvVWZWE6ob9
         jQughzLdxPE5BiK+XX8ZWlRk+uZS2puiiBqnm8EpCJiiAzSd+NeuEVacBZoacabZjxcn
         akMn1zpXq4FNla6R8va2zxuxuuY3L80DNruv2Z/e/7gb9xjlx0MGUrcKcHjjmqJn4VFD
         Z5/vSFGlHWZ2nXn9SwvMsauP9wLpzuS+GOE7EXZ0adzk8BKBnBsaRRTcrttGzInV2O/Z
         CmjuwoGR7OiHLcUqI1dsHcUFEA3EbYRbn0GCCVZ7tNsykK4QRd+NebUW2qk8ML2fVkJO
         kCDA==
X-Forwarded-Encrypted: i=1; AHgh+RryxzVg9MA1T57uscTWxWeVjo/KhEjKisqW7CdbQKvnfxCNQGEBoa6oIf0nDoS9unryylSCeY+NZNAo++bBPXUd@lists.infradead.org
X-Gm-Message-State: AOJu0YwZArwjn6oGpVR/qlh8XCUoaWtw8NhlDDO756pKlReh8nnlV8AF
	oJOwop+n7rF9+dc2J9KwXEAzGTQjD5furewI+eveo4WSx6uFIal6FInZ6lPJarT+tj7yv2gpbWB
	XqAyllMAczaEIxdxtuJUNGSSA75xCes69h4upUmb1B1LbazzAVnSnW+XnYKBML5CZyelDvWMsVL
	GpSE9p84DxLXXHxQMgEgUDYsMGju8Jr1Jx3V+AqlEZodCcg7b5eQ69
X-Gm-Gg: AfdE7cnPs5OfU1j/YvoM8DFllLNNm1LNqQ7OqzXjxY6CD0Xrjx+uMlbRbYJr1DwG22e
	Md4fps6LBGRnkiDgmT9SBREsZ4YO7HPMQ/agpQC88b0xqbORatV7PIjgveUcZ8PFYRoJYzGI8HY
	uVR4Sf0gxnDelJF/JXkx1sQdjsAcx8SRzncX5Njlc0XYZiiXuGekPyVTbcGz4/VrxMwC55
X-Received: by 2002:ac8:5f91:0:b0:51c:7b12:5fff with SMTP id d75a77b69052e-51cbf2ddef5mr127883001cf.75.1784030690350;
        Tue, 14 Jul 2026 05:04:50 -0700 (PDT)
X-Received: by 2002:ac8:5f91:0:b0:51c:7b12:5fff with SMTP id
 d75a77b69052e-51cbf2ddef5mr127882421cf.75.1784030689773; Tue, 14 Jul 2026
 05:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783505142.git.geert+renesas@glider.be> <23f979b0903ca11513ac339ab8b6dd40435603c5.1783505142.git.geert+renesas@glider.be>
In-Reply-To: <23f979b0903ca11513ac339ab8b6dd40435603c5.1783505142.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 14:04:38 +0200
X-Gm-Features: AUfX_mz0pm1bKZMzEgKkx0pxSzyNhryLI17GoLwTGSkPYUe4ECmwKPI1jisfYfg
Message-ID: <CAPx+jO-=LF9CvYDrC3O_GBtfHU6GYvq524OLmTG8R1-u27oyKw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEyNSBTYWx0ZWRfX5jcLoVMm0XBS
 qvBrq9wA1s7fPlGB9qfXkakWaABNX0irpy5ySelimJBWlA+MZS3fkNsISOO+Ok8+OAckLLZtuiZ
 PkT2toaYmjHLxI5KVpJP3+6GiAFvXjs=
X-Proofpoint-GUID: INzjpV88swYOd_FAjIFfgi_6lXQpdCfe
X-Proofpoint-ORIG-GUID: INzjpV88swYOd_FAjIFfgi_6lXQpdCfe
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a5625e3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=UmYWVhtEHbvSSgRh88EA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEyNSBTYWx0ZWRfX7u+175VMPMjB
 tvKM/97XKMOchT+g7mHuM4z4SmRXXdWy3BNj47e08KMqT6oVI5Qfhbl8yy+Oz/BDJdekAvxVJsM
 dlhWvUaK4qoizJ81wCwCk8RrUG6aJmI/UknPWsvEqm0fvcKBFn66enCqSoDfPbGlWS3qLz7sa/i
 ln3By1diGP4r47vGpYuO2q8soppuxYMS7X9i5f4WaHZDELz/tNxKWNnHIaVOL1eZbcvIrrzC5dq
 pqcyVrb4YhuRckxo8PsxhTS1MbBtAO7xdnZ7nxISm9X0bjN8DaxqENIuzC3ZDTah0Crb7lXR5Xg
 KCXmAxUPJmcSRNq3wyuFjfBn6ufR1hl2jaEwcIUhIU5G70cj+dh3R0EbA1y9Z+n/gNnAy5S8Bvc
 EavXWO2ZeeN+qMbGmAW05B5CFlVLzzY7sB3kkTHi79EKsgWkGDC+hHUcDZ4Ol9kBTy9QKTo8RST
 Ncigr4dXv8tlnZonYrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_050453_101075_080A263B 
X-CRM114-Status: GOOD (  35.86  )
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

On Wed, Jul 8, 2026 at 12:15=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Add a minimal Module Controller driver for the R-Car X5H (R8A78000) SoC.
> For now this just supports the always-on power domains, and dummy clocks
> and resets for the serial console (which is enabled by the boot loader).
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Calling genpd_add_provider() instead of of_genpd_add_provider_onecell()
> would be sufficient, but the former is private.

Right. Callers that need their own xlate callback should just assign
it before calling of_genpd_add_provider_onecell(), as the below code
does.

>
> v2:
>   - Spin off from "pmdomain: renesas: Add R-Car X5H MDLC SCMI remapping
>     driver",
>   - Add default support not using SCMI,
>   - Drop all SCMI remapping support,
>   - Document use of -1 as a sentinel,
>   - Rename struct r8a78000_mdlc_info to mdlc_info,
>   - Print HW IDs in hexadecimal,
>   - Reduce log level for unsupported MDLC instances from warn to dbg,
> ---
>  drivers/pmdomain/renesas/Kconfig         |   4 +
>  drivers/pmdomain/renesas/Makefile        |   1 +
>  drivers/pmdomain/renesas/r8a78000-mdlc.c | 329 +++++++++++++++++++++++
>  drivers/soc/renesas/Kconfig              |   1 +
>  4 files changed, 335 insertions(+)
>  create mode 100644 drivers/pmdomain/renesas/r8a78000-mdlc.c
>
> diff --git a/drivers/pmdomain/renesas/Kconfig b/drivers/pmdomain/renesas/=
Kconfig
> index b507c3e0d723efc6..f2f52d3c29a083f1 100644
> --- a/drivers/pmdomain/renesas/Kconfig
> +++ b/drivers/pmdomain/renesas/Kconfig
> @@ -13,6 +13,10 @@ config SYSC_RMOBILE
>         bool "System Controller support for R-Mobile" if COMPILE_TEST
>
>  # SoC
> +config MDLC_R8A78000
> +       bool "Module Controller support for R8A78000 (R-Car X5H)" if COMP=
ILE_TEST
> +       select RESET_CONTROLLER
> +
>  config SYSC_R8A7742
>         bool "System Controller support for R8A7742 (RZ/G1H)" if COMPILE_=
TEST
>         select SYSC_RCAR
> diff --git a/drivers/pmdomain/renesas/Makefile b/drivers/pmdomain/renesas=
/Makefile
> index 0391e6e67440a786..17849aad37a5ac4f 100644
> --- a/drivers/pmdomain/renesas/Makefile
> +++ b/drivers/pmdomain/renesas/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # SoC
> +obj-$(CONFIG_MDLC_R8A78000)    +=3D r8a78000-mdlc.o
>  obj-$(CONFIG_SYSC_R8A7742)     +=3D r8a7742-sysc.o
>  obj-$(CONFIG_SYSC_R8A7743)     +=3D r8a7743-sysc.o
>  obj-$(CONFIG_SYSC_R8A7745)     +=3D r8a7745-sysc.o
> diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/=
renesas/r8a78000-mdlc.c
> new file mode 100644
> index 0000000000000000..ed367e921a3341a7
> --- /dev/null
> +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
> @@ -0,0 +1,329 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * R-Car X5H Module Controller
> + *
> + * Copyright (C) 2026 Glider bv
> + */
> +
> +#include <linux/dev_printk.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/reset-controller.h>
> +#include <linux/slab.h>
> +
> +#include <dt-bindings/power/renesas,r8a78000-mdlc.h>
> +
> +struct mod_map {
> +       int hw_id;              /* Hardware module ID or -1 sentinel */
> +};
> +
> +struct mdlc_info {
> +       u32 base;
> +       const struct mod_map *mod_map;
> +};
> +
> +/**
> + * struct r8a78000_mdlc_priv - Module Controller Private Data
> + *
> + * @link: Link into list of MDLC instances
> + * @genpd_data: PM domain provider data
> + * @rcdev: Reset controller entity
> + * @dev: MDLC device
> + * @np: Device node in DT representing the MDLC
> + * @mod_map: Mapping from hardware module IDs
> + */
> +struct r8a78000_mdlc_priv {
> +       struct hlist_node link;
> +       struct genpd_onecell_data genpd_data;
> +       struct reset_controller_dev rcdev;
> +       struct device *dev;
> +       struct device_node *np;
> +       const struct mod_map *mod_map;
> +};
> +
> +static struct generic_pm_domain *r8a78000_genpd_always_on;
> +static HLIST_HEAD(r8a78000_mdlc_list);
> +static DEFINE_MUTEX(r8a78000_mdlc_lock);       /* protects the two above=
 */
> +
> +static struct generic_pm_domain *r8a78000_genpd_xlate(
> +                       const struct of_phandle_args *spec, void *data)
> +{
> +       struct r8a78000_mdlc_priv *priv =3D container_of(data,
> +                                       struct r8a78000_mdlc_priv, genpd_=
data);
> +       struct device *dev =3D priv->dev;
> +       u32 id;
> +
> +       if (spec->args_count !=3D 2)
> +               return ERR_PTR(-EINVAL);
> +
> +       id =3D spec->args[0];
> +
> +       if (id >=3D R8A78000_MDLC_PD_AON) {
> +               dev_dbg(dev,
> +                       "Mapping HW power domain 0x%x to always-on domain=
\n",
> +                       id);
> +               return r8a78000_genpd_always_on;

This looks odd, but perhaps it's just a temporary mapping that you
intend to change later, no?

> +       }
> +
> +       dev_err(dev, "Unknown power domain 0x%x\n", id);
> +       return ERR_PTR(-ENOENT);
> +}

[...]

> +
> +static void r8a78000_genpd_del_provider(void *data)
> +{
> +       of_genpd_del_provider(data);
> +}
> +
> +static int r8a78000_genpd_always_on_singleton(struct device *dev)
> +{
> +       struct generic_pm_domain *genpd;
> +       int ret;
> +
> +       guard(mutex)(&r8a78000_mdlc_lock);
> +
> +       if (r8a78000_genpd_always_on)
> +               return 0;
> +

I guess the mutex is used to protect the global
r8a78000_genpd_always_on, but it looks like that isn't really needed
based upon how things are being called during the probe.

> +       genpd =3D kzalloc_obj(*genpd);
> +       if (!genpd)
> +               return -ENOMEM;
> +
> +       genpd->name =3D "always-on";
> +       genpd->attach_dev =3D r8a78000_mdlc_attach_dev;
> +
> +       ret =3D pm_genpd_init(genpd, &pm_domain_always_on_gov, false);
> +       if (ret) {
> +               kfree(genpd);
> +               return dev_err_probe(dev, ret,
> +                                    "Failed to create always-on domain\n=
");
> +       }
> +
> +       r8a78000_genpd_always_on =3D genpd;
> +       return 0;
> +}
> +
> +static int r8a78000_mdlc_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *np =3D dev->of_node;
> +       struct r8a78000_mdlc_priv *priv;
> +       const struct mdlc_info *info;
> +       struct resource *res;
> +       int ret;
> +
> +       ret =3D r8a78000_genpd_always_on_singleton(dev);
> +       if (ret)
> +               return ret;
> +
> +       info =3D of_device_get_match_data(dev);
> +       if (!info)
> +               return -ENODEV;
> +
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->dev =3D dev;
> +       priv->np =3D np;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return -ENODEV;
> +
> +       for (; info->base; info++) {
> +               if (info->base =3D=3D res->start)
> +                       break;
> +       }
> +
> +       if (!info->base) {
> +               dev_dbg(dev, "Unsupported MDLC instance 0x%pa\n", &res->s=
tart);
> +               return -ENODEV;
> +       }
> +
> +       priv->mod_map =3D info->mod_map;
> +
> +       scoped_guard(mutex, &r8a78000_mdlc_lock) {
> +               hlist_add_head(&priv->link, &r8a78000_mdlc_list);
> +       }
> +
> +       ret =3D devm_add_action_or_reset(dev, r8a78000_mdlc_unlink, priv)=
;
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to add action\n");
> +
> +       /* Note that no actual domains are registered, just need translat=
ion */
> +       priv->genpd_data.xlate =3D r8a78000_genpd_xlate;
> +       ret =3D of_genpd_add_provider_onecell(np, &priv->genpd_data);
> +       if (ret)
> +               return dev_err_probe(dev, ret,
> +                                    "Failed to register genpd provider\n=
");
> +
> +       ret =3D devm_add_action_or_reset(dev, r8a78000_genpd_del_provider=
, np);
> +       if (ret)
> +               return dev_err_probe(dev, ret,
> +                                    "failed to add unregister action\n")=
;
> +
> +       priv->rcdev.ops =3D &r8a78000_mdlc_reset_ops;
> +       priv->rcdev.of_node =3D np;
> +       priv->rcdev.of_reset_n_cells =3D 1;
> +       priv->rcdev.of_xlate =3D r8a78000_mdlc_reset_xlate;
> +
> +       ret =3D devm_reset_controller_register(dev, &priv->rcdev);
> +       if (ret)
> +               return dev_err_probe(dev, ret,
> +                                    "Failed to register reset controller=
\n");
> +

In some of the error paths above it looks like we end up leaking the
data allocated for r8a78000_genpd_always_on. Perhaps clean up that
somewhere here.

> +       return 0;
> +}

[...]

In regards to the merge strategy, I intend to pick patch 2 (shared via
the immutable dt branch) and $subject patch. Please let me know if
there are any issues with that.

Kind regards
Uffe

