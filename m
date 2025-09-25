Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A52ACAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 14:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQHQjEm6KdWL1vc6/aoJqmYvJIjnRA6W3fpAuarwDrE=; b=d+7Y7lR7G3OijVgQJXzTcS/06U
	CTxaUVxbCUeaWc1DA102vSuZVPp4sdB+o9oAk67Kk6yN6KiSuynd7xnmiM/m2L4pbybVEGpsBXvIE
	lO1u9s8y1dtknskt1mUA/+NF0KYuxv3Ung6bHmR4ZogjKsnZz4BPei6DyK+AZCSyBuImCyUTEPIPa
	n1TrP40aOH9IqEZbrJzsOEHi03jOat3hC6NVkP/SEygWGawV3BOF2XA7TXPdxZl2ruC3t75zCd6MI
	DMTB1IAnWEBReMn36ysba3PXmMrqJwU0MqWcRjb+LgpFxMwfo1XyAubvNyPwqOjj1RHrMbZa62WNZ
	8Q7xlhQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1n37-0000000A7Cm-2FY6;
	Thu, 25 Sep 2025 14:34:21 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1n35-0000000A7AJ-0vQJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 14:34:20 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-77c1814ca1dso856951b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 07:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758810858; x=1759415658; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QQHQjEm6KdWL1vc6/aoJqmYvJIjnRA6W3fpAuarwDrE=;
        b=QLNvoCi6LgSTrZ+3bIIEztLz8IV6/Rru2PrhIc16cqxpFTEbFXhHfj+XsBkhU58c3c
         8BpGmU+ZaDkVpKIOmRkTBoZ0JO5xl5VUiyZFJyAUxDR6iCvTWlZTFfZIJzqkJsd4Tsm0
         tqx8cimsxoqvnpsp1N/M4PBJFgBGwCe25Av2qoU/fejyQzYcJ5pWX7fO5TueTS5RiSwK
         tEgG4sIueTZBjk0XDAV4FvVNt8WlvJXcgWhCg3EWgT5UhzVs3GdNYCUcabz0wzrEwvN3
         JmtP5ghz/vFoeu0C/80nqwpHR545AaNjWkCtNeelETEAh1ZC/MxnsC60oEgXWmw2r9fo
         EmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758810858; x=1759415658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQHQjEm6KdWL1vc6/aoJqmYvJIjnRA6W3fpAuarwDrE=;
        b=Fxvgodp7hwNR1LjBY7IsGh3Tm3yDsQzy3nkpX+HpAQfjZDdhZuTaIDlRpzMo6TRZ5V
         RXTJaWcNxQgeNaga2NfY/dv1l3itJXxumIRFBZTgr4rCY3fhHwe1ERUGcSyLruoQ1XRI
         mAfV3AXJzYwYHUzkCQD4T0J55jcAm1cThNxAIBZTUFCagqBedkJ6f+ophbPsNXa63owi
         qzXhfZektnBLqb2YaLFv0pHgn48T1DWsG7GiOGCsR7C0B8G4Px0qV09ZvebkBHpx59u1
         ijtt0k5HXok1uMmkNUQr8lx7tvx0FZBWw21Hi8UUfVlACltifsG55zp4erlg2nG1S4Kp
         6miw==
X-Forwarded-Encrypted: i=1; AJvYcCU3b6ZlHtPFswfybfFlz2dzkG37B5VITVtWmDEK6DneWor83FYKTRXSjGgAc37ckmOkd0tO+sB/+PLn1Cl+q9eQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwBowDvNXqkYjgXxDtwTQwIQyjeJNSm4mMdocB2tXDT6NSXX1+V
	Smt/G+cD0NJxJOdgdVeSUhEiicrjQw+XqIZra+WZYC0AqGowpx9YfyNP
X-Gm-Gg: ASbGnctQd/5c239DnuCMLmARNhN9WhIO5boNkX6/w2uVjCYj+1dho1OM+M8OW25ws/s
	unOkPZt3/4EnBrhDV7f5Y3R0X0qKFOoXhGd6wAT/XYfe8Uq+CtMTt8r7u0QaGi2zsGz0PscaQYV
	POMNpoWYCKj4Mp9udIkRUjtPWTAVcjQwmcpZq0YbQQuqByo425/A3E7F2An2Vzy8bNM9uyoIzAE
	66a9LCx9g6BKptLw8SYzmRzKI+lV65v0HV08vOSNAd4j4IRXOvYp+HRLIo81U3UXmBJgva4QuWS
	9P7SuGEeXl1ZxbaRwlxSCbj1Ln/rC/GOW2nTC2WiiJk2PqLYjKW8sN2+an9jDr8vDQ72rF/jX03
	StXRzGrHiRBEmP9WQN6aOL3i/LLQZCqTLGkw=
X-Google-Smtp-Source: AGHT+IHtHAEv8pJFUOuDFi9x9lY6fvRX5HRt2NaxDvCZUSfir5HznJYK8VHavo8T5HJ5S5KcaigutQ==
X-Received: by 2002:a05:6a00:14ce:b0:776:14f1:493d with SMTP id d2e1a72fcca58-780fcdf4cd9mr4319096b3a.2.1758810858249;
        Thu, 25 Sep 2025 07:34:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238e9a9sm2193140b3a.15.2025.09.25.07.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 07:34:17 -0700 (PDT)
Date: Thu, 25 Sep 2025 07:34:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Saenz Julienne <nsaenz@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 2/4] hwmon: adc: rp1: Add Raspberry Pi's RP1 ADC driver
Message-ID: <3f1295b0-b637-4fe0-b141-67f086960072@roeck-us.net>
References: <20250925000416.2408457-1-svarbanov@suse.de>
 <20250925000416.2408457-3-svarbanov@suse.de>
 <d07158fc-678e-4ae4-8943-168146a58fe0@roeck-us.net>
 <e53865df-7566-4790-9214-0af875950742@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e53865df-7566-4790-9214-0af875950742@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_073419_255325_BF69F7AE 
X-CRM114-Status: GOOD (  20.63  )
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

On Thu, Sep 25, 2025 at 07:26:10AM +0200, Stefan Wahren wrote:
> Hi Guenter,
> 
> Am 25.09.25 um 04:42 schrieb Guenter Roeck:
> > On Thu, Sep 25, 2025 at 03:04:14AM +0300, Stanimir Varbanov wrote:
> > > A five-input successive-approximation analogue-to-digital converter
> > > with 12-bit (effective number of 9.5 bits) resolution at 500kSPS.
> > > The ADC has four external inputs and one internal temperature sensor.
> > > 
> > > Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> > > Signed-off-by: Jonathan Bell <jonathan@raspberrypi.com>
> > > Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> > I just realized that there is already a hwmon driver for
> > Rasperri Pi - drivers/hwmon/raspberrypi-hwmon.c.
> > 
> > Please add this code to that driver.
> could you please explain the reason for this?
> 
> Yes, both drivers are for Raspberry Pi boards, but they don't share any code
> base. The raspberrypi-hwmon uses a mailbox interfaces to get the sensor data
> and works for the board generation 1 - 4. This driver works completely
> differently ( MMIO ), doesn't depend on the mailbox interface and applies
> only for board generation 5. Actually I don't see a benefit of merging them.
> 
Ok. Please make sure to add this explanation to the patch description.

Guenter

