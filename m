Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317D5D3B7ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 05:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LHR5uFaet0kiKDYegc7WV/wN51VwfGAIsXdSkMQiUJU=; b=UQw+CM/mep2dGAdacsuTOxqHOd
	nQcqpfQ+vZIvq31zCXLLxAMt0rTTnviA+Ab4zX7dYCh6KM8S8co36A/iBTZR+lvO6JRRyUDpIE9RK
	WyFsqQocmsK7bvzp/gE02tgSKiEHQ1vgu83Avh/Lwl+pM9VKupKUHEAJ2u3uPLOSPaYMCD8jvGXVS
	q3xhZbHxdgri2oJosY7ZqpgQq8eq0czbBtUB5x3UDpL4GUekUOVdsvEepc1VPZElAMrneIilsDroj
	Fj2ozi3N6ZhrDSUKFf8li1XG/K7XCKLRbZ+B4RHII2aoxWWZkCUAAt53A444ZMgaEg4SCw0bxXRE5
	RB0hUjBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSqPF-0000000Dqsk-1mXk;
	Tue, 09 Dec 2025 05:37:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSqP4-0000000DqrB-3OI0;
	Tue, 09 Dec 2025 05:37:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3529C41708;
	Tue,  9 Dec 2025 05:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C90C4CEF5;
	Tue,  9 Dec 2025 05:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765258608;
	bh=2RDv4DcIrTBucTjjuk5VLFq9dvjMqEKn4KbLFw9RQ3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZMXVtuAFLOJ+SsbKDzzcbohGJRut2sSqU8ai3zrpchO1F1eqwyfiGhM4gT3woR3pF
	 pY/JWYmW2Lp3nwtWVfRRWEHwmWdgigBYR5Qf2JlboV0XoYYGhhND6Jh5VcVmxd9l64
	 GwT/zblmSesZFEuW/hJnJp5lcq4bPlCkrxYnfESxh79OKibdZAC5vhtkH2bvu58Ld9
	 /SCiT6/MIV82mKEecnhrFdjGymKKcqyebul7ZTgauQivImDCLEH+SltzFhEctzUaLy
	 21/TzgPVsX9H6i9+vq8AQ3PrcV7jskjZ+nsVRprhD/mYCoQKZ/YEVKfj0BNdVmMwFB
	 CejkKw80MROSg==
Date: Tue, 9 Dec 2025 14:36:44 +0900
From: Niklas Cassel <cassel@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] PCI: dwc: Make Link Up IRQ logic handle already
 powered on PCIe switches
Message-ID: <aTe1bA7lcVzFD5L7@dhcp-10-89-81-223>
References: <20251201063634.4115762-2-cassel@kernel.org>
 <f1059d5d-3fa5-423a-8093-0e99b65d5f4c@oss.qualcomm.com>
 <aTev28wihes6iJqs@dhcp-10-89-81-223>
 <dad4957c-ca13-4742-b46d-03f0478911d5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dad4957c-ca13-4742-b46d-03f0478911d5@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_213650_881700_0E30F299 
X-CRM114-Status: GOOD (  13.92  )
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

On Tue, Dec 09, 2025 at 10:57:18AM +0530, Krishna Chaitanya Chundru wrote:
> On 12/9/2025 10:42 AM, Niklas Cassel wrote:
> > 
> > So I don't really understand your concern with this series, at least not if
> > it goes on top of your series:
> > https://lore.kernel.org/linux-pci/20251124-pci-pwrctrl-rework-v1-0-78a72627683d@oss.qualcomm.com/
> Hi Niklas,
> 
> If this series goes on top of the our series i.e pwrctrl rework series, I
> don't have any concerns.
> My only concern is link up IRQ never fires if this patch goes before series.
> 
> - Krishna Chaitanya.

This patch missed the v6.19 merge window (and so did the pwrctrl rework
series), so as long as Mani queues up both for v6.20 (with the pwrctrl
rework series getting applied first), I think we are good.


Kind regards,
Niklas

