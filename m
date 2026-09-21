Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD15C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/tDLQ7kiHFPBmC66BABbwtjlpncgEgg8G3PARGPN7c=; b=TrTLAK2X2qM2vTkAGp5Kig4c96
	AJI9TyDgl8ZP18xQP+0b+5PkkPQ23sUzIbzSuZHZ5IkEaKMOPYdgEvYFafB4f8Yt07JttSpbmOyfE
	FBpwSn4VE4ZXqdnsZH+kn2TwVqPuZWlanltTX3488pomVmwOzYjpPniBdCbSAOAWIpPqIp5n2kwRA
	bzV/aFRQbcR3lim9jAUM/whLIgJU/3q1s7LI1sCy5BKKDIw9aGi/KjaFPgzSdN1xSth9juhwxd2mO
	My+VC1Ha6M2djM8s29P6uqQL1ysZpcUyZTaMRNH1iIODuVPnDOSqXfsW+5ajVNVOx9vB7geIAUjl+
	wQLw0xMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bO2-00000001iPy-1wLp;
	Mon, 21 Sep 2026 10:36:38 +0000
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bNz-00000001iOv-1j0k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 10:36:36 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a6056be4d1so1925889a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 03:36:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789986993; cv=none;
        d=google.com; s=arc-20260327;
        b=phh7/s5WfeBlDLQHQv0ienFweS4rsSu0vj5YaC+JAAPW3mUtDZ0jOoLKb1wxak3FFo
         UNVRIsY/E1Oe8Q0GUeCZacgIQJPGIRzowmUKMgTTSHaRtoHKTjDq3RpESwEsk54nmMDl
         KC7mjm8sLPpPyD3SIRuRoP+yIrdhcSLHlGV0PGNHPv7WQRSKwls7L6xdN1rCK0eKqe2o
         pFml11iUzW1t1kF5CyM9cYtzwtQvy3iO00P9x5mWuLR0gtaCyZgzZcOsfBUpkufkhEWE
         gAjbpuH8Mm3Mbl8jgoKRjSz3yA2dGooNgobW2gXBSr1Un+ekaqPc8Gh7H02d3VhBH9Vv
         AKGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=h/tDLQ7kiHFPBmC66BABbwtjlpncgEgg8G3PARGPN7c=;
        fh=qyX0M2W2c13ZTUYPlFVZYUOKXKaWqh1oDD0wbWvY9rM=;
        b=iVmZcn9/r7Ug74Rp5R6MtbqfOf4+Lf9JhPru9+E7Xr4hYpdXy9+v/X1/k8+zWim6hc
         SZYonjQ54TifYqnbNDEeR3EyBvaV5qp8rac5vFRSano0lo5NG80pJP6qRg2bmiDTeJLb
         oW84MmgoPwctq2aX5wJ6L3RlyGXdwmBmszn5v0KOjB3S/KeBn95mUSb9GWI8AVKi3yCp
         TXEhUFOI4rb5Hj7vcCflco8qA9dineRTndvh0tq4tCFGz/26CPpF6wfqlqyIt+PE9Jg4
         UIow++XVcDevQx/Xdkpua/OVjkUG07GgCvG+WHiqsG2iFwINrfAN09GtMli3osfE0QHm
         Ghmg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986993; x=1790591793; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/tDLQ7kiHFPBmC66BABbwtjlpncgEgg8G3PARGPN7c=;
        b=E7oKYJCeNtTBjp38YI9ujQoKaSxxb/P/2mrMWbJkOKMgjxr9dOovteyixAFl+y9Rzh
         ix59L5e6LviBF4Q8FmXttNMAXL1ntZfhODdAt3lhQMFrHjyOIgWGhBxN5ALZX4rEYu7O
         3HltHGNlfeOLNUFfGHOGNYDa/ATnShKdZy19C64zAzteNMgaJwj0FKGViNK1UGeEDCpq
         PuMpsoDFA6adu0YBuUEPXpOzldi94HUVu0C+N8Q/BssTAh/FLycX4nCiA+qRCjre+t6z
         Rn7GuO/AhYSoX7F9UdrmMZsbidTgG3NegnzvYXswekWsb1zQ1Ix2X047n9vc4QtvBpGu
         qz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986993; x=1790591793;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h/tDLQ7kiHFPBmC66BABbwtjlpncgEgg8G3PARGPN7c=;
        b=rNlJ2OOmy+hW8qBn8hzm3h8JXyf9J2e1squiOufJKkmflO0gOJb3R9bRYQ8H/yWCk4
         9UAXzgssn5G04wfRPIB2sU+d0s9PNheSAo4bZp2771iWPuY0A4it+NRcGjzcSLVOdlKn
         MjTKMGHFOKhlFl0JUdZxw7QOclrVfRohbDfqgeJmFxDvOf4OfAehXiKmR8O5OPOwPzP5
         K3mB0uj7+yY4OWxy+bRACjimwIsuyxB+4rccVdPsSw48J5NBlsc+rPRk9Lp6gkbLueU9
         VRr55b74D7xhpShqfjFejXAN+EBBUCHmypmDsHynu6EB8nH3RpmX6PCOzB8S88TOqej3
         EdBQ==
