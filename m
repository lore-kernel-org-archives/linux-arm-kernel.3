Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804CFC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 07:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUsrUN0Sa3eMBis7ScutQ4swK59H4nn7rnZNJQLZ63Y=; b=v5wR8Fsg9v+RQyZCoOPhGuWviD
	F6U5V7/iZjsHfmqPAoNUZRSHelWYvGadPj7Fnqw4DjBH9ayprdMTUL6Ntowc86AMDg+Ob+L6a5Hq6
	DXisyj8aU32/j6uFXecLqrYbLaOD6+FmP7Dck+0c3aJoX/HSGlJ6RDBJYw91EDI1WQhUknrvBM7Ew
	vdSNozoEhbfJsPExLjmNDcPhfBcW/wMpPE7S5vnnPmbGOzPJbVXyYxnGsfqM78O2RvqjuGm17MiKG
	0txbcEEjT98JlfeX9bAyLIOsYwzywT1hsTTZrWQRVqblqoDDtFVIFL31BdF2ul7m5v/TSmtsMasY5
	OWfVQsJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdME-0000000ARc3-3RCU;
	Thu, 13 Mar 2025 07:51:58 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsd5w-0000000AOZj-451V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 07:35:10 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e56b229d60so3323843a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 00:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741851307; x=1742456107; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUsrUN0Sa3eMBis7ScutQ4swK59H4nn7rnZNJQLZ63Y=;
        b=itHPOOyTW+nescY2H+u2vCBaC18eW58yTQ2Ti3uDskaoj9epwa/a1+T3WQCwM4fOmu
         zyt87p0fJD+83iuRurFCHhpVtTUGaxWv/ki4KsdnoapR7IFPlzrtR61i222FMvl01Ryt
         Pm5ZU4Uq1SXIg9SF0odyNsAVx33IM4YRg7Ls0ucryKq8dbIDYlxVWhjwyD2LwbG71Hda
         H5f1+ZibSZXqkyNR9FofBAnjpchzuvNo7MUGNtpTEXz6TjWGSvslDX6IJj5gEdvXRtJ9
         6RXIcd1v4n4XaLhlDJjk0+b9Lnz4jSMYA4wbCA1C79GJXmQRKKl6P6M4t5GMvHdaSv/l
         BS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741851307; x=1742456107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUsrUN0Sa3eMBis7ScutQ4swK59H4nn7rnZNJQLZ63Y=;
        b=vAtz1S30fSpoiOl/J+7i0gjQT1YvuBuVlaJyh/wSKk2mEadGfuGEuSspgmxSXex69T
         hwmEvzr/1B2kQb9Gj7Kzj75hBiuTkZurXtOS47oqIOfMEEszfieELoGGJZc9spA8AgNZ
         0UcVTwS4aVEhglguQiG8ORWph6WnfnQ/gXXx1LyVSVx1oytMYzGagEM9BBTw5+Cf0Evh
         N8iwtbwZOWX+rGmBa6+HlvCv7NMH2jV9c61Otbpjquz94rOEc4mTLLkwWeUKz23D5OWI
         HUF9/Gd89yWiG8T8FDSmDxMpSyLhjgedLR9QOMYfcWayjpBT5g8iiv7LsVkGVcRQCYco
         kgJA==
X-Forwarded-Encrypted: i=1; AJvYcCXICz2zNQW7isI4sGQ9J6fR99rKEhtGIQq6pSQwsvqay0Y912P6uxCsNKmqS9aRd/x3spZxDSRAFOkY5ok1pNv9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/beA5seT7ewuj/scgpu5z1r4tJJhirvB6gnc/zpjDxN1bs79U
	CpfbdTTAsCslIGydDK6isIbuFiGIaBE5i0pLepAGJV+YVn5xqvRinDs+5F+nqEjbPocwUd4wcGW
	IavMd2uY6DrfbS13jHSoSFzDfbK0=
