Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765D9CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 08:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFK1KO4D+0gMTo4v0IBwFOBDfCPoPkcaJ3yQdNMsf7M=; b=RuKd23WSLyVK92+WmE13cEW/wB
	KO0FAK+/5yMrrhZijFjctsqD0+PU2D+aE2LluXx7VK8py3ejWpbhtuL+AukihItkjnk+aOf2cQ4Et
	pF5vMMVk7zoBRErIbvRX+5WvsrhAn09oPxKOoytcl9NpjiY6U69TVDK8g902IgyC10taLBc44OwOu
	yRUa+zamj5zz6EbR90jfM+uaHTsZoEjt8PvWXWgjWJApUhhqaRTWc3kb0gV1i3geu3Fi2LmOsPnRF
	xmtWKzUOkU7tbrJSSRXSDmmcQXzKvT9VZ6a3GFKdWBqf/ob1SfzjZ2pIOf7wiS8WLkGC+ZL5NTLuv
	L/bY8xQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTvF-000000021QO-2YoK;
	Wed, 22 Oct 2025 08:10:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTv4-000000021MX-0OXY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 08:10:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761120603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tFK1KO4D+0gMTo4v0IBwFOBDfCPoPkcaJ3yQdNMsf7M=;
	b=SDno7bQmT1OXWXE6LLygg49XDaPGtLvkRZH/VYHf25yjUSy3kCMFKfi2WqTVBceYnr040q
	n6iwVxfGh6tyVd9dU1Sp6aJU6K90WAurG0BdK6DNXDJNBP6orkvsZmh4Q0VT4+5TcLZBZZ
	uyj9sGpO+0VvSkLyqVfifIaX73shy68=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-e_Gk7j1fOVu5R2Jbgv023Q-1; Wed, 22 Oct 2025 04:08:17 -0400
X-MC-Unique: e_Gk7j1fOVu5R2Jbgv023Q-1
X-Mimecast-MFC-AGG-ID: e_Gk7j1fOVu5R2Jbgv023Q_1761120496
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2930e6e2c03so2969305ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 01:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761120496; x=1761725296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFK1KO4D+0gMTo4v0IBwFOBDfCPoPkcaJ3yQdNMsf7M=;
        b=TljzRcAWT8gKeihk43dRaE/QuQEDsemcjjCM94FYnu9TBUC2S3ETaJh0E17FMo3vWQ
         ayQy3Ji+iu9pQ5QaC7aA/Ro/9BVeK8smntYT3qkv0dUwH//6TEXMI5hsXCSEf15mFYHS
         6N7yE1Ha3zpPex/+SMYc5LM/bUaD/57c0XGdbA8l1mKBLxWuS4jAPRPM3pdYLYzFaIYY
         YU8bsiobWADjSpZMz8+uzQCCc2yhlf84p8mZs4fuXqazdBpqyrR0An2av6pk9b+c3Qws
         xPOq+2TV2U2cmiDqCt9UkZTXyzhVHkH+/neeBS4KKMreV94YjCq+U0U9gu3jvO8IEiaZ
         7OLA==
X-Forwarded-Encrypted: i=1; AJvYcCVE9lexnUmmj881jtYHnVIm3I5wvQSQL8Ads46bju0BQrqDXWfjvB4PB4T47zwzvWYDb1PcpLke0K1vapiDMsY7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4xq2TUe1XbYyqggRQE2zfuSCeHeAkPddDH0ZNHADfCQbTHkFg
	fthgFvfYYCh5Av8rKaJRkEWbT+KZjjpEYH+38cIaNbtZZ1RVSIhno2311qxFrdXmmXfmSFvuRIR
	eVv7NILyRG3lLejN/wOM0WPsLuN2QhZOdgjDnmaC60TqdrJNGE2eenTXG0TffopU2iorX+XixrZ
	eRcVpJU+Ajc9SVb9LWgXWBj+rIhX4IDTZr40vgjpcgoH/Li3iy6oA=
