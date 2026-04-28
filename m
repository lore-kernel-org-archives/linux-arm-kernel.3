Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9BFFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 12:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0A//i6lW9ZgX8m7SfE0ctPZGZR9MtJ/Dk2v1dp0dCk=; b=nUR0fcrWAXEAC9CL/z/It+CGsD
	jwxZRxcyI7urG0sJwWNmqLT9KzScljjjgTtj5V5Wto7xEnMXdRhqHLWEvapMWf0Z84VfzvIeBWOEu
	7Araxs52QIoKCZcOIeEBaCrjblX+GjWPcQPxZdeWXXCFuFvxmlhQsQ32CBLbc5q1l9dZMMXeen6kj
	dYaJ3Qxp834EcsBHyfcclwipUQdkoi9On81FdqscDZ/psvGgvalfKrqxoDXHVFENNw2GWt3UU5Uo5
	HEblISg8+4BNmtoW91wds+24FjOMjjCB6p895TJxjsYY9U8hx7Rnd5o3ckQqSMihCfDwq5x9RjcX5
	S7bJOdhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhui-00000001TCa-45Ze;
	Tue, 28 Apr 2026 12:51:44 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhug-00000001TBW-2hbp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 12:51:43 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-82f70ae35c0so5910561b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 05:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777380701; x=1777985501; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S0A//i6lW9ZgX8m7SfE0ctPZGZR9MtJ/Dk2v1dp0dCk=;
        b=BGJdDgT6ieojYqJ5pHiULrkwH8Nmk+3tH4JFiZ3grM2QxDa3YoHtYtxMXN85tHOG3B
         x3lFJ3a8XFEEk3/2ty6zN2/btjR6b/3TVv0YzGxV4R45t+jnc2AtyIMU8gYscTixcbN6
         LlDaU4KB1jTHxl0pQOQKAR9TVf83WoR8TBGirrw5/qq77rL9nXxrYyyIBKxLM84ZiKtO
         u4TrrxtDfBSOCb8qZG2V5jQo7YtaSZXspDzMqzRZdRM8rzeucNRWFZHeV84VEmRTDTfX
         ugn/TfCE+eZrrJ0xysERQAf9eiwEdbB4g1PpzKhguvBZuF4Zb+E095g+dHjJsh/jP1WI
         +y7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777380701; x=1777985501;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S0A//i6lW9ZgX8m7SfE0ctPZGZR9MtJ/Dk2v1dp0dCk=;
        b=sc6OXwFZvGiiKH+A2jICIwUYyZgStPvyQ8wvgcnKkNTGxe5t+BA1TIjBXI0ebN1mIh
         4Yy8Qq40M1kizPGVDN0rAifyRDcnymJgJ848tQjfszthotYiN7SABnrzxdY6CmKRp0us
         mC0DmYlXQBS/7V9gZIP2qfUUrjNYE9+nXiUlfKCd1r2VQGsGR7rasDk9ma6PEXQt4aq3
         kuzNYayA/UwTsqTzLy8hPxILrNWwgXB+Jjbt4YuKvaqi6IWuny95uqpXvG28XpnDXOUB
         My6YBFX3oNp5Gk2A3LE6dhKPnAAxJVmqaMu2rG4c5gbUFQYWo+muTnp8qRiPmpGt/j8n
         qKvw==
X-Forwarded-Encrypted: i=1; AFNElJ9GUGTfohwWohbRrBIqAlUDakJnBBF+I0SXVjG9+nYbvDHPWWaJzRElqXX+3CFztQ5UDr5Q+9vAuT2kZ//CmgKE@lists.infradead.org
X-Gm-Message-State: AOJu0YwZSxDHnafpC6HSAefGDcOmrUHlu12qM0HKzFb0XTkPSNnWkVtH
	uymuuotIrH4ky8WE7RU1pF7CghGIRukxRyjeE8BFdY/d1Yb7Z5dsRi1igvCcaLvEnto1w08/6lf
	nv1faolG08MDGA/v+Kpta76p0dA==
X-Received: from pfna24.prod.google.com ([2002:aa7:80d8:0:b0:82f:5576:285b])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1d8e:b0:82c:9897:70ef with SMTP id d2e1a72fcca58-834ddb9b440mr3026357b3a.27.1777380700900;
 Tue, 28 Apr 2026 05:51:40 -0700 (PDT)
