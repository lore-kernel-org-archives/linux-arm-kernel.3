Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19842D2F339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3oLbFvwOOJts0UzMwGyJmDUy99A1kmDLLXXtP4qNCY=; b=v/qVFxDZ8subDA5zbKrW/gBAR5
	/jMOcfDN/LbjHr7gTTqqE/98o5HUGU++wz2JP+v+tB1Ms6xfqoISEjNUqoWoMNJ3nWB8izZiio+lX
	8+ZZCCCC2KEUCmJqLH4JbBYF/8uzjjeetVoCrVkz6v8AIj0Zi5Tr+BT1dIDmO/p2EgpCFgb6WB8S9
	8OFZRuzKo96W08t60/hsEfvHgK0UUvmXo3QH1AUrEnGwISp3rSWhyEuSyod/L0IXXfcdY2fNTKsuU
	qTLN3LC/80UXZFEzEpEn8nxqnMJ2Rmj8CWd20XOTuMy+2ugKBmeapoI2WHit0nDSKIdstnD8yqBFD
	17ac5VrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgdv-00000007Pyu-0Ydk;
	Tue, 13 Jan 2026 15:49:15 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgds-00000007PyM-1vC4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:49:13 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-11f1fb91996so447760c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 07:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768319349; x=1768924149; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3oLbFvwOOJts0UzMwGyJmDUy99A1kmDLLXXtP4qNCY=;
        b=AdCjgOghAnh+/Vfs2z89qythLZKcwNfQtxMaYt87ueMlMiINPc2L1VwZ6QMW0XDYTh
         3+xsDL79dm7UnOoKn9hDKBvABF4/uSOu/XQ93g963+l7DHo78N5Q3ANTYHnL+CWrAuLa
         Er0t/dwfKa0TIl2M1cAjI3fPDgdQo0B6/921KCWtIU1NF/t1Hp+kxKyM97TpEYt2K1pJ
         rANvuuj2kWiwwrj2j6WXDQPiDMvWNxfyGz5Kb78R0sxTp6qfxX/XwTgjk/qzgPZ/Qybf
         YVO8c3FXb+QCC54k3aorD98YuWJZY/ZRr/MbOKMSSeWPIrN1vIT3blCLISU5yEIu5i6D
         IBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768319349; x=1768924149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L3oLbFvwOOJts0UzMwGyJmDUy99A1kmDLLXXtP4qNCY=;
        b=EDnA/C1921akUrm1But3SC3bHFIKizGyFufL5HclXxeOfg+j+XFOSpHd93LKHSVGIR
         zpMkcgD2dpuxuxMX9OLmQyRC/j+zEezN6mgZVERinj/Lnt2Let0dbeafu0buSOxw+CAG
         lsQ7Eq/Z25NvgD7ufowGkEcl+DujbJj41V7FtZsZBnEqB8VLWI7wio5Jr4H1qTQer9vX
         GABTdD5q7Iew5p+jbYa1Yn2s7HmyGeMoq26lcPHGuVpDXNGA2c3VLFASvyvRinLtKtGD
         YvAABwSNQ+Y7xUp5HrAt4CmPiz+nT25HzvJnyNsaIFRWEp1drRbfqEFwmCIxqwVUHgS/
         165A==
X-Forwarded-Encrypted: i=1; AJvYcCUXcAJAvLB8BmppC3oEelIYKrdonkJOBhpU1Ouw3f5+fClqG5nL7NBiiMJ3abCmkwTQ2M6G/yvAEjoo2NlyFn5F@lists.infradead.org
X-Gm-Message-State: AOJu0YzIE6se6mRL20UIionSZ9Y3WxAW+ruogoPvDpelZZTCvW4lBWHy
	o6kzcVykGZQhHwIGjSnr4OSpcyfpkIaQDn4Lw0sY19vG2xGN/5F2pcRsEenovamjHzFrNvT6n00
	pUvoaqFMUsIixTHZztSzV0jj343iFRBw=
X-Gm-Gg: AY/fxX67LgwldoRUWPKT0nLkpH9COUvv8Iz0amDKy8McqAQwlkT1t0MQQQQY8F5I6+a
	IXfbpoMmSbEAx5+cO+Dp0Mb//IRruLZ9UlNwWt3jchW4VwjViiz8gUvzeo199hmb5OHuYZ5iK7m
	5EMuaUiDhaQX1cPpcLuIG305PGmVloVuU9Vi6lmSA/F2mDLLM46kHGMdP0CEX7gVUuAzPOPFRk0
	fOQnksn0xcHTV8WpFfQGdvwUZVyeJLQ3/KBtnB0wLEidyn0RE/mQxuv+iRW75uF7E7ev7LjMgQj
	MtZiPKKJjpoyRT7+fIPQCrYgUixPBnAmDIhKEa8cCgwCxN9POXLQmF5BzJNv74xLHgBD04PbECs
	3C1/Mz1eWESeG5UNgO3L6
X-Google-Smtp-Source: AGHT+IEtf3xHFMK7bh85v7wy+tj/RylyAyqCoV9aOeql1xusdXvXq6rsq1/RBjQjsVrrgZEZyOQmOhuD4FnrB8WmMNE=
X-Received: by 2002:a05:701b:2207:b0:11b:9386:a3c1 with SMTP id
 a92af1059eb24-121f8b750d4mr14170039c88.44.1768319349465; Tue, 13 Jan 2026
 07:49:09 -0800 (PST)
MIME-Version: 1.0
References: <20260113-v6-18-topic-clk-fracn-gppll-v3-0-45da70f43c98@pengutronix.de>
 <20260113-v6-18-topic-clk-fracn-gppll-v3-1-45da70f43c98@pengutronix.de>
In-Reply-To: <20260113-v6-18-topic-clk-fracn-gppll-v3-1-45da70f43c98@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 17:51:38 +0200
X-Gm-Features: AZwV_QiQSE65KDDt7M1WU-fsU0Y3sGYlf63F7cu4HgA_-IsmphqZd0FRyAjQOBM
Message-ID: <CAEnQRZCUJKmH5TM9F9zMHpTtZ8K55bNL+7AtaMysyaCBru3wug@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: imx: fracn-gppll: Add 332.60 MHz Support
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Primoz Fiser <primoz.fiser@norik.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_074912_519521_99DF8B95 
X-CRM114-Status: UNSURE (   8.60  )
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

On Tue, Jan 13, 2026 at 4:53=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> Some parallel panels have a pixelclk of 33.260 MHz. Add support for
> 332.60 MHz so a by 10 divider can be used to derive the exact pixelclk.
>
> Reviewed-by: Primoz Fiser <primoz.fiser@norik.com>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Acked-by: Daniel Baluta <daniel.baluta@nxp.com>

