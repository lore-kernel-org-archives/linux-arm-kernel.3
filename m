Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0D5C3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 08:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMDm0qfjOuYWTzr0Xo2QLnRNDzdiZPn1MuFHomJVvBY=; b=yPkQNPpibABhjHZInQtRfn/cVB
	YcwWt02MlbkUo4tHSrDuUAAZdLwB10SDhMdYjqqLfMGDNm//DZ2F0KDMVnhv+dUb6f8404VxKScyA
	2uxt2qBiAQ4KYpZm1Dvvm0+CcrDaNkx3cUW6gXSivuET/VYh/iFvZufto3QQXA6ISGIy7I033Alnd
	DlplJP3mk9PzfU/tYA9wmdZao++3uNjrJWprnm7OujKOee7o9J9gijDF5mGFlSLyzwvLjzvTX/Be8
	4n2OEuCWyH1B0Lr9aNhDaMawoMG6uDveZvU21mMilnJRGgpNRSTlYLXwrkzxTgTYpBcaPgwYcNxVM
	DrchO+xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBqjx-00000006iYh-2cSd;
	Mon, 05 May 2025 07:59:53 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBqd5-00000006gyX-3cgQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 07:52:49 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ace98258d4dso569628466b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 00:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746431566; x=1747036366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMDm0qfjOuYWTzr0Xo2QLnRNDzdiZPn1MuFHomJVvBY=;
        b=JA6pqdZ462HTCmZZTsrkk3fV3Mk6Fg9mY8sa7RzR/nURSyZR9x0KU8iQzm4o8Y+tq+
         bUqXQIVGVB+OACX/s2GB6eHCqXUT4arxcmt2+tTSt63B44q2NOIADBTbS1wMxZdQ/MIa
         tshL17o8v4aeBAL+X+EC6Ft4l8MkfucyYO9ciHDWa9FWKM3KHbrywqIKMxJGo87GzSVS
         qfm8D3SOyFgoDcU8aepBfk59BQkvixFbsOKX+rO83+ACW48T7KMdjcM36+ReKrB3mihy
         0jRyXRw5pubJaIjhkUq0KHIjIbCgvfxeDdgtZ2lgJSbWmOZmyjx+mINERhS5AM2lh5et
         7Yhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746431566; x=1747036366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMDm0qfjOuYWTzr0Xo2QLnRNDzdiZPn1MuFHomJVvBY=;
        b=MjvOCLoXysG/e6QauF0llnQIsHlwKVRCtB2IE2XgxW5n6w0kyYMeMS57dAQJ9gHRzK
         ElY56M9QOuwV4Aa2S25BRw15C4hYz78hi4EJzC3cHkfDxP3cdx++HHoKsfux70U5GPD9
         uzXoaXud9hcleNB2ZrnlT7qAtFoKWDIxp9c1qg3tt4SDpyw2S1YqUmshKvZvkLW+VwjO
         k202HGWjJ88tzNK6g4bgPRjxJ7RER+NpftBYl2zXL5MfLCDzdpcF4d6DgtqnLfbVlpzJ
         KiMSz0bAeY/i4AUBh8ikNVkel/KTCT6PyOeY9Hb7G7FFJWjJSJpH13Kckm9k/vo03U2i
         96ag==
X-Forwarded-Encrypted: i=1; AJvYcCXlCmKok4J76RoRAKkqT5tD+oUmeqRgwLnKx+KWdHP+57F/BGDwHcH0UQrBLxrjxUReNrHST1PNUqG7upKpTiRI@lists.infradead.org
X-Gm-Message-State: AOJu0YyYrh3WsJKN4LEVb2lsnrKs+uQjgGp/y7FOmRmCr5u2ZNO73nHn
	JRhLVQa7EmWc1wxWI/Plgu2XFBOoQKN93cjjuebiYONVnIXXGixxoakh5PkG9og=
