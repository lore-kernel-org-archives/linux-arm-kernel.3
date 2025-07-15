Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7B0C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 09:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=289O4eRlY4l0x9C7ngrEvXUFEF5rxjK+EO1/Qq/NHTU=; b=0Tz8Ef+meiwgypfjtIHcpisS3/
	fNpNsxIkbVj+/JZjevK4K4cvypKMunqu9UDgoVdTVrpYAZyaEYieeDZI1Fl6bdLIFogO2vGxtTtZD
	4a8m83/1j3YnvxME4z47PvCcAgmhF6CsXGHmOzjf9gbgqB4O8rrFBRdjYHrO68/m20ArDgo1kb0BA
	Uexgj5/46RKmQ5H9IKjX/oGW7n/+DtjwUHsMLE5k3cgZWLdmSVxOYKh6x5Pf7K0eUctFlMB3W4neb
	Cw49tXECy7E3bIzOl12TVYGlg0g5pPgSiXo2NEWaLK2jwfm6AoeOLt3BZ7DQzVHWHWO7srHpAb0Yw
	tRAkP9uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubc1Z-00000004gbp-0I1f;
	Tue, 15 Jul 2025 09:32:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbMY-00000004Zr4-2h1Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 08:50:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D305BA5369D;
	Tue, 15 Jul 2025 08:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C83C4CEE3;
	Tue, 15 Jul 2025 08:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752569409;
	bh=289O4eRlY4l0x9C7ngrEvXUFEF5rxjK+EO1/Qq/NHTU=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=fgbCLmVmkWLQhT4X1hcB5K77kJSFdd+63vBa66dHKERmwum4xP2/2rsMFmRQdFm5X
	 RUy0H18klWoQxp6WV9VAVH9IrDrZLkqolE7bHcRGDp3w2fzrZjfLfM3sJ6veKaw08D
	 5J9ZKeRTNz8KQjhRpInS0E5JE8qQW2qtxXjKCLZ2Rq6RdAdQ/XsWQ6IznhzYxrGWXf
	 B3nWjFnXH6DS97cyGPjYDjxDkTLXqiaHZyv/+ApdWhydk1r+W/DCjUBbJCqmhp+L0L
	 RQtDUCmvSNXumTxRw9w84QRroFe8hm6FNeA/poNypkNTpHE4mstqxh5QV/D5buJUev
	 Nve9vM3UWqElQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Jul 2025 10:50:03 +0200
Message-Id: <DBCI05B4Y2ZX.VM9KNB61PGU2@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
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
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <CAPDyKFr=u0u2ijczExkntHK1miWZ6hRrEWBMiyUwShS3m6c29g@mail.gmail.com>
In-Reply-To: <CAPDyKFr=u0u2ijczExkntHK1miWZ6hRrEWBMiyUwShS3m6c29g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_015010_748023_4A28017C 
X-CRM114-Status: UNSURE (   9.86  )
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

Hi Ulf,

On Wed Jul 9, 2025 at 1:30 PM CEST, Ulf Hansson wrote:
> I decided it was time to give this a try, so I have queued this up for
> v6.17 via the next branch at my pmdomain tree.
>
> If you encounter any issues, please let me know so I can help to fix them=
.

Can you please address my concern in patch 17 ("driver core: Export
get_dev_from_fwnode()")?

Since this has been applied already, a subsequent patch would be perfectly =
fine.

Thanks,
Danilo

