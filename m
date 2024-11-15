Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AFED68BDC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 23:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kL+cS5EvQ3n9arZXmohSwmGYBlKGAKyqHLz8twlVd4=; b=FDQqwHqQGfu6cCmIHT/Sb8yIF+
	Q8AThOw+kICmDv/B+wSYTi0MfCm7KWNbK0IPjs0LBxMfN+/BFdOoYeC1B/KXfgR8F/mu2owF8kaIc
	rFjpKHK1KM+El477P5y6orjtRor7ThBXedOpKX5KrEbfzXuyO4j77kXqjlpCXw8fBO8X4dZPOaXtX
	dt2pzi7xARY4YHWcHgf/9Y0JyJ/RZA+Ig9bpQTLS+lqxGznm4V/U1Kcg/9jojBRNWB2IEPTn94ask
	0YTlQtdvAIMVWOCH3bvxD0fOebYtNhHL33Gx7v6k/X14EKlgJCHV09jS4E5IUMCg++AfMwvXZL6JF
	/LLI99Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC5N5-00000004VMb-1FmP;
	Fri, 15 Nov 2024 23:04:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC5MA-00000004VDh-12tb;
	Fri, 15 Nov 2024 23:04:03 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-431616c23b5so13504595e9.0;
        Fri, 15 Nov 2024 15:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731711840; x=1732316640; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+kL+cS5EvQ3n9arZXmohSwmGYBlKGAKyqHLz8twlVd4=;
        b=EJqLHFuhSL4divXqC97iWkEpnFxYqibgrVL+iC1ivvL4r/gXNcRsfSOi1fVUGGs6uk
         7FWahcsCd6KBlSzBmB8SnWmwiY3mE+uJyNU7vVrNGSnGKRHoXL4uB1tx14SrgGkFwcH0
         Zoy8Kq6criNiELofkf+iM0+JZ8kEOohc1aqhOqVEMWTyFc+cvtg4CMrtvIvrWC+8lsbv
         puPa3ziCEW/Ljh62FUJlphIvSj6v5Gmx+tsJJZ0bx2ZupcDQUkkixzVUuwWFwKK9eo9H
         YFoTmYwdAHGJi9cApTdgsmZfQ3cA63AJ6R3U5WZFs+o5A4qFHQL1N7ESyryOUV7kRsxp
         dn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731711840; x=1732316640;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kL+cS5EvQ3n9arZXmohSwmGYBlKGAKyqHLz8twlVd4=;
        b=Tcy6RRZjcaeNp+I+N7xR7juKbF88XK5OYnP24oh5v1u/h5qc0+cK8yc4VZYVWNoE7h
         ndbgNogMJCDhOtH9JFyv5pATkWpPt3LV/RQNF1Dc/r1O50PUU9hD6oex4PdcucJwnSjO
         mRk3HZas/l8a+TMb/hbcIstIqh3OmShE02983un+B1AttfC/slD7Wmd5TkG7IlJB1f+P
         ArwAPVUlRh12yNOALFgC8SquRPDZSqEWxEy5EMNbSokviFilgIiaI5jDydZ0vZb4dfPD
         7OYLI5JvpIa8PTVCCdjGAu7k8GFNBwq7sBh4Efffagme9or/RbUWPV4F4PwaWbyvkmEC
         ainQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQlgt04jzz8dron3QzEUsy0/1TJALR2AQZC1N8y5aOOsQOCPp0pCED30iZx64dhnW4mvKbxP+DVK8ey5QKc3g=@lists.infradead.org, AJvYcCXI7FrNxtk1UJTgWnwKNUVynyFw/5009/RenYbs2FYb3RFRyiEJ7PZZXLbH/XC24bNtEO0spCCGKxTLz6AkVOjl@lists.infradead.org
X-Gm-Message-State: AOJu0YzI7OmffUMUOcWIIW9C3zjaIG8r5//8uv8hZPEs97xejw8heAzX
	YyJlYAmPRygdZq/ZJA80UUL6pUCYARS7ZVUaEZsweHXdUAuxxhcF
X-Google-Smtp-Source: AGHT+IFn0fKVGf6BpBp5O3iANa0DxDXJALEgYAxM1KyvBAcvk7mElBpZceoItdzxTC/3s5Ak5XOV3A==
X-Received: by 2002:a05:600c:3516:b0:431:5226:1633 with SMTP id 5b1f17b1804b1-432defd2589mr40395195e9.6.1731711840247;
        Fri, 15 Nov 2024 15:04:00 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da24498csm72756525e9.1.2024.11.15.15.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 15:03:59 -0800 (PST)
Message-ID: <6737d35f.050a0220.3d6fb4.8d89@mx.google.com>
X-Google-Original-Message-ID: <ZzfTW_cjJrGqLUff@Ansuel-XPS.>
Date: Sat, 16 Nov 2024 00:03:55 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v5 3/4] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
References: <20241112204743.6710-1-ansuelsmth@gmail.com>
 <20241112204743.6710-4-ansuelsmth@gmail.com>
 <20241114192202.215869ed@kernel.org>
 <6737c439.5d0a0220.d7fe0.2221@mx.google.com>
 <20241115145918.5ed4d5ec@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115145918.5ed4d5ec@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_150402_287170_8DFC406E 
X-CRM114-Status: GOOD (  19.66  )
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

On Fri, Nov 15, 2024 at 02:59:18PM -0800, Jakub Kicinski wrote:
> On Fri, 15 Nov 2024 22:59:18 +0100 Christian Marangi wrote:
> > On Thu, Nov 14, 2024 at 07:22:02PM -0800, Jakub Kicinski wrote:
> > > On Tue, 12 Nov 2024 21:47:26 +0100 Christian Marangi wrote:  
> > > > +	MIB_DESC(1, 0x00, "TxDrop"),
> > > > +	MIB_DESC(1, 0x04, "TxCrcErr"),  
> > > 
> > > What is a CRC Tx error :o 
> > > Just out of curiosity, not saying its worng.
> > >  
> > 
> > From Documentation, FCS error frame due to TX FIFO underrun.
> 
> Interesting
>

Seems it's even supported in stats.

> > > > +	MIB_DESC(1, 0x08, "TxUnicast"),
> > > > +	MIB_DESC(1, 0x0c, "TxMulticast"),
> > > > +	MIB_DESC(1, 0x10, "TxBroadcast"),
> > > > +	MIB_DESC(1, 0x14, "TxCollision"),  
> > > 
> > > Why can't these be rtnl stats, please keep in mind that we ask that
> > > people don't duplicate in ethtool -S what can be exposed via standard
> > > stats
> > >   
> > 
> > Ok I will search for this but it does sounds like something new and not
> > used by other DSA driver, any hint on where to look for examples?
> 
> It's relatively recent but I think the ops are plumbed thru to DSA.
> Take a look at all the *_stats members of struct dsa_switch_ops, most
> of them take a fixed format struct to fill in and the struct has some
> extra kdoc on which field is what.

Thanks for the follow-up, they are the get_stats64 I assume, quite
different to the ethtools one as we need a poll logic. Ok I will check
what to drop and rework it.

-- 
	Ansuel

