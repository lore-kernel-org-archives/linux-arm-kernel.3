Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660DBC44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 21:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WsiwI578hidtfXo3Jj5CK8o7cgRkY/PSnZLtr9p7LeU=; b=Y4auFe6I/elyGYafCy6Zeiow4H
	HwTGCltFKpOhSBiyScmMELhmah8jHbqTbeXqImVvRf2ZOzyY6p1m75E25HqWJUM/vcuoaV7C50USM
	cXuIBEZoqNZXg5E2Z4T5+MR/q5iCTjNellz+B7Nr9J07WhTdH3iq/AbCaPfRprVPSDt3XY5hJfPAT
	e3Fe+8Oyu3ILHdblOJ53WbwR5KHQLMPJhiUMt4YYiEcFuWBHgWWbi9VpWqGDOXyWfWdQOtzneON1i
	Kfp8hzpBvaYmo7sqzvjopgVks6q25+RWw94oc0al4ICevq5ijjfA8ek/fhyk81oLM+V8d1juPnCFN
	Oit1y+Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIc7-00000005n5q-1t5Z;
	Fri, 10 Jul 2026 21:18:27 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIc4-00000005n57-2rEB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 21:18:26 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-922ff615c14so106560485a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 14:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1783718303; x=1784323103; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WsiwI578hidtfXo3Jj5CK8o7cgRkY/PSnZLtr9p7LeU=;
        b=RpNH6SXd5awlW3kM/Nj2cStQUvL+JztXFjNfPBhVBZAN9+3+bGrN9HIUw1XJi1dw0v
         OePRlr+aYi9QWpw2aHlDbM3rvX9FU2UFcxxiLpi8DzselHhts/3HBpUPwVAbrpgekFe5
         T9RPTtR1UMcuTBvOtLPU3lkg4kN+AKam/54FSjk9hkUGA1BPVAZcEKxSewq26qcBwfe9
         Da7LiMWOErwtlLNx/UQowkhRgrkr80ST6JmkrgphQDL6qD5AoV47cqH6Xae+yx1G6DNI
         aJFHH94XNiJJfH1fWNSC/P0OI27NAo4d024zz6nYKNpULlzCrotHlJeRE8YnM7aByw8p
         zHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718303; x=1784323103;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WsiwI578hidtfXo3Jj5CK8o7cgRkY/PSnZLtr9p7LeU=;
        b=BPzmBYpQHpEa2vozYB2VM5QihAbnH/ZUl9Q3gCfsRVKzyQU0r6nQQTOxuVkLrmIAjr
         Mea7lerJBC5NLDmqD3M7rO11i1C5JGHoiGLuBEBKKO73fQzsmvVGLqnaQeiWrMKKst2O
         tk5YpxhBTScw/o6BnUWqjB6FW6EUR54QwLdnejSDSkY/eUxILsPShQ34qsO6svOZyIlv
         kNZWH3Lwhp5tVUZredrfQBL2cXsoEV9TWV5zleFqQqI0HYv1ckAmVZYoSHdAMBSXUJNE
         Ijs2IQki4ll5tiDK2zfos6MAhryuQdk4VpEr9EiXl5U9Iac4+How6owNjO66FJMBhZU7
         VS2w==
X-Forwarded-Encrypted: i=1; AHgh+RrMeoeoTmuJV9U2Ob/O7FQWttZr9VzmViGvq/ayhh6rwfdmrJb3SDORKG4r2nql50PGmJtcYxNR6uqObURO1UNT@lists.infradead.org
X-Gm-Message-State: AOJu0YzRk1MKGLOuHi5KDvq28tdCTxCUGSF5r6E1bynoMk/9TU9nzrsr
	UMSIZ9WTBZYqu2gZCmHP6iYNfm/qs+m045xsKs8boKPlEKn5HT676F2hrskqwwClPS4=
X-Gm-Gg: AfdE7ckqNSodyIJWVTbOG4MVsvO/3fpSHfjYkbECkwJbbzsi116biMBxb200eapWWwL
	dt9Xaqv5AFRHMGAjZYNu1GAAzL4iJdY+qWP36hMhIvM4itQQES08ehcayCTDRuz8493jrXKDf3I
	AHn1/XccDYOyoE91gYkECXGOWoBY6n09lqLh5j9LLpVty1WGZ7757lHoADVaBt9ekUFo2IOcrSN
	89BbI54fTdyhKwnySg/Mz7XGJCs8El+T23spzHKh7SLHByUfYj+i9RknoxlL9dqlteZtx9Dq0xL
	2fLZIC4tXB7vkzqmiIADGuTe7T+VV+zG1OBgMcUvj39YScdhs78wu1Fghnv1mcZ2wgPEKHWhPYb
	w+s3vnzHEWc/EXm4cGQkNUFecITMyH2/gwYGQjr9TQ2I6DmgX8ObvgP+phpwNCuP5pM9Sq/lLt5
	OSW9+y5365EbnCuxeJkA==
