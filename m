Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B237D26D97
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 10:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IU7eGqiorRIruC5ew3OFbkz175e3IThdmrq7piMM/H0=; b=0zSx/+9560CKs9IVS+uIaNh6aX
	J7ozDkyCBkKrXLQXqttaikS1NTLEdCBng1fLdKlIA1Ho3iC4a2jyF7RMofALip4KLoljpZtfBorSJ
	WDTmxE2VbttKYV6of4Sv04Vt0+44KCqsbEKdYq9eGMsM4Nc1/UAA3C9vrVSD/ZUPa/pkdtOd3AcDt
	ub3F5qbn0DjDQbBPNsYTuRlOe2oFWX/K61iLtG/19uty2E1ruAGnUtJNk4kVSk0tipcK0wTaZbE1u
	bvNpdasZIRhdnyqCTJgCOtGzgrJlDYGZj/IhRbx7R6l2cAOpIY8sl1itLnL2ZGsa/1dQc/YFNFLhC
	uXHM/PNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEoz-000000057kq-1uX8;
	Mon, 12 Jan 2026 10:06:49 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEov-000000057kB-15DV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 10:06:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1768212401; bh=qVZcFnrNthbxIcajKAMeoZAZ6XhV/2cB/xhUjnVSQlA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tdlqqs2+zjhDKdcI8o60OZTvU1k68yw80JyRbVZNjHpY4+3EqsmvQ2B/VrLmVkXZv
	 2LnOTgo7/tcmmm4rbIO0ZKy8o8fWNyga83PndfeAPslGMDB6Y8SYUb0brETTW2Xi+C
	 11jMik0w4Qzmov8AapwRhp7jevx6Hvu/+qR67VN6IotVjDcoK0fqf14EuHKBn/cSmD
	 avI26sxzf4+PGv7BT8G4XUyp2M4EcsCGh4iHqBrhDK2+qICjRY0mX5LNUTVsGKvGYz
	 ovrG+Vq9l0PFvckdkTgwnagUzX6zQ/00asqIxbY/EfRJNObCvaEgyKYX6zb2C7Mt2X
	 WeuKBOp8FMzsg==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 4DD023EBBAC;
	Mon, 12 Jan 2026 10:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1768212401; bh=qVZcFnrNthbxIcajKAMeoZAZ6XhV/2cB/xhUjnVSQlA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tdlqqs2+zjhDKdcI8o60OZTvU1k68yw80JyRbVZNjHpY4+3EqsmvQ2B/VrLmVkXZv
	 2LnOTgo7/tcmmm4rbIO0ZKy8o8fWNyga83PndfeAPslGMDB6Y8SYUb0brETTW2Xi+C
	 11jMik0w4Qzmov8AapwRhp7jevx6Hvu/+qR67VN6IotVjDcoK0fqf14EuHKBn/cSmD
	 avI26sxzf4+PGv7BT8G4XUyp2M4EcsCGh4iHqBrhDK2+qICjRY0mX5LNUTVsGKvGYz
	 ovrG+Vq9l0PFvckdkTgwnagUzX6zQ/00asqIxbY/EfRJNObCvaEgyKYX6zb2C7Mt2X
	 WeuKBOp8FMzsg==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id A1C1C3EBBA0;
	Mon, 12 Jan 2026 10:06:40 +0000 (UTC)
Message-ID: <7dbce9cc-e043-43ae-8d3a-a20b8ad2a5fb@mleia.com>
Date: Mon, 12 Jan 2026 12:06:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: serial: 8250: Explicitly make LPC32xx
 UARTs compatible with 16550A
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260110024647.3389345-1-vz@mleia.com>
 <20260110024647.3389345-2-vz@mleia.com>
 <20260112-hopeful-spiffy-antelope-334765@quoll>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20260112-hopeful-spiffy-antelope-334765@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260112_100641_338297_E5F18793 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message. 
/bin/ln: failed to access 'reaver_cache/texts/20260112_100641_338297_E5F18793': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_100641_338297_E5F18793 
X-CRM114-Status: GOOD (  11.23  )
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

On 1/12/26 11:25, Krzysztof Kozlowski wrote:
> On Sat, Jan 10, 2026 at 04:46:46AM +0200, Vladimir Zapolskiy wrote:
>> NXP LPC32xx SoC has 4 16550A compatible UARTs with 64 byte TX and RX FIFO
>> sizes, and the platform UART hardware is well supported as a standard
>> 16550A UART.
> 
> Driver uses dedicated driver/match data, so some context here about
> compatibility would be useful.
> 

As the commit message says, 4 LPC32xx UARTs are NS16550A compatible, this
is the context of the change.

Any bootloader or operating system which does not locate "nxp,lpc3220-uart"
device driver shall use the general "ns16550" compatible device driver.

-- 
Best wishes,
Vladimir

