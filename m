Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFFBCD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 08:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jt9ibOwOB5ZgDpl28+OU1PXCAn8QfJTRE4dkW9Vb3BA=; b=gpPVyh6oh/3nACIs30qv2NV81p
	6ArsMHhW4LsveXJQz4bW37xg7dAn/uLexZF+mY81bYb654LvgndpLQ0aaTLb2sv1DXvigNBMCwURr
	f37KOZ0q8UvaGI1rSdIrRRir3GVRg4/F/fymZ1nFdu1J8y1RjK9euyI6Po166NoQ/JM/+ml18o5Y6
	bIK7L2PN6IVkwFqgQwZqYkyUzXho5LLUyK1K5lBonGMObYgtE2AzCIeuAh9k8rxUbdelElUvhXQvn
	eAOe8Y+lQo4oGomLVVOr90ImbS5FXD2xUJnv+CpAy5NIJ45ANhVhajwDpYLv2bgLe6DgEEjCalBX4
	F4vP0R3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMLY-0000000CnXT-0ZeH;
	Mon, 11 May 2026 08:50:40 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMLU-0000000CnWo-1wP4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 08:50:38 +0000
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 430FA7A00CE;
	Mon, 11 May 2026 04:50:32 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Mon, 11 May 2026 04:50:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1778489432; x=1778575832; bh=jt9ibOwOB5
	ZgDpl28+OU1PXCAn8QfJTRE4dkW9Vb3BA=; b=LOsTO+eQtpe3r741xaLkVQzRQd
	qFVi7ShFZm3E9V4HVFTs2engBB1peCRCTkcsD0yraXQwlRMRKu4s6BvVSBH3pnAo
	lpXTkMOxwHc++Yu1ePbtlTaWQXmYPLe4znOEnY1PBhwhQ107noiprFPjxFsjWwzs
	MatNSiXRgMR0sSQVyPkamJdYyaSMl5YxRSPXYuXvfCWNEEHbROVwO3vTaReMABXJ
	X0gYjzJxzEi+1dlZuovbWAhXEiA0D2oxudPXC40mWUm4b19e7+iFx/40Fa3l3YvC
	yl57CbxbGqinwINz7roMlvZuOtsEWa0cVFu7NmeeTojctnKREDXtVBIWIR9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778489432; x=1778575832; bh=jt9ibOwOB5ZgDpl28+OU1PXCAn8QfJTRE4d
	kW9Vb3BA=; b=pDcOPxMiiP5ruo2XWMZgzDesICesNWrkVL88okIX5UV3Kt+RM2Y
	z5zSlB27DO1Mj8/6VZGL81Y2QIPQs+78SPS+aQg/rJTvgIGEsr8Q0iGkGQyvugKp
	2v5jYFBuAp6dkiTUy7bmJjN4L4jyXWQjMN3QJuAlfIxvMVKc+67e+QqXWaEeFnVl
	56dY+NJL2BJKGZF2i3Kmr7jk+yXva6vD9F1qmtubeWpLtCroJrtR2T8E3ZRIs7if
	PdiXC6DUIIjx97YhuQxrs3eb4N2l51zKPSxYN2/FrzkNoKxWLFRObaGXAWa8Icut
	gTPns1BTdlFdxPEwa35mnsqKYwalSxsPwRw==
X-ME-Sender: <xms:VpgBanUU0ztE6Rg-LnfF-nLj1cnzfS7IVx_pJfHwnrFunw2lLxjcVA>
    <xme:VpgBaniKE3NTpGwNZJ7FrgQTac17ZUp80KiEjJu-T9yLVtwm5PK87KWrfCVGw1aDE
    JeLWDinbwjVeGkuqSLAN8Ddva10mmyA4V5rcZf1j4boMlSC6OHV5Lst>
X-ME-Received: <xmr:VpgBaqnO_1mo6YLpCVnG5FVMhaiuWArMrQjGIVkhgDObhcOFK40MwaajL9o0Rf1jMVMgp-RV8DjBsvZTmUi22EQFtzOKq8Iwi7k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudekhedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgud
    euffelfeekgeeukedtheekjeettdfftddujefhvdehtefgiefgledtueefjeenucffohhm
    rghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopedu
    kedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquh
    hsrdhnvghtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodguth
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhpihgvrhgrlhhishhisehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtohepfihimheslhhinhhugidqfigr
    thgthhguohhgrdhorhhgpdhrtghpthhtohepkhgvthhtvghnihhssehophgvnhgsshgurd
    horhhg
X-ME-Proxy: <xmx:VpgBaowxRkzlJZKgC0vwY4hQTbKM6iO9ervrzIr7KLryQ_5A28NGLg>
    <xmx:VpgBatsyZlEk804I0LAQVVS7ia5EDKHFyp4-Pwjhw_6Lll0JE7F-MQ>
    <xmx:VpgBaluhzmo_aN5ikDHnpeRe43hbMSuaKNGZGj4O_BkZY4gVVXhBJA>
    <xmx:VpgBajlqNeNxTrn4oktYtSPno1O2oZ3jnjrBdX7XdqiF7qzUmQk8hA>
    <xmx:WJgBavb1dT_Lmt3FGxmTxuK4B-v82xNwO1Npg8Xu56yNR40CrKn5tpUQ>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 May 2026 04:50:30 -0400 (EDT)
Date: Mon, 11 May 2026 10:50:28 +0200
From: Janne Grunau <j@jannau.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org,
	Joshua Peisach <jpeisach@ubuntu.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: watchdog: apple,wdt: Add t8122
 compatible
Message-ID: <20260511085028.GA192358@robin.jannau.net>
References: <20260507-apple-m3-initial-devicetrees-v3-0-ca07c81b5dc7@jannau.net>
 <20260507-apple-m3-initial-devicetrees-v3-2-ca07c81b5dc7@jannau.net>
 <85ea46a7-1136-4ea0-9eec-7dfa465df20b@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <85ea46a7-1136-4ea0-9eec-7dfa465df20b@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_015036_978054_3E0CC656 
X-CRM114-Status: GOOD (  19.44  )
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

On Sun, May 10, 2026 at 08:29:39AM -0700, Guenter Roeck wrote:
> On Thu, May 07, 2026 at 09:33:08AM +0200, Janne Grunau wrote:
> > The watchdog on the Apple silicon t8122 (M3) SoC is compatible with the
> > existing driver. Add "apple,t8122-wdt" as SoC specific compatible under
> > "apple,t8103-wdt" used by the driver.
> 
> '"apple,t8103-wdt" used by the driver' is not true. The watchdog driver
> only supports "apple,wdt".

It slipped my mind that
https://lore.kernel.org/linux-watchdog/20251231-watchdog-apple-t8103-base-compat-v1-1-1702a02e0c45@jannau.net/
wasn't picked up yet.

> 
> > 
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > Signed-off-by: Janne Grunau <j@jannau.net>
> > ---
> >  Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> > index 05602678c070..845b5e8b5abc 100644
> > --- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> > @@ -16,7 +16,9 @@ properties:
> >    compatible:
> >      oneOf:
> >        - items:
> > -          - const: apple,t6020-wdt
> > +          - enum:
> > +              - apple,t6020-wdt
> > +              - apple,t8122-wdt
> >            - const: apple,t8103-wdt
> >        - items:
> >            - enum:
> 
> I second Sashiko's findings that the driver will fail to bind because it
> only supports "apple,wdt". I would not mind and apply the patch anyway,
> but the statement in the description is just plain wrong and thus
> misleading. Please fix.

I would prefer if the addition of the "apple,t8103-wdt" to the driver is
picked.

Thanks,

Janne

