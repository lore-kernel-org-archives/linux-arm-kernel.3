Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61546E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 21:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wa1C0CK2LUPWgoQl8J3ltgkkEcHnA6/0miJrX+XQgJM=; b=3Xnb9FpOL5e5Xb7DPtFM9WmvGK
	GXzjDZImeg6XMuyXVTstf5K1WIRRhb2yFeZDZF4SyZpLkfUWRfV4ure8uNmPY0VszAhv9B5itChBI
	/EPJJ9c8S0rQMt/XUgt6uu8PivPZfDaWiU0ZS1dvx1HzUTHEoiF92rO+YurkaC/cqf4EuoVuGAAKb
	6UqQIfxyF89svzRcFDv0Q9Y4habWibzF91cFc+LDeio2cONidTVFKNIXVRQzaWmpdznR1H2FMr7d2
	AllzpFTgdd1LniVpI4fjz/aYL2gJzSYi3AyvN4wpEhEeYBMk6lKY8A1S96cvqewVPKVnTZGn/md25
	8Lf66PPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7Lp-0000000CkTt-1QJr;
	Tue, 10 Dec 2024 21:01:01 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7HY-0000000CjKr-0W7Q;
	Tue, 10 Dec 2024 20:56:37 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-434f74e59c7so30973295e9.3;
        Tue, 10 Dec 2024 12:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733864194; x=1734468994; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wa1C0CK2LUPWgoQl8J3ltgkkEcHnA6/0miJrX+XQgJM=;
        b=b70IcF7dFRKYvOdJocB1OjYoLeQXmDWEncFnh/uFNc5HNUVgUNl5PpfdB9JhCozE6O
         cTSIBvs8hZk+SXp5ILQbY8HXBzVjBd5fLriW31KOdUPa0O30mGWTAToI+kg9FiPa9iiY
         9TLmqH4yRyCQmMy3vadIHf+VFCbCAvO1heOhPAsvwNh43HmGNFeQL6fClcRsr9/IgOT/
         PuHwVoiIx3LfkBc2N6uY82wgBDm7rNzi5B0EWsH8xWTn3i6Do5mnSqW4726BsLhuUzVQ
         gt3ibgktDnXtOhwcolIOGU2w9Z8W1SSWUl8gxIxLTCZ9R3OHAZDH2y3OUdOKaxk1mw/4
         x6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864194; x=1734468994;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wa1C0CK2LUPWgoQl8J3ltgkkEcHnA6/0miJrX+XQgJM=;
        b=hKYk2g9ZbDW/ag26zJXyhvfS2PvSExmy65J3jR4rca7uaJLhx/gOUw2OAFGD+CsRgq
         5HYyQwa/NEAjg9KblXv6JSLUkIupla+lYJxkQVZIPAc0izHfdOqsA/hXJuHr6SQ08tYj
         yF5HxSqkTn4suUwX9pLDruKWVw+mZXFf75JOgTBGH9tARtlNuRbYYkDxbkd/iPrEd0R+
         3/LZhnByNuPimAcQhXwy8/UciQOM0xvyTpEjuHNq8ycsvVIwwE/n+isx4Czc749aLXKM
         F0txL1AUYlk3gpRfWA452pCtRDT1UP0AxkKl3E6zrZc9jdA0U+cNIXy7Cel8HediWIY1
         XucA==
X-Forwarded-Encrypted: i=1; AJvYcCUaXYhYx7lx4l7bAVSx4einAki8n1NWLAwo49hWMwIAoqxVDMh98/Vy+nRPwpdI0YFL9HMx+2k48v2wgMIh3Xxm@lists.infradead.org, AJvYcCXfSOS2jzBMD9P/Z24vUKMN/FQAYa3sgvZB0Ulsn+4Vkr6IvjG7vC3U5Cz4x0C4YNPUvLnd8iz9bE/0D7PP1R0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2PoOqY8mcJV8g0au8A6II/B0NcUNDPRIUM1YitREHvBdNcDH4
	MHjTBEAUl5JL/2GLBnES1YxHoLXdVrjj1ChVVnPVpta/hg+gF5OE
