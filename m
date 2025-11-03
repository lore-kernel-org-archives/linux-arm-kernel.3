Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB2ACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 12:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvThRY4eNfW5Inji/W0VKFrAjmGKVWgkAa2RGmz2+O0=; b=07W+ls3+dgCvrdqsH5e3eYSBgh
	legz2vI/y5S92v7RZwBsaimz6KZ/hDw7pHr/e1At0jsgEGQrG/un6QFQ/Jbr3fDKCeaQ4yjuAZ0C9
	QxBGjFJpaUwZbrp+lyJ42tKhJxdhKKVVFs+TORa2iIzfTnUZSGt4PtaNg+C/F+t0/pPci6jolWNgd
	j+UUfl9FuE+9cNfJatpdYzsMXfSmyCrgHIk1646sO84zQ5UqDMxkegaLqs7TD3Gf3RAsVNJkTH+F2
	i+GX5PC98qUg4HIewQ3Pa+LS+c3Sru0yHvqAaODTH08snjyIrDXS6GrxyoSOxgpUPWcXPG1Uq92GF
	zzgXfBrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtRh-00000009o54-2x2w;
	Mon, 03 Nov 2025 12:14:01 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtRf-00000009o4f-2vsD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 12:14:00 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4769bb77eb9so4488795e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 04:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762172038; x=1762776838; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HvThRY4eNfW5Inji/W0VKFrAjmGKVWgkAa2RGmz2+O0=;
        b=QvYjsFaX7hHkejmgBbPwsMlGs9ZamxMOgYE5PYBi8rAMVZ7si4ckkr+YRa9ud5+rHV
         bXmxjVEcVYkDptYOJgxJSnVz/6DxRTx/Ge7ESc2Wr+JNKVh0AcXIYqnBBbqAV5/diW85
         DbgPHQuEsL5STVFSA7BpG0BCUIYJij7pZDqT7x0p2zAncz1rJy1MHAXtutdxKWCUr7CZ
         I4PjnQQyjAR273fDxQLhbJXJIT0xTe0wZedyeq3Z78EwOw3ClaKjS5Gkef1nnhY47//5
         NPVmCUiUbXu+2uYVEFPV03wtWM+J1sxlYVYiOKB7Dbd+VScrGgz28fdN8fb1F6JK+1Xd
         Ul2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762172038; x=1762776838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvThRY4eNfW5Inji/W0VKFrAjmGKVWgkAa2RGmz2+O0=;
        b=sZPdcHYJOaQ8R2/TFgKy8ipuPZMiQhr36J8zrJXR8HVgUE98lp2KFPpYPkE8/exZI5
         pjlL3AmkD9wRbg4Fz41uUR1ILTMMK6tJ1zaNye9IGdqRyQetb1s09IAd+gbDB8sroL2Z
         tXA7lpwSGlPCWqVkntTurzKzN0uuecOBx4759KnQHue6r1zbyddcN8PsZ/6KMOBnpH57
         eEfsGMvEzhipGxFyTZF1hgAK6nR9JxhPcsnYdo8hLr/IFIjIlps4ZeQXfU+zFeCO54i8
         5ZoFHWfAR0+A3ViWScaKlT6IKH5ANSHV1PkhIldihaEriR7xrrbuCBu+HhWkhRX4xDvM
         3RuA==
X-Forwarded-Encrypted: i=1; AJvYcCV7Bss2VFLKhgxndiX9Eoo5MCUmu4fhMuP/pFepiFttY3SmDLzfBBg16FMZ9CPdR7njWeL+TmHX9cCF1MmnMFAk@lists.infradead.org
X-Gm-Message-State: AOJu0YwIU2RZ7WeJ+a1iDapIoW8EfMr80vzD0cWKsho8M4pHcCT3b54U
	yxWd4rd2cRAqLFuQqxcvnFIEvlMdLaElARbJi1ATM5GKd7VqOeWtT5uE
X-Gm-Gg: ASbGncujft4Q1HMUHDCnDgwbUhVw9fDYCd+Bf/q8Vus/py9d1svawB8SSXTKvcALuGo
	UJnhs9+6r7lbngkBa1wKCE2mYxhnC7rD1mEHOqqOIEujg+eP4EHGsxLImQSngIceCOM+Cx/egiV
	LbH4h3G1rQmTnoYIvXZTKJTVBmB5frvDBNG9f2guGsB4Cvh4xHvtp253FmAL65ZI+GV0m/8Lqa6
	zYIcX0DflLUaBZVgKFfd7rcIq96JhcKNdGnG/fgQIhaGN/OEf0nIEocSzMYILkJST7mcvPJ41+j
	njgBMo6QHchcbEu4wYmFf0mCYVuu3Eas1TMicfv9EB6b5JyOZn87ZDFk2c2CNAw9BzdAyuC722U
	BxfSp3Bln6PKkNQrYkbkkdH7/MbRuDBhpXjmEt+Nh/T1A6xZHMx7CMiRq3Cngvzfji6PEtVNlQM
	hILAo=
