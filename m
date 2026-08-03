Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB4FC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAUQBZyAaFWQaU9EvmWG+JdY087fdH0lihYbWfP3K5Y=; b=y30JcHlvaDMoRk0VZHkcrICA1s
	6jRSSDgL5H2bKPuzMZvnZ0aPFfT4T659x61/L2408EgagUEoeP9zPP46rYqdZhCOlsrATmXlHq4di
	mdlDPPld+ONbdgJOA/ZycaogxeVDzE68LATPFH21hKyCDJW/dVR3g4LXzxE3sNtgIijwcldKKvDpm
	n65zQDWdwmJhbBHS4EipaTMBl8ieYrhhIvDeDUhGVyjiijApL1lYBsR4M8UxQDX92RuSdkOISG63x
	30hotboIYMoWu+SBnjUicu0SiHROAzxubAJ9j+OS9iYd7cSn4viBNhKP7dGTIrRBXWE8TgC8dvGCt
	uENqF55A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt7n-0000000HGyG-3nqO;
	Mon, 03 Aug 2026 13:54:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt7m-0000000HGy0-3MrI;
	Mon, 03 Aug 2026 13:54:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dAUQBZyAaFWQaU9EvmWG+JdY087fdH0lihYbWfP3K5Y=; b=Wo5GyQXOtgeqImwRhmdrKAZ6hb
	vnmBBWI7rOxDJQ38t1YxVFC43ZNak5dFc6RGzrZqQeqdafxt3uQ78KjsUvr100JMcLtlL2+eOhe4H
	NUd/qEKc3oSVf2X0CoWX0d+ZQDBG6F1g9IhKOOYXoouyDlT9zA/OlSf2hudjBU5DquZf211RROn1b
	LcDDROcfjlSU8X4BXVaYu+c4eJCa+r4YL2joPHA4BrCnwQIRehZQufAuGp4owtpOBIqpeY4zQQaQb
	sOJx9/CIhP6oD5L3Hv4BaT8fRn+oVzL0Fnk14wDneiqN7Mfw8tSwQXQ7q+B5it+H/gqjUXkgHT5eD
	q8y1tdhA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wqt7j-0000000914V-1lXY;
	Mon, 03 Aug 2026 13:54:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48E381476;
	Mon,  3 Aug 2026 06:54:29 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FA373F66F;
	Mon,  3 Aug 2026 06:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785765273; bh=uMR2wzjAHumjCFpq8CHfoC4l0oLwZhmUUYYdpoGfwLw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=truUKiVEzJC/b46H16TtYHBYwRnreu5zys6pASHs9n3MH7XCBXxmN1sd+hSZFel2k
	 mKrQ4aXd2emd5Sqsz0/Tfsp2jyFoVpuP+Q25sbNx/jRYTsJPVXhtA7YOC8+YffAvW/
	 o31zZWeJCMTKa1R/KhhlFbgtjsBrAMHLAGMIiQmI=
Message-ID: <ae236186-e984-4fa0-ac70-f321068576f1@arm.com>
Date: Mon, 3 Aug 2026 15:54:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/21] net: phy: add X-Powers AC200/AC300 EPHY support
To: Andrew Lunn <andrew@lunn.ch>, James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Saravana Kannan <saravanak@kernel.org>,
 Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <d2a1f26b-a97f-4cd9-993c-5dbca530abdc@lunn.ch>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <d2a1f26b-a97f-4cd9-993c-5dbca530abdc@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_145435_722769_14A5B8C6 
X-CRM114-Status: UNSURE (   9.38  )
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

Hi Andrew,

On 8/3/26 15:52, Andrew Lunn wrote:
> On Sun, Aug 02, 2026 at 11:14:10PM -0600, James Hilliard wrote:
>> The Allwinner H616/H618 secondary EMAC is commonly connected to a Fast
>> Ethernet PHY in an X-Powers AC200 or AC300 companion package.
> 
> Is there an open data sheet for these devices?

Find the datasheets at the end of this Wiki page:
https://linux-sunxi.org/AC200

Cheers,
Andre


