Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6545C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 13:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1m9B3TqTXQp52+cm2Y/AlOog6dUAN0pTGZwsxsnFWrM=; b=zY7BhUBgseZIdFnKTwhzwaErOn
	HDTzc484HMk0/Y2zQUF7Ak10aP2kYGN097G1R/CQNR2rFuOQJiKuawBCx9n4mo1d3rgioxfKfqwxq
	XtExbNUy4kUxVuR8cQPiEgLTmsh3z7V7H05AiOjZtzcD2xaJtrHP3DoBhHSoj4zE6ytbWUdiB8h60
	IEholKqgWvj9dhfwck2lWSCOgYvgFVKa6pzlKrva0HKyu5808xZEX2VrY9HrYm448EgKHex5qC82g
	+qxOnmFFOVS3znzFMU4cne7Molo1JrWc3F0Es1SyZObop0gtN22Qqua0AkEdVNRN7GCE6XT29C6fA
	YCAQBoKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWwl-0000000BtuA-1jkJ;
	Wed, 22 Jul 2026 13:25:15 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWwh-0000000BttJ-3FOQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 13:25:13 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-84a2dcede83so12239950b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 06:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1784726709; x=1785331509; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1m9B3TqTXQp52+cm2Y/AlOog6dUAN0pTGZwsxsnFWrM=;
        b=FzBe8We4F8gO+ZMmnFV7tg2l9L/Ky11ypRuOcp8RzAgiJjP4aD3F44Z0nhoqQY/z/Y
         1mvo+VreAHud1uC1MfEHQqz4u0CS4pVGQ/VW2sme0Z9QKAhYcdPT8f4jy5dSZmPLDYtX
         PbbtA2M3FfKPYocn2XTvNK8dD7XVj06985azGzykxhCxqzNvFsR8mIIMCPr4+bw849QR
         PYthNi8mECG0wOP5Vgld549FQ0tl4AIJn7ucUzPtB9c+xG5yvvS9mx0cFCRDfAYuwwRB
         U1HFHJAb+rzTjDSnx74T/U5EPTAtSpEwfQ/Px1S/ofgE+EvCaxzKVCgzkQbxcjx848wn
         4mUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784726709; x=1785331509;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1m9B3TqTXQp52+cm2Y/AlOog6dUAN0pTGZwsxsnFWrM=;
        b=MTAOaNqSr4ncJXbi1WodTmjAuP3YjjE/fCVxeLSXqsLmcKUlpgEttSLlI9fROWinr1
         YkMcgEGySVDG6G2Y3vaPOPiDNKnCn4r7y8VL3OGchqn2wfzuhHsuulZ0mJu79NO/SXdS
         zVCEEokolk3bIlmSs3sa6y8g15XodXMQb1wh+SIN/xg+kFig/oSv4OwPfkcxYZKBgrPE
         DfUl+PTwuiiaHN6j2KIQcEfR2uNh56q46ujWAXrS3N+CXrpjT9tbrvAOrApjAVNZSHMc
         GpI3XSbg2M1wv8efw9+35jXPZ/qGP5CU+QNFYPukv0+CgW1/YacQsMbiMqoj5HIkyU6S
         wpVQ==
X-Forwarded-Encrypted: i=1; AHgh+RrE2lCdaTENYchNVklHe0xrqa6euf5KFiEkK4Peqv8AaSe/PsHHB3RtfT4zVQ9YX7R7wDMzVnKeq8hFpRwspMWv@lists.infradead.org
X-Gm-Message-State: AOJu0YyFhRvZUp2ld3v2pDezq1ie8BS0NQr8385k/xlIna8ujZSvpRue
	cuZDgLh/3JvDQwvWNaipBXNWPyMAaJbhLjgaJNC3Ev+n+0kJTjUWBNQdGXzsV3f+K3c=
