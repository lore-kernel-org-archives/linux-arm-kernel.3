Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1178ED216A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 16:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhOkEme3R2b0z1JToTf4scmIbojsMBoLPZmWVqYRzNs=; b=EY8ZNy8iKB7GKxx9xL6gE9dDjY
	cjzCxH68csVYNR8zuCAA7zDPICd3+4StB9XTKClsvzFTxOkn75OFapLI2cEZYc8cjRSNVhRHe7dr8
	B75VvO0/ZgrEap93yt1xP0k99IAv4GDwm9I7yky0OjTd+78Zt44RxqKkEqbCGUXLnk/DNsfyykDY4
	/Rm8RRUajz1Uo1tQ/RM9cxuGOCoFadGes8UPPqxb2/DNWK9wtFaEO20/YUMd9h4gJptgh3loUnDRC
	QsC6DAFTcfJP/TsDKY+eEqvV+r0JzHfyIva6CD3/Wwjom/edmni8ebyo6+Up/tzOzqwAK5VTcjMuz
	IkutYr9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBnE-00000008FYJ-4AfI;
	Thu, 04 Dec 2025 16:02:57 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBnC-00000008FXY-1sw3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 16:02:55 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4779ebfa91aso952995e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 08:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764864173; x=1765468973; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jhOkEme3R2b0z1JToTf4scmIbojsMBoLPZmWVqYRzNs=;
        b=QYhFmO8DUdKWtt8snefFiPoidO/BY3VpFwArQcsJ1WqPvdiXG0JCHia2j/ofh1TYFJ
         2HEJV+zT6WoG4X77pubHZ2gFZUEIJHIJtSOGz5BthSX26HZSzEzjJPxeI5XoKJZlZWLS
         nB2FBDMj3N7YGTM5wi9bR078ewhMDXOj9My5fp/xPhjZ9tbDtrXGuEj8ulOpA637wEng
         2pcWvJSQmzww1Thq/BvtkMx/MtB/ACfILVoiFnO1jm7nuzosz6E0OxiU6Z4g+OneERn1
         VbanhYZitdxUHRWl/9z4A3RWdHApulNB6Qcn+aEa8xh8wwYFRvJBJKMjVKix/2Z4N15J
         zv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764864173; x=1765468973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhOkEme3R2b0z1JToTf4scmIbojsMBoLPZmWVqYRzNs=;
        b=FAuYRYfoOAvkpqqEmyQSV/F1vPA/cz7Gh1/6MbSQzjnVCzOj+x7DXR2Qh4kLN3wkvH
         WGgPDcaWEyWZlSBY8dUCHUmZfWVP7h6rfxA/vNeL2QgFh8n2CC4LuJcOPDFQd3kOVO2z
         j8CtdHxZrEmSu5HvxOFrrL/9ie/9+8kjxMkrfLNAXm+nFVy6q2bfPX9c6BwB1aK49k/x
         mPcLbT+aX2tH3ds6PcCLsTIh/9KNrJ0r5VohzDrGnjnZZm5wsPkFDfw3FdZHrosnst6Y
         QKNivvwPAQLn2YYqBMD4sKKAmUJYz9Z/BiPc1v02Bru6c43Xz80nzPxzgNJcXneyt27A
         /dFA==
X-Forwarded-Encrypted: i=1; AJvYcCXg4VMzNF1+cE149IilcKSlm7iDSCE0h/cG5hsp3hvGp4cKLrd9/zasN4K6hmTGRjOa1clFWD940QrLEN/0a04U@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1Oc7SOdCcAKvnaOSz4XYxTEHgnDZi4d+Z/tfrP/U912mqOOnn
	jfDtAwoDyyXuUNWVcMhuZBTHLwtwpxb5RiqrovEO2y+8B28aRv7oSzFO
X-Gm-Gg: ASbGncufHxBfkXM5rq6U4/dWKdXdG8yM3OD219zZvXDZxpGXVbiUfD/yfyH0jQ9V2BK
	zJm6dZFOrmRUBrIKyDWJqILBwS1V9+K5VTdYmhWsC7j6KEn1V4gEw4rKIMGelgIOEuk/qOosbFV
	ovbPZEFS1YwYOa3tCedrHyUdsE1x9nECqcgPXuDnME+6k2z9DpMB/gmvYKGNdQLqUjPK6PmPk0t
	RCEn1QrJQscKY9gnbkB7dj9QgbMVsJJuxGd5RZJdNODAbhePtjPhfszYCb7cfpONdwFP98+dzYV
	1lKTgp8jb4eeC1X4Tdte/ikBOUXZeeXIxHVXH3eUSq4Ih8XN6mAogMTDe+ADYEyJkp2iuVG2Es3
	HBhRdz0NArw+Qgv/XziQOJJ1IFvsCLoOSAoh+Ar1+GuI/jsMP34aLQiqVsk9yGkKWoBMfNtVtkl
	r6EYtqUhUdeDRywA==
