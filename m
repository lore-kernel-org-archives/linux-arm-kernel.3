Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC472C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 19:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kw7FoD+bzLFhraFxvPfr1StE5DODuuLr8Azjhw6HlYE=; b=2uPg5oD2XKNvmMvbllS9dMfBgz
	omEHSEmLkombz+ln4GUIJHQ1suUQ5PiuRyqNurBjEykfGRmWfQMoROxYjdChALhs4gjOWWBEoUaVm
	/NNSraH3ip8A8boUahIqDs5ifbV3FZKnHT64+kYYYpbbeUSivYaPzlquDcrgAPkQ/HojHNq7YS+5r
	5TYo/xKEKIJWeFBD+oRtlf/4Ldr56CjnE3cjp9YaVZhdIZPITMJvv6eEM5vXDB5Tc2BCFoqs7apfJ
	XEEz87o8LnI53aeeaZ2ul807YWzAHCImmSZaGmgEU1plr5Gi6MZHQmErwflr8t+p4BxUFl2IkWx/M
	XiAVJ0vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuamy-00000001QRR-1xSM;
	Thu, 13 Aug 2026 19:08:28 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuamr-00000001QNX-0igx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 19:08:22 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47df6a5655aso9713f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 12:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786648097; x=1787252897; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kw7FoD+bzLFhraFxvPfr1StE5DODuuLr8Azjhw6HlYE=;
        b=CaEQsEyxNawkcWOT4ZOFFBP8Tl2XGhzSX7wOm3yr3tbU5qwmGxnO8uGa/FtgnMW3EK
         kSSarNmiN+nk41EBC0Rm0u7pQ5Mr4k3bBUYI+nCfaKuXLTKaQSBSATQIX/Hwi2m3mKP/
         nYGCAZGCza7nUUtRRTaxuHXgBreMtm8jYtJsrO7sAvpBJoLdPT0zzJfrzDzjAkTOG8c8
         oYekoYXKTwBQUOuUwidO7C0T/QqcxKwvaVjPxxEpyN3L+TifY38zD9asmRgbUhSD6fg8
         /jyjQCARCuTwjsKr2GeTFxmKLRFg2e1pN5h+rbq+JclZM3DXGRTcW+LDWPGnLGaJmz6E
         ahjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786648097; x=1787252897;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kw7FoD+bzLFhraFxvPfr1StE5DODuuLr8Azjhw6HlYE=;
        b=CA25MrX2LPGAuBexG9c/R3ofB9gkw6/h0L4sskhnlvJOLy59GMcu4uMX5mqFdu5hnW
         1QWxIxDUEnYc3547dCuyiUFo+423z4sLGJnujL7I8UsD2E+VID4yb+y+XvQ6kVlRpRtp
         L2vREubsIdOARdXi3g4UuIdnmqloefPUuiX7t0Yz6hRjAtQaEaNwqkuzO8GTjquiSDCY
         cN9wgNSsCS1YEGU/xkOrKvX68YiuWPpHeMSQpdLLOugA+0L3X5WJssCbVOJEaNavVZmW
         WLSdgdP07SK49kHuyO8PNpxkpEFdds3pY1BzJYz8czG5OJr+BLExBHAdWcSxv8im/ERp
         JSwQ==
X-Forwarded-Encrypted: i=1; AHgh+RrdewGG752RMKUB8KDHqSkn06ZYl2qTADxNCVwYM+fK/VghCGAhFWBmGspfJ15r4LhYntQxg9aSIBJMxhHU2bFn@lists.infradead.org
X-Gm-Message-State: AOJu0YwbzR6hrsbChV1COc8S7MBVDRBYFQjjUYUi/ZUI4vQ47a7YV4kx
	BDPtrmwhmPPU8f9cMN0vXIbr+tVZ6PaiKRniECNIliEQue76jADrSHQ0xA3OvA==
X-Gm-Gg: AR+sD11wtMr2rFnHvXyzAkYZBVNZQ80ZrW9Y9p06rCVIl88P8PGKjZ3oUUMWA6NWNF6
	y3dZCVu+Wvbr+MgAVXFFNKoTuniwqWdfvmakS1LBLoP0hP43TbxSdwQWnkhxebxyv10NoCXD+m4
	DnsiLBzf9Fi2g8yHE6V5BYkQOmBVIYrfnIDS4cRwPUqxpTLF5uMjDCaFC0hKAxjHKmzwJUbs9cj
	TgrTRulleTx2tOODBR/9kZDwKV1PFmUsDQyVbNKG5BJQbzQTE1H0Bs2rXo8Z5KhBOSaVd0hoPkT
	vmiWa47Duzrm1TjD5X3zXCdypXW1ANb7vjTl/3MCKfzRFWhgzgi8YUIIEX0TGfSIcfViYPUjiZZ
	nyaBQMWS9pERKsEGE0SnXasKzc9HqpnjPn49nGwfu7VLoFIs6jpWrjrNWkpwytzSZmIEkTMiHWt
	rF/ypQBwONMIK1G4o7YhpJ+I1htZ1/DN3t58Kq2w5nSFaRM8gY
X-Received: by 2002:a05:6000:1446:b0:47f:959f:d5e with SMTP id ffacd0b85a97d-481606984d0mr345336f8f.0.1786648097563;
        Thu, 13 Aug 2026 12:08:17 -0700 (PDT)
Received: from skbuf ([86.127.220.200])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2cd7ecsm1427509f8f.36.2026.08.13.12.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 12:08:16 -0700 (PDT)
Date: Thu, 13 Aug 2026 22:08:13 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Semih Baskan <strst.gs@gmail.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>, netdev@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V3 1/4 net] net: dsa: b53: deal with Northstar devices
 using CPU port 5 or 7
Message-ID: <20260813190813.63fjmjmciry6ubaf@skbuf>
References: <20260812132755.32585-1-zajec5@gmail.com>
 <CAAsRjRn4Pfv3LzQtVbeBzw49fN3Fk+M4JGwKkKq6pvo5Uk-fpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAsRjRn4Pfv3LzQtVbeBzw49fN3Fk+M4JGwKkKq6pvo5Uk-fpQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_120821_275756_C59350ED 
X-CRM114-Status: GOOD (  15.82  )
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

On Thu, Aug 13, 2026 at 01:53:56PM +0300, Semih Baskan wrote:
> With all three CPU ports enabled, GMNGCFG ends up in dual IMP mode
> (0xc2 read back). In that mode a tagged frame whose VID is missing
> from the VLAN table is delivered to no CPU port at all: an 8021q
> upper on a standalone port receives 0 of 7 tagged probes, whether
> the port 5 conduit is up or down. With port 8 as the only enabled
> CPU port in the DT, where GMNGCFG reads 0b10, the same frames were
> delivered. So the preferred CPU port alone does not revive
> standalone 8021q uppers on DTs that enable all three ports.
> 
> The same effect touches 4/4: the R8000 today has ports 5 and 7
> disabled, the single IMP configuration, and enabling them lands the
> switch in dual IMP mode through the same driver path. If its switch
> behaves like this BCM53011, standalone 8021q uppers on the R8000
> stop receiving with 4/4 applied.

Where is the code that configures this GMNGCFG register?

> On the RT-N18U the boot firmware provisions a MAC only for gmac0,
> so gmac2 comes up with a random MAC and the bridge inherits it,
> changing per boot.

In the previous version, Rafał included a patch so that gmac2 uses the
same MAC address as gmac0. Is this better?
https://lore.kernel.org/netdev/20260811193658.14304-2-zajec5@gmail.com/

