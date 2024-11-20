Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D494D711BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 16:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OnybE9QCu9YjR+AlgSDdsYdZNq3wPb3NxMHboXiHWhU=; b=1R+09LCyGJAcimsVJ14LZs3vxu
	VW3GFXzDKDaBS4x6qYyK81sdRwQw3H3URXm38+B7OWW4vRcRgtaO+XCOzX3qhS06JRrXZb9g57pa8
	h8qoYKFb9TdwmmK9aG7/VE1sSpI1dGfrN7AiafXFDX7WX2YFww9dFBeVz3mS5fELnjgUY4zIcWodN
	c7b0TiodrRRXgd3Y5GyseOb38uhBs6TPr9Z45/grB4qyFeUj5rOvXabAykSzD9EC5RUHqTfewQIcQ
	SMJ82v8ixD+gBww8Xl7E+4hLFA495Z2ydKXYiLxk826ZnFZePqNl0A7MNxayGUdTG3wS+t0F76xBB
	Hk3melGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDnFl-0000000FmIh-3apw;
	Wed, 20 Nov 2024 16:08:29 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDnBi-0000000FlWO-27se
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 16:04:20 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5cffb4d7d9dso813381a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 08:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732118656; x=1732723456; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OnybE9QCu9YjR+AlgSDdsYdZNq3wPb3NxMHboXiHWhU=;
        b=C6zVbPuS5hvuc4fRvlMiIsVxHqjhcmgeAvvkuU5lWwv9By1L4ubUmvW7QbkfSNmv20
         V3jAQoaE1fPgUV9DKMGN5xFoXlSF+k3qEs6Aje38EysJlilNCwD/RJxarpLovvOYrgKx
         R1YN44qfCOalgFC/SKvXUj1/Jqo5Qdw1QK8P6umK56AAYKwCI6tHNoGoR31xQveGvafw
         cjxsVGBFZsPyu22iXjLmV9mafdOXIZFck9VKpNHwMxCH9f8mk9vbSYT0slVvEJCj1Sob
         jeb9SKpNszMRypt6hxyx7oPb2sYypKCkC5DHFNKKp+6+XHFhpGewiYXkjHrmrO5OKV4q
         R8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732118656; x=1732723456;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OnybE9QCu9YjR+AlgSDdsYdZNq3wPb3NxMHboXiHWhU=;
        b=SAntEHIf9aDakyDuAThpVVUvHg1OWShCBjRFGCq+S79Lx1lOR5+WK83xKRJVVUPhkA
         JY97n5vta3uVukiu8b8qH0pbaaQt4UragH5FnhopdgHhkn++SvApufpizqJpGNEBfz5W
         8eDauEoaovjR/LOnFcvWBe9AFq2FQiq8X1gkOxLAIJB1u1iLm33AogChn9KS/4xVc02V
         KJwbz/IdjxwHsGxmtt7ImuAXQ0+ciXj+geYFm7VGRZskuhpGI+RZzZ0I4CjmHtKt5Fh0
         ZWt+ij6Om1ld2qso6cJCKNePBrcbdJN3GzSdO4lxLpSleUi1GFuuDzDbT1DcQzkJCAvl
         HClw==
X-Forwarded-Encrypted: i=1; AJvYcCVFpt/tpIi98xe+fXxvttEMglm+9LLw8HXbgXRS7exz5YYlHf0T416rB3SRskrObxLXNUS1b3sUEOYX+5skfBmx@lists.infradead.org
X-Gm-Message-State: AOJu0Yx32r68WFq0SYiS3Y27CjeDa6LjJcGoWo4OU7Ku7OvvuX/G6vNz
	7gvmC3iaNEumHH/RUnflOxDRzGfmqorAZnCmpZPPmkRUj4CTkHlXnFLBCQoh78IJxz6IRfyYMQp
	k2bAHcgz9emVE7tmCB22wTwt08dIKN3Xd4te5HA==
X-Google-Smtp-Source: AGHT+IEezToTFcoX5Xms/RtQNmq3YRhKxr9Pb8q85vlLo+drb3zJ5gE/CYUXZHS4Gz0odg4pA6FKIoe9SJMmNxotd3g=
X-Received: by 2002:a05:6402:1e89:b0:5cf:d333:eb75 with SMTP id
 4fb4d7f45d1cf-5cff4cd134amr2866973a12.27.1732118656340; Wed, 20 Nov 2024
 08:04:16 -0800 (PST)
MIME-Version: 1.0
References: <20241104133515.256497-1-arnaud.pouliquen@foss.st.com>
 <20241104133515.256497-5-arnaud.pouliquen@foss.st.com> <Zzt+7NBdNjyzWZIb@p14s>
 <0d9075cd-68c2-49ec-9b9c-4315aa8c8517@foss.st.com> <CANLsYkxvTuLv8Omw-UeyPaA9g9QokmtMaMYD0eoUPo20wUuONQ@mail.gmail.com>
In-Reply-To: <CANLsYkxvTuLv8Omw-UeyPaA9g9QokmtMaMYD0eoUPo20wUuONQ@mail.gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 20 Nov 2024 09:04:05 -0700
Message-ID: <CANLsYkwPDFvJxgXrAV=92w+sT8tXB=-=K8Qs8eRVKm2C2v+0aA@mail.gmail.com>
Subject: Re: [PATCH v13 4/7] remoteproc: Introduce release_fw optional operation
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Jens Wiklander <jens.wiklander@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_080418_548710_A9DFC779 
X-CRM114-Status: GOOD (  39.92  )
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

