Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3A2E8FDB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 08:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ge43V+B57fC2PZVYX/3fKWqaJDnVMBprNZqh3Y6JZNw=; b=njmFTEM/vTOUh2awo3G8NdPCt4
	X9K9/jA7/jXPcylvrtkYPSA13jpTt+PckEVTe3gFwvgLglRWwqC8C/v8hzc+JRF+y29vv8wxZITOZ
	+GTLij4+LAncBooHqfoLJU5+jvkuPyC3TxS2OWiszx11jI8vTcANj6jc+jryZ0dfLIvX4LhB1AurU
	cwwwleol8UqV/w5E2LgMJawGDmBipBARzDZK2X+CSoNG0Od6lJNnjCS/iMLgu1Lz6b9vEERyYnaee
	MyVT/+9fv6FwiHRQauUMaOsGQqej9NtLqsj6zmilKoF6piTPpPW7ouOtdA5Xn7pmrnVd6RPNCY6zo
	3NL7qQWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va8xR-00000003UcZ-1fZa;
	Mon, 29 Dec 2025 08:50:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va8xQ-00000003UcS-2AHt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 08:50:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF34260017;
	Mon, 29 Dec 2025 08:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED90EC4CEF7;
	Mon, 29 Dec 2025 08:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766998227;
	bh=1ALaMKIKCuUSWUA/hqdR0oh36sJOQQUkFqyRUJxVq8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WPGlNMJ0UXYHJcsqCEaS1my2hsbVfQVdY80vjpFT94ZU4pgNs7kZpm4hP54TKyQmI
	 T7OzJ6dvD2qe9+1lOx0x0whza1dWAE5ssNw3HqZfiefgl72zx4CbTNj1PanRNPtMQG
	 vO5ScDQHramGt/9VJX9CgSQ5c0jJR4vIoR4zVj3XliPDgJwHyzYYghlXArpnEjP65G
	 b2L7VmhVywVYU8zUsEfZCvkHvJoOLWdFNhcGo1EB+NwqrdjCw/Xhy71fjvRVQoVRfO
	 m8ZWXGUFa8PYpkS7vFjlgMmV2HFbwA7jMdXdywpFAIBRGKVp5KGgVUGSyz0PCLISIH
	 Kw2lQYaG4ONJw==
Date: Mon, 29 Dec 2025 09:50:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Amit Sunil Dhamne <amitsd@google.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Badhri Jagan Sridharan <badhri@google.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: mfd: maxim,max77759: reference
 power-supply schema and add regulator property
Message-ID: <20251229-festive-daft-boobook-838fb6@quoll>
References: <20251227-max77759-charger-v3-0-54e664f5ca92@google.com>
 <20251227-max77759-charger-v3-1-54e664f5ca92@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251227-max77759-charger-v3-1-54e664f5ca92@google.com>
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

On Sat, Dec 27, 2025 at 12:04:21AM +0000, Amit Sunil Dhamne wrote:
> Extend the max77759 binding to reference power-supply schema, so that
> PMIC node can reference its supplier. Also, add regulator property to
> control CHGIN (OTG) voltage.
> 
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
>  .../devicetree/bindings/mfd/maxim,max77759.yaml          | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


