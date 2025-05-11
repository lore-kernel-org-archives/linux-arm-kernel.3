Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC713C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 10:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cV+CqJ2sR58/2GW2HDcotcUwO0tRQwcrM95nei+5RVc=; b=a1D31t2NSyneBUzvI/wf7ztHy6
	ke9rYnWJcRNQLN4ed44W3+wc6VNVmzBwNnKAPDn96G0rtUguEcHicVv+wggEcOel/jddCJfsLWnyT
	DUMWYJj0e3HsMvusBD6dHeETyUR0p/EMsY33G1AxLAdinZNo6RfUocnV9XDcxfESlRh2yVHI8vix9
	CoQmqqp2MNcGbhRsm6jkKIipyIlDES7p0A5CvGX2RO1W1yqJW8TxVVLY5hSG8z7v5vdp5rMVSSxoy
	Tfn0jXZmet3zUs19wGOuYDiYfw/D7u937jSum5MBx5gGM9d8rcNlKC7AN0SUWc9zTveMKWdiedip5
	8Q6WO8ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE3lw-000000074rc-2qSg;
	Sun, 11 May 2025 10:19:04 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE3iE-000000074Z9-2D5l
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 10:15:16 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 0E41911400F6;
	Sun, 11 May 2025 06:15:10 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-04.internal (MEProxy); Sun, 11 May 2025 06:15:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1746958509; x=1747044909; bh=cV+CqJ2sR58/2GW2HDcotcUwO0tRQwcr
	M95nei+5RVc=; b=dBVe67lXrNSWSmfmKAbaBz4/sqEcMnCBISmSB32wPnaJBdj4
	+G1pyzvsyCnhq10UP92fVtGmjM5ueVoNOmp+uu9utLnTTiYWlvFkZVdnwnTBIfkz
	Ji+pUNNmgQK3OWgVD6DD3iuqWh7ftAi22kGaX4Yq4faOlglSSwvfHy3sI/DWP75j
	0kgxc6feGAVxTVBPDNcCDjhB9ukrkzd6bYtRcfsj5jmx6IvNbvTgfJAu6pnkN+Rv
	/mFB/UpIwJzK975Jhb71VMshgWMuJbw+q1vELE9Iv0UB9jCSk6Q3veU229zUwVte
	XmkmTnbPJknwv85vaikliZ6tfWXYZEwumAVdtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746958509; x=
	1747044909; bh=cV+CqJ2sR58/2GW2HDcotcUwO0tRQwcrM95nei+5RVc=; b=e
	ARh53/ipxqudoE7Kx5TComMShvZsuDuvuIpZkzKavyOXP4VFgRtuu8gQLZaiCRMc
	8VxIQID21/kk/nJlTYkSmIDgAIYRnXNKe3VrMHftnhFEXSsOA2dF8w8Wnz48MHOw
	JGe76DkS21VozvW1xTmDLUzXdjI5Q9iXdkkO9EtbInxemgifibhY3gCjItBSeYNx
	rBVr12iTq2l6lcNmfZxzVM5H0RZpxsOSi5swvV+om/IpeuORqVpccY6xDTdUX3EH
	MHFTJVJevXsO2mccsa6Nmif0u4WaFda3IKPA7CvRAjbTQC+uGZPlf0ZJ2urGA/PY
	NgL2PGYT6THdVlJDzzMew==
X-ME-Sender: <xms:q3ggaO0qrEf7AfPcxgAhV_4QTRZrwThYeSBOtnpoBPpOvAZ-djIx6w>
    <xme:q3ggaBFRUZMDlh9ceevrv2RCzzXyDaO7FceMfX6QVhfKB5NF-WjiICVU1HuE7nmWe
    VQByCJnWafxEhZdVt0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleekudduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvth
    gvrhdruggvvheqnecuggftrfgrthhtvghrnhepleefteeugeduudeuudeuhfefheegveek
    ueefffdvffektdffffelveffvddvueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggp
    rhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhmkhdokh
    gvrhhnvghlsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepsghrghhlsegs
    ghguvghvrdhplhdprhgtphhtthhopeifrghhrhgvnhhsthesghhmgidrnhgvthdprhgtph
    htthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtthhopehjsehjrghnnhgruhdr
    nhgvthdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgvvgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepmhgriieskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:q3ggaG4igTnPWHT2ytCAlkCxt2qsSTjbTCgVlWXLGA2Aap9ZBRFtQA>
    <xmx:q3ggaP3oNedhlr9WMSbKBbbZoOQ-Zp7jU6WhxYL_XZLzcw3tRkv6gQ>
    <xmx:q3ggaBFGx0ys088vMTLjsa5tvs94U616_aItSTuxW3lYg5tokEOYfw>
    <xmx:q3ggaI-3XpB95lGxgwa76HNTTGouranUQEu9Qq6z9lPDtp7Ipmtq_Q>
    <xmx:rXggaLfR6dFUBzPlbcQeP94Q1N4fjgXUnLJzjJef-Tf-n02itAHvXc7c>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B3EA41C20067; Sun, 11 May 2025 06:15:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Tee5e6786d5fc82a3
Date: Sun, 11 May 2025 12:14:46 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Stefan Wahren" <wahrenst@gmx.net>
Cc: "Janne Grunau" <j@jannau.net>, "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Neal Gompa" <neal@gompa.dev>, "Hector Martin" <marcan@marcan.st>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Sebastian Reichel" <sre@kernel.org>,
 "Lee Jones" <lee@kernel.org>, "Marc Zyngier" <maz@kernel.org>,
 "Russell King" <rmk+kernel@armlinux.org.uk>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
Message-Id: <5a0263f4-1073-45a8-a8aa-76028a2d0b6e@app.fastmail.com>
In-Reply-To: <678528db-67bc-4bb7-a866-7b8aeb4f4510@gmx.net>
References: <20250511-smc-6-15-v5-0-f5980bdb18bd@svenpeter.dev>
 <20250511-smc-6-15-v5-7-f5980bdb18bd@svenpeter.dev>
 <678528db-67bc-4bb7-a866-7b8aeb4f4510@gmx.net>
Subject: Re: [PATCH v5 07/10] power: reset: macsmc-reboot: Add driver for rebooting via
 Apple SMC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_031515_204457_13B1C860 
X-CRM114-Status: UNSURE (   6.64  )
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

Hi Stefan,

On Sun, May 11, 2025, at 12:07, Stefan Wahren wrote:
> Hi Sven,
>
> Am 11.05.25 um 10:18 schrieb Sven Peter via B4 Relay:

[...]

>> +/* Helpers to read/write a u8 given a struct nvmem_cell */
>> +static int nvmem_cell_get_u8(struct nvmem_cell *cell)
>> +{
>> +	size_t len;
>> +	u8 val;
>> +	void *ret = nvmem_cell_read(cell, &len);
> in case this series needs a respin, please rename the pointer (e.g. 
> buf). This is very unusual, because ret is usually of type int.

That's indeed odd, I'll rename it.


Thanks,


Sven

