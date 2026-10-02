Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11EBCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 11:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2Jhfl4IsYX/26MbYUd05Eygx5yXfRkgTahQeUMWqDQ=; b=4nNfFrDH/YVt6LrIPgz/5UN5Xa
	Z/8COV+m5GS9xfiKGxgI2sswmkTLGvjIg66XUlOU6I+M7MmyKwe13qe8oCJayyp2tKMKU9MTwEgv2
	GT7Jv+fgrgYyXJtNpyaOJHzyRdOrxaWaTBj+5bl4BwFdattM3fba1WD5Zr4g4CysWFyUR/mT8hiHf
	a+q4qmU1uDgYqrRbUNoySAIihZGPqM8mLdpjdejfRuqq076SXyvEZu+zYLkdnzVG5dXoDZ1ZDS6TN
	nDup6GYEXFnw/bjlcUXRuWRl7dYq6VLiEhKaTUH6QPB0CLnnAtJxYYACcCBpgB+O8H9EJsd5wmBKO
	673vxjKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbus-0000000BWtL-3JVh;
	Fri, 02 Oct 2026 11:59:06 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbup-0000000BWsr-3A7M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 11:59:05 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48affb828f1so2842432f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 04:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790942341; x=1791547141; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A2Jhfl4IsYX/26MbYUd05Eygx5yXfRkgTahQeUMWqDQ=;
        b=E/+wEx7aqOeaNZyGQQm6TO7Ine5nwhAHjpzZLc1xqZRwfcS01MJROjcqzKvc80og+L
         Cm/bDImWAOqbYFU8L3Z5+YygNovGeoA73fO64JDVgILaTVlcdDX4Bx8tvP7fEwuGY00S
         RNcMqIMXQMBBsF2y0CMMYY3/G3uIAdvDdntlt7JlEGdoucz5IBUlb4HW19mVwVL3iBRw
         xccZJ4hJWWJzgH7lAZcz9f1CUwHwW65eaWVQ6raQ7omiPw0W2Yc7IMFUJM+XE5NPgugn
         UT1DwS5IocPE3W76q24nWhQyQqBJ4gst4ZFtZ0LPjsPU4PUHPTGjyTCZX7eJj/OtTLb8
         B7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790942341; x=1791547141;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A2Jhfl4IsYX/26MbYUd05Eygx5yXfRkgTahQeUMWqDQ=;
        b=E7KbmS/a411bsCYhmii7tTOp2MA6ZxP9EUWFsMppGZcKr+HjRgvr6L2sFRMbwZcXxv
         H4jaXg+kyDP5fcGjkU9ZwT4ZKGFA3Dx5iwmOAQ8ta7s7zvDHupoSPLkp8cL3lZPF5/XZ
         U6K7s7JJJdTSO33aGiwEvBi9SICOFbkynJcJX8VBJmR0D6h/0suo7C/t6LHYP9KGTApv
         z3WkgV+y4cTCTgNT3eVoTYp9CDxOfPDT6snI+2IvicNIjpuQyBoqWvrjEiaMIQJwG2gZ
         orsK6v1avLgiRoajksM9WwBbYAd8bzAjqnt6Dg/tvARX+BhvXw6hkl0E2lTTQlIxZR2C
         L2pw==
X-Forwarded-Encrypted: i=1; AKwUvBzCdWWRY7lCkRU3kM1oFb48RG/BkCxuGCI9GnGkx2cZtW8dAbs2rPUtwE/rwZPvb5d1cJjuL5pKvfW8kO5v7Nw0@lists.infradead.org
X-Gm-Message-State: AFuF++k8tQzTe/z3t2f+2Xbk6AaN640zvKJ9HTa/bHA8xAXnQdsg3P35
	PK+8edNMeb+2t98RMxZeweNDmwdDI+8ynF9B5RcHsFV9rhm1nHRyvYgM
X-Gm-Gg: AYBFou3z8XwvFplAVgdtmouWtmIjufxx9KjoHNZxj94LYEkRCidbx/rtAKez1E4n9hg
	sSyFc86FEFBmmSkcpeetV9daEQthT9MSkY2vTKxMxaC4PgwpcKmRzkArfCxiES0v1P2EJN0ywGf
	PqsbZyEtd9bzTBHPj6srU6kxrlnPZnkwS5/aWLuI7DPgSx/xmq55NmPsraqsK9m6dAHk+dGj/Yw
	sgHfdUkMHR0Jjnf/0UF+xX+KPY3Q/CM5vIIiAYbR9EShbAiAFtfLXfw3qpTUCwgHT6N5ve4CH/x
	oh52BFdHwUDQhX/3IGHENzABBbQk+W3PK0vATgDDIxbuoDuzBBK2Daex5YjKxjOQwbIhozW089K
	dDnQ19+YdTDI5FiICw6oqN5glqb2cjD4sAyk+15KCi/icyrmxIfwDL3Q8XjcjkFX5KAkmJ0yFtQ
	poDbdYDuiTInyTG6EvakUt9NjSUiuksmg+nZvOgqJWgqgovQyxrngfK1+WtzU6p3Bss1Bv99prI
	HXV9+C1ysMgt8fhFkUOX8n8DE2tjKsrC+qG0jg0T5mvKkew0ew0XNLqGKVxiqp2FYHdeVqi14t8
	NVIIKNQ32soUDwwxdOm28ZfFaoX0
