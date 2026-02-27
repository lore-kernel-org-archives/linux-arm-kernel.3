Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED353FEFB6C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNM6LkJDaly96+frvDYVu+WZiJv/Y/1sZYEDKoTKzhk=; b=jIWsMxdbiV+NC9U9hYTBj/SCzp
	vrBQNRkLk0rW74pAv+FZY95XOnfxDjTByy/BKLwFiv+uHGBEcET8aZpg0yjC3Sub1vOBZHquvEO2L
	ZZ6q4f9rEifHccXszJU0m015U+DW9tUCH0b3qjQ1Yd2FyciqKd7Kk6vIvuMrxas9McFs+Hh9wgUVW
	fgUeOTJSTlsD4Wq9fOVebd3ZxX7JO+stZpeo9KaChsxGMhmFU6KsIAAll7SLRGfuUMz+kX0mkw6fW
	AgUZgfu3cYcmvHdOGXaY31nV4UPo+t4b98fKmpC4Pb2AsyFO46j2lT7ONfIffeK0Ov+Z/nE9ol6sy
	/G3SPUXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw05M-00000008gPp-20fH;
	Fri, 27 Feb 2026 15:49:00 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw05I-00000008gON-1t2a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:48:57 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4806fd9033bso4070285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 07:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772207334; x=1772812134; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UNM6LkJDaly96+frvDYVu+WZiJv/Y/1sZYEDKoTKzhk=;
        b=LVrfo/WZ2Mvzm8upc+srcseXUar8n3u2UkbjtHHr+6vaALyLdMypuT/NnWyzx2Q6j+
         U1xemT0xa0FS88I6QDwGDjELXj+ag5WR/M1T8zF3baTJFrjEvQ1zN2llBfC9sizhlbo7
         jtOK5mpDdOy41NNt2dgNcsEfXSQWVNc6+QVs7JEylWBq/qw/a6l0q5BI5SQH7X3jpAOe
         4rJOlX4fsWI6XgGIBN9E+TeHF6PZfkgIyS4MTNKQdJze/eGofKVxly1Si4Ru3XxSHkr0
         bNf2c0JabJL6uV8vtrnAq5o+8rraY8jnsXSEMdlMO576ApXA+vF787ClOCURyBOB9JkZ
         BZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772207334; x=1772812134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNM6LkJDaly96+frvDYVu+WZiJv/Y/1sZYEDKoTKzhk=;
        b=U94bpWuRKDsU1nMCIZ58iNpZ76NVlU3maDnqQqqVqaGYdZsFEODgM+XnaEUfsbTAH4
         nwvBLlqSmkiebeihp8Eki25L5PiQXmC7rhclgv+mjPHCxOK9CaSmktHMmD9eO4psnNA0
         txbLC/wAfIzRkFTnQ7ccCmK8Ji/m29pTm5F81LFNUW4dq7pPVlBVoBFFAzKhj+mmiMqr
         6z24NQpHTucoINeJzkuThgv1YIBkskkKLmD4iWJmgMQ0b6gjny9hjmxOza1qnzjTwuKb
         xnO5Vgdy9kddD+MK6u7xsK4EO/TQ/kCGg0rQ5OHPTrB7mNDh4wPUTbRWQmm2LenKnnlv
         ZOnw==
X-Forwarded-Encrypted: i=1; AJvYcCVb9W3GzuaCVRYm3ayU4/mgy5vkSUlrcEMdxguVJzK4t7h/vpGWfh35FbMubX9kgmHTYHm77Ga07Jg9xa4v4DTd@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5SpLBp16jLJ39giTy6ZTjMjU9oXLqX/huFYkfFHqNgwFREpxy
	49jagp5+kQBRP9Gdoxu8yxjHK5QOryUoYO0nADSstJdnuZ/YrsSeUfuH
X-Gm-Gg: ATEYQzyrQxKS/VeASG0tyvuxNGekWE4W1hrQH6RdMT4ETEuDPjSTqaZSLQyWueCHxaH
	2ddE/ars102Wg3NlfKkVKkNHsfCCP5Gr2P0j5O5Sa4U73x6jkt0/+s+J7Dt71W0nJzLRjtHdxoQ
	t4I4OfJh3/EfIFZuV1SNxHJc/WoHQNiVRm1o2orczKvZrElQBk0Q+qTyyk0R35fGWd+G60V3BBY
	fqz70aLyPTFk6N0XATXsPQbQMR4la6NYl8O/owy90YO3sGOQMEnIHB2qG+O5O3GbyT+w2wX4GZ/
	33knDBbhldAvMDdDxHQpudQF2ogGHG47ihjviwOBQeeI3ORpdr/2E0zUIHCHTvVc0drIZmfDduq
	s97p3fHF/Tv0tC/EXsRBxiprR/MbMb+K3vtvtuHkX/LajTbk/Oq7ud942x5a4ayRvjOdYx3hFgI
	fSZ1abk8ptI2+Gdw==
X-Received: by 2002:a5d:5c89:0:b0:435:f96f:3517 with SMTP id ffacd0b85a97d-4399de241bamr3355441f8f.3.1772207334184;
        Fri, 27 Feb 2026 07:48:54 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:ac95:d4c:390e:fb0a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c76c49fsm8168270f8f.38.2026.02.27.07.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:48:53 -0800 (PST)
Date: Fri, 27 Feb 2026 17:48:50 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"Paolo Abeni <pabeni@redhat.com>, David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further
 serdes reorganisation
Message-ID: <20260227154850.hcz4ftt3aah7robh@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_074856_503348_92DFEFCE 
X-CRM114-Status: GOOD (  21.63  )
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

On Thu, Feb 26, 2026 at 11:07:16PM +0000, Russell King (Oracle) wrote:
> This is part 2 of the qcom-ethqos series, part 1 has now been merged.
> 
> This part of the series focuses on the generic PHY driver, but these
> changes have dependencies on the ethernet driver, hence why
> it will need to go via net-next. Furthermore, subsequent changes
> depend on these patches.
> 
> The underlying ideas here are:
> 
> - get rid of the driver using phy_set_speed() with SPEED_1000 and
>   SPEED_2500 which makes no sense for an ethernet SerDes due to the
>   PCS 8B10B data encoding, which inflates the data rate at the SerDes
>   compared to the MAC. This is replaced with phy_set_mode_ext().
> - allow phy_power_on() / phy_set_mode*() to be called in any order.
> 
> Mohd has tested this series, but it would be great to get acks/reviews
> from the generic PHY maintainers.
> 
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 31 +++--------
>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 62 +++++++++++++++++-----
>  2 files changed, 57 insertions(+), 36 deletions(-)
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
> 

Reiterating Vinod's request to netdev maintainers from here, just
because it's easy to get lost in the multiple patch versions:
https://lore.kernel.org/netdev/aaGgWUpM2A5y11Wh@vaman/

Can we please get a tag to pull into linux-phy when this gets merged
in net-next? I'm also working on a patch set for phy-next which will
conflict with this series.

