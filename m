Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00A3C5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 08:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6x+9n59m+G4YPMddG96e0z0WQ0oCZ9YtThTaG56Vp+c=; b=lrHDmY1kklMf4Rq4DrRQIwBfs2
	2t7MktLx7DbhXyNMZKXEeuld6wlXwLwfbhOOVucEcYhqLF5IpKuQuLrS3XT/xydZ9J/ChfD7IaVr1
	CFKA9HMMyVQozPF/xsO2bSnIWSMcDagZMoSEBoW+5+szblP6SatwyPEatU3ZAcYpQUmznomZLABPg
	RHyOEVoCv2Ly9fpmumqM0Nih/VQ0LGqEbeBw0ZkGKDXPIxrf03jnyImlB+hjhpMBHx6maU3odkQeM
	z3qNXt3YmJWIozoPEu4QCOSWneMPeDvNcxngY89mmnskfcjOtQdxnQCTzqQq/moK6gTZ2Z3aZKSXO
	K4XGP/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKTN-0000000CZ21-1faP;
	Tue, 02 Jun 2026 08:27:41 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKTL-0000000CZ1H-093I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 08:27:40 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6877c719cb0so18146871a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 01:27:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780388857; cv=none;
        d=google.com; s=arc-20240605;
        b=fjSBlMdgLTqL0duQ5rEvCi+2ilSfFf4FdCdkhUwK58qKwbl2Ra6F62n/eK398Rypsd
         mgTbJfZlMSbm6lZNTMEgiD0mYo7WKyrMK29xIflTTR3U6/aWvdVTWlDq4htxcLBz/G4q
         yPU2pnenZ9Du2Sms8/qwrP7Wo0TrG032VDnhcN1FAqdGJ9M8YSdNBMFZ5PntZQuppyPE
         UKn4/2+NFXSC2JfPmDPcF2r5qtiAhGD9Pns1onXOk6j5SmVg4Fdw8Rr2B/A3MfVsCjQF
         Y8d1toE5FQTifS6Mgsp2TVKQXZOLWodhg8rKMOOFRpINov2MADXO8OtCJJW1kwZcKnUj
         qM9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6x+9n59m+G4YPMddG96e0z0WQ0oCZ9YtThTaG56Vp+c=;
        fh=vPwhGsYfcHYpj77q0IfZT7Ww/HLomyLesTiAkoR3sdk=;
        b=D6QBXuZdVH6e2aUuDTSqnwEjIdQ45+AY0uCsdIA2ibUxICt0cw1J4i2SSXBQv5b9VE
         P3KSakNHvZUx16FIX8YDu3VUo2R2TqaKIwNSr2cKkK9Vd//X4nsEB4vz8uL3faPOFYn+
         YodXaRUaPYW6hKE+p0DocNCQn+IkJF3pSEsgtDT4qRgn3Jum33Xiyl2ylOKVWChZJC49
         AoyTo5/dLlt4JOrC8fL/VnhDkcWfq3S7ZdAaC0F09+arHRfyf6vAsSPRcaKEn3mI+SMX
         0xuI+fD9/REiqHmF9wtjQXN1ODRqEVLF2R4q2sVF3bXKQ3/u3Lu/tNhpls+niQcwToiM
         INmQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780388857; x=1780993657; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6x+9n59m+G4YPMddG96e0z0WQ0oCZ9YtThTaG56Vp+c=;
        b=GWxT8q1/M4aV0zSzZ4PTwcsYZDnedLvraLiq786gQlXJt63BEZ00z8SvENlZXLrV4X
         UQD0749OdvHMEqAb7GA3gWsTEJALFZOFTg1ecGEbvJn+9ZSlEaCEy/WjFuSdbEHbsrCJ
         t67T7GXmbn8KON1PaT3OvOcHRQk8gQf9PjWtcwuBawhjcvSknOnRup5yL3RAfIO2KoNR
         h6jyT41Y0lDGKIqgA15h+BO34OUyAfR2kXvC+Nan2N7aojeONxcpSUxlHYbxGprOKrEI
         UQaA8zDsDEf6Vx83R2zhDjOOjVNQvw0cCttOT62sJn/hR9Jh9Y3sz0gZ3dZQA0Oh7PtW
         JDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780388857; x=1780993657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6x+9n59m+G4YPMddG96e0z0WQ0oCZ9YtThTaG56Vp+c=;
        b=W67DY0riyyXylyzYT0QSV43hR0D1aQCrVwre+HZSVjE0TMLVLC/iSrYK/dVmA81meN
         p6N+BhX4pARHmBX7VathXXS3JMiCAgAaBF3GZWO0Ol0kpumj0JynPWbaSkc6oZPHUA4P
         jXbwF+z3CPOb/vSIvWXEPpN5jULK1wJPnij7+Y880lDa55xMRhmYwl7GTbCpSWMiYG6K
         huss8qeMZDfKeblAYx5o9WErPPcBYITQGePNNc1FiLbfXLGEIKdg2YWqH0MBV7nvbn/J
         BBMVyxjTp0fchFLWaUaX8dHv3pR6TqbsaoPSrcJyluxFXRD5/spf6omSQ4/oX3N0ZU2T
         Ke2w==
