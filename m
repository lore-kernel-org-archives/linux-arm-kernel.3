Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1CFC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 13:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWpWmVQh5LkKQ38Ckz6b68wz7ZGK8S3wIAjuRScvxvk=; b=elEkJFINNdxPGTeBLT27GqgnCk
	FYTjXmoz/LOkms4PuMn1A34hH/3AfImgOu5VmgzrY/1EkrCekkwgte4ic9yjRK4zA15kkF7tWV4/g
	RHRNiTzxun1C9av/lb7XkOgSmXEsulSTpjMrA3zHBYS2zOHnT5df4c8cCCBWZ/11ntIHRDfsfgxaA
	c5TnpjfmFRXZFbsZ4b+50ibvTVQs0oAXZe6on7JZ3eOxaKLjYWsWtqaMN3SHtp2lgBVo5c31Y7AW9
	IiHkaIgp2zHZkL8zXMSei7h9tKF8RI5l6mC9zeeEABIYw/66RON0QkxvuwOEMDOrzLgOPNT+TFopE
	mm2FoFiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9OZd-00000006UNp-3qSJ;
	Mon, 28 Apr 2025 13:31:05 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NTJ-000000069gJ-3jpo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 12:20:31 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30c44a87b9cso40839621fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 05:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745842827; x=1746447627; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWpWmVQh5LkKQ38Ckz6b68wz7ZGK8S3wIAjuRScvxvk=;
        b=lj/jjeL7/JZ4h1qNwNLShwLB41ua1Wd4BjYUtEu1hylXe8URe/bSXoFjXXa/Iqf/pH
         PlTDmR27fbA0WnnXDnnWt9hJC4X2AzU7/w+W5alGJ5x72/hAQY39EVXe7iaCYpLerCj4
         HRaS8T5/3E67dib5Kp4o8e1v6JH1r1t2oINEX/ZLleuowYYpYEIGiGwN6Teu7YXoXM7V
         /oE2OmmE0ZZsnqBOs3mQw7PIvbucNH2Q8fXobSX0Y9sPhs4TQ+o+T2GBLRubDa/qR3nd
         j8OUP0EAH02TddmMelh5thEQ2Vr9GrHCbvUqaiDRGN7ZUhmHH9+hvNtI2t/5x1scLFoV
         HNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745842827; x=1746447627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWpWmVQh5LkKQ38Ckz6b68wz7ZGK8S3wIAjuRScvxvk=;
        b=FBBtjTI6NjfCPqrimfmytXnOPuGrPyDRy3fhuo366R4lU1kErXFgpqqm7dBH1l4qq4
         CxQyQDfpFnsPC3A/75SkBxoNiyh5KBfbtQbHjLECOrT24A3gyNKRytKqifllTpwtD0W0
         jCgdBf5XDCO8g5Wn+3hh63KnXiIcamm96wmqJ6pQaD48hAKOPIP5NS+3KvxFpYv3vvtw
         LR41xSJSwCLRMrR/YzMBV0Whgl0G7C8YY50HTA4HItJO6KAHAliQbMD/1+8+F7bemdQ1
         6n1pnh1d4NnBUgS2OShhsrQsOFiYDDX5hHf4tivb74rtb2Pj+jAi9v3CqTS82m/khccG
         Iteg==
X-Forwarded-Encrypted: i=1; AJvYcCV0FTfMQyjNZzlfYql4szmoCqc86UO4e93gpNOrBfqjlPoHqdYaCo5wlbELNAkVnd+wmg0x77ZAPr851vyEHsm5@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw7VC5UtGr216AaCuIRwXqj1OCOX+TqzTjpdyHAEzE+O6Yrhs3
	pVFm6yBB52tWvIoZOCw7i/gA3zSFKv5cFGqBskFMpjW+uAmWbAYX6UMd19Mt3zt+/wJQWvroUzX
	dcLI/inxLx3RwJF/yia6WgYZ2eCc=
X-Gm-Gg: ASbGnctGVZM7K18c2aFBZEtqgq+DD4Habh3fBCIyvbOwOTa0uqQCno/29BUjteGupT/
	NfHxq8t1lne21U21I2cLzJiHAARpQ+sR4EIKFEDBvJKabLBbA2DpL7FlFq8odobEgvW5jNAKXhl
	syhKx8Pl26CxGLEsiErMtDTY+EXoumcKw7aXSxc/BTUlkCPGmfwCfENisRD4Ngq3cl
X-Google-Smtp-Source: AGHT+IEH7MzW5oALwsc/C1WmzilPjbYvu0ys4k1ey8nO0994HXLEhmlKcG8IDGOmdq5NvefT7TwCpG/T3Y0sA3Y96g4=
X-Received: by 2002:a2e:8048:0:b0:31a:56a5:8454 with SMTP id
 38308e7fff4ca-31a56a58783mr13285171fa.15.1745842827247; Mon, 28 Apr 2025
 05:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250428074424.3311978-1-lukma@denx.de> <20250428074424.3311978-2-lukma@denx.de>
In-Reply-To: <20250428074424.3311978-2-lukma@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 28 Apr 2025 09:20:15 -0300
X-Gm-Features: ATxdqUF9vhWUQdAh6ucd_rpBTSQD6jiO0FGzDnLrY9eVB0nzIxQ7MHR_oHtFiUs
Message-ID: <CAOMZO5CYq8YKZBM6nk2pk8W0005MBBPdVqS_qe-O4-ZzkUG0bA@mail.gmail.com>
Subject: Re: [net-next v8 1/7] dt-bindings: net: Add MTIP L2 switch description
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Stefan Wahren <wahrenst@gmx.net>, 
	Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_052029_951654_88C6168D 
X-CRM114-Status: UNSURE (   7.07  )
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

Hi Lukasz,

On Mon, Apr 28, 2025 at 4:44=E2=80=AFAM Lukasz Majewski <lukma@denx.de> wro=
te:

> +            reset-gpios =3D <&gpio2 13 0>;

The zero here means active high.

I assume active low is more common, and you even used active low in
the XEA board.

I suggest using

 reset-gpios =3D <&gpio2 13 GPIO_ACTIVE_LOW>; in the dt-binding example.

