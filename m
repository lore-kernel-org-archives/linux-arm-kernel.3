Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C59FCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 12:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+qIn+RPmmwPv3OjgMXBX77cROFYyBV3LwSb/xEzaOA0=; b=MTS/YbuC9hOyokcIH7/GcMHxo/
	HVKy1d8AUwEh0reDRcasnHCttBc3AUipB2MAmr946Na92bAlI3GuybfOTLEoKBDUWQxyX1w+lQFqL
	03nztyYMYz48trtDP29glQZ7IrSH0br8saSUQjwiEQqjTBibS9a9w+Qzbxlb0JzGWkV2SbyoSvJHy
	2jqSxfsM1jiI6WY8F2UbP2orED/lt+A6NCicSBo4X5ALfVxRJ0qdV5h9Hfpplebo8WoWJUXxR82q3
	hB1xzcaxt42+jSYG8YEwitOLd4UughV+IMbarjHJ+omTJ0KQlorqWltmeYrNHv27jVQTZlOBzCM7S
	X1Sd+TMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6q1Q-000000068P7-2EOi;
	Thu, 09 Oct 2025 12:45:28 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6q1N-000000068Nv-13qE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 12:45:26 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-62fb48315ddso1348221a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 05:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760013923; x=1760618723; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+qIn+RPmmwPv3OjgMXBX77cROFYyBV3LwSb/xEzaOA0=;
        b=nKQtt/9gMFiE1sGis+10vK6p4/KpwEhnWAMbnEl9q/O0Byb/QAN6udcP61I+YtuQoH
         585b17jrVGd4ekb5XV1tMR3oSUKOcy8I3N176M+0gJF/PRm4Uqzmnc0nGIbbaXoVg9GN
         7lZ//8GA+P0pHiZiyUnRdzhAHlZGuVL6dNMgYRNsOaNStxhvnwJ3ArrCj/I4boCw5JHJ
         E1icRm2B2BFBqQiwZaRZi/94XyFoFgCYsCgeX5uwnln79dPSd+f4IjyIOVJTz/CtO9Tq
         Hwufh8f9yeAOXSWacejB4rpz3AF7HCz0H3jxoZKP0YhBDdc73g8yNw6+48GGi+Cq1r1p
         2Oig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760013923; x=1760618723;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+qIn+RPmmwPv3OjgMXBX77cROFYyBV3LwSb/xEzaOA0=;
        b=uuLrfB4TQEynGGZ4DrRPLqyt80JfSNr+VPHu5S0ejoffMh1vd/9AuIgDf8gZmx/OpK
         vKOS9G3fymuKEqsWxs3xDQ3w1GB3qRWMdPVIc31lmZZIOY55W9w0k2hYEhLIP9ihBUpF
         EML2Ql28UW1xi2qY2DrP4yynO7iTb1rl1AqGHQopHSgR2M0d2LRpCItJjHPypnlVE2DL
         n0lakdPeBcvXiujm0sRZ903g/K+/YEGm+gS9WeapXdNXVI2nPcg14UFclCGitMrtALxX
         x6tHJRF+sFFCrdqNYHrqXgmchVauvxXMI6LEqiOe4HWVI98LR2r17MYH1649nN1LTUJt
         KIfA==
X-Forwarded-Encrypted: i=1; AJvYcCVMYT9MeAqCUTdtWwhCrnReXCaCag8xrepQhWw0wDrL2RFBUB7c567PR9dEgWSoeNfmLJXPTiptf5ref38dXzJj@lists.infradead.org
X-Gm-Message-State: AOJu0YzaUEU4pT8Ifdmjov/qgvW/Tvan8Z84cjY/PzhQ4189NF8XfyBv
	HmBUCxsuOajWgaEO0YOoAh9arQKizQiemqux+DDKlvTwiqxqcNf23uAeZZfNRJS7nvA=
X-Gm-Gg: ASbGnctJF/X6yUkFHlaelSaP9BAtw/4gFc/41zMPfqVCc0lkLlIm8YvRXAVD1T9sx8i
	M+eIF7yjfqETRrChaanm0nCkCkOcJJ3U7v7s5xqygAhpId+z5LeW/sjnysj+Dt2KDVBCp9bwu4w
	NACokabR2qbvh1fnNqniH0IH90CVowC2D+vVV2rPNGSH9eAnwtcgCMrN99pnrLy3KjqZAx6iEhB
	k1XhaX6Kn2KvxSTlu9JqY4hfGcQZ5M6QMWd2TJt2h4WqBNIKw7cuwdUzc6C5abRgTqL890QeWQB
	33dpZYNqR35t8hWR37J8ELk+sdylHe3b2/21hpJ8tkG4eRjTYJhZjeuxDS6yr7rHq0PUH+GHVf6
	Rw+jYnZZT/urOsH24oeSzsL3VJzg88WJbTdjr77npFWFDMaGnNjTsRA==
X-Google-Smtp-Source: AGHT+IF1kryN6ovbJfIQc/Fy4MJIAskuq3zQgUsbduVZ1K8QdtBLyuZQWhuT43c/0DSCHjf+2b58hA==
X-Received: by 2002:a17:907:3daa:b0:b45:60ad:daf9 with SMTP id a640c23a62f3a-b50a9a6cb4fmr894498966b.3.1760013923400;
        Thu, 09 Oct 2025 05:45:23 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865f7420asm1880196166b.43.2025.10.09.05.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 05:45:23 -0700 (PDT)
Message-ID: <8e95e30e0ca9a85ee40f93e01c23edbfb4e1b3ff.camel@linaro.org>
Subject: Re: [PATCH] dt-bindings: soc: samsung: exynos-sysreg: add
 power-domains
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar
	 <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 09 Oct 2025 13:45:21 +0100
In-Reply-To: <13426fe2-d4cc-4d87-bc4a-4a6dca955456@kernel.org>
References: <20251008-power-domains-dt-bindings-soc-samsung-exynos-sysreg-v1-1-ab41c517dec6@linaro.org>
	 <13426fe2-d4cc-4d87-bc4a-4a6dca955456@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_054525_297153_89A05C1F 
X-CRM114-Status: GOOD (  11.27  )
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

On Thu, 2025-10-09 at 08:42 +0900, Krzysztof Kozlowski wrote:
> On 08/10/2025 23:17, Andr=C3=A9 Draszik wrote:
> > Sysreg can be part of a power domain, so we need to allow the relevant
> > property 'power-domains'.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0.../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
>=20
> It is not part of power domain for any existing SoCs, at least nothing
> indicates that so this should be restricted as in example-schema to GS
> sysregs only.

Thanks Krzysztof, will do.

Cheers,
Andre'

