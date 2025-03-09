Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF9BC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 09:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wS4IhIBI1yx2mGgdeLumrUYH4CZGsZF+Y3g2R+4QCNM=; b=KHxhyBJ3SKouqbylb99o5RyDs2
	q/cj1cvOcpgyi38YCvQXKnaFUqRR1DzZRftKiUxnfcMCqgrsY3+Q2aq9k4EFLOSfaDERbisokLZFA
	/Vw+b8+fV3pWqHG0jHD+OpkLiEH1EIJqi5y9LlmSMuMYRIdDMZWC9shh6KAXM9LAo7ksITRDhZEHg
	7x7oXAqw0y/jGIiu8TPbzd1glFFbGDLvJQkZxIu9FzrAnKTIR0DVTK07IH3rkcTfQYrL9v/2rylb3
	BATTK00an/78c+Lw84X/y1O7j+Z+o060+b16MBTlR3xj5XRDxFp4PJC1+/TR6FymS/OpKyjM9M9O8
	6LQaUyEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trCqm-00000000GtB-2MWU;
	Sun, 09 Mar 2025 09:21:36 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trCni-00000000GNo-3B4y
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 09:18:28 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e6341e4d0b4so3121269276.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 01:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741511905; x=1742116705; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wS4IhIBI1yx2mGgdeLumrUYH4CZGsZF+Y3g2R+4QCNM=;
        b=RAH2jFgkVu62N8oTRlyx05CTRknJ2ENS5SSRa3MLnXWYvYOoW6iyPJj2HLKJ1IcR+U
         PRPUwxkbPXDtIGoeA/Ou3rk0M/nS3mKAcErE0RdLY97ZOjyoy1YAiC/x+Sn4nz0YOMlK
         4vz5uvM8+qZmqlQKn/vlc1mPg3hspk7QIod/2GjKXSW2ORyxMYMvuaWqKUeKRan+bdlv
         tz8NXBum+839/amWka+NAkeLzWk+RsEXGkvHHPScTqovSTB7NZDUf9i4s4KuVgbntHRE
         OTrxF/N7j/7Jqe8RMsjavdt8t5QJOoUPPZdPSKYSmL20kGv75efifIc5gaR8p5xzdG6a
         j00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741511905; x=1742116705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wS4IhIBI1yx2mGgdeLumrUYH4CZGsZF+Y3g2R+4QCNM=;
        b=QWJirzrbeeJ256wxgws0LL9U1nKTdrwYFeE3L5SqXkKDPl0i4zXzrFEuC43OnhZDNY
         s9ztaBtEO1iHBAoSIY2AuuZX5QUO6IJW5cvInHXw06NU7EGxajAzJO+0trS9YpcQ3Ru9
         lA4j60dWHVWdHO8VawDIxTcBAgg5oY4DCmfiS2Sq9xEIcJzPQypIsUdPvGBsIUs8kDZ3
         AG9Ir+1oi3d8DfC5esbqcI2QhdyzRqRhyRMXYKUcNI6PD484Rf2y7sDrcVDZAdj5Q3Jt
         0RXwTSY40YbgDFG5kAMJ5Ay6nJSq+WtKvHcpH37fWeAkip+k4m/ep9bdzdH/8lmt6YJ1
         D/AA==
X-Forwarded-Encrypted: i=1; AJvYcCWCVEtT3hNmyhia8R9Kcw2XNPprTVzUJm9NthSzzdrs2gQBd7c+5tLk4kWCtgzMPAC/crvnmS9Ec9SRqFbGlfJd@lists.infradead.org
X-Gm-Message-State: AOJu0YwZfJ6nbVtM35u6jRbnjhNyFgkDj+ujqkj7ePILa18CkPbAAmRm
	ix8Y7f+y9/Ol5iDmEVI+1nBDROD2ik7ULBkoKatB3QUt7w60BJi06Ji9L3bVVpp4vTJsefxvB+W
	m+uERZ4Dr7HgFg+uEjAk+g0HlIFSknr98xxWvmg==
X-Gm-Gg: ASbGncvuRMTCt+ZDKjkvGc2V2vrJKXLBJxP8G/KTK7KQ3Tca3nFitMS4uhKXjHhR5ng
	mT7fD7Gn4eO1f6q6brj6t5b1RX11aBTJgPyCAkMPTtfpuWUg9FoeDrp9BumutX24bL9L3UVX3LV
	H4L7GlMkWWXH5eLYHfR14dYs6tTW+LK9adUCEzjzwNv1aOt9bPIec=
X-Google-Smtp-Source: AGHT+IHmsF91K1D6VLx4YvpkoZQQE1k1xzhlV0FUEYyz+Ynn23igUj9beuV6WExyljR4D+jdGEc0UrQaoLqBGQ5Y8I4=
X-Received: by 2002:a5b:f4f:0:b0:e63:7084:fc01 with SMTP id
 3f1490d57ef6-e637084fc04mr5253669276.0.1741511905671; Sun, 09 Mar 2025
 01:18:25 -0800 (PST)
MIME-Version: 1.0
References: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com> <20250308-phy-sam-hdptx-bpc-v5-4-35087287f9d1@collabora.com>
In-Reply-To: <20250308-phy-sam-hdptx-bpc-v5-4-35087287f9d1@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 9 Mar 2025 11:18:14 +0200
X-Gm-Features: AQ5f1JqwlpVv48DTqejukDRuK53dcVgbu-cHC1EtLzGRaEU0x0TorpoDNNMztSM
Message-ID: <CAA8EJpo0073Ub-WNdQoAq0=Zvet8M9aan3e6v9cnKORCTkqMKw@mail.gmail.com>
Subject: Re: [PATCH v5 04/12] phy: rockchip: samsung-hdptx: Drop unused struct lcpll_config
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
	Sandor Yu <Sandor.yu@nxp.com>, Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_011826_797061_EA1A0707 
X-CRM114-Status: UNSURE (   9.52  )
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

On Sat, 8 Mar 2025 at 14:21, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> This is just a leftover from downstream support for HDMI 2.1.
> Remove the unused struct for now.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 31 -----------------------
>  1 file changed, 31 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

