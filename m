Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254A8F8A140
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 08:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dCw/fk1scpcEI5fTg9Hp2YTuYcflg1hd7U/WW44L5U8=; b=iGtMbWfGd5Q0KOGPFenIbbJK0M
	dv3PcWdc3vZG0iSfzh3PV6YIWrc4WIp7DyMuStYW6PUuKTNFZdoRpG2ll5smErC01XfHbc4Gv3qhw
	6Py0AggWd33q3SOeO/EGjdraaG91BttlrpwUSGO0zWxAL3QclIUc+ogeDKY9/XtzRPWtsn1LJ4M9E
	xcYvhTDEoM/z4PD5Kb+vHFjl3WKPrhlSPIcUe7sB7uWx1K93COuIEoz99HN2iol2a/UI9xeLIWLU/
	T/4WY93sTZawwmdjJsW87C5hHVPeAWiVAdDxx3jyxVNR3Yd+eYjNkcNx0EcqqLbcD1wM/GH3s5wSV
	gM7hSxNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDHpd-00000002A56-1TGU;
	Thu, 16 Apr 2026 08:12:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDHpa-00000002A4k-21GG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 08:12:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776327127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dCw/fk1scpcEI5fTg9Hp2YTuYcflg1hd7U/WW44L5U8=;
	b=MB3xNR6KYko5QQkOYxUURByIW6M7+RGW0jMdhSkO//sIJ33Pf/avp/ReSMjTo4gpsNajnj
	gFCF6phvPj5iSSQ76cb/4WvVa239KtGw2eYydiTgmxqkrm7aoxYAvZNOv7juZ5g/tASKYS
	ziqqCVSvhDnJssFkXvLkl96JsBdBQw0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-bT98mmQVPnCKyAWEZ6rCzQ-1; Thu, 16 Apr 2026 04:12:06 -0400
X-MC-Unique: bT98mmQVPnCKyAWEZ6rCzQ-1
X-Mimecast-MFC-AGG-ID: bT98mmQVPnCKyAWEZ6rCzQ_1776327125
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43d744128b9so3468634f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 01:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776327125; x=1776931925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dCw/fk1scpcEI5fTg9Hp2YTuYcflg1hd7U/WW44L5U8=;
        b=nwWtd3meA4bAdaysTfTVQsVao5l0yQdxscZVf1mlviR8ONYPUN3IHYN+WmeLT4qgiu
         XeL3smaT3yTQCMFfE4SMk1Bbsgx4398bJKwdeb0jEhE7U19xLQi+HHHSBODp83sdK7lx
         DraF70W+s+jao2qU5kihxlyd6kPoQy060+T8+F9xhy+vBpwfuTddz5NERwpO/u25s4Ug
         wokKHDfvyn83bSWRMq35CqxLa8lCYwZR5aPDiqEk1kYOWkoeCM8I0BfEM7BaXgQhGyVm
         eMomzHQp2K61yQvB9bobrDHsd1FKTQxzwrxqcLggLuVcVEbXVD6tekzxGpNRft/9Imf7
         lauA==
X-Forwarded-Encrypted: i=1; AFNElJ8zSuIf44ljulCEpWMVetHB5i/ZfqcT7Ci28LIPEhBCBq071gBG3EVi2X2YDULInCU39r117Uon6yghRweUaVxc@lists.infradead.org
X-Gm-Message-State: AOJu0YwsMtCXEKu6A1yK4wMMIfdV6DaQjTF6Ut6Kx9TO+GHFRIxxT3PW
	/jsNxY1LoBJvs45ABMUOFnkN2qIGMhnjqZ7SBblo2QyxxjE2rNqdPF0VqsUYy01P+HetdYCT6F+
	qmcp1bzcpsTHnu7/2CehOJDh5J0PC3SbhbazBwFFXJlWfOCgbqRCHtbPYWePmPnle3F9BzW726R
	/x
X-Gm-Gg: AeBDiettt6PkCpgv1FGwlsILT8079/hp6ikhIAgWf+vmV8DnR3hy8es5S54DNfu+SX/
	QBD/222gPrL3EdKOD0Yu3anMX3g6wvWWQ4A9HMFAcZSxjxoexwnjVaHcPcYApbfk0QUWA7ulD6C
	awU6SwwZFystARMTo2xuPvFTTpe5uay907bd/lrD5e+RwqoOZpKG9eBn1r/STt6/490/yXnbVIh
	mmpC3UridP2OIOaFZ9VqorrChE84iuEC1mCZqSJquq82FD1Jso8lgaFLOThRSARbLUrM2JJYgCM
	71eOZnI342xQW7vIGjX9IS3/YUmgm0wnzs/e/bNqRXUa9LbHtU0/YelCTEyoEbgoNKUqTZPazHZ
	tN62LBuuX/EEIj/l+74nqpOoEpiu7auLvJy+FntYhLVEZPR1R3m2u/t0DlOeku/d3oTk=
X-Received: by 2002:a05:6000:2c02:b0:43d:75a2:44a1 with SMTP id ffacd0b85a97d-43d75a2463emr24016078f8f.47.1776327124806;
        Thu, 16 Apr 2026 01:12:04 -0700 (PDT)
X-Received: by 2002:a05:6000:2c02:b0:43d:75a2:44a1 with SMTP id ffacd0b85a97d-43d75a2463emr24016016f8f.47.1776327124289;
        Thu, 16 Apr 2026 01:12:04 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11794717f8f.21.2026.04.16.01.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 01:12:03 -0700 (PDT)
Message-ID: <72d1b0b7-c8df-463e-a2d9-bf5ff04ba33c@redhat.com>
Date: Thu, 16 Apr 2026 10:12:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net,v2 1/1] net: stmmac: Update default_an_inband before
 passing value to phylink_config
To: KhaiWenTan <khai.wen.tan@linux.intel.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, maxime.chevallier@bootlin.com,
 ovidiu.panait.rb@renesas.com, vladimir.oltean@nxp.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 yoong.siang.song@intel.com, hong.aun.looi@intel.com, khai.wen.tan@intel.com
References: <20260413020339.68426-1-khai.wen.tan@linux.intel.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260413020339.68426-1-khai.wen.tan@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zCl0TShKw3fTe7ZIEX7agM_DGTywRrboWvWsYIbU-fA_1776327125
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_011210_616962_058444CF 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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

On 4/13/26 4:03 AM, KhaiWenTan wrote:
> get_interfaces() will update both the plat->phy_interfaces and
> mdio_bus_data->default_an_inband based on reading a SERDES register. As
> get_interfaces() will be called after default_an_inband had already been
> read, dwmac-intel regressed as a result with incorrect default_an_inband
> value in phylink_config.
> 
> Therefore, we moved the priv->plat->get_interfaces() to be executed first
> before assigning mdio_bus_data->default_an_inband to
> config->default_an_inband to ensure default_an_inband is in correct value.
> 
> Fixes: d3836052fe09 ("net: stmmac: intel: convert speed_mode_2500() to get_interfaces()")
> Signed-off-by: KhaiWenTan <khai.wen.tan@linux.intel.com>

Since Jakub sent the net-next PR and forwarded the trees, this patch
does not apply anymore. Please rebase and repost. You can retain
Russell's reviewed-by tag.

Thanks,

Paolo


