Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546E4CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 19:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUGT9ZpP7T0v4R1MQrwTuz1NIpTv8oVeEjQlLS+Zn8c=; b=wS6IlvdLSsyrILGlF3DLlsF68f
	UK/aATlHMbMu9wvP6ZqacxApRPqK/l1JeYS+5mFSmODR9NJeBa/o25Gyf9OOF0OJd9qraJr/gtx8Y
	/ydl4oavbcNTQ8bAbW5kvTT9UvmVi4rHK8Rlzdp1suSth7bNfH/OE++EpQrwgCCcZvyujzVU6fx+s
	EyAVp3hCBTZaOxTEMykt3d/chSp+zCfDAJRMy1hfQbHjdRzQnZh3W6rV+qZgMXAaiFecOkotLkUW9
	0yrIGcYY8NCVkbqKPRnp9ebJOiREdIX0rKV+XTBVV/Q+J7oXH3pZFJR1vgaKcH8wOVFx3MEfuEAfU
	QhELWPlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usReF-00000008O6T-2TI9;
	Sat, 30 Aug 2025 19:54:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usRbX-00000008Nxt-1E7W
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 19:51:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C03A44499;
	Sat, 30 Aug 2025 19:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B181C4CEEB;
	Sat, 30 Aug 2025 19:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756583473;
	bh=gUGT9ZpP7T0v4R1MQrwTuz1NIpTv8oVeEjQlLS+Zn8c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dnYM+GUa0iWB5+jj10vKVbJaH1LmWnTenJtiGphiVapLIf4jiuGw1AemPGNvsGaFE
	 iUTj5wbKG3IUtfed4wsATUB5ShUnxUVmJeQsroOeSzKIs/056k9Sda33ojIyPHeWJ7
	 HQy9kV0ZDcQ/0SmVMhlBUVTgYDJyuzbMqyHYjWchnpviE2SGPczz38GlWZrAgeexiX
	 FPdQscXttL0LoGGdEV6UnwK889fHWwEuhzPQ3SPimdT/ysDCHVDal/guTJ1WUQo+XC
	 7lh6CqPvwNv68sxhGgG8cd9Ab36tC6PMAIkXWZ/MhmfrWr9K7iLCsvHxS3cSYNwQuF
	 qp6oorfyUuwAQ==
Date: Sat, 30 Aug 2025 20:51:04 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v5 1/1] iio: dac: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <20250830205104.38d784a9@jic23-huawei>
In-Reply-To: <CAHp75Vdr5atuW8wivgR3KRjhCK_i+JE2rJFTU3CkWwzpuNv_pg@mail.gmail.com>
References: <20250828140617.3193288-1-sakari.ailus@linux.intel.com>
	<CAHp75Vdr5atuW8wivgR3KRjhCK_i+JE2rJFTU3CkWwzpuNv_pg@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_125115_352131_B588B97C 
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

On Thu, 28 Aug 2025 17:43:19 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Thu, Aug 28, 2025 at 5:06=E2=80=AFPM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> > pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> > to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call =
to =20
>=20
> redundant
Fixed up that whilst applying.

Thanks,

Jonathan

>=20
> > pm_runtime_mark_last_busy().
> >
> > Also clean up error handling in stm32_dac_set_enable_state(). =20
>=20
>=20
> Code looks good to me in this version
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
>=20


