Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6359CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 18:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5+yCSGksFVRNRQf31YBe+wjmkAH6A3Ih7vubn4fPMA=; b=FlazEEPbBFZILJjFRXUHSKzS0T
	ihIg2UEo3JMQCtXoApfFaJs+fGGO3NQsu121wwSYDlTbh0ZLWDXRdmLAZH51tbOTf7vCElE0RdX6D
	MqzbG4W2LCwlVFcZGoZv/Uq4fFzDR4VlOhrNR+lBUaYnvFC9L/wS0PH618wwLD7CZBHMMT5CtXYOV
	6Gf8U1X8jq5haSSKwOgAqhl43HJKxxFjCPcNpEYzdABfoFULiglqV0In1E0rdng4R2qVoiwUlnL3k
	bKATe5f/P5EOqmeupuTzK+DSfXKmF8UTyXH7oZwYVw+KvAMrpAL966BHSH0/j9JWb34jBUOs6R6iC
	8QbOmGmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0Vc-00000007JSw-3k75;
	Thu, 23 Oct 2025 18:58:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0Vc-00000007JS8-04JT;
	Thu, 23 Oct 2025 18:58:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=X5+yCSGksFVRNRQf31YBe+wjmkAH6A3Ih7vubn4fPMA=; b=Ny/nVDpbLFedoWo7JAjvlb52lG
	wiQEWaacalVKjQSdQOVfn4+GZ30ohzqIe9u63joocmB1YdaHTm5yPs3FFT4ebPONhW9ajVUaMFrqR
	qA5f6DH8bYLnAunav7iJe93T5w7buwPF1DZ5it/e0kEFmK5VxzXaRL6iBKcMO9FVduPUJfnx0yyz2
	P4TtcMtTzCjBbN2+awS0AGIjV7+27TfBXdn7FlFXaMex1QUL6vH2GwhJ6dzVaEUHT/kI/Vel7lSvP
	vi1VgTqHT4Gw28RS1KXZzdc+u3PY0gseSSWPkVw7yBvb8McAipSlXYqINED6Wf6p8Dp4tQic0ahrF
	RZVHKOuQ==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzdu-00000001dWH-1se7;
	Thu, 23 Oct 2025 18:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=X5+yCSGksFVRNRQf31YBe+wjmkAH6A3Ih7vubn4fPMA=; b=b2ZJ0HIob3ZMvZA80vttAQ1a7H
	iiBQHcFLOAxvT5TaBjA3jDeqeQoQu4TDQEvEa0JDnfiy8/0xYdn4VZr4TpDk24qMUHybPhD+cnZaI
	0od+bZrDEhBVqx/DANgtBZfHCjpzb9B0tS6MG+f/rzsqvuBTsFiXv0bEE+avkj7sDoKY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vC0VS-00BuhZ-FF; Thu, 23 Oct 2025 20:57:50 +0200
Date: Thu, 23 Oct 2025 20:57:50 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Heiko Stuebner <heiko@sntech.de>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	jonas@kwiboo.se
Subject: Re: [PATCH v2 5/5] MAINTAINERS: add dwmac-rk glue driver to the main
 Rockchip entry
Message-ID: <35567cda-0f49-4784-b873-97e378fcee16@lunn.ch>
References: <20251023111213.298860-1-heiko@sntech.de>
 <20251023111213.298860-6-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023111213.298860-6-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_190230_559548_E2F497FE 
X-CRM114-Status: UNSURE (   8.68  )
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

On Thu, Oct 23, 2025 at 01:12:12PM +0200, Heiko Stuebner wrote:
> The dwmac-rk glue driver is currently not caught by the general maintainer
> entry for Rockchip SoCs, so add it explicitly, similar to the i2c driver.
> 
> The binding document in net/rockchip-dwmac.yaml already gets caught by
> the wildcard match.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

