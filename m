Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2239ACCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIlMXVZM7u5N4GC7/QPTBmuvnR/eWVEU2XMt5zd3xvk=; b=hputKEuf0ngk3NJ+avMflGfr6n
	O5l1wy1Q3PBLCgNblsYAvRYXK+yznGofjaTUG0PNftPu7M8uBaBqj/aPXwbWCp/RUcRLBVHu7Do91
	dYHR4tAzm8GGWD7U0fGT+kejJZXD0lCTkZRBK23JqW/zfWgTJCeJ+Jns1S25lfD3xss8ZQ+rt+NFm
	WZZLMJZK15ysdD5+mqERb/c2E661qbhXD6RpbLc0JoCZROc0FETfCrwvu0Mj8g5Bma+5fCyKNjKZw
	tYrJTaBvkNigr4akfW02FQYXN7mlXb3DPPaqy6Axjd9VfsF5irpYmDPo/O5/rAnLMM+rh5plkz07Q
	Uegsy/nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJtJ-0000000DaCx-04VU;
	Mon, 27 Oct 2025 09:51:53 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJtG-0000000DaC3-07Kb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 09:51:51 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-27c369f8986so39780015ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 02:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761558709; x=1762163509; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIlMXVZM7u5N4GC7/QPTBmuvnR/eWVEU2XMt5zd3xvk=;
        b=QGvbMjmkkduvGTLMyi5SFk5jV9J3BTHQupsKAReKKDuH36Z540NDJjSCf2iJvmq9eV
         1GX3Y9OpKmDGzaLmYksWi0risOuEvKz7CMXPhhKCYXs4uvBVkcJmgmtkKeuyPz8ypDWq
         o03QCcJMuYoPOW9ehK30fqibGr6HOFjBXBw8KHH4ZMpZ6/lUFGKBy1gJnQtqXXm4byFb
         5UrJsEKuLBJusbmCPFnJFtj7faB+0WU/zRhAtO0KOF/5bh1uw8WdPJn/NeykNPGzbZUm
         U26DLWdfehIcs2F2mLUb7LttPagrF++m/gNBwNbn9vM6Ot7ghl+DwZv9gRBpFT5kBoF+
         ieZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761558709; x=1762163509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xIlMXVZM7u5N4GC7/QPTBmuvnR/eWVEU2XMt5zd3xvk=;
        b=L/kKnmgqXCZPkWFUHp/dH/O+UG728TUDcxZlHo4moLzppLGjCEKFvVL0uX+yV7qERR
         3viGoOJ/05lQOp68mKaWGPzMvcn14a+Njed1URQ4HApOuM9+Z86Ac5jS/KyzTIbC/Pia
         gqY2dmjE8xjFJC05bm+pyrygvUejp1JQwXJKsG62CtTYSYxsu9a4DKBRHO0yoTgLaZ5J
         N37YtqFtTy5So81o1AOd/afrBvrDCoWmmiM1FH26qk7jpsSrxLW4D3lUkBFvfM1SDIns
         SrnYFYQROYloQhc6AQ65ie8iHacGOSDAyBXeTOOUtqYvolu4uapSJtLToGTnEkbhcGcb
         GrXA==
X-Forwarded-Encrypted: i=1; AJvYcCVG1cbwRk4bhy3e0s5rWOJ+FyE1hlnAN27w4qkSISNjcuKoIHnQdf7k2qQZKLKbqHskFm2ynrIkgrPVP6aQ7BA4@lists.infradead.org
X-Gm-Message-State: AOJu0YzVOTYkLcz2ZbW5x+4cXyaoE9egkQ6kH238gaoDt6qZe1cgQ5GG
	S8mipgJ+akMIn+oOsRbeHbTrFICnRqt8LzuFOWVLXrHzlfFiMdIk6O6C3jxZQzpVKEoM/tib7ph
	bR1QaLojgzV7/DVDo8BMZ4fhwwDXjYzc=
X-Gm-Gg: ASbGncvVVNLcbBd6/LHSVIGeJHHY7JSs0bEPcCKt5puGT5fVAvFGiz4sGQP95wBn/Nv
	3HevyXgE1kfgvTYa1RoEpKbEQyEEEbocjPnQh+vuUuoqwFaox3SHjoi80wcJsq6yQag8SB26pSI
	Up8j4kqezJpExwKsS2UaQi2ajr0iJgQb2ax0oKnDIIzMehlA0kNbSGp1/219v1FXs2IecijRkN2
	Mb6ciFGIil8oDVOnMtSzmv7sAA43RGJR1Jz7wvYiFf0BHT/Ui9WIYHUwUvb/DP9ZyGV2Zh1B97c
	JPyNGn7lKHtwmId3lV3BK1hq
X-Google-Smtp-Source: AGHT+IFRzbIzqFV7pKBghEkL/y5mdil9BPJteZ22VTJLWtgkr233BhWTD9Jj/7BDpxsKVDDIAx7A2JjJcaX7rlq1vtg=
X-Received: by 2002:a17:903:2f82:b0:290:26fb:2b91 with SMTP id
 d9443c01a7336-2948b8366cbmr145344475ad.0.1761558708890; Mon, 27 Oct 2025
 02:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com> <20251017112025.11997-2-laurentiumihalcea111@gmail.com>
In-Reply-To: <20251017112025.11997-2-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 27 Oct 2025 11:54:15 +0200
X-Gm-Features: AWmQ_blOtiRFVXUmTtN1O1lNjloemNSQ0tmWC3j2G4npOc3ifmBMtfeWO07HwwM
Message-ID: <CAEnQRZDFkQ80TGvpCDRZgVtKF9oUVoKQsaAtyhYHWHAZsg0fHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] reset: imx8mp-audiomix: Fix bad mask values
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_025150_064473_79A5579D 
X-CRM114-Status: GOOD (  11.42  )
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

On Fri, Oct 17, 2025 at 2:22=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> As per the i.MX8MP TRM, section 14.2 "AUDIO_BLK_CTRL", table 14.2.3.1.1
> "memory map", the definition of the EARC control register shows that the
> EARC controller software reset is controlled via bit 0, while the EARC PH=
Y
> software reset is controlled via bit 1.
>
> This means that the current definitions of IMX8MP_AUDIOMIX_EARC_RESET_MAS=
K
> and IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK are wrong since their values woul=
d
> imply that the EARC controller software reset is controlled via bit 1 and
> the EARC PHY software reset is controlled via bit 2. Fix them.
>
> Fixes: a83bc87cd30a ("reset: imx8mp-audiomix: Prepare the code for more r=
eset bits")
> Cc: stable@vger.kernel.org
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