X-Google-Smtp-Source: AGHT+IGQt2Q95D+Meobm86HVWwUHLHSku+aRz/VeZME+I3ZAsJ3m+6wdDTCQZ+nPhU3uPW8S3WqRpQ==
X-Received: by 2002:a05:600c:19c6:b0:477:10c4:b52 with SMTP id 5b1f17b1804b1-4773090238fmr57140915e9.8.1762172037406;
        Mon, 03 Nov 2025 04:13:57 -0800 (PST)
Received: from skbuf ([2a02:2f04:d406:ee00:7144:c922:dc8a:113d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c23b8d9sm173739975e9.0.2025.11.03.04.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 04:13:56 -0800 (PST)
Date: Mon, 3 Nov 2025 14:13:53 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Furong Xu <0x1207@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH net-next 0/3] net: stmmac: phylink PCS conversion part 3
 (dodgy stuff)
Message-ID: <20251103121353.dbnalfub5mzwad62@skbuf>
References: <aQHc6SowbWsIA1A5@shell.armlinux.org.uk>
 <aQNmM5+cptKllTS8@oss.qualcomm.com>
 <aQOB_yCzCmAVM34V@shell.armlinux.org.uk>
 <aQOCpG_gjJlnm0A1@shell.armlinux.org.uk>
 <aQhusPX0Hw9ZuLNR@oss.qualcomm.com>
 <aQh7Zj10C7QcDoqn@shell.armlinux.org.uk>
 <aQiBjYNtJks2/mrw@oss.qualcomm.com>
 <20251103104820.3fcksk27j34zu6cg@skbuf>
 <aQiP46tKUHGwmiTo@oss.qualcomm.com>
 <aQiVWydDsRaMz8ua@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="56qp7pmq6cw7fsz2"
Content-Disposition: inline
In-Reply-To: <aQiVWydDsRaMz8ua@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_041359_785081_52F08D47 
X-CRM114-Status: GOOD (  39.04  )
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


--56qp7pmq6cw7fsz2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 03, 2025 at 11:43:23AM +0000, Russell King (Oracle) wrote:
> On Mon, Nov 03, 2025 at 04:50:03PM +0530, Mohd Ayaan Anwar wrote:
> > On Mon, Nov 03, 2025 at 12:48:20PM +0200, Vladimir Oltean wrote:
> > > 
> > > As Russell partially pointed out, there are several assumptions in the
> > > Aquantia PHY driver and in phylink, three of them being that:
> > > - rate matching is only supported for PHY_INTERFACE_MODE_10GBASER and
> > >   PHY_INTERFACE_MODE_2500BASEX (thus not PHY_INTERFACE_MODE_SGMII)
> > > - if phy_get_rate_matching() returns RATE_MATCH_NONE for an interface,
> > >   pl->phy_state.rate_matching will also be RATE_MATCH_NONE when using
> > >   that interface
> > > - if rate matching is used, the PHY is configured to use it for all
> > >   media speeds <= phylink_interface_max_speed(link_state.interface)
> > > 
> > > Those assumptions are not validated very well against the ground truth
> > > from the PHY provisioning, so the next step would be for us to see that
> > > directly.
> > > 
> > > Please turn this print from aqr_gen2_read_global_syscfg() into something
> > > visible in dmesg, i.e. by replacing phydev_dbg() with phydev_info():
> > > 
> > > 		phydev_dbg(phydev,
> > > 			   "Media speed %d uses host interface %s with %s\n",
> > > 			   syscfg->speed, phy_modes(syscfg->interface),
> > > 			   syscfg->rate_adapt == AQR_RATE_ADAPT_NONE ? "no rate adaptation" :
> > > 			   syscfg->rate_adapt == AQR_RATE_ADAPT_PAUSE ? "rate adaptation through flow control" :
> > > 			   syscfg->rate_adapt == AQR_RATE_ADAPT_USX ? "rate adaptation through symbol replication" :
> > > 			   "unrecognized rate adaptation type");
> > 
> > Thanks. Looks like rate adaptation is only provisioned for 10M, which
> > matches my observation where phylink passes the exact speeds for
> > 100/1000/2500 but 1000 for 10M.
> 
> Hmm, I wonder what the PHY is doing for that then. stmmac will be
> programmed to read the Cisco SGMII in-band control word, and use
> that to determine whether symbol replication for slower speeds is
> being used.
> 
> If AQR115C is indicating 10M in the in-band control word, but is
> actually operating the link at 1G speed, things are not going to
> work, and I would say the PHY is broken to be doing that. The point
> of the SGMII in-band control word is to tell the MAC about the
> required symbol replication on the link for transmitting the slower
> data rates over the link.
> 
> stmmac unfortunately doesn't give access to the raw Cisco SGMII
> in-band control word. However, reading register 0xf8 bits 31:16 for
> dwmac4, or register 0xd8 bits 15:0 for dwmac1000 will give this
> information. In that bitfield, bits 2:1 give the speed. 2 = 1G,
> 1 = 100M, 0 = 10M.

It might be Linux who is forcing the AQR115C into the nonsensical
behaviour of advertising 10M in the SGMII control word while
simultanously forcing the PHY MII to operate at 1G with flow control
for the 10M media speed.

We don't control the latter, but we do control the former:
aqr_gen2_config_inband(), if given modes == LINK_INBAND_ENABLE, will
enable in-band for all media speeds that use PHY_INTERFACE_MODE_SGMII.
Regardless of how the PHY was provisioned for each media speed, and
especially regardless of rate matching settings, this function will
uniformly set the same in-band enabled/disabled setting for all media
speeds using the same host interface.

If dwmac_integrated_pcs_inband_caps(), as per Russell's patch 1/3,
reports LINK_INBAND_ENABLE | LINK_INBAND_DISABLE, and if
aqr_gen2_inband_caps() also reports LINK_INBAND_ENABLE | LINK_INBAND_DISABLE,
then we're giving phylink_pcs_neg_mode() all the tools it needs to shoot
itself in the foot, and select LINK_INBAND_ENABLE.

The judgement call in the Aquantia PHY driver was mine, as documented in
commit 5d59109d47c0 ("net: phy: aquantia: report and configure in-band
autoneg capabilities"). The idea being that the configuration would have
been unsupportable anyway given the question that the framework asks:
"does the PHY use in-band for SGMII, or does it not?"

Assuming the configuration at 10Mbps wasn't always broken, there's only
one way to know how it was supposed to work: more dumping of the initial
provisioning, prior to our modification in aqr_gen2_config_inband().
Ayaan, please re-print the same info with this new untested patch applied.
I am going to assume that in-band autoneg isn't enabled in the unmodified
provisioning, at least for 10M.

Russell's request for the integrated PCS status is also a good parallel
confirmation that yes, we've entered a mode where the PHY advertises
SGMII replication at 10M.

--56qp7pmq6cw7fsz2
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-net-phy-aquantia-add-inband-setting-to-the-aqr_gen2_.patch"

From b91162e5dae8e20b477999c4f2fcdb98c219d663 Mon Sep 17 00:00:00 2001
From: Vladimir Oltean <vladimir.oltean@nxp.com>
Date: Mon, 3 Nov 2025 14:03:55 +0200
Subject: [PATCH] net: phy: aquantia: add inband setting to the
 aqr_gen2_read_global_syscfg() print

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/phy/aquantia/aquantia_main.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
index 41f3676c7f1e..f06b7b51bb7d 100644
--- a/drivers/net/phy/aquantia/aquantia_main.c
+++ b/drivers/net/phy/aquantia/aquantia_main.c
@@ -839,6 +839,7 @@ static int aqr_gen2_read_global_syscfg(struct phy_device *phydev)
 
 	for (i = 0; i < AQR_NUM_GLOBAL_CFG; i++) {
 		struct aqr_global_syscfg *syscfg = &priv->global_cfg[i];
+		bool inband;
 
 		syscfg->speed = aqr_global_cfg_regs[i].speed;
 
@@ -849,6 +850,7 @@ static int aqr_gen2_read_global_syscfg(struct phy_device *phydev)
 
 		serdes_mode = FIELD_GET(VEND1_GLOBAL_CFG_SERDES_MODE, val);
 		rate_adapt = FIELD_GET(VEND1_GLOBAL_CFG_RATE_ADAPT, val);
+		inband = FIELD_GET(VEND1_GLOBAL_CFG_AUTONEG_ENA, val);
 
 		switch (serdes_mode) {
 		case VEND1_GLOBAL_CFG_SERDES_MODE_XFI:
@@ -896,12 +898,13 @@ static int aqr_gen2_read_global_syscfg(struct phy_device *phydev)
 		}
 
 		phydev_dbg(phydev,
-			   "Media speed %d uses host interface %s with %s\n",
+			   "Media speed %d uses host interface %s with %s, inband %s\n",
 			   syscfg->speed, phy_modes(syscfg->interface),
 			   syscfg->rate_adapt == AQR_RATE_ADAPT_NONE ? "no rate adaptation" :
 			   syscfg->rate_adapt == AQR_RATE_ADAPT_PAUSE ? "rate adaptation through flow control" :
 			   syscfg->rate_adapt == AQR_RATE_ADAPT_USX ? "rate adaptation through symbol replication" :
-			   "unrecognized rate adaptation type");
+			   "unrecognized rate adaptation type",
+			   str_enabled_disabled(inband));
 	}
 
 	return 0;
-- 
2.43.0


--56qp7pmq6cw7fsz2--

