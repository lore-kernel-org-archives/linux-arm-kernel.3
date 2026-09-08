Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AC1C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGYd+rQCgjkao3/yCaTGMnIYCgUWSxU7FIhmSF4cIF8=; b=3ASM2UcJvaSckKqJgw3I+sbuKz
	RKeOat3PexIW+8ZKEe0uc2I67FKp6F85cFAdQiQHRs+JY5JUUpheFazssyum/w/QwNO3Vm+QbCNur
	ACk1qwYVWxmBgKVhU3fLz9ZiurBfdU6xtqL43dI0ipBgUfA6v6fI4a6kZf9ilys70YMR+Pp6TaosM
	SkzGku5DDIqHb3JSccw0d6PlwQGyQPI7F+qCpu96s9w+DTagHZM2VD7PtvTcXIvKxK0eT20Jj3Pph
	xUeIZz1CwYU5pAoIRAzuKdccwQjHdbJ14cRGKtzeRR3ABpB4hMz3qdzguTFYMIQLu3yLj2ZcEZLZI
	6IAD2oIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zDq-00000009kuK-2SwY;
	Tue, 08 Sep 2026 17:03:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zDo-00000009ku6-38ff
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 17:03:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AGYd+rQCgjkao3/yCaTGMnIYCgUWSxU7FIhmSF4cIF8=; b=i4FLByEEOThxOI6ywA4aLwVdyC
	wJQd/9h8530/DelfJV8gyrziZw5HW300TNFDu6zi9rcaZJC8YB4F5DnNWO0UuajlnGs77+LLlsHDA
	SdxcxYRuMc+rcanw0H6ZtYrzPL4Er/tE/JCGQj77nYE71EcOHX1CE5J6hlNZbgJOaMufFmGZXlUmI
	2+WuQ+MfgI+7EbWjuAufyvmIodOjXCrvhHUO8EhrulaLhm/UvF+SYAXol5cEtCfsHsmE4kQEeHBYd
	iEQfo3jypJ/36VWkfPJFoSMrnsPtKplnyUBI8tiVmWL7fQaOyDabBD2gqJeAkDqsbCSxRHG18fJOX
	XRGOumgw==;
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3zDl-0000000086c-015A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:02:58 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hfVcY4VJ0zKmBJ;
	Tue, 08 Sep 2026 19:02:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788886973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AGYd+rQCgjkao3/yCaTGMnIYCgUWSxU7FIhmSF4cIF8=;
	b=TqFlEQnkWFqKxLex8B2wSekOTQcR6ayWhtXYsy6AXiWckFa6v/RTPfD9v3pCENsy9sxZuJ
	DAT0s4XhiDmmv+D+2W82cF37SJvOwNfNhhtVNcEoABUFMZ1s3aotqX5Wn4DDUA8ozNAd6K
	AnAoQ7ySQykkiOfpfUB5sBezRU3AFk9SiHXUGs5ui9VfJCgnQ6xrJP8HWBRB3v9KwN8gnZ
	6XWzY2GEScMJ7IRhrXdeMsTtuKeuTXnvlaN0gEtTJJY2MjQNAc2yD3bMyvjfESFAmovP1D
	xmyUbmZ5h9DwtLayOTx36bsK/8wfsNItc+s7QknPT6cxBT0FcnfEiFfU5nUmag==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="btXuODU/";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <f82ae578-fbe7-4834-bdde-d11e194a507f@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788886972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AGYd+rQCgjkao3/yCaTGMnIYCgUWSxU7FIhmSF4cIF8=;
	b=btXuODU/rON3VYbUzoq1r4Zc2wUGnIAZyui65W4IqOP5VfNQf/z+EJL6fB6rIj8HRoE96+
	7SHLRW7C4taIqEQaRWUGnYt257F22sFhlD4I+DlE/s0oawNnY+1XXmsxCBtsN0cbmhRq/n
	DM+Mh4c8v/vwVlkRdjWJiyGH6dFJZx0O9OzrYRZYphhtQf1cbBsRiAyBYn/UyvdMZapKQK
	GPTzhoi5BuAfxmAuSS+3pel2vaUucFi+ULeBEmRW1l0EREklsKoqNUp5YGuwqSjhfJ3rd0
	fia9me7c1b3mQN+ivWz+LqEub8TSyHigXuLcYdJvmdlKdTchUye9qrvhlu2X5w==
Date: Tue, 8 Sep 2026 19:02:48 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260808025724.131943-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWvLX7OZSkfEBA34wKtnoZ4asB6rWFJiLa=2+=fezqsCA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdWvLX7OZSkfEBA34wKtnoZ4asB6rWFJiLa=2+=fezqsCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 482d1e84623c9fbc314
X-MBO-RS-META: nidfb7db56db5j1paino49m7hhpf1mit
X-Rspamd-Queue-Id: 4hfVcY4VJ0zKmBJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_180257_173250_87B94FD8 
X-CRM114-Status: GOOD (  12.81  )
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

On 9/8/26 2:02 PM, Geert Uytterhoeven wrote:

Hello Geert,

>> +&pfc {
>> +       msiof0_pins: spi-ws-2ch-canfd0 {        /* SPI_0 */
> 
> Node name should be "msiof0".

Do we also have to fix up 
arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts this:

"
  755         msiof1_pins: sound {
                           ^^^^^
"
?

But I wonder, shouldn't the DTOs contain unique pinmux node names, which 
cannot accidentally overlap with the base DT or other DTO node names ?

>> +               groups = "msiof0_clk", "msiof0_txd", "msiof0_rxd";
>> +               function = "msiof0";
>> +       };
>> +};
>> +
>> +/*
>> + * PWM1 uses PWM1_B pin configuration for pin GP2_13. This conflicts
>> + * with SPI_1 CE_1 signal which is also on pin GP2_13. Disable PWM1
>> + * in case this hat is in use.
>> + */
>> +&pwm1 {
>> +       status = "disabled";
>> +};
> 
> Please move this node disabling pwm1 to the top, for compatibility
> with dynamic DT overlays.
Could you expand on that a bit ? What difference does the placement of 
this node make within the DTSO ? Please pardon my ignorance.

The rest of the review items are addressed in V2.

Thank you for your help!

-- 
Best regards,
Marek Vasut

