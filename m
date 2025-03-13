Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12B9C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 16:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Qhu1Jf1lhWvYe/Q8L9Li1P5wGlP18gn8uz7AiBpY7E=; b=i5nmmYg4UdF8gUff6+mFv3hzOX
	vCFcRh7eP7XVEE8NXXPpXOvRJI4ZFhVQQvoADQtT9/6Or2px448Tm/CWs5Kq65TOwjV1nHqvQH1am
	89fjbQLuRnPX82hhbZo6yimxrV3b6Qs93kY10hNJj7KNrpNMyS8X36PD++s26hXMpIg/xmwcyOX6G
	z3IizhJeFfI5BUXyafg5ShrVlkyH1o6zQi+Kwk++FFsXcnekkYtXJ4GYJzfaS+rzXKOufVNiN8Jpl
	R2qzDKcbS3P6U3yxL1oysC5xYxyhy4fu678T5ou+rOus6UbdzXU2j4knJh+E7pASTkBwBxqx7VG/i
	BKsXRulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tslB3-0000000Bm7c-1Opn;
	Thu, 13 Mar 2025 16:12:57 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tskzQ-0000000BjUG-3uS5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 16:00:58 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so2001767a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 09:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741881655; x=1742486455; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Qhu1Jf1lhWvYe/Q8L9Li1P5wGlP18gn8uz7AiBpY7E=;
        b=LiQO19tFCzVwhIirL7LkYp3NEai65uRRYafK6FvAp/yJGBjKbbhIhCOfi5g2e0ovAq
         iC7B4KlIM7Be9G9iTr6v2mcGyKuSHsksD/XAlRwp9cpB2+94Kixtr/iMWvJiddhvGMAl
         wpECHGtajuX/uhR35Jvhp8yIPaBOnRH6xvWCtAsmTqkuxUvhAKXpkcCKr97f+70+qBLq
         Hv2s+2U0KGCLVHK0Z7Oi5HGEhNS1go6xkWcAdsnCKLZnkwNKh+p/VShaCZgYwt3LJ6oW
         cUngmqGAhXaRnMtui9k/wOrYVbaKEvkJCuCziHoc2sw3VbEFwlF49VUl2FhZWyv5/PdD
         lZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741881655; x=1742486455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Qhu1Jf1lhWvYe/Q8L9Li1P5wGlP18gn8uz7AiBpY7E=;
        b=R5ylMXkjIZkbF62rqSBTKzBpaeK8lGJ490+I4IeULnYjUxjegtbuwzENPYOIIzR4v1
         Fl9DY92gKZH9boyt/4GffB2xNeLEmv002upZzf6YQLUivVZ7yJeg/S0SbIndUtG9xhez
         +idrri8X1i7db26eqAxgfl8XJBMU7xkQsJc1k8qnrcIDx2wM6u/0d1UP4rFx3uBkxDBH
         H3+ZraPeHnlRoUVEK7avoox/XML1vG9uNDWgREm+V26zYy4pOZOL1mE+ddRzu7ibMIi7
         RftkkNV4YVEMLK3000PkRR+Xsd+vr1um3yIagX4kKDTL1m+Eq0GGrtoes6erKd5Mea3Q
         XwtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaPFaALXu9TtPEXqM3+iLkeDh4AbQty3yJysWoDNIEonpYLcRUQCEgfovyKybA2ftGo6Qur2wLzOfIZ9tINuFx@lists.infradead.org
X-Gm-Message-State: AOJu0YwczBVPy20aKO+1f0GLI0geKikQ/S5E2drm98gHtS2CCiWrz+bu
	WV6CrHMqNm9ySyQ7/WvAvVee7nvgsdC6UO+tSnT3M6CIgECCe3xwDievjTyZ+hlx9M/2rVn3NnM
	LXwLQcNyEThi6BIYNpBYsnjVtDYw=
X-Gm-Gg: ASbGncsksyRwA8PUmmI03VR4Xj8KkFZfizKDLooCwdt52Eg5BLRX3sn8atrpKz4Db0Z
	lB45tmc1nAjgJuO8K2/AFh0mLhwCL68izfZdyMFHJ8BlM/6ct6e4+78fln2pskjYzgwFFZtjWMb
	P4MQHcpfTPNTfMcJx6P3r/w1rKJYBT6MQ9VUQIl8hZ9PVU
X-Google-Smtp-Source: AGHT+IF//s5JFhhMz1vXUsSDxcGZw1gNGBJyGuwueP01uLjPSgBsSzQhu+mR5NorVsyg5kbLscyeEYUe12nwcFZ/Fic=
X-Received: by 2002:a05:6402:2793:b0:5de:4b81:d3fd with SMTP id
 4fb4d7f45d1cf-5e5e22b8668mr33542305a12.13.1741881654811; Thu, 13 Mar 2025
 09:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-8-git-send-email-nunodasneves@linux.microsoft.com>
 <CAMvTesAW-9Mo0oY6UUh2anp6DQCSsVCUhBiV2-bKp2VD_N0DYw@mail.gmail.com>
 <5e3e8c30-912c-4fe3-bfac-1ae21242473b@linux.microsoft.com>
 <CAMvTesAPeLBfYVa5TGx-o6p+0g_Q1bn6s+nZK5i7NK8QGyfbTA@mail.gmail.com> <6ba21efb-7065-44d7-9cee-265a0c137f0c@linux.microsoft.com>
