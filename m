Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D2BD711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 07:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9OCWFingE0nz2wPBjE6WWnDNJpfpwzPNb54tcsJZ9Y=; b=UP3I0vW7kqxKhGA+nIbIGCY9Vz
	Pz7FOsK0L0Ag8VciSKn03K69c7BFElI1EpWgKRZTQthfNS9X+uLcdT+k0HGfG194UmbzaAp/M469+
	CCyS1IU9QGXuhh7AcK86xt/6c93+nHy9iGrGcllewGEtFFDyHMbTp1RX0zPSB8c7yGOlclBqO1M6z
	8Cv/m9zTPlNZw9Xo7zXavzOYwZNZjNyiKEUjmmb9ezq3K9c3AWT2r6qf1XTqXCKCnNP2ACcLxa57y
	VkHCCsUn7nbXGDWx8puICeQg1ktppPNxf2QwpK2V9VqZE4b80D2akEQdWwsXQ8EsxozNc75O38+Yt
	5xARaa6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXaen-0000000DN28-1DdR;
	Mon, 22 Dec 2025 07:48:41 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXaej-0000000DN1Q-3YiU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 07:48:39 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a0fe77d141so39490085ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 23:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766389716; x=1766994516; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9OCWFingE0nz2wPBjE6WWnDNJpfpwzPNb54tcsJZ9Y=;
        b=IT6ttQhq180nbZM21pX2WQ4ZM9OFbkCm9+L/apwHV7F2soqLLUakHJGQ8a8kx+Xvdz
         c10RELN+ZVBCy3rZqpYcGeSMkbNEj+9hHM4qFKg0hWl3aGXWQv/zp9MYKe3Zui/yyFO5
         4t2kngDWMBVDp8y8qenqPbvLuU3xi6vN3EkNQwlYlCg1HNmpmiDpbzcIeIIxTSoDq33r
         FwgprVDy6BrxP94hsM5jJIzJ7q7HSfs9Z2u8kh1QewB/D12gFJWZtFZbboK8omuukm6f
         rqO19YhbhzC3cAAZXe/Uf4a9AUIAHN7+NucUo3VIeIwQn3J2z8JHAGkuacjgFSjrgrzW
         WT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766389716; x=1766994516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O9OCWFingE0nz2wPBjE6WWnDNJpfpwzPNb54tcsJZ9Y=;
        b=IpN1jqPTNQraRLMe4RMcx2M3V8dI1pq+i9DRh5XL7AkBchrAMTGLGJWMfU2h+3isLo
         2l33gps9vSmzYJ0BZs+1Y67EesOVLsKhd7CZyzj8RF1qF0dOvMun20yYmjevHPYT35Cj
         00IK+3MiUk5b24HCDHuW26IkrtmmyzIJqWjYCihLCn3ibE+aYF9i4HM3hap4Z8cefzK9
         a49DqV3VVOQXkgVQhsoQB0EdTO/KeVCiF+5UOmW8qtcm1YC6J0r+BuRqC8zkPhA8aHnf
         Egk4p25IhVFJyYusbCqXbQOQql07ziQdWcoEvEyStIu6VQu27SI1bKVs7z8I3xOoomkB
         /tLg==
X-Forwarded-Encrypted: i=1; AJvYcCXh1/Cm8WC3xBzx3pujDEjcYCpz7c+9JpRDipn1e+hJ+9FmkugQeXyxpi/uCGpse/3PxkrRYwAFK8JgnKoHhM4T@lists.infradead.org
X-Gm-Message-State: AOJu0YyY704NTodE8k3rMH0ZCRypOQJxer2U4KGHPGqPlqwBWJr9OSui
	LMHilVDRz48eT2orvlToqZ4jNAw7Km63TOCpJDpZR9TYz40Z8QGfDC6rNki8/H2WgvbDdAABa6G
	bcsLb6M4zMpGUwZG7nesaf/N4riEY6Qk=
X-Gm-Gg: AY/fxX69CbcYWk7C+8VMTzWKC3H+9I7JTXCwa+IjRDnSqDTN2NVTIWmvKKAxNpmE5X5
	QHGpn7WD1UZIAbt1o+NrSBfSdj3wqb/SRttXv3gAyLFlh1YSvrbgezcu60xDz7C4qu8Eb3wT2Li
	9vIH7s6nvNxYfH4lkpUuMtpXj7wxzGNz3nJZ1ToupXPhX2T19SZITycPLK15Q24RwzEWhMiLKPC
	g8P6JfV9L2XaimUQ+YmPAS0DPT+zThR4HWfL+BVGF5R3byRBJQjsl8adL8wlpa00BCoegLcvqPF
	ozg3rUuGEceiFZLshJHn5kcwTMalt4/Yb3z7OwHHVcvc+2ZgT7VfWRUAQ06dll4xCh3Z49OnBIl
	XPiMnSz5upVduJDzrwlzDtqwSI1/clFyxWM6yiv2lBZAGD2PicWx5fS9+fA==
X-Google-Smtp-Source: AGHT+IGC5H9pk2WaAHD8EAkwNOOrTOxaDyXMdLCEf3TKyiNUxIOmfbIBS3iQduGYUv2H/hy//X3ygqs5vwpMpN5DTqY=
X-Received: by 2002:a05:7022:6709:b0:11a:29e5:12e5 with SMTP id
 a92af1059eb24-121722ebc26mr12189814c88.30.1766389716505; Sun, 21 Dec 2025
 23:48:36 -0800 (PST)
MIME-Version: 1.0
References: <20251222-imx952-v1-v2-0-8793ec8bad6e@nxp.com> <20251222-imx952-v1-v2-1-8793ec8bad6e@nxp.com>
In-Reply-To: <20251222-imx952-v1-v2-1-8793ec8bad6e@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 22 Dec 2025 09:48:22 +0200
X-Gm-Features: AQt7F2qoIk1PNyyX4eWETsNou92XZKeudB4OtSdua0GthSZdmgmSnIjsrscm7Fg
Message-ID: <CAEnQRZC44ftit9y3hj3x9tLn7G+o_PFnJUOy6cGkD9iGSJGHXw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: fsl: add i.MX952 EVK board
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_234837_948098_8081F41E 
X-CRM114-Status: UNSURE (   6.44  )
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

On Mon, Dec 22, 2025 at 3:44=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Add DT compatible string for NXP i.MX952 EVK board.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

