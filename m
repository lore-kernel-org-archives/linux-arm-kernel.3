Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6F1CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 14:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tV6lq40DHC8JcmNfWL6yF+Abxx6Ldftej9yA3XYbJaI=; b=JvDDsrHS514kv5HDd/DfFhGKkB
	ODOBg4pxA44oq03ogeAkYc+BVRMb70ubniZwy4prJwBW95H1uGaIbYwYtreZB8dWwKwSz5MtlbZJ1
	XnDCiXkzy/S3XEf8uhDL4hFhpijQt6zmTeeSTYZW6j1QMoK6SQMZTuYKYUe7WkL4oExJJZJDeZXX5
	bimNQrQ5XDXULvMwIixc+Hfps888xQekCjZm3wKoMmX/tOo2Vh82YJAFS3Nv/6m3iBPCWLTMA5lAq
	4VcfBE14BS+OvzmIjDfUfx/K8EKpeNW1iGfl6sIt+R+zeRuGyoNAt5tVWNqFPkSSossw5UK8VYuVb
	rvkDKEcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDkKH-0000000G3sM-257f;
	Tue, 28 Oct 2025 14:05:29 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDkJo-0000000G3oT-0JL2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 14:05:28 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-63e3a7a67a4so6485509d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 07:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761660298; x=1762265098; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tV6lq40DHC8JcmNfWL6yF+Abxx6Ldftej9yA3XYbJaI=;
        b=BS+N2TaMZ9KTvq7u7VI8pLry4iZ3XvRpd0/waME3ovy3D3yGZhQ0cSbaRhOdWuE6PA
         GWnUCEzArVK1blgEom3QN7Iupnf7ELOb90NFHhianr+kXmcZam5lwxDq8typdTErCCsU
         xK5CoDbif4RI4YYNxoU//j6jLBk8gB8jxEUTQRyvkC6OiiQaHe2vxrnnNkSaUTt4xAy0
         mLj3S+VcmXwo7vcLYfyG+KdO4i0DQLOgocUmQwJn7uZEIQQfNXesHgP2tVDlibQrsBbx
         6ADGEnivA5y84j7zR2VG3GP1zUpzBxzumq8wetLYHETxn1MJ1cJkPfiCCQD6Kj0VBB6F
         ooLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761660298; x=1762265098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tV6lq40DHC8JcmNfWL6yF+Abxx6Ldftej9yA3XYbJaI=;
        b=Mszwp9HzOOhYCo76zqMI66ykllgICJ/eth7U/wW7YF+hYlbAF5aIDZDhfEXDmhrfUa
         CI+jJUUxr/RC8g4f4jqTQNimqPPhRdSix3HSXw+B2+oq3n3xvJvsYO8tq2umWIvD6XLR
         4ZEk6TeGc2jsBmPXm0Draz8YzomNHWap8p3x72aCMe1F9IXootC193adKTDVZ1S4IvlS
         VCG3ZArFJUfz11507BuqzrhGGzqcUSi1uSvSvg+7soZYTCpwCATO9R+Io07jFBHIoBYE
         vb1T7eyanCDvNRgPhtC2v/qhYIhYnrLck9FJPW9KTLMFZH/XRBgGRsPA8bNo6GAiUmoq
         lkXg==
X-Forwarded-Encrypted: i=1; AJvYcCW9bjg32JGsHb/+Jjl4OFGZ6YmhRI/5QhZoH6edrnP12dB1e6OQEdGrO1HLJz0pF8dSCMYYE9DPphS0WG8GCLWp@lists.infradead.org
X-Gm-Message-State: AOJu0YwMmagTEV3+tEbMn6Wq/+vvI2zpXzBfnJP15exi26kL4zusjZ8S
	T7aQ6dVLanLjRE1sIDdvZ9PtrYoreczNftJVyAEF8EBpkTMGwQ9hX2DflJIUWSUbcOv/05oBGJ8
	rsDsBck2P53EoM5608aIRiL/dpfiap0w=
X-Gm-Gg: ASbGncsMXeHiFPvDTDzjal1sB13/aSLiyZg6r0YHPeE+Xys38bq3YjmzfjXITWchcoh
	Fo22sSJsxdt0khe+1lUwMWXwCJZcuv0JRWINLSkii1hBJcZOD++wvkPQ99u7pB2VMZ8QnAGYfPy
	5j//GBdzP45mNIfwr1FF/YHEnxumaH+TnUc+KacqLz0x9CdMAEvnAVrLiwigZiHQ+z5QSCrPDMd
	B1lJI+U7WZ5R/tLVAf0DfXzWdW0OU2zl1rcUpx9hVTxhno0Elk0UHYxGVY1kBq6GtQWD3g4YzoY
	Wnx02x4L0OEK59WPzQ==
X-Google-Smtp-Source: AGHT+IGO59IsEPrMaZUmuz6Z8HqEjQzA2Ntsc7bvDVyVXUheTpOGkWA4zrFX+wmhIbJUO+iBKxLOdRdY9YaXu1dEED0=
X-Received: by 2002:a05:690e:d83:b0:63c:e90c:a6d8 with SMTP id
 956f58d0204a3-63f6ba849bamr2974242d50.44.1761660298140; Tue, 28 Oct 2025
 07:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20251027083700.573016505@linutronix.de> <20251027083745.231716098@linutronix.de>
In-Reply-To: <20251027083745.231716098@linutronix.de>
From: Yann Ylavic <ylavic.dev@gmail.com>
Date: Tue, 28 Oct 2025 15:04:46 +0100
X-Gm-Features: AWmQ_bnQq8Ze7k4D-80utHvwT6MTXau8I1_bRZ4nLy6wJZW1-jMkY-uZGE3OIrk
Message-ID: <CAKQ1sVO9YmWqo2uzk7NbssgWuwnQ-o4Yf2+bCP8UmHAU3u8KmQ@mail.gmail.com>
Subject: Re: [patch V5 02/12] uaccess: Provide ASM GOTO safe wrappers for unsafe_*_user()
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	David Laight <david.laight.linux@gmail.com>, Julia Lawall <Julia.Lawall@inria.fr>, 
	Nicolas Palix <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_070500_121898_6AF3BC17 
X-CRM114-Status: UNSURE (   9.89  )
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

On Tue, Oct 28, 2025 at 10:32=E2=80=AFAM Thomas Gleixner <tglx@linutronix.d=
e> wrote:
> +
> +#define __put_kernel_nofault(dst, src, type, label)            \
> +do {                                                           \
> +       __label__ local_label;                                  \
> +       arch_get_kernel_nofault(dst, src, type, local_label);   \

Probably arch_put_kernel_nofault() instead?

> +       if (0) {                                                \
> +       local_label:                                            \
> +               goto label;                                     \
> +       }                                                       \
> +} while (0)


Regards;
Yann.

