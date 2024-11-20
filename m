Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3110D6E2B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 04:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0rejVzUQ8KWXV5movCkOFjMtx+/Mx0idUJFVHrt9mc=; b=yFtUv0QI0r0vz9X878zBoxnAD6
	iBl7hIY2J2QckSdpUmcprEJCvKoow+3/J/Z6GixYFaP6t87jnpjNEFS0ryXiFKC5RbHo5I2vQr6gE
	PdzYHICH4IadZLW0Wg4mcaW+xVVCyPyoe6K35KuFlBhzjiu1Mk1Uht/OFv0THdYvAyBOg2afz15Kn
	ngTX+UqOX90CJrzi1jpg/FFRCux7YmiIhiwJHDIz7l0NcxJiBfnLkHC7FwxRm3Abo6PFl9Y42DxmD
	5iyusup8afu7qHZBzBwerY74YK5Un3tuxAvzzZ4La2pPUefaef/zOFh6Fb7w6dlXfuYSIUhTqJ2M2
	Z9umqiwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDcl7-0000000EOc5-18JL;
	Wed, 20 Nov 2024 04:56:09 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDcjP-0000000EOLF-3XEK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 04:54:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1732078461;
	bh=m0rejVzUQ8KWXV5movCkOFjMtx+/Mx0idUJFVHrt9mc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NvXLS/23phZOX0oazXs4Xv1vRCgMfkzmxFiB2ptYRe7mgYNjLB+TA0uCUFMX3lLt0
	 OdWVhkBFqcddqEvt0LlVxkQKBwKzKGDLyAGbg1UAww346BcgXd7qG/6KHHdeO4ybza
	 Zj3pDAQiZ9KF3qsFAFEp46bpmY2+rQIq7Jvk5SihOKZEEDcnz4ebdfw0jHkb+a44ON
	 cMjJ7xFGrTa1NblXj0zmPI/zgfoLxjKj+axuEaCzOGUIXeiIKimOLX0kL8+a/oLxXi
	 jPXESR1UDnEITr7oNggg5/MSGOLEk3fiXM8s2krf4/Cn5H5Q8AK5sKcQ6b2mJuW+mY
	 CKvW8eYkKhmsw==
Received: from [192.168.68.112] (ppp118-210-181-13.adl-adc-lon-bras34.tpg.internode.on.net [118.210.181.13])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9637766403;
	Wed, 20 Nov 2024 12:54:19 +0800 (AWST)
Message-ID: <1bc83ee73545f9aab6e0a931cda8f5ffe41cb445.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 1/3] watchdog: aspeed: Update bootstatus handling
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Guenter Roeck <linux@roeck-us.net>, Chin-Ting Kuo
	 <chin-ting_kuo@aspeedtech.com>, Patrick Williams <patrick@stwcx.xyz>, 
	"wim@linux-watchdog.org"
	 <wim@linux-watchdog.org>
Cc: "joel@jms.id.au" <joel@jms.id.au>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-watchdog@vger.kernel.org"
 <linux-watchdog@vger.kernel.org>, "Peter.Yin@quantatw.com"
 <Peter.Yin@quantatw.com>, "Patrick_NC_Lin@wiwynn.com"
 <Patrick_NC_Lin@wiwynn.com>, "Bonnie_Lo@wiwynn.com" <Bonnie_Lo@wiwynn.com>,
  "DELPHINE_CHIU@wiwynn.com" <DELPHINE_CHIU@wiwynn.com>, BMC-SW
 <BMC-SW@aspeedtech.com>,  "chnguyen@amperecomputing.com"
 <chnguyen@amperecomputing.com>
Date: Wed, 20 Nov 2024 15:24:18 +1030
In-Reply-To: <9565c496-44d8-4214-8038-931926210d0f@roeck-us.net>
References: <20241101121201.2464091-1-chin-ting_kuo@aspeedtech.com>
	 <20241101121201.2464091-2-chin-ting_kuo@aspeedtech.com>
	 <ZyUcIIb1dtoNhX00@heinlein.vulture-banana.ts.net>
	 <a0faca9a6ec7f4acdfa2f29b4ffb94b5392aea6b.camel@codeconstruct.com.au>
	 <TYZPR06MB5203053A004676F51322DECFB25C2@TYZPR06MB5203.apcprd06.prod.outlook.com>
	 <ed77d57facaaef0be796b4c6a742dc7bf3bff479.camel@codeconstruct.com.au>
	 <TYZPR06MB52039B02B6D3053355F30489B25D2@TYZPR06MB5203.apcprd06.prod.outlook.com>
	 <9a1e64ef-81d9-48b0-b871-ce4ff792eae4@roeck-us.net>
	 <TYZPR06MB52039DB39B62E6FA5220103AB2272@TYZPR06MB5203.apcprd06.prod.outlook.com>
	 <2531f830-6a36-4bd5-ba1e-9e19f0f66496@roeck-us.net>
	 <219607ab74764f3d47659fb5ab3223b3034152e5.camel@codeconstruct.com.au>
	 <9565c496-44d8-4214-8038-931926210d0f@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_205424_093195_782828F7 
X-CRM114-Status: UNSURE (   7.23  )
X-CRM114-Notice: Please train this message.
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

On Mon, 2024-11-18 at 17:27 -0800, Guenter Roeck wrote:
> So, again, what exactly would userspace do with the information that
> this
> was a watchdog triggered warm reboot ? Why would it need that
> information ?

I'll defer to the others on To/Cc to answer that.

My only position is I don't think changing behaviour of existing
drivers to exploit WDIOF_EXTERN1 as a graceful-reboot indicator is a
good idea either. Obviously I don't have much skin in the game with
watchdog maintenance, so my thoughts shouldn't have much influence
beyond the Aspeed-specifics, but I just didn't want to see some fun new
confusion or incompatibility arise as a result.

Andrew

