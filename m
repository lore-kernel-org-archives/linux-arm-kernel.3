Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01E5C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 06:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ouaLqm1R9pYu2kjb2/unKvQ+wVyFyZBELlahYoTUXkA=; b=laC70vide+CudoiGPBRd5267T2
	scEuPHl8kwXpUZHoXcPz3nuEu3XfZQDYXzlibpod/aWuf9c1rDJHoz0q4MiL5Us1b/B90JeThiVv/
	ISJL1GgC9sVXgw+UopJxXYQPzyBvb1ojkfnY1LZrbhOlPecx7n/ACSWDKqFhOGQVxQYFly9AIxmTU
	nZCS34vLTllMTjwaXTZqkKyLrpUaEN9vKR0zByooZuNaLYAJtm2h4KyQyBI2R70xTwWl9DB3TfZgG
	04gz7wiiHxoyJqb0adEGPWkvMGTQBw60x6oJ8RMnK4RQ8H0lC02vO4O3zoNhcyK48TMHuglZeiaVR
	Co40d1Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufuQX-0000000CMnf-3sbH;
	Sun, 27 Jul 2025 06:00:05 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufuO1-0000000CMXz-0CAa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 05:57:30 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-235f9ea8d08so31956845ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Jul 2025 22:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753595848; x=1754200648; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ouaLqm1R9pYu2kjb2/unKvQ+wVyFyZBELlahYoTUXkA=;
        b=QB65Z8PdQ7AobFFKlXKdkPgztYmn8C9rznxIqgpKBjgYYX2u2iWBBJvbyFjLgQ/ENP
         JGobDz9yWkPP/7JdTFmysSqTjviJFAWCilMo9zDlwWNtPkrpDjpceeYA/AxY5cEmAjIq
         0K9eRFPd+Li0pBBqIg8c8D6fEF03H33+3r2z/caKyuYIuUbLVEOxarRwbgI2zSTia8Df
         629tHXZgOjqo5G8wGduuhxb4HF8pzq5H33WJkpd4Pk5Ulf4vZfOx2+bVi82YJFFL0Clu
         1Xvzn+R+T8rNX2JzgDc7DGtEMOA9P9lYXOBwrK8lIeSkr+Ppm7CtKF2NW466HVukLRg3
         hMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753595848; x=1754200648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouaLqm1R9pYu2kjb2/unKvQ+wVyFyZBELlahYoTUXkA=;
        b=dpBoLBbcz5mq1SwGWRjuqPCP5a1VhnWhHyzKlEJWq7jKlkmqiHEn5nz9CasUNFP1DD
         dhSM0GUySs4SKRsaiLmld5um49/0wn03XZjuId8kGiuwit3fRCh7EeGPYu/x15CDnj8G
         rD8Jpu6ztDrqKJeCQ5vJytkwG3o9/ryCLuG7+jkwlUYMWS/n2akvWThugi22/iSz/3d+
         BplcTpLgrs7ulpbvLZK9tgo9HwMLvb2fS1V2pW1M5c82DHJkNdEO5f4JD0nwhr1RoeO/
         BAikeJzS6zNlleN+Y0Pzua2kKwKWBOwHeePlMuLASgYRJAiAxfQfi5KqAVPO91mddfTu
         ObuA==
X-Forwarded-Encrypted: i=1; AJvYcCW/XdGYkLXSxTSQmWE9secF75fONXLhlYVtdeQjcYjkeQq3JTBTpmRVRxFwf6/PHRPNDwBFEJaLDMz20JMHTupZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo2Z/m3BOzbALaepyFAosSDa18eGtl6uQ194nuNJCgcT7fGtJ4
	HL8Q8eHpWQRDLz2A7g4AKh88PIcutM4SOFzCvU/sBhToFygBzKH4CjS5