X-Gm-Gg: ASbGncsAAD89bp9lkG14SKYU76yKBS0dEULCr9f+Be7LUyg5LRV+LHRIJ0/p4eBkvQh
	+Iv7MMqlTMsDvDETKLkzT+JIb0YtCnsvhqUHMUUoibL+rNHWfdCsWuZUTUqHQ5ruLJnX0BpCXFl
	Ew3C/os77kDVy64C5UkVjtFpKYq6uZx8QMKVemnL7Vkb3oa1lhC0XoIrEVq0iDuP4QB9pPNfjqD
	Oatqy92t7dhJN3N
X-Received: by 2002:a17:902:e5cf:b0:290:91b1:2a69 with SMTP id d9443c01a7336-290cb7560b8mr260211675ad.52.1761120495726;
        Wed, 22 Oct 2025 01:08:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHo2XP/jVdY2pcYFKz6OnG7bzc461hULcT1/QO/xAI+P9k7vDhd+aVTkvwMGDjMEU/z3u35v2XMOR7IkEnO8xg=
X-Received: by 2002:a17:902:e5cf:b0:290:91b1:2a69 with SMTP id
 d9443c01a7336-290cb7560b8mr260211445ad.52.1761120495404; Wed, 22 Oct 2025
 01:08:15 -0700 (PDT)
MIME-Version: 1.0
References: <20251022072729.14820-1-xion.wang@mediatek.com>
In-Reply-To: <20251022072729.14820-1-xion.wang@mediatek.com>
From: Ondrej Mosnacek <omosnace@redhat.com>
Date: Wed, 22 Oct 2025 10:08:04 +0200
X-Gm-Features: AS18NWB0L38kFa0XqRBxBuxoOL0blj0prvtzV3DKxomco7xkygfsMEqvL9322_U
Message-ID: <CAFqZXNuPqwfqA23LH8NOG6KM1Nb7WvW77wnpp-vZ5omU40j_qQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] selinux: export current_sid API for use in other
 kernel modules
To: xion.wang@mediatek.com
Cc: Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, wsd_upstream@mediatek.com, 
	huadian.liu@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rLRdPvcG_4lz4vH59C3sVgJXkY6a2yT7sPTcTFAijW8_1761120496
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_011006_264132_02490A6A 
X-CRM114-Status: GOOD (  25.08  )
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

On Wed, Oct 22, 2025 at 9:43=E2=80=AFAM <xion.wang@mediatek.com> wrote:
>
> From: Xion Wang <xion.wang@mediatek.com>
>
> We have a kernel driver designed to monitor the status of the Android
> userspace watchdog. The implementation works as follows: we modify the
> Android userspace watchdog code to periodically send a "kick" signal to
> the kernel driver via ioctl, so that the kernel driver can determine
> whether the userspace is still responsive. If the kernel driver does not
> receive a kick signal from the userspace watchdog within a certain
> period, it infers that the userspace is stuck. In this case, the kernel
> driver will dump key process information at the kernel level and trigger
> a full system reboot.
>
> To ensure that only the legitimate Android userspace watchdog process can
> access the ioctl interface and perform the kick operation, and to prevent
> malicious or unauthorized processes from spoofing the kick action (which
> could compromise system reliability), we want to identify the calling
> task by its security identifier (sid). By checking the sid, we can
> effectively prevent unauthorized processes from sending kick signals.
>
> Currently, the current_sid() function in the kernel is defined as
> static inline and cannot be directly called from modules or drivers. We
> propose to export this function, so that the kernel driver can call
> current_sid() to obtain the sid of the current process and decide whether
> to allow the kick operation.
>
> This change will help enhance system security and robustness by
> preventing the watchdog mechanism from being bypassed or abused.
>
> I would like to ask the maintainers if there are any additional security
> concerns regarding exporting current_sid() as a public API, or if there
> are any alternative or more recommended approaches to achieve this goal.
> Any feedback or suggestions would be greatly appreciated.

Couldn't you just use security_cred_getsecid() or the new
security_cred_getlsmprop()?

Untested:

u32 sid;
security_cred_getsecid(current_cred(), &sid);

-- or --

lsm_prop prop;
security_cred_getlsmprop(current_cred(), &prop);
u32 sid =3D prop.selinux->secid;

--=20
Ondrej Mosnacek
Senior Software Engineer, Linux Security - SELinux kernel
Red Hat, Inc.


