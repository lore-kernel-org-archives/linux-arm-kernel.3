Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A4DC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 19:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSlW0krI7TcCaxYbEGHHjPXVtbPo48FK+jfu/eXXjYs=; b=pqxpIhWmnDSZWUXyTlka5R6i4f
	8yStRCQXVhctHUUj6+aLJ75DJpAEO2Sh/nnnkG2qp03O+M3XH4ZJP7IbcI0xhNeTv1dCK6yS+0gjJ
	nGfN9dS7/UFU8ylY4GD38e3TIbeF+RdX/AErxfFiVhxroRYU9xfG8jARyfPVYlyO6W98xzo5ZQ/A0
	RXSq7/O5ora/l/S5m3TX8bwqGrS09pccPBok/ZeQrSlgysyfQFe2wKoztoVyT/gbbDEiiOhUdYvpB
	sPg99JpIRKNwesmetobDcxKeJ0TOunNSj5boopI5gd4AISODOQcxOU/vuegyOKxuXUGbt+JFjTQHu
	ED5Y2Hzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNWO-0000000DArh-2eiJ;
	Tue, 06 May 2025 19:00:04 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJtt-0000000CRMP-2YmI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 15:08:06 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ace333d5f7bso1091897066b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 08:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746544083; x=1747148883; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iSlW0krI7TcCaxYbEGHHjPXVtbPo48FK+jfu/eXXjYs=;
        b=KTVtNAuxnugWt2vOeGUtNOaFi9u/YnYcPPs2xwqsZswebKOJUMuD7QtS5E+HHzS7EU
         g8tsrtel+2qcOpgM2qYavt1cuytkK408QurYnZRRETbsqiipY8qyEe9ijJ4BBOXfjDY5
         9IzSupyiXjMmOhOVMvV4miNWp/aWcv0eptxPYntc1RlzG9l9V5UAEE06KhdyNfhEPMVM
         H7VLs8bgScySiFcc/+7EC3AubeBqMoLzD0kk/txIMoFWs7TM07z5r7tbzFAcgP77mIng
         UCHuWoAaIABzmkB6FcdyvjMQKlHSVLMxx6XHhvDqyHMp3ncRqJFYvsBMj+EVZZb2jHE0
         jqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746544083; x=1747148883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSlW0krI7TcCaxYbEGHHjPXVtbPo48FK+jfu/eXXjYs=;
        b=t7rLUe4985OdYS5ulO+XghxHFmTmzgFNJVNOHQrzuxu+T19XEpxI5ouQeVBes8C5qf
         jnguvClQ73pGXQRCbABSfJA/zZMjb0qF7A86/+ICBAzamronZkuCnqEAY+9/0p4DllEU
         UkNvWim1irEgCtbqfQi+kMqTAUNmDEQ0Wqn+gehzjKTral9dtOz/JWDL+CN00IbOdnGD
         5Bnf6cGFEUSN9eFB6LIdXL+KEq1y5Zl3FjqSi1kNZzLelib5BY5/LJHsv1oErRXMtHkl
         w0/++0ozF0TQcU+5MmIiECsX+eF3iXOqU10GMfuS9jFOilI6z6qmTNeqHVZG+5hM1OVC
         Zu7g==
X-Forwarded-Encrypted: i=1; AJvYcCU4/XfHhXbYWYpIn0/SaVLMU05WUWDsX2we+7BjVJCgpJFE/PGKIcVSF9pCg+yiCcZGTbWV3fSTaPvzx6k4Xyfx@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6iS0Z+pYcmNgR3iZwTlCRkyQ2bYaFceWYdKO+xNk0D8lYPSHm
	7qGp8/84r6Q0buFettKacaJygcdw5RDeTJBxzTA17MxL25K4oqcqxGt6ww==
X-Gm-Gg: ASbGncsw4AfHabMdGnvHfxvTjYzQEGDVE6epDd0JVJ7VLCYjmFSPPBX5qgedSaS3XEy
	RZCOtHsD8ActCyCmKlmFWrcDA+S+aMMfdj28jhgxJAgSrvPS5JUTOkIqFUldsB5DzAfQToXeNIj
	gPlJiwt5VZASpGAj3IPdLFaZLBluhl0bLOjBq7HwPIoL8AFfA6+bZN8E6WA3qAszlz1n69g2e1f
	2t+U1fw/z4T3xtx6vj8MJ2wvLtJtr4KGhlUduXI0Btld20IPfoG9uh+iRikr5IManiBZg8wS/wf
	xEXOPZTrz/wuhJnjZbHC0KzVeYcpmr88CxyajbmMso4v9qH0C6Nm8sNbiLww+XFzLtPP5k1FsbK
	swZ/7
X-Google-Smtp-Source: AGHT+IGfSx+4B/W7FMgVmlZfbM9EEgDK60WM8+WDoV25VvtvVNmkZqOCUufWt6ENzvib+aZKIvX8Jg==
X-Received: by 2002:a17:907:948c:b0:acb:6081:14ec with SMTP id a640c23a62f3a-ad1a4b85d03mr969159666b.61.1746544083138;
        Tue, 06 May 2025 08:08:03 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189147329sm713691466b.1.2025.05.06.08.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:08:02 -0700 (PDT)
Date: Tue, 6 May 2025 17:08:00 +0200
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v8 3/9] ARM: dts: Drop DTS for BCM59056 PMU
Message-ID: <aBol0PuY2H2E7FjV@standask-GA-A55M-S2HP>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-3-e4cf638169a4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-bcm59054-v8-3-e4cf638169a4@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_080805_648654_63A9AAED 
X-CRM114-Status: UNSURE (   8.65  )
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

Hi Artur,

maybe you didn't notice, but Florian already applied this patch (in V6):
https://lore.kernel.org/lkml/20250317132922.2698513-1-florian.fainelli@broadcom.com/

Regards,
Stanislav