X-Received: by 2002:a05:620a:284c:b0:92e:7f13:1489 with SMTP id af79cd13be357-92ef2b4b8c4mr103370485a.10.1783718303296;
        Fri, 10 Jul 2026 14:18:23 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5b4b38dsm307659485a.10.2026.07.10.14.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:18:22 -0700 (PDT)
Message-ID: <aae16dbfb26c8ee7e54247ca4d123b15748d623f.camel@ndufresne.ca>
Subject: Re: [PATCH 05/17] media: v4l2-mem2mem: support running multiple
 jobs in parallel
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Philipp Zabel
	 <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>
Date: Fri, 10 Jul 2026 17:18:20 -0400
In-Reply-To: <20260606-spu-rga3multicore-v1-5-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
	 <20260606-spu-rga3multicore-v1-5-3ec2b15675f7@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-QDW0FalwTgRr/hRObvGf"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_141824_763036_EBF2DA60 
X-CRM114-Status: GOOD (  36.37  )
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


--=-QDW0FalwTgRr/hRObvGf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le samedi 06 juin 2026 =C3=A0 00:06 +0200, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Add support for running multiple jobs in parallel for SoCs containing
> multiple identical devices. An example is the Rockchip RK3588 SoC,
> which contains two identical RGA3 devices. Therefore it is desirable to
> have the kernel schedule the work across all available devices and only
> expose one video device to the userspace.
>=20
> Previously the curr_ctx member of a v4l2_m2m_dev was used to track the
> currently running context. But the currently running context will always
> be at the top of the job_queue. As the TRANS_RUNNING flag can be used to
> check if the queue head is already running, the curr_ctx member can be
> completely dropped
>=20
> To avoid queueing too many parallel jobs, the
> v4l2_m2m_set_max_parallel_jobs method is added. It allows a driver
> to set the number of parallel jobs and avoids calling device_run when
> the given number of jobs is already running. This is set to 1 by default
> to prevent parallel job runs. Drivers with the need and support for
> scheduling jobs can adjust this value accordingly.
>=20
> Note that this change doesn't allow a context to be used multiple times
> in parallel. So a single stream won't be able to utilize multiple devices
> at once, but N streams can utilize up to N devices. This is caused by the
> fact that a context is not added multiple times to the job_list and also
> holds the job_flags to distinguish if it's currently running.

I do prefer this over Detlev proposal, so let's move toward this. Would be =
it
cleaner though to first remove curr_ctx and then add=20
max_parallel_jobs ?=20

Nicolas=20

