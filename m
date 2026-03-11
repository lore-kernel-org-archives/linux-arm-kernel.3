Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBA21125855
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 16:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jLnMSxUqU/vOSI9yL7h3tOcbtV9bRdE2IZoz3VycQi4=; b=T2SDgAyihBzW0I5P7Nj5Pb/B6C
	C/RgHYJ/YNrlDVduvUL9r9zheaJpnYB3zTlteNta6CFG+nUkogol3Vh0Rv/t9POpdT6GXM5EPCLaR
	pEHEtE45KAw/cO9y22inJVX/j1rXnU6rjLT7BkprhnNT8bSzHjl5pgtWyGjnikijPHtNE+oVhVw51
	vjLaUJZS0SZC48WWvAmKf/UZFX70zuv2koF5y5fz3xbOqCoBbN2MmV2zeCu5vKU0sEBFCH9hbWOXO
	miUhRyIAjLP/SxO9pnk2Xo+KFa9jxPvWJ68tRTg3ijVg5qkQkODdsfp9pAbfCKf2Afna7PdOeXHpS
	GWMhjEJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Mgp-0000000Bwb9-3QoW;
	Wed, 11 Mar 2026 16:45:43 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Mgn-0000000BwaP-2Fty
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 16:45:42 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-38a2a59baa6so1159751fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 09:45:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773247539; cv=none;
        d=google.com; s=arc-20240605;
        b=HHO67vQ8tRkIJTfyUAs/1oWvcJ6U273shTDXE1QUBj8cS82RakclcQriBCZi8KUXgQ
         laysat6SMJG0aDGzKiNDcqhHZGo3k5g34bjrk+Tu/LvykjFwl9Mq3jo/GsNVUdpt8fK6
         D6mv3QH11JaOmxgnW57HyByiA3CJJlHGrBqUDskkD0Nsgutfj7I6JG7TtqbNPsILsue8
         pbNTF/VCpU75if1I7UYrgr7aldNoFhgYt20o8GsNnjoJ8rwsUx2O790N0GG7IEi2vFmL
         eGYm0h6P9J//lEh7w0pCrgiGvl9crwCwzs5pW1yrJLmtzaB4hccivOm0mzwVZ/M7cwDF
         hJng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jLnMSxUqU/vOSI9yL7h3tOcbtV9bRdE2IZoz3VycQi4=;
        fh=9NSmDgI0Q/dDitbpug71NLjzxiKklMwxMvmkSsK975k=;
        b=K/52OITd3byItN1J35Y8h/Di4bw1xNj79ZE0bXspWn6t0cOkpvDvnBsg5GmcEVzFDy
         wajQX9VXw9GE40XQ9W+4+bvMysC480ymrzxyh9mdUNRPCbI9uqd0t+e3XJmax0Y/ldD5
         vt/i72HTRGkvmn5QqvHcOlsU6JUhYzHWLSp4uHuti3uv7AJUnAJaUhafeMq/xU6iaSn6
         JUq4ccubtYp7PsUhqcMvBta9142MQMezucKx4Vy3Dx0qM741+UdUVjDvPQGksNTsPTLl
         Wqn9loTl/ExpQwDNY3S9sxcOKpJYcNrYfeV3WMlB5eo1NPmIvQfOflmk0metCoWQ8vhd
         xfrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773247539; x=1773852339; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLnMSxUqU/vOSI9yL7h3tOcbtV9bRdE2IZoz3VycQi4=;
        b=jmPE6UCj23QASEWksSp0A7UFQwiKxfutMLW/i2OxyrCL2jhRekfibYFNZOq8ffViVE
         kz1KAIwtpGrfGJU4M4ldMIqQYznP9HD/jdDyPhRK+PGaLz2LOU62en+e7TvpyBJPJ/CA
         yqD671LbL1VD/R4lIsQXddwx84QuUWmD/7qQRKoi4dKsAReSnAieJcnDKoPB/YC7ey1Y
         PIaMKLO7ry0egXgsfqySigBAABDpXu/Pe7QwIUG9q69T/0SWlxDjnl29liiD7XowFbLF
         NFf+Gcsi3MLM41yspJO9lekXvAH/it7PcfWOwWlMjN0GphZ+CtrGnjx8QFnbjHalwjvG
         zUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773247539; x=1773852339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jLnMSxUqU/vOSI9yL7h3tOcbtV9bRdE2IZoz3VycQi4=;
        b=tP3tKqJBg+pGzd053o8WleEridvFdhmRo6GgkewskdxKpqVDu4OgdoJMlPiV92ompL
         EnV8CsZuxr2C1fFHs7glBWPbW3Fbyz5Dv52Vw1ve2AeM1Awee4h4bY0zXG5ylwAXFgzG
         36YF0L1+TXFVSUmyq+o3z5SaotzL7gI9W448iBGnuw6mvNRgdEEyjZr2a/Rtm4PQg9Sv
         ETdsKtoHhHkxoyc9HPGd/9klp6y9jS4tqU35MY4k5p/Qu40RbUm8xG7gLWECh67NF6sh
         ufvvheBEHA2UED2mwjuEPNL4GNXQPH3+KiGR+uikVBBKY5y4OSIpukMWoJuFoy7hpGlm
         PS4A==
