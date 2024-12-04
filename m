Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4568AE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 09:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0lKyObJsYIZ+s7QoNlqdjkApw/9Igt91fCr/HAkbPEo=; b=zZJDXWvbqkgMcytwoVi6RVW20V
	Mlw3qpqz4ym8KkFo23zLqXK68o28HEdzs2eax5KryAU1zNfNQvDAZBWdMsZfMhZm63zaVFSW3cCbz
	r3RDxITEXIVxHE8bgVWR2uA+2jW5alvLOmtNZa1CTTmRuNTizsQYDoPsbZUe4KS2F0hWmyzmjyTZ7
	YNIpaG/bqBvvKUwejoO2+N9R17YC5Bg9wPk7CpMXcxu9QRDBUC8yQlqBpl/cXzAszgvH5Vny6P65m
	wQRADYCqD38UQiKy1ohTKJOi2HMWlBmJGFyxFTi89Q95dYql34Yhu/5+vHNy4nfGbz9s6CrAIbwDc
	8RYbdEuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlvX-0000000C5nv-3t03;
	Wed, 04 Dec 2024 09:44:11 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIllM-0000000C3pI-0ANS;
	Wed, 04 Dec 2024 09:33:41 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-434a83c6b01so57831945e9.0;
        Wed, 04 Dec 2024 01:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733304818; x=1733909618; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0lKyObJsYIZ+s7QoNlqdjkApw/9Igt91fCr/HAkbPEo=;
        b=guWI6WhpB+hmlJm7y/LwNGgY19RJs51RghPjJ+OVfcNa1ABDn2FVbukOm1enkisbwF
         oJRS97mMf5Joob2Oo9Nle3sAV0zQA/FiFkaeCMHi5hplQ0z/M1pKBwvOVrzfJAKYdJZa
         +DPj8XwdLH8HOjn6U9crJMe8gvmlvwIdeqadjHt64JDG6ZBk5CGUruY06Z17SgGg4iGc
         K7mUsY2mjX5qW99HOlFqmZ23fFk9Z5nW85yDRiJFkdDQZUjuUCqsWdP2WZq6p1aXPHfM
         2dPr9rBCep+ZxCP0TLZVCMbg3x9lPrWCQdrOQleL3gSPwbz4CV8gXdXTPl8wEMqDDIQU
         9oBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733304818; x=1733909618;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lKyObJsYIZ+s7QoNlqdjkApw/9Igt91fCr/HAkbPEo=;
        b=cAV7wGRoUkKbvAe3FqLZXmX7wMSNRYyjeKO3VyHOnviv3eG6ATWLE3dFva1gMVJq+X
         5GDJn+VlPl7EgLtO+31lHyT05aoPXZZdmoTRg/vCSVej4oGnmL4uyg0sSpwj5ZWoyKZv
         ZrLLUvtWmTCuhl4iNwW7CyJymvD7KKH9nVYxkj0DmOWdYfhmaa4rxSjVwt95V2sefVd/
         WH89hEfPl1tSK1OO4XGB0b/MrCorA/nbka4a3viCBC5HQyK7RnRiqGBjtUtYhMWnqYAc
         Bkc8ozJh6oIQB2MuQJwuJmBy+pH2fSIRWnDTH9UT3iP1qsjFXzHdVChvVuf0h8ja/K+/
         dEjw==
X-Forwarded-Encrypted: i=1; AJvYcCVXtJjCu+AKulR1sAyASzPIwg+0Cx54Y5+EIJP7YjbBT1G1OBx0keS79Wwg/B5Z/uDPH2uI+jKlLvQM9o1EABzo@lists.infradead.org, AJvYcCX+K6rh56XefBQ9yk4IYLWsmRugy/MMWxHIZvdsp9bpj+O7wLUuxrVJeZv/AnoL0bVE2YmEG/AnkxdVhty1FsA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxbkOaPuDwwHkppqGfsSwELNQ4KXJjFj4o2IXO4EU5JdLVvvIbA
	j7nDqV74+5eM3P7BiKK9w7j8a9A/S/doq58haD8WZoBzC6SxqJ1N