X-Received: by 2002:a05:600c:4307:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4a0274569f9mr32626085e9.0.1790942341160;
        Fri, 02 Oct 2026 04:59:01 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff2280csm44613255e9.4.2026.10.02.04.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:59:00 -0700 (PDT)
Date: Fri, 2 Oct 2026 13:58:57 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>, Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v4 00/13] ARM: dts: imx6ul: Add Variscite VAR-SOM-6UL and
 DART-6UL
Message-ID: <ar-cgeR8U0dmOTvI@Lord-Beerus.station>
References: <cover.1790693249.git.stefano.r@variscite.com>
 <20260929121455.437291ea4b53130e3e19778c@hugovil.com>
 <arv4MwHV4LntROkN@Lord-Beerus.station>
 <20261001144344.2100854b8f5e2d81cf87b424@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261001144344.2100854b8f5e2d81cf87b424@hugovil.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_045903_855510_FC779C78 
X-CRM114-Status: GOOD (  32.77  )
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

On Thu, Oct 01, 2026 at 02:43:44PM -0400, Hugo Villeneuve wrote:

Hi Hugo,

> 
> Great to know Variscite is adding support for the DART-6UL.
> 

Thank you Hugo :)
Over the past year, we have been prioritizing security and consistency
by adopting a mainline-first approach.
We have added support for almost all of our SOMs and configurations,
as well as several driver changes and additions:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/?h=master&qt=author&q=Stefano+Radaelli
And now it's time for the immortal i.MX6UL!

> 
> Please work with the existing modular DTSI files, do not simply remove
> them and reimplement them into your own files.
> 

Agreed. Where possible, I’ll reuse the modular files you added and
propose fix commits wherever changes are needed.

> 
> I tested it and it works. But like I said, if adjustments need to be
> made, they are welcome and can be done in a separate patch to fix it.
> This sequencing is something not very well documented in Variscite
> datasheets. I asked Variscite support to improve the documentation for
> that aspect but it was not accepted.
> 
> 
> > For the LWB5 option, the procedure enables WIFI_PWR, waits 10 ms,
> > enables WLAN_EN and BT_EN, waits 200 ms, then lowers BT_EN before
> > re-enumerating the SDIO device.
> > The other Broadcom option does not use the separate WIFI_PWR step.
> > The existing regulator and MMC power-sequence nodes do not express that
> > complete, module-dependent procedure, particularly the BT_EN step during
> > Wi-Fi initialization.
> > The scripts also select the Bluetooth firmware according to the detected
> > SDIO device.
> 
> Firmware loading is handled properly by the kernel without external
> scripts (tested with Concerto EVK).
> 
> 
> > We use that procedure to avoid sequencing-related failures for our
> > customers.
> > This approach is not new to Variscite’s mainline DTS files.
> 
> Yes, this is an old way of doing things, which may have been
> appropriate in the past when proper support in the kernel was missing
> to achieve the proper sequencing, but no longer true these days, unless
> I am mistaken.
> 

We are glad the kernel-managed sequence works on your Concerto EVK.
However, it is wrong for the LWB5 module configuration we support:
it does not follow the required power-up order and timing validated
by Variscite.
The sequence is based on the module requirements and has been tested
in our labs and across customer configurations over many years.
A successful test on your EVK does not show that it is correct for all
the modules and configurations we ship.

The GPL-2.0-only userspace scripts implement this required sequence.
This is not a matter of preference or an old approach we kept by habit;
replacing it with the sequence in the current DTS would risk breaking
supported Variscite configurations.
If a future kernel implementation can reproduce the complete,
module-specific sequence, Variscite will be happy to update all affected
DTS files to use it, after completing the necessary lab testing across
the supported module variants and configurations.

If you need any additional material, datasheets, or other information
from Variscite, please let me know at stefano.r@variscite.com.
I’ll be happy to provide whatever is needed!

Best Regards,
Stefano


