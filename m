Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14109D10397
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 08:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OyD4sn9jsMLtWXgnyFdyRLUkPxYCW2TqpmGHV9ixsxU=; b=htXkVj2LbgIoRdFEnuuaU2FKi/
	iew5ke6Uuo3kG0bUIz8M1iYrCk703gYz+JIKsShWLP0RvmyGcRy+w7yU8O4N6U5KSF7iFXlKNYZc/
	3usm/51GZb8V++9sp6fQUyQwIGTA0gM5iF18SOMy+Ka+/ZeBTVWMhDBoWVxaMRMBOlW2igRwLkz/E
	UY+iUykAnppnyvkDPUjakXorH72mp4NedBwp3pSQVOZhpb9FV+PfPrcqwswePbs3yhW/rKWeh47J3
	OwfYp6yJ3iLFnGFE/Jcmva93QusV0tUErbEHXCMCzhTFkvFjibCHovqartnOhpi+yGXlTKCFpMrUy
	uYAWZ5kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBL8-0000000Eeju-0WAy;
	Wed, 26 Nov 2025 08:57:30 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBL5-0000000Eei9-1iEk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 08:57:28 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-11b6bc976d6so808293c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 00:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764147446; x=1764752246; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OyD4sn9jsMLtWXgnyFdyRLUkPxYCW2TqpmGHV9ixsxU=;
        b=FxUxYvYwooCLQqrEQm5QDSACYqICHeDdUsDZUiNLex7EPj76pMFrRREXgZpNmWZQH4
         lPDpayDwwdSsPjQ+tbjVtzsrmL2L/avwMU3NWpU+K//U6NayFiiUI07BnTsQsn3afoGg
         8LXVRInN3q3y4H4+9Mii+cACsH33jpSo9xH3jkSwI6tH/9e8Cbf6bJKM9mbHlUKXHSzg
         QAEIv/f2qwCOm0PT92Is6N+IEgg7se408VohNB5Iv92dQWY0bQj0BuTLjbPcNFOTK0pK
         8aSWYUubbdY5x/o4bcKyNH495Eu+f+QNvbW5/Ny2eTCS4kdo2R73/ZUrcKwE/DKdwoXk
         o6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764147446; x=1764752246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OyD4sn9jsMLtWXgnyFdyRLUkPxYCW2TqpmGHV9ixsxU=;
        b=qo2Yh3hMssRwIqHMphWAfApDnAYXFC4UbKlxVRGwPz/pn0Y3C6YjAuRgiuwvIotDYg
         v6/QZj2Ka1aT2HR1Q4jP9hbQvThMzNPRI0KwJLCJHn2azIUcpwq+SuzSQbVCwFGttqsu
         QtUg9V/VVNlD3eqVHMekYZ+ng69/PVwM5gg44kgHP6hLRK2pN50zUQeo43Gobk01rqcc
         B7Z6Ld1yhssuq34a6w0azqHGg6iYo0gRyZDFkDSaepMyKreSF4U3CDYpB0YfHDLc8Gsc
         LppM5qY564Ov8Drrh7LhH/rlrXk2gxE4ouMskUG7onTF/ToOibekp/VfhVcvRWKRLmAw
         pW5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqb3buyMW6U9EwdTZjar7Kd9zzKgIRnglr7CWseqwZb31AzKlRezX9QA/HcvpYREoRnUy+DwHB0lBLrRo2tifc@lists.infradead.org
X-Gm-Message-State: AOJu0YweHgDwNcKAprQsKdf2POfSwnUW7KS1flmfG+BLUWXZMAgb5+oc
	TSBIg6Ba7sVrfmLXvoCKvJAYcy7kjnIUD/m182ZrA6bWLTwsV0mPAuGY
X-Gm-Gg: ASbGncs1rMHpdSO38N6o9WJLv3OnE7pg1QYO5Cyd96xdsCMIe8Gk7IkkPBeHkV0Ezas
	krVX9UEsVGEdMpVGtWEuuvOU58K8Z2eJpZi1BJcOQ7aZVAHD3lQUc4/0nMPZnOabhiKEHn7j8Tk
	HGJdAJrMeM11qivyRLopFKaPnhz4JeYnTi3YPa3xh+Muwxa1KLxw1n4ZvlhtMPFRVImZLAqYCnp
	kZTz++Qnw9NjJHpexYbZSYVzXF8C87WNiHPTuPcz0wVGIjlBqiz3V/Tt/hwEERZwtE4qqj4qdX1
	2UQglJjKPwiXFUnPxhX8+ZGlOZ9APyd7d0IFP2Psxmezs0dm4m3wfsWWmYwBMe3tcT932qTd3JQ
	7AQgAFg+yFBA3v+DJL2fv+yCm9uJs8AGpNINV6c5iuaQq04TgFpXv0e82nuCDysl8ZQ2JFzeWe0
	hE+VQpYJ3e2uQMdPX4Vzu6orVXem4QYKQGTJlpiCpFGZ8=
X-Google-Smtp-Source: AGHT+IFrIMIkTPrxwRfvEMQ5cEoCTFWA9fomBn7RLpjcNkpm60ZPM71v6rIQ9mqGMQwZqmC/nqOzYQ==
X-Received: by 2002:a05:7022:ec17:b0:11b:9386:a382 with SMTP id a92af1059eb24-11c9cabc4f0mr12703137c88.21.1764147445929;
        Wed, 26 Nov 2025 00:57:25 -0800 (PST)
