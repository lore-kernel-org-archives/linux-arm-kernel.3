Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3A8C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 11:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/KCPDNMeea6cvXpnHeNMu1dpiWDklh2TuU8J67WkP9o=; b=AzGLiXWBRn1D0PD/C9iXjmPfs+
	/VISwEX0/mbf/TdYSjgqe8rjfpGl27tKL5ZhvVHkTyDj5lsENYZwMKrIj/zIXt2t52NcCV/qchwTU
	GAsfMZVhqAnQtJWE1X+TVdQdd2MSho91WtGjKjzy0vbY6XuQUb+9pnRmboa26H+uKFL1mFmYqcb5q
	6fS76b0FjtA5QLFjFrKdrFaVKt2HDyeL2lEuJczKTTh+M8vc0YQXfHHFdvv30Mah1WrbsCRDWJ804
	r6p3Jq9g/x0EnmEZ5edqHb7BMvDjH95mapkw5Hn0hKKObbba26Ys5l8lQRolbtsVnRpa5HRZAt++L
	esiinTlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkhv7-0000000CJaG-25o1;
	Wed, 19 Feb 2025 11:07:13 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkhte-0000000CJEW-0TCm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 11:05:43 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e5dab3f37b1so5102805276.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 03:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739963141; x=1740567941; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/KCPDNMeea6cvXpnHeNMu1dpiWDklh2TuU8J67WkP9o=;
        b=j85uVfP/YH9JY1fB0qurVYXPu1r6GAJJRFwyjgY+XWxd6KgPGEYXXELwEVC+BQqnm7
         qB4N2XsI1b+CKItvTx3puT1rbiAYniUi8Zw/UE+dLbLrUgADuENzNvLMuqbEW98QOXuj
         v2G/WQ+uWmNyAJU0AZrADF7Hk62KV9G7Nu7F8RrPSaTeX9sJCeeyTkVydNuzgi+RGFda
         XpV92oWAxLRT3newp2FHsbCLTRJFAlOayJGsiqer5WnqIVM56erSJrzzIPMX/OtWtCeK
         cko0UFuW/fSR+FdPcA3fcLJbiaI81fWQGyUQuQEz6gsgqxHXwbU7CecAPhpahZyKuxLA
         I1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739963141; x=1740567941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/KCPDNMeea6cvXpnHeNMu1dpiWDklh2TuU8J67WkP9o=;
        b=mvWcqg4TsSomtcGPWPSP79i82PEmW3ebaWxrTZAjk4j0dwoU5rj6IFIWFoj7U7XlBs
         ejhXKdBv73+SFgsxCono4AAQT3xgYFpeMQf324r5cjab/OrQYe5osIFYL2EGaX/GyM3w
         ib/swgS8g2hHPyrEu74JUYtAHn7MH7nYpNAtps9wLi6l5GWw/AvZRSAb86SsTatGO5Om
         HQzfNDnVz8rroVn/zZ4dGjAHvtAizUs9/3d5k5AZETDY4pJMyfeHCXsrfE9V65hJohsk
         kgwQ/g/g9aRmnL1Qs5w9wqm+KEX0alZRNYZC0nWsTjEoj1JrPCtgNGmVGMmOroIuOQRc
         GoLQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/VPfJpzDOlJtZROKuA6/hXbot/HyuE/1F1q5ezzvbbkI3mAulkf5ae2rIF45QEES2IsJ9BzubNigCvvhBLyYs@lists.infradead.org
X-Gm-Message-State: AOJu0YxOzHvQ1DELkB5iVC45QcpxcQywOuWcVWs9vBc13HgiIHwRcpeq
	oizt5mGlwDAIzQseS00s0NElf+KoSjj8JlYaDUuY8YoUkSry2RoiDeuAEJHayK4jiK2A1Yl0dN8
	ACu5FTmaKJrRc5fgtojmpwi2aPmk=
