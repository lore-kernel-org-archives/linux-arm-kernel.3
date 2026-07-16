Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC06BC4450E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 11:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZS4OV7y9NIUYJFnBVEIYqaeTmerirCK1BiprcWcFGEQ=; b=dQ6Lln3YwAwwMG+PA8n6F0kC0i
	qCgdxQbA8eW4ZCkcjZX6+BpfFButbYKcTIkC/jiYdSn4lq6lyE9jZ/ZY8TYRYXqz3Pp7UqRzoC/OO
	+QLYE3ijNe3XScFF4GZlVSBgpRByYztvYoXQ9Yg5mOi+t+V8QSftL3/e/BLEdSRquX7PqSUc58TeS
	I/swswKvqfC7AzO+wF8NVGhUJFTMznFs8CBpgJrzSLT6ywFD+6Q16Wj5ukJhhDyEOTnDGgf9LNYpK
	+Qu24HAPG0lB8o+XQQiEWynWMP6LXfLcj60uQ4mC/cCFoL/fzdHDAztv4iUfDC50KIKl6z4uKvq6a
	/8wH72OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKJt-0000000H8ZT-2kwA;
	Thu, 16 Jul 2026 11:32:01 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKJr-0000000H8Wy-1U3L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 11:32:01 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id E24F11D00140;
	Thu, 16 Jul 2026 07:31:55 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 16 Jul 2026 07:31:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784201515;
	 x=1784287915; bh=ZS4OV7y9NIUYJFnBVEIYqaeTmerirCK1BiprcWcFGEQ=; b=
	mNBj7gqdERkp7Bdh/UESryg7RcG4QAWOnyGrlGpQ1RGAiEYdfnvMFYeWvLuCB+zf
	fqxv9L9wcYaTlacPRTmYD3mS6P9JK38DCj6h95GvQhUXPyFWHCZ4PgdWyZ4xdmwP
	n0fEKiM12XQnwOFMu7zhGv90AUBBuBy6dsXZgmopmAXalENnOO5ZZJm3wIE5bjcM
	YuakBB+v1M4osjepcC0Melyd9UCGPTLHKG/37weJX04E3pYugw/vd43DIGDgmVQk
	GJEpQchWcOcJF/ILMUzIbVDLjWtabMExwW28SNGW0x82Gry9SYsO03LGaXMhbytC
	SWqLUiZE8VVlSAuTe+vqqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784201515; x=
	1784287915; bh=ZS4OV7y9NIUYJFnBVEIYqaeTmerirCK1BiprcWcFGEQ=; b=V
	JjFuKZbiVU5mB4Gq1RKZ+QPu4srOWZRaYQtf0pS6tNcaqZzb8/nXraVL/RaZuWnK
	lKxa1svk7OgSQJXTaf6TRCPR37I4vD0wbub1KhxY+4vQrFD5Ke89iafkIPSKnmIJ
	jKqO0U7vwNORt9d1Ldza8ZGdb2zGkZtUfvty5GpN8tJtQ96TVuAFNzbr/keuvPCu
	9qv7g1rlRJNmwqfWKch/fWqUAXmyihwpolMd5Yt/cZPin/PZwRD054KyjuEWGVnY
	fAUgHklVYjFljvhkUWp24iuuB/XB+2/HEaEhGkKmKHITdHBOTB+UkC+kAi/ifLWh
	uK2eM+xDTXgZg4rjWTCMw==
X-ME-Sender: <xms:K8FYalDYU8fxbZQk5gDYve2MIpMY4FmwywFAXsGv7Vfrcrxltr0TMQ>
    <xme:K8FYauXNWdjoszEmkCTTxxPwQSu1CN6H88uJaKvlhjsRN9ARaqPCZjepLgxVjO3dv
    wcUZGLoAUuZ_dLHs8c0AqKSipz1YDa_bXl4iGzCPrXxOq-guohYZKA>
