Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4128DD29DEF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 09:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ku3/2XB5ppEbZ4a3ARvYq0a2iffzQaZX2Su0UwOg8z8=; b=TS4HoYtvk7SpRmr5G9YuhBVjO4
	M3vsHV7Naaayuw/7aF+594LkK6exCLP+rEPAkIwMlvgAQ8Ud0TwBA6vMyT4xiigCeWL2PDy4TXobG
	uqTn3JuKw8JXYKRLB9zNexg+VtfVU8i3jfRZf1RWNLN0OhCGtgHAHGo3qPd/xsDzVsNWxhMQqYSCS
	AhHdalav1yFWS9TPVTza16nPVHlcc2UJ9zZZGDYIKjZSSF0k5yGmOwimuGh61Qg5IqRdZr5ORNTWt
	ehtVb1CYkWQtXIBYhRiAA6Jhl11ANodhOxMO2oV7RfzvYaaHB4a0OOBkYtHX7/oTt2EA/w9e/Q2JK
	U41MkYYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaMO-00000006nZ0-3OKA;
	Tue, 13 Jan 2026 09:06:44 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaML-00000006nYN-3Som
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 09:06:42 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-1205a8718afso8171031c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 01:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768295201; x=1768900001; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ku3/2XB5ppEbZ4a3ARvYq0a2iffzQaZX2Su0UwOg8z8=;
        b=WBRTQKMlHrDHiWXA//3QGj4idUjg5p2AXJL4Z1HlUjx3YZCclwHHXw2vvA4P5uC+dK
         EWE1BU/kVS52G93P6DJkj7H5bHiAuDLSvddxgTV1iy4gn2MJxv67IQl+5YGDijC79/4r
         j5m9KDrnLZcFVOxMgxbC/Kj12x0PVri2A+aNrz5X2f9cvuqaDkASY3eVN0xJC+bfV8BC
         FwlTJIgxj6fkjt9Y3bHctrVNhLHOoxuKlWaDrh5i1Xewmp1fbd6XA2tYjVrTEhPBR6mM
         qN09gj3V1QRpXJNv1wsW+6O7kobrvR8eAPL6hVgqCg3H2BY3Sn+ASLKyQEupv6eIrNwj
         pZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768295201; x=1768900001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ku3/2XB5ppEbZ4a3ARvYq0a2iffzQaZX2Su0UwOg8z8=;
        b=U19tiGUJEXoAC5t3vIcsgbqpD0rZIY4fywf1wXnSmqSUIVN7YX1SK6roatchTU311A
         YS6bcBAReQ4bUUF5rtjmdMf2qT3qZdzg7OnWAm+9ifmZ7askHUCo859t4HUTYY04MdHF
         psfnstPdtzdgABGbByHIPRxxzOItPd0y8LmLY3quWFrDwstQayTPd/f7fgSiihKJEU5f
         YeCiLoAYaEtHiTBxnKVyH314yPqeSxPi3e3/37r5by9Cy2/ZFW71mXypuZS7MFz/aDCW
         hH6bqndoph2ZCAwD7bWbOwZPj8Iu/NcfxU8OHJ4/EA4IbawPSiaMt1SIeqD3uKF/Wl1D
         +jiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxI+hYAkCtPcQ96Gk8uuu6EtnLJlDF3nnBllaCqulpalhqxdUyT++sztzhopj331jVVRw1wpmXa7TSMrb2wM54@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9WFd6+PdGdWHmPKiXBPweZLudEpnoLLEXO7eD2Kcc3N+ofthG
	IMnyRBsas4o8VdHfzhBUWudyTmm0hnjsI40KrtJ9Gxm5CN8LRqzW02g6au2ZPjEDT/M1xJLsWN6
	bVF1xvyaHGjWqUTywSqOciblmJcYgpE0=
X-Gm-Gg: AY/fxX75iL5psTu/xrEdbicF2nRQhD1gYknW0n3uxc/cGApJ1MfnNPwu/22lWJ9Oyj3
	2nOPdUNqjQQTI0hw9u9JNW1SJ5jVqoaLvSgDW0fcdL2E8qf7+/Gj7fVo0CFZFwHbSpVO65gE0h/
	OR3nvjH0QKDqo9PB8X4Xj6q22bwl1EzI7i8FP0piCG+GDYNKYdnVA1mia0hEpv80Ale1Qfq6ajo
	k0AWOxFRg+EvbfQgYtSTnGoSE7XyEeUaqla8InYNKQqewb0qTJZTszW98UOWtvk41XnO0Y228TF
	f9RaZl4lbAs+1H4EFmksBJ+pnYZKTW+7QUHFOxq7RALkuEyR2ZCMe8VfLK6YGKfWz4Y8NzfgnQ+
	NW3rQ4U2/OA==
X-Google-Smtp-Source: AGHT+IGzTPihgLRH2WBSYhy3b/sb1A6ZhRnma1ayeDv2Wq7sn2KRkoB8Yp4DAlFqBtKyiGczbVqArPyWwnXGFSHFKGE=
X-Received: by 2002:a05:7022:2388:b0:11b:b622:cad9 with SMTP id
 a92af1059eb24-121f8b2f64dmr21239052c88.21.1768295200627; Tue, 13 Jan 2026
 01:06:40 -0800 (PST)
MIME-Version: 1.0
References: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com> <20260111-imx952-dts-v2-v2-8-5773fa57e89e@nxp.com>
In-Reply-To: <20260111-imx952-dts-v2-v2-8-5773fa57e89e@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 11:09:10 +0200
X-Gm-Features: AZwV_QhyiXCNvj2q962FdbsX8qNV8prAt-LhktWDFPDefQTkJuEkybRoDjuKNBw
Message-ID: <CAEnQRZBvuM608DoKSGVbjh_zV9GE_8BOr6Bv+otKkV=uCRoFmw@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] arm64: dts: imx952-evk: Enable TPM[3,6]
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_010641_863717_50BE35D4 
X-CRM114-Status: UNSURE (   7.75  )
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

On Sun, Jan 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Enable TPM[3,6] for PWM.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