X-Gm-Gg: ASbGncuXfTd5QOglWaLxQJgzuK2jhwhl0h0JtJZFAC/BEs/9VU7rzu+L8j7b1A3vuGi
	nj3pltZADNW9ICju2qDN/oDs1Fj1KN2ypgaSMUZz9FhSABeLiRTHwTfkrZv32vV/Mj1l06bPGRw
	==
X-Google-Smtp-Source: AGHT+IFM7nPZ8tuQFLbd7DWBYfyE8wXlNRxQ8AMioKm2MbbUJCJH0PC+2gSNRcWOH4HRbsy98lSWob4Xz3NoErPmn1M=
X-Received: by 2002:a05:6902:2501:b0:e5b:1540:6c7d with SMTP id
 3f1490d57ef6-e5dc9536dbamr15187340276.49.1739963140849; Wed, 19 Feb 2025
 03:05:40 -0800 (PST)
MIME-Version: 1.0
References: <20250219-isp-v1-0-6d3e89b67c31@gmail.com> <20250219-isp-v1-3-6d3e89b67c31@gmail.com>
 <16f6d4a2-2102-48b9-a0ae-b8c6595975b8@kernel.org> <CAMT+MTR7dhtt3SOMg0K3UakJQftqnc2S-rV41HdHtA+o9aSPug@mail.gmail.com>
 <20250219105326.GA31383@pendragon.ideasonboard.com>
In-Reply-To: <20250219105326.GA31383@pendragon.ideasonboard.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 19 Feb 2025 12:05:29 +0100
X-Gm-Features: AWEUYZlUG9hH5el_Nj1wiDJlMQpA-IjzAT88JqmhR0NRl4eaH_UzxL_62EaFLEs
Message-ID: <CAMT+MTToVdm72ovNZ8ySySYe5fT99a0Y6bv02NKxADCBCe+pMQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] media: dt-bindings: Add Apple ISP
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_030542_161662_2896BB3F 
X-CRM114-Status: GOOD (  15.95  )
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

On Wed, 19 Feb 2025 at 11:53, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> >
> > Those are board-specific and not discoverable via the ISP protocol.
>
> But they are settable through the ISP protocol, aren't they ? For
> instance, looking at isp-imx248.dtsi, the first four entries are
>
>         /* 1280x720 */
>         preset0 {
>                 apple,config-index = <0>;
>                 apple,input-size = <1296 736>;
>                 apple,output-size = <1280 720>;
>                 apple,crop = <8 8 1280 720>;
>         };
>
>         /* 960x720 (4:3) */
>         preset1 {
>                 apple,config-index = <0>;
>                 apple,input-size = <1296 736>;
>                 apple,output-size = <960 720>;
>                 apple,crop = <168 8 960 720>;
>         };
>
>         /* 960x540 (16:9) */
>         preset2 {
>                 apple,config-index = <0>;
>                 apple,input-size = <1296 736>;
>                 apple,output-size = <960 540>;
>                 apple,crop = <8 8 1280 720>;
>         };
>
>         /* 640x480 (4:3) */
>         preset3 {
>                 apple,config-index = <0>;
>                 apple,input-size = <1296 736>;
>                 apple,output-size = <640 480>;
>                 apple,crop = <168 8 960 720>;
>         };
>
> But I may be interested in capturing a 640x480 frame with cropping only
> and without scaling, with
>
> input-size = 1296x736
> output-size = 640x480
> crop = (328,128)/640x480
>
> Or I may want my cropped frame to be located in the upper-left corner:
>
> input-size = 1296x736
> output-size = 640x480
> crop = (8,8)/640x480
>
> If I set those parameters through the ISP protocol, won't it work ?
>
> --
> Regards,
>
> Laurent Pinchart

For cropping - you do not want to change those parameters, the sensor
is partially occluded, and the crop area is specified in such a way
to not expose those pixels. As for scaling - we can expose only the 1:1
scale and let userspace deal with it, but it appears that it expects
the other common output sizes to exist.

