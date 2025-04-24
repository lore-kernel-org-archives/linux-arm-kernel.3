Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC21C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 21:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hKtiIR8/1ANFiI3jvmxK88n9ocUCdqWIViGNXRe9MXE=; b=3GrNXu6FIpz62xPe8uDSD1c7gD
	Mh807giTHrDqxj060bE86c1+aGFEJJNXf0wAXMzZNBkboVfweyQCHnu0TpxK6VtUqsJF1Q+xzqd0Q
	iazHcrpBxdgeyaPuDjG1XpvazeTdr90Adhw031kZponR60G5sP4aVCmmlmyL415F6bNmTC1c7FkFE
	y2CIAMMbKLrhzT2oN61931zCmCTxv42FSTeBleM9gmWInm4Sprt+/2bsdiDUthR26ayRu9dINbKS6
	VDTllw3+8vOdqTXqPJEpcUg7hx20/eclzoXKKNHj764D6r12Bc/SqC/W0aIAO6ixa18MuNLllxfhO
	K2DNQMwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u841a-0000000FPDF-0cAQ;
	Thu, 24 Apr 2025 21:22:26 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u824k-0000000FA5Z-0tfz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 19:17:35 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso959935f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 12:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745522252; x=1746127052; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hKtiIR8/1ANFiI3jvmxK88n9ocUCdqWIViGNXRe9MXE=;
        b=J5aOLMYj/XQRjGCFtcDZVY+ouzho+0QsZCQGGx3kBshGrITnOzct5hpRSL1FJYRUUq
         zXyLcmf0x2B5r8RM5oA8EtVtlYexH6NV/Asrb5eRMCXIcEIq6BBQ37ibOqarAn6yaQAc
         0+oRxWEe1Wna22j6mI8qjCFbIeiRuGTyuN3PbmeOFr+HpGmZBB7oEJYE5Otsj0uCTYcO
         R6ePPNdUKXNi0Ufo/GXaFmKD5nAenk/7uoiZN6QoZN/CobYSB1BDRQ5TyEKmDTc6JDLu
         Ws8rFATePVM03FjuZ2NVuQqR00fwRHY/E232Bip5QA8mN0hKS7HHjwSd4Q1SCZawtMa/
         xA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745522252; x=1746127052;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hKtiIR8/1ANFiI3jvmxK88n9ocUCdqWIViGNXRe9MXE=;
        b=ViZ5v9LV+mWraZFZSdMwYX/4VvFXwdQ+81+FG6yeP0NCPjXQThLMzFOTNuc3ig/CaT
         zC/wecloVAVlycPLtslMG0v6+Jy60mFMbMSGQlBTPrxEIg2xj5S3cUucNoy2fVxp32v0
         0nIT9tQH/lqNe5qUfREuWkU7nicu1CUaAVhm1bV1UvxWBh/V5HLrM0tZ3D8+WTPTzD/Y
         7NPDA3MELbllnEfApX6QyZ1/hphdxXtlQaTJUnH/x1KAcKMbEU+O7/yV9e7VFrGsvTcj
         k6zu+HBW9RCrQKacPMRe+6VlQtprg50jHlEYemR+oRLR7pdy+QzMOn1bkT/m52xuWS6d
         dPUA==
X-Forwarded-Encrypted: i=1; AJvYcCUJHAfUlcARp8ncDs9bR66nC6w3eTtk/yU2ST6tD7SZiONp7XR1XLnOv6CPCATeFPRb7MpK836J9d2wRM23h6oQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy64mc9bTeCHzd5qKzsMYX1fYf/Eu3inmp6KtAaG7K5HrbUo1Eb
	LNFET0mkF5oUkprEB/DIUViEVmHGhDY/g7Eawvm7tJNbNaeXzY8n
X-Gm-Gg: ASbGncv8Yi7diGHllq8GqUkCXDNyC5suecyZhD7NIeC87lpja+k1rjtQZjxoAGaivXl
	EDddU8WXY8VJfqons7M3DFqoMY6GSlexZ6dbxc1TQjVGuwuuHo3Jk7EYUqh3r0YplcTKmKvyPxf
	WwFZUQPEa1PzTo9PUs7IxLrjFkfMIkNXR4VLOve/Qrm900jHHT3mjGz+PDsfRPhuwAL2CiSjzRC
	qxfwVKbeylEvYHukNXH0XHbwCsO2FM9u637jeuSoayq2LhVmJz3NcrVS5DeQ4nIf3JU49fJzyOg
	nsCDdRzLWX7O72F3TxgPNh0TMZN9penM1ngZZOD1
X-Google-Smtp-Source: AGHT+IGHUagr5uQkmxlICqpS4xt1BsRnNl8Y/nS1PqKVhK6DbPifS1o99SIUo9WiHCLLy1FyDQtZ4g==
X-Received: by 2002:a5d:64ef:0:b0:38d:dd52:1b5d with SMTP id ffacd0b85a97d-3a072a4636dmr351698f8f.4.1745522252237;
        Thu, 24 Apr 2025 12:17:32 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a073cbedc4sm156237f8f.47.2025.04.24.12.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 12:17:31 -0700 (PDT)
Date: Thu, 24 Apr 2025 21:17:29 +0200
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
Subject: Re: [PATCH v2 3/5] arm64: dts: allwinner: a523: Add EMAC0 ethernet
 MAC
Message-ID: <aAqOSRQCKNuezyUK@Red>
References: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org>
 <20250424-01-sun55i-emac0-v2-3-833f04d23e1d@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250424-01-sun55i-emac0-v2-3-833f04d23e1d@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_121734_248602_10882FF3 
X-CRM114-Status: UNSURE (   8.78  )
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

Le Thu, Apr 24, 2025 at 06:08:41PM +0800, Yixun Lan a écrit :
> Add EMAC0 ethernet MAC support which found on A523 variant SoCs,
> including the A527/T527 chips. MAC0 is compatible to the A64 chip which
> requires an external PHY. This patch only add RGMII pins for now.
> 

Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>

Thanks