X-Forwarded-Encrypted: i=1; AFNElJ+EIyIp5eXqYu+tgQKvFczmXZ1Oijq34XHtmpVlJ44GCj/V25lPdrcGytUr1Lq6NdiXAKowuOsHhsFAQLlbAkQw@lists.infradead.org
X-Gm-Message-State: AOJu0YyC0J2bEZlR1limvqWTxPbeL/Rpdy6Vfz3roRqMaD47nU7qcgel
	6ddORJoBJnuF13nIpKQvHpsY5hakQV3CcsCe2s5GsvF0EAL5q+slQtQxxZcIjbn8s58l5tmJcj5
	TE3mQOTdrbxaAcx10gs6yrb6BaP14jeo=
X-Gm-Gg: Acq92OEOri98oIsaQJKftECDIG3RAM6ArtIXsxigkp1fkiiz/5Vb8LkXZgbLpjhkMEP
	zZrB0P46gj7vZ2LllJJiq0CkbPNL0A3kXT7PcUhEaxGDbnknxE4JKvfVmdhHO0qqb2AoysHiPS2
	RASVCaMsRChbIN4zCF+dZT108D6n7qm1YgPyz6KL9ZY/B/LE5hXVnz4p+zDGFJYZdp5i7bWvWsU
	Rjfvuqqp8WTdFNeZGg8gF5INdVollt7oooq0cSBK+XE4rXb1CoYrnnJxZmshaj9/9a+7XGjD+M7
	G6rw5F2UJvisZwLqTd+43hJzgc4g7PaUTOv/CXuuZVKc0qC61Uu0ADUioKRvRSJ6nPKB+rLtEyC
	Jb2XW1d1k5a0AI6bRXG/2pRGTQnVohPz5uEfIWrCFamYGSOwGI4km/3SCqHcQCK/9WEM9
X-Received: by 2002:a05:6402:28c7:b0:678:a507:e837 with SMTP id
 4fb4d7f45d1cf-68c8a3722damr7179822a12.1.1780388856851; Tue, 02 Jun 2026
 01:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260602035907.623599-1-rosenp@gmail.com> <79ccbd62-9aa3-41a6-a8db-1737672a8aab@amd.com>
In-Reply-To: <79ccbd62-9aa3-41a6-a8db-1737672a8aab@amd.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 2 Jun 2026 01:27:25 -0700
X-Gm-Features: AVHnY4KsYOwyoqvI0RLAKZY3JiYBVorSJpxycwWf95nSCviCf0BvSwu_qC1NswQ
Message-ID: <CAKxU2N-M+vDeDKtYa6=M-4kazOUrGTrwJfHoF6Z+od1OZ-VBpw@mail.gmail.com>
Subject: Re: [PATCH] Input: xilinx_ps2 - replace in_be32/out_be32 with ioread32be/iowrite32be
To: Michal Simek <michal.simek@amd.com>
Cc: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	chleroy@kernel.org, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_012739_087813_FB89DF80 
X-CRM114-Status: GOOD (  14.58  )
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

On Mon, Jun 1, 2026 at 11:23=E2=80=AFPM Michal Simek <michal.simek@amd.com>=
 wrote:
>
>
>
> On 6/2/26 05:59, Rosen Penev wrote:
> > Mechanical conversion of the ppc4xx-specific accessors to the generic
> > portable helpers.
> >
> > Allows enabling COMPILE_TEST for extra compile coverage.
> >
> > Assisted-by: opencode:big-pickle
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >   drivers/input/serio/Kconfig      |  2 +-
> >   drivers/input/serio/xilinx_ps2.c | 24 ++++++++++++------------
>
> I don't think that anybody is really using this driver and would be bette=
r to
> just remove it.
> If not, no issue with that changes.
I have no problem with removing.
>
> Thanks,
> Michal