X-Forwarded-Encrypted: i=1; AJvYcCVSBk5io2KqnfYQbIJXZ/X2ehvFanVPN5+O9nkP5n/zB8/t/qFXiy91p7RSLmrWpw8oA3KcA5skQZF09iRmqR3Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7Fl9WnWrr/6G+hjrnoipdHmKCx3VkJ99WTht6tqagrqOw5FKA
	dQo4/jvwv1ZXkSHEvdnTa5Q8K8DVokllkclV6c1yxhZ2jcWQUR8S7x3B2upNLqfUG3tdgSE9QU3
	33l8qoj8r4DKqcxyd2s29Faqkdeog13s=
X-Gm-Gg: ATEYQzw38Fu/WN0o0ioAOrsbFx98K6RHjEwDvs1ZW1WVHBjjk0CwCiWz8a8DSfDjvlP
	n8g0teuBV7mkSbzn69pA2SD+40yFIIE2W4fCS2ghS4VkXr14qlTeEva/4SPyDjQxj4y/9ID5dwq
	KlurcP8/4/I67h77WvY8hhtY8WDzxjVBvWaSyD2xhZ9UFtGXnag6hNmNjuRoVTYUf44MO0blc9g
	GM/wiwtGwMtscHoxhHFNADmVK6bOY3KkqhoeBGs0A0j3NIaF8l1QXP1lIa0L8YM5/AWN2QZTpoV
	UVjMY3tkQHVSMJrRJZo2Mj7seDCogwQdih+MYMNrCASaaRy/XiXfYgbz1qGSuMpcuLu7752x
X-Received: by 2002:a05:651c:1605:b0:38a:4de2:85d7 with SMTP id
 38308e7fff4ca-38a67dc9fbemr12968571fa.3.1773247538651; Wed, 11 Mar 2026
 09:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com> <20260311-dts-snps-reset-gpios-v1-5-ea1cc09fba84@oss.qualcomm.com>
In-Reply-To: <20260311-dts-snps-reset-gpios-v1-5-ea1cc09fba84@oss.qualcomm.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 11 Mar 2026 13:45:27 -0300
X-Gm-Features: AaiRm507l0YwGQ8hPR6SwFHiZ8rbTpqpePPRrK9orbsaemsmOMG7afnYzJw6ou8
Message-ID: <CAOMZO5CfB9N=arxsxf5V6pisVMM25UP9hvbbFL7R-R7sA6xB3A@mail.gmail.com>
Subject: Re: [PATCH 05/12] ARM: dts: imx6xp: Use undeprecated reset-gpios
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Christoph Niedermaier <cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>, 
	Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@dh-electronics.com, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_094541_594591_23CA9389 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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

On Wed, Mar 11, 2026 at 1:08=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Freescale i.MX6 PCIe host controller bindings through referenced
> snps,dw-pcie-common.yaml schema already document "reset-gpios", just
> like Linux kernel did for a long time.  Use the preferred form over
> "reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
> add snps,dw-pcie.yaml") in 2021.

There is a typo in the Subject: imx6xp ---> imx6sx

