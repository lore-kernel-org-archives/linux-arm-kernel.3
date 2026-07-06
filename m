Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2377C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 19:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXRri83uJyGVuyIIs4hhTGA2LTQ37aJDRWOZRpmtips=; b=Qag+GmfHI9ffL/Dg3vSLm/54pJ
	KHKHxrvVWHQE5YZPUgNXEEigxHp2HJ3l6yUlA23I6HaFqo7LFufcpA5Px+e9yh8K5NPDgBEjE5Rs5
	nQC/t5lzMZF16AB+QbOc8dcn8lSi39ixXgAJub902m+wpWsR3qMeFsPs4WvgCUSQIV2avz3Zks4GD
	iAxI3j4ukjrdrxKLVNYGLagcTu77d7TcwYOQHycKoNy2I3eo4GLkAB1NMpdZnDA2GyAI4Vhf2uRKw
	6oyP7RhDWg+XsIT76/L0hYp+pZpOCspmSg3VmtNe3AX9PxmzO8EZuCDnAmLSkHJbvY9o1pJbY+cGs
	Y+rvnBcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpA9-0000000DTLK-0TgE;
	Mon, 06 Jul 2026 19:39:29 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpA4-0000000DTKj-3bvw;
	Mon, 06 Jul 2026 19:39:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783366758; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ExTFqw0g/qo+AKeQvSj25qu5FUKvOCxCIKcDJcyksM9tbMLtj66cRqwzv4nJBNeOxme/ZPwrKYRexOq9jai4rLgm0eY2P80bFV/qE2xQaQbw5eu46KSNGyJrdhn5ZK58BmO+/oGVHxnE4aAgx9wgrwt1SF0BSEIjvaRA8wUELJo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783366758; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rXRri83uJyGVuyIIs4hhTGA2LTQ37aJDRWOZRpmtips=; 
	b=lXKQA88O5EhTqrngAghUQcTBIqfMx79bf80HG1T+ubW+9yK1t7UIQr/8iWdNDk8NlR4VwrSZo8OOKVtHkAp9bgiVEccsiUE+xJMED6KUOZNCQK/S7UFwD/cJsr5GJSYrgBYeDLlmeZq+GYam0KMfb0PQJTNpmODEAiltG+JirvM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783366757;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=rXRri83uJyGVuyIIs4hhTGA2LTQ37aJDRWOZRpmtips=;
	b=qBfSqIaHM2ITmOE/zpSogyrqta5lxKpQQ6d6bwhbIFmbn6HDQ6v53PYipF5xn2yh
	S/tCN6/O7hwMwytgKZGUF6RAm7H4Q4Cz6H6DntL9QTux2LxIbCsVv35i01BveDcXo8X
	puUbH6kFmXAPaDMoCDP3+oYIKH40XCJ8GuUeMpohplNNHu+BDKHZ/K7akmmmTetmSTs
	lZdwIOpcoJgZ6/9Wu486jbxrJsJh+wMcJ4Dvy8aT9a/pPNyj7i9B1s3QBCMLWgdzP8d
	KEeWbs7BYkga9b2C9bfUMBUXSxLEhbmBWhqQWmvePemIaHYJ9/loHZliL7Lc+Q7P6mE
	FQp1er5ZFw==
Received: by mx.zohomail.com with SMTPS id 1783366755544838.5398676240889;
	Mon, 6 Jul 2026 12:39:15 -0700 (PDT)
Date: Tue, 07 Jul 2026 03:39:01 +0800
From: Rong Zhang <i@rong.moe>
To: Rafael Passos <rafael@rcpassos.me>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
 =?UTF-8?B?Q2hyaXMgTHUgKOmZuOeomuazkyk=?= <Chris.Lu@mediatek.com>,
 =?UTF-8?B?V2lsbC1DWSBMZWUgKOadjuaUv+epjik=?= <Will-CY.Lee@mediatek.com>,
 =?UTF-8?B?U1MgV3UgKOW3q+aGsuasoyk=?= <ss.wu@mediatek.com>,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_Bluetooth=3A_Properly_disable_rem?=
 =?US-ASCII?Q?ote_wakeup_for_MT7922/MT7925_on_Ryzen_platform?=
