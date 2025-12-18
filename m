Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADB1D6E2AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 15:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzxNzF7MpItYcU3pEGmTXATHal65pD7N5vjHukp5bDE=; b=tVCXTvFAJfn1ttH/WrVYyf/1mH
	MhMl/BO1OjjdIndiC10TH2+UUd1sZcvAaYwF/VByGhK/Z3lrHNIcEhRNWY8K6uLxiWP+O4rQkIBui
	2VflzyS+n1z8UgZkiyHtAZyLsfMWUHFch/MZvZz7QKevE7OQvZ4jypFrdMYKe7UhjIJRDCMyvUIV7
	sBn9fCHL0ER1KXDEomfqnwF0ZS+CWZeaJBX5d1oIMRfT1EeLY+3byY/ht4I/sbEtjCKQ69a2SHDNa
	w2k/4+tbmdwAYwTSkmz2Tw0Ecs7iFQjRxDsq0JOxmvsjDRhPYXr8UfFsTLsdtc9lb2otz3nAiHiRS
	zyPWdChA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGEK-00000008j8T-2e73;
	Thu, 18 Dec 2025 15:47:52 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGEF-00000008j6d-1GAt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 15:47:48 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-595825c8eb3so872749e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 07:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766072864; x=1766677664; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzxNzF7MpItYcU3pEGmTXATHal65pD7N5vjHukp5bDE=;
        b=R9CtoPKpxP5PfKCFVTZsaV54JHd7VFXZzxK9TXGtqRz7ARjnzForKO5O/fuRLUGRjZ
         wNK4rk2/CSwq8xTJY8jtwCQGaXiwy/qMb7Mux0VrlZgPstlswwm2Dm775G9Xx3os3o68
         vZS4B6wforV75AJX5eLx+QF44bJ6vGmvpO/yjVEuaDYUu3KT63NJXKvttIKeEnB80BvG
         XtrqRNUyko/zVaWFGm1c+lt3wh3fmF/ij0v3PbRwNYKWbktu8M7Mkc05cIPpe9drCqlu
         Nomh/OH74fK+Z7tGJidwHD+Jv0LmA4PRqNRIjtmKR1Tt5gLvJlQNdapapAvb9Bp9335z
         8hwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766072864; x=1766677664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LzxNzF7MpItYcU3pEGmTXATHal65pD7N5vjHukp5bDE=;
        b=eUsStHg6eHejce2C7+iATAhsiL2xR+zMnGIRVd3PYnKlX3wgV2kQCbxU/oaIhm1iXj
         vxZPF1mZiDxmGrkgEwFzLx/DPLF5XCm8Xyzwg8uq9qWTdwYJf8bEN1MKo2L/Bi2OttY/
         cs3Y2RX+cQ8S4vcxwErnkOlk3yl7KdUScgyog8p3tmQDEDBsrbf4Lo/wlgt3bb8mIabZ
         8YyzNKiq6tUO2IAkn3NCmhIB8dsBteJPdiuocmxZDfuoJW1J0oBy12YWxJ0uF9uAfuYw
         uc18Bkr7HrpPFd/oH7m3Zv8cmhLszOoeRTkhZbSmby70gtE31xorBUnC619jZrzh22Sg
         TFVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlyu2PdtUXyGSVvattATTS+9s0gwkZEbIowCgeW63MY0kJWn1PuLKv2qJXYIjL6sSJBftr3l2V+FetFkniyavi@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg11vYDO57j9WdaQWeIisipfZ9oIyJ2pOMO0qnBCbGmq+UM5Hg
	WoPHWsWUtzbrXUxCU+WwbPkd3haDbJBRJnV793irls4/3gU1VwywgIbtoaMxsbULt6P8a2ykRhY
	UyUFq9k4DGtkt2oLRlSUOMUDch++aAPM=
X-Gm-Gg: AY/fxX40axpbP3+4SFC85YSna9mNhXlVKHSUTFtMJSFZrqbbIpqTEnnrCIBmBQgjJtp
	/A+sPG3rSU3u5uaV77fbyrkwBTtKU9iapN/5ONmBO7e1xB4Fn3suVdXoo8rRgSLQv9ZUafGZCBi
	ms2I1GxkiIVqz5JS2jAUA67ggmdE0/vafpi8s/f+xJ/XujfQ/J9du3uK5RhQjsYWl2b3qVfolPj
	VYJUskbKG9vwM5X+k9veeiYdi6XNGDTrcqQG/6t0LZSDpkR3XPF+/vuSrfO4CpZpwOEewzvfDlt
	qfTv8qV9IKnfqPFheAyBrF0OgXQ=
X-Google-Smtp-Source: AGHT+IGrYbGUckFbA0uI/Uak1RoxWaGizxcWDMRvFWxpw/hL/+bdMgS3hQvghW4USBbg4LCsrOKENWVewsmE9VZ7WWY=
X-Received: by 2002:a05:6512:128c:b0:598:eaf8:8f5a with SMTP id
 2adb3069b0e04-59a17d573afmr14623e87.38.1766072864074; Thu, 18 Dec 2025
 07:47:44 -0800 (PST)
MIME-Version: 1.0
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com> <20251218154412.1524249-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20251218154412.1524249-1-alexander.stein@ew.tq-group.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 18 Dec 2025 12:47:33 -0300
X-Gm-Features: AQt7F2qc4TJ7gyArwoED7PIRPB0eAsifB8ZnC9eeMqM3yyZByNJJ_XOF-WESW6g
Message-ID: <CAOMZO5CmP_rdFA=PqGSmKDU+ObzifHFDjwYMD3J67bjs0h_sfw@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: Add TQ imx8qm based board
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
	Roger Quadros <rogerq@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_074747_340926_532E2BD2 
X-CRM114-Status: UNSURE (   8.49  )
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

On Thu, Dec 18, 2025 at 12:45=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> * TQMa8QM on MBa8x

This commit log should be improved by explaining the SoM and base
board in more detail, providing a URL, etc.