>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/v4l2-core/v4l2-mem2mem.c | 89 ++++++++++++++++++++++-=
----------
> -
> =C2=A0include/media/v4l2-mem2mem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++
> =C2=A02 files changed, 62 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-
> core/v4l2-mem2mem.c
> index a65cbb124cfe0..14ac9c85803d1 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -84,16 +84,15 @@ static const char * const m2m_entity_name[] =3D {
> =C2=A0 *			v4l2_m2m_unregister_media_controller().
> =C2=A0 * @intf_devnode:	&struct media_intf devnode pointer with the inter=
face
> =C2=A0 *			with controls the M2M device.
> - * @curr_ctx:		currently running instance
> =C2=A0 * @job_queue:		instances queued to run
> =C2=A0 * @job_spinlock:	protects job_queue
> =C2=A0 * @job_work:		worker to run queued jobs.
> =C2=A0 * @job_queue_flags:	flags of the queue status, %QUEUE_PAUSED.
> + * @max_parallel_jobs:	max job_queue instances number marked as running
> =C2=A0 * @m2m_ops:		driver callbacks
> =C2=A0 * @kref:		device reference count
> =C2=A0 */
> =C2=A0struct v4l2_m2m_dev {
> -	struct v4l2_m2m_ctx	*curr_ctx;
> =C2=A0#ifdef CONFIG_MEDIA_CONTROLLER
> =C2=A0	struct media_entity	*source;
> =C2=A0	struct media_pad	source_pad;
> @@ -108,6 +107,7 @@ struct v4l2_m2m_dev {
> =C2=A0	spinlock_t		job_spinlock;
> =C2=A0	struct work_struct	job_work;
> =C2=A0	unsigned long		job_queue_flags;
> +	u32			max_parallel_jobs;
> =C2=A0
> =C2=A0	const struct v4l2_m2m_ops *m2m_ops;
> =C2=A0
> @@ -123,6 +123,12 @@ static struct v4l2_m2m_queue_ctx *get_queue_ctx(stru=
ct
> v4l2_m2m_ctx *m2m_ctx,
> =C2=A0		return &m2m_ctx->cap_q_ctx;
> =C2=A0}
> =C2=A0
> +void v4l2_m2m_set_max_parallel_jobs(struct v4l2_m2m_dev *m2m_dev,
> +				=C2=A0=C2=A0=C2=A0 u32 max_parallel_jobs)
> +{
> +	m2m_dev->max_parallel_jobs =3D max_parallel_jobs;
> +}
> +
> =C2=A0struct vb2_queue *v4l2_m2m_get_vq(struct v4l2_m2m_ctx *m2m_ctx,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum v4l2_buf_type type)
> =C2=A0{
> @@ -229,14 +235,22 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_buf_remove_by_idx);
> =C2=A0void *v4l2_m2m_get_curr_priv(struct v4l2_m2m_dev *m2m_dev)
> =C2=A0{
> =C2=A0	unsigned long flags;
> -	void *ret =3D NULL;
> +	struct v4l2_m2m_ctx *first_ctx;
> =C2=A0
> =C2=A0	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> -	if (m2m_dev->curr_ctx)
> -		ret =3D m2m_dev->curr_ctx->priv;
> +	if (list_empty(&m2m_dev->job_queue)) {
> +		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> +		return NULL;
> +	}
> +
> +	first_ctx =3D list_first_entry(&m2m_dev->job_queue,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_m2m_ctx, queue);
> =C2=A0	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> =C2=A0
> -	return ret;
> +	if (first_ctx->job_flags & TRANS_RUNNING)
> +		return first_ctx->priv;
> +	else
> +		return NULL;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(v4l2_m2m_get_curr_priv);
> =C2=A0
> @@ -252,13 +266,11 @@ EXPORT_SYMBOL(v4l2_m2m_get_curr_priv);
> =C2=A0static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
> =C2=A0{
> =C2=A0	unsigned long flags;
> +	struct v4l2_m2m_ctx *ctx;
> +	struct v4l2_m2m_ctx *chosen_ctx =3D NULL;
> +	u32 running_jobs =3D 0;
> =C2=A0
> =C2=A0	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> -	if (NULL !=3D m2m_dev->curr_ctx) {
> -		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> -		dprintk("Another instance is running, won't run now\n");
> -		return;
> -	}
> =C2=A0
> =C2=A0	if (list_empty(&m2m_dev->job_queue)) {
> =C2=A0		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> @@ -272,13 +284,30 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev
> *m2m_dev)
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> -	m2m_dev->curr_ctx =3D list_first_entry(&m2m_dev->job_queue,
> -				=C2=A0=C2=A0 struct v4l2_m2m_ctx, queue);
> -	m2m_dev->curr_ctx->job_flags |=3D TRANS_RUNNING;
> +	list_for_each_entry(ctx, &m2m_dev->job_queue, queue) {
> +		if (!(ctx->job_flags & TRANS_RUNNING)) {
> +			chosen_ctx =3D ctx;
> +			break;
> +		}
> +
> +		running_jobs++;
> +	}
> +	if (running_jobs >=3D m2m_dev->max_parallel_jobs) {
> +		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> +		dprintk("Maximum number of parallel jobs reached\n");
> +		return;
> +	}
> +	if (!chosen_ctx) {
> +		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> +		dprintk("All jobs already running\n");
> +		return;
> +	}
> +
> +	chosen_ctx->job_flags |=3D TRANS_RUNNING;
> =C2=A0	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> =C2=A0
> -	dprintk("Running job on m2m_ctx: %p\n", m2m_dev->curr_ctx);
> -	m2m_dev->m2m_ops->device_run(m2m_dev->curr_ctx->priv);
> +	dprintk("Running job on m2m_ctx: %p\n", chosen_ctx);
> +	m2m_dev->m2m_ops->device_run(chosen_ctx->priv);
> =C2=A0}
> =C2=A0
> =C2=A0/*
> @@ -469,15 +498,14 @@ static void v4l2_m2m_schedule_next_job(struct
> v4l2_m2m_dev *m2m_dev,
> =C2=A0static bool _v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
> =C2=A0				 struct v4l2_m2m_ctx *m2m_ctx)
> =C2=A0{
> -	if (!m2m_dev->curr_ctx || m2m_dev->curr_ctx !=3D m2m_ctx) {
> +	if (!m2m_ctx || !(m2m_ctx->job_flags & TRANS_RUNNING)) {
> =C2=A0		dprintk("Called by an instance not currently running\n");
> =C2=A0		return false;
> =C2=A0	}
> =C2=A0
> -	list_del(&m2m_dev->curr_ctx->queue);
> -	m2m_dev->curr_ctx->job_flags &=3D ~(TRANS_QUEUED | TRANS_RUNNING);
> -	wake_up(&m2m_dev->curr_ctx->finished);
> -	m2m_dev->curr_ctx =3D NULL;
> +	list_del(&m2m_ctx->queue);
> +	m2m_ctx->job_flags &=3D ~(TRANS_QUEUED | TRANS_RUNNING);
> +	wake_up(&m2m_ctx->finished);
> =C2=A0	return true;
> =C2=A0}
> =C2=A0
> @@ -544,16 +572,19 @@ EXPORT_SYMBOL(v4l2_m2m_buf_done_and_job_finish);
> =C2=A0void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
> =C2=A0{
> =C2=A0	unsigned long flags;
> -	struct v4l2_m2m_ctx *curr_ctx;
> +	struct v4l2_m2m_ctx *ctx;
> +	struct v4l2_m2m_ctx *ctx_safe;
> =C2=A0
> =C2=A0	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> =C2=A0	m2m_dev->job_queue_flags |=3D QUEUE_PAUSED;
> -	curr_ctx =3D m2m_dev->curr_ctx;
> =C2=A0	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> =C2=A0
> -	if (curr_ctx)
> -		wait_event(curr_ctx->finished,
> -			=C2=A0=C2=A0 !(curr_ctx->job_flags & TRANS_RUNNING));
> +	list_for_each_entry_safe(ctx, ctx_safe, &m2m_dev->job_queue, queue) {
> +		if (!(ctx->job_flags & TRANS_RUNNING))
> +			break;
> +
> +		wait_event(ctx->finished, !(ctx->job_flags & TRANS_RUNNING));
> +	}
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(v4l2_m2m_suspend);
> =C2=A0
> @@ -896,10 +927,8 @@ int v4l2_m2m_streamoff(struct file *file, struct
> v4l2_m2m_ctx *m2m_ctx,
> =C2=A0	q_ctx->num_rdy =3D 0;
> =C2=A0	spin_unlock_irqrestore(&q_ctx->rdy_spinlock, flags);
> =C2=A0
> -	if (m2m_dev->curr_ctx =3D=3D m2m_ctx) {
> -		m2m_dev->curr_ctx =3D NULL;
> +	if (m2m_ctx->job_flags & TRANS_RUNNING)
> =C2=A0		wake_up(&m2m_ctx->finished);
> -	}
> =C2=A0	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags_job);
> =C2=A0
> =C2=A0	return 0;
> @@ -1194,12 +1223,12 @@ struct v4l2_m2m_dev *v4l2_m2m_init(const struct
> v4l2_m2m_ops *m2m_ops)
> =C2=A0	if (!m2m_dev)
> =C2=A0		return ERR_PTR(-ENOMEM);
> =C2=A0
> -	m2m_dev->curr_ctx =3D NULL;
> =C2=A0	m2m_dev->m2m_ops =3D m2m_ops;
> =C2=A0	INIT_LIST_HEAD(&m2m_dev->job_queue);
> =C2=A0	spin_lock_init(&m2m_dev->job_spinlock);
> =C2=A0	INIT_WORK(&m2m_dev->job_work, v4l2_m2m_device_run_work);
> =C2=A0	kref_init(&m2m_dev->kref);
> +	m2m_dev->max_parallel_jobs =3D 1;
> =C2=A0
> =C2=A0	return m2m_dev;
> =C2=A0}
> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> index 31de25d792b98..e6177d0eaf637 100644
> --- a/include/media/v4l2-mem2mem.h
> +++ b/include/media/v4l2-mem2mem.h
> @@ -594,6 +594,9 @@ static inline void v4l2_m2m_set_dst_buffered(struct
> v4l2_m2m_ctx *m2m_ctx,
> =C2=A0	m2m_ctx->cap_q_ctx.buffered =3D buffered;
> =C2=A0}
> =C2=A0
> +void v4l2_m2m_set_max_parallel_jobs(struct v4l2_m2m_dev *m2m_dev,
> +				=C2=A0=C2=A0=C2=A0 u32 max_parallel_jobs);
> +
> =C2=A0/**
> =C2=A0 * v4l2_m2m_ctx_release() - release m2m context
> =C2=A0 *

--=-QDW0FalwTgRr/hRObvGf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalFhnAAKCRDZQZRRKWBy
9PrwAQDNSzCL5oAGQfVmC3OhUffae971mvKMYg7A8/oRYIIxKgD/cgSHWJHtif2N
4LPSEtHdmWGJ5UHRpA48+LdsQPOBYgU=
=lbZn
-----END PGP SIGNATURE-----

--=-QDW0FalwTgRr/hRObvGf--

