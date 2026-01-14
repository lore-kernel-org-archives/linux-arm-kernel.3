Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30CCD31A24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYPkzS8uwgSyR2vpbKtgewGdh4NqLZqcruiqtTuKQyY=; b=GKJnwPI2hWmvRND1jmiNNdz7g7
	X+KbZpe2tTEzrzIM63yv28QymcGSiJF7YjpLLRScTrlgBV3R5MW40zMTeU4aVMIPQ0XhTrBRPhjy4
	UH3wuaweEPrYss/nbtAnV8IS+ZiG1x8s6W0uBL0OWWUKYs2gvXoj7+DS0TvvwcKIVC8nX+eiEDXlt
	v/eyfWts4o3/SmcKlEwOt/8Ryzfn9RfaQLp0wS6lPSTKd0XDj5ox9tBhC7Hlfk14JYHF1LBbyhnWI
	BR4Mpf2fqooAzAbXbfb3jIlVrtST1U6qQxGrfLfZmbPOHLHtFzSTJrQvxq11DOUWkfuiWEo7KY6iq
	JZ89Smkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvsF-00000008Gou-1kWg;
	Wed, 14 Jan 2026 08:05:03 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvsC-00000008GoJ-0mjL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 08:05:01 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-12332910300so2842687c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 00:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768377899; x=1768982699; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYPkzS8uwgSyR2vpbKtgewGdh4NqLZqcruiqtTuKQyY=;
        b=MonzUBAY/Boy4cMZRNuEQh8OIvb9Lk2U2rBgZRyMcHei5HslCeib1aqN7dAhnckogX
         38VbPRrAYOdLEE8EsmylCsN612AbiEA9wZtm1Q1J4qMw9vIJ1qu75/114Jl3tMa+w+5j
         JBymkOQ6rGxCEKZUPjB/zkkK0mMYVv3C9brF6DUucD0w7c/51bOmq8EAqeBXagOHAzTv
         062zARd106XK02UL80LXLmWxrL/ZoOh4cOLfosFSaIveC6+R1V9bSHinOKf48C0quSL1
         tJjcRP6PPvFxro29oaEV918IoQuFK0jxfM+zeYVFGEoDKek4mnfK8uZNx9Uh1uChUI7N
         E2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768377899; x=1768982699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jYPkzS8uwgSyR2vpbKtgewGdh4NqLZqcruiqtTuKQyY=;
        b=QZnlLv9b5LC+Y6UURI7sPMqHe4FH6J6yP51oMMNNIxnUipNTJyvTV9pMqSmT5xovK/
         rABxQ42RTxi8vEQt9aGJQYxo0vVXV+7lkOtX/ZC18inKiA2mJzjXdU6oumUQX7FX0zJw
         Qc7C2+/fyxtJZcF/xAkMNVMtmc9YcbgSpPrW/UK1f+UhiKqI4kD8cZ+RKbeI8gKcKCJ5
         bqCGVAxiI9TRa2K962ddEFBEHBOw1RB4biQAGXFau5eD471hYwwtrzR8PxnXsFcyXmM+
         Z3MHYCDPkVzM+JXFXsNTmywMjsDZ8Z3zOWuoFl3zlcg7nADrWAyo23nfrIorXEEQIG30
         /0JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHaEZg0w7CsTFfqcJ898pJBJ5HlJ41apHq7jgz7Veehf+zPpZ6rttevKo+O50zKalGuA/dzbPUahEurT0pbD5r@lists.infradead.org
X-Gm-Message-State: AOJu0YwF8abaoe2BnComXKzwZdqcOH5+0ZVoVG9nWTkX3iDjq3QUjd5c
	U/Y+uHnZgd3QExnytWSsBgSDaGnmg/lxU0jNGGfAnxHahMdzwfHCCzdK3FRxnk1xGEn0Onu1Svk
	s4QoiTDHU4SyFp0oFlpx6rc53yEZTEsQ=
X-Gm-Gg: AY/fxX7NOwyPF66hRXg2YCKaXDCLMfN6fZQfwApaEopuBlqel1cEsT4mCMgCGz8RY7z
	er8g1pW3rFvUdgliQtIa3FeZ0ds0TD2bl7sbuz54qPiN3Yo4M2uFEaFcZBsas+8/37LNL4yWm+U
	RNOMCKEG+XOlO9M4/Do7XiTSzOMoK8Qa/I4bTEMrv5k53NC7m/XyVJnfRnZpSqSdoX+KbtfqmAd
	EpYRjqH1mJqvq5667HGQ74hCmLCjueDQKp7eSA+LbDmsJ76cTkJuxmggLNXafFO8ULxfUvEaAgZ
	9l2aHosTTL1ACda9oNoqEW8EvkAlC/ajP8DGgRCu8jqmxP6E+/TaDZuN2vLF1UhHVE1mbn8lBkg
	GV2SKkznrIg==
X-Received: by 2002:a05:701b:2211:b0:123:2d38:929a with SMTP id
 a92af1059eb24-12336ab506emr1783847c88.38.1768377899101; Wed, 14 Jan 2026
 00:04:59 -0800 (PST)
MIME-Version: 1.0
References: <20260114-fix-soc-imx8m-v1-1-143de91ef077@nxp.com>
In-Reply-To: <20260114-fix-soc-imx8m-v1-1-143de91ef077@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 14 Jan 2026 10:07:40 +0200
X-Gm-Features: AZwV_QiQ2GxOfUl7_qoYYXBsoM4-1o56L0DpD7bTOn0TWKITOwqTzpk0MfT3zD4
Message-ID: <CAEnQRZAX4HVjaaPbdUBp6aOreba8BNfkDXeyt4_OH9WVajcCTQ@mail.gmail.com>
Subject: Re: [PATCH] soc: imx8m: Fix error handling for clk_prepare_enable()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_000500_477304_23FA4CA5 
X-CRM114-Status: UNSURE (   8.53  )
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

On Wed, Jan 14, 2026 at 12:13=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> imx8m_soc_prepare() directly returns the result of clk_prepare_enable(),
> which skips proper cleanup if the clock enable fails. Check the return
> value of clk_prepare_enable() and release resources if failure.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202601111406.ZVV3YaiU-lkp@intel.com/
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

