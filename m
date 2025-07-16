Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D84DC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 13:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3sNMrCCvmOrN1UDF9Di67oG7Y+yXP/L+hr2KnWDbfcA=; b=0a5EoVfC44Ixn4gYqY0BtqlhQ1
	2KWdksBRpxBpy8rsKIHdPhcQU2q9DSPWJN7LwOXxLlvc3mayJVcC3QJMQQlu64TEOQP2xElwIT1ow
	ogcvRSf2MZe6XJ9DWgPRdYYJRg9N0ytCxKFiWbzDIyFuwI1/zIB2YJab9qttQ7mkWUmrsL9SaMd1R
	xJE6K3xmALnPEZ+J735+G34yKQwMzaNgO0qMsNuFCj0leOieRwYFqdx3TQhqPaqKpqfCQBkf1GXtP
	vl6irvRCEK61eTlEM4VknZZbioxTb7EQGbFCBHbprKjZ3TCFMj+QF425gLFXbRk0WUkZvPf2rHKIy
	wl1IWi9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1v7-00000007lSK-2Kmo;
	Wed, 16 Jul 2025 13:11:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1se-00000007lEI-2Fvf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 13:09:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 915686146C;
	Wed, 16 Jul 2025 13:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E068C4CEF0;
	Wed, 16 Jul 2025 13:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752671343;
	bh=3sNMrCCvmOrN1UDF9Di67oG7Y+yXP/L+hr2KnWDbfcA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=qoT5j6+1E+4dAhDM8fkvRfa1Cauhp+Xezx0aCuNnSDbx44WDevi6G73dQek5rXok/
	 kFlLhnneEjgTYHyGgbcsaLBbsBtxh2AjMopEU1GZm0u7r8Os+AFc7FB5jSkJkyX7Yq
	 UCGdlHQ13qNUFlCtay6Nb/M8yumZ7RqP+ILSPeg77g93aQXPqLBpxl+9zbA9sXEZ4/
	 AJ2EjjlF3bWMDt5qNorXKBDqbipsOJ6vy8F6+S4pwjU9RpSiRQ698EPinhuiSMSoBH
	 y25bfeXl28Z1KFe3fkdPJl9vt6Dfq7oPZkcsN0ZG8P4AUL9gyJXYQ/THXpT1IV61+H
	 eQ6y6pL2YMeYg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Jul 2025 15:08:57 +0200
Message-Id: <DBDI4X0LDTPZ.16PODOZINXKEP@kernel.org>
Subject: Re: [PATCH v3 00/24] pmdomain: Add generic ->sync_state() support
 to genpd
Cc: "Saravana Kannan" <saravanak@google.com>, "Stephen Boyd"
 <sboyd@kernel.org>, <linux-pm@vger.kernel.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Michael Grzeschik" <m.grzeschik@pengutronix.de>, "Bjorn Andersson"
 <andersson@kernel.org>, "Abel Vesa" <abel.vesa@linaro.org>, "Peng Fan"
 <peng.fan@oss.nxp.com>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Johan Hovold" <johan@kernel.org>, "Maulik Shah"
 <maulik.shah@oss.qualcomm.com>, "Michal Simek" <michal.simek@amd.com>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Thierry Reding"
 <thierry.reding@gmail.com>, "Jonathan Hunter" <jonathanh@nvidia.com>,
 "Hiago De Franco" <hiago.franco@toradex.com>, "Geert Uytterhoeven"
 <geert@linux-m68k.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
To: "Ulf Hansson" <ulf.hansson@linaro.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <CAPDyKFr=u0u2ijczExkntHK1miWZ6hRrEWBMiyUwShS3m6c29g@mail.gmail.com>
 <DBCI05B4Y2ZX.VM9KNB61PGU2@kernel.org>
 <CAPDyKFqUHmMi6tBOJyA2YAOYLX-c_kDMskyRTC1Q+c9B4q_g8w@mail.gmail.com>
In-Reply-To: <CAPDyKFqUHmMi6tBOJyA2YAOYLX-c_kDMskyRTC1Q+c9B4q_g8w@mail.gmail.com>
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

On Wed Jul 16, 2025 at 2:46 PM CEST, Ulf Hansson wrote:
> On Tue, 15 Jul 2025 at 10:50, Danilo Krummrich <dakr@kernel.org> wrote:
>>
>> Hi Ulf,
>>
>> On Wed Jul 9, 2025 at 1:30 PM CEST, Ulf Hansson wrote:
>> > I decided it was time to give this a try, so I have queued this up for
>> > v6.17 via the next branch at my pmdomain tree.
>> >
>> > If you encounter any issues, please let me know so I can help to fix t=
hem.
>>
>> Can you please address my concern in patch 17 ("driver core: Export
>> get_dev_from_fwnode()")?
>>
>> Since this has been applied already, a subsequent patch would be perfect=
ly fine.
>
> Hi Danilo,
>
> As Greg and Saravana were happy, I didn't want to hold back the whole
> series only because of a minor comment on some missing documentation.

Fair enough -- yet, a brief reply asking if it can be done as a follow-up w=
ould
have been appreciated.

I don't think it's that minor. The race may be unlikely to happen, but if i=
t
happens because someone isn't careful with this (now exported) API - and I'=
m
absolutely sure it's only gonna be a matter of time until that happens -, i=
t'll
be painful. :(

> But, yes, let me look into it. It may take a while though, as vacation
> is getting closer. If you want to send a patch yourself, please, feel
> free to do it.

Ok, let me see if I can get to it.

> Note that, while at it, we should probably also add some documentation
> of device_set_node() (next to get_dev_from_fwnode()) as it also lacks
> it.

Agreed!

Have a nice vacation!

- Danilo

