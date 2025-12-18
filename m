Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BC2D6ACEE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 12:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pyjz2GF0gIC4uQXtGEL07yHCNXCChhlOIDqBuuupYc=; b=LWKXZYa2244dt+nT9JtG5EMkae
	7AvhJnn5y3a5qBfGEmFrzBnLzTiUZ8zM6w1NBfxOHplbSjZjwbvARmkMSLH8kxjjAFobROx7SHice
	1FUjujZKnt8G3zvsMWD6ntd16mbsCr/zmPuaJQzws3KPla3dk5OGNL465RhJxnM4QSjrzPgdUoaJV
	v5nsIt6SGNlYXPO6vvxg9VWt8CXZiof+WpjfLlFntEzM6wC+E518e7shXDmOlEj+E96Q7rrsbd6DO
	GF/+il0IOLzLOGlFFif4hway9K/vgWHEnoRqO33u1Yj9jWBmGTmunQsf6PfZrLpLKsOsX10otxbbN
	coP4fsWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCg4-00000008ODn-1vlQ;
	Thu, 18 Dec 2025 12:00:16 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCg2-00000008OD3-27sm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 12:00:15 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a12ebe4b74so8035945ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 04:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766059213; x=1766664013; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pyjz2GF0gIC4uQXtGEL07yHCNXCChhlOIDqBuuupYc=;
        b=hvSREGH1HuMHAVeEEu3fF2PofUwm4f+wV6QCz6AAQexX3+GKIxq8gGSA7MQmv2dhAb
         s9Vuv1w+AyNpJFfDRTzvlIunJ31+6Nns7umEQozCBWeTesesWaIl9sw4lQQdYzfMgKgO
         bVd4KgJSt3oxj4XBv9HrW8n9tFK9RBsfaWWZRmYXAPl+5hP1gfhVbfDEi2OcA6pchwLf
         Omfr1J6AnCGl3PLdXnOmzGfTJWpEmFz4H/K7MkbgBUjD8AVuVijTus3re3c97n3VJRjY
         tFPeg0Pn9h4uVMGPwow0rAa0FjgQiUIcn7a8exH8In871HTIo64du+IxaYk6QjRdAnVn
         UaSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766059213; x=1766664013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+pyjz2GF0gIC4uQXtGEL07yHCNXCChhlOIDqBuuupYc=;
        b=LM3bdy2PvP6ATdBfkc3Wg/mqKSetQFPPWe37zOXkce980uFUrXTdyS5Hs8cgIDX96h
         EHfEuNh9i/TsIzDGy9VMJtPwKNSmA5y+NpwrEgXPGuNfgKUaeEtJeWsbpDwIONoWUZzA
         bIjRVNjsSSh+karOUE62dRkh+zrhPjsS4UEUOMhlcCAvAmYb61WM0sK3f+nJJ5agJMf6
         jG2N8pnRm81JWCojcuuUxXx/30vdRAZPOp4FwWJhH1qh0dqUd/6ZxmilkmX3V4f7I70j
         5bg++IJAaRSP8iFs+barw1DU72l3kI0DoGjt2vYrAWgELYsPlaezsy6qR1ywxUOVY8yF
         MrcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtrNRlVySnc76DBnab4GoC2AF9BshrObjT1LG/mI4kdCssFE8lS62e/jD8gDgIRmrv8fw81yVDuqicqvzGSud3@lists.infradead.org
X-Gm-Message-State: AOJu0YyTJtU8tIwWHhMfdLQST20IJq2IUbGPBaCgc+FjYDvJMDwsppAJ
	Iglq0A9RpM3CPEoCNykYluCPju9YQCEr3DLXL9MozxNRPKRPGUb0UNaeRzExaQCpf2KTv3qvLB1
	ANfl/Li+ts+T+/4IF2yi9DTVO+df7KnE=
X-Gm-Gg: AY/fxX5ImENSJANwO+VZZ9mWWBQYSyiv37XWA+IvW3/eoOQQhr8OTI7BUQPR51a3wAF
	4OrJQtnlyEHAhW3W5eZ3wF+OvJN/ilG4r+/wqQqquet+aFZ2q6Y7hO0bQnSGJq6WeTn/ZGUiku4
	yzbGBvxfSf+DYRCpiuNYcWQQch6dlmMivFQsYJ9gBvXyt5HcWbhuoXrxYqXksWQKmRtnLSImVmK
	xN9Mo9EEnpBBXsyGcbK/B5uKBYIoLusTIpvReSSl0a0+CaXlVm8fvyMwRjiXS0PUcW5LSY/os3d
	1BHIM1veLM3Vx88ZMYLZt/2wKnMh0wuyVk9Hzp7txzzSf26HTvgKx6qWigBXhOcdKV0X2k3DlZW
	ps4QdwdTFew==
X-Google-Smtp-Source: AGHT+IEqWe0Zix6Wkx51aIrnFSEkKHboocpxYspchquQYx//DGOWwsW+frZeJB4zp9WuH8FDmKf/6mzb08jXJSiJAa8=
X-Received: by 2002:a05:7022:f503:b0:119:e56b:c75b with SMTP id
 a92af1059eb24-11f34c2625amr13522584c88.32.1766059213253; Thu, 18 Dec 2025
 04:00:13 -0800 (PST)
MIME-Version: 1.0
References: <20251217-127-v2-0-67cb12e56242@nxp.com> <20251217-127-v2-1-67cb12e56242@nxp.com>
In-Reply-To: <20251217-127-v2-1-67cb12e56242@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 18 Dec 2025 14:02:47 +0200
X-Gm-Features: AQt7F2rewN69JeRyCZdhBrwoHoID47vaOG2C7EKvdgft_btnuRWlqaA7S7bTuoA
Message-ID: <CAEnQRZCNm+8qRNCxW5v2FcEgKPRUvOa6UcQPrZWgC-ijN5+34Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: fsl: Add compatible for i.MX95
 15x15 FRDM board
To: Lei Xu <lei.xu@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, justin.jiang@nxp.com, 
	qijian.guo@nxp.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_040014_547395_B48A397A 
X-CRM114-Status: UNSURE (   7.36  )
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

On Thu, Dec 18, 2025 at 7:57=E2=80=AFAM Lei Xu <lei.xu@nxp.com> wrote:
>
> Introduce a new DT compatible string for the NXP i.MX95 15x15 FRDM
> development board, a compact and cost-effective platform based on
> the i.MX95 applications processor.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Lei Xu <lei.xu@nxp.com>


Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

