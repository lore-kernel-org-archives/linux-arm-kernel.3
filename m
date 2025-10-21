Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B027CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 21:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSmc773k1ohUjKBtXPg8Ooubnfa2H2zZUHk2E3oNqks=; b=dF6SxTtBN/WysriqM19QnRYyh5
	zqr/EgzzeDQt6M1sqtSscY6+T4hRsKG3aJd9ERqkcW1VmzT9PIN++q7f9CSuE/DP8nvqNBHDv2Kgl
	nK9scV+SDWLtaWxMxukaL8jyFci7UUPwCqcnsftGGhofEvpy6T6BDCr7uo15nrE2hVUlZ4z8ryECK
	AZt3Q+blK6YXZMwy/jm6kIKHsaNEQ0A8TIgTbITV3vZMH2BM9CZbCZY22DA85kwRA2zeY3FqG9yFP
	RHzJ7DHEGMecWlpUb1RlZKR966vBlO/yo281wvfVV2Iw6LhxGre4B4vSHBlmWUZCM/Cve6aWwHMdq
	W8nZ5ivg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBK0w-00000000jNN-2Q9h;
	Tue, 21 Oct 2025 21:35:30 +0000
Received: from fhigh-a6-smtp.messagingengine.com ([103.168.172.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBK0t-00000000jMv-3fqw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 21:35:29 +0000
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C07911400152;
	Tue, 21 Oct 2025 17:35:23 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Tue, 21 Oct 2025 17:35:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1761082523; x=1761168923; bh=SSmc773k1o
	hUjKBtXPg8Ooubnfa2H2zZUHk2E3oNqks=; b=LDDwlNL/Civ8KvUV+4wSIqn9Fp
	dC6gnUKVTULSO8HojwWFrG0YZyvJvkw047KbdqBA7pfC00sxISkseQmGwM8ejAOE
	99UrKxGX2dVr3c3gC+DjTGIx7gUjwczI48oyUPRmuP6bFpRZS4oWtedTLRd6IALo
	1NhTCrbJvbY4KxFA0AJWSHCdhJHb1JW1Vm64AgpwnRzV6gpxaH1eLNqkyUmFz3N0
	f8GCTKCEaLeOLmz1SEjBIrPUGjcg2MUHuMOPyRBv+S335R3kR441Ij5gQhh+aTvZ
	9kSHQTNM8/8s8x5ZMPB3nmz5rpEKs9sh7GU+H9oXK2lB7VTeFTthCfJeHJ3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1761082523; x=1761168923; bh=SSmc773k1ohUjKBtXPg8Ooubnfa2H2zZUHk
	2E3oNqks=; b=trU68A4YzeRx8nSBoXV7wr6rGsygStp9hhqPoTrWvrwH7020yWy
	LbwZZQTk1JTQFfsyu7YxbX8GIQDPk4hF8h/qLr8e1zhJpVDaCn0gd+jvvHc/St8U
	PfTGJ7mUgGZQ5LLORJQiWSHFwv97yTDg8ML1SY5Ehe4Z8JJyFs5kp8VGijgdW12w
	H+q6zOyeZWpERBinzuxMlrx4mvf/1P20p36MaDEI1FyWT+5HWJGykX2U17KDxH63
	iuZk4CH7K6ZGiBXNSbr/Te3xOiAL2H0nqorV6bVY4LYcmqrCVlBbeh3pTiWs087G
	fIURyiYh/cVImYO19CBb9EWzpskuQ3u70GA==
X-ME-Sender: <xms:mvz3aH6CC7ccxitepgQOV4dRf5ycIb3MyGp5fup00yTr9aRmZcxk8w>
    <xme:mvz3aNR3WqFDe4caBONWo_J67I3zv6_Kgwz3EemEAqUyQhrxbPcQqCmnF4S39S-wp
    PzKQ_6NQAcYn3zqdXJ_tGN-swiq389HUvU72M0EfweI5HMXfgcT9pc>
X-ME-Received: <xmr:mvz3aPmKV8lSi3JXACietOeMwXek-wkDaW7hS6ij3kVUWd7Fu3q5gI9k3nMzzl27h7VZ18xiElJUB3-Q2apck-1pizG1VUQUTK2WKBWCyrun-YkCsA1vAkLbbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddugedujeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
    ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepvddtpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegumhhithhrhidrthhorhhokhhhohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    epjhgtrghllhhighgvrhhoshelleesghhmrghilhdrtghomhdprhgtphhtthhopehsvhgv
    nheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlhihsshgrsehrohhsvghniiifvg
    highdrihhopdhrtghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtohep
    lhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:mvz3aEKTfwowrvGhnvf4-EXiYQ8vvIQIVEZ1iWF8JuUJEl7pOxPTwQ>
    <xmx:mvz3aKQDpq6pdomkmnXR8DESBXdjiu6JkQoLsyLelbx_7tE1yw2-gg>
    <xmx:mvz3aKSM4MHm3ClKfeaqTHWz-nMYXtQafAIa1bNW_e28Sx97dtMPEg>
    <xmx:mvz3aEzXTHBa5YFFaUthIK9hhDlQyKhib1n9PXB56vtmvPVKipSSUA>
    <xmx:m_z3aIN6XjMCVaeHimR80BQvfCuR37CLmoygwdxALuTo15O-_yFWnP9x>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Oct 2025 17:35:21 -0400 (EDT)
Date: Tue, 21 Oct 2025 23:35:20 +0200
From: Janne Grunau <j@jannau.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: James Calligeros <jcalligeros99@gmail.com>,
	Sven Peter <sven@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 07/11] input: macsmc-hid: New driver to handle the
 Apple Mac SMC buttons/lid
Message-ID: <20251021213520.GA2546203@robin.jannau.net>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
 <20250827-macsmc-subdevs-v2-7-ce5e99d54c28@gmail.com>
 <qffp7kadq3xojla5k6f5pr37irgytqfsqvabr6ydvulxnkcgnn@bv5mrraxrhhe>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <qffp7kadq3xojla5k6f5pr37irgytqfsqvabr6ydvulxnkcgnn@bv5mrraxrhhe>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_143528_289326_A2376FAE 
X-CRM114-Status: GOOD (  16.13  )
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

On Fri, Aug 29, 2025 at 11:11:22AM +0000, Dmitry Torokhov wrote:
> Hi James,
> 
> On Wed, Aug 27, 2025 at 09:22:41PM +1000, James Calligeros wrote:
> > +static void macsmc_hid_event_button(struct macsmc_hid *smchid, unsigned long event)
> > +{
> > +	u8 button = (event >> 8) & 0xff;
> > +	u8 state = !!(event & 0xff);
> > +
> > +	switch (button) {
> > +	case BTN_POWER:
> > +	case BTN_TOUCHID:
> > +		if (smchid->wakeup_mode) {
> > +			if (state)
> > +				pm_wakeup_hard_event(smchid->dev);
> > +		} else {
> > +			input_report_key(smchid->input, KEY_POWER, state);
> > +			input_sync(smchid->input);
> > +		}
> 
> I believe you should be using pm_wakeup_event() in all cases so that
> pressing power would interrupt suspend even if resume() handler has not
> been run yet.

pm_wakeup_event() does not wake from s2idle. pm_wakeup_dev_event()'s
`hard` parameter is explicitily documented to wake from s2idle. So using
pm_wakeup_dev_event and use `smchid->wakeup_mode && state` as hard
parameter seems the correct thing to do.

> Also I do not think suppressing KEY_POWER is needed.
> Userspace should be smart and decide whether to shutdown the system or
> not when receiving KEY_POWER depending on the overall system state.

Not all user space. Using the power button to wake from s2idle while
showing agetty's login prompt on a tty results in an immediate shutdown.

Janne

