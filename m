Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94976C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 10:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4/rgQkgha5X6rrJzoDSNGEpZWbIHMNm8Tn8er8cB/k=; b=cbZ4eZOlby3osMdUD2sL4W5J1J
	785DaYCBPM4nJmIUpU/ymxm78tVro//me4H/RwQzdPUDVwv4FrYU3kdCvdijKCcMcENGXivRCGcWH
	NINfee2u9fYLyFQj2cofqfLBQedYgIMRYmKb1A4Xb7NCe6giV11i0TbApNEVVF1S6c2bSfdGn+Hg8
	KIiEikYRujZDBn4YBkV+5azHnXx64FY3eIT9EXO3+vBg1VsDdxIUUVpASc30vnlMEOrmPbSipteEp
	EPHjpoTLRePkR9aoPtqECbJPocEVdFJcsuSTIcOLTK3B+1DWZLcowI3rSRIu1ARvp1URKf+pLikBu
	leOJM3tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXGoY-0000000Avk1-0h7x;
	Thu, 03 Jul 2025 10:05:10 +0000
Received: from mail-ed1-f45.google.com ([209.85.208.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXGmB-0000000AvNK-3Ktt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 10:02:44 +0000
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so8336338a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 03:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751536962; x=1752141762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4/rgQkgha5X6rrJzoDSNGEpZWbIHMNm8Tn8er8cB/k=;
        b=YTBLxJZlHTOQXt1DnTSqUrK2qoOGAiCHgGuyfxdcuDWnN4if+LHmRe3jilQQ65zmgY
         gZf7xuHsBA0S3jXaDSMzb48UnVHvfwyLVcNt8knoW6UrBb8kySj5aJkeLNQREk2Cbmic
         594Wom++RukxmrVMdPdATyVMI5rfKXj7NdnToRd3wLHDNULJYvgcCSVcNYIioRLGjJTt
         xOj0ioyAEDC0pNjhkOxGeVwnrLSNDTw2tWuXyTEfwruDmPY6rXO93dDK2W6F+yKv8FW1
         xK47y9HyZirmbiTlYWJ2co0VfonwGWOxqO9/FHdw2ddgVAvajHUbKvGDlf4UkEEiueQX
         jPrA==
X-Forwarded-Encrypted: i=1; AJvYcCVGQlznUs8HJ5bwbRhWS1DadcI0G4iFPjzNxXHKTYBXfdRh27RroyIIiWaLLLAjT9M13H/ocTCT593wjfcveGtk@lists.infradead.org
X-Gm-Message-State: AOJu0YxJpn0cJN4uTmsTrkmK5J7r0IoezlEU8J75Z0bE9f5RFutRypRy
	bo+kbvIB4BhgCtexxZWnfNs4ayXlPcUB4c6WXcN1zIllUnWpm2OGKjD/
X-Gm-Gg: ASbGncu77z5jHXmXhanA1xcPWQ4o88wWu4I2ELci/w9dwkVQMUrJ35BOvhLhJJj+jFh
	zVmuv33DUIT4cgOVY308XyAGH7IzELYKG89Uv8T53LzlPNuqAtob9gG2lPEAO/tT9Mn6odcvDO0
	qeZY/P5U1fRyasysy7a7cRcBnJ2/y8Y5X5Ejcg0tjIQu5taXLq5RGO2M7XMrkWUvzkiJziY1NbE
	A2P8efgAtqpa3IXjIRx14kD9THZVJS1uA8eBpAeU4bjOWzx+fQViRz9C2THTIV6T46nLWrNskJb
	/nWPmlHYlkQkvHcc++4fQkXT3lCsjEu1EmeHaXwHtlptoZXb8rbq6X8sgYRK4Bfu
X-Google-Smtp-Source: AGHT+IHrcjexOB74PqvVv9z/9SXhAOIQ2YaJ+lsByNRtlO9RzJ58V2gP8EKrD/Tpey1DUiVDSp7PSw==
X-Received: by 2002:a17:907:eccb:b0:ae3:7c8c:351d with SMTP id a640c23a62f3a-ae3c2e35d60mr607661766b.56.1751536961821;
        Thu, 03 Jul 2025 03:02:41 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:72::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c01620sm1250043566b.103.2025.07.03.03.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 03:02:41 -0700 (PDT)
Date: Thu, 3 Jul 2025 03:02:39 -0700
From: Breno Leitao <leitao@debian.org>
To: Leo Yan <leo.yan@arm.com>
Cc: cov@codeaurora.org, rmk+kernel@armlinux.org.uk, mark.rutland@arm.com,
	catalin.marinas@arm.com, linux-serial@vger.kernel.org,
	rmikey@meta.com, linux-arm-kernel@lists.infradead.org,
	usamaarif642@gmail.com, linux-kernel@vger.kernel.org,
	paulmck@kernel.org
Subject: Re: arm64: csdlock at early boot due to slow serial (?)
Message-ID: <aGZVP8A2a3VVQwzt@gmail.com>
References: <aGVn/SnOvwWewkOW@gmail.com>
 <20250702172036.GC1039028@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702172036.GC1039028@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_030243_830869_2A379CA8 
X-CRM114-Status: GOOD (  23.79  )
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

On Wed, Jul 02, 2025 at 06:20:36PM +0100, Leo Yan wrote:
> Hi Breno,
> 
> On Wed, Jul 02, 2025 at 10:10:21AM -0700, Breno Leitao wrote:
> 
> [...]
> 
> > Further debugging revealed the following sequence with the pl011 registers:
> > 
> > 	1) uart_console_write()
> > 	2) REG_FR has BUSY | RXFE | TXFF for a while (~1k cpu_relax())
> > 	3) RXFE and TXFF are cleaned, and BUSY stay on for another 17k-19k cpu_relax()
> > 
> > Michael has reported a hardware issue where the BUSY bit could get
> > stuck (see commit d8a4995bcea1: "tty: pl011: Work around QDF2400 E44 stuck BUSY
> > bit"), which is very similar. TXFE goes down, but BUSY is(?) still stuck for long.
> > 
> > If I am having the same hardware issue, I suppose I need to change that logic
> > to exist the cpu_relax() loop by checking when Transmit FIFO Empty (TXFE) is 0
> > instead of BUSY.
> > 
> > Anyway, any one familar with this weird behaviour?
> 
> To be clear, I am not familiar with pl011 driver.
> 
> For the first step, could you confirm the UART port is only used by
> Linux kernel?
> 
> In some cases, if normal world and secure world share the same UART
> port, it can cause the UART state machine malfunction and long wait.

I don't know how to check it for sure, but, looking at the serial
console output, I don't see anything else using the UART. The only
output I see on the console at that time is coming from linux kernel.

Would you recommend any additional check?

Thanks for the reply,
--breno

