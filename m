Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28A7D3ABF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 19:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OG1vbKR+3pDFc8nEwm1ZvVOlqvzLfcT/ZGyivy84CdU=; b=lTxk+I9lLVQ7ZG5Iooi2pfzmzq
	EEoQtLAMAaoN+i6Mxub/2CcXP894IgJvIupmEjSCDccMI3FYM45yKbsgzFCpTHAqWPVlVlCgNBhKH
	7CUyM699xOIixF/z1qdZRLTLVFikg0sQ1mSsLU9+S2Trp5/HIoxIMnPNEFJM+jOTUkeVVlEfIM7D0
	10hJIlr6F24im6k7SGnfpArPbGLPsB6w16NOXvWLH4RTLu/Gcf1EQkp1jfkWaNGvVEKsc24Ao8NIZ
	UzTr28Qp6WXY4moQLroQ4UA2g1YXFs8RDLminpCeJQGt6AtnpvMmd2gOmEfFNS8JtH4lFELawGHKh
	MLiAMsvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAa3V-0000000139G-0mdl;
	Mon, 11 Nov 2024 19:26:33 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAa0Z-000000012iE-0KYE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 19:23:32 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-71e49ad46b1so4135508b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 11:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731353010; x=1731957810; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OG1vbKR+3pDFc8nEwm1ZvVOlqvzLfcT/ZGyivy84CdU=;
        b=K2vtQJfQOuhR+MXt2U41Vlqr+hAE6wM9QMT2XuZO+uDV4XrB5Th7H/pkbemSirG/TL
         pAMh1rmggGpycKcQPTa+wlRoxkS0S/rmw69x5UXo/Mr7ObcPr6YUWCoApUqI3WtaDLS/
         WSLwP86SRsMIWRmaYo8hNA8x58e9u6U6BUh8pvg72aFR15rdfAFnMoN00JD9NFetHRTY
         kLTggD4byKapVERs5tqzN6BMzx1DHCIJOLaxwBdu8GMCBS2gSjN5BpnuZLYTiyVN/Jtc
         zHGCRY+w0FErr7tcfkQN0LC/QoQQ5sVBy/ShcA+ZOw4H+6O9mSzsNc78kbn+1c9veCRe
         xFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731353010; x=1731957810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OG1vbKR+3pDFc8nEwm1ZvVOlqvzLfcT/ZGyivy84CdU=;
        b=En/f3Ot8eKW0j3rznpJOhAkG0glZtTP7OjwbSongg5Y3GM1kxo4LJWyKUOgL2ZET12
         xErZp9/jfPv05kzyy5LjeKlqNhf9behj7Xiu899yI8tc5YhEWqKmKaMnEqDjjmsjiUPG
         iBv1oW5XFTs82+okH4l+tLOP+XrybpFudV8/hp/+M8tE2kWLLLtBIveGvS3be4tImLhE
         B6bfTmRHjZyl6XfiSLKu2lG/A2N41m+jerlMhIfn1h6y7pSkGpVwd/2pr0KlsCBYaIl9
         fSBnN1094wz1XGXId0td3VygH3WLjmPmKkQVa299B0VoQ/LlY/dHyvSdUKxgLwTPLcJT
         J1fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUagXIzs4MJ/IvOtbIe6vKd8H+CUz81XSjP0F2tQPWVb78vFm0qKBjqEYCdYhQXbJXSriOz0C2RjiLv43eqJOH@lists.infradead.org
X-Gm-Message-State: AOJu0YzPJLpBX+ZfXPcJ/gNChEdvKDPa6H6a13oHZumdlyd9AHuXQ1M5
	mX69NOZIDmDL0VOE2zCPS/nQnlI7LrBrbmsJScFa0/dXIcbjz8aN
X-Google-Smtp-Source: AGHT+IEOXb9dMYWoaOSDkxeJwpcmRG5zOxNUAn9W/2lBSOlh8h6XPV9j5KFH5WXswgBqfSkR4E6eqA==
X-Received: by 2002:a05:6a20:9150:b0:1db:f89a:c6fe with SMTP id adf61e73a8af0-1dc22b00e61mr19740459637.32.1731353010371;
        Mon, 11 Nov 2024 11:23:30 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f643cddsm7591486a12.54.2024.11.11.11.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 11:23:29 -0800 (PST)
Date: Mon, 11 Nov 2024 11:23:28 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 2/5] hwmon: tmp108: Add NXP p3t1085 support
Message-ID: <576b3e70-9c09-4d8e-8b3f-f98a801b20dd@roeck-us.net>
References: <20241111-p3t1085-v3-0-bff511550aad@nxp.com>
 <20241111-p3t1085-v3-2-bff511550aad@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111-p3t1085-v3-2-bff511550aad@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_112331_144316_B80D3500 
X-CRM114-Status: UNSURE (   9.57  )
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

On Mon, Nov 11, 2024 at 12:31:59PM -0500, Frank Li wrote:
> Add compatible string 'nxp,p3t1085' since p3t1085's register layout is the
> same as tmp108.
> 
> The p3t1085 supports I3C interface.
> 
> Update document tmp108.rst and Kconfig's help context.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied.

Thanks,
Guenter

