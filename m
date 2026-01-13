Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC10D2D11B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 14:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cW3MAOTqLMsCycw/4wFcgcK9b5ywvkdR/GMT+4PTdHQ=; b=ES2bFU8MhxQE2uyAkgCCU22mth
	6Rbratc6rkyyjXTR7gn2LmuUdE+Zvf177S8QHiC3sC60HGNhrmlEkKzLP9ew9+MDKbScQssOo6hD6
	vFxA+gBzaDUfPZDOJpxWYca31vV+iEVsq2aCfUMDmrWwVMakdIYyakt2Fy2nLM4QGdNIxaVHtm8Qs
	ZPQSnaEXAk8VQwFb6j1ebOHK7RU+wVTM/z6gIEy6Ug2hgXpp/QMvDzp0MNY4ZeTpxN8tUAeFpsZEB
	CFmQUsppUYDOay7A9ceKor15FUZpDTcrhnGWmWjO6T+34dRyyI4A2yjLMYidsa4GJtN/AHWvtEu4s
	N2eQ++3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffee-00000007HS2-2MJD;
	Tue, 13 Jan 2026 14:45:56 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffec-00000007HRg-0dlL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 14:45:55 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-3eae4e590a4so4065421fac.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 06:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768315552; x=1768920352; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cW3MAOTqLMsCycw/4wFcgcK9b5ywvkdR/GMT+4PTdHQ=;
        b=Kmg37uPRrHAJskK44cjK+2vgOolXsPKXpz4w/B4lNvWVuQopkoSkSiZ2rvc8c6ReJJ
         pgk4JiEsJ1x8zt7U5WBrT6NzLoQVUmfcn9nSKUckYQAfEy81JiTZCdEaku7yHxZO4/5f
         fXybVscxVDBgDqf/bhQIUQpTA/lHZeh075QUX64DDAW4TAVE299fwe4AE9D6Pe9V8Rmp
         +tvlULE6/MmJSkZc9MBkpbsEp/3f3sPlfsvmPWYMZAHeX88iZn6KQwR4As9ksk8qNgRT
         4DS9nOMx0425E7zD2XC0ifNepWo2F73sCNlHWCxGrs3BX4AqbHYk0zvCcwxR6h4vIhEO
         aWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768315552; x=1768920352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cW3MAOTqLMsCycw/4wFcgcK9b5ywvkdR/GMT+4PTdHQ=;
        b=w/ugj2GkfQPurkZl4n3d0xHuPGhPcXu+U5DS+QJJ+2N9UWXWVmgK+i27jjmBGS8P1b
         SkrDuJE34pyh32uAgP0mqn6Je7Y6lBPLDDq0+0hPv0+KJXdBtYH2UoicrYhRxep0Ibtn
         Ax696abPfMyDvrf3P33zIDxBjaUl+OXsCZFMudOkXxqxAtlAN2ASmLZHVQBL48sKwdFC
         6mtaAllJzDkyhJLH9gZewzpaLUPljZU6NXEI25+1N1x39zGdev4tu2P25Hr+nb/CwUZF
         kAerm8mipme/XFKAoDb05KYnj0TJ5Hbnr+7tTXHWWHeuHJ10LbbRdeA1wxrvOLq0zXpF
         qgug==
X-Forwarded-Encrypted: i=1; AJvYcCVAzvwgahrDZfs7m9Qj+BV8pc1VdpyMQd/YFq7E/0HEYpo5wpq7A17iPz/h9EoMHyv5EQGfwaJltB+y+jAjJLPe@lists.infradead.org
X-Gm-Message-State: AOJu0YzNxk3m1ApkVofa2Pc7xurUuSlyNdJOQ3v0I02Nmw5Mrk/+dW9w
	JMNuNGwz5TDhPFUtYd5Z18tRh2oAvn6wLRMbKfIS1xYJTL0cmA8KyvkqEc0yJ5MCfGaln3ZZ/Ao
	ovg/HG7ptxrIODal9KBiltjtnNgNf6+zQhBXCf+x4Jw==
