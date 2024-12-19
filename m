Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5ACCE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 12:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GOYHpcU/Q+P+r0X77Zz0YHEEb0zxo8YrY+jPBXg1f8w=; b=BCmJw5lOzFY/at5wOHskxT65R9
	uXsUJ6DT9V+81dpfb3FyOqMj+UmrUP2jwyzN9FDIgTQOVMEm29PZGbUTbXkyClmP8yGGX3f9BCleI
	8JUv/co12eKhPVGcZdOML/tu2kVUN1HRlXkc/4cRdS/RX7CvZrhHbodoE23zdkavi1UlHb3MAfeLe
	Pv5hJi9F6HeV/zRAvZFZN83HMsvcCONbsGmjnDJa1ScHrw+SHUH8BYXtdfbvHJFMUK3SKjBfFmbXw
	gDhBkCUvMZplVuRxQTA+1y7+kYQiHW30U7p/kaqbyfRdwfPvWt7QDsmlrMhTrI8TJ6PGmWm9OLEzB
	TDTV2oIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFmk-00000001pMj-4C63;
	Thu, 19 Dec 2024 12:37:47 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFhZ-00000001o4W-3W6o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 12:32:26 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-8019338c2b2so381303a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 04:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734611545; x=1735216345; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOYHpcU/Q+P+r0X77Zz0YHEEb0zxo8YrY+jPBXg1f8w=;
        b=iQ/itCy6xtyxEMQ+L6hQFc1oL2buRsFtSoSZqfPawqbPq5Po60isK20dJW/K0n+VSK
         kYe3jxW55fDCgn24t+Ki/oc4t3Dva/hbXztXiL+bwX8asEMykd1GiMYXONaaMbDRpowC
         pg/vXSqIlAx+oVHmlg0jLGraoAFmmRRLXeYTowHUdDqWkIy8TiXD/i3XSqATRxaQN4lT
         ugubhqJcDTVjFbL/ZUpBzeq5sIVr3aLetuh9pXA6fA3rNneOPPc6TP8X51XKmcSlPO/L
         Od3fOG5AqOau03M3rx+AK/g2hCt2p+7GeXv7ENQpGjImitU5bLzFGEhmcgydP3NaHrSx
         hMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734611545; x=1735216345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GOYHpcU/Q+P+r0X77Zz0YHEEb0zxo8YrY+jPBXg1f8w=;
        b=l+mQLkVyTi9dSZyqVPwkRzm4gS6k9XQmLMDEuDmJEwZDrHwlAYXeHhlDYL1EVakyfD
         i/k5vJ4TAYXzmsAAQ99qaGZVrFIUXuYCtyDmvDYvm+oc3XGNuXSCpRgKDSWz4R4ugdng
         mm1qAg/V+YA4CJbSZIWR4vMqphKUR5DzjRaYSDAmynFbI2OQZ+N3u+7lDpZwrzvnbkup
         oLB64ivmkf5DUZ7WA1dFYY5psonCdwa0ieJirnCasfkiXtb9xbu8UnFBfMNbj1svyxg4
         CDLD7JVlGmn+n+zf/Ll+zpoJoZkpPGffejtrqIVSRdvjskOAHLqMDGvscMc6zC5eZUNN
         gKFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5E6NH5B485WrcW4JbYhgbvHymCSpubiwt973Ck1YYZJyCcvXVf62piueD5bQaCFsKX+jUvc981rkkyUT35c2K@lists.infradead.org
X-Gm-Message-State: AOJu0YzKk4K4H2kfoi4uTMxMHQAI7RrNjVKjia5YLN4ir3kJxXtlUB+F
	sIAlh4vI5TqEagHvp/SQRVtM4XiNuI9+hBT+U4DqYfzDY+i6Nx43AgcRvQaIxzExbhpk5Pq8zaN
	//eeKDKssSmqiMGY10BhrIpEnQ7g=
X-Gm-Gg: ASbGnctLlT3kEYuIYUOhUY2HoS7h/YLaPl60xVD5d59ke4frXy6n9DGQnBMR2ljojjZ
	FOasr+kUAlzLsoSFRfupu4qnvPCp0kelghg==
X-Google-Smtp-Source: AGHT+IHcg5vqSpXfUTUZweqIHL07aifAd1gPNzxvvUmfB8dTWfic5k5beaD1PDMZ/x6BjXB0Dny895x/DQZ0sNv5fOg=
X-Received: by 2002:a17:90b:5148:b0:2ea:3f34:f194 with SMTP id
 98e67ed59e1d1-2f443ce59edmr4668352a91.10.1734611543931; Thu, 19 Dec 2024
 04:32:23 -0800 (PST)
MIME-Version: 1.0
References: <20241219105447.889CB11FE@mail.steuer-voss.de>
In-Reply-To: <20241219105447.889CB11FE@mail.steuer-voss.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 19 Dec 2024 14:33:40 +0200
Message-ID: <CAEnQRZBpWQ936-yhV2WcxzvTP3m3CNXmopt6YcawzzdZjxh2zw@mail.gmail.com>
Subject: Re: [PATCH] clk: clk-imx8mp-audiomix: fix function signature
To: Nikolaus Voss <nv@vosn.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_043225_872136_72E1A648 
X-CRM114-Status: UNSURE (   9.41  )
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

On Thu, Dec 19, 2024 at 12:55=E2=80=AFPM Nikolaus Voss <nv@vosn.de> wrote:
>
> clk_imx8mp_audiomix_reset_controller_register() in the
> "if !CONFIG_RESET_CONTROLLER" branch had the first
> argument missing. It is an empty function for this branch
> so it wasn't immediately apparent.
>
> Fixes: 6f0e817175c5 ("clk: imx: clk-audiomix: Add reset controller")
> Cc: <stable@vger.kernel.org> # 6.12.x
> Signed-off-by: Nikolaus Voss <nv@vosn.de>

Good catch.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