X-Gm-Gg: ASbGnctUroIHD/E7aKqoqgpU/4RBvf7hFQbsxyx78177uzCp63lrCxSX6h8WeL2Cf7E
	AoRKAsPbzv6X4xB+r3u4WJdSdQ38d7B4xuZElzwXVOWOIEKLWi9hpNoyZaF0H4ulZgpLf5VA1+X
	zN7jjjrzP7ZJ1o1k0Jf12d/PK3tEgD0r2ppi0G3hbR7U50Ufv+A/aUQ/jepISaGVBNHIfqYsKSf
	u9fY0VIWm6EChUYbZ0u9DFh4NLGrk8Ctx+gDUPXHd2ddc0c9c2Zp0WWm34kdsIER4w88bMnSTY3
	EIq4mFOnCw==
X-Google-Smtp-Source: AGHT+IFO9JdRbxTE32/Wvk1uVcdsvnlU93WdY8tnjY1ZWyo8G3dYd8QPxRdPIKttUVaFIptDS6Wn3w==
X-Received: by 2002:a05:600c:3109:b0:434:a04d:1670 with SMTP id 5b1f17b1804b1-4361c2b7e29mr2708705e9.0.1733864193989;
        Tue, 10 Dec 2024 12:56:33 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434fb066874sm69945475e9.32.2024.12.10.12.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:56:33 -0800 (PST)
Message-ID: <6758ab01.7b0a0220.b8716.380c@mx.google.com>
X-Google-Original-Message-ID: <Z1iq_jC0bK47OJ-a@Ansuel-XPS.>
Date: Tue, 10 Dec 2024 21:56:30 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
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
Subject: Re: [net-next PATCH v9 3/4] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
References: <20241205162759.pm3iz42bhdsvukfm@skbuf>
 <6751e023.5d0a0220.394b90.7bc9@mx.google.com>
 <6751e023.5d0a0220.394b90.7bc9@mx.google.com>
 <20241205180539.6t5iz2m3wjjwyxp3@skbuf>
 <6751f125.5d0a0220.255b79.7be0@mx.google.com>
 <20241205185037.g6cqejgad5jamj7r@skbuf>
 <675200c3.7b0a0220.236ac3.9edf@mx.google.com>
 <20241205235709.pa5shi7mh26cnjhn@skbuf>
 <67543b6f.df0a0220.3bd32.6d5d@mx.google.com>
 <20241210203148.2lw5zwldazmwr2rn@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210203148.2lw5zwldazmwr2rn@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_125636_159397_63F8DC55 
X-CRM114-Status: GOOD (  18.41  )
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

On Tue, Dec 10, 2024 at 10:31:48PM +0200, Vladimir Oltean wrote:
> On Sat, Dec 07, 2024 at 01:11:23PM +0100, Christian Marangi wrote:
> > I finished testing and this works, I'm not using mdio-parent-bus tho as
> > the mdio-mux driver seems overkill for the task and problematic for PAGE
> > handling. (mdio-mux doesn't provide a way to give the current addr that
> > is being accessed)
> 
> The use of mdio-parent-bus doesn't necessarily imply an mdio-mux. For
> example, you'll also see it used in net/dsa/microchip,ksz.yaml.
> 
> You say this switch is also accessible over I2C. How are the internal
> PHYs accessed in that case? Still over MDIO? If so, it would be nice to
> have a unified scheme for both I2C-controlled switch and MDIO-controlled
> switch, which is something that mdio-parent-bus would permit.

What is not clear to me is where that property should be used in the
code or it's just for reference in DT to describe what is the parent?

Given MFD implementation, I pass the bus by accessing the MFD priv
struct so having the parent property is redundant.

-- 
	Ansuel

