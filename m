Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C30C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 10:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJnV+cllfeOv0VeeSIei/FJsmHfrLvqxs1SP2W1tkwM=; b=UOOCTpJq5lP+xjQ/FttXDBBRci
	s9HlGAZtKlmP2X0LIGGQqKLHUOYJEn+76WeHHhIGyA2ureWDPrTOGTbSZ7eJqasClcykqFgEoctzK
	r/nx+xB6pfYBMsuvd+5GSoWVrXX5WqxYYC8h80953mgT7ur46ciYAHw3JaKNfG/MYJGV6CJ2i9ktS
	yrt2t3TUbRMDH/HVVOK5EvdgX7s0ES6CXeViJTFCJTTLB5E1p86xv79mb4aY9CvVaDon1E4BsdioB
	/K+ol/iKbZV1UjR+/g/Wl4HvPWT+Og6biwOOHbls8oW5VDWz0UcGYvUCHQBpOK+K62jkZ0ReBYVew
	bqB5ZPyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzttG-00000005aHz-0uv3;
	Fri, 28 Aug 2026 10:32:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzttF-00000005aHq-1dg6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 10:32:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8978041879;
	Fri, 28 Aug 2026 10:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6BE21F00A3A;
	Fri, 28 Aug 2026 10:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787913172;
	bh=UJnV+cllfeOv0VeeSIei/FJsmHfrLvqxs1SP2W1tkwM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=SNV6cJmDYmhTes86sL7gtL7NvJNpQ7h1iJs/ndBn7MU61XXbmDVf5lkSMp5w1mTHv
	 mbcdaS/PQLenxgIV9vh4IwivYCB/wBL7dlVCzWj/o2gl+Lv5KZx4g+cVdnGsd+8qBx
	 Ec3196EYuYG2p699hLeMSxAiGj5H7oBp/2I1ZL+R8+XCKueUCWCHPBEsogbu4IyoZf
	 ahpfJ7KzyHPTPSAkpKkvTLmwJyC2GjaLAAsacCDZwJLpDV6slRaTrWiw4lQASMYvah
	 CLOCz/lWMBtzVEV3br7+YEXVVWqoagtgAqJn4q5o4rGKjcKW9utcFmPaTkz713qzYD
	 UDY4e8CjtLQJQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 4B445198003A;
	Fri, 28 Aug 2026 06:32:50 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Fri, 28 Aug 2026 06:32:50 -0400
X-ME-Sender: <xms:0GORap9j1MT_suefMlkjp33LUpCrzOlygw7ZXkoliwh4hEDgKCXYcQ>
    <xme:0GORaogYEjTsytuYcqTjoMuVVuO-ka7PS88C1PQYYsPRYaaWmVTNBxCOsAAB74A_j
    rg4r0hEnF60I1m1VUAoUorgZwpp-ZGT63ZRc9GzkZh2kmbhxwOSXeEK>
X-ME-Proxy-Cause: dmFkZTFZLtHyc0mfoLhyYS2kAfo678+yTRdZrbHWl//oP8sLV8EWFLfFZ3lao6PZpFjixZ
    WOeEAwEfA7ymvmUzQAGYm+bBEfMXiH8VpjDXsvRjl2uniLh63jJT96oL5pk1E2IA+ARxIW
    xAuAOX2CCYFzBRMmXQnOQtMSzcwO04OSiFHrv7FsTJCynFXyS2sgihBhrLIFaLRCEuxQ/1
    22aOWCbwfQ1rqlQwPMx81AL/aH66i4KQEmI6LYniqDFMUwKKIWWRkfQO9EN3wtNTJvrjCt
    wBFX5nDQgHQinLndZ1fp7rMxlP54kCFtgdhg6e7iiPfrRw15cGYR5JJbE1EI3xDoQHfzfa
    VmCgzDzuKxYHhmbdAXTxW27+GCagvcK58UPLxLurAAgifxKEKiVtTvg3ErP4iUvRJQPdA3
    K1pED8g5b3DGfH29/Z25lUg2yFnxq1Ty3qpwn+H2no6FxA+PWJMP8N0GaMocPod1nXSPZF
    6D5wNQndPO2JylJpu8WZ+cTk52FCGaxZyzo5KC+1vRtBVpOEZ9zua/GBzItlHkLvWvWzXL
    6cA8vB5QB3eEep/XX4BhZi0rW23O/+g+KeA4ssaZDg9yiBBb7q+KN7ewGnFLBJps3JohZ3
    1pi3tVl7WwwRgYaIVN6e2lkyG9hfFLp4fMeIByf3KTGX5TzBnCHuSaSn88cg
X-ME-Proxy: <xmx:0mORareFdZLu45K-4oivNGhH5lPQTcrtP14-RsP9S1ZwEhuRffw-RQ>
    <xmx:0mORatNWmMmyARe6MiJoV-l6nuZqJwd44ZU7y2hVIVR6tLn6RMwjxA>
    <xmx:0mORamvaJTvNhfXEX_cH8iw7wLaejBQK0tfBmvzXt9-JxO8mVZrySg>
    <xmx:0mORauABsogHBrkn5DhDRfufz8Jt0bxzsu6gknAo7b7XTx8EcN0kGw>
    <xmx:0mORalbhF6NkTBzKNpdSHdEyrj0iGwQIEkRubrZah8RUCbB9PIR2e_r3>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 53211F8007D; Fri, 28 Aug 2026 06:32:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 12:32:27 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Bradley Morgan" <brads@mainlining.org>, "Will Deacon" <will@kernel.org>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "James Morse" <james.morse@arm.com>,
 "Marc Zyngier" <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <4cc971de-2fc9-496a-a5f5-002bd6b6bd43@app.fastmail.com>
In-Reply-To: <20260825205839.14571-1-brads@mainlining.org>
References: <20260825205839.14571-1-brads@mainlining.org>
Subject: Re: [PATCH 0/7] arm64: hibernate: dust off the suspend/cleanup rework
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

Hi Bradley,

On Tue, 25 Aug 2026, at 22:58, Bradley Morgan wrote:
> Everything object compiles and passes checkpatch and sparse. I could not
> boot or run a hibernate cycle on real hardware here, so that still wants
> doing before anyone gets excited.
>

You can easily test hibernate under QEMU/mach-virt: just create a file on
the host, mkswap it and pass it to the VM as a virtio drive (e.g., /dev/vda)

You can then swapon it in the VM and do 'echo disk >/sys/power/state', which
will perform the hibernate and exit QEMU. If you then restart it with
'resume=/dev/vda' on the command line, it will perform the resume from
hibernate at boot.

I've had a go with your series on a NV capable system (Mac Mini M2). Without
the series applied, I can hibernate and resume 4 vCPUs without issue, so it
is not entirely clear to me what your series intends to fix.

With the series applied resume from hibernate still works - I did see one
intermittent failure where the secondaries failed to come up, but I only
saw it once and so I cannot say for certain whether your series triggered
it or not.

Tested-by: Ard Biesheuvel <ardb@kernel.org>









