Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB31106ACE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 20:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TE8SfkVbVBBUM4eryiGIysgS23QgsEj7qFxF34WfEmM=; b=DqG6rUE73Kfg7fhPlOKsi/+3n6
	/a7BRc/nvoUgscjSVkl9eeogckD7Gn/AkNFEszU2AS+a5liVYj3ne9mcr3ZH655ncZ7xXIbgMlaSz
	nXBnu8JrOy1HBN4OAoeoB4X8sJ/rg2hxlTzAy0g4o5otOa52AMYKZ2yzO4ZJH53A/FnPZbF7lIhuH
	QK+OG+36Tmsv2Mc1cdqmNpbJB6BiEp/JAQM6s7EzkMpZfZ2SmOobIu4BsjwcLG2m4CD478GzrgLGm
	kLIjVdSG+4E2cppjONTAd+HPpBia8PMQDm7WzqXO57R+esOquD3CsDG/AX395JyNpmcAHkt5FqYaQ
	5X7DdY9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mJV-0000000FDYu-1qqJ;
	Thu, 12 Mar 2026 20:07:21 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mJN-0000000FDUh-1ruk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 20:07:14 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-467161c4b89so907302b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 13:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773346032; x=1773950832; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TE8SfkVbVBBUM4eryiGIysgS23QgsEj7qFxF34WfEmM=;
        b=T/FG2qwVb74PA99SfIKZYPEV2HFSfR4PMDFkJgLdWwr/p63jaDxpZIsXj1lUy6BQug
         31Rk2z0Bn3lJ/q5u2ytrJdI9SZ41BsEzfob8mePdD5rk+BuTJpZ3hmigVrSZ47kkZiaG
         GFrM0/jmOQBmY26RM7K7Ki2YzZR07KZZNhzIOHUXDKg0PcK0wXJyUumpNX+hB2pB+G3A
         PNeFauBonN45qz3sODQn8JwSiNTVjGaD3HkAHOq83Be/9qL4FEV/zsL8wLXxEU1738Tz
         VL/5q6RykpuBL0wVpt/c513+DhoFIbXRTVSxp5Ax+JhKc0tuxxcS3gczX8gY0svPPqdb
         3QIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773346032; x=1773950832;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TE8SfkVbVBBUM4eryiGIysgS23QgsEj7qFxF34WfEmM=;
        b=qOaHNe/lQVUckeP2mn0uJukcV78Iktp7W934yOU8grEXlDeWpnLeCREJnvV/dpqfVv
         VaH00IyJ5GyM0J7LSqfUPKm1Y17CJCVY2zhV+HapmuSxD9Pqk/9ANIl8QjVLArcAXvTS
         WdgdihwKnMhAvEp/s3PXppnu0q7+03PKUkQDdnJ2sL0/3Tt1LKfgo9eNM8FdymjsMy6+
         vjB3hPeh8n00Z+gL3QuO3Th0E3nXi49oFzMGtqoZsUkdFkqnGl/wCGk4HpgCSsSJBVWh
         g7HaHBDzMMgABGq44qW88DV30o8HMSiyLEzgLB/Ul2dFnBJWJNF4/FtgLHVX6LLx7UW8
         F6Gg==
X-Forwarded-Encrypted: i=1; AJvYcCW9M4yk5+F2z6IXtAVelTkKT55Lit7gUWFQGDh4OzkfZCRAWcNDoVX8VFZMn0/ySbO7YBSxOqDM9kWsDIrtVr+k@lists.infradead.org
X-Gm-Message-State: AOJu0Yyis86nBJw5EJm5UCZqnB65Q8v954W81IcKvfDpl7/sACijmZBb
	yGepo3778E67KIRTMAB+2hjrgkiBbmf2+ziFP9ZqltltFBBoOMjkDQA/+jS2t9qjT0E=
