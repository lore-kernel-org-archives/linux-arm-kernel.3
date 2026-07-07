Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6518FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 20:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pE6yNMp+uXpgGUcwJt1cNGBLI12Hj8FXQ5m2BI8bX4s=; b=w/NlDgysnnhDH6LofwX4GMTfse
	N306dm9nYtyZ3fTbFL96o0wb10LGzV1QvIZ3SWvpzSz3aL63Lgm+S2RUS2BP8yh1O29iSC3zZL+F8
	Y6wbev/6mSEpz5VjPi4ZWaya9HdcFxxVe3/YTbm6uId355x1bUsJ2EYa3FN+l/bpuOYB3nmGdNn8K
	+2cflupBVxOXQHcJrZDj8si4BLvuWhHB3fHIsshx5Xghju45EteF/PXHhG+3IlY83wbwoCMuUx30D
	eOHTZd/g07Q2g5BkP+mgGW8kARJA5gsmS+ZN/HMVg15Eypj+xcht1OwcqiDD9wpmBsipinR+p5qvX
	BP/F4SYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whCL5-0000000FqyU-1W1W;
	Tue, 07 Jul 2026 20:24:19 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whCL1-0000000Fqxc-3psn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 20:24:17 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gvt3r6X4zzMlHZ;
	Tue, 07 Jul 2026 22:24:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783455848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pE6yNMp+uXpgGUcwJt1cNGBLI12Hj8FXQ5m2BI8bX4s=;
	b=hlX9qH3P7QNIy3fjcF4n/8eSucWZ176Mk6rgjs1M739zaMKvTQvGGk549o/lK7yzZY8UKe
	jrzFdT6d+qGQ8TmH5E8onyjvFhIdY+IgHM7HLT6Llob5IE5V+y8Fk7WgrW3QqWf4ODCQIa
	eYSgnfyQrdAPnV8IUCnsSUcelKJAkz9guNykDXeTGHK/kY5secL5vamRRk/cwduEriTwSM
	f8CZF+4XnDZ0VgOApdQJ4+L+WpHH7MVIYfFxN6LKJEcgVUhp1FGVkc5sucYDAu0sbcym+B
	BmjQEfAMRLzikJr7elz3UFrWy8d2X9uQAUaLcjfAlrZXHRJsHRxMO6xWLW81Dw==
Message-ID: <e67d526b-7e4c-424d-b971-35e06c163376@mailbox.org>
Date: Tue, 7 Jul 2026 22:24:03 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/5] PCI: dwc: Determine whether iMSI is used before
 calling .init
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-pci@vger.kernel.org, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260701203918.63189-1-marek.vasut+renesas@mailbox.org>
 <20260701203918.63189-2-marek.vasut+renesas@mailbox.org>
 <4qyn4fljtb3cbzcmfpkdomkm7vqnwn2rfbtqng4iwmtvfd4bpj@t6kkw53erl7f>
 <8a921ce9-e339-445a-af05-d20f9f2df01e@mailbox.org>
 <p4it4hcg24narbtjtoqdk6zg7wpfs5hc2mm77acyoi6hwfkh5u@5bqlwhylosmo>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <p4it4hcg24narbtjtoqdk6zg7wpfs5hc2mm77acyoi6hwfkh5u@5bqlwhylosmo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 073d86a19c85a0d025b
X-MBO-RS-META: 5dycfot7945dqgf3kieqojhkr9yf6hae
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_132416_115488_4D86A730 
X-CRM114-Status: GOOD (  11.90  )
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

On 7/7/26 5:36 PM, Manivannan Sadhasivam wrote:
> On Mon, Jul 06, 2026 at 07:48:24PM +0200, Marek Vasut wrote:
>> On 7/6/26 6:43 PM, Manivannan Sadhasivam wrote:
>>> On Wed, Jul 01, 2026 at 10:37:44PM +0200, Marek Vasut wrote:
>>>> The R-Car Gen4 PCIe controller integration configures MSI registers
>>>> in the controller driver .init callback, because those registers
>>>> have to be configured while PERST signal is asserted, and the PERST
>>>> signal is asserted across the controller driver .init callback.
>>>>
>>>> The registers have to be configured differently in case the iMSI is
>>>> or is not used. Assign pp->use_imsi_rx before the controller driver
>>>> .init callback is called, so the controller driver .init callback
>>>> implementation can use the pp->use_imsi_rx value.
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>
>>> LGTM!
>> Thank you. Can I get AB/RB before sending V4 ?
> 
> Why? Since this series goes through PCI tree and all PCI patches are controller
> patches, I'm going to merge the series. So no need of the A-b/R-b tags.
All right, V4 patchset is coming shortly.

