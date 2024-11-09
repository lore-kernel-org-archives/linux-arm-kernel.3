Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3389D64099
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 00:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGhilPTYeg4CyrC1ajXDu2yJKamxL4VSKRjoPuRcjU8=; b=49JrsuaK1QdtY0TW+ercxBuism
	tSV86RNTprQJgpz2cRxNP7wLv0OQtLa3vaM4wYdAJYlMLUXaCebbpN7Q7lZa2+YLJhZdoSnpy4Uic
	xB0DSk1gzb0vqqnDdqnKCLymZZXcgu+hlnEGerz3/THdYr+EB+VO/aRenAlsuTsCcXXuzDHQ1SwET
	J+5I6kHtqjP4boAQMbGzQTd2hTs8m5xe2U6vdzBvtcqR++6LN90Tx8NAxCWyOXym0hCP5ans9NABE
	TY+n7U3Bj8cRP9bLI9UlZlJ/vB2JLCq6rKUuR4U3bSYKb54P+uJv9Fw33miYnSHdkB8jwNx9NmXyw
	kW0aq4dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ZRb-0000000CMCz-23bP;
	Sat, 09 Nov 2024 00:35:15 +0000
Received: from mail-lf1-f46.google.com ([209.85.167.46])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Z9B-0000000CJyy-3Pn5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 00:16:15 +0000
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539f84907caso3018430e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 16:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731111371; x=1731716171; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mGhilPTYeg4CyrC1ajXDu2yJKamxL4VSKRjoPuRcjU8=;
        b=R6Z36e0NPubRomQb5C2uPQmIpMd0nX7GIzfWAcX9qcYDY/evbgOGQOoEGX81oAz22Z
         3kKFrFbKX6lJMyc68PyykE7+FrPGOQGyYPxQVANOJjY6OoiIHr0lejgaS3Py/7bRJ3Au
         jneQAX994GCwhr11cf1kCm3VveUzecEe5TYEkPBaVWgHXr1G8LDQEvoPwH4jCNKCnHFa
         c0CBOnJlR6+TBDINdLH6TJkGUKUKh2Gzi4dyLieog7oUDX0xBeaEs/ZB6JmwRC9fQsRY
         Dfn+Y1NUkqYxiIYfbnyWr4zFiQGgQkjCJWwojhXOyW/HxB55ji5H7AxUcwcX/Zngj485
         iHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731111371; x=1731716171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGhilPTYeg4CyrC1ajXDu2yJKamxL4VSKRjoPuRcjU8=;
        b=u9y6vgAkDMLRjT6K51OZYtJbF2ZAdqjpvcYBJNoAN9ybhbbdUnuCrXI4c9w1v+yqMs
         Ku4qxwY1HJSwFYedQFIzMZjAyuF2XI5Dr5SeRi1chKJ1mwbath7CqJfqFyTHF0kh2J36
         s4/I0JwoMUOefhdjjrOdf768f45xT7FbWoDp4HKgtxI0SxzA554b4/gHvrdjm611GER9
         pGoYKfcJ3d6yqwiP1w3iGJToUDuO/D6CepT5oxvCth486Dp/MJvAWL7jdt5bGC7VCGth
         Z0UYVtNgxVH3XXUu8DG75yqHBJtvIfZG3IMT6KyXLI+9+5J4koKln5OFm6PhO7uHhupa
         NU4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5LuvPqbw+YjT/axDeyDHDqtSO6wdbBayhqU2fr2FZjxPFgZQUJcPFLWbEye92K3KP0hzDD7y3Mgin44ItOCWW@lists.infradead.org
X-Gm-Message-State: AOJu0YwVcD0/bC3Qo2ALLp7i+t16p6V8lf5R9D0dDNi+UBREjRtpjMbB
	zX9n66/ZkoWPm3/x/UPP0nHe3Kjbui4tvN+lI3u1YE8WNe1g54wcd2gyFsjwMmY=
X-Google-Smtp-Source: AGHT+IEqYf9aBjOBoEcwnsK9UikKIHqLQGQCIxw7C+lbTDny8+xpVnselPyLLsqGg72umh99e0IEgA==
X-Received: by 2002:a05:6512:687:b0:539:f696:777c with SMTP id 2adb3069b0e04-53d862cb2e1mr2782918e87.29.1731111371244;
        Fri, 08 Nov 2024 16:16:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826856d2sm791159e87.65.2024.11.08.16.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 16:16:09 -0800 (PST)
Date: Sat, 9 Nov 2024 02:16:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 10/11] clk: qcom: videocc-qcs615: Add QCS615 video
 clock controller driver
Message-ID: <cwiai67gs2o3tj3bjziao26uxg3yrbd35dknkvjerbe7cbgfca@qhjtij23yn26>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <20241108-qcs615-mm-clockcontroller-v3-10-7d3b2d235fdf@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108-qcs615-mm-clockcontroller-v3-10-7d3b2d235fdf@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_161613_882807_CE4F6BD1 
X-CRM114-Status: GOOD (  11.99  )
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

On Fri, Nov 08, 2024 at 09:39:27AM +0530, Taniya Das wrote:
> Add support for the video clock controller for video clients to
> be able to request for the clocks on QCS615 platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig          |   8 +
>  drivers/clk/qcom/Makefile         |   1 +
>  drivers/clk/qcom/videocc-qcs615.c | 332 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 341 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