X-Gm-Gg: AY/fxX6UdfIKVegYrf0KSLRHli94wqCakopMXevYFen1131T0L4uOgUMmWT0j77D12Z
	oHMfk+o7Q1ppQOp3qhg1pYbqmXR28vclY//04xWZVv8366MepQpS/15YsFWuGpc8VZIie2I7DHV
	Lte+R+fir+c0s+VcugqTn/2aBuhFaqV2QBZ5m65TeLdRcwh+0deQR57EsLMU8KgBzZcpYKRHU7g
	ASxOUaxS68F6AYBKTI7AtpXFrhOrRjdRl9ycHw6CC7CfzLobprlbyr36JftKRGwhMAmUudYTWgh
	0g9Y94i2RK9v8xxb9yFIzKbImA==
X-Google-Smtp-Source: AGHT+IGMsKCWhXxncysaNn43dYmEYyDwcJaO6TjEgdKAgRTiQWieHjD3rHZkyoBEsAcvj9cD16CSqGEscd62IkICycg=
X-Received: by 2002:a05:6870:55c7:b0:34b:cc55:9e85 with SMTP id
 586e51a60fabf-3ffc0954865mr9095150fac.13.1768315552149; Tue, 13 Jan 2026
 06:45:52 -0800 (PST)
MIME-Version: 1.0
References: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com> <20260109-debug_bus-v1-5-8f2142b5a738@foss.st.com>
In-Reply-To: <20260109-debug_bus-v1-5-8f2142b5a738@foss.st.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 13 Jan 2026 15:45:40 +0100
X-Gm-Features: AZwV_QiARd5ZYYBrSjJNdNCpX-7fBluIYLJTcntaG_DMT6Vl6m6kjiymZLCqUpY
Message-ID: <CAHUa44Gc+q0qJ0XJ8Y-OMT2t9o0W_WeDMHg_S0HPC5i2Zmxhiw@mail.gmail.com>
Subject: Re: [PATCH 05/11] drivers: bus: add the stm32 debug bus driver
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_064554_223437_39749339 
X-CRM114-Status: GOOD (  18.10  )
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

Hi,

On Fri, Jan 9, 2026 at 11:57=E2=80=AFAM Gatien Chevallier
<gatien.chevallier@foss.st.com> wrote:
>
> Add the stm32 debug bus driver that is responsible of checking the
> debug subsystem accessibility before probing the related peripheral
> drivers.
>
> This driver is OP-TEE dependent and relies on the STM32 debug access
> PTA.
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  MAINTAINERS                 |   1 +
>  drivers/bus/Kconfig         |  10 ++
>  drivers/bus/Makefile        |   1 +
>  drivers/bus/stm32_dbg_bus.c | 285 ++++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 297 insertions(+)
>

[snip]

> +
> +static const struct tee_client_device_id optee_dbg_bus_id_table[] =3D {
> +       {UUID_INIT(0xdd05bc8b, 0x9f3b, 0x49f0,
> +                  0xb6, 0x49, 0x01, 0xaa, 0x10, 0xc1, 0xc2, 0x10)},
> +       {}
> +};
> +
> +static struct tee_client_driver stm32_optee_dbg_bus_driver =3D {
> +       .id_table =3D optee_dbg_bus_id_table,
> +       .driver =3D {
> +               .name =3D "optee_dbg_bus",
> +               .bus =3D &tee_bus_type,
> +               .probe =3D stm32_dbg_bus_probe,
> +               .remove =3D stm32_dbg_bus_remove,
> +       },
> +};

Just a heads up. With
https://lore.kernel.org/op-tee/cover.1765791463.git.u.kleine-koenig@baylibr=
e.com/
we're switching to use bus methods instead of device_driver callbacks.
That plan is to merge that patch set in the next merge window.

Cheers,
Jens

> +
> +static int __init optee_dbg_bus_mod_init(void)
> +{
> +       int ret;
> +
> +       ret =3D driver_register(&stm32_optee_dbg_bus_driver.driver);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D platform_driver_register(&stm32_dbg_bus_driver);
> +       if (ret)
> +               driver_unregister(&stm32_optee_dbg_bus_driver.driver);
> +
> +       return ret;
> +}
> +
> +static void __exit optee_dbg_bus_mod_exit(void)
> +{
> +       platform_driver_unregister(&stm32_dbg_bus_driver);
> +       driver_unregister(&stm32_optee_dbg_bus_driver.driver);
> +}
> +
> +module_init(optee_dbg_bus_mod_init);
> +module_exit(optee_dbg_bus_mod_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Gatien Chevallier <gatien.chevallier@foss.st.com>");
> +MODULE_DESCRIPTION("OP-TEE based STM32 debug access bus driver");
>
> --
> 2.43.0
>
>

