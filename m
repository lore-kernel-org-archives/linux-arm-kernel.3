Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1395C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 16:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z18oj+x92MNc/0S9Y8xHuEcemOWJBgJqXoJ/JKjM/Uo=; b=HjyEWzoIgkMoexx4NkvWUJ16tm
	GIBz0emLy58TM7YQTZDp0l6nmlQN0fc/hOzg4e2utNEqRLB8X97AaVvFNjF5We1/0DGL6rHflXxLu
	xpAV7aw1vwR9RcQjmrgNyuhdXHq4AY8P+EsCfPWSyw8cbQ/dqS/8u+C6Gm4+Vu3xqV0N/09Lz15aS
	WyQng98IL9L+HfC8hO/fcXraKnO1Htekw6VLur4ebFrN8hu0rqFRtDvRaPpFBngVz6GFBVrFXAvII
	U5peefuyhcJGCQvWA9p3S2DhUOW5zVnHrz1uPEeLvP0lvh9sdG2X2qmqdylXBH4eiapfV7AlzOtnY
	IKGsry+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMlD-0000000BzBh-2Gt3;
	Thu, 03 Jul 2025 16:26:07 +0000
Received: from mail-ej1-f52.google.com ([209.85.218.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKgw-0000000BcZA-2qRM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 14:13:35 +0000
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae0bc7aa21bso1183752866b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 07:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751552013; x=1752156813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z18oj+x92MNc/0S9Y8xHuEcemOWJBgJqXoJ/JKjM/Uo=;
        b=LAC+626iyW8Gkxfr8A1bPyhP55GLggvFuEjA4Uycct/JmFnfIm2VACtw3I+Q+Cxcat
         aQ9PkEx00mndvS/34MuOUhVs/icFqvWpEbvCEZD/dpBUW9/azeaek1ycZMtgMhel6mzk
         4Q946Nl/YxfZhSd8uugcGEiIcx17jVdqgcSgoCiP4kNCDbT8GLK3kF9e99naP9wqNMP0
         0C5BAeEoPi5S61qCN2U/aeKXNXL20zcmZeuY5ALMFVHTgkK64gEyB/4bDD5z7tNdIDGA
         BiWjLHMCg0J8Sg7vgCGqGEV06UxqZtEh9AjtgF+gS6an+gu/QMsMda2xB6wagRYgCoaV
         3Krg==
X-Forwarded-Encrypted: i=1; AJvYcCUSqWmcJxwTd1Czdsz7TqYRj6/MaqWvOV1Bw3b1ueIV6CSkUE93gtF+R/Lsrd+OnOLHBN8kqAJJDV/FvrS0u2Dn@lists.infradead.org
X-Gm-Message-State: AOJu0YxnmzLlBEy8x6Ajoyh4lZqMer/9ptS/VZsveUsfG62lCGLQTAVn
	UOE/Rz8SDtssZr85AdPMskvowFGBu2Hzt5Xn162Py8rABGpO4jcIYGbx
X-Gm-Gg: ASbGnct6TaEr4ZkA+CF8knj/EUj1ylbjfnnQsodYj2PAKWxI0Sg8jzn4+Hfj1NPgKmV
	i57nwkPtHjGw0XpccVq+WGirgY5vHSM0elro66TAX0dfX4ZH1RIzvfQcKcf9UzoJFK04WJmfhVi
	LG/U6Fz84mVWdUO4ENVrPRX6DXPIeu9HzuB811TQDpCXRYL8m6rheh3BambiuPQxo7YVSpvXHZH
	EiUG/7BZGJEpmAe1A6Ccg94H+EGCFprIaSJQ/+nU42pNC6tMBApXBeoKBd0O5PwpdpjTG+jel+n
	BA4xNjWhn/g2CUMeCF2YoYBoCIIIRq2GOTXKvpt6qsxPkOzJxF1WhjhnxCrd2z5kPvwFHoyzgLg
	=
X-Google-Smtp-Source: AGHT+IG2W4RiEIKOP1cdVrQs5oIBrb+dGkYJvqPdZKRCaRwD1JVKgzL5Mw0lQq3snaidPWHlUSFbZA==
X-Received: by 2002:a17:907:3e8b:b0:ade:32fa:739e with SMTP id a640c23a62f3a-ae3c2a904e4mr715630966b.2.1751552012723;
        Thu, 03 Jul 2025 07:13:32 -0700 (PDT)
Received: from gmail.com ([2620:10d:c092:500::4:6e61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c01201sm1301680866b.97.2025.07.03.07.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 07:13:32 -0700 (PDT)
Date: Thu, 3 Jul 2025 15:13:26 +0100
From: Breno Leitao <leitao@debian.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: cov@codeaurora.org, rmk+kernel@armlinux.org.uk, catalin.marinas@arm.com,
	linux-serial@vger.kernel.org, rmikey@meta.com,
	linux-arm-kernel@lists.infradead.org, usamaarif642@gmail.com,
	leo.yan@arm.com, linux-kernel@vger.kernel.org, paulmck@kernel.org
Subject: Re: arm64: csdlock at early boot due to slow serial (?)
Message-ID: <aGaQBghdAl8VGWmV@gmail.com>
References: <aGVn/SnOvwWewkOW@gmail.com>
 <aGZbYmV26kUKJwu_@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <aGZbYmV26kUKJwu_@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_071334_726721_D54572F2 
X-CRM114-Status: GOOD (  24.49  )
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

On Thu, Jul 03, 2025 at 11:28:50AM +0100, Mark Rutland wrote:
> On Wed, Jul 02, 2025 at 10:10:21AM -0700, Breno Leitao wrote:
> > I'm observing two unusual behaviors during the boot process on my SBSA
> > ARM machine, with upstream kernel (6.16-rc4):
> 
> Can you say which SoC in particular that is? Knowing that would help to
> identify whether there's some known erratum, clocking issue, etc.

This is custom made rack mounted machine based on Grace CPU. Here are
some info about the hardware:

	# lscpu:
		Vendor ID:                   ARM
		  Model name:                Neoverse-V2
		    Model:                   0
		    Thread(s) per core:      1
		    Core(s) per socket:      72
		    Socket(s):               1
		    Stepping:                r0p0

	# /proc/cpuinfo
		processor	: 71
		BogoMIPS	: 2000.00
		Features	: fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm jscvt fcma lrcpc dcpop sha3 sm3 sm4 asimddp sha512 sve asimdfhm dit uscat ilrcpc flagm sb paca pacg dcpodp sve2 sveaes svepmull svebitperm svesha3 svesm4 flagm2 frint svei8mm svebf16 i8mm bf16 dgh bti
		CPU implementer	: 0x41
		CPU architecture: 8
		CPU variant	: 0x0
		CPU part	: 0xd4f
		CPU revision	: 0

	# lshw
	    description: Rack Mount Chassis
	    product: <Internal name>
	    vendor: Quanta
	    version: <Internal name>
	    width: 64 bits
	    capabilities: smbios-3.6.0 dmi-3.6.0 smp sve_default_vector_length tagged_addr_disabled
	    configuration: boot=normal chassis=rackmount family=Default string sku=Default string uuid=...

How do I find the SoC exactly?

> Likewise that might imply more folk to add to Cc.
> 
> [...]
> 
> > At timestamp 9.69 seconds, the serial console is still flushing messages from
> > 0.92 seconds, indicating that the initial 9-second gap is spent looping in
> > cpu_relax()-about 20,000 times per message, which is clearly suboptimal.
> > 
> > Further debugging revealed the following sequence with the pl011 registers:
> > 
> > 	1) uart_console_write()
> > 	2) REG_FR has BUSY | RXFE | TXFF for a while (~1k cpu_relax())
> > 	3) RXFE and TXFF are cleaned, and BUSY stay on for another 17k-19k cpu_relax()
> > 
> > Michael has reported a hardware issue where the BUSY bit could get
> > stuck (see commit d8a4995bcea1: "tty: pl011: Work around QDF2400 E44 stuck BUSY
> > bit"), which is very similar. TXFE goes down, but BUSY is(?) still stuck for long.
> 
> Looking at the commit message, that was an issue with the a "custom
> (non-PrimeCell) implementation of the SBSA UART" present on QDF400. I
> assume that was soemthing that Qualcomm Datacenter Technologies designed
> themselves.
> 
> It's possible that your SoC has a similar issue with whatever IP block
> is being used as the UART, but the issue in that commit certainly
> doesn't apply to most PL011 / SBSA-UART implementations.

That makes total sense. Decoding SPCR I see the following:

	# iasl -d spcr.dat
	Intel ACPI Component Architecture
	ASL+ Optimizing Compiler/Disassembler version 20210604
	Copyright (c) 2000 - 2021 Intel Corporation

	File appears to be binary: found 56 non-ASCII characters, disassembling
	Binary file appears to be a valid ACPI table, disassembling
	Input file spcr.dat, Length 0x50 (80) bytes
	ACPI: SPCR 0x0000000000000000 000050 (v02 NVIDIA A M I    00000001 ARMH 00010000)
	Acpi Data Table [SPCR] decoded
	Formatted output:  spcr.dsl - 2624 bytes

Thanks,
--breno

