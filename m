Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C84DD41D4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 13:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vurz8Z4ymLq0OAC/znWews1WaS5VvMmTAw7TGG6DFzQ=; b=WT7t9JmurEVkYmV0KKne1y9Efv
	Qt5hDeq39wN+7wtxf8GVx3FYNWxgKhRGWLlYdgu7XBAxsvyn9hjPA0tyj6KSzMW0bBcEFHxAcupU6
	2p3Fo0oD9CiiPglbuW91S1CUGRttNl/4yNBx+rRlKT4Nqgj/Ktr48U6NSldn8IMyL4xDP6uGp+OaL
	lJniRXseK9kw0gE4XTN+NfvUxjagyWrrAdFnxHPERCfEAoZFYPub8K7XH39yipcXubiDhFOMSuxgW
	nCso9MJLso43mkY6rvYquCxuyKpoWLFtSbvakRnc1VxlhFZhN9Uwe7SMK0eyF45EQyItCavKuE3gc
	fbQLY+9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDSu-00000006v8u-3tRE;
	Wed, 13 Nov 2024 13:31:24 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBCC2-00000006iFg-44jE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 12:09:56 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e35e9e993f9so1311245276.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 04:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731499794; x=1732104594; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vurz8Z4ymLq0OAC/znWews1WaS5VvMmTAw7TGG6DFzQ=;
        b=R5q+qG3c2g7s6NqXJlArsaou+ezVE0Ge1FnA7h+HcJqzSKQcPGXX1dWwzAovbTZ0U6
         6qmHgatfw+6pEbeV958jp2GYX8YgOTnuCYSkxO5yoQo62NRdNUs1L4Z1oz/LWvtUTRTw
         cTJR9A0JDS7lVT4QGHgi5YPVOdP22hZ3KYAppFW1Jnz2xiNDADLAlKIaJlm+aAQ8gecq
         Brhp2taDJ7fbVjpbkQQU3BJ2JbOQIxSkVDOg5tZVm7vuiYQhUckeQcQ1OHpvbVfM/X/n
         xUHzl0RwGLMOIWFAr2I2LFvuvuen25YmLMLzJaXbEIT0CeY8QD2QUU22fExupPRQatbM
         ZXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731499794; x=1732104594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vurz8Z4ymLq0OAC/znWews1WaS5VvMmTAw7TGG6DFzQ=;
        b=EBgNJQpEXwGqUOwbfoLx09wDeuNnQ2PHc3udTbqkJiwfGanMWkF4T5cyyKdTiNILYD
         t0lX3DpEMSLcVuMS7St8hmaINbP/JsZzHby912OLc9ANRxdFkT+O0j7Gp/zfIEJE+ZMN
         X5p2fRn/DhZm9KzMnds7S9zTC4R5Y1r9VAd6TQVaDSZ2szYoQEnI5L/PVS5GV8LaTFvY
         YbTVtK9n+Gq4RkP4NQsluNROIAhD3IcyWgYFbP1HRhG4pt9EdsgLzEMf3DnJSGaYzNhN
         /uKGkn9/klfAQIXv3n6eApkEAz4q6mGmS5OTY0boo15Fdpr93yzXHP354loYBeQ5tJ1P
         t5wg==
X-Forwarded-Encrypted: i=1; AJvYcCXPSHrE9Yc1oskjmeQndGy3LdrJH14tVtcIIxXppFTytXdILr1DdB84HXkKbdsg456wvCzC/BSNHpPdKU6a2ZYk@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/9s3tJak91NmqTQcz1Itup6aj4Gr6ts2VA9Y22vKwwdx5+9JN
	3wPDzCH/Ncb31PPgwLP80MusScujY7dqN3xh0sL/GnrPPjJwv5kRYbavX3125ZD1nW64KuwQvU6
	N4dn7QMRouzugdaurFnMPWHzfh6J/mt0Bd5gfsg==
X-Google-Smtp-Source: AGHT+IEbVbENHDimLrclLq81k2K+eV3PjRDffS3YjYrYwNAjJe5acWC3fJAW8eAeTcDDEGpWp1iOm9mjfIL5BjU6U0s=
X-Received: by 2002:a05:6902:848:b0:e30:d4e4:b9ea with SMTP id
 3f1490d57ef6-e33a1f73693mr11483612276.28.1731499793667; Wed, 13 Nov 2024
 04:09:53 -0800 (PST)
MIME-Version: 1.0
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
 <20241113-add-display-support-for-qcs615-platform-v2-4-2873eb6fb869@quicinc.com>
In-Reply-To: <20241113-add-display-support-for-qcs615-platform-v2-4-2873eb6fb869@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Nov 2024 14:09:42 +0200
Message-ID: <CAA8EJpp2MyXZ28GQV3GDgQp9uCbr4devi++nzkeHA1fk6UZXxw@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] drm/msm/dpu: Add QCS615 support
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_040955_046645_5052D505 
X-CRM114-Status: GOOD (  13.03  )
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

On Wed, 13 Nov 2024 at 13:53, Fange Zhang <quic_fangez@quicinc.com> wrote:
>
> From: Li Liu <quic_lliu6@quicinc.com>
>
> Add definitions for the display hardware
> used on the Qualcomm QCS615 platform.
>
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_qcs615.h | 263 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 266 insertions(+)
>

This patch completely ignored some bits of the review done for v1.
Please take a step back, check what you have missed, respond to those
comments, etc.

-- 
With best wishes
Dmitry

