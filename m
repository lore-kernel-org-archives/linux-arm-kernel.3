Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F50CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOUf78kJC5CeFRX+36nx9b9SoyYDtPWwiSrTZqImx4M=; b=hwi8QQxqnhoNyxsPV05R/WITm4
	bkr6jL5jt0vQfjq3ylH8nClslmt7kQ2BabeViWfavNSXeVtx7876/ROShBtlCe+Y7sRus4o2r000q
	wC4AXTlzX5irtfu33zlqLFUNNNwHcv30iLtUOxfeQlb2Znpj63Uy9Jw3xssCiL85GcIt69gFf3nex
	s91Znyjq9JWUhftL0h2YuZFUvCSWsuIKR9JZbjrgBa5tNlMIy/xVZeP3+VK8819EeM/dirwOXyQW6
	2mRcGt4U87lPHdR7fy2hqDemhuoi0AYShStWGKeE1A3vLK+7qrjMNXVZMEil2eNLanaxum7qTBs7C
	u5eyszJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9j3-000000077hE-324b;
	Sat, 30 Aug 2025 00:45:49 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0q3-00000006AP6-1p6I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 15:16:29 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7f722cb35fdso212802085a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 08:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756480586; x=1757085386; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lOUf78kJC5CeFRX+36nx9b9SoyYDtPWwiSrTZqImx4M=;
        b=cxSRhGLzpUG6jN7tBcvV3gY+1ehjxH1HYcbQIeLAfB+pu+t+U/Ssaoes/4Nyhyj8NN
         eT6gaQjSewK+8EvQixp3Z//CXzZwYMU3K/i+W9hp+J0Qbf/r4gnWCafAUbgLXhMCkHz0
         u7XzyWavGVS77go5wdVpoubL0XOwVI7M4F3EmXgabWrQYQq49nrQTeEur+irtxX28D9/
         6KTe95CT9demDmYFhdUBC4sq/LqX/GxECpOUjwoeLLhgiAwpcfon0CFTQR0O6weneKnQ
         TEScbsZxOPEMEEgH9tIU8F/ygeBLWScTg0oAUTlr+0sicMnqhruYm9yd3bFmun+2lr0w
         EN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756480586; x=1757085386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOUf78kJC5CeFRX+36nx9b9SoyYDtPWwiSrTZqImx4M=;
        b=nhy+mKf/amKMK9qy65hdHdC7ojNgPnSyu1c6HjuXssP4+KXE/1a1DreQ0T08SpvjJ4
         cSRky/uJuYE1ZTlWwNXhccCYYHg2/B95bXLiod4TRPp+EWcV3/w2I2UCm28wjnNeRLw1
         EtIqgLmqSQE+ugoNwJLkJTrqZxEMBvaPtiMFVCkX6zTzFMdoPEYUnAClk8nMxc6Apjro
         WQDrJVY15fSIaZOqOZj1fE65T5soT7IEcEj/cvz479tvgKo9YOnq+K6kOMh9Sf6U6YuL
         ATjIJ9ki+2jhWezL5MAcfUDknoDaBDkgA9XHKdhyexZ9hrOs4CuROSv/p37Y+s4g00f3
         hb8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLTuT0XLbKXW2+cQKIzJM6qH3+ckOWhhCVIyPtFtjur/PyC0gX/clYSaBMT1UFAUYiuvLEMSItlvOHT6g7HaiX@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ6r0/LQkUngc9pQFFESK5dcUCi6PzCWXO6T+6GE9w4WiAelfb
	aFxdm3nkdtTmGQ5LyIvfdE9DgxAk09h8x03lv5uBYAALb26oxh0kwnxkCxkozWuu0GhQfMmoZmI
	4PzdXoOFln7JZDAekIFYrIEahcwn56+uTp+qhlLGjVA==
X-Gm-Gg: ASbGncscJeaad3IenOo24O45f3iZfISHUiAsA7vSPRxpeVGAq1TWbmXIQt4cRz7Yc0l
	Gpz2T72lN7neZpCQb3eMxMUiNToY2+MmC+2jh/cbjirXmnHrS8pw3qtUXk19FViBj7jzAV0u58c
	dBNPIL4Sy1dCljbNi3UFS5OYTwNqNx5mFlajN9rGbzARQTLybuhpqMUCarYLBoP4xItFQr7qi8L
	kQp3w==
X-Google-Smtp-Source: AGHT+IGnzlI20hD81QuCUxmiLx/CLn49uqNE3sl8frDh4fjPDY8YZMBAvQbF0rOj2AAQybUTZBlLQymUJBEgeOnVx3g=
X-Received: by 2002:a05:620a:4053:b0:7f4:5aba:d966 with SMTP id
 af79cd13be357-7f45abadb98mr1590732385a.60.1756480586040; Fri, 29 Aug 2025
 08:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250825-rk3588-hdmi-cec-v3-0-95324fb22592@collabora.com> <20250825-rk3588-hdmi-cec-v3-1-95324fb22592@collabora.com>
In-Reply-To: <20250825-rk3588-hdmi-cec-v3-1-95324fb22592@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 29 Aug 2025 17:16:14 +0200
X-Gm-Features: Ac12FXzpMvL7DIJopMIso2mzGRacTGimE8ocHlW5RhJ-2PuaDc4LbG8M9GuvEHk
Message-ID: <CAPj87rN7gHj2jyAa20hJXHscauupUcEzYxfgH8-9ykuVcETOpQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] drm/bridge: dw-hdmi-qp: Add CEC support
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Algea Cao <algea.cao@rock-chips.com>, 
	Derek Foreman <derek.foreman@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_081627_482067_B529216F 
X-CRM114-Status: GOOD (  10.44  )
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

Hi Cristian,

On Mon, 25 Aug 2025 at 10:57, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:

> +static int dw_hdmi_qp_cec_init(struct drm_bridge *bridge,
> +                              struct drm_connector *connector)
> +{
> +       struct dw_hdmi_qp *hdmi = dw_hdmi_qp_from_bridge(bridge);
> +       struct dw_hdmi_qp_cec *cec = hdmi->cec;
> +       int ret;
> +
> +       if (cec->irq < 0) {
> +               dev_err(hdmi->dev, "Invalid cec irq: %d\n", cec->irq);
> +               return -EINVAL;
> +       }

There is a bisect break here until patch 4/6 as nothing provides the
CEC IRQ, so the whole connector init will fail.

You should either plumb the IRQ through first, or just make it
optional to retain compatibility.

Cheers,
Daniel