X-ME-Proxy-Cause: dmFkZTEYozy+JV8WngqgKmZY6dkU/0PoKBXIq/3nQoC0jhRzf8//0LCZ1+KG7Jpc9sb1Iv
    HOyGLKW7W5+qSWkpoSWvR233YBuu8c9vRSgQ5/T3lVbRjFGUkBvxTupNsdYI/e5mbTnHhE
    6SDCCRuULBU6OEdSYDxFA/LLzxRU0B+UnDuK9DFqTJyJu5ecPFf/I9gOd5++1YPo5jb80q
    sBuvzpvnZjpXCrIgLsSNVCraft1O7G73ovt/d8zeRp0/ha/solJOVU0rq7d10u4iXHCGZu
    40/lG2brskfqYufESt1IjseaObNzlFyKxK89IMdB9QwzW1xs7UxUgQ7ObNql7vkmAIegEV
    LsA+5TbJg3jrHOPJCiLzsCVDktU3NSMauN+asUDddBzDB4JaynWVyipo1tAEwC3F4j8wit
    5t3KR3FI6ntqFWfvL6M46b0UDzE03lVe29VunJVH6v8TLCcd2/j4tC33ivcRTykSKCVZzU
    Z3KkVkn5DjJ0V70Grf3RLzPZrJMt9AXZd55YDLPM/yotIxP99eVGPxs0bXKRD0JkKchnlm
    2swK1Vv9wsi5DD1VGEoQhPQxcr2a/8nAyYPDJFow0R6ULX6nOlKkNVGf9aNTWpfZgk6sT0
    fMvsrmaAp66l2u7rbDtgRtblMbrsIDzjBeQ7roWE38Xqcq1p6a5gj7EYl0AQ
X-ME-Proxy: <xmx:K8FYavFJbqEx2LC4UNn9PkQ0Ujn0w6xfDsrMdWJlmZGNY0rvokuxpA>
    <xmx:K8FYarb8-Ig31ZWaTyANR4EcVJXI3NzlQ0tWyMvD40GQlKffgA0RkA>
    <xmx:K8FYanXbY2S2OIlr0AcfNmnSFx2mbenToHKDH8sQuUQP11mq2Ssy3A>
    <xmx:K8FYapmsdLDWzx2rl6qblyQE3K0vvlSvV53jVD12aOqEGvzYDM3fQA>
    <xmx:K8FYal9mVLI0xCnv3-4J7rJ8NgwJpcVVk-vuNh_9muXBiiwsRS9q2V9m>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7AEE5182007E; Thu, 16 Jul 2026 07:31:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AnORdmDlkYiw
Date: Thu, 16 Jul 2026 13:31:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: "Eric Biggers" <ebiggers@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org
Message-Id: <cd8cc649-c4e9-4868-b68a-6a9de72b32fe@app.fastmail.com>
In-Reply-To: <2fae9ef8-2ec1-48ed-9b25-8526db625732@oss.qualcomm.com>
References: <20260716100243.1604526-1-anshuman.khandual@arm.com>
 <2fae9ef8-2ec1-48ed-9b25-8526db625732@oss.qualcomm.com>
Subject: Re: [PATCH] arm64/defconfig: Restore built-in 9P rootfs support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_043159_831510_E656DCC2 
X-CRM114-Status: GOOD (  11.21  )
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

On Thu, Jul 16, 2026, at 13:01, Krzysztof Kozlowski wrote:
> On 16/07/2026 12:02, Anshuman Khandual wrote:
>> Commit d521c4ca039f ("arm64: defconfig: Switch Ethernet drivers to modules")
>> had changed 9P and virtio-9P support from built-in to modular instead. This
>> breaks simple kvmtool boots using a 9P root filesystem without an initramfs
>> , because the kernel must mount root filesystem before it can load the 9P
>
>
> And that commit explained you must use initramfs. Nothing got broken,
> because there was never a promise that a recent, virtualized environment
> must work on defconfig without initramfs.
>
> You fully control your software, so just build initramfs which is
> absolutely trivial and we all moved on to that for arm64 long time ago.

I still regularly boot KVM guests on arm64 without an initramfs,
but I just use 'make kvm_guest.config', which turns on all the
commonly used virtio drivers as built-in. I wouldn't call
9pfs root trivial without initramfs, configuring 9p built-in
is already complicated enough.

So I agree we don't need this patch, but there is a trivial
workaround for Anshuman in case he wants to avoid doing this.

      Arnd