Date: Tue, 28 Apr 2026 12:51:39 +0000
In-Reply-To: <d860b6a9-e4a9-494f-821d-8b0a347e1591@arm.com>
Mime-Version: 1.0
References: <d860b6a9-e4a9-494f-821d-8b0a347e1591@arm.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428125139.1627369-1-joonwonkang@google.com>
Subject: Re: [QUESTION] Is the ARM SMMU v3 implementation designed to always
 ignore SSID when SSID_VALID == 0?
From: Joonwon Kang <joonwonkang@google.com>
To: robin.murphy@arm.com
Cc: baolu.lu@linux.intel.com, cychu@google.com, hhchung@google.com, 
	iommu@lists.linux.dev, jgg@ziepe.ca, joonwonkang@google.com, joro@8bytes.org, 
	jpb@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stimim@google.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_055142_689665_5400F156 
X-CRM114-Status: GOOD (  35.38  )
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

> On 28/04/2026 12:14 pm, Joonwon Kang wrote:
> > Thanks for your prompt and insightful answer!
> > 
> >> Hi,
> >>
> >> On Tue, Apr 28, 2026 at 07:38:59AM +0000, Joonwon Kang wrote:
> >>> Hi team,
> >>>
> >>> According to the ARM SMMU v3 spec, I believe that SSID should always be
> >>> ignored when SSID_VALID == 0 and the current ARM SMMU v3 module
> >>> implementation in the kernel seems to comply with this without exception.
> >>> For example, when handling an event from SMMU, the implementation checks
> >>> SSID_VALID(SSV) first and ignores SSID accordingly. If there is any
> >>> exception to this rule, I believe it is a bug.
> >>
> >> Indeed
> > 
> > Acknowledged.
> > 
> >>
> >>> Is it true for all the current and future cases? In other words, is it
> >>> **mandatory** that the ARM SMMU v3 implementation ignores SSID when
> >>> SSID_VALID == 0? or there might be some cases where the implementation
> >>> needs to refer to SSID even when SSID_VALID == 0?
> >>>
> >>> Asking this question since our HW may not be able to clear SSID when
> >>> SSID_VALID == 0 and so there might be some garbage value in SSID at some
> >>> point of time(the HW will have a correct SSID when SSID_VALID == 1,
> >>> though). If the ARM SMMU v3 implementation is to refer to that garbage
> >>> value for any reason, the result would be devastating.
> >>
> >> At least according to the architecture, SubstreamID is ignored when SSV=0.
> >> The SMMU is allowed to propagate the garbage:
> >>
> >>    7.3 Event record
> >>
> >>    * SSV: The SubstreamID validity flag
> >>      - 0: No SubstreamID was provided with the transaction and the SubstreamID field is UNKNOWN.
> >>
> >> But the driver will ignore it.
> >>
> >> Same for PRI queue but in that case the page request wouldn't have a PASID
> >> TLP prefix.
> > 
> > Although the PRI request without PASID may cause unpleasant ATC flush with
> > SSV clear in this case, it does not lead to the implementation referring
> > to the garbage SSID. Is this understanding correct? And while this case
> > seems to be handled solely by the ARM SMMU v3 implementation, do you see
> > if there is additional care required on our device driver for this?
> 
> A transaction with SSV==0 does not have a SubstreamID, therefore by 
> definition there is nothing that an SMMU could validly attempt to do 
> with a SubstreamID that does not exist. Sure, implementations can have 
> bugs, but I'd expect any such bug in this regard should be sufficiently 
> obvious that it most likely wouldn't get past architectural validation 
> in the first place.
> 

It makes a lot of sense.

> If you want to know the exact behaviour of Arm's implementations then 
> you're best off asking Arm support, but since this piqued my curiosity 
> too, I can save you the trouble - I checked with my contacts on the 
> design team, and indeed our SMMUs should ignore the SSID value entirely 
> when SSV==0 and just treat it as 0 (e.g. in event records).

Thank you very much for saving me the effort and confirming this. I also
acknowledge that it will be best to ask the Arm support with regards to
the exact behavior of Arm's implementation. 

Thanks,
Joonwon Kang

