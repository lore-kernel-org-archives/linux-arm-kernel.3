Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3112BC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 20:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5W1PPB8C5k9Rxvd4JqWh8H/eOLc6K5SLc+31IQB3dkE=; b=nEACQLi+sHbrYbaPF2ycwWeRmv
	iWX6z7+I5+r5G/eHaNNu+nxO2yY9AsdGTVD5Q8fDenhrxlGDII2egCCFx971A1dKekXzrVJWaMcXH
	44GZbogjp4ffYtECD8sqpqE9XtG9spZPKz2HBKSZ3EZMSrn7pHYs+V5JoFn4VFe8NLV7EFEkmFD1A
	MT9jog6OzvPyTSw5dMeXPYyNBXMdeD1UTCxD0DbkXBcmqoCxKHl1wlW17mhKBDkOqFv/tUfwIDi74
	lvgtA/3FB/uwq5BUgBj/Lxsjn1/T1uX+4mD4S30tV/emDY7TuNkqrjkA9SysN6uUXgOnZifHj3dJD
	yV65Ze2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trNPV-000000018KC-09QP;
	Sun, 09 Mar 2025 20:38:09 +0000
Received: from mail-pl1-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trNNs-000000018Dv-04he
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 20:36:29 +0000
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-224191d92e4so56575465ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 13:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741552587; x=1742157387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5W1PPB8C5k9Rxvd4JqWh8H/eOLc6K5SLc+31IQB3dkE=;
        b=s0BSuCKaZ8Y/5eZRmhXJwqnsVOLGswrxG4Y1HmLD2PsEqJmqS69Q69bkzuFGatbeFs
         LhT+isdI9jssqRxRk7CsvL17YxxqHNlHCNeXbwcXfOOngmiDbR/AzOw4Kl5RpCa1vAh0
         9lsO1NdZ+Vv4+kWpgedy4XRnoE56wPbmUdB0Do5RehJjtJtUNgKxaL2C6pK2SD5kvJIl
         82rp2Ixzv0iUkjSQx1iUS7qaa2XcIcrTV6IGjculuUdC99NwaB+r22V3VaqGACT+bkAw
         +x1E/hxkrpe6qhT+ei1336aTNl/swXS2ci6wsmEU3jKm16xCfPi2NdcgmVMmgy3Golg2
         cgCg==
X-Forwarded-Encrypted: i=1; AJvYcCXveQucTgggaEaNJSe8nlVDeGPGaIKtKn/BRRKgutf+8w5soSg2mhMehyx0QTeJbgWgdqaJc3jcCzd9cmnSjtnE@lists.infradead.org
X-Gm-Message-State: AOJu0YwbBgKp3PBxaBsuNzzREdt2tiNbWD2D9keaKtfESbYc8zLE9Iqu
	GKHDCCWt8ZRsi+mjsTOLULzRVyurEIaaJpN8kdnOdJL0kMrxFw2o
X-Gm-Gg: ASbGncswqQv30+XWuWPyYctyveF8XuRf8tA69OWww4OATgvbaCIWgKgDXgapMyvpMhr
	Tyu+miyZufF9DOZHj3yQujxb1gASXqo6hM9t6j7KPdWCbuCxOpQzSA+3qwM4Ww+1rxcZmy7vw+6
	QSPj5I+EfkgJNCreaDCfFdQc+elyfBgXyoaT+rxm4zwIpeOHL/fNxEblQ0yME9s89U0sHBkPZNo
	Dg1h6tJh+2A5zhWwBWqdacgo9Zfq6GxaZNbqf0LQFw2cCGePQaDdECxHX2cVwBkYSXLjSkQIyga
	xjcVbZcmJvCSsX2F+KbkCzQt0pvFnnzYOxg/plym6GNaZErQSfdMfRIe/9kLAt+4GFaCrt8sUcU
	iw/3WKq/x6Ar4fg==
X-Google-Smtp-Source: AGHT+IHj2p8QQGuPQO35NOVEoLjztQAIUj/vuHS+l9hV6ZdhMc7VKvfvvYb1Hm2TLPNP1gLnAWZ+5g==
X-Received: by 2002:a05:6a00:4b4a:b0:736:54c9:df2c with SMTP id d2e1a72fcca58-736aaab75e8mr14689147b3a.15.1741552586706;
        Sun, 09 Mar 2025 13:36:26 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-736c30b3a0csm2793283b3a.88.2025.03.09.13.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 13:36:26 -0700 (PDT)
Date: Mon, 10 Mar 2025 05:36:24 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, l.stach@pengutronix.de, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, bhelgaas@google.com,
	s.hauer@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	imx@lists.linux.dev, kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] PCI: imx6: Use domain number replace the hardcodes
Message-ID: <20250309203624.GB3679091@rocinante>
References: <20250226024256.1678103-1-hongxing.zhu@nxp.com>
 <20250226024256.1678103-3-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226024256.1678103-3-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_133628_054987_38C6A547 
X-CRM114-Status: UNSURE (   8.13  )
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

Hello,

> Use the domain number replace the hardcodes to uniquely identify
> different controller on i.MX8MQ platforms. No function changes.

Applied to controller/imx6, thank you!

	Krzysztof

