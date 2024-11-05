Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8593D1267A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 10:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArC80tKtjP3dBGGXx79noUAvUpR4S9jUKLPnbzjNTSY=; b=OcBszHpeVgh9E71zD99n6P7kow
	ZaF8nvCJUoKKB5nEEwu8LWqqIQny5VeuhN5RLgzt1VFnSur/rRpZ9bErrOzFeczh7LJld2AxSwrKB
	uGMWOrhQJtOAxPPgC8k1AC5kSIc2j/ViYb8qzoykOIwGIQl/oMH6ps7rToHWlS7opWEnCqrgEx2MV
	GGarcslesQO5Y9PfQzV+rZRJ/9ivf/qYMGFaypYuyBp+dZl8viXideQO9n2FkL1lkwHpiFb2MGvsS
	pOdMdoL3KA06C70MVIUnYarYHNlMLWL5hmll2UUU0RyST5NxG2fMbrAymOmMrbPp9ZcyYyVyBPnG1
	3W/TqCbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8GjS-0000000GfFl-1qKW;
	Tue, 05 Nov 2024 10:24:18 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8GgW-0000000Gem6-2FzT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 10:21:18 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4315abed18aso44449605e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 02:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730802074; x=1731406874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArC80tKtjP3dBGGXx79noUAvUpR4S9jUKLPnbzjNTSY=;
        b=vNicQzsZM+ZLxETPYD7KgcxXRR/i5fpyJBAkFKa8EtBCnBoq0hKZuG9Sl5xmf9N3YK
         DaGQrwWdtb90hqVslfeJI0T3BPvvOTTQvQ5RB7PR2ECCzewEtbK25zJBVSJE5abZB33O
         mrOqJnghGD3SC5uPjtjguROYwT9PdEFiNMBE5v/QFXLPE+GYI+oAN7/1glSxZGhHhHEs
         uM2Dg+fIdD1uVztJXJzHJE1Yh/IXx3b+nbgQN58R324FtAKBZKdHPu/puCaYNybIZXCw
         V+zv7YLj7b17NlgQx07sbdWBZMwvS8SvwTuHinTeJnbfa9TJUWrNEMx8curGqxBkRv0w
         ZuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730802074; x=1731406874;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ArC80tKtjP3dBGGXx79noUAvUpR4S9jUKLPnbzjNTSY=;
        b=mmEDsuq07pt/EhN+iQwF+AJlQ/AumbBkFopvvQwalh8cnq8D4qBZzTQQYuI9+ikuf9
         ui7BD9cSFFdRDOtOqlTp9n6rlH2GoaI2EEaFL5/M+inUunCZW13cOBTfo4Sj0uI2sYw8
         tbcyg6IYh6bAkPTnzRjOx7LkrmmgAPG+OSXK0gLIgnLbeIYkUt9oHCqDmrHGwbEYzfZ5
         +LLRCfqEi1uX7o9IYgVEVSjAy8poj52VfA8ecgFQJRblfdoh/PlGYlYu1ZZjZyq8GtLP
         eqfz0o92WShR+uEYhm/dHEo4swfMxI6q1tWOreTOJ0xLppXAEXF7IbJuXzHH/XWjQrQ3
         oD4A==
X-Forwarded-Encrypted: i=1; AJvYcCXRqPYXQYrj2xaq5ZQMK+QTMo7pt1vfW9y7XaLytaaLAZKNAz57kJcQwg4fSeDkKvRf9tyE97sCT87rwkgH/GFT@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9CrUkIwJFPDnF46n7GZgzPDlY23KOpleM2+O98wEgF86EjGHo
	usJ9ievrMFr59JVvouKRn4QCyyX2mLkU+Hh7XIsisgqqXWuPHURCurGnQU7Nahw=
X-Google-Smtp-Source: AGHT+IE2n92iA9zFLecVDleLRsQnsU2LzZqCh08NUKJAXXircidE3s23XD0vusQDwPGzqgQof5ziDA==
X-Received: by 2002:a05:600c:4fd3:b0:431:44fe:fd9a with SMTP id 5b1f17b1804b1-4328325118emr131647305e9.19.1730802074391;
        Tue, 05 Nov 2024 02:21:14 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5ab254sm182319745e9.3.2024.11.05.02.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 02:21:13 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Carlos Song <carlos.song@nxp.com>
In-Reply-To: <20241027-imx-clk-v1-v3-0-89152574d1d7@nxp.com>
References: <20241027-imx-clk-v1-v3-0-89152574d1d7@nxp.com>
Subject: Re: [PATCH v3 0/5] clk: imx: scu and fracn pll update
Message-Id: <173080207299.1891569.12565190669016776250.b4-ty@linaro.org>
Date: Tue, 05 Nov 2024 12:21:12 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_022116_617435_6300F19A 
X-CRM114-Status: UNSURE (   7.63  )
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


On Sun, 27 Oct 2024 20:00:06 +0800, Peng Fan (OSS) wrote:
> Patch 1 is to resubmit [1] with comments addressed.
> Patch 2 and Patch 3 are for i.MX93 Fracn PLL fix.
> Patch 4 is for clk scu fix
> Patch 5 is for hdmi. Fix tag not needed.
> 
> Detailed information is in commit log of each patch.
> 
> [...]

Applied, thanks!

[1/5] clk: imx: lpcg-scu: SW workaround for errata (e10858)
      commit: 5ee063fac85656bea9cfe3570af147ba1701ba18
[2/5] clk: imx: fracn-gppll: correct PLL initialization flow
      commit: 557be501c38e1864b948fc6ccdf4b035d610a2ea
[3/5] clk: imx: fracn-gppll: fix pll power up
      commit: ff4279618f0aec350b0fb41b2b35841324fbd96e
[4/5] clk: imx: clk-scu: fix clk enable state save and restore
      commit: e81361f6cf9bf4a1848b0813bc4becb2250870b8
[5/5] clk: imx: lpcg-scu: Skip HDMI LPCG clock save/restore
      commit: 92888f39193419c117e282cce7fd762ba78784a4

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


