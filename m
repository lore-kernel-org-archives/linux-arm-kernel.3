Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523B9C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 23:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5q3DleDzpgD7EzF7P1DuXDyZxKtwf0/HFl5nJAaVslM=; b=KusbSWknsqOE/F0B8gaWl5s0bP
	Vo9pgDu1Z+7ONdlDGATFPMY+yd54Xp9rh8PRbzFk/1OrHVU20bAjpvE9LZWDELaQN9pqMTkTBDyuc
	S0urW3YbYn1D6DHEtypE6Dq3aWkUZ6MGNM2YBZhm/BXYeitFwIpJ61ANMRey3k3XF3WHcloi5E/o7
	0krXNFK1KByftFZq9VMRyRjLgbIYL3nuribObRtch3CKrF7lNTZ+wbq3jCQbzRZRfYZ8P02FKInph
	LxRNSGHOowHQCiYb7PMqL7c0XdsINjnAw8zL75VIJusOyBwaOTVAce7sbGq2uzkZSmtJjoaUMCFos
	EPGuG/zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teMc6-0000000DCTb-1bRX;
	Sat, 01 Feb 2025 23:09:22 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teMai-0000000DCK0-3AaL;
	Sat, 01 Feb 2025 23:07:57 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so21971155e9.1;
        Sat, 01 Feb 2025 15:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1738451274; x=1739056074; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:reply-to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5q3DleDzpgD7EzF7P1DuXDyZxKtwf0/HFl5nJAaVslM=;
        b=LNfG2TJHLtsY2SRt86wqjpsGG7CHe7fc1tdHJK7Ln/kou6L4QsSPHvbzLuYzhqQJLu
         hxJJEfisx0ABR308LgPB4B/edXmCM92hF+sNeYmDo4sS18KHU+KkTJpasN4sLjg9bc98
         KuFtveYmzh7zPTNYaBCml31Yq35T6AF0EYjZgGQ388k6nO2ET7ojXHMVMPaCXB33JQjq
         rmN/DJXFlyRgkVsS/gHwWuK0cx2UduITmRxeFDaH/ofXYnOLc8ox0j83+L8w7Skwb96U
         SRl89+eNBHpXBL/LI55Bk4Xagw+G6xCqUyEAsA7XpbmaY9RBsFmS+pzO3Ea1wwddufES
         0EIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738451274; x=1739056074;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:reply-to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5q3DleDzpgD7EzF7P1DuXDyZxKtwf0/HFl5nJAaVslM=;
        b=nsUu/Kx012rD1lNxrwHZZoukCqKAqmrfhBjlpm8ePETRMQDnzIOoFE+DJ6jnq0AxNc
         RabX/18fsVZqN2CFSp36jYuRmmL8gE12kqy3nzr5yx2j3YC4WW50OPGR34APGl20g2L6
         v4tzSlP0gCtiirpOE8azOIIV3IaqqovF78ZjbY91eQMM19ezQOtxF1bFuj2qDzH5kVCd
         f4dF6JfwCg3FpAoDE6X/SmZzjtTf/x9m1ylvzXU22AU3sNMkkSi40HwdV4gWXXvUaKvI
         JkkeljHexbowmi8fFAgiftyU5ljUXDesBMtXE87J51PxBUT2DE5tle1CVz61HV9k5tjF
         10AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNriCqsD74bdtn7peznSV1G+LCXxxi0XxkAVSEd5PXOmdz56+87DJP+cwfaVS98AjdCuBnk7Hzsk6PQW8D2IPD@lists.infradead.org, AJvYcCXAg0wWHsoO6m93pqkdhF0hsg0Bi+HoDjH5t98PsL9s0bPFAnISPEovOLEu4/Ykezc77t4KpgHDKw2cysaMmWo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yze88A0LUTrxjFphoTUo0j80HYyD6AVRUXSYbNAO3+Oe7+CzcSV
	Iz7yuNo+P75igjRGOeEyKxvt054gfxr7wMzyuthVKL9DRScZzYvSEBT5lw==
X-Gm-Gg: ASbGncuuEXTjW7vbl+RfKmtSLODAjUYnBdUYv031WOOSwtVnJ8GHwtxqLUn/NsBdxDm
	RfsDya3dkeC4IxVxU0J8sdz7u8fjpq2tzLUsn5uU3KUBSpn/SWMS3caYVvpd3Tc8QL+GyrAxjHO
	UM9Fi4V6AfWJ7dTtJUxoiphL2S3WbEvwY2V3DtYE/dxZSOEnHKNQ479W6xgOhiiriqcOBEYilkj
	/t+qCVHyYHRovE3SeKVkOuRnalGJekaTWOEA3epOPl6PBZ6sb9vuMy8T0YB+OR8KS6u47xpAIcm
	aCf+aJchM7q5dAiUevOcGYWqepstpg==
X-Google-Smtp-Source: AGHT+IF1ijrf5GV3LAgJuIitt8CuxdpOYO8Z/Kf+YMgYFonfsxo1H9DKWlH1CP79/A3UyOHx3knK5g==
X-Received: by 2002:a05:600c:a45:b0:434:f7e3:bfbd with SMTP id 5b1f17b1804b1-438dc40cf15mr130069765e9.23.1738451274253;
        Sat, 01 Feb 2025 15:07:54 -0800 (PST)
Received: from mars.fritz.box ([2a02:8071:7130:82c0:da34:bd1d:ae27:5be6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b5780sm8487849f8f.67.2025.02.01.15.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 15:07:53 -0800 (PST)
Message-ID: <7a543bef6e096babdb4e8a02d86e0b68f4c92697.camel@googlemail.com>
Subject: Re: rk3399 fails to boot since v6.12.7
From: Christoph Fritz <chf.fritz@googlemail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, 
	KeverYang <kever.yang@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, 
	linux-rockchip@lists.infradead.org, stable <stable@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Date: Sun, 02 Feb 2025 00:07:52 +0100
In-Reply-To: <865xluvmp0.wl-maz@kernel.org>
References: <b1266652fb64857246e8babdf268d0df8f0c36d9.camel@googlemail.com>
	 <86a5b8vd0d.wl-maz@kernel.org>
	 <fc0b65020f3376e5245a8f599a060fdca10ab61c.camel@googlemail.com>
	 <865xluvmp0.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_150756_823468_94FCC884 
X-CRM114-Status: UNSURE (   8.17  )
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
Reply-To: chf.fritz@googlemail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> Anyway, can you try the hack below? it works on my own rk3399, but I
> don't have anything on the secure side. Please also try it by passing
> "irqchip.gicv3_pseudo_nmi=3D1" on the command-line.

Done, works in both cases now for me. If you want you can add my
Tested-by and/or Reported-by.

Thanks
  -- Christoph


