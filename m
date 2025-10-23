Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781B6CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 13:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=liOfj+w7oQQHQDinbActumCxZ7ts8b1PR9+ClEG2E04=; b=EZd3jIPEhyHhvEbZbp4KGLE22T
	1nkm8fz3GEgko8M/KgzC8cs/YmNlzWkhP100BK0gi+3rCBZHODXBTxLyYgoFP0jJp2bwhRP8b31L4
	LHGaI5zDlOt8g8mi6Q2sK5FvkroWjACCjD+oElPBxg2FlaDgnFQsc2xgpo86tDbym2JgqAqGH4TtH
	yndi3dY3VIsw0ZCTyrRYLufoPaWr5zUgcGxUd8eqAmALKikfBOBidhIqJpVfZaE244g2IAM5Lgl2c
	eS7rQtyhlV/IRX5WKWpLhxkDWkErKE/S15WccHVt7JfvWUWIzORIcfRHRcVf7antils/pj1BTQ7Wr
	rEHtNV4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBva1-00000006S0y-1ZCV;
	Thu, 23 Oct 2025 13:42:13 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvZz-00000006S0S-0TOb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 13:42:12 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4csnJc1Cmgz9slM;
	Thu, 23 Oct 2025 15:42:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761226928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=liOfj+w7oQQHQDinbActumCxZ7ts8b1PR9+ClEG2E04=;
	b=o9+wlKtp+2kDP0Zbjrkwnbw8gWzh21UrNc2ucsM9ov4omiyPctnbOnoSsjI0i/mc93P2K7
	Fotzk1NrnxIas6RJz6KAKgbKUfVWbPN2RXt91urKFmxXVDolED2nwYLqtussQQnOyjIl1/
	gZ6dtn6k83cUX+d3j4SmOriLX4GMLtpgabRBkDQnvaD4jPXt5b8Qh8bbGcnXQRKkeEtt0X
	tYJYT17NeaBBxiVEQhMJyl4L74bfRJzjQRDGyy6wGqYbYXRdpkR55ER3cz38+1PpCEB9BT
	hOm4II+4u95AUPJQztPhy0q076I/ktLAtnSXS4BCudy4m5+pBjZ6i1w+W8rSrg==
Message-ID: <066449c8-4bca-41f1-990e-53d7672e3c0a@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761226926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=liOfj+w7oQQHQDinbActumCxZ7ts8b1PR9+ClEG2E04=;
	b=AV+NJSsTsrmJu2xpIi8b3X4WAqCpmXBK6i7v/WDnXuzr7Gg4IKoUADsAAhOCN4rWt9UrIq
	aeIBV4emYzweIn7+H16S3dLe1TyA6HXoLfuffCUu5mSSIxvgbF12gIx5X0pE24bwHuHrZ3
	q4kaZTEt9S8/VybcH7XmQJRr9P0T3j/SDO8b/yKUll37QKvLoe4hfBUXwv0IXur9Rbmc5m
	SQVLqGyGyAT8OrUEvdENH4xHFWg0vAITTgU/Mb7kOtQ6jQtTi0pLaVcIcg/7N884H9ULy0
	VGLaHH+WAMlmevcfutwJh3GqNKUgogPGfisdha+YbyBdXzJ2s5SSPuCoLtIUBw==
Date: Thu, 23 Oct 2025 15:42:02 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
To: Sudeep Holla <sudeep.holla@arm.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <20251023-able-fervent-tortoise-e7a6df@sudeepholla>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251023-able-fervent-tortoise-e7a6df@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 2b7b03ec44f958831f6
X-MBO-RS-META: d7cbac4yirg6dmrd4f7ehr3mnryd66c3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_064211_295367_2A50CA02 
X-CRM114-Status: GOOD (  12.87  )
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

On 10/23/25 3:16 PM, Sudeep Holla wrote:

Hello Sudeep,

>> +  arm,poll-transport:
>> +    type: boolean
>> +    description:
>> +      An optional property which unconditionally forces polling in all transports.
>> +      This is mainly mean to work around uncooperative SCP, which does not generate
>> +      completion interrupts.
>> +
> 
> Could you please clarify which platform and transport this change pertains to?

Renesas X5H with older SCP firmware , accessible via mailbox.

> Introducing a property that enforces unconditional polling across all
> platforms is not ideal - particularly if this is intended as a workaround
> for a platform- or firmware- specific issue. Such implementations often get
> replicated across platforms without addressing the root cause, leading to
> wider inconsistencies.

The root cause is being addressed already, this is meant to keep the 
older SCP version operable.

> It would be preferable to scope this behavior using the platform’s compatible
> string. This approach ensures the workaround is applied only to the affected
> platform and prevents it from being inadvertently enabled elsewhere, unless
> another platform intentionally uses the same compatible string (which seems
> unlikely).

This is not platform-specific issue. SCMI provider which fails to 
generate interrupts can appear on any platform, using either transport, 
that is why I made the property generic.

-- 
Best regards,
Marek Vasut

