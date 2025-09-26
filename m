Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4987CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 01:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1PTcenWwYJQDqIWAGafXJtH7Gx1jBmVYXi2cXCmKlM=; b=gHnfAg+ixCj708G31P3YbyciT+
	Ocb7st0msp+MqB+kyiugi0BnbqOyW3eccR0KpHcY5Vk74jNhcn8FHnwG5cytpCoXly6znlFIGyq76
	U+xZUSn0mqc9dwgWRFBrTufDqN6nXRlNzvr73gMah5s7TBsnKInkUNpPEshEP/4Kujcal7ssIqwUo
	hxIr+h0Tf8oxbFyvcSF9U9Bj9AJwvAshFv3+YqbBNEQGbch2Lax0TFMG0vhPLxZS+gAAW+F63NsPm
	/kDgnImMBclTlqxkK9Cu9o95VIgryJFd34cCZ/FavIqdBNWDO2ghsygzLNUgfA8cITQNoiyPDIpmd
	bQTYcO1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1wtF-0000000EXV5-2kzv;
	Fri, 26 Sep 2025 01:04:49 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1wtB-0000000EXRL-3tM1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 01:04:48 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-3612c38b902so13539791fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 18:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758848684; x=1759453484; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1PTcenWwYJQDqIWAGafXJtH7Gx1jBmVYXi2cXCmKlM=;
        b=dPE0AGOJwdj7BZ8jHvRfIGfIcOukqepuI5UrkfR8TypOmAyqIIdpVTdxIaDnHyeYpA
         GClwyR9xP2NO3k7c+Z8+nDGh31HbMfC2GRD5LUKiVExoZDQU3FbBWmNt4+p7SDzDU8N5
         /iXfhqR6DKcOi7QUe+2fBL5oPYdMinOSE1EaRMzXthbaI7jRdoZ3dbjxh0Pzc77LpKHb
         R3SMX7Qr2YBEvWGfnsB1NPw0wbkk0pssLek+zfIgr3kSrKoJqwSSg3TeJUvXGC4s08Xd
         e/U1+vnVb+CLxwIZEbSzvizKJrKuPEY6Gx9tP9DNejsoUcrtRE0r/JvaNz3a1+FsaykJ
         IOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758848684; x=1759453484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1PTcenWwYJQDqIWAGafXJtH7Gx1jBmVYXi2cXCmKlM=;
        b=eNMZi/w6kReUn0F56nDfX09w/VCiJl2x1bWda+sewkB4zKk3NUlAmtNgZr6qdEytr0
         hMcsh9Z/LxlBQH+6dmHGqPcBZtm9GHNr4lXTW7R8vvEttjXej2MlwtFH+X6ANOilE7HS
         XrrVQVGeGLqUajLbWoGYsiGZ0QcNp7pCU3i5t13JBdajkvrQRFUeeX3xo5yru3QBSxuZ
         Jc/jh7h5NjOGesTb5Vn5sQiM+BTUExzKDGVlveKclxxqQO5RTUZGkh6V3fTLxg73BX9U
         2xINxU8pyoZ4I6MI+IzKuIiZ8SEFXn1inr9QEY9qhxlclAB1F62oJIGcCXLylga8PlwO
         JXEw==
X-Forwarded-Encrypted: i=1; AJvYcCVLhODJbKMJZIBd8udNSYoT+zSrK0oFMQ6fyZaCj4Ye+i3v0uEXJQROEdu6JxbGYxZwQVQXqAlpSSh1X//K6LDp@lists.infradead.org
X-Gm-Message-State: AOJu0YzftbSHYtXcVMqcNkYSIh/wwpUsOSDFQ1S+fJ4irLzVd3ok7jOn
	v3AdE9jlht29xl8VWatX/qWEUR4CkWt4evU8B1sp+2RKX2GbXNVZmYz1pCmYt/z5PMjq7QO7u5X
	YTuKcPnEi8Pm5Fv27+ykJqavDT3P/77s=
X-Gm-Gg: ASbGncuq199pJDyuRyzDzsj3AAueFG9x3BJ7+J5/HJJgMq9n1t3LeblsXRk8BQu8st1
	2lcMJ4A764k6+BClEw4DOzH58itZj6RKbMyQj/cbGe96DqUJPedwJgrsNHXVefiCILvtuyX+eXv
	RFQs6xagAOjFwIxuWCHxo0K14ejNjuqK9FlYyhBKh7gWy9wifoAPnpqBt+8UN6xKXMeW/vUIdNx
	sGtL6T4YAJbJc/75BHtKNvfTKv8qGadycs+3PCv0sNU+vl83Q==
X-Google-Smtp-Source: AGHT+IF60TM5C+nAEavr2hjyLt4InfjHbymmnuKiT3q3qe2EKbyjz8AweucVXMC9Vaf26fmcfOScUPJF+Jt3PPMgBJU=
X-Received: by 2002:a2e:a54f:0:b0:354:8a7:2f7a with SMTP id
 38308e7fff4ca-36f7f2489cbmr16533621fa.20.1758848683520; Thu, 25 Sep 2025
 18:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250925-imx6_dts_cleanup-v1-0-748380dd0d22@nxp.com> <20250925-imx6_dts_cleanup-v1-8-748380dd0d22@nxp.com>
In-Reply-To: <20250925-imx6_dts_cleanup-v1-8-748380dd0d22@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 25 Sep 2025 22:04:32 -0300
X-Gm-Features: AS18NWBj6BcwvJ3vSrAqizOdTksjhpkILyWLhm4qyX1--PNMSLiRuSdyQPA3LCc
Message-ID: <CAOMZO5BVbm+Vh=XOiR9peP0oW77GiqaSNCbawK_j2+_-vFj7mA@mail.gmail.com>
Subject: Re: [PATCH 08/11] ARM: dts: imx6-tbs2910: rename ir_recv to ir
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_180445_968635_737CF980 
X-CRM114-Status: UNSURE (   7.83  )
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

On Thu, Sep 25, 2025 at 6:14=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> -       ir_recv {
> +       ir {

ir-receiver would be more informative.

This is what gpio-ir-receiver.yaml uses in the example.

