Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BA1F532EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 08:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ts8QTgurhQrOhcbvZk0taNObr5EoxTyEYtshId05lwo=; b=vKTTlNN61D+5/fsi19KdCE5rGl
	pDl0xTG54DFRpLzFim/Je2Db7KdK42n6vM3C+6TGiKqeW/YblDOwfHWylLIy4zLXkXioopyWw/lNx
	op3uf3o3g8ZqKIXTkN5Vc0bL6cPcTIpzCJlZD9zioHsWjdC/jEkJexw8dJdtthz5JXf5YyKWLVy6W
	hPvPUXe1lu6BwZd+oWNbWsGfkU3sCBDNm8nkPAUDntNQucmuqPMDeBWT5SLjYzN7sH9+mzxRT+G/g
	jttS1r8M0x+kIlDaHS5nVr05YMsbj840m0FdQYxCg7YIy02UNszw8ZA9KMsKKRYsqppDNT4GJNZJv
	id/6FQLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wtU-00000000y8e-1za7;
	Tue, 24 Mar 2026 08:13:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wtR-00000000y7o-2Vbm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 08:13:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774340019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ts8QTgurhQrOhcbvZk0taNObr5EoxTyEYtshId05lwo=;
	b=h3v48IdG12BPdeXBmfK8U7izwh3KaFLtxSShFRDNWOqLmYt04jggKQkKeCFzEa+s3DB3Dt
	s0+FCAI3xEOaQbenBlKzTNdMn8tf2X8KJojPyvLcT0T/eIEsXOniYI8qd/5qbfoe2ZE4c6
	p3QvKCtqNRtU8dq2KD0wwl11PhC9pVY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-l7tK9btSP7S7iU95iwBgqQ-1; Tue, 24 Mar 2026 04:13:37 -0400
X-MC-Unique: l7tK9btSP7S7iU95iwBgqQ-1
X-Mimecast-MFC-AGG-ID: l7tK9btSP7S7iU95iwBgqQ_1774340016
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43b53023d60so3369755f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 01:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774340016; x=1774944816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ts8QTgurhQrOhcbvZk0taNObr5EoxTyEYtshId05lwo=;
        b=fajWbQqwaGwuPEKRww6mFxwO8PzHUBXBfojuuVN4vPCfFhSWi8r6/v3OorSNYxWqB6
         79tMjZP9qdqRDf8WwXT/H0Cma5cp72nXwENWZYWJeGYhVFlJBDRhem5Mqe1OwnmJjUca
         zAT8G1tYsD7DDWO0Eh2mSUzHUShzmTHjivB9u2NOyzecbRM2PBigd8zpYa8JJXtfdt5S
         zglJddcStapbxO1yX3vgym+9d0Rrkeuvfu+CII3pkAyamlNTrawppKhXEhDX5hPaaVuB
         OETdK7Ubmb43U0332+XKJDKqbhf7xS0s7X2MUHux3ydJrhL+1kifbKL9ucZaGvPn3eUX
         upLg==
X-Forwarded-Encrypted: i=1; AJvYcCWy6LMU7C5Bwa3cUG9snnKBCfBTnyxk087ipfn0EIXlPovELWWjC7GmTKyAD11hmJCrR5A/i+6rtB6MVXgxLXa4@lists.infradead.org
X-Gm-Message-State: AOJu0Ywnxs6WywB2bmV3HNTuhq5j+ELBuUSfhW23+kv9WEKXveUU0zEo
	DXoz0r+4zUQd9w93NrvyO7NPmcMYXdI2H79+1X1NjAf/N+PDvUCMAjNOFckIWt3uFBIuw2hYUfG
	A9lAP7vjymXSCpFJqcjFrlO1CFMZj3cRwzcZ2RvBZTJTzN5j87z42dLM1d13k+lxwk8AfEm4zvB
	xj
