Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9852EC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 15:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgz7Y8qBkufWfij3p6tfrGVbR4yOWWu3669don02deQ=; b=ZV+molsQ1YWCQAvBhVK/QX19/M
	Pj/w2X2pv6M5bx+LPqGRJLM8GexD3oleN2mXfZS/FyeYAd66LSxSmc331gPG0VlGMiTPTH1eo8uZm
	72+qvnQpQSTkkYFeHjDGnzIsEUWjNGq/ShV/tA3Bsed+aV/7gepgxkfrGt37hEZA3MfBlLpNA8B3K
	TNkzvgHgzypKDhn0/eblaqOJkAXOd43Fr3biwWRz2L9H9hSD5nraFlRC2449JIJQEtgKMzCs2JZD/
	6v3EUBAd9PLh+Z/EV3KjWp3KtLZQU0pNo3v4WTFG/4egZEqhpVpxqsiULxokGw0Zjufp5/1llv5qI
	4coah1FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpvS-00000007C83-13eN;
	Mon, 20 Jul 2026 15:29:02 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpvQ-00000007C7P-23Me
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 15:29:01 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ceae1ed204so81131665ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 08:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1784561339; x=1785166139; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bgz7Y8qBkufWfij3p6tfrGVbR4yOWWu3669don02deQ=;
        b=BHkPnTnVhGIK3JoHoRg5quGh93Y2ZS4GbHjHSkA6dSNonUs81DLwURvchym0yXi2Am
         CmplcubugY583oS9F0qYkhdVFoIaxhsiGeaGkvq86W1aVmEKwGJTza7VboUAWrgdoUPq
         4fLUI4dxpiTcOERU0270Tot8X36CWD4jAq7axVSCVa6MVCf3jEDFs3x+WEqiQo7L1lP6
         r2c69jwkGyQ8NOiHcbkcCUJAX8t2IR4Cha5ArXClrIQQWUuroXO8xaxVrnEKMwP56upJ
         8nwzTQsVDJsFjuSHr9qK1WKqDk+P3Gr4ZW3T/l/DR1c/J6Uuyq87WEoBLu1lg1e5mBYX
         S2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784561339; x=1785166139;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bgz7Y8qBkufWfij3p6tfrGVbR4yOWWu3669don02deQ=;
        b=bFCxcpx5kPW+QNmQFx+B95CFCygvifd/Qj5HUPKxM5PA8nSiyicRqcieI3BRrrn016
         Sh/r/Wty5P49R1hpdD+54ymkihcx2XPOxXVkkGhJsY2f44tKb2l5wFrr4/CZbhSabt5H
         J4Kf2hiF5XtqxAHqtgyu1cbpcBWfbr/zH+ig8DVR3Jihy/DbTMazT+WlPqrdbA+5/OSr
         XxZH/k+mLB4yI8RUno/8fYsdgR5HkqMYbfDv7uYmC2vxqH+Ky3xlVZ0HTznkORedJafx
         ff8mpoX/qYlmHsL69x46sy24VmUh3tu3EK6AOBt82ZvuPQZcuedcwvmqeV12cDlYUHSy
         +x8w==
X-Forwarded-Encrypted: i=1; AHgh+RoJJz9xYQKV6vtraxL9xsZ5Lvka4f9O3Ni2t7EJ7CFJODchGjkqenNUtDCyDt3AugCJpAgKQwqITB0XFGqAAW/z@lists.infradead.org
X-Gm-Message-State: AOJu0YxL6swKajGiLHGaM1G9g7vjOnIbDl7IG1RlyUhhLFhX+tU/0GDQ
	0IQhA03m8hUjFGngm2Yhht459nmYUxMLnK2c21AzvaMbFNqvwFQM+1jSKKOrxWk9yYM=
X-Gm-Gg: AR+sD13NU2AXrJBBSfpzlpgpSP86k4H42UJXLdugVWhGL1cbhWrE+NqFczEFpIm1OR5
	KaJDLcjsrutN+tkM3vuawu0R8/pBjTZhWXR6cEt84n14JggUTtJaTwOMsMz3HH06ar6ycKqWVls
	LXbfiVdLEUpgaNw9V0U7enZM54Qm7karNWglE96RQwLTMb9trZOuNOjj6GpciDhmDYLNTuUZcbj
	4Rl9sSfq887qRt+n9JVuVEFimfxpwjzjniKxXYrL+yvybZHBQaOdk4pLnfne4vlYDNRYYDre12e
	IrnOsMrqgdTd50kFUKOnCusyfuCZprQm200G97Vx+51bqSe4/GLpEsP6V5sUj/JsLy4WDsHLIjJ
	WV7T9fRwhp0TV3Z0hZIGD/HZSNoLb3ksrNrNFGVDlOW62Ca6EK1yEB5Ospc0=
X-Received: by 2002:a17:903:1b25:b0:2ca:3b31:ef4f with SMTP id d9443c01a7336-2cf34a0a6b5mr140652465ad.40.1784561339559;
        Mon, 20 Jul 2026 08:28:59 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:51::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf34730e35sm58695305ad.64.2026.07.20.08.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:28:58 -0700 (PDT)
Date: Mon, 20 Jul 2026 08:28:58 -0700
From: Joe Damato <joe@dama.to>
To: wei.fang@oss.nxp.com
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
	wei.fang@nxp.com, chleroy@kernel.org, maxime.chevallier@bootlin.com,
	imx@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND v4 net-next 11/14] net: enetc: move
 enetc_set_si_vlan_promisc() to enetc_pf_common.c
Message-ID: <al4+uiiXKgaNBa91@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, wei.fang@oss.nxp.com,
	claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linux@armlinux.org.uk, wei.fang@nxp.com, chleroy@kernel.org,
	maxime.chevallier@bootlin.com, imx@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20260720014317.1059359-1-wei.fang@oss.nxp.com>
 <20260720014317.1059359-12-wei.fang@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720014317.1059359-12-wei.fang@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_082900_551027_CF871B2E 
X-CRM114-Status: GOOD (  17.40  )
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

On Mon, Jul 20, 2026 at 09:43:13AM +0800, wei.fang@oss.nxp.com wrote:
> From: Wei Fang <wei.fang@nxp.com>
> 
> The PSIPVMR in ENETC v4 has the same bit layout and functionality as the
> PSIPVMR register in ENETC v1: bit n (n <= 15) controls VLAN promiscuous
> mode for SI n. The only difference between the two hardware generations
> is the register address offset.
> 
> Since the register functionality is identical, the VLAN promiscuous mode
> setting code can be shared between ENETC v1 and v4 drivers.
> 
> Move enetc_set_si_vlan_promisc() from enetc_pf.c to enetc_pf_common.c
> and export it so that it can be shared between the two drivers. Add a
> revision check using is_enetc_rev1() to select the correct register
> offset (ENETC_PSIPVMR for v1 and ENETC4_PSIPVMR for v4) while keeping
> the same logic.
> 
> Remove the v4-specific enetc4_pf_set_si_vlan_promisc() from enetc4_pf.c
> and replace its call site with the new common enetc_set_si_vlan_promisc()
> to eliminate code duplication.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  .../net/ethernet/freescale/enetc/enetc4_pf.c  | 17 ++------------
>  .../net/ethernet/freescale/enetc/enetc_pf.c   | 16 --------------
>  .../freescale/enetc/enetc_pf_common.c         | 22 +++++++++++++++++++
>  .../freescale/enetc/enetc_pf_common.h         |  1 +
>  4 files changed, 25 insertions(+), 31 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>

