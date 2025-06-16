Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6132C71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 11:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTabLOpgCLwYv8rCyGl7CwHdWBc3RbnKBwJmaj/inH4=; b=cBlmKGcri8Qs6oKdgzqAyl/VEm
	f4TILJ5+EfdecEVUTB3daITg4cX7zuOU3LEvdkakMOhdrL7a8es1A1lQkvwQdcvgIXllLQjITmDQn
	GgHvEMiCLIgcn+zAdkZtj5orw0zFfnTp8/adZGKrbV4L2CFYXRsi3pXh7CmxxzeIfCPlJZ7bhxY9k
	79tc/RMx9Y6AyIN/5E0ivjbxuLZwVqeUJo+YLP/QOaU1DyBrvzXVMvO2E19NYzf+MWHXVJZF17hjo
	kcwl9+dxEG6qxKR/WQfjmMtzfgMm90+/otkG9X71z4Nd9wDMNmGD0mJuamu1SMFGeGUmdBxlFOGHF
	EQ9x5BQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8RV-00000004GMg-0RlU;
	Mon, 16 Jun 2025 11:56:01 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7IN-000000046Hp-2Y5j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 10:42:32 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-313154270bbso4761167a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 03:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750070551; x=1750675351; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTabLOpgCLwYv8rCyGl7CwHdWBc3RbnKBwJmaj/inH4=;
        b=dVT2KCQ94+z/8OKotRzVQbIANf92j5xRcvMv4pUDBGoWtClRaPMg15FF2UfFCoiQ5Q
         XdiKn6hFvfrHZZ+JIheQgvfAvxj5knVbT4LzS+6caNUXfGCxeMPy5T9uOLlITWIRjn2a
         yfX2MdOwovtXtvydZ7sS2aKH8UXTf/rS2eSsg5S+RvbeJngbj2rXT5Pwes2WeyRH3F6h
         NPjOV71szbZ7i0ZtjuLFBRTys6u0CslvL5Bf4ylOHlqIo3PcpufjPp8o+StybUIwJynE
         xzqsou2wfc1cbXU3dO/qt2qbotcTaEzfMbHbuV6uHv4g9ZcP0pWt5s3OqvgZDVrrTBP1
         dVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750070551; x=1750675351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTabLOpgCLwYv8rCyGl7CwHdWBc3RbnKBwJmaj/inH4=;
        b=c2pm+7z/qTn/xaQ9/zOF+x0NJL1rjjvlh9NmDMd0jCr2xVYdKzX68EGfMuAuyqbp2w
         W4+f1GOGUtKL1bsu4+lfZ9epir086B64Ucv3IMaAG3yTAJbZSU3PO9nzAll7xdff151L
         FXSW6L1B4C8Kv2dDHptdIG7JMW6rxZbVZjWjEy+aJq9mNORdmhiDQWqxdTABz82HFSf3
         yBwLGeOrYS/cDDAQjo4PpidtU9A4K8CqNw3bhq7qAt6RK/LxLZlwlxxz/oO85xe6cgWW
         +CA9+jaHbf9Z0WutNz1RoF1aHqw/D38oOrrUD32WCBEfdKiCY/NIg6NRVc1lP+vy8R2F
         GaHg==
X-Forwarded-Encrypted: i=1; AJvYcCUiCXZNaiDiWV96Vw94eeryjVmdAgyWIMm0+WjTawHGMFMTdUdK8bfjxK01G6jPXl04Cn0IaxREL62jXVKDastE@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8E9CZfK2J7xiEsVJXUaadJInXmn4opb4ORoQI5vD4eMWmIXeO
	wENTtGfx082iqk04v42zR6/lFu3qEpBTOMsJEeR4MYGr+injdxHOSkk/zv8LCNDZkmMGrvchd9A
	GumSQoEIhsMBcJvD/5fKDRp3H2qm0hko=
X-Gm-Gg: ASbGncvjVZObpWbvDLg8hhrI1J3aoquY88J4MU681JwWSVrK4XHylpfvwg9zUWFfkTc
	Wy5IaLdGbDVLgb/LcjKCHk3TZzTzEpznJAD9+wDCN9gFsOEegDnSs9Wcm3TApwebfCWFEjlda3g
	r03I767modG3GgUQ5pQdeU08wk+L55yQpoBsHgbxg4
X-Google-Smtp-Source: AGHT+IGdvq4Jz7wCl7O5nLF8AdUqsnNZK/jUgiSEfeGbfX1YCA4ekJ6+LuyEXZu02NW4N5RvWGmagNrrauMC8JexM5M=
X-Received: by 2002:a17:90b:274d:b0:311:9e59:7aba with SMTP id
 98e67ed59e1d1-313f1be899bmr14937709a91.2.1750070550782; Mon, 16 Jun 2025
 03:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250613100255.2131800-1-joy.zou@nxp.com> <20250613100255.2131800-5-joy.zou@nxp.com>
In-Reply-To: <20250613100255.2131800-5-joy.zou@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 16 Jun 2025 13:44:31 +0300
X-Gm-Features: AX0GCFu6L7Akim9BySCPjWCa7aS9JinLbW1qVZSuSXFVwqMzcBMNsyM6unHsnmE
Message-ID: <CAEnQRZAp8TX84AygSjWGx-cNiLyZXZwUx5C-DLDuyB6hO3gXMw@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] arm64: dts: imx93: move i.MX93 specific part from
 imx91_93_common.dtsi to imx93.dtsi
To: Joy Zou <joy.zou@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, catalin.marinas@arm.com, 
	will@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	ulf.hansson@linaro.org, richardcochran@gmail.com, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-pm@vger.kernel.org, frank.li@nxp.com, ye.li@nxp.com, ping.bai@nxp.com, 
	peng.fan@nxp.com, aisheng.dong@nxp.com, xiaoning.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_034231_643632_67EA8F5D 
X-CRM114-Status: GOOD (  12.35  )
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

On Fri, Jun 13, 2025 at 1:08=E2=80=AFPM Joy Zou <joy.zou@nxp.com> wrote:
>
> Move i.MX93 specific part from imx91_93_common.dtsi to imx93.dtsi.
>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> ---
>  .../boot/dts/freescale/imx91_93_common.dtsi   | 140 +---------------
>  arch/arm64/boot/dts/freescale/imx93.dtsi      | 155 ++++++++++++++++++
>  2 files changed, 157 insertions(+), 138 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/ar=
m64/boot/dts/freescale/imx91_93_common.dtsi
> index 64cd0776b43d..da4c1c0699b3 100644
> --- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  /*
> - * Copyright 2022 NXP
> + * Copyright 2025 NXP

This should  be Copyright 2022,2025 NXP,  as per NXP internal guidelines.

Am I missing something?

thanks,
Daniel.

