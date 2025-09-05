Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E54CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 09:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPfnz/o3iNaHytOqe7truOjcGer8WrwACGpoW942gks=; b=kD9SVi07us+VIXeQATdCGp+aM9
	jvzr8X0nlBXrwYoye/yAWqTU2tW6ZHeYVSMxjnM/3T/xdx4YYUrg0JmgNfQi443kNmHz26boOpa38
	IYuBvL3jp+Ch1pkXaPytDsi3gS6z6hHIgo+uQypWBi+dNOgJManhzEr6mtIUkjV4sQhfxfdW/9Qh0
	p5TYeWXDVGrODFQTgWmDK0M/2iAFdvjyEAJZfxmzRRjZP4KGBmxVx4UfsE6Az41CF/cDizOMFvKmy
	Cpo2ROsXpAanJ3vgklifjeLvDFitStib8ppGjiwsYZAp2o84b3bPyZS36UKF/xqyREKIv++l0ybUP
	QBYMzjTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSce-00000000hVW-2oNH;
	Fri, 05 Sep 2025 09:20:44 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRQY-00000000E53-3Woj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 08:04:12 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-336d3e4df3eso16718341fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 01:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757059449; x=1757664249; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPfnz/o3iNaHytOqe7truOjcGer8WrwACGpoW942gks=;
        b=Wibob7VPCeqKIjR6QKihQPUFZivA+1+kSAQw3OGd3K+93RTEs8XCslJhFK13bFvDT2
         uNqKymmuMN4Jj5hQl0HhB91E8iWQ87pFNsn9Om+PFmhjTy4rbFw2p7sEul4Nevrx0OKV
         zk/5aRnx8Uo8URLkgU+Q0Idsucu1y6csEmB5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757059449; x=1757664249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gPfnz/o3iNaHytOqe7truOjcGer8WrwACGpoW942gks=;
        b=T5HmtMx9V/dm1GYjaZWtu7/ng7tS+X8Cu3bH4Xdb3xvc/umi+Gs5ymI3/faG25lOyy
         GVOC2lkVugs9XxdvNo9amRKpqrkp6pXWDP7cRkEKIsVTV9DxpO+eCzV9BtnO+vggC2sm
         uVTAJSk4oyrQo/eZhve4nIgN7XfM5F2OjeIaZm36N2ExwuxOVlTU9fwztFMtWhldWlo7
         opIXR4LP4cELT3y98b3f43T3qk4MkfWqtqRqiBeeNcHFVCtu3PbWL+8pZIubOS1EVij/
         vJlmRy6R8c17uclIYITXmUjzzONDBaHfWceYXbbcPh57vh0qqdKTTrd3v57zL/UCkxX6
         2ICg==
X-Forwarded-Encrypted: i=1; AJvYcCU7zgCSd+L5A3OEasF397/LOUi0TyhafqGX7cwBmTMmtU+Sr6LhIkR5jDCn7nDUk57WgUOJ1MAFBxhAixlc8+gx@lists.infradead.org
X-Gm-Message-State: AOJu0YzDEKpuzMysI+IhYuPxZB6dbvQhlU9abQkEUFXfUbITrNMay9xs
	dTHKTAN88mEngOTxbmEoGZWH0GHO9DPUvc899rBZ6ae+RQv2RS3qLMcdtDwjWWElp3A1/5j63WU
	p1GWhQoC8aNyC68l8fu3CODWpvGq4XCvm9JdvAktV
X-Gm-Gg: ASbGncvGMKzegiwgcbO1Z8T8qoF49y9YAb+g9WYRL1mxCDA+Et71bkRvCmZ8awfZaBo
	3WhR3gv7JzvJbadatv0D2iSWAdHExZEweOClrcXgxz5tTqa64tBxsspG0G0AKz1uc6lX2BriQYx
	rEK5PzKQkwfnijg8A60oissBDuykmx10m4ILRoQynjRppcXAXJb9yMmqqDa5i6p7fJutUlJXo/C
	I1JQ9W5n83aYcoxutkSYzc/pffIYMwnv/0bKQ==
X-Google-Smtp-Source: AGHT+IHT043Y/TruREpGKZ+/QRl4lPJ5bvgN3xV40J/rToLhwUaxJ8c7vgtH50x+X4YlPrhw0jN/shKQPrGCvcazPsI=
X-Received: by 2002:a05:651c:1a0c:b0:339:1b58:b199 with SMTP id
 38308e7fff4ca-3391b58bbc2mr3260661fa.36.1757059449029; Fri, 05 Sep 2025
 01:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-23-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-23-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 16:03:58 +0800
X-Gm-Features: Ac12FXzqjLPg1snoakkIHpjZL3gjVDvpLkfu1BDJJWXmMZBGn3rIna_U1tSPpG8
Message-ID: <CAGXv+5GreKJSz76EiHYzX-ByfyxuYNYB6OyBJk9ZhsKCapPjRA@mail.gmail.com>
Subject: Re: [PATCH v5 22/27] clk: mediatek: Add MT8196 disp1 clock support
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_010410_903602_757367A6 
X-CRM114-Status: GOOD (  12.39  )
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

On Fri, Aug 29, 2025 at 5:21=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Add support for the MT8196 disp1 clock controller, which provides clock
> gate control for the display system. It is integrated with the mtk-mmsys
> driver, which registers the disp1 clock driver via
> platform_device_register_data().
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

IMO removing CLK_OPS_PARENT_ENABLE is the right thing to do.

However if the hardware ends up does having a requirement that _some_
clock be enabled before touching the registers, then I think the
MTK clock library needs to be refactored, so that a register access
clock can be tied to the regmap. That might also require some work
on the syscon API.

Whether the hardware needs such a clock or not, we would need some input
from MediaTek. There's nothing in the datasheet on this.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org> # CLK_OPS_PARENT_ENABLE remo=
val

