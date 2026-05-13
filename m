Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D5FCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 12:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cIKGnDKNpd0yeMQIMK4UDELk2FN0CMAVb9xNAeplAlA=; b=hrM6gCtD0EYQgYu3wk+sq9bGLQ
	rfys30/MFkNBoHkpYqU9TMOVHLGYQq27p882dSgECu5UD168oYf8Twx01/f4uTrRtd8eaoUs3dCqW
	RQKBm5DvLMRuWG7babX3d20N1m1szazi3rNnPqI1R6KhqMmyehtxQMJh/RtIUFxoG9gKL62RHDfui
	B0grhVcXJ22V6UzBjP+YU04/ifKzgzTDRJ80N2U5q50PePIhpH8xY/9Ly5oIrH84kswVnqgm0I490
	q7I6bqNwCGe3KWe8lqRQKwcA1avzgKp+fea+hTTCMVrTYYYNt7XcKlrtUvbb87wapiVNLWqzY4uNu
	aXNeL7bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9Bl-00000002aXa-41Gm;
	Wed, 13 May 2026 12:59:49 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9Bj-00000002aWL-3AYo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 12:59:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=cIKGnDKNpd0yeMQIMK4UDELk2FN0CMAVb9xNAeplAlA=; b=9bt1TwsCEKoo8St3/+kGbMAKD7
	8ZvyLalmRMbAvKadjuldwHhuGmsdcR29ANCDvQyYiCR4yUTaHaxemyWl9mGIa5128c8ywQ6j1BhoJ
	ye/CFFEe3WkOdvngj1LjSIZRlz15g9n+Dxk4AK5L6b9wQ57BSh/eMJhb6k/jEfJjf75KRVai/vWEF
	liEzGyrd9ax5LMAGpwNCywOgnjtL3nnf99FUemoHrITFO4r/XnRuDFB79qbLT9enEzZPInl8HiMoi
	q5htgxm326nekPmE+gEd21q6n6Q8nxVgCszZyw0U293QxjMkBFHtm1+ck1Nf1jvZCKkcy3cckiupU
	jZlnjSfw==;
Date: Wed, 13 May 2026 14:59:26 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Russell King <linux@armlinux.org.uk>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Arnd
 Bergmann <arnd@arndb.de>, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v7 0/3] ARM: omap1: use real firmware node lookup for
 GPIOs on Nokia 770
Message-ID: <20260513145926.2dc4d037@kemnade.info>
In-Reply-To: <CAMRc=MdN9EpQVW=1Sb-9hRdt56Y5NNbskujjq2RiXhu90t0QyA@mail.gmail.com>
References: <20260430-nokia770-gpio-swnodes-v7-0-c88f74c90dd6@oss.qualcomm.com>
	<CAMRc=MdN9EpQVW=1Sb-9hRdt56Y5NNbskujjq2RiXhu90t0QyA@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_055947_792605_6A488B19 
X-CRM114-Status: GOOD (  10.18  )
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

Hi,

On Mon, 11 May 2026 15:34:39 +0200
Bartosz Golaszewski <brgl@kernel.org> wrote:

> On Thu, Apr 30, 2026 at 9:31=E2=80=AFAM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >
> > This converts Nokia 770 to using real firmware node lookup for GPIOs by
> > attaching the software nodes describing GPIO controllers to their target
> > devices.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > --- =20
>=20
> Hi!
>=20
> Gentle ping, can this be queued now for v7.2?
>=20
So any objections from your side, Aaro?

Regards,
Andreas

