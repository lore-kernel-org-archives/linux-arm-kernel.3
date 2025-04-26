Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3541FC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 13:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Olfu3brFWDS51/0/ryjEK1Ts5wIML5vHhBtSBjeGn1M=; b=K1f1JzVxWYeg83PJeTO8kOMbIp
	/Yt+rI2lBLDYIzxPKHjTBqcJjnACdFT19pc6xvyAVaSOGEziCFI30T4/HPHbkh55nS0Hziu5O5qi6
	UD4hSEAJjSTjd3KhEzHjFgcYSmKjoKMgEjkwoH2Mi3IUxpHlXme/oL9RSaRbtLFkr7flSYXj/bS5V
	YxfI06LnZ1B0H1mZMVCI+k+uLLSIWvF0U+rOWBXXO/uwvL2QVqF0E2TTGSon5EiEn+sfAMT8jIp7B
	TAYI3hfY+rBWb/f6em986EQA/Ljal4QjD7GzPaJlF1C324g+mRp7amxMioXZFxF9Lju65xOh2xjEZ
	eK+pl5qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8fxP-000000027T1-2xL4;
	Sat, 26 Apr 2025 13:52:39 +0000
Received: from smtp-42af.mail.infomaniak.ch ([2001:1600:7:10::42af])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8eov-000000020pX-1DlO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 12:39:51 +0000
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10:40ca:feff:fe05:1])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Zl8Rg0h1yzYwb;
	Sat, 26 Apr 2025 14:39:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brownhat.org;
	s=20191113; t=1745671182;
	bh=Olfu3brFWDS51/0/ryjEK1Ts5wIML5vHhBtSBjeGn1M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ifFJmfEc1FOCIgKpJS3CmV/oFxLwNtEOuu3N1PglAJNIrXe4ppOjcGxlb++vl9DyK
	 JbAw7/MiqXxys6UudQhbbmx9ZSnasJ8LrtZ+CBS0ghmiydCm9NiL/Ec2r0vl+5PFha
	 SDEvQRap2v9uEdv6aOxSN5DtOwovM7031rbBrtN8=
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4Zl8Rc499kzDBB;
	Sat, 26 Apr 2025 14:39:40 +0200 (CEST)
Message-ID: <559370be-a366-4754-8baf-3a4b332be025@brownhat.org>
Date: Sat, 26 Apr 2025 14:39:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] net: ethernet: sis900: Use pure PCI devres API
To: Philipp Stanner <phasta@kernel.org>, Sunil Goutham
 <sgoutham@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep
 <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>,
 Bharat Bhushan <bbhushan2@marvell.com>,
 Taras Chornyi <taras.chornyi@plvision.eu>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Helge Deller <deller@gmx.de>,
 Simon Horman <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Shannon Nelson <shannon.nelson@amd.com>,
 Sabrina Dubroca <sd@queasysnail.net>
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
References: <20250425085740.65304-2-phasta@kernel.org>
 <20250425085740.65304-7-phasta@kernel.org>
Content-Language: en-US
From: Daniele Venzano <venza@brownhat.org>
In-Reply-To: <20250425085740.65304-7-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_053949_756873_7DF0F376 
X-CRM114-Status: GOOD (  16.29  )
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

On 25/04/2025 10:57, Philipp Stanner wrote:
> The currently used function pci_request_regions() is one of the
> problematic "hybrid devres" PCI functions, which are sometimes managed
> through devres, and sometimes not (depending on whether
> pci_enable_device() or pcim_enable_device() has been called before).
>
> The PCI subsystem wants to remove this behavior and, therefore, needs to
> port all users to functions that don't have this problem.
>
> Replace pci_request_regions() with pcim_request_all_regions().
>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Acked-by: Daniele Venzano <venza@brownhat.org>
> ---
>   drivers/net/ethernet/sis/sis900.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/sis/sis900.c b/drivers/net/ethernet/sis/sis900.c
> index 332cbd725900..df869f82cae8 100644
> --- a/drivers/net/ethernet/sis/sis900.c
> +++ b/drivers/net/ethernet/sis/sis900.c
> @@ -468,7 +468,7 @@ static int sis900_probe(struct pci_dev *pci_dev,
>   	SET_NETDEV_DEV(net_dev, &pci_dev->dev);
>   
>   	/* We do a request_region() to register /proc/ioports info. */
> -	ret = pci_request_regions(pci_dev, "sis900");
> +	ret = pcim_request_all_regions(pci_dev, "sis900");
>   	if (ret)
>   		goto err_out;
>   

