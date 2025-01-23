Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996CAC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 21:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0s0TZa+/AGyLnRciIIQJMh70Ve7Kbe0zJYWKJjLqkb8=; b=rretcynGumm+bsnjkhWmCmkphQ
	OvqGMTkEV127zWFucZ0xwZHa8k8nTQoGZBKwUyd9UkTAhdUC/rIhn/rI0K1sDyEQGYrKi+u2jrFL2
	lMhtNh0eDh2Mz2xBEdFtzcaGMkNqmZfNYIi7QVpWIcyE6dSPVp1zvHSpkedObqCmhn6S5U8yiPyCG
	d4o8CvOVK2wy0bjBWW+1ZFxKuzlss4h05FsGS2Fouwd2NULyTopc4d/ssxCma0T8Topoy8c5fRsel
	hKxqmwO8sGf86ps4/X7IKAHsX+LBj650K/8vNtgDjpFy3612awan05NTRJH5kC7vuAJdwtf7AmJKj
	CfRMR61A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb4b5-0000000DIzS-40xB;
	Thu, 23 Jan 2025 21:18:43 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb4Zn-0000000DIrD-1yoz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 21:17:24 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4YfDKr5kypz9shx;
	Thu, 23 Jan 2025 22:17:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737667040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0s0TZa+/AGyLnRciIIQJMh70Ve7Kbe0zJYWKJjLqkb8=;
	b=WvQNHbq4j8rQgx3062nPCIrAGnJAfSO0aiZVO+VH8YQ6cJR+o1tOO2q/vDaooICbfPaWIn
	MItViy4l/9XMuPURQtf4gIiPfpCX1iJOzaQ1zYi0u40qHovH5CVu5UGfdgdTZv45OOsSnT
	NWAkGg6trRpCCkdPexD9NYQ0WAqIBjB8tCnCiOXQtP/we8JHBkEGIDsTwpfe+C0J9BpV8r
	Eo1BUm8+i+5/a8E5KE90H+z/jZWnIsGmoiRlwvZcdsQqkk9kQ/ej29ygsStWPC9xwsFKNc
	wzreymoFF+h2YzBh807jFEcRIEelWXBKZeK/Z34eYGWegM60yMXUJr1efcQEgA==
Message-ID: <9e67bdc3-2cc0-4aa4-90bc-252b9771b7c5@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737667038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0s0TZa+/AGyLnRciIIQJMh70Ve7Kbe0zJYWKJjLqkb8=;
	b=HDwg+EtbMOzheeMO5hhIMqvOUVG4e7dkBGsK+yC7cko0KGXTFXI7BMl3owDF1wilH6dBsC
	OPUA/9XKaDEH/HuwMs0QR8dXyGwNx0LoH62Y638+j9Y3+7+fFzVw+VgvqsHPQYERz0Yb2x
	SPezR6aSj6O5Gk8L2DEtjOTN/4S7l6knR99eS98xHJ/C4X62N4W/NYnSRC+ZEEwui/qyN7
	qIFSyzB11PDLhQwMj2cFeVVAI0ot1+G4g6b/yHy0bijGzJWTkvVmsRWZCrpIO+mei0od5H
	bvFpC7n/nKT+oza18QtDduh4Naw1SsBAUsHkvNumGvlFcCNs8wSh5vq3ZLeVdQ==
Date: Thu, 23 Jan 2025 22:17:15 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: r8a779f0: Disable rswitch ports by
 default
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <c4688de8e3289ad82c2cd85f0893eac660ac8890.1737649969.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <c4688de8e3289ad82c2cd85f0893eac660ac8890.1737649969.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: afqnogrz6g1bge85jhodgssiuee7ym7r
X-MBO-RS-ID: cbbdb80942174f9b945
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_131723_663904_0BDFAFD1 
X-CRM114-Status: GOOD (  12.36  )
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

On 1/23/25 5:37 PM, Geert Uytterhoeven wrote:
> The Renesas Ethernet Switch has three independent ports.  Each port can
> act as a separate interface, and can be enabled or disabled
> independently.  Currently all ports are enabled by default, hence board
> DTS files that enable the switch must disable all unused ports
> explicitly.
> 
> Disable all ports by default, and explicitly enable ports that are used,
> next to their configuration.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This is similar to how Ethernet switch ports are handled on RZ/N1D, and
> CAN-FD channels on R-Car Gen3/4.
> 
> If accepted, I'm wondering if I should move it forward, before "[PATCH
> 3/5] arm64: dts: renesas: s4sk: Access rswitch ports via phandles"[1],
> which would become slightly simpler.
> 
> [1] https://lore.kernel.org/all/20250118111344.361617-3-marek.vasut+renesas@mailbox.org
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

I don't mind either ordering, but please keep in mind that 5/5 in [1] 
has Fixes: tag and it is already overloading that tag by pulling in most 
of the series as dependencies .