X-Gm-Gg: AR+sD11sRgxWEhL/Nzvh4tbxooXEDw8rNG0ZL9eXFBnZZKor3+YiXiRNtYtdJpWrsp+
	10IDJWbZgyBV3BcMEzXC80E9YWqSdFOskWfxhdyqDK1t830aIbLXpItbGOBNOhrt2ujUFEDXMj9
	dJcQBrXpfrKZntXfszz0OXBrG+/NTt0rukHutU+GFNtDydllaOis+2Pbkk+U1jAUZf1FETruZaW
	qysPvlPlDBD/g3rgBDaJe9tVpnFKvMDL80p7NLeNk0Gqv1e863d8fQI+05TKJvHfwOTfGJZA4cH
	oNkphQNZ4iYTtwFXQFXfJ1ZzV7pVo2H6/57t32RDoNMyjGXK6H2hGExSuUirKrAt/i/+7H+5pGH
	f9KxKGYch84zCcASFfPqvgOltutr3HN+oaZkkCPvA1UxgOpU8nA724jM1y/0=
X-Received: by 2002:a05:6a00:13aa:b0:84a:2ec8:fac1 with SMTP id d2e1a72fcca58-84c29545550mr24635234b3a.72.1784726709431;
        Wed, 22 Jul 2026 06:25:09 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4f::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17602046sm1332323b3a.59.2026.07.22.06.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:25:08 -0700 (PDT)
Date: Wed, 22 Jul 2026 06:25:08 -0700
From: Joe Damato <joe@dama.to>
To: wei.fang@oss.nxp.com
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
	wei.fang@nxp.com, chleroy@kernel.org, maxime.chevallier@bootlin.com,
	imx@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND v4 net-next 10/14] net: enetc: refactor SI VLAN
 promiscuous mode configuration
Message-ID: <amDEtJmcET788Lls@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, wei.fang@oss.nxp.com,
	claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linux@armlinux.org.uk, wei.fang@nxp.com, chleroy@kernel.org,
	maxime.chevallier@bootlin.com, imx@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20260720014317.1059359-1-wei.fang@oss.nxp.com>
 <20260720014317.1059359-11-wei.fang@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720014317.1059359-11-wei.fang@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_062511_960357_514E8EFF 
X-CRM114-Status: GOOD (  21.31  )
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

On Mon, Jul 20, 2026 at 09:43:12AM +0800, wei.fang@oss.nxp.com wrote:
> From: Wei Fang <wei.fang@nxp.com>
> 
> Remove the enetc_set_vlan_promisc(), enetc_enable_si_vlan_promisc() and
> enetc_disable_si_vlan_promisc() functions, and introduce a new unified
> function enetc_set_si_vlan_promisc() to enable or disable VLAN
> promiscuous mode for a specific SI. This simplifies the logic and makes
> the interface more straightforward. The vlan_promisc_simap field in
> struct enetc_pf is no longer needed to track the current state.
> 
> As ENETC V4 only changes the address offset of PSIPVMR register compared
> to V1 without any functional difference, enetc_set_si_vlan_promisc() can
> be moved to enetc_pf_common.c in the future with minor adjustments to be
> reused by the ENETC V4 driver
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  .../net/ethernet/freescale/enetc/enetc_hw.h   |  5 ++-
>  .../net/ethernet/freescale/enetc/enetc_pf.c   | 36 ++++++++-----------
>  .../net/ethernet/freescale/enetc/enetc_pf.h   |  1 -
>  3 files changed, 16 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_hw.h b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
> index 66bfda60da9c..16da732dc5de 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_hw.h
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
> @@ -185,9 +185,8 @@ enum enetc_bdr_type {TX, RX};
>  #define  PSIPMMR_SI_MAC_MP(n)	BIT((n) + 16)
>  
>  #define ENETC_PSIPVMR		0x001c
> -#define ENETC_VLAN_PROMISC_MAP_ALL	0x7
> -#define ENETC_PSIPVMR_SET_VP(simap)	((simap) & 0x7)
> -#define ENETC_PSIPVMR_SET_VUTA(simap)	(((simap) & 0x7) << 16)
> +#define  PSIPVMR_SI_VLAN_P(n)	BIT(n) /* n = SI index */

I suppose it would have been nice to only have a single space after #define
above.

The rest of the code looks right and I think the promisc logic is clearer, so:

Reviewed-by: Joe Damato <joe@dama.to>

