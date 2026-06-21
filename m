Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F02ECD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 22:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gEt6DTuBzI0+FzGS8r7ZT6Ohyc5Y63Le4qa6MCGvfow=; b=cfha6lw6BCboY2c+cpIs+X9sxD
	4roXNWyQVmEtyRXw2NWrdfrEuFH+xbTSnsFcdNWjDMoxmdYxMfydNZia1KCN0aotxVdQO0rCnzKj5
	Amn2wEJ2fVrCnqOu+q4Eo/Z1+stT9SamJKaYCjDnfBcNLYN/WlENFrjGu+Pl1+dbkAPWZlM3x78H+
	akxrFl3UNaLtSjNK4KqhjHiYwWm+giRoV/cNEIJy8ynd+T9Ok7ez4EmE7Z/nTYvzKoJUghJG0wjsr
	dX5NmJ2jCTI4tQhwhKWbecBXGoyoTPKDvbibC5M3w+/5+RKrNwny2zXG3GX9WdyhWl/7zP7E87kIQ
	zZ5/ua+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbQw3-00000004Da0-2DEY;
	Sun, 21 Jun 2026 22:46:39 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbQw0-00000004DZM-30s7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 22:46:38 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gk5zT6T4Vz9tnx;
	Mon, 22 Jun 2026 00:46:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782081989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gEt6DTuBzI0+FzGS8r7ZT6Ohyc5Y63Le4qa6MCGvfow=;
	b=YuKr0L4wCdBvR6PEHbJBHWgcBIr4EUYEj7DgkSyARftTpwWKTcttWJue4QRFTnT2XLRw8F
	URVVqNoAXGTy82KmgEGt6GxYxqyjn88uvd9jzQSc8K7xXasz9G3QRWBP8At6u3Asu6RZUK
	34ceq07SUILwfmMA9sTLigAJLFIroByMbhHUq0i5a4P/yhl/B/tXlyml7gOhkZTeQrShnm
	3Af+2x0NxVL5aS27Ll+AGlpAcP+qPaQ+vj3paPetTDn9pK7a8ohT6sTYOfqMlccUSXzlYm
	LI3/pPLB23QBVV3bejKFgZMeXsHDFPOGglROgwUPRMXftSFdzSs4lOvewbHbaw==
Message-ID: <d6fce333-4353-4e49-873f-eb3187a631e4@mailbox.org>
Date: Mon, 22 Jun 2026 00:46:25 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/4] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum
 workaround
To: Thomas Gleixner <tglx@kernel.org>, linux-pci@vger.kernel.org
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
References: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org>
 <20260618220427.14325-4-marek.vasut+renesas@mailbox.org>
 <87cxxkma5p.ffs@fw13>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <87cxxkma5p.ffs@fw13>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: n8czsugnw3z1ybb5adzw75f9b7bgn1xy
X-MBO-RS-ID: 9459b256e9c9aa6c616
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_154636_910124_F40558AB 
X-CRM114-Status: GOOD (  12.20  )
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

On 6/21/26 12:59 PM, Thomas Gleixner wrote:
> On Fri, Jun 19 2026 at 00:02, Marek Vasut wrote:
>> Renesas R-Car S4/V4H/V4M GIC600 integration has address width for AXI
>> or APB interface configured to 32 bit, it can therefore access only
>> the first 4 GiB of physical address space. This information comes from
>> R-Car V4H Interface Specification sheet, there is currently no technical
>> update number assigned to this limitation. Further input from hardware
>> engineer indicates that this limitation also applies to R-Car S4 and V4M.
>> Name the limitation GEN4GICITS1, and add a driver quirk to mitigate this
>> limitation.
>>
>> The quirk is keyed on the combination of the GIC implementation
>> and the platform identification in the device tree.
>>
>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> This SOB chain is broken.

Broken ? I don't understand , could you please elaborate ?

Should I sort this alphabetically or is that something else ?

Thank you for your help !

