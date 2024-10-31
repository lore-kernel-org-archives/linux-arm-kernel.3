Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B93E68956
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 07:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lZlmnnd6VY4iWOEJN3fR2oAOuKekDnzf7D9Hkfh3i4s=; b=MHvSWhNbX7qmtg
	Kr6FOhBmdtARLqUuRQT3EpDiuGrA4BYkKdCeL72I881JJBQ9kZCmk+Ll1pI3V1CcVzWv5SrMuZOuX
	81jki/BVVQZIIWdXt3O86XX7V+cCefVbX0MsdB7BTT/RLblUnQ56GxhOb6zJQ7dQySX7VeE+2nYax
	dAtdYnnVT8Ifb04tlbYjDYIXq7HK6F0Vt5NEubLW/RVxau3JZmgqQC2Bo3f0gPsGe+Sdp3SvU2XFt
	hYRKT+h6EdqPL04U8W4yUC62iQOlCfrAoQjvOMY9Bs2fQ47vU1wbJpkMCnqarNpdgbGuoPi3L/jbG
	//6Bo5P6wFuceUqHkDpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6PaE-00000002o4D-3rkz;
	Thu, 31 Oct 2024 07:27:06 +0000
Received: from crocodile.elm.relay.mailchannels.net ([23.83.212.45])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6PKQ-00000002luJ-0tno
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 07:10:48 +0000
X-Sender-Id: hostingeremail|x-authuser|arinc.unal@arinc9.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 3A0C6C2C96
	for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 07:10:37 +0000 (UTC)
Received: from nl-srv-smtpout9.hostinger.io (trex-13.trex.outbound.svc.cluster.local [100.105.170.43])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 8C839C4348
	for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 07:10:36 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1730358636; a=rsa-sha256;
	cv=none;
	b=K0HoCPgP2E6MWufmBcS2g4KtQElr083tCC/WuWYZRsqZIpkYT1KXF4+4OaBGJUkILxUyCU
	coW930sFBDwG8EN7athT2mKjc0isr8NSzoOn5D1m4oJkodjxIdSere2iux3J9//8bBon+/
	XD8qgvpVeykMRuDxy835Q16Sypm5xe2CD21e1fppZer/IW0pCyyt7WoXgQZEGtvW0GvuFS
	AOmjKyKrAh3BBqjO6b/4F7V7kug88TZ1ciT+N7tMChwnsCxrpcmxS/k7ieCVbv9OcWkQVV
	Q2RaW1zKZajBCmtj+e0XdO0bZgUIf79mbfkVgELe2mpalsk73tJo5qmHfGIKfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1730358636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=lZlmnnd6VY4iWOEJN3fR2oAOuKekDnzf7D9Hkfh3i4s=;
	b=CIoT4cmKjQsL5aJML9ITBs8E9LUbrFJSCH1ArvTQjxNRVyyHiIdI3h16IWy/F86Q2diyJE
	/wlQukNCejG3miT7ndVm9Rd/yYk/lfr6gwSQjiKSXPlRZkjc41STkhb0+mwgC6Sn0awWqU
	2LUxDbL2FMune+letWm5yEiT4wo9Rpj4Nl5EasqjGvcF9B1r/QKxfCwLzffJG6RpTEuAIX
	8oKt85sRP28IuV0dKAwJlsLgWC0cdvGij7Hc0WT0u5zM1VPG6wlpqx+Q9blvEXKmeFTf43
	MSyytH50ZhWlI3jQFNgzCTeUFgO/8A2s3D6CoxyJaXMSoiNUFy2wzUiZ0vQM9A==
ARC-Authentication-Results: i=1;
	rspamd-65cf4487d9-l85mx;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=arinc.unal@arinc9.com
