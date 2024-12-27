Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A369FE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 13:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAXFsxzlonOLXIwCn7fwLxpEOxOZpKttSBYOZ0M8BhA=; b=nzdYIeohq1Wpk6r3V9xxtUIC7d
	MjE98oXZepozURNdexVRIXFC51fTmOQmfnGitBqejGEeh7LtYx/TaiGQIQNDqleetnGd7WmK2bDR4
	faDKV2egvTTCQq2xDP8tCnG3B1VZ6tQtmE/vl55P1U18KscrEO+2TPcNvmIgyJmYYanl0HmM9kGNH
	vp8jvPXARh8OK0amLoimhOi2nXU+SHv/bGn+deej0fy0lnzwyLkcbxS9XrCKzUMm3fSDD6RyBSUKx
	R5Q33pi0HSKIjIyiFQxcJ9pONyiDGlTrErQOahijX4qdJfStbbkHPy7eWB6gn6U2ekcWBjsqRXdAd
	CZ8pNnwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRAJg-00000000HWJ-09up;
	Fri, 27 Dec 2024 13:23:48 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRADx-00000000Ga0-3pAA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 13:17:55 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2ef760a1001so8710653a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 05:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20230601.gappssmtp.com; s=20230601; t=1735305473; x=1735910273; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iAXFsxzlonOLXIwCn7fwLxpEOxOZpKttSBYOZ0M8BhA=;
        b=qKNZinq8Aq4CYQ3U9ybnT6hLHULy1rzZXcwFrl7IKgvv2gD0pTdT3ujMuqTPkyaKl/
         w7t8w7fGN8QlEntisLolhlDDS1qP/s76lMMTeH+VjyG1KRvbNQhEaWQSdKtiupKNKThB
         g4FyZ8JlKfxUkrnp8J2zctbU4xyiHCLpagGvGUZNvSOyUJRXKrI86AQu5NvHP1bsEGvv
         tru15Gbo5p8VYEOvyGIt/5ePq6461DmU1vR7h902vYRgfboqr/ZqXiufTnhbhPWiZ28Z
         KVd+YM8kZkEetObFxW3pjscI5SaiTAHwfBztUl28Ryl6qiK3gYmt4ZJyn45y1V9dKCOD
         tp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735305473; x=1735910273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iAXFsxzlonOLXIwCn7fwLxpEOxOZpKttSBYOZ0M8BhA=;
        b=JTNn0IKhR4+MIOR3c3LyoEuupHYH0MCwvlMI6P1q6fLetmOfckXe3MSSQ64Axa8oaR
         dStFXLtYRZoNWpgmraWTXNannQihPjCTlQgxtXyh351f5b1CdKHQ+oIAmaalvGfkX0wq
         aqkBkHUm0znGfIfCdiQgdZM1W6chpnQTORPnYJcLOfug+tZNfm/jVF1XvC/KbNqw7ZHI
         wjBJ/ahSinR33lmvS8o8RpO7b8cdT7SkkN4FUADdhDdj/rBPsF32V/Aqdl8eD+7FSX+5
         3f0ShRZfY+lvNhbuIrVwEEYpxROuIiGRNf/ByEszVmeGJGqFjo8Zy6YewaW38j97+gTy
         T5kA==
X-Forwarded-Encrypted: i=1; AJvYcCV/L6GyX3cItmi0OzH6vXzyK8/fP05hhCfLOM5uFr+76MI+POldRW2utWDbU5wKvbgy5F8sWH51aYdBi+UwHpm+@lists.infradead.org
X-Gm-Message-State: AOJu0YwB8w88js6GOtgoro5lqD1KKenLckVvewQ5rIZW2skISwVwp3O2
	daulI1w2fH6gV9aDYdsgiOkdh9v+MR+Iyy1knlgOcZCdIkMcC2P7SLOEzg8n9nR9kuHL87R2zfy
	BrgmnuYMq+7CYyjIlrpnwWalZLPPU7UA2I1PSzg==
X-Gm-Gg: ASbGncvJhlkxF1LU0cmNAK86m2q1m4HtGi2bsHd0bltteid2r+KTJuSln/QuMPK9XkQ
	mmXACvXDjFixMtaw6bPp6mXO9wzA+CXztzOqU
X-Google-Smtp-Source: AGHT+IGJXNWgYAZk4yTpptTSbNQn9IKrdlEA0Qzrr4v2C2qdF2+VE2NVca0nGnqFhl/5SkEJUK38o98Ip0n+fUXbfnQ=
X-Received: by 2002:a17:90a:da8e:b0:2ea:712d:9a82 with SMTP id
 98e67ed59e1d1-2f452ec6fadmr40836147a91.29.1735305472878; Fri, 27 Dec 2024
 05:17:52 -0800 (PST)
MIME-Version: 1.0
References: <20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com> <20241211-rk3588-hdmi1-v2-2-02cdca22ff68@collabora.com>
In-Reply-To: <20241211-rk3588-hdmi1-v2-2-02cdca22ff68@collabora.com>
From: Jagan Teki <jagan@edgeble.ai>
Date: Fri, 27 Dec 2024 18:47:41 +0530
Message-ID: <CA+VMnFzJumtLmhFxNt8Mjzju7nC6wMWn2zDwpiRg3CEULRzDyA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: rockchip: Add PHY node for HDMI1 TX
 port on RK3588
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre ARNOUD <aarnoud@me.com>, kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_051754_217401_9B7284AA 
X-CRM114-Status: UNSURE (   9.58  )
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

On Wed, 11 Dec 2024 at 04:37, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> In preparation to enable the second HDMI output port found on RK3588
> SoC, add the related PHY node.  This requires a GRF, hence add the
> dependent node as well.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---

Tested-by: Jagan Teki <jagan@edgeble.ai> # edgeble-6tops-modules

