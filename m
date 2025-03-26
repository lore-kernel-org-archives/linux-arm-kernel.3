Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723C8C3600E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 23:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uA4AdssvpPqQ86j2mMIE0l6Ccwq4JMgcJayRJEXySK0=; b=qBQQDIELl5EG+YO8mOWdsAXLiv
	RKHJmzSW8VjRYc3WxsvITeyr+Z7aZmzRObjxievjJJ2c4tIJEOTLFhBMKEHPOzkHI0WNQGs0Rfvwi
	kVUhr6CPJcMDTbG4/o+R4Fb0DzIFgRFR5QKnPMxprBm6+L5Ud2Z6ADjMpIIBUP2UhU05facI0Dx8r
	Ntc0rv1+awBn/IIOn5QbbTQ+8o18qQM508E/BMGW9TXrgse2EJC+9YasC26gCdLJGU+8mEPKx8iAe
	ms5F0v9iB1xbElKVcmzjXCbv+oL5YOWB4EILGQtDJeDBhBok+C2Iw0Ti75uzj8ybxey1Ft6dq4Jq+
	VXyP6ijw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txaYu-00000009pqg-1Ixs;
	Wed, 26 Mar 2025 23:53:32 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txaX8-00000009paY-3y4E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 23:51:44 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5499c5d9691so387982e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 16:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743033101; x=1743637901; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uA4AdssvpPqQ86j2mMIE0l6Ccwq4JMgcJayRJEXySK0=;
        b=YElJtSwYw57AI0spcgeqOwqUpvWGGtVK7+ayWapCmk4EzhM1qbPljfyp+FNjCvP3hK
         DOSMBKdGfOYF1mybK6p0mCYiv/mFMfB2CNF595PWi8lV7gL6Qm8ixHJh/ddIYHDk5XGf
         RFxX/Rgkydb81FJGihrRykoqvQDXWL0EjZmxtPQYZFumZCM5zNkoWc0EADNiqfXQ/Od1
         FZ+m+5gVt6aWz7QVPQi4TXwClzEmkRM9qHunWbB6a0UbsQceAZtPC7X8nTAnI7MRcf18
         1yTEfIMMIMWtKBgY64AiOqfLqOqW4v6Z7kCIuYsG4IStQOGjEmASYBzUeKsw1lIsrnhD
         FPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743033101; x=1743637901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uA4AdssvpPqQ86j2mMIE0l6Ccwq4JMgcJayRJEXySK0=;
        b=R6jTal20O/xjOcyqPeoiBUFMgqct3G4kMvr+/m7O3s4NVZKS2RpDWUWQxVWF3jpjh/
         lWnK3Dp9zC38RluhprJZhfZs8G7AnKZcUVH0RXd+fsz4DKpeDPAIJKQSJ1cXD67dPYEm
         Kl9ZtERtbQe3kMyl8mRbhe6TJ0vXmU12Gu6OoXRO/rdeBdqwOODDICLcSfcMQ3XHLwX+
         5FMewUg0xtTw/POKCFtNBjTWkRIpRFEckadKWGgV7tLsPDMSLL6QCfrF/Nx/NleiP1PU
         WT1WOu6yN66c3IFsXTR7PZgHQl6j2PlLWc2iXgsNmAVKIAV5RJDFHpos52CUQydArLeF
         U2MA==
X-Gm-Message-State: AOJu0Yxsfag730yGo0W71B8fp+6LDVP/oFrIEzk+5KQXMovU85ymzT5c
	FhHHo3hy9ikOU5Ll6Llf3sqH6Pc8P53WDYyfsfOBtAGrXehJ6VoV6r4E4IQE/+ZIwIX7vNz9PBT
	nVQSXnv/MLra4ZhMUcKexdSVaiwQ=
X-Gm-Gg: ASbGnctUSakC6URW7qpnjUlIfadPOv9ZszVyuAYIbZNj1OcwiW96+t2hvSavePfsPj6
	SEbDCrLEWhU8qQkXtkBABx4qPLCxNTWMq2hJh67meifb/8MXeYxhIr2qP+ExRPecULCdpzXo8io
	hOWRW8dvgX8Iu6Goe+QPv2wAG5WtA9CUs6RQybdM9+gnCVRcc1HagGzvJi1A==
X-Google-Smtp-Source: AGHT+IFYELfgiO+wxoWio008fIXIKA1kkoHvCfFRSp46GuCuNDakMgDbEsBHq6K37MFmmLbGrQDsEYkZtP/RiQvI5A4=
X-Received: by 2002:a05:6512:108d:b0:549:8f4a:6ba7 with SMTP id
 2adb3069b0e04-54b012201fbmr462220e87.36.1743033100314; Wed, 26 Mar 2025
 16:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250326223841.193234-1-marex@denx.de> <20250326223841.193234-2-marex@denx.de>
In-Reply-To: <20250326223841.193234-2-marex@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 26 Mar 2025 20:51:29 -0300
X-Gm-Features: AQ5f1Jr4DbKXNs0s_yqnIidvZAgpTckMlWcRo8PQ0KBPDukXSJkiLvMa4vA1eSg
Message-ID: <CAOMZO5A0HKUNrYmdVrSZp6zcmVcdS0TRTiz_7py73c3b+ng3Bg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add initial support for
 i.MX 95 Verdin Evaluation Kit (EVK)
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Conor Dooley <conor+dt@kernel.org>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, Hiago De Franco <hiago.franco@toradex.com>, 
	Joao Goncalves <jpaulo.silvagoncalves@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Max Merchel <Max.Merchel@ew.tq-group.com>, Michael Walle <mwalle@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Tim Harvey <tharvey@gateworks.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_165142_981366_7C3266F3 
X-CRM114-Status: GOOD (  11.11  )
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

On Wed, Mar 26, 2025 at 7:39=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> Add initial support for i.MX 95 Verdin Evaluation Kit (EVK), which
> used to be the Titan EVK. Currently supported is lpuart1 as console,
> SDHC1/2/3 as storage, WM8904 Audio, USB3.0 and ENETC ethernet RGMII
> Gigabit port.
>
> Note that the SoM used in this EVK is a derivative SoM from Verdin
> line of SoMs, an actual i.MX95 Verdin SoM is under development.
>
> [1] https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx=
95-evaluation-kit
>
> Reviewed-by: Jo=C3=A3o Paulo Gon=C3=A7alves <joao.goncalves@toradex.com>
> Tested-by: Jo=C3=A3o Paulo Gon=C3=A7alves <joao.goncalves@toradex.com> # =
i.MX95 Verdin EVK
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Fabio Estevam <festevam@gmail.com>

