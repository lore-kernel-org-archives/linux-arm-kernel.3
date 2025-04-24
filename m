Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8A0C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 20:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fg/5CSYGx8pustO7TFATB5SoThu17c6gLk2jPxapenA=; b=tg30Lz9yzYwBX2Akhzdyi1FLHu
	F3HCvXM8Qp3O/CIjKx2uSh7FBCaOgYkUMxlCAANunYLJYCJCNJDl9XxL7odvquIOUZ2M2g/m2nwQU
	4iRZU8WkFQzmcFV3COYAVJAXjcq7+wcNxr8ae07vwt0WwkLbCnug7uzXO+dBEX3bxNc80TR0brfz/
	DhsA/zel3uXTJaU2LFGei2A7JnHdqeJBo/UEOBSJYDLEif1MHNSwPqKNxu/YGg3BLFzlp4DerNhN4
	Aw8MTiEVz9Pc8jZMVl5+sf/mgG69Zm70VKYP4a+Bh6iSkV7wTHQ+cLOjlr+TyqQcy1K1F/bMGtXh6
	Iylu+wzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u82st-0000000FI37-2zJW;
	Thu, 24 Apr 2025 20:09:23 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8238-0000000F9r9-1bTl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 19:15:55 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-39bf44be22fso1044987f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 12:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745522152; x=1746126952; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fg/5CSYGx8pustO7TFATB5SoThu17c6gLk2jPxapenA=;
        b=hxr+Np7W6Dq1+eVb9J6Soe6zQ0hG5KWcYVNLrDYo1QI4oENWGaJkgAMDShzmIGx76c
         MfJU9BQq/2qC81eFgtVBflVb8s+IN1xVHmxhbS5Fi08zRNQBedaqaN40QM8xjq3x3H+0
         LmkZbqH2zr9Got4su6XnT7ZjmKwlrds2PMqm21twLA9B5i+LFgNktsm/RnjTwf7DPM1G
         oVnmcX2zw95ntfW8k/cWCJSxGn6RkBmHbwgvFqyp02fgkdfeQBQ8NshF0PytiuOpdmhY
         A/o9Xze3kubmfxLMtMeKnkNX40ZJzeynTQjvRSMn5XSq17lvVq/OV7UrtCvcY655ctqM
         q7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745522152; x=1746126952;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fg/5CSYGx8pustO7TFATB5SoThu17c6gLk2jPxapenA=;
        b=sjA02ZaBzuH59TcOIbALlDlB+LS/0JMDnP6bS5wRd+bqDm94FM8f+Ba/SmWKrUW8x1
         vTVsmNeY3J1q+WZi7TYv/NIrXJ6b90pjf2uIae8oC0r81oMFll2YyjvbCBHSs0NiVicD
         9iDS3yBd96YhmaRK5znbXvhGijakCAg/9n+iN6b01HHJdAdWEljATK9SJG8Emc3mIGTV
         wYkfDdhQl/KH7YE5G52DkPslzbjZpKa2g/GpkTDmP6KW3JzeHObgpm5ExEF1gPdNxa2o
         18cBATzVOjwOhr3J77eMckNPcdWYnjo8QdKlEFeLKYIxbsqltTmJ6uTm7/GF3ruun6ga
         bPcw==
X-Forwarded-Encrypted: i=1; AJvYcCUpCHcfhvbBZHN4ZR2xpE/cZ+PKQ00mFimYgahYWj+6cs/MsFhJzZ1Lhn0hZstLg0BNN6RHnEwDiPrpA4AwzTV4@lists.infradead.org
X-Gm-Message-State: AOJu0YxcePXwof8PuXDK22D17hkYIMC60MCzXhGtBPSBJXFNa38Q5iuI
	2lBydxDia2ZUwwH965+qlD2pnU0Ij5BqgBcW6d3XFQKtJz7ZGWgK
X-Gm-Gg: ASbGncvt14tkt8yKLzxNQdclTIvXO5O4Qsq59nqP3JSYn7w6BGJ6TQalg5MQ2E1tdhv
	YXB25Wt6ScRKMuzHD2eJZYK62ePxUW8LKn4WxZkkqmdfdVQNMk2Yg6sg0F1Zl/1GzP57ooghy1j
	uftyiAkNP3ZvykppLEmUNmI9qFOZQN+nNknmec7a8lDFJgcnJtDsqFJxA7Z3k6QgcdmDSNkDeUs
	+QYcBq2bVJZ7w7ep/N5WD16pEI1osw6IcyuHoeJHQ2GEF3eVdC4y9idYPNqnOj0Ps2E6GUEr8Xf
	hzExW8tvgeQ5SmdKP2V9TDCJMIURwQLthAsTyAyfO/EPSdphxOkw
X-Google-Smtp-Source: AGHT+IGDtJkWxzHCs3qBzGx1s0jq+yB7NCM4c9k0cZ/pHOBdBV+p+7aYjAospsSGtI/LXj666TeSig==
X-Received: by 2002:a05:6000:1ac6:b0:390:f6aa:4e80 with SMTP id ffacd0b85a97d-3a06cfb24abmr3545024f8f.53.1745522152219;
        Thu, 24 Apr 2025 12:15:52 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a073c8ca99sm161810f8f.20.2025.04.24.12.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 12:15:51 -0700 (PDT)
Date: Thu, 24 Apr 2025 21:15:49 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa
 A5E board
Message-ID: <aAqN5cKdDr_D10LX@Red>
References: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org>
 <20250424-01-sun55i-emac0-v2-4-833f04d23e1d@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250424-01-sun55i-emac0-v2-4-833f04d23e1d@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_121554_418904_1AAD8E11 
X-CRM114-Status: UNSURE (   9.19  )
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

Le Thu, Apr 24, 2025 at 06:08:42PM +0800, Yixun Lan a écrit :
> On Radxa A5E board, the EMAC0 connect to an external YT8531C PHY,
> which features a 25MHz crystal, and using PH8 pin as PHY reset.
> 
> Tested on A5E board with schematic V1.20.
> 

Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>

Thanks