X-Gm-Gg: ASbGncuHpsuRjJDk9drk7rZScna77PX3wzRteaYDG6fmCr6KItTHR9E/Imem307Qtit
	7O44KCxbWzyc8YtTaOybIfK6ouwgYtbcif6pUeW+XCbJVtoYIYHMZHpRTq8xXnugXvGgvGuvMH8
	Gas2gw2vPEWxJi3kBAjJ4jWU/M2AuSYNRUSbB536omM3Y+tq1JksIXkjuDsi4mVGvoTqU7N7Rmc
	dVOZHLAFEQM5RwvorUhQD0AhJKxml1R5P8v8HCxZ8aWrJE3T7Vo2QGaeAsPj4kR6NYGTsP6sgRt
	qtCsJIz3BCzYw1wqxxXGJWqqV9BUaMeSshZ8WfLaibU2Lrs9dQ==
X-Google-Smtp-Source: AGHT+IFKn1amEuiEsrKWv/SJZ/kZTwDtb/a8ekD/9m9gKUzOyHca4mZtzNEFzhzpC/nVZriKwygVQQ==
X-Received: by 2002:a17:906:c08e:b0:aca:db46:f9a6 with SMTP id a640c23a62f3a-ad190858be1mr564437066b.59.1746431565639;
        Mon, 05 May 2025 00:52:45 -0700 (PDT)
Received: from hackbox.lan ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189540d94sm446544666b.182.2025.05.05.00.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 00:52:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: linux-kernel@vger.kernel.org,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v12 00/19] Support spread spectrum clocking for i.MX8M PLLs
Date: Mon,  5 May 2025 10:52:35 +0300
Message-Id: <174643143452.2950397.16722215892279685541.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_005247_902192_70F30533 
X-CRM114-Status: GOOD (  13.93  )
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


On Thu, 24 Apr 2025 08:21:30 +0200, Dario Binacchi wrote:
> This version keeps the version v9 patches that can be merged and
> removes the patches that will need to be modified in case Peng's
> PR https://github.com/devicetree-org/dt-schema/pull/154 is accepted.
> The idea is to speed up the merging of the patches in the series
> that have already been reviewed and are not dependent on the
> introduction of the assigned-clocks-sscs property, and postpone
> the patches for spread spectrum to a future series once it becomes
> clear what needs to be done.
> 
> [...]

Applied, thanks!

[01/19] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
        commit: 20e5d201b5d8f830e702d7d183f6b1b246b78d8a
[02/19] clk: imx8mm: rename video_pll1 to video_pll
        commit: 26a33196b5b68cf199b6c4283a254aa92d2aaf4b
[03/19] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
        commit: 2d50415e2457c6f6621c2faa3b01b11150fb9c67
[04/19] clk: imx8mp: rename video_pll1 to video_pll
        commit: 21bb969f608cefd8d847cf6eb50a193d9f1fbb87
[05/19] dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
        commit: 2ba124053687c933031a6dc5b2e16ceaca250934
[10/19] clk: imx: add hw API imx_anatop_get_clk_hw
        commit: 17e3c1a272d97e49b4f3fbfe1f1b889e120d2be8
[11/19] clk: imx: add support for i.MX8MM anatop clock driver
        commit: 3cbc38cf42ca42d2dc9a93c949e0381ff919df71
[12/19] clk: imx: add support for i.MX8MN anatop clock driver
        commit: 80badb1d7264e83b512475898e7459f464a009c9
[13/19] clk: imx: add support for i.MX8MP anatop clock driver
        commit: 4c82bbe8b5437c7f16b2891ce33210c0f1410597
[14/19] clk: imx8mp: rename ccm_base to base
        commit: 1a77907dbbecfbe5e6a1aec28afd49a1dc184b7a
[16/19] dt-bindings: clock: imx8m-clock: add PLLs
        commit: 6a55647af3334f1d935ece67de4a838a864b53fc

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

