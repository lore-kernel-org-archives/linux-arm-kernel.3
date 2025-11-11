Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C57CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 11:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqeaPnqItnFtRKGsXgxFGwXrKkh4CIZ1QtjFn5LjAOA=; b=faMX250CfxN49lGVBynnuGWoYN
	EtUSHq8IlCvFZwHCk/+YBpF6q4Y4B2onFJT0CGwz/7+zUkRQTVEurPquGA8fy1SgINf0GH6td8VL6
	oi5dauQPRuMJ/FG4mAoxhhh/K5zZIIg6WDWyTNjLJH8sEG8/wo5JxS3G6MRN8nT1eBFD8AB6EN+Hs
	50gawnUsHfcCK3XXWjVkmDMvCabzIr3aQ5dkfOqfGP1mg+lCeueVh5QhJOxRde7WASBYKeIYdfMQ5
	jP3yKc1KDVqGDwNWQKbZqV4bck5y3dkjQCjIbjlh8S3r7DaC/+rkhbFRPaTQ4RGgMxNOn/8oyAdmq
	j/vyYfKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImCx-000000072c5-04AX;
	Tue, 11 Nov 2025 11:06:43 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImCu-000000072bG-3bUk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 11:06:41 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47778b23f64so14542535e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 03:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762859198; x=1763463998; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GqeaPnqItnFtRKGsXgxFGwXrKkh4CIZ1QtjFn5LjAOA=;
        b=bfon9iafphQfJOax9cdqlTUXefYtN24v2Il8vI2JvCxxBYBipsV9JNYbPgNdIMGLRW
         BsJuH4vKRdomiGTvV4rR9xFr12T+f1Zfk9eWY/19fFyK4BP/Dm50b5dd4qlj/bRTVBNi
         XV3MrcUU02sJdrC660kwbNwVobryLRoaU13lVY2N0tsSWjKUtbIg9aqpEo7qtU0nyaQE
         dV12NAcJ+69pZGNIUCploB5Q2wxvZpeZfBZDxBxVmaluRLh3nJPg6WjRyj6U8vVFw6f0
         qnk2H+Khr4gtRm4FtivQI5u8pvcQrBirBIlU3uiGhXdzrqLmL0m/xisIBNmNX55NrMou
         1cgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762859198; x=1763463998;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GqeaPnqItnFtRKGsXgxFGwXrKkh4CIZ1QtjFn5LjAOA=;
        b=mp4tHzjmHgxNre8yEdp99DZnkYL+qUAwjDdobcA+bNJJjEOh+llhoExLZZE4is855Z
         QcnoUcthzeocax/QiTTLcQr/PStzjL9VRrlOSmpudeeHSYu+cUBfdoiVJXkM1SplVrvm
         hB4aunw2LN9bqtZg/7IvKBd/zJQSli1FMWgga9ZV2R9gb3G5K7vSPaoQgsilsrdTXXgW
         +2+ai5DBtRmBpmPFSP+QWkL51y0wnRUWE/WtpOT0mOj6GS0SDDyjibGP7ASyTeN+sQmk
         uLUZLfIkFDpafsCk3h59KA+TqGMJV0Mq7zJ4XDOZvMK0CVNsxFdmwsDzrxXLI2b3rjBW
         uwDw==
X-Forwarded-Encrypted: i=1; AJvYcCW78HZirDgdtBXGFEyQIr7ceYqtVV0fM9eEhOstalwgLoQUsLSGWuZ73vk0dtNst0IjCqZZ/EzC0qXe9DCrO9zn@lists.infradead.org
X-Gm-Message-State: AOJu0Yws70GCYCQZQRv25Z6dlHqvLIUkOPklIKecZ/84GkY1a0wu7Z66
	6NvHWc7Y43MCfXtZGSyfZwp3FOMlbj7KMsMpY+wPmHX7AkY8RE1b2E/y
X-Gm-Gg: ASbGncvQlOaE9m4j2gEBDu4mmFTvQqV64P2xBUrTa/KtZvGRFB3SvNde6qILzf0+Zc4
	xJ2cTFBYSHiex2qTisrYLERGv9S693C+OOqsnyIwCTQ+eYRR0+xUD1MjURjIvQ8janYQ2xlRU3K
	p3tE40TOTLwx5f+UpDwyOEoZozQ+kr+VlDxvbCU0ycUWs6qqV+ZD2K0f50cWzeD752r5T1ToO4i
	RJE17qeE5jmawwwW/WjMhOKWgeQ17meYpicIwB5ZE9LNq6OCwgqPPoarSS7qkAqZZ0X4Ypz7UTk
	x/fxlIdwfL3upQKqmP4Tv1ajzx2XmA4cJVmPuKiKP9DXBB8QWD2AL3cmwtX2l9ToWfajU8E1fnO
	bnpLzEUlYDcJqB/eH+sw1I3ff9E8ilzaeQFZU2Z4+ZMr8e9EDOQHHFnEzZhLxc5GMhOMwShNc3N
	4aV3j+wBB9h6X4OIkkYIDOxpf+K3m3
X-Google-Smtp-Source: AGHT+IHo0/ZJIgGnENwBn854yp6ABmQngtssmchs4xiNiUy0O6fPJmQpRDhvemlWrdEyLklYh4J5vg==
X-Received: by 2002:a05:600c:6a81:b0:477:429b:3b93 with SMTP id 5b1f17b1804b1-47773263384mr69643045e9.18.1762859198228;
        Tue, 11 Nov 2025 03:06:38 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bcfd021sm306780595e9.11.2025.11.11.03.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 03:06:37 -0800 (PST)
Message-ID: <691318bd.050a0220.855f2.f45f@mx.google.com>
X-Google-Original-Message-ID: <aRMYu6AcsZV1rSEw@Ansuel-XPS.>
Date: Tue, 11 Nov 2025 12:06:35 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/5] pinctrl: airoha: add Airoha AN7583 support
References: <20251106235713.1794668-1-ansuelsmth@gmail.com>
 <CACRpkdYOXSm5BaHgij_=L32kq+fkx_ggSJ7G5a=064FDvMR4EQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYOXSm5BaHgij_=L32kq+fkx_ggSJ7G5a=064FDvMR4EQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_030640_917577_DCF2C2F9 
X-CRM114-Status: GOOD (  18.97  )
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

On Tue, Nov 11, 2025 at 12:46:48AM +0100, Linus Walleij wrote:
> On Fri, Nov 7, 2025 at 12:57 AM Christian Marangi <ansuelsmth@gmail.com> wrote:
> 
> > This small series introduce support for Airoha AN7583 pinctrl
> > support.
> >
> > Most of the changes are generalization and cleanup of the Airoha
> > pinctrl driver. These are needed as all the array in the inner
> > function were hardcoded to EN7581 and didn't reference stuff
> > from the priv groups.
> >
> > Everything is changed to match_data and priv struct so
> > adding AN7583 is just a matter of adding the structs.
> >
> > Also the schema is generalized where needed to address
> > for the small difference between AN7583 and EN7581.
> 
> All looks good and bindings ACK:ed so patches applied!
> 
> Suggestion: since this driver has:
> 
> 1. Exactly one group per pin
> 2. Use some accelerated GPIO operation, .gpio_set_direction
>    in struct pinmux_ops
> 
> Have you considered implementing the new .function_is_gpio()
> callback in struct pinmux_ops to tighten up the GPIO strictness?
> 

Thanks for checking this. No, wasn't aware of the new OP, will check it
and send followup hoping it's not too hard to implement.

-- 
	Ansuel