X-Forwarded-Encrypted: i=1; AKwUvBybVbnxzxgYgtUWZxzwGsH7o+vtEIsYhfooVnRq5/ulYTcuJAl6PGiEYFLZd1P6JWJEDXpyeoxgOBsu2ajVACqz@lists.infradead.org
X-Gm-Message-State: AFuF++m1Zuw7SIMTVJbvQvR7lvZ8M6c0eSiLc34qtHVgGZZvuXv4H2v4
	GMRT2aN4AUdCDY/D5E+O9B5rsX31I4fjJKPc/dORVUlsD8M/c1Me2+GOELwZmkaftgt+sEcAG8Y
	fjuWqRpwasiH6RfYXjMySPy569ejdkig=
X-Gm-Gg: AYBFou1FSKiqrAo5wFoL2FybF6rVnJvRkcoi7bEPXqIrlVXYgvH6RJu2oVv9b+h+/E7
	6X19xkZFVWrq8lyJnKPZtSS7/A37ybYCjo4XXL/E0peShmvdnsRpp/umUX2tJ5CapVJyzdNvpYc
	r+Wa4TznrmT2HI9qnUjIJfyi3LJibrcdqW/Ebf7dBTEXFnk+4OCiliVBtBv+mTJww1TNNVorJJx
	MEz7HgHnHwmIMqH16kGkpe647f5kPsdnYKTd9I6GArS4vrsBbd5pI13NUaNaDMIYQrwPFe1edXk
	c+7Hpb6UDOj6vIFgxtrf8njQ222VT6BzIQAFWQZg07SRe5q9SF+mEg==
X-Received: by 2002:a05:6402:4547:b0:6a9:f88b:14dd with SMTP id
 4fb4d7f45d1cf-6aa4f97d7cfmr6238277a12.1.1789986992392; Mon, 21 Sep 2026
 03:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260918175736.355305-1-l.scorcia@gmail.com> <178998607025.21155.9680834242820851509.b4-ty@b4>
In-Reply-To: <178998607025.21155.9680834242820851509.b4-ty@b4>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 21 Sep 2026 12:36:20 +0200
X-Gm-Features: AcwNN1VQ6S9fCy63ty823Nyxcerwh9XF-bIr0lhnPcmyyBWQe3Ulp9EvTrhD9Cw
Message-ID: <CAORyz2+E9LY+6sb+0G-deR8ZVZK_xu+p_hvp8aKteVVhHpeBRQ@mail.gmail.com>
Subject: Re: (subset) [PATCH 0/4] Add support for the mt8167 display pipeline
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_033635_457905_4DFFF556 
X-CRM114-Status: UNSURE (   8.66  )
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

> Applied to v7.3-next/soc, thanks!
>
> [3/4] soc: mediatek: mt8167-mmsys: add routes for all display paths
>       commit: ae0968038f994d6e275f5dc94a27325ee751fe58

I'm sorry Angelo, please revert this - I'll post a v2 with the
corrections spotted by Sashiko [1] later today.
Thank you

[1] https://lore.kernel.org/linux-mediatek/CAORyz2KEfzcJ_2AphkPU6o-YhLAqudCXVdY+LDoynUx_FsTMJg@mail.gmail.com/
--
Luca Leonardo Scorcia
l.scorcia@gmail.com

