Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CB7C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 18:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9FEiJ6GtO3x4AiYlszABTIXDcZSRIh+gOJoUIjbzrc=; b=GITGoO2T5UwEyLsypXqif47xwU
	MgWMuO8fG0vJnVv+w2hIxlumn03CWhX2TGRK9Ys3M7gNb4WIlCfIgiGiYszSKbyAfj9w064j8vFNy
	gYlW9o1zIoqLxUY84L4TROeOVkfnkKkuQIjQkeEoo6ZZ2KezI8KUc7gKfDpW5Q1U3xQIjPJf14pIx
	P9HmRko0zDZGFikwGQ55pkxmlc4gCtnUd9Bt974gt9mgYqEI0SKCaaM03SCGazz4n8MrnWFwHGah+
	MSTx7FTnZcwuXzaAUpAUAWbr3VMaY34PvhMWZ3RIaj3siQfIlIcXkSAil9ApSAY+b1pOXER3s9jIL
	ssIqx5qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2E8q-00000005AmR-2lCB;
	Tue, 08 Apr 2025 18:57:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2CaB-00000004x1G-2HKH
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Apr 2025 17:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=y9FEiJ6GtO3x4AiYlszABTIXDcZSRIh+gOJoUIjbzrc=; b=lKlPP+vvdkPFrauu01E4+k0tVu
	JuVb68DFfkPw6//MDf2t/QDQ8Evx3m+k3vgc+mm5pJh3jsSMCxE5TJMfvMswnqsilyA88d5OXeCkY
	uZGL5zmjXC9Nz4j5TtGNeDj6Cma9M3czW97sCAiyQWEFy7zhWBj0V2RKh5b3vu++fWSdEMUelEcKd
	ckdl9B6l605ceO5zpmjdoqH8MB6hMqYLd94iUoHoqaruMbIkJirmwzgF6ozMSU5PZNS/pPfyqERXK
	3BnvEwVVfrwz4xR79TsySpR1ljXObTG1u1pDMsv0pM6+A1uGLhogJQRhMDtGJl+19V2F+qfvy2CPY
	RxFDY24A==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2Ca8-00000008LkV-261K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 17:17:54 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso63522995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 10:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744132670; x=1744737470; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y9FEiJ6GtO3x4AiYlszABTIXDcZSRIh+gOJoUIjbzrc=;
        b=cJYNKO1NI2X8pt1BbYNG0F7DmRJtFm1/XiYPiaJPkErmTrzqqWe83YEvIKtFERQIM2
         3JOtfviFUsprE4gG2gvk57iWvo7YmWtYMYZOeSpVPPPi7u6utzgqEb3nWBRYWojPplcX
         3Wx0RM3iQ5jtRwYh6mNJBOlaNvKOroAo11ByerYXaWN6ebBfGwYKAL21NxDJqK+6v760
         hKZAPzhBMK2M5qVVgZdrkn9bcrOXIB+JBXjW7atJrgkPNlF5CLXk23sSTYPHhacBPWCM
         fQ2iUiDmcTY5BOMvGcxSJdK5YYxpT2snT1Id42oyx42VvWE3uvUaixMtIHd2yzf4N7PA
         yntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744132670; x=1744737470;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9FEiJ6GtO3x4AiYlszABTIXDcZSRIh+gOJoUIjbzrc=;
        b=opc+uXLKb7c8eePni9YzTgEZIejyhtDpJkiHmEyPFBHC1OTDGPRFGKlg/xEqEyvMUn
         rT66EQl3OR6gURoM5TAGMHAru0BOmscAE7ATgLCLaTsW8tBuuVX9+VFgM/MmJ5GZ8TDk
         lZZCTYQro9RQvW+mEgVpuomhlnhSK0vkfyRogwQpzSVD/Pyk41ZvXhhx9fy/yMF0cQIB
         3aXdj6LkM045VREDtu11Y1FEmMl0d364pUPg82KfNpO3TaztOd/IhHQO9rzpg7MUVPn6
         ceOkEWe5COVXDCf6pgaofyBTLXV3LQnEFxM7nH0xy0d7i9df9KzmtL5XmiBBqH/mstE+
         S5Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUbnKhRnk5WJpCI9ygzfG4EQtjyRRg3rHP/A/+FC2m5UVal9Njb+phqm2nSSfCTMBedn3lJzjWS15JNW03uVzD5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4iRri9K/SN4wV05rdBQ9hkV9iHG945CNZMpOhh+OmZvOH6Bu8
	wE7L2OKkSlUWzo9J54ZL2bveqACy39qVe7WeycgYT0CY2qWkuqTa