User-Agent: Thunderbird for Android
In-Reply-To: <DJRP3YO7Y0WK.20KNRZIMX1CYK@rcpassos.me>
References: <20260701-btmtk-ryzen-remote-wakeup-v2-1-767ac7907472@rong.moe> <DJRKO72HWZOI.QJYJUAC45QOJ@rcpassos.me> <79D5F3E6-8F40-4422-BB2D-16691E377394@rong.moe> <DJRP3YO7Y0WK.20KNRZIMX1CYK@rcpassos.me>
Message-ID: <F16A2A9A-A43F-45FE-8CC0-44A129360D47@rong.moe>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_123924_981254_56488C71 
X-CRM114-Status: GOOD (  14.55  )
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

Hi Rafael,

=E4=BA=8E 2026=E5=B9=B47=E6=9C=887=E6=97=A5 GMT+08:00 02:21:57=EF=BC=8CRaf=
ael Passos <rafael@rcpassos=2Eme> =E5=86=99=E9=81=93=EF=BC=9A
>On Mon Jul 6, 2026 at 12:08 PM -03, Rong Zhang wrote:
>> Hi Rafael,=20
>>
>> =E4=BA=8E 2026=E5=B9=B47=E6=9C=886=E6=97=A5 GMT+08:00 22:53:17=EF=BC=8C=
Rafael Passos <rafael@rcpassos=2Eme> =E5=86=99=E9=81=93=EF=BC=9A
>>>Tested-by: Rafael Passos <rafael@rcpassos=2Eme>
>>
>> Thanks a lot for your testing!
>>
>> Your issue sounds related to the remote wakeup issue I am addressing=2E=
 After triggering the remote wakeup bug, rebooting the platform without a p=
ower cycle [1] always causes a failure in USB enumeration before the driver=
 path=2E
>
>In my case, just the power cycle was not sufficient=2E I had to also
>change settings in BIOS [1], and only then it came back=2E
>Even after reverting all settings to the same state as before=2E
>
>I was hoping to fix this in Kernel, but I don't see a way forward=2E
>If you have any other ideas or patches to test, send them my way!
>I will gladly help=2E
>
>[1] I turned off sr-iov, resize-bar & disabled "Bluetooth On/Off"=2E
>In a previous attempt, fast-boot and TPM were also disabled=2E

Hmm, interesting=2E My speculation is that it doesn't matter which options=
 are changed, but some changed options cause the BIOS to reinitialize somet=
hing=2E Does resetting the BIOS settings to default help?

Could you provide more details about your device's USB and PCI topology? D=
oes the NIC's USB connect to one of the USB root hubs of the SoC (i=2Ee=2E,=
 CPU) or the chipset?

And I guess your device runs into the issue without any precursor? Once bo=
ot, try running the script below to capture more clues into dmesg, and wait=
 for the issue to appear=2E

    #!/bin/sh

    ddcmd()
    {
        echo "$*" | sudo tee /proc/dynamic_debug/control;
    }

    ddcmd file drivers/usb/core/hub=2Ec +p
    ddcmd file drivers/usb/core/driver=2Ec +p
    ddcmd func handle_tx_event +p

I would do the below experiments if I had a buggy device like that=2E Some=
 extra hardware is required though=2E

Connect another NIC (w/ Bluetooth interface) to the same M=2E2 port after =
triggering the enumeration failure, and see if the enumeration failure pers=
ists=2E

Connect a passive M=2E2 (A+E key) to USB2=2E0 adapter card to the same M=
=2E2 port after triggering the enumeration failure, connect a USB2=2E0 devi=
ce to the adapter card, and see if the enumeration failure persists=2E

Connect the MTK NIC to a PCIe port using a passive PCIe to M=2E2 (A/E key)=
 adapter card, such a card usually routes the USB signal from the M=2E2 int=
erface to a 9-pin cable=2E Connect the 9-pin connector to the motherboard's=
 USB expansion port, and try triggering the enumeration failure=2E Now conn=
ect the 9-pin connector to a dedicated PCIe USB controller card, and see if=
 the enumeration failure persists=2E

All mentioned extra hardware is cheap and easy to get in China=2E Though I=
 guess it would be a completely different story in some other regions=2E=2E=
=2E Trying one of these experiments should be sufficient, so you can make y=
our decision based on hardware availability=2E

Thanks,
Rong

>
>Thanks,
>Rafael Passos