X-Google-Smtp-Source: AGHT+IHk5B99duQzZVP/Wufl2tAKzpvxK3UuoYOHJ/wpcMeiblvQQD75UaOGAiMjZDyGGJIQCl5ZZw==
X-Received: by 2002:a05:600c:45cd:b0:477:5b01:7d49 with SMTP id 5b1f17b1804b1-4792c909a62mr31833775e9.4.1764864172487;
        Thu, 04 Dec 2025 08:02:52 -0800 (PST)
Received: from skbuf ([2a02:2f04:d106:d600:dbb2:245d:2cf5:21d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479308cd87csm40499885e9.0.2025.12.04.08.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 08:02:51 -0800 (PST)
Date: Thu, 4 Dec 2025 18:02:47 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>, Frank Wunderlich <frankwu@gmx.de>,
	Andrew Lunn <andrew@lunn.ch>, Chen Minqiang <ptpt52@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 2/2] net: dsa: mt7530: Use GPIO polarity to generate
 correct reset sequence
Message-ID: <20251204160247.yz42mnxvzhxas5jc@skbuf>
References: <20251129234603.2544-1-ptpt52@gmail.com>
 <20251129234603.2544-2-ptpt52@gmail.com>
 <0675b35f-217d-4261-9e3f-2eb24753d43c@lunn.ch>
 <20251130080731.ty2dlxaypxvodxiw@skbuf>
 <3fbc4e67-b931-421c-9d83-2214aaa2f6ed@lunn.ch>
 <0d85e1e6-ea75-4f20-aef1-90d446b4bfa1@kernel.org>
 <00f308a1-a4b1-4f20-8d8e-459ddf4c39b1@gmx.de>
 <aS7Zj3AFsSp2CTNv@makrotopia.org>
 <20251204131626.upw77jncqfwxydww@skbuf>
 <4170c560-1edd-4ff8-96af-a479063be4a5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4170c560-1edd-4ff8-96af-a479063be4a5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_080254_508459_55DCBCBF 
X-CRM114-Status: GOOD (  23.90  )
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

On Thu, Dec 04, 2025 at 03:49:52PM +0100, Krzysztof Kozlowski wrote:
> On 04/12/2025 14:16, Vladimir Oltean wrote:
> > I get the feeling that we're complicating a simple solution because of a
> > theoretical "what if" scenario. The "NOT" gate is somewhat contrived
> 
> You downplay this case and suggest (if I get it right) that NOT gate is
> something unusual.
> 
>  I mentioned "line inverter" but it's not about NOT gate. There is no
> need for NOT gate at all, like some magical component which no one puts
> to the board. The only thing needed is just to pull the GPIO up or down,
> that's it. It's completely normal design thus it CAN happen.
> 
> Of course "can" does not mean it actually does, because certain
> configurations like powerdown-fail-safe are more likely and I am not an
> electric circuit designer to tell which one is better, but that
> downplaying does not help here.

I don't want to dismiss this comment, but I don't really understand it.
What do you mean by "line inverter", is it the component inside the GPIO
pin which makes it active low?

I thought that the premise of this patch set is that old device trees
are all (incorrectly) defined as GPIO_ACTIVE_HIGH, but someone familiar
with the matter needs to fact-check this statement.

Anyway, you and Andrew are talking about different things, you haven't
made it clear (or at least it wasn't clear to me) that the inverter you
are talking about isn't his NOT gate (that isn't described in the device
tree at all, as opposed to your inverter which would make the GPIO line
GPIO_ACTIVE_LOW - that's something verifiable).

> Just to clarify: I expect clear communication that some users will be
> broken with as good as you can provide analysis of the impact (which
> users). I only object the clame here "no one can ever pull down a GPIO
> line thus I handled all possible cases and made it backward compatible".
> 
> And that claim to quote was:
> "Therefore, regardless of whether a DTS is old or new, correct or
> incorrect, the driver now generates the correct electrical reset pulse."
> 
> which is 100% false and I am surprised how one could claim that.

Agree, the communication should be better.

