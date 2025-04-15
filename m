Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E36C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 08:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=STeju+4F1b95dfzySAiJo7cZAG36EwjiVO/ehg7xZ2s=; b=CMlGyXupoky8nBrkIOyA195N9K
	kgwONnsF7YdfzzY6coFg5GOwg3bcUQgXBRFYQJTlWs9ILtckMyUfHmWa+2p3jEwN5LCfLi67Spr0S
	X0qDCM1T8ew/clN9gAqBLvar7aslz9JsTwwY64DinVw5iLy2okTK9qhJ9uCvTIEgKbW49zB0TdEBM
	P5QwOIG2lRPm6f8qoINMiOg6oZ4DzK8QUbjZUHGBwjJR+k/XmXR9aXXp667rOyULP8JQSYhVekaqC
	3VqU78Az2ctUrM3zftX5fE9uasKe9/Up2AUn+hnGIX579n5dQ9iBqHbZcEzC6dmrHausQK/MA4jfg
	f1m6Y6Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bLW-00000004w03-3PCW;
	Tue, 15 Apr 2025 08:08:42 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4b73-00000004tA3-0d2D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 07:53:46 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso49832471fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 00:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744703623; x=1745308423; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STeju+4F1b95dfzySAiJo7cZAG36EwjiVO/ehg7xZ2s=;
        b=T4f1rtcUXFN/RmztWVOPYmQfU5eiq8ojDxOFWOjZafpbMrvNU0qS1G+4skeh8BFMh2
         ydIgiE4pAqOL3fnr08OnJDqXPKzNm3eIgELv6ahVJ+9oW4/9VFOTyDrv0WhZdMIU6+N0
         Gkv/7fIgkiZxHdmv98g3mgITcd4aY9mumWgCK59uMWtDTCbdmFVs2GN26Sbo3hb4Urt2
         lP6Q+uiYLwusTx6rVvUQ2X5GZI318iOO05ce11IsUCpxHZyzxkKdhI0pzktW0T/gNG41
         F4q/GvfJs4sBTW8k/9SeGfBnLXBjt0aVFLIL7W5e+BOb7F2R0kEm3x3uDvEevNQlABfC
         MpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744703623; x=1745308423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STeju+4F1b95dfzySAiJo7cZAG36EwjiVO/ehg7xZ2s=;
        b=C2Yjda2dru/nxOjZrDMSslbGvbnuDlVMvncXTcnvXXMex0sye1vJ6OFwPXsvKx9ZhB
         wYONVDgS3/fDQH+kknrmbhtSr2UnYkMJG37kdST5IDKcaHjZ33q8TyC+G2EVc4uaxPl0
         V6CnwvU7uGQfZJ7dWPt+FwEpn5chOUjQzSlUvJz4hoTAKilkS0xnzEpjc7T7ZqPAroGr
         pzKb3CHSY5GmPj8yVE7q8tN3lrP7yX3XQdRjZnEcl5ixrzq1ZygIiE8xGnBLuG9jZJY2
         m8KbjYLIq1BvjHcjbHWa1fY/Oa0tcOQqKZQdKWTyCPNoJisk3OIAkXe1MYokIraT72So
         e6sg==
X-Forwarded-Encrypted: i=1; AJvYcCVQqC1iO2L0R6NY4GmXrtg/NiDDfF7XqBHkMSbU8WuWNYDrY24nel1aw+UR7ScJQdGNOOQeM9Wb+93aWlP6xWKn@lists.infradead.org
X-Gm-Message-State: AOJu0YxLFTV0pycnmYii4GMf5TiFWEU4IP+DqiYYk8z2nw0x2J3F35B3
	USMSPMqAEphEcKNyqhB4Xvd+Pwe02/t95BOVD87VLI29WkXKth4QXdMQmeq6TPpmJBQs7lB1aTq
	4t9LvjwmJzbJX4qqdnC4NP6TKBylxfI4dh5cpAQ==
X-Gm-Gg: ASbGncv9fHTiY8xoTUclUwZVYG4jX0YOuUUaz3Ygu8Au3Pdj1owWP674SwpP2rD8khv
	FgD/yvY+syubD6sE0HiT38z+SSPT3aTcdOvVXMloRZeP2TBtTsOuawsCXfvGBHDSZjTtuCKWGGU
	zbYQjsmO3FHRtXJ92Nz3kMhQ==
X-Google-Smtp-Source: AGHT+IFJ5QnEuy843kC3TQMpuk9QiZ+X6rbvXcL4GPOFqhedgkU8pg1nIDK1g44GiFTp9uNBiCz3X/eFYBa7DllDIzw=
X-Received: by 2002:a2e:bccc:0:b0:308:e54d:61b1 with SMTP id
 38308e7fff4ca-31049aadff2mr53751861fa.34.1744703623274; Tue, 15 Apr 2025
 00:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250401072725.1141083-1-ping.bai@nxp.com>
In-Reply-To: <20250401072725.1141083-1-ping.bai@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:53:31 +0200
X-Gm-Features: ATxdqUF6WJDaLjHdYSkCvv_YDIUzSOmPWDnDqBmf7i0pLM0MKIXzIz4bzkS8nS4
Message-ID: <CACRpkdY5XdzVxbNhw-nv5EL00NNqrJLiwc0B4O6somUo1gjNxA@mail.gmail.com>
Subject: Re: [PATCH RFC] pinctrl: freescale: Add support for imx943 pinctrl
To: Jacky Bai <ping.bai@nxp.com>
Cc: sudeep.holla@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	cristian.marussi@arm.com, aisheng.dong@nxp.com, festevam@gmail.com, 
	kernel@pengutronix.de, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_005345_215840_3B4A5A3A 
X-CRM114-Status: GOOD (  10.37  )
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

Hi Jacky,

On Tue, Apr 1, 2025 at 9:25=E2=80=AFAM Jacky Bai <ping.bai@nxp.com> wrote:

> Add support for i.MX943 pinctrl.
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
(...)
>  static const char * const scmi_pinctrl_imx_allowlist[] =3D {
>         "fsl,imx95",
> +       "fsl,imx94",

This binding is missing upstream, can you send a patch to
add this compatible to the right yaml file as well?

Yours,
Linus Walleij

