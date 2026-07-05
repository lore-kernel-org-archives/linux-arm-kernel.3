Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F104C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 13:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ex9HeM9mg6JkQnPJIPiED9PQNgJpxKIVIPPfPa4WkMY=; b=y2D3Cr3ouvyyS0tnJtPWi1K4g2
	8/8sV9J+AvVSeYzF42QvxAAJuDsYYuXB2YrFBklnes4ZNSW6oj3cVbynVIMP7e+uGtG2wFO/U2IKW
	/vUIy029/D04ObeuVuuAal9/LSS577aiRLkXBkdCrVcOZ//otw5QE0q52gmAw9mb4filxl9mRAatO
	/r/pik2JsAosTJOEaIbtVj322EDD96wiw0rLmPWSeSSeLj1dPgS3A0UoUfTA+IJ+GLOxIzY/yO59H
	+xa5fYPmHnm6YTEUHz0JYGhbTCK5eoNguW9zFnlt0kWQpiJond5z2Y5FzmaOwu8QWAMTIp2xde3dE
	HlBUmMnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgN0o-00000009LlC-3mi3;
	Sun, 05 Jul 2026 13:35:58 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgN0m-00000009Lkj-0t1s
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 13:35:57 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gtT5d0q1Wz9tmt;
	Sun,  5 Jul 2026 15:35:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783258549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ex9HeM9mg6JkQnPJIPiED9PQNgJpxKIVIPPfPa4WkMY=;
	b=Mt2aVkWHypYRPAdNmS+Q3RXtJz1tlnlm+BQ7n7W4bRp3LrZ2OOhoYb2Rp6zSWMDYrL7yR5
	yaVQ2BRI6N9HmffRZ46lnJA8fq5sP2ldpxS82+X25Ca2A9FEG2OAYOTK/wHZlRAFM5Hakr
	SH4NQpbvg14tR+1wGYWKQtCt4zTjkhGImb/R3vWekF9CD7AL0OP+YhL9oYI5XPR6la8vHc
	NCmdWIHzuAj8RESy+xUH08VfY451Mp+NtnpraA1T2TP4QzyraZwcwxomMeUubbJ5mAxXX/
	2XEcfFfDIb7sG8dyHJxLLXH6OICWRuGLOndoPXLIA4urv9hbst1snvW7xUmuew==
Message-ID: <8c39f742-b690-4cbf-90f0-b0b01644a196@mailbox.org>
Date: Sun, 5 Jul 2026 15:35:44 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/5] PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not
 used
To: linux-pci@vger.kernel.org
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260701203918.63189-1-marek.vasut+renesas@mailbox.org>
 <20260701203918.63189-3-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260701203918.63189-3-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: fx6sg5pqj4b5z9aib3jgoqm6s4e8fawf
X-MBO-RS-ID: 7a5b940343e406281b2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_063556_418858_9A13EE14 
X-CRM114-Status: UNSURE (   7.79  )
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

On 7/1/26 10:37 PM, Marek Vasut wrote:

[...]

> +/* INTC control & mask */
> +#define AXIINTCCONT		0x0a04
> +#define INTC_EN			BIT(31)
> +#define INTC_MASK		GENMASK(11, 2)
I just noticed the GENMASK() here should be GENMASK(11, 3) instead of 
GENMASK(11, 2), I'll fix that in V4.

Before I send a V4 and flood the list more, can I please get feedback on 
the new 1/5 patch in the series ?

Thank you !