X-Gm-Gg: ATEYQzxwgdbuW3fA9x2/FVuP1Yp+mlawVSIfiFTNa/ynw/1IRV7Kl9NupGHS7UHd1nH
	JTkTFM2tcRvO/mHQ7XUpWN5lQ3IiRa2UfvtLowYppRfH4DLFye0Boc5ZchkfBU3x2Adi41SrIEH
	xqH++P3o8GGRwsWfWHPugukRFvv/TannIWYeozhlIlHS2Ke64QpND8WrChBor2pJE6sbHmFDWIR
	5Kg3P5BQ2pOhjHrYG/mUwEWLRO+eQUWdU8xH7kfFZB8AhfKCOrrS4Ep3ZDxfAlG6j2/OYzYuO7m
	dbGq2t1OR+1ghHCsu4B7EMRqQ19ZVeOM/JDC+aPod1A1SKZMn+ye9qyRSuU20EAbQvTeRoAhi1R
	yhdnx2WuY22WofW9GjrhcDWbeg1O3/l5OAItMlV3Ky8W9OXfkQ0hemIyykTF5LdD0QHSK5g3iJ3
	FBEkeXc930jir8X+matTWTj/N0EY7r69nMbfYnFt0=
X-Received: by 2002:a05:6808:86a4:b0:467:2584:873f with SMTP id 5614622812f47-467575432eamr241621b6e.40.1773346032433;
        Thu, 12 Mar 2026 13:07:12 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:1f95:f82e:8747:8137])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e6c7885sm5600081fac.17.2026.03.12.13.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 13:07:12 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 15/18] clk: mediatek: Add MT8189 dispsys clock
 support
From: David Lechner <dlechner@baylibre.com>
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com, 
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
In-Reply-To: <20260309120512.3624804-16-irving-ch.lin@mediatek.com>
References: <20260309120512.3624804-1-irving-ch.lin@mediatek.com>
 <20260309120512.3624804-16-irving-ch.lin@mediatek.com>
Date: Thu, 12 Mar 2026 15:06:36 -0500
Message-Id: <177334599652.4124794.12067751220383417571@freyr>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=622; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=CMNpkQG0OX1ZmIY4eNoRhc5pN1fKRttQ1DPPmQGZ5Ok=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpsxzklpGpUf/ZQQIyqz1DGbRxkAj3JX3gj9Fst
 kHYKcWEcLiJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCabMc5AAKCRDCzCAB/wGP
 wAB9B/0amsj5mtHGl7JwYJ4m/8bCDd5vMrY9EYIYFmV67HC/3VsGnfj1wPsBIVVvEBbRl+IhIIA
 ZsVi+f/fEjvU6prplQZ/YZd8np1yTT1IWdeKgbGDDKpmhj+ay9gbv30oTZ7hntcUeH8jUMJrP/q
 tZU8uftAxgDKfME+lIWGswpoBwlUSOzobxeouycG+WNAHOkJA6P9MGeEtvRIK+FKpHbvhe8km04
 Ox8e94DXUVshX9UMS9lDnF5G0nMYaWHn1RibGjXUQ/s0dnAAbbdC5p20fdx+NRF7/D6TTyYAO4N
 AauC6vpKcGuJ+POQeLop+wx9WdMiq97CgGUQthHxIRLRvwFx
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_130713_494097_B47406C7 
X-CRM114-Status: UNSURE (   9.76  )
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

On Mon, 09 Mar 2026 20:04:57 +0800, irving.ch.lin <irving-ch.lin@mediatek.com> wrote:
> Add support for the MT8189 dispsys clock controller,
> which provides clock gate control for display system.
> 

...

> +	GATE_MM0(CLK_MMSYS_0_DISP_DVO, "mmsys_0_disp_dvo", "disp0_sel", 20),
> +	GATE_MM0(CLK_MMSYS_0_DISP_DSI0, "mmsys_0_CLK0", "disp0_sel", 21),

Why the random CAPS here? Seems like the name should be "mmsys_0_disp_dsi0"
instead of "mmsys_0_CLK0".

> +	/* MM1 */
> +	GATE_MM1(CLK_MMSYS_1_DISP_DSI0, "mmsys_1_CLK0", "dsi_occ_sel", 0),

Similar case here.

-- 
David Lechner <dlechner@baylibre.com>

