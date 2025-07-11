Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0EBC83F24
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 12:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2AEASaq5CDzhb6ktnTbfQ22tIfOZRPSGaJHgFyQUuec=; b=uIFGrMB25ezaYrrSGjfyS1wFx4
	m/WCwsGdEbH2ExN3aYswtAXB6uVV9NijKvn3czVW48Y6A9c0L0ZlUcD2667CyWvWmwFvMJkIgKVUW
	TYUY51eNkbmpEXWXB1hHKhzEGNuzueM+TCEph+iFxXP4g4AwztSMGicB42+7MVhAl/IZ/U2soWL2y
	llxbe1MItXHv4qJUWfmQDwCHlzF3KGA/PQN8OXMVMd/VrToXft4WAHkQRnZ5AXG2KnHh53dAJpS1U
	AFTgBTEeRRcHr95rmxSH1IcuJjvelfF2xsCKWVuc5QrjyWFlzGNS/wov9KJTEXR4rf+4TMzNzx5jw
	nJAKee/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCbk-0000000Ehch-3f5v;
	Fri, 11 Jul 2025 12:12:04 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCVP-0000000EgvP-12Rm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 12:05:32 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-555024588a8so1795355e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 05:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752235528; x=1752840328; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AEASaq5CDzhb6ktnTbfQ22tIfOZRPSGaJHgFyQUuec=;
        b=EyRuwHwc3a1LFS35jEBvZnlr0mZameXX7DOMIExeFpkp0HN4Qz8DUFH1EpQZyk4Pl2
         qi3VLADYB6ADLjWVhChn7B3HCsPo+NgEQkLkDqe+uBaPsHVyP2KGNoHJSQxWGDjqB0SE
         DHFQ4MdjhVVK2wYrKVQ/6Yv7kN/XiH3zeR7qTd8i0FeW8YD83/l3geFAIk20gW2qc4dg
         3BvWh3A2/AjJg8jOJsH7CchFrrR/fAgfWIyCyAisTDRYnvvgEWZGX+8F0NiysnOLuz/g
         eocuCINUq2reZOQxJ1IMkaeMJbEAqjegiv+fopK8WSJ8vnrry7PAHlHATv8QnXwavouh
         re0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752235528; x=1752840328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AEASaq5CDzhb6ktnTbfQ22tIfOZRPSGaJHgFyQUuec=;
        b=WuWfd7j23e3TlnJqncx9oeWlNwmuYvyKbxN87IOCbvSY2fHb2q1JyBDHey9XYNBbmh
         BMUqv/B7SPjJpvFeHFmXx/WN13s+qpgrL/aphV0vqki7InXVhOSxgyjITiGECggVRVh9
         hu3N4wZTcW16g2YbSSJoNlH2Sb2vRgcb/ZoPaGfYGtjiUaPDZizC24+AI1vjMynh3+MD
         PWtBCtADtB0VpLastWDLO+9CDbN++HRy/XszgxZ8VVMa3nmMjuN9K9C/Oid06aHYehzz
         Gp0xwRd7CSkJLpc2YWj108II9CnbP537DMTg4Aw0JXNuVk5+Baea+d1TfeP8vWiskfVb
         ag7g==
X-Forwarded-Encrypted: i=1; AJvYcCVnZPJ8OVua/fV5Tc0nE5sLtQ3f1DmG2mvCVJxQp5hsv72C98b+dxqgxswoj0VLNViBnzXDY4yGQTgop3cZBel1@lists.infradead.org
X-Gm-Message-State: AOJu0YwC7C/9eqdz23hjEbnWIn/iP0S9ncpVfXhKQTzzGeXlHx2q31KX
	JSqGUFsnB/fgTlelBkZtj2SKAJ1FDpIREV5r+AhZZigPOBzSQhW6G6CW7GFvEEdpt+o5YqagC/f
	U2GNP+huJTfSUKZOZEGnfN8BVGhsxZbk=
X-Gm-Gg: ASbGncteTQcGMYVmbaRrCoq6S1LyhI4w0pnvbSYlj1IGdfmavWiiwS07+9sRBm3Zruk
	AJCwTUYfvTQi+zJPmGPKLdTUV6Xk3wuApPOb+QZ3rGOwQqlbBMUjl3agGgLHVSFzLczpktEL0g4
	6W9YqhpK/hYuguPHs1aEHDNr1LiwVdCmksp+zpUKktH30Pt4/la8h0FV5gQfMm1sbP5boxrInVu
	0gFy7sjC2U1WFvt5Pf8LaQOUxKwwsJ5kXSyagg=
X-Google-Smtp-Source: AGHT+IFl+IoLWuIaEOcASJ3YDYcH5iOQ7KM94YNp90zKqQwivksqlWt3cmzdDFclUAJWq5ZCcUCbfLJPflKvNsW1j6Q=
X-Received: by 2002:a05:6512:234f:b0:553:2645:4e90 with SMTP id
 2adb3069b0e04-55a046448c7mr1047920e87.52.1752235527861; Fri, 11 Jul 2025
 05:05:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250711120110.12885-1-ceggers@arri.de> <20250711120110.12885-3-ceggers@arri.de>
In-Reply-To: <20250711120110.12885-3-ceggers@arri.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 11 Jul 2025 09:05:16 -0300
X-Gm-Features: Ac12FXxXhUl0pWyBQ1-EtucR0saC40xWMP_mrTY-Vw0EB65wy0G0ZSkmB17HgQ4
Message-ID: <CAOMZO5BNgGao-+B_K8+7juBXTHVKr72NCRRk5NMpr2ew=t0+aQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] nvmem: imx: Swap only the first 6 bytes of the MAC address
To: Christian Eggers <ceggers@arri.de>, =?UTF-8?Q?Steffen_B=C3=A4tz?= <steffen@innosonix.de>
Cc: Srinivas Kandagatla <srini@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Dmitry Baryshkov <lumag@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sasha Levin <sashal@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_050531_287031_DE560BAE 
X-CRM114-Status: GOOD (  13.23  )
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

Hi Christian,

On Fri, Jul 11, 2025 at 9:01=E2=80=AFAM Christian Eggers <ceggers@arri.de> =
wrote:
>
> Since commit 55d4980ce55b ("nvmem: core: support specifying both: cell
> raw data & post read lengths"), the aligned length (e.g. '8' instead of
> '6') is passed to the read_post_process callback. This causes that the 2
> bytes following the MAC address in the ocotp are swapped to the
> beginning of the address. As a result, an invalid MAC address is
> returned and to make it even worse, this address can be equal on boards
> with the same OUI vendor prefix.
>
> Fixes: 55d4980ce55b ("nvmem: core: support specifying both: cell raw data=
 & post read lengths")
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> Cc: stable@vger.kernel.org
> ---
> Tested on i.MX6ULL, but I assume that this is also required for.
> imx-ocotp-ele.c (i.MX93).

Steffen has recently sent a similar fix:

https://lore.kernel.org/linux-arm-kernel/20250708101206.70793-1-steffen@inn=
osonix.de/

Does this work for you?

