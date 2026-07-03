Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5D2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 00:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DBT8QbiXPV791Ei75jZRE+bdrb5rv+oRxEtX04MEBMM=; b=JekHvsnu6tQZPGklm+S/XPaKYX
	1MhsRi9jusUHowOxbOzmzVN5i8gOQBzTZQNWTXrapAhtYe77YHonajGX4kCsVbBm+V3H7oL1fDo68
	UVb25NTcGJI6US7F9rek+8yFaR+q2ivt9KVyyuZGh0S9Y3W+Bf1pKRHo8jumGj2CjbIxI6u8MRj9V
	ppFZTSbAQOD4bSxGbk9l1rUc5AhrPVmRbfSXZAS7T+G+aHR5IyGpcdkux9v94rCZxczAdVZA7jgwc
	ZHC5KPm2Kpp2mCBb1dw5JFHYfRRjEUBB5SEWK6CCWVxHgm8usdQBRuw77MKjyM8HzSNicXFT2UfPk
	y6yML5Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfRW4-00000005mVl-0W7c;
	Fri, 03 Jul 2026 00:12:24 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfRW1-00000005mVQ-1ykC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 00:12:22 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-51c2149571dso145721cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 17:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783037540; x=1783642340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DBT8QbiXPV791Ei75jZRE+bdrb5rv+oRxEtX04MEBMM=;
        b=CaouPvtrHzaoo4szFnVy4bGPFWMuXL27vFlcO2aOLWwWLv4jdv/tGnvW/Ea75Vd2q2
         WrDDLUJoeudexyrcc0prBbbmizEiso3ee18xjYOe+G6pBExMFIeEfb1wNxHkSXc74ICV
         160mPN8yysWT21+0x9laAdHdO83Uwc+zMkwAzonuDWasBRnN04qfp6bhleARZmuxWHFj
         cc46P4hRC1XVlfUWPDyI0pcqKr1XseB4h5upp+tcAhHuyVCL2tPA6IxmgCiVxC92bUV0
         F4Ey0b9wLpS6+msCzd8ffEczgI/HgfHSoPJrFmOQ1+xmf+4jBey9fyECJVYhwK1+7lXT
         KnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783037540; x=1783642340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DBT8QbiXPV791Ei75jZRE+bdrb5rv+oRxEtX04MEBMM=;
        b=KoigaFp880U4fvA77TVfQ4HZ9CnjiFJ80lkAaLc2trmlMQzPHfbpGcUXRw6cHE9jD8
         y8Ov3IvC0d7REuQg5Xc2vPKJhGlTwataXL9HQOibtwHsDEPxLJvK0h+h16xKd8GSNI49
         Vtmz8NW0P7aRU01E1ZqkbJ/w+ytiG/t/vitRjds+KJmv/o9QjoYLKwZafAZlau3SEzGZ
         1EJdI827LtSRxtYh0YLMGnAB7BHL7O2M4LV6QnZucIo2VoEmhHKZE/Xr6qu+WlsVau5n
         As4WiLaIsjl1LaUTDpkux1OzhKCOQGiTSmnyLzvi0JqCipQ1u/bjULheAb2HH/5+vjTd
         xZVw==
X-Forwarded-Encrypted: i=1; AFNElJ8YUujrEBZ4BVi+Iq+ixTMlaqiVIBGDCBDHwaQJpl5/v56CqNEtM3+esaf5RWStKWD5tZ8vhLqxqMaDd+v3OQST@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+1xqd+/G7W6sRad1/eb+f9ofIRH7Jp8wzzxp4krLh0Cz1tgqh
	OIIUOGUCv1rFoKdlpmX94VuXyFl7w1BpNGWYx5vgWk1kkgbak4fU9VVV
X-Gm-Gg: AfdE7cl29zDmsLMETjCOsFvZv/9QPGZbVqBnDYj7BNKBFpKXRLFXMKk+khFQ1FU0ErL
	C5Yzbgxj+bxaacec+52dsbEOf2X41PsYjN6HBy4gPIHy1bp2vnVu+mPBWY7cNafVSJFXJLfmldW
	F4QIjnELpm8umT+76Y02BLHR5ZS9J/kQAdiwFbgLMoJ3613761q0ryQzQjhkgWsHAYIPqPxKYIJ
	BiRxhIVTqltXMZGJdLK7MMZNhvyomk6GzuWjfyzQ6Y2ri9uTwU4P1tOIcK1I44BArlmC0pMtIhR
	Jl5kkmMayLmX0RXtnXvELozPKjCj1NtAZfdBk4LcNIDNjEFoAoZouepJu+rDDnSmu5pTRoiLR5z
	ZHIB3pH2+e+l8aQkDMcRF0lLIqYiuzcWxd4zQqB9s3KVW4JbzEyPVLF0wee3ELXfrvUHelQjXPe
	0ldnT9Pr3T3dh7uoR4ZZLZRT2Ds5lbX6Y4UauqiO8yWQIv6H20QQwOaF/ktvYtgYt5geFHtao=
X-Received: by 2002:ac8:7f43:0:b0:51a:88f8:bef2 with SMTP id d75a77b69052e-51c2ad4803amr90244191cf.28.1783037540068;
        Thu, 02 Jul 2026 17:12:20 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f471de87e3sm40289776d6.35.2026.07.02.17.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 17:12:19 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Yuanshen Cao <alex.caoys@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <frank.li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 0/5] dmaengine: sun6i-dma: Add support for Allwinner A733 DMA controller
Date: Thu,  2 Jul 2026 20:12:18 -0400
Message-ID: <20260703001218.1243244-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
References: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_171221_514994_44B6DFE0 
X-CRM114-Status: UNSURE (   6.87  )
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

Hi Yuanshen,

Following up on my earlier note on patch 1: I have Cubie A7S hardware
on hand and boot test kernels over serial routinely. If runtime
confirmation of the DMA controller would help the next revision, say
what you would like exercised and I will run it.

(AI-assisted, as before.)

Thanks,
Enzo

