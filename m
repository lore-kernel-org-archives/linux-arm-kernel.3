Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F648FEFB5E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2kGl/nxca3gMElmPgWClDsdWOdb0++gHklmfXh1TOU=; b=K24avLcmpazRJ2k/gkgXUwDjvc
	dXHKF+CCQYdlJhJbbTrrxKsP/9iO5F0/28I/RJqGsC0vKSOao+Wfv52RZwxcaFZN0NE/TM/oFajiW
	0mVwtOmlRFFf1Aux+jUn5xiXlzpTSfdifLpGPU+q00sb8VxbPg9U+ozX25rmFjfkDqFhR+/yBOh1C
	bF8Zd1zcbRu9JNXbMwREXxrZewtwTtLA42o8gSSNCAJLarbZySISoJQxeTVGdY831wF2C9sPe0ovR
	YdJYWhN2ezhVzoKEShNyETjg/c7ryB3uxuCiO67rS1V1Tf+W4tOnHo1KQDVeGTOyc3DeUGaq2k7MR
	Y6VtDZ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzoI-00000008dUF-2f3p;
	Fri, 27 Feb 2026 15:31:22 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzoG-00000008dTG-2HfU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:31:21 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4806b88d8c9so3058605e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 07:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772206279; x=1772811079; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P2kGl/nxca3gMElmPgWClDsdWOdb0++gHklmfXh1TOU=;
        b=OLtQGgqORjiUW4ReRfsB8qRWFs2wNavU64MXylfRgiN/iL64Bt4PkDc42NBh0oTaql
         5taF3K88oLdMQkixgY4KMaKDAAnqrPVcp5ZPWcnPtIe8kiniUM0f8ArZZs6sCX7cQa/4
         ifYTLTACyChBATzJ9Q6H/SPGW8RDWuDKd64eeXzMwjds9fDRr2W1ZBzZxQe9njI/7/xN
         Mm/bp3rxVgS5af0MD7uT/7OuXNgPWg5QquZQxfnh7M6a1uKT4Q1Vfdb6NGtK3r+9X22m
         7hdm6uEI6ketlQqNcXFzNo7BBLgzwhHVF4DTmCrIVqEI0sECIoY6/p4orFLb3p6IFQJE
         hN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772206279; x=1772811079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P2kGl/nxca3gMElmPgWClDsdWOdb0++gHklmfXh1TOU=;
        b=l8lhG3MJqx4zao/VN77KfwR+RyXs9B6v66XqtyVc1L+WM8MhUzn5Zs6No0iFjiNezE
         mvgVW+AGn2XdfgMw3bf6TGehB94cmM2N0Oz/ApfM3r+Qm8dLhBZMLCMYiHpWYDU3VsdP
         53Anu030i6+V/MjcILSALeKlOHTrxEMGk3TGzzSlpVpkzFtmSg28TGW48FOI2TuFFYAN
         X2aiVzT8R7x+JtBJVeVQqT3Jwi691yIUWxZPKPAHH5pY1uhhfo/ur3IvbhQ7Z0wuVjte
         ReVCZTZ9ERXmgwbwAvxM0BFJp56o+hDZm4+tNqkdA5iw9h4uehcJ9pDVRiI6wbp4r6+o
         aFyA==
X-Forwarded-Encrypted: i=1; AJvYcCU4F1uAF7fO4FyGeJ45EpxETzO4HzyetFiFH4lPYkrI4Krw5vyMooU3s+MZ7DyZ8WxhZJmllsrvqGKAArn2XGLh@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0uUhri5qDYTyuXQwgQTXETdmcBnvXZxy1ZLI+C9xwrsDKSYpC
	hC0YM/NPSNkv5ePO7t+dCrsEFhWxmMWL5bu1gPeYGmfaj8zKJd/5lwql
X-Gm-Gg: ATEYQzzK2Qw1yTCmg43GvrgHorT4AIgGB9qhD784HuEvwi0IoKTz39rG3r4m/yjYaRZ
	VrmPplKdVSr9gg3WBzL4ipe9VJyhXeDFSWTENpfBIwCZJOSAqPDRrW3MJVyt1KEjT7l6R5t4u6r
	5RpmofoYSajJPURlT4Uje4P2WfV2X5vRdoHRtKWyp8srSXe3WY/ZIAAaJgw1sSPY4d/4kgyNdlO
	vIH1TqfH5Hs2qbCz8pWClN6RMiMY4b6et8PUqzRdrI4lI9xay6m1fH9xS/4BtyHHy1vniEeUZCn
	xheL3qDSDjIGh04Hl/iVvsqw224Swx+hOIrbtP4yNoVRh2X9rGmLtYWexCWcoRTw+gnv80jzXAq
	NrR5s3c/hlKvTuruiniLvjcRiciRKbjnrqYk6OTsJuUVb2kq5yb/SJrrJH8hy+mRfAGK0VUJI03
	29xnNVK/3ZhHNoAA==
X-Received: by 2002:a05:600c:5249:b0:477:a478:3f94 with SMTP id 5b1f17b1804b1-483c9c29b66mr31520385e9.5.1772206278424;
        Fri, 27 Feb 2026 07:31:18 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:ac95:d4c:390e:fb0a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm230573145e9.7.2026.02.27.07.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:31:17 -0800 (PST)
Date: Fri, 27 Feb 2026 17:31:15 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RESEND2 net-next 8/8] net: stmmac: qcom-ethqos: remove
 phy_set_mode_ext() after phy_power_on()
Message-ID: <20260227153115.rk7ntq2p4fbjcqdv@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <E1vvkUX-0000000AuPo-3mEw@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vvkUX-0000000AuPo-3mEw@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_073120_606315_60ACAAE4 
X-CRM114-Status: GOOD (  17.74  )
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

On Thu, Feb 26, 2026 at 11:09:57PM +0000, Russell King (Oracle) wrote:
> The call to phy_set_mode_ext() after phy_power_on() was a work-around
> for the qcom-sgmii-eth SerDes driver that only re-enabled its clocks on
> phy_power_on() but did not configure the PHY. Now that the SerDes driver
> fully configures the SerDes at phy_power_on(), there is no need to call
> phy_set_mode_ext() immediately afterwards.
> 
> This also means we no longer need to record the previous operating mode
> of the driver - this is up to the SerDes driver. In any case, the only
> thing that we care about is the SerDes provides the necessary clocks to
> the stmmac core to allow it to reset at this point. The actual mode is
> irrelevant at this point as the correct mode will be configured in
> ethqos_mac_finish_serdes() just before the network device is brought
> online.
> 
> Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

