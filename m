Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1CAFEFB69
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0pNuEW5DadTME76c1H2/bOIre54Jrgk8HxKShAN/0Jg=; b=i5ipAPitM/kBB0JrjFarr+ywfX
	s35Nce4kMcNQj3Gwkwm8we6L8xMLySLbPB1mVu+ShVqjsNzfq6rtdtwTU33MYFQKzBRSMu/ULOMUK
	SirbJk/pvvcXyoGqpw9wRfcU1s79R1GydfCD6DHAPpzlRRrJjF8BaL8LOZ8DsJqiDFEgNc0DXZ1Sh
	D8r7ykyK6uv1iPICgZS1eIugyEYga13b/4gXCZgUlJZ0jJs8IfLdv5NjpfTzmINHvINR7jwyDLQN6
	Y0g6UfgbpF/KKZ+wgsW8BySmyQw4lWk61caOiPNG93FZfIx2SDaeUzeDSiSMSAYc8VJOQNXQoFvgF
	cp+Jmehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw00d-00000008g5i-22So;
	Fri, 27 Feb 2026 15:44:07 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw00b-00000008g5N-3FII
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:44:07 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ab077e3f32so9930025ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 07:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772207044; x=1772811844; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pNuEW5DadTME76c1H2/bOIre54Jrgk8HxKShAN/0Jg=;
        b=XmokEW3aGQEMz+xTTbZbT5bqDhdz4MghoAcOWcR+F94fo/DgeWE50GBfRHQQFILjlj
         6ZBj4BsPwD36IXtCvukCaEEzAdLWXk9FKp6xsIdET5VRh5st0O8EWFIVB4LnKI2OIoGA
         ZmmukRr7TPzjrQpxyCAnM7rvy5PCTFuevi7/DRWNdHGNgScOQuvOIntKvcy/xC5sXmeC
         ANg/gqIBJYoGToZNmtCvAgJ4t2dR1I9VQJME8VehTRbgbPfU3V5TpaQnleTXxA2EZCq3
         Dhc5RmXIVvtcUZFCNA0UXZHPLGvtnNiT2UrfRitU3YXoMnPn9k660tj1a1IlT3YW2gGH
         A8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772207044; x=1772811844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0pNuEW5DadTME76c1H2/bOIre54Jrgk8HxKShAN/0Jg=;
        b=nNImjHUqDEX8AcbzF02huMknvNXLS0UHlB5wLY/o47VRqAWkJHVSBJIVXo60o4wtS5
         Unw9VypSGlQcDR4xYjBggoEFYaRYVc0IZCVXdbTKSrf4Lk+yvMHg/UKYurmjfoBqatwq
         Y+IDDb51hOgowGF7K8qhgR+CjGE37cC5+7LqurxvMnVE29DXSP0rnBBfhkgexaOoDsgm
         V9MLgsyBFLQgSt6v590I36ShcgDsP10vK+QkEopFXhMRfDOYLrGxvaGnXN6xQFaNMqRV
         I5pYn/k+3Z53xfsL4m9ijrgb7X/h83St+sYUVMrrShPJkG9dTNb6owBpK2oYynXy1r5+
         LmSA==
X-Forwarded-Encrypted: i=1; AJvYcCUzdyZxdHO0bi45XjG0VsFbWSTw6fLbs3Edgl8Ri0Nctw+cvpDmxS5TWbMu7FnWEGyXZsuslIb8ptoZZ/9WX8IV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpp2/ALY2h7e3aTH0GwbLiO8+ijUjkpaoL9YG/FpumFJ2EiEae
	4142VDmr1g4FBH+5oLkiFIV4Yfo3R9WutxHGqzqY4WG+BxlgSYUBOSDlbkJgp6Mu3WM=
X-Gm-Gg: ATEYQzxTLRkP+kCv+gBZevpKvuXy3txp4DZruxqjdfDlOPlXzL0E/omIF41hXPrhl+V
	hj24lB+uZAYlH3VQcbFu0ThDCWPTyWmXRhLcJf93svRgjdt+NUD5wW2iUpHGvaMZpGrkzpMextB
	ypaNAW8bf7uph9Tv7kzUmp/nfiG6rYK7vWQYk10e/TLX9VBR/OBQaU0rAJ8Q5/QRELgDMiBh7Bb
	W1AmKb+Oa8Nr7u2YtW3ULxNSz/lRED2+h40r6AkHCWUoyyX/XvOFCW82r93wIgEkCuwMM+o14fd
	+4jxmMxnRa9tqS6NxiLn4OzX5LaOz7jZJA45XGjSL//aEP62eh692oWswcN2QjiN8CwPFTm1EOM
	/172rlmD231hbRzreCzELnl9aGIPPPMLzejSFiTwOdCMSMCCUiY6LeGlSRTfohcR3r2jQ5rJFvR
	OzqP0xZk/Ldj3Fu/138NNveul49DBQUw/V1Dxe
X-Received: by 2002:a17:903:2312:b0:2ad:ca65:a37b with SMTP id d9443c01a7336-2ae2e4d981bmr25603655ad.51.1772207044308;
        Fri, 27 Feb 2026 07:44:04 -0800 (PST)
Received: from arch.localdomain ([117.147.91.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6b5813sm60314305ad.63.2026.02.27.07.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:44:04 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: krzk@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jernej.skrabec@gmail.com,
	jerrysteve1101@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	mripard@kernel.org,
	robh@kernel.org,
	samuel@sholland.org,
	wens@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: sunxi: Add TaiqiCat (TQC) A01
Date: Fri, 27 Feb 2026 23:43:58 +0800
Message-ID: <20260227154358.206060-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227-placid-rare-markhor-cfbdb6@quoll>
References: <20260227-placid-rare-markhor-cfbdb6@quoll>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_074405_815547_8D1ECE19 
X-CRM114-Status: GOOD (  18.60  )
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

> On Thu, Feb 26, 2026 at 11:27:02PM +0800, Jun Yan wrote:
> > > On 26/02/2026 09:48, Jun Yan wrote:
> > > > TaiqiCat (TQC) A01 is a set-top box powered by an Allwinner H6 SoC,
> > > > equipped with an AXP305 PMIC, 1GB LPDDR3 RAM, 8GB eMMC, an AP6212
> > > > WiFi/BT combo module, one 100M Ethernet port, one USB 3.0 Type-A port,
> > > > one USB 2.0 Type-A port, one Micro USB port, HDMI, SPDIF, Micro-SD, and
> > > > infrared input.
> > > > 
> > > > It was released by UQsoft as a blockchain-based terminal and is
> > > > now discontinued and no longer supported.
> > > > 
> > > >   https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html
> > > 
> > > This name and footer at that page suggests name "ultrapower" not "uqsoft".
> > UQSoft (Beijing UQSOFT Interactive Technology Co., Ltd.) is a wholly-owned subsidiary of 
> > Ultrapower (Beijing Ultrapower Software Co., Ltd.).
> > 
> > TaiqiCat A01 was released by UQSoft, with its product homepage[1] hosted on Ultrapower's 
> > official website[2].
> > 
> > It should be noted that UQSoft's official website is no longer operational, and the 
> > company is seemingly discontinued.
> > 
> > Therefore, I think it appropriate to revise the relevant information to Ultrapower, 
> > if this is acceptable to you.
> 
> Yes, please use ultrapower in such case. You can mention all this in the
> vendor-prefix patch.
This will be adjusted in the patch V2.

Best regrads,
Jun Yan
> 
> Best regards,
> Krzysztof



