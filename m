Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC96CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 08:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ove6z4GEDRrmzL1qSU7abyz0K3DIWuJFgY2FuK5CbFQ=; b=TATAlnmIQ1Sa5OYHOu9Id0hJ4w
	+JlVGBxZmePaRqz8+OkQM4B2lpnUP1s2hsIZsmJtgcYQ84G2edBf7yvsxODD5ScbI9JBYEpN2/0KD
	ZzHAJ6v+KkSB7s3InEJa74yREBsCQfKvP5dU5CJySCTXE5v/cEBVTpPRfSTqh73hM1E7n+iIqK5Dk
	+vitP+TdN0az5g4QNAk8/FDM7OhzaQ/qO+RLyLtEqkVDK02sqas2Euwxurshx+i/PajShOssH+Zgp
	XFGZf6/Kp6aUhsuxugoHOl/A1mYJUiUkfIan7U9FxUI4SBX9vUJdJi1Y1CY8yZksywSP1hP8YHyKi
	NYYCN2uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkYY-00000001YKz-02Bc;
	Mon, 19 Jan 2026 08:24:14 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkYV-00000001YK1-1put
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 08:24:13 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-11f1fb91996so9304191c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 00:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811050; x=1769415850; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ove6z4GEDRrmzL1qSU7abyz0K3DIWuJFgY2FuK5CbFQ=;
        b=hcauDYbMc7i/2Qn4/kPxEdvSao6VP+DgoqXX+i8cs6bckDE3sZ1AMw6Plx2wPjDR9T
         LS867Kj+JGTQRkobQb5ntjjimZRDpme7GOd1YWP2ze8y3G9X5zXQy1Hj0okTfTxZoIzV
         CwN3pY8SbfIPxPxI2kkX2WMTWPE3Eky+MJv1QUhj1qL6eHm45g2lSVkN4kpQY9R9BNhT
         PgI/kBUaKgaYZ0ZLkCzPuN3+BaZ/urn5U5+R0PCad9vxJFZ9RSnUjVAkyhvkVrX/pwjS
         Ug1uAvr6K1L4PXt88UxTjKFCXWr3ntHn2pkM2sxiJz1912sZB26nqkEDy2YWxRYdNdDt
         cNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811050; x=1769415850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ove6z4GEDRrmzL1qSU7abyz0K3DIWuJFgY2FuK5CbFQ=;
        b=KSJZ1yIeRXkv8lyNfJvNaWCtmp6jZo6H2Y1sDzb5E0nHInGKnOCjLkueULm44Aa+vu
         eOSZa0pQHLPl5ABoPNxvU6fJ+Cjo44Ji0kwkM9+aNxsgaI4DukemOqwTqDturIpZYwcy
         EcBmdb2vDzFx7wIqhEqa7IKmduam1mvVYXLbZTv8qeMakbWVCPHAidmHbnFIn6lorsN0
         2s7YBKLkvDGywRorBhO9KMPMwOTFEqXeI61T+nDQ5VgP4XSV1dKPaOAiWrBZ4gx4EDxF
         YSAVeZQGs8ndKK82Tlwp/v6rtyH6mFLGidh9kwqEj5j7rO8vXH6Xwj9/aQ1KouRZGCUn
         g0Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVeSqe8V4LG5YGm8Ny4Fzrrmm4m7U9PiaZAesX2m4Lv5APzOeJgph200OD2ETnFDHwIyOCO7iw00y/Fgto7Zrfl@lists.infradead.org
X-Gm-Message-State: AOJu0YwJs7V1A1Wf1oq3Wk4o96X9D8mAEHLQRbMXcJa2tTRWL/4Aoq33
	MvjeRZo3ssWCae6TGdyfstHqlMx0vFP7aij4mAzDoquwqytTQnsaVBRyX8y5Ly6aESl8/LKshE4
	oFVH9PmB9ZqNtcFfUMLQ05cjwwXkhZtk=
X-Gm-Gg: AY/fxX7fvUDppjYnYADvQu95e3YqYJ5EC/P1yi4Nx/mXC56fRxAXCTtCTZR4tAlWRKL
	hoZJq3YNKMXxiSLXAsnq6hwqHdz+UB+D0EgBLBC60/hgkNKN0JHYiNChDBbBYEzFqCqMNzo0T9g
	CYPIw2P1spicaY5cipMgdhbx3DNwkdM79BRBdiotayKpPJOx6HolDJW6Av0M1+XMb4RlqOffLVE
	Ik8t+xrTCBmm6uO4jPzscFxfOuvc645RlN7vBD0FMKC8oBCgHgEMt6ifECxk9QHHVMuzhB7TnaL
	2hpSdjKUA9xbGWrbp/88GCzrgbYo61Arq1iVOWLVCRlN/ZF/SQlvOEYRY4hI7hHv/vxuTzhn3xx
	7OqYW8vt3Iw==
X-Received: by 2002:a05:7022:a86:b0:11b:ceee:b78a with SMTP id
 a92af1059eb24-1244b33639emr7887537c88.19.1768811050417; Mon, 19 Jan 2026
 00:24:10 -0800 (PST)
MIME-Version: 1.0
References: <20260119064118.2493736-1-zhipeng.wang_1@nxp.com> <20260119064118.2493736-2-zhipeng.wang_1@nxp.com>
In-Reply-To: <20260119064118.2493736-2-zhipeng.wang_1@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 19 Jan 2026 10:26:51 +0200
X-Gm-Features: AZwV_Qig-56UXGLfTyKon8QrH5w4OVjRr-qKTuvAKDTHLoGx-DgPQcPPQmb017c
Message-ID: <CAEnQRZCaAp-nUEd8NnQmT7MU-Kx=usV1OSx8xtiQB3aWUFzYAw@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] clocksource/drivers/mmio: Export clocksource_mmio_init()
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: daniel.lezcano@linaro.org, tglx@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	chun-hung.wu@mediatek.com, walter.chang@mediatek.com, jstultz@google.com, 
	amergnat@baylibre.com, aisheng.dong@nxp.com, jindong.yue@nxp.com, 
	xuegang.liu@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_002411_478791_D6C5BE02 
X-CRM114-Status: UNSURE (   9.40  )
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

On Mon, Jan 19, 2026 at 8:42=E2=80=AFAM Zhipeng Wang <zhipeng.wang_1@nxp.co=
m> wrote:
>
> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
>
> Export clocksource_mmio_init() and clocksource_mmio_readl_up()
> to support building clocksource driver as module,
> such as timer-mediatek.c.
>
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> Signed-off-by: Walter Chang <walter.chang@mediatek.com>
> Acked-by: John Stultz <jstultz@google.com>

Hi Zhipeng,

Please add your Signed-off-by tag (even if you just pulled this patch
from another tree)
This comment applies to all patches in the series.