X-Gm-Gg: ASbGnct6FeFZpxhRCSoRJSefLPLtVBOWYVilVODHBkZ/c1V8n+drI23T7eIjkQ3QlHq
	fZ6in+d7cL0UZUPi6dML0reQ2gK478PmzF/g1nL7u00nfJ0xTOsxlR8QhkUp1nEXeRdBg4Jg06t
	UcVgb93psrnqsSsPDrr4ZeydkYI+JmCvYIVYr8ahdYGUk79niUzR/MbVB5mIBAYi//ZfFlqald1
	s/Z0sDmyXPhXL3oXthpsVX3PjlMXZrjgkY61N/uoHWOghlemBMK1XEm1z05c3dlmZ0RHOiMpvvD
	PxqzAg==
X-Google-Smtp-Source: AGHT+IH/s8dECPHycbZW4A5CqIvcbgj0fpA7rWE3Kg3D1zgk6Q5Z6J5agkhMd5wneZvBY5ksUhkntA==
X-Received: by 2002:a05:600c:3596:b0:431:50cb:2398 with SMTP id 5b1f17b1804b1-434d48291b5mr18322755e9.2.1733304817815;
        Wed, 04 Dec 2024 01:33:37 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d526b14csm18364155e9.2.2024.12.04.01.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 01:33:37 -0800 (PST)
Message-ID: <675021f1.050a0220.34c00a.3a0c@mx.google.com>
X-Google-Original-Message-ID: <Z1Ah7YFSAGnTlWfw@Ansuel-XPS.>
Date: Wed, 4 Dec 2024 10:33:33 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v8 3/4] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
References: <20241204072427.17778-1-ansuelsmth@gmail.com>
 <20241204072427.17778-4-ansuelsmth@gmail.com>
 <20241204100922.0af25d7e@fedora.home>
 <67501d7b.050a0220.3390ac.353c@mx.google.com>
 <Z1Af3YaN3xjq_Gtb@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1Af3YaN3xjq_Gtb@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_013340_100467_77CC18F8 
X-CRM114-Status: GOOD (  24.41  )
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

On Wed, Dec 04, 2024 at 09:24:45AM +0000, Russell King (Oracle) wrote:
> On Wed, Dec 04, 2024 at 10:14:31AM +0100, Christian Marangi wrote:
> > On Wed, Dec 04, 2024 at 10:09:22AM +0100, Maxime Chevallier wrote:
> > > > +	case 5:
> > > > +		phy_interface_set_rgmii(config->supported_interfaces);
> > > > +		__set_bit(PHY_INTERFACE_MODE_SGMII,
> > > > +			  config->supported_interfaces);
> > > > +		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
> > > > +			  config->supported_interfaces);
> > > > +		break;
> > > > +	}
> > > > +
> > > > +	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> > > > +				   MAC_10 | MAC_100 | MAC_1000FD;
> > > 
> > > For port 5, you may also add the MAC_2500FD capability as it supports
> > > 2500BASEX ?
> > > 
> > 
> > I didn't account for the CPU port that runs at 2.5. The LAN port are
> > only 1g. Will add or maybe add the 2500FD only for cpu port?
> > 
> > Maybe Russel can help in this?
> 
> *ll* please.

emabrassing... sorry.

> 
> Well, 2500BASE-X runs at 2.5G, so if MAC_2500FD isn't set in the mask,
> validation will fail for 2500BASE-X.
> 
> > > > +		case SPEED_5000:
> > > > +			reg |= AN8855_PMCR_FORCE_SPEED_5000;
> > > > +			break;
> > > 
> > > There's no mention of any mode that can give support for the 5000Mbps
> > > speed, is it a leftover from previous work on the driver ?
> > > 
> > 
> > Added 5000 as this is present in documentation bits but CPU can only go
> > up to 2.5. Should I drop it? Idea was to futureproof it since it really
> > seems they added these bits with the intention of having a newer switch
> > with more advanced ports.
> 
> Is there any mention of supporting interfaces faster than 2500BASE-X ?
>

In MAC Layer function description, they say:
- Support 10/100/1000/2500/5000 Mbps bit rates

So in theory it can support up to that speed.

-- 
	Ansuel

