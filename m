Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAA2E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 16:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQo4kdQdviaktJTQUjcJ0e30Lwbr9lUNmT2EWPAUaSA=; b=m970c1lDz4FHcWtZNlaCUbUxck
	uem0CvO+9sIMOVcZ/pK2XbMHF7D0EE61ryUgi/NO6mjBVRV5SVBXX+j2TloRFDAeDz4zk/qi/S3jm
	wpUCPR2fAMPdr2RUVhzX/8gWzG6mDp03tykS7JD+xwBBRM91XKSnUmtkwGNYHRc+JGFWiZj1h5dTD
	Tq5PndQ32aZS/CDZxikKNf1aU0R11rtcFrPS596UbNUdKxnIrFNRVYu06Ad2yYOkF+ArcKwWE45kY
	v2Fh677zCZuLKGVUvsT6hlGDM+TxVVopjRYqfCCRtnAaZwUAhe6z6llhTMBVxq/onj2OSwW5v6tUd
	pB1CGlWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPBY-0000000FNTp-0D3l;
	Wed, 11 Dec 2024 16:03:36 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLP7W-0000000FMdN-1Syu;
	Wed, 11 Dec 2024 15:59:27 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aa6b500a685so14411066b.2;
        Wed, 11 Dec 2024 07:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733932764; x=1734537564; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XQo4kdQdviaktJTQUjcJ0e30Lwbr9lUNmT2EWPAUaSA=;
        b=Y3brJSA9JMt6HXUekavHgQyCFnMwc+IWqcpte+GcKdmx2L2G3H/GqJbrN+f98ThA+H
         MeMFeOXEsqiiBi/tlXJcjf7NHZPVsOQqmQCdctbtcZJiSvYCxWN/fks4Y1u2BitlBS5z
         ZLnCyA84FXAXkKKK4a7ougUxYfXrg89tlZo3KL3Quny7IjmeDaYJ/vl3FO0z0IK3nnl/
         8QmQzUlFJs3czwahXfmVX3E6Ztn2YmNAb8PdrnMONq1YOsjAm//VEJIbv89VlZrzPnuO
         8eBmrzEViskRVsFz3TklVYqj615WEYc6GZnW9kWwcv6LbTC9zR/eOdKFZKsvv7Qpziwz
         zIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733932764; x=1734537564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQo4kdQdviaktJTQUjcJ0e30Lwbr9lUNmT2EWPAUaSA=;
        b=tcSriBxsi7hWEBfr8D3aEEjFQRAqZMjlk8B3ZQ9iGglEVSm6QtJB2Uxdp1xeKJpcBQ
         zRcGT5pVjM5tpE4dEYUZUVRxk5afdvDVWvQc+GA4eOcRBNu9XfxF1YTUEDlEO1LuPWBW
         A0A7JQEtUZ4qdHP/wySGSDiAAX+aYfeAjk3Gz+pAbdNPGYVXIRNpEYRa72BabKUwCdYu
         8yOe9FpAexsGX/weOWauemukdqG6OioYUO0fQtdOV0YPuILQX4puSqXS4kk39hec2fbv
         Crpaus/jmorqkGKw8Gyv0cKdYFzj3Tx10K6N+KLbIQdFn+RlgHWEidOI5v9RyX1mYBwS
         0Niw==
X-Forwarded-Encrypted: i=1; AJvYcCXW+gl8uQoxQYwFDZZ7b1ASs7f9qbfjPJBeRXAJv1y7jO4WCuurZCOL1poUk62dKj1Ivie7+k/rod/P2HSFKyw=@lists.infradead.org, AJvYcCXrcvwH59WwYIjhynnPz6dXgsFy7rlrbNvDW30BvlKw+xFs7qu/F9km1dh/WqVgdZtGmZOGYDRJe2GLpezACvDt@lists.infradead.org
X-Gm-Message-State: AOJu0YxpOJY1vBs13DGAMgTAGEkW5ZXgN8fcbITcdTYgB2Zj4aPOytxK
	KqAbJ6P7duZmBCFOJ3E4OWzHaZ3YjwKt6mbaMkLKcZHVLS3jbCstwBx4fcKf
X-Gm-Gg: ASbGncvoxAbXn6WAe5/adHDw000e53yzYp+881NdHaN/rJfoT/lsa9Tew+ZWkAdMJcT
	L7IlbPS3L29zRQ9a9Qm3Uh3DAqj3jp8ozMzUHiTENCq7AiuI/gLtquPk5dRk0XpBG4kbOOLArMy
	pBmmSnm9lEMvVmvuuzgPZwn+t17yIKunejZn5g9apGVChTJBA4zGw3IbiGMdRqXafUq5an8Thrb
	yaI5tc+g5qiJoKwFcR4ene0zArpSnbBRRaaE6eiig==
X-Google-Smtp-Source: AGHT+IFyV3iDXmmlLsNjwIKP7/kQgODUrCUnsTuF51JTS71xaSEMaMEtAZkpdveeiZdMK/ulibo79Q==
X-Received: by 2002:a17:907:94c7:b0:aa5:a36c:88f0 with SMTP id a640c23a62f3a-aa6b13b9a75mr119197466b.12.1733932763509;
        Wed, 11 Dec 2024 07:59:23 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa672d377fbsm596189266b.75.2024.12.11.07.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 07:59:22 -0800 (PST)
Date: Wed, 11 Dec 2024 17:59:19 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>, UNGLinuxDriver@microchip.com,
	Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH net-next 0/9] net: dsa: cleanup EEE (part 1)
Message-ID: <20241211155919.rv3gglwnuuy4rn4y@skbuf>
References: <Z1hNkEb13FMuDQiY@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1hNkEb13FMuDQiY@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_075926_389667_C467DD74 
X-CRM114-Status: GOOD (  17.03  )
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

On Tue, Dec 10, 2024 at 02:17:52PM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> First part of DSA EEE cleanups.
> 
> Patch 1 removes a useless test that is always false. dp->pl will always
> be set for user ports, so !dp->pl in the EEE methods will always be
> false.
> 
> Patch 2 adds support for a new DSA support_eee() method, which tells
> DSA whether the DSA driver supports EEE, and thus whether the ethtool
> set_eee() and get_eee() methods should return -EOPNOTSUPP.
> 
> Patch 3 adds a trivial implementation for this new method which
> indicates that EEE is supported.
> 
> Patches 4..8 adds implementations for .supports_eee() to all drivers
> that support EEE in some form.
> 
> Patch 9 switches the core DSA code to require a .supports_eee()
> implementation if DSA is supported. Any DSA driver that doesn't
> implement this method after this patch will not support the ethtool
> EEE methods.
> 
> Part 2 will remove the (now) useless .get_mac_eee() DSA operation.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