X-Gm-Gg: ATEYQzxrFPGV33Jkrp7O2ZSQTtCnOE2s6wFlcMm9V7bOWDkpCGDuJIoz89ae4eY/GYX
	4L0et9D7ErseXdaor2xzGNBEaTflXZjAQctc1hM2ZvgZJJkml8xqmlR32WnaetK08WN54ETm+Py
	US1ZeFEseOIBjScvBISbpAOPdBUAaM7heCGTFPE0DjmSBF8+FncB+31NZlaI1W56aPGG2YdkTCd
	XbF+iJa7G0TTs5/viTkHu6tZVcWXEriAYRGhIiitx1EZj6p2tGBDaFTyYZeZgr9ucdH2t/vTiGc
	PNxyAjcecPacU3ETBPTyOmVgcnm6QBMibd51OGb2D2IqizsQTiLoW564hOjTiLqIIjM1ajSOLGc
	+RjwolDE3I1DEHHBthefjBd1lIYrePkea27dR9cxlz4mpAcmFIKSDhY7C
X-Received: by 2002:a05:6000:4382:b0:43b:3e40:222d with SMTP id ffacd0b85a97d-43b64244451mr22895155f8f.19.1774340015849;
        Tue, 24 Mar 2026 01:13:35 -0700 (PDT)
X-Received: by 2002:a05:6000:4382:b0:43b:3e40:222d with SMTP id ffacd0b85a97d-43b64244451mr22895104f8f.19.1774340015382;
        Tue, 24 Mar 2026 01:13:35 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.153.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae048sm35875560f8f.1.2026.03.24.01.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 01:13:34 -0700 (PDT)
Message-ID: <c4e3c49e-ecc0-4702-9d2c-88ff420c4647@redhat.com>
Date: Tue, 24 Mar 2026 09:13:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 11/14] net: dsa: netc: add phylink MAC
 operations
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 f.fainelli@gmail.com, frank.li@nxp.com, chleroy@kernel.org,
 horms@kernel.org, andrew@lunn.ch, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, Wei Fang <wei.fang@nxp.com>
References: <20260323060752.1157031-1-wei.fang@nxp.com>
 <20260323060752.1157031-12-wei.fang@nxp.com>
 <acEIQqI-_oyCym8O@shell.armlinux.org.uk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <acEIQqI-_oyCym8O@shell.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xSEfrmu1iFkdveyFbHZUV9hUyhS58s8htxXH9-xnHGc_1774340016
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_011341_723898_8F0FA23C 
X-CRM114-Status: GOOD (  14.01  )
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

On 3/23/26 10:30 AM, Russell King (Oracle) wrote:
> On Mon, Mar 23, 2026 at 02:07:49PM +0800, Wei Fang wrote:
>> +static void netc_port_set_mac_mode(struct netc_port *np,
>> +				   unsigned int mode,
>> +				   phy_interface_t phy_mode)
>> +{
>> +	u32 mask = PM_IF_MODE_IFMODE | PM_IF_MODE_REVMII | PM_IF_MODE_ENA;
>> +	u32 val = 0;
>> +
>> +	switch (phy_mode) {
>> +	case PHY_INTERFACE_MODE_RGMII:
>> +	case PHY_INTERFACE_MODE_RGMII_ID:
>> +	case PHY_INTERFACE_MODE_RGMII_RXID:
>> +	case PHY_INTERFACE_MODE_RGMII_TXID:
>> +		val |= IFMODE_RGMII;
>> +		/* Enable auto-negotiation for the MAC if its
>> +		 * RGMII interface supports In-Band status.
>> +		 */
>> +		if (phylink_autoneg_inband(mode))
>> +			val |= PM_IF_MODE_ENA;
> 
> I would prefer newer drivers not to use phylink_autoneg_inband()
> anymore. Note that there is no need to support RGMII inband in the
> kernel (nor is there any proper support without a "phylink_pcs"
> being present to provide the inband status.)
Would you mind sharing a patch adding a comment nearby
phylink_autoneg_inband(), explaining the above for future memory?

Thanks,

Paolo