X-Sender-Id: hostingeremail|x-authuser|arinc.unal@arinc9.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|arinc.unal@arinc9.com
X-MailChannels-Auth-Id: hostingeremail
X-Rock-Oafish: 0e840eab7dce9e1a_1730358637033_3367507130
X-MC-Loop-Signature: 1730358637032:2336944591
X-MC-Ingress-Time: 1730358637032
Received: from nl-srv-smtpout9.hostinger.io (nl-srv-smtpout9.hostinger.io
 [45.87.82.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.105.170.43 (trex/7.0.2);
	Thu, 31 Oct 2024 07:10:37 +0000
Message-ID: <a66528bd-37cb-46b2-90e5-37b10dfa9c78@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com;
	s=hostingermail-a; t=1730358634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lZlmnnd6VY4iWOEJN3fR2oAOuKekDnzf7D9Hkfh3i4s=;
	b=NRoo+kQ7pFbuPT6z5Cb6S84fbfJOOj5qAwFha52OFrJ0JExn7Ku/fTJnZajCq05w9LZP8e
	ZLYX0yKjmNbdDVHUMzA3vuRhsyB4Bl3ghIiolEItiM2nEx7ufCGnuGKkBOtrpSDtV0jJhS
	gJMAYQwb/16d3o2JYOnr5GDD529wd194SZBEXJNL/baBcZr10Wj1AsSaSJCRjbtySuiwCq
	iNOW34RKx+CkvPABdc6xFqXjI0sGc7kVAsy+3/VZOWW0IgUv/SDgT9BnhDFLYyN+NHyCGq
	7nl8LYDpOdFTBZoyU8jjJdDPMvdxqD0UOcYlCOPU3k1yuvsnXZ/6RjZgj1OOzA==
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: dsa: mt7530: Add TBF qdisc offload support
To: Lorenzo Bianconi <lorenzo@kernel.org>,
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241030-mt7530-tc-offload-v1-1-f7eeffaf3d9e@kernel.org>
Content-Language: en-GB
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20241030-mt7530-tc-offload-v1-1-f7eeffaf3d9e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Date: Thu, 31 Oct 2024 07:10:32 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=OKJ13jaB c=1 sm=1 tr=0 ts=67232d6a a=aGj/nXfi4qz2iMxz7h0kJQ==:117 a=aGj/nXfi4qz2iMxz7h0kJQ==:17 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=9B2793jWSBC_Fij88T4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfJ/GJC6qZKiYCkaiLF9+RV7BmCKM+DnqGuxt3BbelWGFn+juo5V5ssnDAaI+gp5DQHingWLNsB0HgKjnqdqhTgjkwp4qIyLGG/wdcqJ4BQRi7RjE1ymL lOcInGjafAnmffS0+G4chgWYc66e1U4H7UzEzNUKqECwBBY3NMfJ1ChNB5ycVPZnlpswfylUf5lRSNLso1zbtFSQHJZXc1Z0ZlKpAn0HCoWUwWOz70ogd2WD wOr6NVCO23sJdZ9TB4CusHjf+LtX/l3OK6WrDLJCpwD97SlAJ3LssZTVGAH+Uc99M+X5Z43IrCh6YTXESUO+/rjOv1RF/iAQCKRmdELy4h9AYTI5C1j+PhaT Hzo9oY7tEWiDKave1F8Z6sVLxT0m2EcLLIbH/5QGdRLOmqf1RUQ0kMahrobTAsqrgQjrhQhCCMIesvNsriv/ngI3FTy/YVAYfgE1x2lxDDgeIMfMbB1nl19Y WLa5MyppkVUF9KwmytVWGtbe5Jm7UjJvpRKTj+EagFqHR3fLULdGSR4p8MVAqc/bU3JoF/i23WlSynRTDb6ivQYgDBzXPXMPSqEW44iyxS+qcxSnhFVlCZiU B/LfTiwwYS4CQVvPKuC9EIX5Ax1t9Vhkdcd83JXnUi07BbOy8S2WW6+m87wZWll6D83OvkG66K0MfFLg4zsk5Gqb2FnDDLJIGNJVwVIfRUhZoaT42TdpzlgC FtXE4thUHvE=
X-AuthUser: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_001046_570510_590325F4 
X-CRM114-Status: UNSURE (   5.66  )
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

On 30/10/2024 22:29, Lorenzo Bianconi wrote:
> Introduce port_setup_tc callback in mt7530 dsa driver in order to enable
> dsa ports rate shaping via hw Token Bucket Filter (TBF) for hw switched
> traffic. Enable hw TBF just for EN7581 SoC for the moment.

Is this because you didn't test it on the other models? Let me know if
that's the case and I'll test it.

Arınç