X-Gm-Gg: ASbGncuMoh/ESQDusJZIiI6gWZDBuL1Ncv32eDL5TQ2l318C+CvHt2a9LdXJFzujwLe
	vJ6la53hXPDTs/C3eeXGmmdNFiEzD91auYOm9lI2f8Ia/bqEqT0lD5PbdK2aRis/tbfShtBdcJS
	IyhzSixMbd5A9KmQOitOiYTT4qEMnvfj2aL4vldVc77mg1jHCt7D0QO0iHOGUb2f+pvVsGjmK9A
	649/KYdm+NIfy/aJGuWKy1OYgoUjGtYPUsgYymsm0taU7kqZB/t8RsFvXA6A3dXVNomCPoE1dV1
	0Dk1uAUbRW91okPdlzKyY8QKfZfVYqZkiBf3Zt8qux7rHw==
X-Google-Smtp-Source: AGHT+IGMxsDZ68vfGvY6rmtQL+9u8l96JpsI36c7dOT+rCUWPpt8G0b9GVy/azT74f17G5UjIxKHow==
X-Received: by 2002:a05:600c:34c2:b0:43c:fdbe:43be with SMTP id 5b1f17b1804b1-43ed0da05c8mr146186625e9.27.1744132669487;
        Tue, 08 Apr 2025 10:17:49 -0700 (PDT)
Received: from Ansuel-XPS. ([109.52.104.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c2fe9875dsm15443812f8f.0.2025.04.08.10.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 10:17:49 -0700 (PDT)
Message-ID: <67f55a3d.050a0220.f3f61.8550@mx.google.com>
X-Google-Original-Message-ID: <Z_VaN2iATWh7sipi@Ansuel-XPS.>
Date: Tue, 8 Apr 2025 19:17:43 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Simon Horman <horms@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.or
Subject: Re: [net-next PATCH 2/2] net: phy: mediatek: add Airoha PHY ID to
 SoC driver
References: <20250408155321.613868-1-ansuelsmth@gmail.com>
 <20250408155321.613868-2-ansuelsmth@gmail.com>
 <Z_VYz6InC1p4vwku@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_VYz6InC1p4vwku@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_181752_654152_46D51F57 
X-CRM114-Status: GOOD (  12.09  )
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

On Tue, Apr 08, 2025 at 06:11:43PM +0100, Russell King (Oracle) wrote:
> On Tue, Apr 08, 2025 at 05:53:14PM +0200, Christian Marangi wrote:
> >  config MEDIATEK_GE_SOC_PHY
> >  	tristate "MediaTek SoC Ethernet PHYs"
> > -	depends on (ARM64 && ARCH_MEDIATEK) || COMPILE_TEST
> > -	depends on NVMEM_MTK_EFUSE || COMPILE_TEST
> > +	depends on (ARM64 && (ARCH_MEDIATEK || ARCH_AIROHA)) || COMPILE_TEST
> > +	depends on (ARCH_MEDIATEK && NVMEM_MTK_EFUSE) || ARCH_AIROHA || COMPILE_TEST
> 
> So...
> COMPILE_TEST	ARM64	ARCH_AIROHA	ARCH_MEDIATEK	NVMEM_MTK_EFUSE	result
> N		N	x		x		x		N
> N		Y	N		N		x		N
> N		Y	N		Y		N		N
> N		Y	N		Y		Y		Y
> N		Y	Y		x		x		Y
> Y		x	x		x		x		Y
> 
> Hence this simplifies to:
> 
> 	depends on ARM64 || COMPILE_TEST
> 	depends on ARCH_AIROHA || (ARCH_MEDIATEK && NVMEM_MTK_EFUSE) || \
> 		   COMPILE_TEST
>

Right, I will update in v2.

Hope Andrew is OK with keeping the review tag.

-- 
	Ansuel

