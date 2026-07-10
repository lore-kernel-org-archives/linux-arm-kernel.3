Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393EDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 18:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UzL1Q2+7WDC/g3DuLtI+wo+3VqWALiuVF8iASl1uPEU=; b=SfxlMkFy6cPFI7k4wKWG0JDczI
	2xfNIg/lug70N1IcP/kgmKnzD8vZ6h47nKrNxFDqK9td6Nm6OwtffonGs8vP2SxuJAmBnOK1jPZJG
	3UynPu99lQC3jqNHkr5te6CEd6nB488oquMbX1Ap4dor2ylZei8ijBKuzFVSlovNXtyvU17Un6T/R
	s63a3HKftAZdnHGFC2l9bbrDpmEa8L5ouJCQYi/i0VM4t2vQQMjXyJiAw1dpXUE40u3evo438jmVi
	DerftqW37CsJ7W1EKqO9uvjVIuajVm08vdBz0Am4MHHXmNQZCwt0KKRnLYOGtmdElwvugCd9/0TTT
	pr5bXUzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEYi-00000005OnA-3xGB;
	Fri, 10 Jul 2026 16:58:40 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEYh-00000005Oma-1Oz2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 16:58:40 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c89636920a3so657374a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 09:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783702718; x=1784307518; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UzL1Q2+7WDC/g3DuLtI+wo+3VqWALiuVF8iASl1uPEU=;
        b=cG9xzzpNjVKpu/TiI9YfSh7CPStxQUQ9MksdIePoiUt1acrugSM0Xq61s4vDKFSMVs
         vuxuPAs2H8GRIGbW0pJ774YN7NWJ6YYz3EX66qcaiWSJg1kg9qkoRiLe6tW3SRxwJ8rG
         6adSg50rRcmIf94mgv2zR9SawIeCYwy8ZHF5Jk28yArw9h5egcs23Tye6mkJkCasp0qB
         u1dKos5XRcKcMWyblaFig6ydxqmyuT8oiSeTWlnBo/LvpanEF8v545j67vimD4nZ4OEq
         F7qycHKpjcLIXHrd30JmUix77EMzomBoeZX1ZtpBW1a2hNnvwoP1b1inUKdLcEMkYxNK
         mIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783702718; x=1784307518;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UzL1Q2+7WDC/g3DuLtI+wo+3VqWALiuVF8iASl1uPEU=;
        b=hVbiJuy89Um4qDpOl8lP7Ri86MdKagQu0oh4WBQ31U4eE4jt41PSvqjJ95X9aPnk+L
         2Z6tFFzAj/yonALxfFZVxUCnK9gLWkvrrQZsiC24c1yGCzOkpXRXUw7Ri/YpoJe4WJPw
         bP2ZW4ZfMHnzom1qb0tMBSv8FRXdqnYC4U+fhOXBR1VteYLoEFuaXleYPUpTdnM6hz9v
         u9vO3RVAQIBP0HBh9u/3y6py+4Cp3EQ863VU21UoIqdMxzQBkAHv7kQkzyg1ysWY00WM
         SAuPUKdnhkcbvOSnr5AfHrDYfE6wlh72oJTywV23F1ty12c1myact7j2YDuMbcmCjEHP
         ijig==
X-Forwarded-Encrypted: i=1; AHgh+RpMcBgm78sLyIj2rmgTN8KNx4sVhrchTQ9WqPzdfAJBOnrbSo2rEXuLog1KWfrzZGVltyFD6p06SM6RDKkqijgf@lists.infradead.org
X-Gm-Message-State: AOJu0YyhiX9g6I55rYS0P2GbVDkkSWLs11hKAJ2g7xRaBJ0HAVKX/zUO
	coBLz2YN+2uYSZCehJAeu1yZpcF+03ByENI0C/wZLSVdREMoKn3v05g9
