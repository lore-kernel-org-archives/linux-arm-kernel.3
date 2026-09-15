Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DDEC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 17:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TpLpxzKfFRAl/RHqoLxPPlY8U8TXJO7qkDVKFfcLlVo=; b=gviPJ6COSTiZFIT5j9Tgv4YtLm
	3nxONWtz2DejP8XAfo9USy9MyEizqsMnBbSHzocA9zwXP+yoWEAwRqrGQnBpRgcVFK1VHruYX0ut4
	0GiO8xaR6RdvTVBpe+GGuTmseRLk+O6WzUsyXn4ZRjXC8RBEGHQCJG85qnv5hZeUtz9+l1Wt/Ifk+
	SV5KIAClRqPONRLU9LxwWXMcEdjv44i/rbqZJdsN3BRVd9Ur5H2yjwUBRBGvHQXVcTZNgJGp/k11z
	CGIIzECIcBwCkEsLLyYQktzBUvwdV+6seB4qgB0+1GmBMqVXdmqVZfsu18Ljm7eS7+l1uQmIoPWnf
	iW30KLHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XI6-00000007eLd-1dFx;
	Tue, 15 Sep 2026 17:49:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XI5-00000007eLE-0el7;
	Tue, 15 Sep 2026 17:49:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TpLpxzKfFRAl/RHqoLxPPlY8U8TXJO7qkDVKFfcLlVo=; b=DYAPAk1dSSEOSbtkBPqQADP17a
	ObsD1v5qvLQdqbc+dPj3uZ4DFjDn42wjlTzrmp9vFsemtR3XsTMFI2lFPXz3lQIFtGScER3iYOi9O
	UP8Fp+2j4rZcmd62RrYgH3/NDTmksdFPNnfZo35ulkuwEp6+VTynsEvXvEO2cF3/wqUOoV/wZPXpL
	vlJmZLMtzPUK0Z9U7B7xT4rjfahfDzm4upezWB7jSCez7Vb9DdZeQ5EMdBKmoEq4wTg3cYYyzvWjN
	9S9jCuGbut5DaJ/LK9VBAtaENug6wKyV68d1ksduXj2+5JFsmcL7OD4sxLkReJrX+hx2c2ZxNdeRn
	LxV7p9vQ==;
Received: from mail.cjdns.fr ([5.135.140.105])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6XI2-000000076cb-1ERj;
	Tue, 15 Sep 2026 17:49:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77EDE48F729;
	Tue, 15 Sep 2026 19:49:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789494591; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=TpLpxzKfFRAl/RHqoLxPPlY8U8TXJO7qkDVKFfcLlVo=;
	b=SwFstTK8VAtbxjApfPpsr5Xgb/VFsfI15YBZird1oXSvq0qFZbTVE6CNVBQ0TXB+lAABvG
	PmmDBB9HLjHIanTcGNGwp/HEBClNoF4QNenRNr9AgX6uu6FmcMnZCZ0rfhvSQfA60vn+IZ
	NdUslVNDLBPunXavLiiuLDa/gVGSMBRIm7uTFL1QWpLjhparjG4e1etfwkTCOE2WVZWm2z
	JyKfwMOATgpjLDktIo9wdo26Q58ToLRUnLEuUBTOL2TjXC8bKFL8VQ050kGBRBSNaPLPcH
	w/SjDKmjg4eDcgVjTChHCeZTb7Q2FxnE2DXh/2pXKXQXz/HwLkZIW1Shw4tlGg==
Message-ID: <4529730d-0089-408f-804c-57d7c4c68564@cjdns.fr>
Date: Tue, 15 Sep 2026 19:49:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH net-next 7/7] net: dsa: mediatek: support EN751221 switch
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 chester.a.unal@arinc9.com, daniel@makrotopia.org, linux@armlinux.org.uk,
 arinc.unal@arinc9.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 sean.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, naseefkm@gmail.com, b.larsson@gmx.com
References: <20260909140346.2861572-1-cjd@cjdns.fr>
 <20260909140346.2861572-8-cjd@cjdns.fr> <20260911170850.05cfb134@kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260911170850.05cfb134@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_184954_501997_4713F308 
X-CRM114-Status: UNSURE (   9.48  )
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


On 12/09/2026 02:08, Jakub Kicinski wrote:
> On Wed,  9 Sep 2026 14:03:46 +0000 Caleb James DeLisle wrote:
>> The EcoNet EN751221 has either one, or two, onboard MT7530 switches.
>> Every implementation of this SoC has one switch on die with the CPU,
>> but some chips - notably those with a "G" in the name, have a second
>> MT7530 as an MCM module.
>>
>> The on-die MT7530 has 4 FE ports and 1 GE port. The MCM switch has all
>> gigabit ports.
>>
>> The MCM switch connects to the SoC switch via a TRGMII link from port
>> 5 on the SoC switch to port 6 on the MCM switch. This link undergoes
>> calibration on startup.
>>
>> All known devices with the MCM present do not make any use of the ports
>> on the on-die switch, it is put into "passthrough" mode in which all
>> traffic is shuttled between port 6 and port 5 without alteration of the
>> DSA tags.
>>
>> Add support for both the on-die and the MCM switch, and calibration of
>> the TRGMII link between them.
> ../drivers/net/dsa/mt7530.c: In function ‘en751221_trgmii_pair_setup’:
> ../drivers/net/dsa/mt7530.c:593:12: warning: variable ‘default_taps_ondie’ set but not used [-Wunused-but-set-variable=]
>    593 |         u8 default_taps_ondie[NUM_TRGMII_CTRL];
>        |            ^~~~~~~~~~~~~~~~~~


Whoops, got it in v2, thank you.


Caleb


