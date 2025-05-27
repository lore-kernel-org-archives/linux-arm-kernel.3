Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467A3C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 13:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/ugmzgvO142CU4ox6G+tmUexbV2T5LSjf/umBdH9s8=; b=WFQF1Dr7w/Yrku48+KqEUI8r0W
	C6nIbsn4CxnLJHSfoopBVr/avXxFCIw7F5xBWnF328iVJ//S37Jp7MVkHPF8G1ZBys42wiCgNsTXM
	1CiSPCHq9o2h5sb9T4VFq5IBmUAoqX79qrEK1P3Dhfqx3WzMBzG00bcN95T09zlphcUKEWsz2x8Lu
	GA+dfrds8M7bdMN3FUNLegWdgxTi2jwG7TSVOj/oq22XmEoflrMcpOC6Gp02wBFiKTLyzrwdPSYoN
	i7nTGHtXxmhC6cTopeJlW1ey6x4l3Z8pyi1xkEii52ovWOKs3/J0kLK9erWCNhBfVdEF7MiV0hPls
	G8/C0EyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJuKh-0000000Aoxh-0sZs;
	Tue, 27 May 2025 13:27:07 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJu6B-0000000Amn6-1KyO;
	Tue, 27 May 2025 13:12:08 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso590850366b.3;
        Tue, 27 May 2025 06:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748351525; x=1748956325; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/ugmzgvO142CU4ox6G+tmUexbV2T5LSjf/umBdH9s8=;
        b=WPuHiTv6t+ywl6rYUyv+tOx2GBcX/2lwfeVOzKBZScSygbCEKgwgSXJYnEoblyUmH0
         4DWlMSnbhMd8//jAcO+Nv8Y4L2v3W3a6LECgTRLRvjqy/7iIOgmdfdFIcZBJoyEdOgGg
         DCwA6PcxdfCjK83oxZt8e4vpCZnno3J+iKkteprnz1viOXBiDpXAGNYVjJzaied+Nrm2
         fl28n/9U1uaw8Ks/ikXcRCYcitZQ3C7PpuYaD70LeWrsb0OlvR4rtaXFGgTVvqA6yPJG
         6eNFYeolzQg5DzTSXuoUHPgjSvprGeQB3WRC7wV/Vc7ccEVTnSC0JpxsjvlmHLYYBxNR
         q+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748351525; x=1748956325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/ugmzgvO142CU4ox6G+tmUexbV2T5LSjf/umBdH9s8=;
        b=GYOCnDeeiYfI0O5od4Sl7KfDSh1NyG+BuKNLtjXNrq0UTbJCllGruD9fU/TFkV6i8l
         bQeJPh/sEao/MQywDqVZ+2XeqTKp2TYyvk1f93YHLXZaLOs6R+sGVC7ODAIVJShQKJHy
         PRAIKEPKFYecCBnikn4OjeiOSk8VF3DYPZUUXOK2D9m683dEMH7hb6QoBpTPWcl2kSdt
         nXrs9T0fK/1INQ5f+dTYMadfdUE2Dh6Wc595ePa/BxNqFvaoiT9hQFMyhG6gbNVEBpno
         +rYe52q2xNl9MCoKik1UwhmbjLyzh7rooGnAcD6SzEWG2ssZh40gsBvPtLdxyUdIJGWe
         VWTw==
X-Forwarded-Encrypted: i=1; AJvYcCVGgZ20Xw1jsVYoOVfXorMsNLxIyR4D3btR8Ej7TWTG+CpsG5o9GUI3RAwulEPsY/G0b0i3f9BwB0EidNqhVlQN@lists.infradead.org, AJvYcCWJt6Vw2q7qrmXUauK6a90wI/fjNqyiFG75dlj208qCnK+cj+LrIpIspCc+jb5dJUZz/MQ5UfE7fYTYlIoONSc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzbVd16+Zdxrbgijg8qsBHbf6wahl6kn4i1jQI60U5+8GdmsG6u
	ze8rGGMgvgqANrbDDq4pPuOk/+3WUVprWNpBQjB2DsG9QQd0m8hGAI4k
X-Gm-Gg: ASbGncslO9Cqu29XN8mzT6AQNYcdAs7Zef3BVJ/CbiRVfhvfa4yRZF1+AsxppfZtf67
	B8V8TZDr1GRpxfCgC4XnNO/lY4DB42oZXQD99bPnJvuKtFTSiWCz9uxIgVuJaJ6FlSmzZgfyQkg
	QvPZ1YFg71n52jWcnQSImJd9VYkWhaEa+XLna6A/mopInrPuImLwEBaYUpRGvyBQLquni8Bz9Rr
	KUxfdC+jNuD7cmuSoXz1R0s5+nj21ThLC7iF9qi/ZHDuqlKb0GqZYo1qSyVTwiHEobKGmfyxeEW
	hExpWvZPMuCzce9UF3irnA0q1/+Kshu9n6YJI5/6eGsWooVDaG7unoydLCM1YN5cSDi0XhQk70R
	YkPtJEgEBT65SFSBMHNGAC9J0q+1YcA==
X-Google-Smtp-Source: AGHT+IHB0ZXKkcg0gnpJjaiU1yTkVnD2JMx0qD+x4LssRGrwt4U5bwIxE9XFTakPQqpfUeS1dTan3w==
X-Received: by 2002:a17:907:808:b0:ad2:46b2:78b2 with SMTP id a640c23a62f3a-ad85b0e0479mr1012816566b.18.1748351524889;
        Tue, 27 May 2025 06:12:04 -0700 (PDT)
Received: from localhost.localdomain (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad5d2c6dbbbsm793002366b.117.2025.05.27.06.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 06:12:04 -0700 (PDT)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
X-Google-Original-From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
To: foss+kernel@0leil.net
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jakob.unterwurzacher@cherry.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	quentin.schulz@cherry.de,
	robh@kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: support Ethernet Switch adapter for RK3588 Jaguar
Date: Tue, 27 May 2025 15:11:42 +0200
Message-Id: <20250527131142.1100673-1-jakob.unterwurzacher@cherry.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250523-jaguar-mezz-eth-switch-v2-1-aced8bf6612d@cherry.de>
References: <20250523-jaguar-mezz-eth-switch-v2-1-aced8bf6612d@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_061207_354881_5FF3DDFE 
X-CRM114-Status: GOOD (  10.46  )
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

> @Jakob, is this something you could check? devmem2 0xfd58c31c w 0x3c0000
> should do the trick to disable the circuitry according to the TRM?

I measured TXCLK vs TXD3 on an oscilloscope on gmac1:

	Setting	Decimal	Actual TXCLK delay (ps)
	00	0	47
	0a	10	283
	10	16	440
	20	32	893
	30	48	1385
	40	64	1913
	50	80	2514
	60	96	3077
	70	112	3565
	7f	127	4009

	off	x	-315

Setting = tx_delay (hex)
Decimal = tx_delay (dec)
Actual TXCLK delay (ps) = Measurement from oscilloscope

Plotting this we can deduce that one tx_delay unit is about 31ps.

We can also see that turning off the delay unit does not give us zero
delay, but setting tx_delay to zero does (almost).

I did this on the Rockchip 6.1 kernel because it allows to set the
delays on runtime via sysfs
( https://gitlab.com/firefly-linux/docs/-/blob/rk356x/firefly/Common/GMAC/Rockchip_Developer_Guide_Linux_GMAC_RGMII_Delayline_EN.pdf )
but I don't expect it to make a difference.

Regards,
Jakob

