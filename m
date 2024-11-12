Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D31D42B80
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 13:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6W+HKSuc4CzrIJX0IoN770edZbxi3Ko9sF7Bizv6jw=; b=jXD+eyb+wl+rg/uJDOomYlem6W
	Z7CSNLmKOOJPSKDBfsU2H7GzXmK/I3orBcjyDwK7M7PZmEyahjAjRbhBPhVzx3nkwkyHak1Z7ARms
	C09RlncGjPH1C+z0fG7N5KWKl9bePiNMqAE3WCF6ThacthVASPtOVLUWnOM0CbQwWZ0ZZFV6nsbZA
	Z4d9h7YiYS/2ejOZUPYQkSuKc8tq1kbSPiB8gjsgagHPIMRq+fPmm7QfrE3e9s7LuW0Awc3QPKe5l
	p/dtJ35Izke9Ie/L9SRxa57AOeEIV1bIRvoovIwxStc4laBcdWmDewb4UH92Kd5xs1jNQ8P/8s0M+
	Dp3P+2XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tArG2-00000003e96-2cAy;
	Tue, 12 Nov 2024 13:48:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tArDr-00000003dg9-1oy5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 13:46:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 281AE5C57AF
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 13:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9C0C4CEDC
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 13:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731419182;
	bh=k6W+HKSuc4CzrIJX0IoN770edZbxi3Ko9sF7Bizv6jw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VNoZer1X/koJEZkkYAW1p0Z0nOFRO0+PMkNpldz6DxOUXGN+OlMI7iisT8AJDWnrK
	 OkMROkHg2++QDnze9P3GkePn3jfLgM7Ks9HLn7N20/LQO+v1rZs7QFOZB2mn5B5Lyx
	 8q1+qafWxSs+PZCR6PtnK8NDwfH872dw4mL6JALKeW8iK3MXvY90Igb2zUHVuKyOn0
	 fITIpv4TlPNBsdPgoFXgHxYW5umzTuzvDzbvCCtpyCssd9LSy3ptPKfpJ5jPvNEwPA
	 ox12mW2Fth/lucCe6rjtEEgha/+i8ZzYRLVTufz7IcuRDM8WpvBa+0Z3jN+RLwZvOt
	 TyRuE76r+7zcw==
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e2918664a3fso4855146276.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 05:46:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWn2tb6K0ySYzGl8GKyvX8GqcwyxDm2tRVse3ohDGK0O9f2gSKBw3MshjQR6ntVrRJ2uHBWNdLrnLADvIt/WEdn@lists.infradead.org
X-Gm-Message-State: AOJu0YySOCQdFPDVoNQZhf8gqYG9Xlt2ER2Dl7oFbJSbo8WHzfB3p6RN
	Se0HwJcF+ISL973xRG09nDcfM+XgyF4uE9nFRZs9Sk/qNKo3qiauFAF8lvHU8ZGOAG0Vsngpak4
	A9miRjuVxUn61BkWUtyTRBM86bQ==
X-Google-Smtp-Source: AGHT+IEn0C0WfCG7tbpSyf5xX7DxWFdOpXhSBoAZ5hwE4Pr7xdWiEcgqvO/UcDsq9RdhhFj/OdlcAN30PYOvXPkThlA=
X-Received: by 2002:a05:6902:1507:b0:e28:e700:2821 with SMTP id
 3f1490d57ef6-e3380067b96mr12346210276.25.1731419181152; Tue, 12 Nov 2024
 05:46:21 -0800 (PST)
MIME-Version: 1.0
References: <20241112-am64-overlay-bool-v1-0-b9d1faff444e@solid-run.com>
In-Reply-To: <20241112-am64-overlay-bool-v1-0-b9d1faff444e@solid-run.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 12 Nov 2024 07:46:09 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJAQswTo2eWxLw62wqb-2i=_9W84_v_tW+TSW4kgNK3_A@mail.gmail.com>
Message-ID: <CAL_JsqJAQswTo2eWxLw62wqb-2i=_9W84_v_tW+TSW4kgNK3_A@mail.gmail.com>
Subject: Re: [PATCH 0/2] of: add support for value "false" to of_property_read_bool
To: Josua Mayer <josua@solid-run.com>
Cc: Saravana Kannan <saravanak@google.com>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Jon Nettleton <jon@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, rabeeh@solid-run.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_054623_539833_3BA73C71 
X-CRM114-Status: GOOD (  15.35  )
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

On Tue, Nov 12, 2024 at 12:41=E2=80=AFAM Josua Mayer <josua@solid-run.com> =
wrote:
>
> Boolean type properties are usually considered true if present and false
> when they do not exist. This works well for many in-tree board dts and
> existing drivers.
>
> When users need to overrride boolean values from included dts,
> /delete-property/ is recommend. This however does not work in overlays
> (addons).

As soon as someone needs to delete a non-boolean property, we're back
to the same problem. If you want to fix it, you need to fix it for any
property.


> Geert pointed out [1] that there are several invitations for using
> strings "true" and "false" on boolean properties: [1], [2], [3].

There's always bad examples...

> Add support for a string value "false" to be considered false on boolean
> properties by changing of_property_read_bool implementation.

Any existing s/w will treat 'foo =3D "false"' as true. It's an ABI.

Rob

