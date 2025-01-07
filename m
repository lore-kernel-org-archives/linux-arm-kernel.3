Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F314BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xje32BOdw7wAqN9VcKNPAq9+7Mpm31xiFrYaEG4gc8o=; b=1u2DtjY0LHQO+XQeevGeSSlGqC
	LMhZu1ECaD78MYxWkhpjVjZsxD2nvSCCDLdMwF4ZKk2GAqsH4tnDa9egs/72GNlkpPk2+B89T9H1f
	iJjNfDFB/q7qikmXUDv0dhdUZdL/d9mOoZer7gT+83H7YnXWPh+dfVgVpUPcQCeJ1T2dFzXACMxb2
	k9dl7+nNHsX99X2K8cxWtllLddeWZ6rni+9Ij5bzubyXp8yvSpFYBOdMMRqMfWwFQRa63Sbz5zs/G
	CbJG4mne/uFLoK3M6WWf5XfKmRUjJVDyJKQc3AEdWpBF50VAwHD4KV1k1jiCjSZBZV7XEKLeTZ0U5
	W6e01pYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6yz-00000004Omy-1iuw;
	Tue, 07 Jan 2025 10:38:45 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6xb-00000004OIS-1a9i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 10:37:25 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5401c52000dso17064075e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 02:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736246237; x=1736851037; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xje32BOdw7wAqN9VcKNPAq9+7Mpm31xiFrYaEG4gc8o=;
        b=IgBdRD4oczr+oQ7+LnYzVDG6QAayt8Xo4geIBEkXL+LktKSzaWM2OhaLoJhDHRaamg
         5Ak6zZ4647OHyRQJFRhrcYoKM4Aw/dMdYh0zjVtjfjAIzHIL09QUFgJYFg8o8+UBN1IH
         sXSxOXL//7a9WoXhJvozI1of7o/3fziDE7P9Y73bf6aW8k2tNoLwbJS1DDyNygThaUR+
         2eC+rhyOwGMXdyARMhOknRbGu+oMMdyvAOX1ynlKs0R7lbifSJ5O6f2HxPbm1hFQiouv
         VKYfzO1lUBSVrE2DFZETQ9cInkoCHf6PRE2bC95/7M0B/p/zmroNun0lBhYPT9NqXxb1
         Bapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736246237; x=1736851037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xje32BOdw7wAqN9VcKNPAq9+7Mpm31xiFrYaEG4gc8o=;
        b=TGatUYqzILncANbIPddgF2Z2lBUFMeV1cM+cMD4nQ4Gwz6PUuXRUVR0B1SXfWd9RHz
         ZSbwofP+sFjukdLiu43B4D1VVRpMQaDCBFbPGk07eq0BCkQ0xG211jUC/SfK7WR3s5Vp
         VN0sMCBt162gc8KVt3tY05891vMPRFFHcrofTKfaRhAENCUun0pyBLBeOo5+H4yHDNMS
         6XAEKv2xnpsqN7bT6M3ZKUHLWZTZdyzR1XEwjKnzHdskowsBz2a4Yiq2mWQkfCY2SdUp
         b09IwEKDRX2uMUwxCePRQHqBZsybGZXdmGhKrCBmRLRJfzGdBBeeTbNYb6AtkrFeXMlK
         Owuw==
X-Forwarded-Encrypted: i=1; AJvYcCVHNnMy2QQ93XOJ8JFciUmR7HAxXDYS/MQwTFSjvZMXBzwomfkgYE5HJN6lyCkTgr551qiKDr5u6uNXgeX/NUda@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq/Y5vuRUIgQ8qyXKoBtOh/HDBsXCN8lmW5HYVkH1gCFiqXQtX
	S1TvI6RvGoJiY7lZKhHXQvmAiuLHmL136WR/RACFtTPjebomKRTz9KL8LJ0vmhZxZphMa/fNVPf
	PQhBx64bJM2vHkHZzJ46R2vHCRng=
X-Gm-Gg: ASbGncv1hYYqcSu0pjm2M2lQO4AH3MdWE8usY2e10mlF6jXbHkf7pJX8IbsJv09E+uW
	EondmHLW4quR843dW6aXT7z5bmlyNuKRJ0CCeNy/TTzbRWLdGzvvjDw/SumORYzkpGFFurg==
X-Google-Smtp-Source: AGHT+IHS3njRhHL7YfFO0iWHF22sHLsH5C52QKY9UxYlGlYE//joyWAtO538qgeg1ERJpfJproNazJyxMl4X57hOWEc=
X-Received: by 2002:a05:6512:1110:b0:540:75d3:95c0 with SMTP id
 2adb3069b0e04-5422956b7cfmr16752741e87.47.1736246237133; Tue, 07 Jan 2025
 02:37:17 -0800 (PST)
MIME-Version: 1.0
References: <20250107094943.518474-1-alexander.stein@ew.tq-group.com> <20250107094943.518474-2-alexander.stein@ew.tq-group.com>
In-Reply-To: <20250107094943.518474-2-alexander.stein@ew.tq-group.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 7 Jan 2025 07:37:05 -0300
X-Gm-Features: AbW1kvZdLxR4RaObsuUJc1Glb-jI0wjh8lFemgvwEzpoXOeKA2MO9ZmwnSRVm90
Message-ID: <CAOMZO5Csc+cOmOaRofWZW7Z9HL6d2NjMhZUdcomuyS_rtZwz0w@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: imx7s: Move csi-mux to below root
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_023719_427098_8E5853F6 
X-CRM114-Status: UNSURE (   9.53  )
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

On Tue, Jan 7, 2025 at 6:50=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> fsl,imx-iomuxc-gpr.yaml only contains the mux-controller but the actual
> video-mux is not part of it. So move it below root node.
> Fixes the dtbs_check warning:
> arch/arm/boot/dts/nxp/imx/imx7s-mba7.dtb: iomuxc-gpr@30340000: 'csi-mux' =
does not match any of the regexes: 'pinctrl-[0-9]+'
>   from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-g=
pr.yaml#
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>

