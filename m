Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA232C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 08:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GG+n1BzxgNDC3GGn5Qn+IFR0CZW/PNnMV6w/wZx1HlM=; b=Qw/3SF3Jm661l2s8QKAwpiU7GU
	+AZ6Kaj+1D5mXXhUf8VVKTtQKV8CHmcPhDJpwFaGUGSyl69cXOLcTKCJvS9vf41U3zgFmMAbZgrTc
	kuVyvjgfgJZwr4/3xHVcXKuWvm1aOwkgBOEM9GfGpzNDUwaQaN2A2+E+/sGQxXiPXZFtgqrnLhij7
	QV0PW+UbsmkiIPmK4rQDmmLoFG62wHhGEN13u8y55Ql6QlTObHeUggPg9D0//WAdazr21YBeTtL+7
	1mPYLfz6AUhTEt/gDRBBqCmtBobbWuODXBx7XNeLFt6XDbL5Tq2/Cohs+GoDJLackUQol0STX3Lwy
	IfmMxo+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFU71-0000000017L-2txq;
	Thu, 15 May 2025 08:38:43 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTxG-0000000HXLW-1Sgj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 08:28:39 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a0b308856fso347137f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 01:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747297716; x=1747902516; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GG+n1BzxgNDC3GGn5Qn+IFR0CZW/PNnMV6w/wZx1HlM=;
        b=z7AXmjpaUEMzsQyzDLP2UjbtiaMZ5w79YbT/XZ+T28MJolkOcK3uvjIYeIVWZ1/2lu
         b3IngIi+HoilYl3P8T2w11N9df7HTtRKKpFOyftZi/h47BR/y2vFkbMcCrRknK9RYf1U
         f2Zf11Az6/i/jux+yra4vPkFxgsur8wyRAGa0dW+TFsmeQ8X3bIqvB/gqQY4x7Xasg9A
         1672Jzuwib5twx7+D2/DSKq+Iy1brYPP9t6juzAl233w2XuIdgkXmMect2MTzlF3+UMa
         ia9ippX8U+4fRK+Ht3vu4nIXlhHnrGDd54uih+buoE7BxaWR9SNVD0EfnkoFdkva1R2M
         7gIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297716; x=1747902516;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GG+n1BzxgNDC3GGn5Qn+IFR0CZW/PNnMV6w/wZx1HlM=;
        b=EDAGBXkNQYn/bs5TbQEsUwe+B5h8xrTsvXpIGjAIV3KbyU7edR9e4J7Gp27CdA3faJ
         Zl7qLRrZu/HlkWshAYNYaB/AGCLln4UCGuhdzUBN0qjuX93/koYh34g0c7fn2Aol1YVN
         PTyjC++ALh6lyfKKEADQyn7t/zTyGpdz+OMsqUghcE1FvYxVNZRgR1G96qAP7ObeFPvc
         qCCyRIa7kt2fwtmDrujnZ9gozHfwtqa4SU1Gnbx+l3mN5SQdA5kNYRICNMdLLhyuDEn7
         O2Am/yJUXMBL/L7TjlZuJzWHqW7MRwzu9/F/F28K4dxnqnjdFGsDK23dZAi6r8hZtvcs
         znZw==
X-Forwarded-Encrypted: i=1; AJvYcCVVByCKTg+3hBaTScOS3D0N3WUrm2tSJ4gbFvOfcELc+IK+KOT8zl9K8+lh3sEfOVdtgGOnMPwf3x1KiAFbDdbI@lists.infradead.org
X-Gm-Message-State: AOJu0YwCvsb00d3Rz4yJjL8jRsF1od+DqbLYysS3Prb9KRWrAZWsLUuy
	YLN04Y+0HWMkz2CkNYusEN+/6L/YPdXHQ+nD31J4m9ZXc7LcasF/yvJdccHYJWk2NnMr+y28TVd
	vhNmXrQ==
X-Gm-Gg: ASbGncsdPQa7u5w0uT+6kt6KKDdLT4EOFofrUW59FnY+teZaCIb0K8PD8bsStCEu1Ml
	Xx5/37zE8ghUH5u0j87XdV2joFgtQkn87Y+sqtxB8B1wVSBCVkRcZk5UG28I8bZN/16Gr/pJQva
	e4bDtLaHKecfcvlUPNpeORw1sOjQfR73WCotuxJHUi+SIFl3NDMW6Sg0SqhzcsVqK8HzKbEJvWv
	lYeXLOTCTKp+4WmV9WmGcDFTbKX4uRQ/eVjPhYhk2ketS3bAMy3CH/tHQF6tJfh6C16meZpqBp7
	o3cUHG/8Hd1BUK8bXFQDKuQ9bt7iO2DcU0TpV2WX8Amz2Q7whRTv08O9zV+6amZW9n2a5W1Qsnj
	YJODcDbdev1hMhEamlFJkYi+S
X-Google-Smtp-Source: AGHT+IEvgvNGsZd5pkJVuylqyGXRmkrORtMz2ILY3XBQ64vQ9UgNy/cWt8/sXaycGYgGtgM7ecdc3Q==
X-Received: by 2002:a5d:64c6:0:b0:3a0:b84c:52b4 with SMTP id ffacd0b85a97d-3a349695581mr5840356f8f.10.1747297716435;
        Thu, 15 May 2025 01:28:36 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2a79sm21698415f8f.48.2025.05.15.01.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:28:35 -0700 (PDT)
Date: Thu, 15 May 2025 10:28:33 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: timer: Convert socionext,milbeaut-timer to
 DT schema
Message-ID: <aCWlsfFFvcj10XPj@mai.linaro.org>
References: <20250506022322.2589193-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506022322.2589193-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_012838_393293_4A668934 
X-CRM114-Status: UNSURE (   9.73  )
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

On Mon, May 05, 2025 at 09:23:20PM -0500, Rob Herring wrote:
> Convert the Socionext Milbeaut Timer binding to DT schema format.
> It's a straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

