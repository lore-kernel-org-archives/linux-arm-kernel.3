Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEE0CF34B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 13:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Sw7qNK2MuqEfcGlDiodQEmkMQSxPXI8ojkn2672gPY=; b=TKHZGZwfl20xgD0oySj9XGz5xj
	Awg9lGsXttOqJLmXFVQS+VDrxaJ5n043B9Qz2yHQ8DwTpYsIz18JYsGG/IcAgVpoHnPMuXHhAVU0C
	wSKt9je1cVtRigLX4x9DxO51EF/xIHFr1Vc4mpqvlVvdZvuA4KJW97Ztaq4r1X1aL09bwoOxNjZH4
	kPitVL6z5tPDgAxXeRfjgB3lx/nKwz9By1mHWiYRebBcO53CuFRTeZhxbAOudvqlO9bnOKQiBShtt
	/tfGQp3f3UngUO2Bo5ox/fRrdWVliQicAWB85iqSsXu/30sH2RLMv4PPpADplSokP+OM8HnW5bJHH
	IuJB/dRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLibQ-00000003Jwb-00c6;
	Wed, 19 Nov 2025 13:52:08 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLibM-00000003Jvo-458t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 13:52:06 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-37a56a475e8so60833891fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 05:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763560323; x=1764165123; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Sw7qNK2MuqEfcGlDiodQEmkMQSxPXI8ojkn2672gPY=;
        b=zFAxCinZpJF/ARIHxyxWZo6P8je9wHi+0KZflHuo7z4eo+0V0YyYMEVqxBlb/xPOFU
         5DbagdPE/QyQfkFkDi3pd5rnLiZ5Bf0M1sHEihiGiWjS76nVDRtTfyp807ux/adFl3VB
         oCD+arUlUD/LjDTGM4T4C3U1vIUlpLqsw3T2z/kceLTIxf31reQkF0nOX5ae8Hz4Q9ZG
         5nqrau7gWcDbIjVCf49ZNh+tPnw8FWh766JTZQGpIp4qkOgUGfndo0OpzvKnunDXledy
         8aREe4p+jw+d5EUjz9kmR84aGx1bnJ6ZljgNeB336GuUv63I8EhPQnEwPH5cSSM1UdT4
         m2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763560323; x=1764165123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Sw7qNK2MuqEfcGlDiodQEmkMQSxPXI8ojkn2672gPY=;
        b=qVnUVRuqqH8IGxUg3l8QavFmCgs8EF9eKBHHFPi0J+Tj0t+37fYk3SUqjKAD6cgto7
         O2N7oP6puSH81MiHq66nB+gyffL59q/D81EMNhJdrdIk8WTOuejwf95mO822R/7P0E9/
         DOMMh6sS+c0Ev6YzwQWVg6ZFBeX2N3mEsZnZM7onJ3D6kjGzW44blBPGg4Y0ENDH3YcQ
         yDV8xS2YjCYqT6TaAj1Js9rYuhPw1qjf/+a7VHgutu0+n64QbS6aQ82U5jARh6sVfU0o
         g2LzHQpz7u2ile8QFpnXeC9qGwZZw6mCKfyv123zMg/McdCsjWobrafBHd/hQ8EYrhbR
         zVIA==
X-Forwarded-Encrypted: i=1; AJvYcCUJQHkBGRI0pwA54O+P4PIPKumaK22rCNNf+rJvJwWWCNSWuct8eXoimgwkXoQr0Emic+KhOoK19OgppsFxXDxB@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgm2t5WJjVnNJcszSrl8Lsgk+MlcWVNapiw+jGwMVQFnh4C3Dk
	Jm9yzM5+7L1L4uV77NvksbSRtK4DZxKoqszNR+Lf32dhBdITNw3FIL1iSDrK8bolXkexqHeEkQu
	+46afLV/iMU57ZO4r/6XGQ6V93AcV00DhlWHdwf7C4Q==
X-Gm-Gg: ASbGncuA+oCUX8CLELauVDpJsT0qWJrNQuUivfescrMBvieCBJCfQCOJcNZ1bSLWzoG
	zIWHDVNhQyLJdY2ctI2Q0UH4jz6U5hBclrLsQII363K0E0+YuLrDPJOx3lOv8njg9eM80cg0EeN
	cn71rgIWA6oIeitUEG2WQaVv8IowD22eH0KMFE3eMYkAz3jQXaEwaEmVfTv+nS4813IWQvbvO/L
	JNu56zVwvtaCxUEvA9BdojEzFaso3JJecQckE1z80NwBXC8FEx4OTJxiqC1MI+qNn2fqXU=
X-Google-Smtp-Source: AGHT+IEmqj3lGDApr9edrXMaFwN0H3cZ82GlBpdq67AUQg80YKIMgCzJi1RzhM8yWFVqY0UQAGJbUbSB8ccCc0F5BHI=
X-Received: by 2002:a05:6512:3b9c:b0:578:f613:ed9c with SMTP id
 2adb3069b0e04-59584201168mr7597957e87.43.1763560322586; Wed, 19 Nov 2025
 05:52:02 -0800 (PST)
MIME-Version: 1.0
References: <20251117-upstream_pcie_rc-v5-0-b4a198576acf@aspeedtech.com> <20251117-upstream_pcie_rc-v5-3-b4a198576acf@aspeedtech.com>
In-Reply-To: <20251117-upstream_pcie_rc-v5-3-b4a198576acf@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 14:51:51 +0100
X-Gm-Features: AWmQ_blwvWUHZn6LSm0qwvTRD5Kr7vftxNarMVR6ZM3aN6PFLC6U4mHy-OgOWik
Message-ID: <CACRpkdYp4NuxDA7QLnqQ_pfd7sFZuDjCuZQ8Jim3BYXN=u=2Xw@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] dt-bindings: pinctrl: aspeed,ast2600-pinctrl: Add
 PCIe RC PERST# group
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-aspeed@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_055205_042916_2229E1A4 
X-CRM114-Status: UNSURE (   8.75  )
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

On Mon, Nov 17, 2025 at 1:38=E2=80=AFPM Jacky Chou <jacky_chou@aspeedtech.c=
om> wrote:

> Add PCIe PERST# group to support for PCIe RC.
>
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

This patch 3/5 applied to the pinctrl tree.

Yours,
Linus Walleij

