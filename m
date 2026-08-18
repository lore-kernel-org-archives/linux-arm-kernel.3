Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A13C5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 10:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwMVdHrvk7kTvruvTnXxLTgiBwjN9S2XLihzM95fzKA=; b=4UYfhMEXCH84cdmgregLl35rGc
	ZYO5PtAhgZPO6eWT5eLIwF571+wKFR+XSPh1wGNcuA+9xwdNqNe81sMA60o01UbRFafKtWdCEPeyk
	GQsqK/IvAKzYTT2ZW+704CcHE6UDgMZEEt5tAZUFfurOCk+9DiF7SYhnkYAGTmJu/R1YHuFvjssL6
	C10r4H7J7iY0QONcJURujB7h5F22IvmlLwyANnjxpwOydy3ifyU5A/UERJY9xJl1wJriOK+3mwofd
	DqyLsVHw+B8DXe+EVtnJWG383IKmFJWVxx0Lm/711wLfnInVSvCeAeoCTqblZJw84dOgIEUuEnHQ5
	eG3i9CfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwGtx-00000007hk9-1EnS;
	Tue, 18 Aug 2026 10:18:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwGtw-00000007hk2-2luM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 10:18:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B7B941A5F;
	Tue, 18 Aug 2026 10:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECAF21F000E9;
	Tue, 18 Aug 2026 10:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787048316;
	bh=jwMVdHrvk7kTvruvTnXxLTgiBwjN9S2XLihzM95fzKA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KV386nPWRRE08204XuIMIhxBIzXbvitBA2n8kC55lLchcC5H77jxWoNLp+CcZpgn3
	 2LTsZDmsFve1IDOETXFC31pTaUC6MfVOaYE6NuvXCjh/RzCry0bp9mbFs2YZLEwSi6
	 oDATN7X738a1cU1OBcGN4JFa2c6YxmKRqdxEVKExxYfuq7Doi24xvNkSfVcJwA4zmV
	 a35f81ArZpZD7kevePUAlhXuTZMr71l2xfygQfsQub6A0mylXm3vaZqOT0UlpqPG07
	 FpGyINUmTYl6VeIi1AW37N4uDPvYztCq/elHtEVXuU9F7lFFLOmQMxTQAQ+7ebylFv
	 jC9UKQtXv+BQw==
Message-ID: <63b6eb28-dc1b-4e51-89c0-1591ff216da5@kernel.org>
Date: Tue, 18 Aug 2026 12:18:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: hci_bcm4377: Ignore reserved PHY in ext adv
 reports on BCM4378
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260818-fix-bcm4378-ext-adv-v1-1-81a143eac194@kernel.org>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260818-fix-bcm4378-ext-adv-v1-1-81a143eac194@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 18.08.26 11:49, Lorenzo Stoakes (ARM) wrote:
> Commit ed2a2ef16a6b ("Bluetooth: Add quirk to ignore reserved PHY bits in
> LE Extended Adv Report") added a quirk to handle creative use of the
> reserved bits in the PHY fields for 4388 controllers in Apple silicon.
> 
> I observed the same issue with the BCM4378 Bluetooth controller (14e4:5f69,
> rev 05) on an Apple MacBook Pro (13-inch, M2, 2022):
> 
>> HCI Event: LE Meta Event (0x3e) plen 51
>        LE Extended Advertising Report (0x0d)
>          Num reports: 1
>          Entry 0
>            Event type: 0x2513
>              Props: 0x0013
>                Connectable
>                Scannable
>                Use legacy advertising PDUs
>              Data status: Complete
>              Reserved (0x2500)
>            Legacy PDU Type: Reserved (0x2513)
>            Address type: Random (0x01)
>            Address: EA:C1:82:F0:24:C6 (Static)
>            Primary PHY: Reserved
>            Secondary PHY: No packets
>            SID: no ADI field (0xff)
>            TX power: 127 dBm
>            RSSI: -57 dBm (0xc7)
>            Periodic advertising interval: 0.00 msec (0x0000)
>            Direct address type: Public (0x00)
>            Direct address: 00:00:00:00:00:00 (OUI 00-00-00)
>            Data length: 25
> 
> This results in the firmware rejecting connection attempts with
> "Unsupported Feature or Parameter Value" (0x11).
> 
> Fix the issue by using the same quirk for BCM4378 devices too.
> 
> I tested this locally and confirmed that the issue is resolved.
> 
> This was observed when attempting to connect a Kinesis Advantage 360
> keyboard to the MacBook.
> 
> Assisted-by: Claude:claude-fable-5
> Fixes: 2e7ed5f5e69b ("Bluetooth: hci_sync: Use advertised PHYs on hci_le_ext_create_conn_sync")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>

Kinda surprised no one ran into this so far tbh.


Best,


Sven



