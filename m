Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED49C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSey80JFPh9lTWD+sSqyuQsIg2D7fhxscYbJM8DP7gA=; b=lPsQ7i/Bc1voMGPkM8ktam763F
	TSF2TxPcrFJM8kJI49JvkaR8AzjS9txNmP2ME2TD92Zs+tojfxyoD1cbD1GhHybx+fRNAL+EhEzwD
	PdYCd6XcGeYtVMPDGchJU1NAnIbWBOhqyFL0vnu0iMvfYlR3TbdQ7uOuSef5RnlCkTPdvppZBot7o
	4Pm9J49KBSufWR7J+jbwKOOOQhLmwkUgFyMvlIClOxR7zCxjpp7P5bpcIr/GM544tSzU9RwXJxfvo
	PZkExgAzMIl6hd5GFMh5obGXmxke3Jc+jLKLD+nIKN8ZdHhNnWcUaloWewINzXqviS64S4ZW/Bx9M
	OhwRqNpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcEI-0000000BvMu-3fjq;
	Tue, 14 Jul 2026 12:27:18 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcEF-0000000BvM4-2AQN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:27:16 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so6124915e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 05:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784032033; x=1784636833; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZSey80JFPh9lTWD+sSqyuQsIg2D7fhxscYbJM8DP7gA=;
        b=hv3JEr6IcZVn4H6+81+Ej6DO7N8QjGfoOgs6oU4gc6XoWBAzH74eKhPASQ0W03BcyM
         KpS3d4P9Kw/vfUZ3NMGR2Eqc+nyBwkVEJu8d/x6ac/QliaugYU5gmqe5EMuELR+6XjNt
         +AjBC7KLYbdnLUFxtyXQLJxIpMfn0eaTE5/MUXdyuQGruayTtVpseh/r9KnQEsSOXsMB
         l8xtdKJd8FnhAw727oesQo8Pvo5WcJVRKLh0FgsvJriQq3zSYyOrShb4HJEjTWWnvz1d
         xgMOuj62y4h73zeS41ugbvkIls1L2plf5E/dVlxqRFuBNHuv6Z8dXaSX9kMG4ZzTgWPc
         hUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784032033; x=1784636833;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZSey80JFPh9lTWD+sSqyuQsIg2D7fhxscYbJM8DP7gA=;
        b=TiOQNo61Be3wqsG8sZQiop9HXlP3KXoZ8yaYV/prUzRFq80lAFG+3IEXZdTG5T3k96
         g35XC0vghdXKvEHcZhbTZlMGXfR9shW8OqY7Fdc7PjfLQeHl+/NS/PyvmjnQMGqLqK33
         KI8j1dU7awFh18glHR4xYJxoIgu5hY+td/T2DUoN0ubnLp6ypiMDv4nSShHaJm2Uvjwi
         r2VGuSm+QBJADZJaIewDi6b7+cEa481TpJBd+KbVqJ//eGVLYOoRb9eFR01fV7/daWvH
         1QmiYjUNHsqpfaJtPKnB5a4dMfUMTGd95cnsDfmendouyguLlBPJs34CxrB1TwZJkCVB
         cRVQ==
X-Forwarded-Encrypted: i=1; AHgh+RozXQyF2iLNKFewKbu/4TsIKBgf1Jk9krmlLl2f1kxC3Y0Ks+wSvJdmiNT0UZtDpaxG4E0CTwpmM1WlBgO5frbu@lists.infradead.org
X-Gm-Message-State: AOJu0YwXzcxLEfUJhhbVffTKTJpvyNna5zl5rzEDBAF9wCQLWr59L70Z
	rutWButbPBx0rPQaSZNFzyUo9RWqqHnCyyNYGO22Y8JpIsApw3wpOVGLwcIv75x2o9Q=
X-Gm-Gg: AfdE7cmlFh+3pq1r5tckNH0BislONM515hXz+eeObNS+enhH6DDT9yFP9kaZv1GOPFB
	Q9Dmx/xYzHosaG0poV4RH5mfEjBg8qhE3G0DG8vY+tWKx6V76WLukgYqRf2CdSQhxoxnb/N/qwl
	Yih1fcZ0vutugDiuuZde82eescvEsolxk24MiMSC5p/t9banaVqfIdikishImvq+Eks7rMe8/Rc
	fCURD7baMoIKl1o6GeYO+Hz1eZu21uHLiYI90/Yn2U7YSvglpE7P2RsLPS4xIaHgg+3LqhRNwna
	meidbXvtWUGToMSn8oKpCVCk7cqgB1znHSIk+oWUIuazubvp2DY0erKCfl6iTjvbZX52oRUoyKP
	gSTEUWC3gLRFWKs7PjNTpF/8Q9MIHCNH81kPLsPh9tWAwsoAxyACutesFoNrmk4cXPI3WJ5CJ0b
	xUMb6V4u98H2WUepD0CpNezz5usCA8feAIRwt7HDYL6tX37CZw5WuZMv+Oxts5hGeYTEXEpBKUZ
	AmLgJUAg3SPb6Da4wBlOpY1hQ==
X-Received: by 2002:a05:600c:310f:b0:493:ee3a:f05b with SMTP id 5b1f17b1804b1-493f87d7fcdmr131894065e9.7.1784032033466;
        Tue, 14 Jul 2026 05:27:13 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49508732395sm71538925e9.5.2026.07.14.05.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:27:12 -0700 (PDT)
Date: Tue, 14 Jul 2026 14:27:11 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 07/10] clk: qcom: videocc: Add video clock controller
 driver for Eliza
Message-ID: <alYq2J6hd06g9XyC@monoceros>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
 <20260713-b4-eliza_mm_cc_v6-v7-7-4d91bcef50eb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ebx5plxbs5ed2t4p"
Content-Disposition: inline
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-7-4d91bcef50eb@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_052715_571038_E2D26F18 
X-CRM114-Status: UNSURE (   9.74  )
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


--ebx5plxbs5ed2t4p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v7 07/10] clk: qcom: videocc: Add video clock controller
 driver for Eliza
MIME-Version: 1.0

Hello,

On Mon, Jul 13, 2026 at 08:23:45PM +0530, Taniya Das wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please rely on <linux/platform_device.h> to provide of_device_id and
drop the include for <linux/mod_devicetable.h>. The latter header is
going away soon.

Best regards
Uwe

--ebx5plxbs5ed2t4p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpWKx0ACgkQj4D7WH0S
/k73NQf/T09jaRmPJhz4l6/RUqCHwddXVzILSJXm5JaBiJDO0DMQ7ba66QjYb4dl
QI1n/Dhb09P32uDl6jsczhMK61GxspOgLrFR2hBJzih+s41bXQ7uPoTac0gcaxYW
7ldbJEM2KWQqFfrv8evU5objg4VkaDip0n9ci9nt6BgjQpYrjjX2clnDM/0zDdp+
J8Dm1K+VIcHnIuhNQqi0ptZUQ7G6eoC2c6bWlZ6aaZm8kmv+yuRaMgI+u78AEzgG
aSj02assVonsMuBMLKWJt55XzGBjwDCaWmUdfxbvs8kPIqtPeP6z5JFX/FcChP14
2tr6zJZjaXuLYoEM5CwI84TE9YnOXQ==
=/t+O
-----END PGP SIGNATURE-----

--ebx5plxbs5ed2t4p--

