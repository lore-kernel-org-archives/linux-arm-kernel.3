Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34D5D767D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 15:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kq/ZfQo178WpGnp7avIFwOb49kRFsd7BrjOS/dXjIo=; b=3GQVBJsJDupvGRkRtAQ/T2fp+C
	x+yDk81/QsvFOElAetsduoz+ZzH062mv7PA1DrZ0efOH5qYle1IPiITTOvo5dCk6+OFYZfJAzwnap
	CMCXJF7OH+oqgd/SN3ZiAsj5ELz+aT7glP4mcgiYXXeC2yes7fI8EqOv7vEAlbr6ZFLIMdDNI+Pbx
	jnire7WbRT72NCkXP34Ck+GaYrTOimB7J6bz9T0f+7I+5zE5k9FnIsZKca/iPpN24axicqQhWAI2n
	Xz1zQh2AUg3mBPjqfA1ouHjIo1Yb4/ws0IiuT0E4uBWuU94/4rfWfq/1D63u2UZwtpsGGiH4LC27W
	l0k3stGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6XQp-000000045Mi-0Tib;
	Thu, 31 Oct 2024 15:49:55 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Wr5-00000003w2t-2HSo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:13:00 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-6ea1407e978so9287397b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730387578; x=1730992378; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3kq/ZfQo178WpGnp7avIFwOb49kRFsd7BrjOS/dXjIo=;
        b=cgCKpn5JKwd0DcHxZyHqwiD9+ew9+yrcEWbqTJvkTMxA8klo61OpwRaq1+rH8eyEKG
         Eds0tkQwKbRWR7MCtu+5slMa94syLx9ehSRTf/T07b1zmRWVfuNuZtsJ48a/48DQAYLY
         jfHim2+nD69W8V1ZYzC5CPJfIfr0BXo635giQKAeJ8CmOTwydqqiIo8Oxq5OA4U2QWyl
         Uq5LHto+ZCtXZDx/B57i8+XsZnAA1Ry5mOJ+iRc9SRAOVIZX9F57qQOOQzVfDv+NaXp/
         IJgWxmtCw4Q5boFITg7Pf6XwNJVQ/E441/xmnRuVj26V0BsFoBmV/hru0YM3hLOhMC8m
         FyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730387578; x=1730992378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3kq/ZfQo178WpGnp7avIFwOb49kRFsd7BrjOS/dXjIo=;
        b=dfBYb5MOwBIjs3W3ENS3Vhpiyqt8ZY8UlEu1lS42APFAw9CdPE2m/NhFwimpZrnMOb
         8Wlc2rH2Y/T2jwgz0N+pwGaWt2yDc8xsmIPMCk9W1dWZCYQAzqBV88q10UtceqQ7qzjW
         O/W1IvbYXtqOCI22gv2AfYofnPxPnILvp/3bwTr8/Mj2UgogA2pz1dF86fBXhuSA7DiD
         oaISqdHItmWlNs/XFDH/Yb8P9WJYndGGn8nX6g3zQJlFjocQPJmNqRiOQkwwsZbW69yl
         u7oqlcGKP61tERFQJFeD6oSM5/OTQao6qdVG7YWmOE5APvID0MTP1j5nszriGgjZVok7
         iEDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiJMrGHu5H/RAFXPVhoXYJedmYzDNyVge0Dz+N4DOOt8AIcGVBcQzy2Hq395f4D+JBZOWEjWxD7e/q35yuiq79@lists.infradead.org
X-Gm-Message-State: AOJu0YzCxDggyQpKQ8aHrwWyTLpsk55IagEQaMoisj2Pa8lLOEcES1l5
	t9m0TiGblZuJZTOLRUA7DOJ5tXu4dg8zNjL4z32uP8AhJTCu+74XNSwh0TLyLAr5ZG+xGC5kf3N
	Rv5rTwtW2P+NCNpvHlekMaHe+R3J7HsC3/4rNFQ==
X-Google-Smtp-Source: AGHT+IGlMNJu4DDdD/Y1Axdwvh3uw+1T8q9MjgGCDRsqTJLHxT7tV2PbJ7zg2vq/LGfZxClDt4ZTbCxoj+EvkACSNbE=
X-Received: by 2002:a05:690c:380a:b0:6ea:4d3f:df9d with SMTP id
 00721157ae682-6ea64a8d45bmr3072217b3.4.1730387577820; Thu, 31 Oct 2024
 08:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-6-4cfb96d779ae@quicinc.com>
 <zsgdwc6klccdbytdysgl342zllgmb7ttatjh4tnug3unyl7vl3@tlptei23yozn> <1eaa1fc6-721c-46fd-bcc8-9b575d083dea@quicinc.com>
In-Reply-To: <1eaa1fc6-721c-46fd-bcc8-9b575d083dea@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Oct 2024 17:12:53 +0200
Message-ID: <CAA8EJprhyBpEyQYjCPopgEUVGF3ztGZ_6zo-QUPJ6=4VffEzZQ@mail.gmail.com>
Subject: Re: [PATCH 06/11] clk: qcom: dispcc-qcs615: Add QCS615 display clock
 controller driver
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Stephen Boyd <sboyd@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_081259_609318_8060B4CD 
X-CRM114-Status: GOOD (  12.70  )
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

On Wed, 30 Oct 2024 at 19:59, Taniya Das <quic_tdas@quicinc.com> wrote:
>
>
>
> On 10/19/2024 1:55 AM, Dmitry Baryshkov wrote:
> >> #include "common.h"
> >> +#include "gdsc.h"
> >> +#include "reset.h"
> >> +
> >> +enum {
> >> +    DT_BI_TCXO,
> >> +    DT_GPLL0,
> >> +    DT_DSI0_PHY_PLL_OUT_BYTECLK,
> >> +    DT_DSI0_PHY_PLL_OUT_DSICLK,
> >> +    DT_DSI1_PHY_PLL_OUT_DSICLK,
> > Is there a DSI 1 PLL on this platform?
>
> As per the design of the clock controller it has a DSI1 port.

It's just surprising to have the DSI1 DSICLK and not the BYTECLK. But
if you say so, it's fine.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

