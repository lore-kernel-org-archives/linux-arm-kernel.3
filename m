Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F21BC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 17:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEIzKxs0GNs/VcFKM7BeuHzukEWwgOUFRzKScKCJzFA=; b=2LrbF/j5Z3s+/+VYwi2FEfVfVm
	6e5uG7BaQTNqN+xHJ8s+1EF+CiaZ4tZeIul1bMtHIZ8KNMEIxwphDTDflv8mqWNQS+yeXO1UByctf
	JWjV0gd1svZN8E+5Uayhwlkl2ILhC7BR7mSSdx8ilut7b9sJ8qpnzDoHdBScQoI/tQ5t5Z1+qqr4v
	zDVwNqcwn1mdrEHgx2hJ0jn5uZbrdhtG5d/xtVx8aeq9OZkaR7JqPQNl4C7GjZB8C3h5tSudqU1lt
	lnO1c3R888GebYuIabh7RIRuyjPVi44QKj4u2AXeG7xTZtztUr2BO9beagUJjILJMA/aJZMQ/FGHE
	n2rNWlFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT1jb-000000003lx-29rp;
	Sat, 21 Jun 2025 17:10:31 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT1hK-000000003eU-0J6t
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 17:08:11 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-54998f865b8so2397054e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Jun 2025 10:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750525688; x=1751130488; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEIzKxs0GNs/VcFKM7BeuHzukEWwgOUFRzKScKCJzFA=;
        b=UAe4QycqMaZQhEJmBreqlIGCspkdYITvypPJxhsgDbbGYa1UR+Ye48KCGxOt9s0G2i
         JigB0+12TRw7WVmcK9wIz41M72LsbTEhv7PqTbhRYRVRC6TKHGNL3Yxq54rrkFDMAyd+
         txgiUaILJ7oDR/Sl7QjCgQCVeg66Ryj1mMLoKFucdvz1lwUBDA/fVKIK7ikP7BkcX5r5
         yzq2YSqFOabz4/EDgERApAWxsoIeujPYtNB9NngLjRFxt82XoDwztkj7rF6nvKB1Twx4
         K45PhUvyE+LmI2agCrbjDaUiaXX/BPLNg4F8V87yFIS+iwu2YSC6vSJYd9JZ5PLc9smD
         jzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750525688; x=1751130488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEIzKxs0GNs/VcFKM7BeuHzukEWwgOUFRzKScKCJzFA=;
        b=HFCZ1qZvT/Y5uIK0LhI/TLvl8+FUxcdv7BNLuQBMrLq4a2CuutTvBKlaqEmbEZe5Rb
         aHIOMsBt121CW0axIzsK/oNtzXQ18AGm9a23UV4MtElC9cM0bjXwye10BhuUlxlnUbqn
         M78V9XynQQ9Ab6Ya/btFnOtZHwStjWWRFVi5RQansp8DGt6xRTjV5/tmmTS0Fjw+UV9X
         ZuQPePcOHQQzaJ2C7RF3RrUBJ+meVIT2jy+D/CqZ4egi72Jh/jdTfHhBoL+N5tgM7tIH
         +Xr9gR2Kz/9ggeBZin+ZjgsBm44I+6+TJeEIjqcOmhSrPt24GX71Y8kM8XUiIYEiC6l6
         KwDw==
X-Gm-Message-State: AOJu0YyOrmyi3tQQENTBDHrVCDooHDFnH1Rv7fy1RaDkRvaylfxduZDD
	X5Woxcx2YsAoXq4o+CN1KeCeCmavnY2vo6AYZ2rkaTFHs5TkLL1cZ1vVQPxdU/37alLs4FHcAS8
	KH//h+DD5O449tZUC8M5tbhnohMthOuM=
X-Gm-Gg: ASbGncuxay082Cmt9Z8cUQzdEXLjCCwl2ULDb+1HobPTtawp52I32II1WeZ5ZyoZ0+g
	wwI8w/Ta/QJ6D6fADXd3GtRJ4WcKW+7T6waH5OR1I6fsj8M48zOvybh9pGlbzMNzoFFONym1iuk
	AFENauh6hAJx2bIT+FNjBIMaeyWDOBcGrFB6SzwirFAUG7JBtu5GVNZLAqLTiGDBzTZnpHbWye9
	3o=
X-Google-Smtp-Source: AGHT+IE9XukBFnfqYPGxv15LwD4aFI78caQyw/4Eu8EFUxN/5Av0fimYLTnJIM5a8dCDg+V1FF7pxxWduBGUw5Lpv/Y=
X-Received: by 2002:a05:6512:4014:b0:553:acf9:c430 with SMTP id
 2adb3069b0e04-553e3ba865emr2715526e87.17.1750525687553; Sat, 21 Jun 2025
 10:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250621112311.68101-1-aford173@gmail.com>
In-Reply-To: <20250621112311.68101-1-aford173@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 21 Jun 2025 14:07:56 -0300
X-Gm-Features: AX0GCFsyZkLAi_IdniUJd_5FXJgXSkkE5eshqUFluI-nTmyTXyPV2FSCarf00P8
Message-ID: <CAOMZO5DUVVBmxfrJPjcZPCQGFg-rVNTUch6APWfSKF6LY1DWHQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mm: Configure DMA on UART2
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_100810_112045_D47147EA 
X-CRM114-Status: GOOD (  11.37  )
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

On Sat, Jun 21, 2025 at 8:23=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:
>
> UART2 is often used as the console, so the DMA was likely left
> off on purpose, since it's recomended to not use the DMA on the

Typo: recommended


> console. Beacause, the driver checks to see if the UART is used for

Typo: Because

> the console when determining if it should initialize DMA, it
> should be safe to enable DMA on UART2 for all users.

The same comment applies to the other patch.

Reviewed-by: Fabio Estevam <festevam@gmail.com>

