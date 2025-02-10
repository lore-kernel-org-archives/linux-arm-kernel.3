Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB07AC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 12:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Yb0AWSvzWper++L7lRsz3UWuqSaAyKs/rjQB9+IZrI=; b=oA7ARW8cHcJLZw7pbKJGo3hYlW
	sfC80qGD8IqoSGhptfnbh9Uzd71EmA//aKFaGB04k/e3KFlmHLAN/2UJRGzcHTFH/iOZ6MIjxVxq8
	C4jC1TanxbvAJs6pkOq9KeBAjq2UQ7bqRmNeGYWMe1Xv8nNkbWJUkDOmg49L3qqk8IWMycjQwPS+A
	9PKsOk5Ufz2QKXq5C4CibXE91gBnrYhj6JQMCa/ECEziGef49hiyb49Ocn01se0oNk5uvaJCx7S5c
	psS+/EQPE9EJbCH5m63AQPe+NvS+RfFu1kvPks0xVDeyKgRtViUxQjJhWW0ndSJzoClTNexYtpyem
	0EQy4AJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thTHO-0000000HSUH-3Du1;
	Mon, 10 Feb 2025 12:52:50 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thTFy-0000000HSBN-2O8R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 12:51:24 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2fa7465baceso1799997a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 04:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20230601.gappssmtp.com; s=20230601; t=1739191881; x=1739796681; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+Yb0AWSvzWper++L7lRsz3UWuqSaAyKs/rjQB9+IZrI=;
        b=GGxhMaDxYBRgpetZuyJFahKMqQxIOOM5oVIjIiQq9Cnj5u5QosP4ietzPb4AjjgUCt
         lqeGw7nVaeR1SKq2KuQlMC3NU5HBRYbsKHVFUfRDjBfSF1KbjlPKzWc5sruabQbW72NT
         XsgIHHV4JTrc7maNDMtc0LWFKhfHmBPEgqk9I/Olws8dTkQ9fVeEZ58WlIi/Fw4fF5aK
         aRhBMEYFv9EGwamZjOL2ekUl113nlerybNtXOmikXm/IcgTPkd5cipMhdOEhF7Zyc5t4
         EhNS/c4FdyIxTnifOwVWNYcIRCpMpRyKtwwy5iJulDI3TuHSKF0FgONDckAn39DtYOcL
         socw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739191881; x=1739796681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Yb0AWSvzWper++L7lRsz3UWuqSaAyKs/rjQB9+IZrI=;
        b=EhLOFbsG2zGt3QGquGRnJmsKxu/PsFY3scS8pn+RXZn7VDWMnkPYJ5ForBtw8xP/Lo
         BrkehvV5veNsfX1GC0jqDhbBAiLORQlKqqmDZxBQrp1A4htE+loSdhmupNqQ1NeUSBFX
         MnTGp9lqrfXcVlLFeueWaoKn+VyepCxjwBY19L/cbb2KOhHMpEcX9sZsJQ7foJm1Y2dA
         NIV4XHqv6Az/q45sXuW2W2jTBQxYunCe1X+Tae5JXaAU/dPYnEistHUdihbwjxD9c3xJ
         WNy/MzGZ8/FxUmShdtZefkKabbb/MNFD/HQx89vyeIRp6IVnPmVE2H+z3EFJhm39ot3e
         pSGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmxd8L9e97MdNh8v++QZZKLW49qE6qsT/UgoIzaowWmGgZdQUO2YQCTWkA5HR4/h8sGCpD8c5atnVqYTovb5ta@lists.infradead.org
X-Gm-Message-State: AOJu0YxJZtA9WA/+Wy302xCTS+jFvJjpHuU4dnmeOV5ZVEKG7xiD6XuD
	q/LZIOIpnGv9sldDdZYepVl9hL6XS6IkPuJLdjq5nfliAoOecBTCwb04+DT6lanJmawfIUGrRrG
	amMngiIp6x1d/+xSx+bLkAzPKssyGuJe+G8K6UQ==
X-Gm-Gg: ASbGnct39IR5ixRC9j7MkGsbAEXF80ZGD8BSnkjjs9JJo7AjuCFfsWhtdlUgSKtpE+P
	/sFSHcQmti/Z4wc5gLiY+ZhM1EE5HT0a2DekqKup0TIcXhbV/ZuJBdVQ+GzQhk1xlBygyXzU=
X-Google-Smtp-Source: AGHT+IH/HUfs/WQDH9q7eIfT/iv1s0BqbEiijgGJB+xtMIiqfoSqIhTiQ5xQmT4IYeIt4YgSchZ2PjkqSmXBwPFV2cU=
X-Received: by 2002:a17:90b:19d8:b0:2f9:9e64:37b1 with SMTP id
 98e67ed59e1d1-2fa243e9f80mr20290354a91.28.1739191880824; Mon, 10 Feb 2025
 04:51:20 -0800 (PST)
MIME-Version: 1.0
References: <20241227132936.168100-1-jagan@edgeble.ai>
In-Reply-To: <20241227132936.168100-1-jagan@edgeble.ai>
From: Jagan Teki <jagan@edgeble.ai>
Date: Mon, 10 Feb 2025 18:21:07 +0530
X-Gm-Features: AWEUYZnHRH8l6chZJLn_I2J6MTRIWUy3X4w0l00WsZj1is2NYfhDUvOTFAqvwXA
Message-ID: <CA+VMnFwHEXWP=d_X0T0E9fHFDCkXHxpvgML6jAHNfh9ikXTZWw@mail.gmail.com>
Subject: Re: [PATCH V2] arm64: dts: rockchip: Enable HDMI1 out for
 Edgeble-6TOPS Modules
To: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_045122_597741_443E8EFE 
X-CRM114-Status: GOOD (  10.54  )
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

Hi Heiko,

On Fri, 27 Dec 2024 at 18:59, Jagan Teki <jagan@edgeble.ai> wrote:
>
> Edgeble-6TOPS modules configure HDMI1 for HDMI Out from RK3588.
>
> Enable it on Edgeble-6TOPS IO Board dtsi.
>
> Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> Signed-off-by: Jagan Teki <jagan@edgeble.ai>
> ---
> Changes for v2:
> - Rebase on top of Cristian's series
> https://patchwork.kernel.org/project/linux-rockchip/cover/20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com/
> - Update hdptxphy1

Cristian's seems merged, please queue this as well.

Thanks,
Jagan.