Received: from fedora (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93db556csm92664267c88.1.2025.11.26.00.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 00:57:25 -0800 (PST)
Date: Wed, 26 Nov 2025 00:57:22 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jacky Chou <jacky_chou@aspeedtech.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Po-Yu Chuang <ratbert@faraday-tech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"taoren@meta.com" <taoren@meta.com>
Subject: Re: [PATCH net-next v4 4/4] net: ftgmac100: Add RGMII delay support
 for AST2600
Message-ID: <aSbA8i5S36GeryXc@fedora>
References: <20251110-rgmii_delay_2600-v4-0-5cad32c766f7@aspeedtech.com>
 <20251110-rgmii_delay_2600-v4-4-5cad32c766f7@aspeedtech.com>
 <68f10ee1-d4c8-4498-88b0-90c26d606466@lunn.ch>
 <SEYPR06MB5134EBA2235B3D4BE39B19359DCCA@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <3af52caa-88a7-4b88-bd92-fd47421cc81a@lunn.ch>
 <SEYPR06MB51342977EC2246163D14BDC19DCDA@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <041e23a2-67e6-4ebb-aee5-14400491f99c@lunn.ch>
 <SEYPR06MB5134BC17E80DB66DD385024D9DD1A@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <1c2ace4e-f3bb-4efa-a621-53c3711f46cb@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c2ace4e-f3bb-4efa-a621-53c3711f46cb@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_005727_485509_43612FCA 
X-CRM114-Status: GOOD (  22.51  )
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

Hi Andrew,

On Wed, Nov 26, 2025 at 12:49:57AM +0100, Andrew Lunn wrote:
> > I try to summary in the following informations that I understand.
> > 
> > 1. with rx-internal-delay-ps OR tx-internal-delay-ps OR both
> > 
> >   Use "rx/tx-internal-delay-ps" property to configure RGMII delay at MAC side
> >   Pass "phy-mode" to PHY driver by calling of_phy_get_and_connect()
> 
> Yes, since they are new properties, you can assume the phy-mode is
> correct for these delays. We just need to watch out for DT developers
> setting these delays to 2000ps and 'rgmii', which would be against the
> guidelines.
> 
> 
> > 2. withour rx-internal-delay-ps AND tx-internal-delay-ps
> > 
> >   If "phy-mode" is 'rgmii-rxid' or 'rgmii-txid':
> > 	Keep original delay
> > 	Print Warning message
> > 	  "Update 'phy-mode' to rgmii-id and add 'rx/tx-internal-delay-ps'"
> > 
> > There are FOUR conditions in delay configuration:
> > 'X' means RGMII delay setting from bootloader
> > A: 7500 <= X <= 8000, 0 <= X <= 500
> > B: 500 < X < 1500
> > C: 1500 <= X <= 2500
> > 	Mean "Enable RGMII delay" at MAC side
> > D: 2500 < X < 7500
> > 
> >   If "phy-mode" is 'rgmii':
> > 	Condition A:
> > 		Keep original delay
> > 		Update "phy-mode" to 'rgmii-id'
> > 		Print Information message
> > 			"Forced 'phy-mode' to rgmii-id"
> 
> So 0 <= X <= 500 is a small tuning value, so yes, is correct.
> 
> > 	Condition B and D
> > 		Keep original delay
> > 		Print Warning message
> > 	  		"Update 'phy-mode' to rgmii-id and add 'rx/tx-internal-delay-ps'"
> 
> Yes.
> 
> > 	Condition C:
> > 		Disable RGMII delay at MAC side
> > 		Update "phy-mode" to 'rgmii-id'
> > 		Print Warning message
> > 	  		"Update 'phy-mode' to rgmii-id and add 'rx/tx-internal-delay-ps'"
> 
> 'rx/tx-internal-delay-ps are probably not required in this case, the
> 2ns from the PHY is probably sufficient.
> 
> > 
> >   If "phy-mode" is 'rgmii-id':
> > 	Condition A:
> > 		Keep original delay
> > 		Keep "phy-mode" to 'rgmii-id'
> > 	Condition B and D
> > 		Keep original delay
> > 		Print Warning message
> > 	  		"Update 'phy-mode' to rgmii-id and add 'rx/tx-internal-delay-ps'"
> > 	Condition C:
> > 		Disable RGMII delay at MAC side
> > 		Update "phy-mode" to 'rgmii-id'
> > 		Print Warning message
> > 	  		"Update 'phy-mode' to rgmii-id and add 'rx/tx-internal-delay-ps'"
> > 
> 
> These look correct.
> 
> How many different boards do you have you can test with? Do you only
> have access to RDKs? Or do you have a test farm of customer boards for
> regression testing. I would throw the patchset at as many boards as
> you can to make sure there are no regressions.

I synced with Jacky offline a few times, and I'm happy to test the
patches on my Facebook Network OpenBMC platforms.

Hi Jacky,

Looking forward to your v5, and please don't hesitate to ping me offline
if you need more info about my test hardware.


Cheers,

Tao