In-Reply-To: <6ba21efb-7065-44d7-9cee-265a0c137f0c@linux.microsoft.com>
From: Tianyu Lan <ltykernel@gmail.com>
Date: Fri, 14 Mar 2025 00:00:18 +0800
X-Gm-Features: AQ5f1JoY20sfCYd5hoFXQ7-iNAPjORddneakJM5FpRpMqnWdK9ekAfBUaAWFCjI
Message-ID: <CAMvTesCUOTAkiGHq2eh9N7MA86-ZFbLTGaypjKHU8fE0cmc1Dg@mail.gmail.com>
Subject: Re: [PATCH v5 07/10] Drivers: hv: Introduce per-cpu event ring tail
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org, kys@microsoft.com, 
	haiyangz@microsoft.com, wei.liu@kernel.org, mhklinux@outlook.com, 
	decui@microsoft.com, catalin.marinas@arm.com, will@kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, daniel.lezcano@linaro.org, 
	joro@8bytes.org, robin.murphy@arm.com, arnd@arndb.de, 
	jinankjain@linux.microsoft.com, muminulrussell@gmail.com, 
	skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com, 
	ssengar@linux.microsoft.com, apais@linux.microsoft.com, 
	Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com, 
	gregkh@linuxfoundation.org, vkuznets@redhat.com, prapal@linux.microsoft.com, 
	muislam@microsoft.com, anrayabh@linux.microsoft.com, rafael@kernel.org, 
	lenb@kernel.org, corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_090056_968926_CEF01393 
X-CRM114-Status: GOOD (  29.97  )
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

On Thu, Mar 13, 2025 at 11:56=E2=80=AFPM Nuno Das Neves
<nunodasneves@linux.microsoft.com> wrote:
>
> On 3/13/2025 12:34 AM, Tianyu Lan wrote:
> > On Thu, Mar 13, 2025 at 3:45=E2=80=AFAM Nuno Das Neves
> > <nunodasneves@linux.microsoft.com> wrote:
> >>
> >> On 3/10/2025 6:01 AM, Tianyu Lan wrote:
> >>> On Thu, Feb 27, 2025 at 7:09=E2=80=AFAM Nuno Das Neves
> >>> <nunodasneves@linux.microsoft.com> wrote:
> >>>>
> >>>> Add a pointer hv_synic_eventring_tail to track the tail pointer for =
the
> >>>> SynIC event ring buffer for each SINT.
> >>>>
> >>>> This will be used by the mshv driver, but must be tracked independen=
tly
> >>>> since the driver module could be removed and re-inserted.
> >>>>
> >>>> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> >>>> Reviewed-by: Wei Liu <wei.liu@kernel.org>
> >>>
> >>> It's better to expose a function to check the tail instead of exposin=
g
> >>> hv_synic_eventring_tail directly.
> >>>
> >> What is the advantage of using a function for this? We need to both se=
t
> >> and get the tail.
> >
> > We may add lock or check to avoid race conditions and this depends on t=
he
> > user case. This is why I want to see how mshv driver uses it.
> >
> >>
> >>> BTW, how does mshv driver use hv_synic_eventring_tail? Which patch
> >>> uses it in this series?
> >>>
> >> This variable stores indices into the synic eventring page (one for ea=
ch
> >> SINT, and per-cpu). Each SINT has a ringbuffer of u32 messages. The ta=
il
> >> index points to the latest one.
> >>
> >> This is only used for doorbell messages today. The message in this cas=
e is
> >> a port number which is used to lookup and invoke a callback, which sig=
nals
> >> ioeventfd(s), to notify the VMM of a guest MMIO write.
> >>
> >> It is used in patch 10.
> >
> > I found "extern u8 __percpu **hv_synic_eventring_tail;" in the
> > drivers/hv/mshv_root.h of patch 10.
> > I seem to miss the code to use it.
> >
> > +int hv_call_unmap_stat_page(enum hv_stats_object_type type,
> > +                           const union hv_stats_object_identity *ident=
ity);
> > +int hv_call_modify_spa_host_access(u64 partition_id, struct page **pag=
es,
> > +                                  u64 page_struct_count, u32 host_acce=
ss,
> > +                                  u32 flags, u8 acquire);
> > +
> > +extern struct mshv_root mshv_root;
> > +extern enum hv_scheduler_type hv_scheduler_type;
> > +extern u8 __percpu **hv_synic_eventring_tail;
> > +
> > +#endif /* _MSHV_ROOT_H_ */
> >
>
> It is used in mshv_synic.c in synic_event_ring_get_queued_port():
>
> diff --git a/drivers/hv/mshv_synic.c b/drivers/hv/mshv_synic.c
> new file mode 100644
> index 000000000000..e7782f92e339
> --- /dev/null
> +++ b/drivers/hv/mshv_synic.c
> @@ -0,0 +1,665 @@
> <snip>
> +static u32 synic_event_ring_get_queued_port(u32 sint_index)
> +{
> +       struct hv_synic_event_ring_page **event_ring_page;
> +       volatile struct hv_synic_event_ring *ring;
> +       struct hv_synic_pages *spages;
> +       u8 **synic_eventring_tail;
> +       u32 message;
> +       u8 tail;
> +
> +       spages =3D this_cpu_ptr(mshv_root.synic_pages);
> +       event_ring_page =3D &spages->synic_event_ring_page;
> +       synic_eventring_tail =3D (u8 **)this_cpu_ptr(hv_synic_eventring_t=
ail);
> +       tail =3D (*synic_eventring_tail)[sint_index];

OK. I got it. Thanks.

--=20
Thanks
Tianyu Lan

