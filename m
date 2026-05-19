Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0166FCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 05:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=keJmUZjoyO/8+pbaUb2frhmihBbMJycqg7kaO6zEpL4=; b=DnV2xSXG18jk38c9s2imCfHKEy
	sNAv5hvTMSkBekxv9boTdB7ACoG1ph0A8vQoi/HPisyyDDd8o/3XcDlGOVUYIYe4kcZuU8MXihZtP
	/Vt3nwTxBCgStnF+ZNTPePZALV/2iiHp6cqJAJF73XzLXxP4v3+CIa+ECiF+9UCLJoZElgc3dsAOy
	HO3arYOBmb4JNcOW62K+IarvR1rSaINvQPtewA4taiYbaCXOJ0058KMQDwvBZOwGc5XmiluFJklAH
	19WoEFszx5CEl6Q2rVDr2REmgFdaFRXDpCG5uEFhPsnl9Pk4kqfOpqXhXM5tDPY6cXLdaiqXzloMz
	+uz4B6Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPCeg-000000009ro-0LYw;
	Tue, 19 May 2026 05:06:10 +0000
Received: from relay.yourmailgateway.de ([185.244.194.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPCec-000000009qk-25Hr;
	Tue, 19 May 2026 05:06:08 +0000
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4gKN0z3wSZz94yW;
	Tue, 19 May 2026 07:05:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1779167155;
	bh=FAiCEhzhtFbXPSs7rpt5n/p1t2w9wK7VlAtkJJg+KxY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K5koFewWjOv2W8vANcfdXTMyEtXNYiUyZ95mUequ8KmkWT+fgzDTFAXrIehrfI23b
	 tpJMxJXRrvVJ7+xn5vN2JaIrLvqj8VkZRjgBgbIuNdmizmU7cJ/7Hv4VMJquKzpXFA
	 qtIBP3sZqn/hWy6MGytcy8e0K5GDF/UCrxcuxvicfvI7VCEje9HMTNwevZZC+uy6xI
	 /F7xPUTaUjgplsY4uSpTCo7RXmzjbxzOAhnD6NDTAh8OIOpu5JYk7prM5kb/RO5gdL
	 tNDEgc4aRuVXxVkYJSAeOKxO1e/YIndepX0zm5SWrK/trrflexI7bgCDKojglYwwT0
	 PIqNktQ2AJ3Rg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4gKMzw5nYDz7v62;
	Tue, 19 May 2026 07:05:00 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gKMzw1QcXz8sbH;
	Tue, 19 May 2026 07:05:00 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 311F861884;
	Tue, 19 May 2026 07:04:59 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <ff4c4ba2-dc26-4b05-87c2-03cc70afdcc5@leemhuis.info>
Date: Tue, 19 May 2026 07:04:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Bluetooth: MT7922 fails to initialize after
 "Bluetooth: btmtk: validate WMT event SKB length before struct access"
To: Baley Eccles <baleycod@gmail.com>, linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, regressions@lists.linux.dev,
 stable@vger.kernel.org
References: <CADCSNFD0Ut-jJohTQFczjBgaVf=mBrc2rq4hJQncVZpF4bCoxw@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <CADCSNFD0Ut-jJohTQFczjBgaVf=mBrc2rq4hJQncVZpF4bCoxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <177916709967.849087.9352424421516320279@mxe9fb.netcup.net>
X-NC-CID: vq9DJS+14lEdcttPEpzaRJbmdMSDWX9ZqxtKYJX+AwMCHyCP/iQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_220607_108846_9FAFECA9 
X-CRM114-Status: GOOD (  14.77  )
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

On 5/19/26 06:31, Baley Eccles wrote:
> Subject: [REGRESSION] Bluetooth: MT7922 fails to initialize after
> "Bluetooth: btmtk: validate WMT event SKB length before struct access"
> 
> Hi all,
> 
> I have experienced and looked into a regression on a MediaTek MT7922
> adapter. Bluetooth works on v6.18.29, fails on v6.18.30, and reverting
> the bisected commit fixes it.

Thx for the report, there are quite a few similar ones already; the
problem is known and the fix (see the link below) should be heading to
mainline this week and from there go to various stable series.

Ciao, Thorsten

#regzbot dup:
https://lore.kernel.org/linux-bluetooth/770d36b07311bf88210c187923f243fb9f126f04.1777058551.git.pav@iki.fi/

> Hardware:
> MEDIATEK Corp. MT7922 802.11ax PCI Express Wireless Network Adapter [14c3:7922]
> Subsystem: AzureWave ASUS PCE-AXE59BT [1a3b:5300]
> 
> Good kernel:
> 6.18.29-p2-gentoo-dist
> Upstream base: v6.18.29
> 
> Bad kernel:
> 6.18.30-p1-gentoo-dist
> Upstream base: v6.18.30
> 
> Failure:
> bluetoothctl list prints nothing / no default controller is available.
> 
> Bad dmesg:
> Bluetooth: hci0: HW/SW Version: 0x008a008a, Build Time: 20260224103448
> Bluetooth: hci0: Failed to send wmt func ctrl (-22)
> Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command is
> advertised, but not supported.
> 
> Good dmesg:
> Bluetooth: hci0: HW/SW Version: 0x008a008a, Build Time: 20260224103448
> Bluetooth: hci0: Device setup in 129909 usecs
> Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command is
> advertised, but not supported.
> Bluetooth: hci0: AOSP extensions version v1.00
> Bluetooth: hci0: AOSP quality report is supported
> Bluetooth: MGMT ver 1.23
> 
> Firmware:
> /lib/firmware/mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
> /lib/firmware/mediatek/WIFI_MT7922_patch_mcu_1_1_hdr.bin
> /lib/firmware/mediatek/WIFI_RAM_CODE_MT7922_1.bin
> 
> Bisect result:
> 624fb79dadc1b65757986a9d0fdde5c0cf3fe179 is the first bad commit
> 
> Bluetooth: btmtk: validate WMT event SKB length before struct access
> 
> This is a stable backport of upstream commit:
> 634a4408c0615c523cf7531790f4f14a422b9206
> 
> Reverting 624fb79dadc1b65757986a9d0fdde5c0cf3fe179 on top of v6.18.30
> fixes the issue and Bluetooth works again.
> 
> Please let me know if there is any additional logging or testing I can provide.
> 
> #regzbot introduced: 624fb79dadc1b65757986a9d0fdde5c0cf3fe179
> 
> Cheers,
> Baley