X-Gm-Gg: ASbGnctBVDMmk8O/AFApanybIyUNeItM+d0jhcC0atTNp9VdQfCSKmFRzGrTqqHBg+z
	Jx/IjPuf11eSkyY37/1oKy+ADTN4sBoVxSh9C1T3TIqTMNWxBCZwvLM8RjVDAL8FTJiPP8VphNE
	eLSR9NHjCdECqRJlvHTrytnTF/JxhwK5XCRN8WiI5DP9dFeNmriOd5bLGUJgbFzJ3ykB8FcHppn
	cFgcilid67n9JIBLI6cBb2ysQ+r260xZ7s1jqBsp1HGQMNErN58KRr4by9DdAEOofZyFcArgBPE
	gzQT7gRMJec+bVZSzyQBZUTAp83I1X4m3JsgA0yepL4LtjkCL0JlP60PWrCpN0SN2WJA+RLqvAC
	e0X5KaFugZcak3++Lj04m3Toq4EOIzKso0HXf0iwCyljDHeUJb6mgZMatKwX+EATAo+4Bpqp2oo
	0=
X-Google-Smtp-Source: AGHT+IGq8V6jL0qsxc/xLYXjd9K12nmc3vEi5z4imGq1hQgK/s5MM/Z/wf4Ba/rfxpwQws59Tqe8tQ==
X-Received: by 2002:a17:902:ce8e:b0:23f:6fa4:1567 with SMTP id d9443c01a7336-23fb2fefd31mr99604175ad.8.1753595847477;
        Sat, 26 Jul 2025 22:57:27 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe30bce5sm28251825ad.27.2025.07.26.22.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 22:57:26 -0700 (PDT)
Date: Sat, 26 Jul 2025 22:57:24 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH v3 10/13] ARM: dts: aspeed: Add Facebook Fuji-data64
 (AST2600) Board
Message-ID: <aIW/xEfJX/UD1kje@localhost.localdomain>
References: <20250723233013.142337-1-rentao.bupt@gmail.com>
 <20250723233013.142337-11-rentao.bupt@gmail.com>
 <d09667e5-992e-4ced-ae30-7a4116a72c62@lunn.ch>
 <aIGGdbIX9HaV4dB/@localhost.localdomain>
 <769d6817-ee97-4a23-b013-29bc875a00cb@lunn.ch>
 <aIMTvUyHGd/ikKY9@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIMTvUyHGd/ikKY9@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_225729_090606_29A5E973 
X-CRM114-Status: GOOD (  25.58  )
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

On Thu, Jul 24, 2025 at 10:18:57PM -0700, Tao Ren wrote:
> On Thu, Jul 24, 2025 at 02:53:39PM +0200, Andrew Lunn wrote:
> > On Wed, Jul 23, 2025 at 06:03:49PM -0700, Tao Ren wrote:
> > > On Thu, Jul 24, 2025 at 02:03:20AM +0200, Andrew Lunn wrote:
> > > > > +&mac3 {
> > > > > +	status = "okay";
> > > > > +	phy-mode = "rgmii";
> > > > 
> > > > Does the PCB have extra long clock lines to implement the 2ns delay?
> > > > 
> > > > 	Andrew
> > > 
> > > Hi Andrew,
> > > 
> > > Thank you for catching it. I didn't notice the settings because the file
> > > is copied from the exiting fuji.dts with minor changes.
> > > 
> > > The delay is currently introduced on MAC side (by manually setting SCU
> > > registers), but I guess I can update phy-mode to "rgmii-id" so the delay
> > > can be handled by the PHY?
> > 
> > That would be good, if it works. The problem with the current code is
> > that those SCU registers are not set as part of the MAC driver, so it
> > is hard to know what value they have.
> > 
> > 	Andrew
> 
> Hi Andrew,
> 
> I set phy-mode to rgmii-id (letting BCM54616S handle RX/TX delay) and
> cleared SCU350 (MAC3/4 RGMII delay) register, but somehow BMC is not
> reachable over ethernet.
> 
> Let me see if I missed other settings. I will drop the mac entry from v4
> if I cannot make it work by next Monday.

Hi Andrew,

I made it "work" by updating phy-mode to rgmii-txid, and it seems like
AST2600 MAC introduces RX delay even though RXCLK delay setting is 0 in
SCU350 register.

As I'm not 100% sure where the RX clock delay is introduced, I will drop
mac3 entry in v4.


Thanks,

Tao

