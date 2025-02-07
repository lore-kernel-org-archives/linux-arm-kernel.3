Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870A5C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 20:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYkob5dL+kHvl3z2XknwVDlIEJTWdgOpBDOpHuAAwH4=; b=sJsxt4Wd3m6z5fS1DRQfAzycZ6
	UpI5UvJqLsT6ySyd4v+oW2zDQAKufF5WoAivPQDuT2Re2ciY8VrPnoY9BV1UtYHEooctYLlum67eA
	zkOoukJiA5gW+13DldUaOIUwrvJwbYN/m+BM5BkGwopRxQDMy40UMF78YilaYxmmxpC5y3pWtiHDA
	Wxp5HgVwOUwEMSmC2Pcrhl1nEcLdQLXZvN/OelFBP80DsmOv4yA9qO8SzLna6Yg3HmvLe8DypYQxs
	oh8PHUB3GkwhpSrd4QIRmpWioHB2qKubZbQwtn5Q2qvonzcEbgqJ4bxZx+MAGK3mU0bmNcbhw/awA
	6+KxnZaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUzS-0000000B5Bw-2A13;
	Fri, 07 Feb 2025 20:30:18 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUe3-0000000B1GO-3Tnc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 20:08:13 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5440efe97baso2773171e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 12:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738958890; x=1739563690; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FYkob5dL+kHvl3z2XknwVDlIEJTWdgOpBDOpHuAAwH4=;
        b=wVPLPiPoybSDyL2CoKq9A4/mPbpDhSiWF15P+/FZczBv6e+Ck80BQ9P94dcgTAPoYh
         5ww6Qxw6+LNJWNTLxvZqhMJo0fAqwlS6l8dwXsSz/uVDBqduEPANGGjyndGd2mIp0IEx
         qKUw954x6Zm+hFNKhIf5GjlYqfqSF/7FJSE1FXKHSrK4jfOZHT/yZXmjsrGHl1hhYwU7
         NmisJuQEYYQvv8xXp/EWy00IVO7RhZwsSbYnLgXaZs5kWBTIHe8fMo9+a16Sgsk3Wlyp
         0EAP94JtkziXicnH9A/bi+4U/HPg6HAEXsvHjNSdyimEZTsISJ1gd8Tu+G1VZFyzADyf
         /AeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958890; x=1739563690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYkob5dL+kHvl3z2XknwVDlIEJTWdgOpBDOpHuAAwH4=;
        b=I49clMlj4P9aa4okVQMGy68q7md5yOAzbiDCN+XAfY9YqdvaJHAJoXKtt8ZMiUW5ng
         7vRyDZd2nvcs+L5t/fAJAe+peax3b8AFMRY4RonwlHVynhYhvIdTQ5djTWS5//vOz8c8
         a4Bp9Eyyb51ps0ovZOu/pFVz23Dirn+trXjO8ThvEqJZrwJdtovXF0hCAe0Ue/oImy5K
         QeB+HShaqrlvHCwLXfq8cZ+TX8WL69G8tN60yLXhl40SLw9F8rY0gN6V/xRokgUgRMr6
         27Q+qFA4WrJh/T6JdHzwBunMZdBOyI9Xv9SX+znHR+vuT+rjsFkm52S8UVyQeHltnH7s
         mxbA==
X-Forwarded-Encrypted: i=1; AJvYcCUZSh4j6iiJBGk6XWuzzYuyVgFUI157lQBSDJ1DzbocyfklQzMdiU4Y9DuhFFf+YCI+5g9fyqutJRAItol+rp49@lists.infradead.org
X-Gm-Message-State: AOJu0YwkcFLNjYcMpGEUcOZnITqnFuhdAJ5jGpM5CmF/rpNzSRBODE/Y
	gIE+thbpsUUK89g8N+TMxZjp/sORD/j4/u0GezZBdmLD1ZgprSrj/4mtes/sFzA=
X-Gm-Gg: ASbGncuuJ7lieLGF6K1vXx/lRio4Vki7NbFG9AXrG8uaEDm/dDIS+9PGTEK5yBbICAi
	+eTYGYrX+lEfnALi7c2fxA7B7X0VXDPWL+tGiIIHwpIREFvkNwZDkmsqQH++/tZC25seQUCUWoi
	sTE2FqBg+Gc29Y+0tjAoPFRQReJB/EfkkvhHL5K/VmzAaE3+skSJy9/QdQCdHet9hNp4RTGLWBs
	D3fyqLFluf9l7v9BNv1BdeMZNXchH/pFBW5qKav5+y17+vRCn7YIohGx5Vt0SGc0D7O4I0P/fBN
	egCkVmrE1XqL+GlI5asyeenrObCUY0ENk3hKXPgEyDe015v28ptAZKaO8HG9CPMZAcVafa4=
X-Google-Smtp-Source: AGHT+IG7/wH8lvWcq5WTdfj8YtPxXYAdI23+8Xf0vHDGS3N8knZZCrXym+bOiezQMN/DqbfaTNAu4w==
X-Received: by 2002:a05:6512:a8f:b0:544:f77:1fbc with SMTP id 2adb3069b0e04-54414aa811bmr1516524e87.28.1738958890042;
        Fri, 07 Feb 2025 12:08:10 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441053ecb6sm546134e87.6.2025.02.07.12.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 12:08:08 -0800 (PST)
Date: Fri, 7 Feb 2025 22:08:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org, 
	konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org, 
	catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v12 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
Message-ID: <slpvv4gvncgnpexu3lc6ujbyvhfne66kmwau3ch7i7sqraogc3@enc2jhll6kid>
References: <20250207090422.1609260-1-quic_vikramsa@quicinc.com>
 <20250207090422.1609260-3-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207090422.1609260-3-quic_vikramsa@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_120811_874784_DF52BE02 
X-CRM114-Status: UNSURE (   8.93  )
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

On Fri, Feb 07, 2025 at 02:34:22PM +0530, Vikram Sharma wrote:
> The Vision Mezzanine for the RB3 ships with an imx577 camera sensor.

No, RB3 uses a different sensor. RB3 != RB3 Gen2.

> Enable the IMX577 on the vision mezzanine.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -v -V '"imx577 '17-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 

-- 
With best wishes
Dmitry