X-Gm-Gg: AfdE7ck+AeGQO1EmxJeHF18DOLxIiW5Z5fYoX7pIqCEyVLJjGsOaJXVSweHT4VvoWuc
	16AaX7H0RPTeWBJQ41Ei9GWPgi1tt/k80tU+h3EyunkPzWVCH70shAgxaew/rG9eK+HB4IHZq+K
	bOepTnoNUpkrXuTbVdeIQD7d3aBXS+XRS1hrJ1FT65g6fKepXBg5WDUAVmWfIojmi/JDTCvanuJ
	Tgn03Aoig8h+tQZ/rKKd2AFZXI+j0qxHS0Zx6UWA0234109iUmDxwbYlc8v8mXIii5UeCFb87Z1
	AW7B0DJ5C1N+yKjSZ9LRvOp0DGLh9lXwNmLNtDA7b4t4fW5deqSWzS5iTC9yFIZAr1K9EHjxw3l
	kEGMVfQPTQ8lozQvfkkaX6poLZdVpthQ6boxnYkU6doYGxAP+lRKJjVA13jKDwk9FWGd1pyPcho
	GHlHWAjnbiNE7F0IpAIraXdt9YZRF4pc7VCB6yFSs=
X-Received: by 2002:a05:6a21:1bc3:b0:3bd:4698:e7c4 with SMTP id adf61e73a8af0-3c0bcb7f146mr13586972637.42.1783702718181;
        Fri, 10 Jul 2026 09:58:38 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.localdomain ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f72a6sm48876196eec.1.2026.07.10.09.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:58:37 -0700 (PDT)
Date: Fri, 10 Jul 2026 20:58:28 +0400
From: Ahmed Naseef <naseefkm@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Ahmed Naseef <naseefkm@gmail.com>, netdev@vger.kernel.org,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	"David S. Miller" <davem@davemloft.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Vladimir Oltean <olteanv@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 2/2] net: dsa: mt7530: add EN7528 support
Message-ID: <alEktKWsrriHdR40@DESKTOP-TIT0J8O.localdomain>
References: <cover.1783680864.git.naseefkm@gmail.com>
 <1865eaedef97e593ba608764c7390209cae85b30.1783680864.git.naseefkm@gmail.com>
 <f968d3fe-83dc-4b82-972b-0d4d477a1a52@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f968d3fe-83dc-4b82-972b-0d4d477a1a52@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_095839_395879_4D32E533 
X-CRM114-Status: GOOD (  19.20  )
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

On Fri, Jul 10, 2026 at 03:32:32PM +0200, Andrew Lunn wrote:
> > +	/* The EN7528 LAN GPHYs advertise EEE by default, but negotiating EEE
> > +	 * with common link partners (e.g. Realtek GbE NICs) results in an
> > +	 * unstable link with dropped frames. Disable EEE advertisement on
> > +	 * them.
> > +	 */
> > +	if (priv->id == ID_EN7528)
> > +		for (i = EN7528_GPHY_BASE;
> > +		     i < EN7528_GPHY_BASE + EN7528_NUM_GPHYS; i++)
> > +			mt7531_ind_c45_phy_write(priv, i, MDIO_MMD_AN,
> > +						 MDIO_AN_EEE_ADV, 0);
> > +
> 
> The problem with this is, you can still use ethtool to enable EEE.
> 
> Please look at phylink_bringup_phy(), where it calls
> phy_disable_eee().

Thanks, you are right , the register write is the wrong approach.

While looking at phylink_bringup_phy(), I noticed that the mt7530
driver sets config->lpi_capabilities but never config->lpi_interfaces.
Since

        mac_supports_eee = mac_supports_eee_ops && lpi_capabilities &&
                           !phy_interface_empty(lpi_interfaces);

that leaves mac_supports_eee false on all mt753x ports, so phylink
already takes the phy_disable_eee() path for every port and
phylink_ethtool_set_eee() returns -EOPNOTSUPP. On the EN7528 I
confirmed "ethtool --set-eee lan1 eee on" reports "Not supported", so
EEE cannot currently be enabled from userspace on this driver at all.
That looks like it unintentionally undid the "EEE can now be enabled
using ethtool" behaviour from commit 06dfcd4098cf ("net: dsa: mt7530:
fix enabling EEE on MT7531 switch on all boards"), starting with commit
9cf21773f535 ("net: dsa: mt7530: convert to phylink managed EEE"). That
is pre-existing and outside the scope of this series, just flagging it.

For the EN7528 the GPHYs report EEE capability, but the link stops
passing traffic once LPI is entered, so EEE must stay off regardless.
The register loop cannot express that to phylib, as you noted.

My plan for v2 is to not advertise lpi_capabilities for the EN7528, so
mac_supports_eee stays false by design and phylink disables EEE on
these PHYs via phy_disable_eee() and refuses to enable it from
userspace. Does that sound like the right approach to you, or would
you prefer it handled differently?

Thanks,
Ahmed


> 
>     Andrew
> 
> ---
> pw-bot: cr

