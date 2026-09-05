Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEEFC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 10:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5Pdm/fx3nduxQtcVl6TUYT4x3GVjZLFxT9EXjbWN9Q=; b=bpTFOa8cxCzjY5k1jA08s6OQU0
	EJQMdB++/JQ0N2TrTHn3glnYhoyWRmtSJGEUxnP+7sb6fSWfdmrOvq+3Ec+pqJzgQWY17oqQsOe7O
	nRp1D4xT98yE+7IDcOXlR4D1PM6CNKldxFa927TrwTeyEIBzPaPG/AM4FZZHwS9Oa/7p9dT2pKBcq
	0/0CPcP1NiFjkRH0jhZWLFpYS9Ujx1/X1TFxEV0ZnYwNplSOruq4qugU1y3xnIpSDcR7iYLkfU4uR
	xc2spRzKIkFJ7iNEdVjkQUvM5ZJ2zPP3izcOz37THnkHUcEUBOuZh+2uz1EwPmVVt/KIhjK6RMv9K
	5hnRDhAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2nOu-00000003yAv-0cHb;
	Sat, 05 Sep 2026 10:13:32 +0000
Received: from flow-b3-smtp.messagingengine.com ([202.12.124.138])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2nOr-00000003yAZ-2NUC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 10:13:31 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.stl.internal (Postfix) with ESMTP id 5C2871300171;
	Sat,  5 Sep 2026 06:13:24 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sat, 05 Sep 2026 06:13:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788603203;
	 x=1788610403; bh=s5Pdm/fx3nduxQtcVl6TUYT4x3GVjZLFxT9EXjbWN9Q=; b=
	DBmv3ukjHj8j07tSdPdiH2JToVRjL08m1iZ9+gfVrQkOxRirqWEpVPO0dhoxhTit
	vlZA5zwc33EGQG1ZSAZXi3lUknl/5DJRzQf2NX4iUoeF8dsXjZMRJ/rfKAW3dTbM
	ocB19jJRFzOmrinM4EL56NYHh3WJTLPEE9CzvtlbYCWg39Ejy7TRyv0tD9wL6YFn
	Kno1cq+OIXrKnoA1/PkX5ZR2NSb1Xoj/o5q8hRcd/uuV5ldsdqlCnW0m1SKEckOL
	w5zil5NSFXgDjBiXR0fTp8tPpEpg9t//zcgLNihKjXospRHWKFlWVJtTGstWDHE6
	Vh/BTS1ouJwc21jBSjvHnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788603203; x=
	1788610403; bh=s5Pdm/fx3nduxQtcVl6TUYT4x3GVjZLFxT9EXjbWN9Q=; b=E
	Ew/7r7RCyjkKYKLqQtjJYuiiklDYNyJGd/bIMC9EU/b2Trc7ALqDgkLfXUNPKeLB
	pc/uj4n27HoPuqRJcPcPAny680AGstHqeX7YrHiflBWf4isC3zsYlKZABk5s5rlU
	FaZjHlnSlcKaq8RKOHgzOjQvfz0IJEO45MpqmdzzbsOsUiVzFIlw/CI+w9wITLWS
	N6w2BNgP2DeQaG1P0R2RPwIcCBGoL5QNTPoXyo17j+NmjCbJ6fFSDZBDWExPQ4Qm
	SF7iHYDrplOZxUNuGl5hGCVZRmUUoH44ueRk9DuHqwIFj3oMmPWK5qgpcvB2zcx3
	ZRAEUQpGgw61f817YKwLw==
X-ME-Sender: <xms:OOubajGQ5QqXy-m5z6KqqMh_DsM201vWq14Cac6olvrdHCxukQn7CQ>
    <xme:OOubarI-BSpZ4yKtbuNGmaSZHfkq6ZQjcWoNfrxiqDld2e4QJ6uzzZdtRweCh70HC
    m9xkpxNEUpQ1WDsBepUILKRaA1irQm_6v7kSm8zUMkCSiaLCQTCnCc>
