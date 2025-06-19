Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509A8C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 09:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Af1OBCdjmgbt/lD9KT32L5IXYHmC0HvCKLNQiW6fK9w=; b=WqcFI1uD/TSP6tM9NCEcbkMczW
	3kBzMr/+pyDmcVylUPbbzrQtamRzEDtcfQ/Z+KoTC5pkQL/zsctCOASNUlPnyeqTlL2DG+FvVGpRu
	VirBiU0WSF1GvOkVLUYNlFVsyTsthyjASht3P/RRSajVfOcmkPbKdMzFiq+9mCdkvTg/i7h0GQKfv
	/RAPrqTqsm8bZs8DbMvZ0PRswohbRhsExpkNlrPsBuILSm+6v+NfHDQGW3ZqeOz5NTQSQ4eHWt4ev
	eDj0yaB6JojvAF2pyKQ5b7pzzlyeN+GFwDrjf4QQ5A1jnSWBUx4nrWSPE2NXlKQiRAq542rHqa9Vf
	MQVmKXwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBa8-0000000CcDU-0xra;
	Thu, 19 Jun 2025 09:29:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAns-0000000CSVA-0gwl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 08:39:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D1B7A5C6366
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 08:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12941C4CEEF
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 08:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750322363;
	bh=Af1OBCdjmgbt/lD9KT32L5IXYHmC0HvCKLNQiW6fK9w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Csh8OR/pk9BFeNnwmvLfFJG2JwmWeRuYOUoDSa+zSj9lRB1ZY/XlsL5cqON4UBYfT
	 ioVVAYqhvrTTZakzEiywyCQXZEcqZiTfWyccel4wCkjQfX3nM8Y1r//TP2rQrDIh63
	 QUSKrx/IeUGfqXERYQNcTYfEZIU3c0+dCr4+OJE2xeIZk5+Y6iOwlP4LCKbcGzppg6
	 YoBeAFYEidFfiV5gZwsYBXEexzL+0qcll7sNXfjMQ4sYlALzp8sr8t1hHYodFaiAkw
	 eEAI4C12T8jRtDiKMcZltn2jtsqJKFJPASK52m27RswXlJ/2qWJwm/dCtoZKo/mpyn
	 clP11XuDD/OmA==
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e740a09eae0so563152276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 01:39:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXo2MM5AwZlmRm1sf8epHrsmkYnDjVmvoEU5+OBUm5WjQXZXpdN0bXvt+1U2n1uguMGcY/Nq7RVBhRP7u7vs/TB@lists.infradead.org
X-Gm-Message-State: AOJu0YxXc5D9vBPO2UD1iEemKsTS38WEMVRrr3iy08gtMCqY0gmc8dSk
	Ke84IkJADUT8H4GILJR2QeRD+WDAfoGU3hpmaQGJoGJ4XZ1qIO4w0iFWoipz0FJHxTLIxPCG1x9
	Rt6KZ37WFzhuZR6L2yfumbsOOW4PidQHIQhJKNt6Xjg==
X-Google-Smtp-Source: AGHT+IHFhbTPC3IHdAEhse776L10W8aRjQW3q5wXxAWG0QvKzfsbI08GKkjb4oJHnymnKzxYSdGNC0f44vXXp8PZN6Y=
X-Received: by 2002:a05:6902:707:b0:e81:838b:c58c with SMTP id
 3f1490d57ef6-e822ac0a614mr27592560276.20.1750322362356; Thu, 19 Jun 2025
 01:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net> <20250606-6-10-rocket-v7-1-dc16cfe6fe4e@tomeuvizoso.net>
In-Reply-To: <20250606-6-10-rocket-v7-1-dc16cfe6fe4e@tomeuvizoso.net>
From: Robert Foss <rfoss@kernel.org>
Date: Thu, 19 Jun 2025 10:39:11 +0200
X-Gmail-Original-Message-ID: <CAN6tsi5Q_az2zYGLhNxvxmpZdHXusE-Uxwe9N0nWobdGQSVjQQ@mail.gmail.com>
X-Gm-Features: AX0GCFtRCeI0XKT_8-8WC0wDHRHS1a_MhotfcVvZBvXr_sxNNlpYqYYLoNopHpg
Message-ID: <CAN6tsi5Q_az2zYGLhNxvxmpZdHXusE-Uxwe9N0nWobdGQSVjQQ@mail.gmail.com>
Subject: Re: [PATCH v7 01/10] accel/rocket: Add registers header
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	Robin Murphy <robin.murphy@arm.com>, Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_013924_241358_BFC21C9E 
X-CRM114-Status: GOOD (  11.73  )
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

On Fri, Jun 6, 2025 at 8:29=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.net>=
 wrote:
>
> A XML file was generated with the data from the TRM, and then this
> header was generated from it.
>
> The canonical location for the XML file is the Mesa3D repository.
>
> v3:
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Reviewed-by: Robert Foss <rfoss@kernel.org>