X-Gm-Gg: ASbGncuyNcQ4ath5tvE3KbEyeCD1KDLFKLLfBbuxMQdGCmaTES77QWHbnEPT8eCRcj4
	vxX7uobs2DQIsOgfY+UfppKhoJuptDW5c7OIj3/WMQI6cOEBOo/wGDFIDbmGHwdsrU1Scy3CbMh
	A2/7wdBwOp8DZNOOnonywJny/c2sOuZoDTEkBHQX2DRXBT
X-Google-Smtp-Source: AGHT+IG0AbFafmJCSVXuCn9+d9aJ6rWGv0lewSciVuUOX99LLiYxCavfe+aGJvWGZ3Z6k5yceyGSjWwk/zr0TjlaX0g=
X-Received: by 2002:a05:6402:2550:b0:5e5:9c04:777 with SMTP id
 4fb4d7f45d1cf-5e814d805b7mr1311903a12.6.1741851306525; Thu, 13 Mar 2025
 00:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-8-git-send-email-nunodasneves@linux.microsoft.com>
 <CAMvTesAW-9Mo0oY6UUh2anp6DQCSsVCUhBiV2-bKp2VD_N0DYw@mail.gmail.com> <5e3e8c30-912c-4fe3-bfac-1ae21242473b@linux.microsoft.com>
In-Reply-To: <5e3e8c30-912c-4fe3-bfac-1ae21242473b@linux.microsoft.com>
From: Tianyu Lan <ltykernel@gmail.com>
Date: Thu, 13 Mar 2025 15:34:28 +0800
X-Gm-Features: AQ5f1JpFmeyU-ZXvz0ptwRLZ-nTkXcfB_mlOTr3vDPCyoNGFdLAtzHdNo9-Hw44
Message-ID: <CAMvTesAPeLBfYVa5TGx-o6p+0g_Q1bn6s+nZK5i7NK8QGyfbTA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250313_003509_035460_E2247E2F 
X-CRM114-Status: GOOD (  21.73  )
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

On Thu, Mar 13, 2025 at 3:45=E2=80=AFAM Nuno Das Neves
<nunodasneves@linux.microsoft.com> wrote:
>
> On 3/10/2025 6:01 AM, Tianyu Lan wrote:
> > On Thu, Feb 27, 2025 at 7:09=E2=80=AFAM Nuno Das Neves
> > <nunodasneves@linux.microsoft.com> wrote:
> >>
> >> Add a pointer hv_synic_eventring_tail to track the tail pointer for th=
e
> >> SynIC event ring buffer for each SINT.
> >>
> >> This will be used by the mshv driver, but must be tracked independentl=
y
> >> since the driver module could be removed and re-inserted.
> >>
> >> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> >> Reviewed-by: Wei Liu <wei.liu@kernel.org>
> >
> > It's better to expose a function to check the tail instead of exposing
> > hv_synic_eventring_tail directly.
> >
> What is the advantage of using a function for this? We need to both set
> and get the tail.

We may add lock or check to avoid race conditions and this depends on the
user case. This is why I want to see how mshv driver uses it.

>
> > BTW, how does mshv driver use hv_synic_eventring_tail? Which patch
> > uses it in this series?
> >
> This variable stores indices into the synic eventring page (one for each
> SINT, and per-cpu). Each SINT has a ringbuffer of u32 messages. The tail
> index points to the latest one.
>
> This is only used for doorbell messages today. The message in this case i=
s
> a port number which is used to lookup and invoke a callback, which signal=
s
> ioeventfd(s), to notify the VMM of a guest MMIO write.
>
> It is used in patch 10.

I found "extern u8 __percpu **hv_synic_eventring_tail;" in the
drivers/hv/mshv_root.h of patch 10.
I seem to miss the code to use it.

+int hv_call_unmap_stat_page(enum hv_stats_object_type type,
+                           const union hv_stats_object_identity *identity)=
;
+int hv_call_modify_spa_host_access(u64 partition_id, struct page **pages,
+                                  u64 page_struct_count, u32 host_access,
+                                  u32 flags, u8 acquire);
+
+extern struct mshv_root mshv_root;
+extern enum hv_scheduler_type hv_scheduler_type;
+extern u8 __percpu **hv_synic_eventring_tail;
+
+#endif /* _MSHV_ROOT_H_ */

--=20
Thanks
Tianyu Lan