X-ME-Proxy-Cause: dmFkZTFs6JiRJZvxm+Ld1zJwu35HcCPfSmdka7WkN8Ycq24gzWFFqx4jqbfwmS2jZqJcrZ
    /FKINazIOWPInQNVp92+nCl0q1eQHggUKBKETX7255000VRkk3eEowI/hgJqD4ZygmGQle
    v6l5Zwc+LSWgWtAQCfMDwVuhcFRr128FqExoGbaXUz+Ukcp4CmTu3bpi89zpgdsBb2w6hY
    +eJh2+vjNBR5GrUtizfqE9tDxH0g97x5vXVH7A65/yUARxdMIDdWZuVS0p6RyBRQ34EGjO
    JHY3kJLUefCR2NFc9QAYL/UQWOLqHlP9IDrInmsA5rApTMpDseAV6Y7ddm0ojOYLyRpIp9
    AO/EH6n+bVRnttFc/ipehsxObz2bN55Rpje5y0lDCiXDzr/bUfEzRzOROxuQJj1XpAm+Aq
    N14iKjVaCygOKyYl56EUTJCnGyGXXf/asJIAzRfQgkGidaTx/JSFn5khrSjLnAX+auxi3I
    Rbt3Hxzt84YnDWyJrI+ma4GXalRQh0N+oEmLXXM00KnvNHYQM+lXzBVlxqZj3r9Gbiklul
    yPQzYhtzkNWacPB3LDGrSB93ax4PEz7OHFMfvK3LlQ0OvKNQte+Q8Gbx3++kXMaidlbLxa
    3Uuv2GSRu/n95VsKiA+kNGgU557ZSXHwr4TQjnILOFkmlGD4mgINRz6omONg
X-ME-Proxy: <xmx:PeubakJhdRASeqYGHwObHi7AA9xWlaBtAO0oi58Ajo8ITDg_K4rknQ>
    <xmx:Peubau9GbCtGRe3jCczZ2t9aQEbs2o75D-f-uvK0N9mgPwQnJowIBA>
    <xmx:Peubai-6UD1NU3KRKkytPQ4qQZPVxgOfn4gYncu-MUvnSUdljTKQjA>
    <xmx:Peubag844RG_ob2jwzAOnxef-mvias2paLjLAbXKSCUhchdjO4wzkA>
    <xmx:Q-ubap2micY-hE0ds-fPOYRjA8XzovD0Xa-3mFu5sdCjfr5pZU6DRXCb>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 41E7032A007C; Sat,  5 Sep 2026 06:13:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AhImxtAmqTw3
Date: Sat, 05 Sep 2026 12:12:51 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Karl Mehltretter" <kmehltretter@gmail.com>,
 "Jonathan Corbet" <corbet@lwn.net>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
 "Shuah Khan" <skhan@linuxfoundation.org>,
 "Randy Dunlap" <rdunlap@infradead.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "Steve Wahl" <steve.wahl@hpe.com>,
 "Dimitri Sivanich" <dimitri.sivanich@hpe.com>,
 "Mike Travis" <mike.travis@hpe.com>, "Tony Luck" <tony.luck@intel.com>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Tony Lindgren" <tony@atomide.com>,
 "Kevin Hilman" <khilman@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 "Dominik Brodowski" <linux@dominikbrodowski.net>,
 "Damien Le Moal" <dlemoal@kernel.org>,
 "Niklas Cassel" <cassel@kernel.org>, linux-ide@vger.kernel.org,
 "Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
 "Michael Schmitz" <schmitzmic@gmail.com>,
 "Andreas Kemnade" <andreas@kemnade.info>
Message-Id: <693303da-350b-4295-b008-6fee8bb4c591@app.fastmail.com>
In-Reply-To: <20260905094649.41996-1-kmehltretter@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
Subject: Re: [PATCH v2 0/9] docs: kernel-parameters: Remove ten entries for parameters
 that no longer exist
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_031329_670582_C0C2CBA4 
X-CRM114-Status: GOOD (  12.22  )
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

On Sat, Sep 5, 2026, at 11:46, Karl Mehltretter wrote:
> kernel-parameters.txt still documents ten boot parameters whose parsing
> code was removed with the drivers or platforms that used them, one of
> them (atarimouse=) since before the git history. One patch per
> parameter, each with a Fixes: tag for the commit that removed the
> parser, so the maintainers of that area are on their own patch only;
> the two pata_legacy module parameters share the last one. Each entry
> was checked with git grep for its __setup(), early_param() and
> module_param() handler and with git log -S for the removing commit.

These all look good to me,

Acked-by: Arnd Bergmann <arnd@arndb.de>

If you have a script that you can easily run on another tree,
could you send me the script or the output for this one?

https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=board-remove

I'm removing a bunch of code there, and if that ends up removing
additional documented paramenters, I'd like to fold the Documentation
update into the respective patches as well.

      Arnd

