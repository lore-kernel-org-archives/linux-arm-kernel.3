Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692F2CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 22:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MklpS3nPFH/8Q8+o9LUwlAzS9y0GP87dIrP5WY05aXE=; b=fZNtdLQKDOSPodc7hryEfeqZQD
	ymrsaRCivxcUfPQcWFtuLiXXZifrqNbp3VLGcw+NJ7i6yrNgsDGE/U9DGSMmzCZqlXfVUpc9X7y0O
	w3rr5FrvbJHWB9MiTwPnrIGN9mKCxPWTQeASHbMbwOVeYc/kaQnvQlc/SQRQg/wDa04Cx0prHwsGW
	9wdefITUYdq0XwrQhnlY9qUWOzqQGg2gFlh1K/90jccvGm/tWDHR0gEiQjxUED5ESpqPkoyS5dadq
	oBBpj2AiM6SNeQBfOQLDUi2dA13Qc2FMvIeHSpckxVDTWcnnFFh1RJIBRc2vlYhQowTc94bIFHfj0
	5E3Q8DTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVUa-0000000EqX0-46fn;
	Mon, 27 Oct 2025 22:15:08 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVUY-0000000EqWK-2Shj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 22:15:08 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-592ee9a16adso8899665e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 15:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761603304; x=1762208104; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MklpS3nPFH/8Q8+o9LUwlAzS9y0GP87dIrP5WY05aXE=;
        b=b28HWuF47gs8rF0fK1dbPbLc1y+4eHOS6YvDXbc5NklOiZwEQcrH71FpEdhBRmipIm
         X9neoFO4Y4uCA5N6O1rWrzqpu+mpUXXi2PwQkIc1QxIvwhsspkhNJ0NmaTrwN3nCTEpl
         bcQ+BHntQflHRwJ80yc5DMHmm89D1ISD5WzUsU2T25K6mpqDa7cGp8jtd4Vn3FQ5OMzk
         otMdlHiY6p29uX/rAHkvuDDDMY023OUYtWGvQnVut2p8sUYpc3N+OIcXllEwZ+xz+gKM
         OV/qEd/9aMhUlDPdHF/R+73R+DdbERCtMIrBUdd4OD70kT2CNKBtYCyQxP8ip0WzEWKx
         BZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603304; x=1762208104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MklpS3nPFH/8Q8+o9LUwlAzS9y0GP87dIrP5WY05aXE=;
        b=I9y0g75Q/7O82w2iZxj/E4tLCpfnyb6m/kZUNTbqoZwV8huLHt1IyxXoKPA/cQhAWI
         FsU5vmK8rAq9gqrLagaJm6D46UwPrO+vAHgapioO0PIkMRP+uVZ06z0WGYHLQCU3VNj+
         x+meulqmG/74ECMSBPS1Toi0JuWRy1a+2EsyMp3yItvP1/55A7UTpgO+sggsW3hv/4T7
         B/O5nT8Y24GYAG2ClirmzNkfE9Kj7ZoTxNuRkO59vk0o5taoJtkly2jYbEJxI+R5yCFs
         awZP34g/qJ0xj/ksUSzCKS5GFF2m3m65/gGKONxV87RApbjFXRpxmcLXuiHH7vNF2iN/
         7W0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXV89sovFDS4pe1pYYzIZMVmURbORpbIkn4ZJarRueMFSYlYVV+aJmXJkhXHQg707w9q5ZI5gsLUgGNVjrl2sD0@lists.infradead.org
X-Gm-Message-State: AOJu0YwNlXpemvodfRm4oCAv79sfWVWkTLzll2/czrkYFhjmxbwOcuyh
	Yy5k2m506J/vbJVxCJx5aC2VsuscAKNz2chTQQpvYxl0QD5NWpjr/RRzbbhQ1L52In9KS408r8A
	OqtVqOSPBJ4G97VWbAHbiznOBySilWXEBEAYdNEJXYA==
X-Gm-Gg: ASbGncsj63hP8nwjr74FGcKaVjxgUUP9OMDmXVXztAJfGIw+GMpmdO0rZbsvu+zGeP3
	lSfO505WufzOMiwimQQCKP3qEg9e2OAYfdmHcFBGiFHkIgvhcNJgkBDPbLUli+fRib20+IQd69H
	DOs8CacOO7Oq+WPS4/uXRGW0hg8X6qC7FgWjkibNYYrlNNkobtRR+blmIINZih2QkZXv1ERzw6+
	PbzEgDn43OW3EcUlbCLGJKdnmifma4wlkdoIQ6iJqJljDd0B+z//TV9Q0ntPybwqA+DcrI=
X-Google-Smtp-Source: AGHT+IGLhiO6SgwWEy6J63NGSkHEkhNG2WH3ZWZ7Mjt5HjFADLOLTHG32rGKFBXTboiBLjapU4iKntf9dVI4uinRnL8=
X-Received: by 2002:a05:6512:308c:b0:591:ec0d:3014 with SMTP id
 2adb3069b0e04-5930e9c3bb1mr426683e87.48.1761603304563; Mon, 27 Oct 2025
 15:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com> <20251023132700.1199871-10-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-10-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:14:53 +0100
X-Gm-Features: AWmQ_bld4K6zXNCkN---w7iwBNN2WjFxw2gv2dtNkgQHft2zTjwtq7Bsw-LLEv4
Message-ID: <CACRpkdZoecqkKfXmu4ih3qb00OMPmAtJVvyqerXf52n+s7vFxg@mail.gmail.com>
Subject: Re: [PATCH v4 09/12] pinctrl: stm32: Support I/O synchronization parameters
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_151506_645999_331685DC 
X-CRM114-Status: GOOD (  13.75  )
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

On Thu, Oct 23, 2025 at 3:27=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> Devices in the stm32mp2xx family include an I/O synchronization
> block on each pin that is used to fine tune and improve the I/O
> timing margins of high speed synchronous interfaces.
> It can be configured to provide independently for each pin:
> - skew rate on input direction or latch delay on output direction;
> - inversion of clock signals or re-sampling of data signals.
>
> Add support for the generic properties:
> - skew-delay-input-ps;
> - skew-delay-output-ps.
>
> Add support for the property 'st,io-sync' to configure clock
> inversion or data re-sampling mode.
>
> Show the new parameters on debugfs pinconf-pins.
>
> Enable it for the stm32mp257 pinctrl driver.
>
> Co-developed-by: Valentin Caron <valentin.caron@foss.st.com>
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
> Co-developed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Patch applied!

I'm really happy about how this turned out, lots of generic improvement
with this as the end result!

Yours,
Linus Walleij