On Tue, 19 Nov 2024 at 13:38, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Tue, 19 Nov 2024 at 11:14, Arnaud POULIQUEN
> <arnaud.pouliquen@foss.st.com> wrote:
> >
> > Hello Mathieu,
> >
> > On 11/18/24 18:52, Mathieu Poirier wrote:
> > > On Mon, Nov 04, 2024 at 02:35:12PM +0100, Arnaud Pouliquen wrote:
> > >> This patch updates the rproc_ops struct to include an optional
> > >> release_fw function.
> > >>
> > >> The release_fw ops is responsible for releasing the remote processor
> > >> firmware image. The ops is called in the following cases:
> > >>
> > >>  - An error occurs in rproc_start() between the loading of the segments and
> > >>       the start of the remote processor.
> > >>  - after stopping the remote processor.
> > >>
> > >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > >> ---
> > >> Updates from version V11:
> > >> - fix typo in @release_fw comment
> > >> ---
> > >>  drivers/remoteproc/remoteproc_core.c | 5 +++++
> > >>  include/linux/remoteproc.h           | 3 +++
> > >>  2 files changed, 8 insertions(+)
> > >>
> > >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > >> index 7694817f25d4..46863e1ca307 100644
> > >> --- a/drivers/remoteproc/remoteproc_core.c
> > >> +++ b/drivers/remoteproc/remoteproc_core.c
> > >> @@ -1258,6 +1258,9 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
> > >>
> > >>  static void rproc_release_fw(struct rproc *rproc)
> > >>  {
> > >> +    if (rproc->ops->release_fw)
> > >> +            rproc->ops->release_fw(rproc);
> > >> +
> > >>      /* Free the copy of the resource table */
> > >>      kfree(rproc->cached_table);
> > >>      rproc->cached_table = NULL;
> > >> @@ -1377,6 +1380,8 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> > >>  unprepare_subdevices:
> > >>      rproc_unprepare_subdevices(rproc);
> > >>  reset_table_ptr:
> > >> +    if (rproc->ops->release_fw)
> > >> +            rproc->ops->release_fw(rproc);
> > >>      rproc->table_ptr = rproc->cached_table;
> > >
> > > I suggest the following:
> > >
> > > 1) Create two new functions, i.e rproc_load_fw() and rproc_release_fw().  The
> > > only thing those would do is call rproc->ops->load_fw() and
> > > rproc->ops->release_fw(), if they are present.  When a TEE interface is
> > > available, ->load_fw() and ->release_fw() become rproc_tee_load_fw() and
> > > rproc_tee_release_fw().
> >
> >
> > I'm wondering if it should be ->preload_fw() instead of ->load_fw() ops, as the
> > ->load() op already exists.
> >
>
> I agree that ->load() and ->load_fw() will lead to confusion.  I would
> support ->preload_fw() but there is no obvious antonyme.
>
> Since we already have rproc_ops::prepare() and rproc_prepare_device()
> I suggest rproc_ops::prepare_fw() and rproc_prepare_fw().  The
> corollary would be rproc_ops::unprepare_fw() and rproc_unprepare_fm().
> That said, I'm open to other ideas should you be interested in finding
> other alternatives.
>

Actually...  A better approach might to rename rproc::load to
rproc::load_segments.  That way we can use rproc::load_fw() and
rproc_load_fw() without confusion.

> > >
> > > 2) Call rproc_load_fw() in rproc_boot(), just before rproc_fw_boot().  If the
> > > call to rproc_fw_boot() fails, call rproc_release_fw().
> > >
> > > 3) The same logic applies to rproc_boot_recovery(), i.e call rproc_load_fw()
> > > before rproc_start() and call rproc_release_fw() if rproc_start() fails.
> >
> >
> > I implemented this and I'm currently testing it.
> > Thise second part requires a few adjustments to work. The ->load() ops needs to
> > becomes optional to not be called if the "->preload_fw()" is used.
> >
> > For that, I propose to return 0 in rproc_load_segments if rproc->ops->load is
> > NULL and compensate by checking that at least "->preload_fw()" or ->load() is
> > non-null in rproc_alloc_ops.
> >
>
> I agree.
>
> > Thanks,
> > Arnaud
> >
> >
> > >
> > > 4) Take rproc_tee_load_fw() out of rproc_tee_parse_fw().  It will now be called
> > > in rproc_load_fw().
> > >
> > > 5) As stated above function rproc_release_fw() now calls rproc_tee_release_fw().
> > > The former is already called in rproc_shutdown() so we are good in that front.
> > >
> > > With the above the cached_table management within the core remains the same and
> > > we can get rid of patch 3.7.
> >
> > >
> > > Thanks,
> > > Mathieu
> > >
> > >>
> > >>      return ret;
> > >> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > >> index 2e0ddcb2d792..08e0187a84d9 100644
> > >> --- a/include/linux/remoteproc.h
> > >> +++ b/include/linux/remoteproc.h
> > >> @@ -381,6 +381,8 @@ enum rsc_handling_status {
> > >>   * @panic:  optional callback to react to system panic, core will delay
> > >>   *          panic at least the returned number of milliseconds
> > >>   * @coredump:         collect firmware dump after the subsystem is shutdown
> > >> + * @release_fw:     optional function to release the firmware image from ROM memories.
> > >> + *          This function is called after stopping the remote processor or in case of an error
> > >>   */
> > >>  struct rproc_ops {
> > >>      int (*prepare)(struct rproc *rproc);
> > >> @@ -403,6 +405,7 @@ struct rproc_ops {
> > >>      u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
> > >>      unsigned long (*panic)(struct rproc *rproc);
> > >>      void (*coredump)(struct rproc *rproc);
> > >> +    void (*release_fw)(struct rproc *rproc);
> > >>  };
> > >>
> > >>  /**
> > >> --
> > >> 2.25.1
> > >>

