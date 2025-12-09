Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571ACD3B7F8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 15:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SetV7Nogwo4Y6y/MdScUic+GOHg36F6B6GsXR0/bNHo=; b=ffzBndEqcA/dflfYDPB4GSxjCr
	Sld8cyTCMFaoTfEtutZ/FB5oSbQbtVj5ZOruvF9nWbB13AlkXLFUce3TVAkP7nyCkpKnbuRUX8n1e
	3wvB+rJpFQ9szk4JeTZgRj6xBZKPkVe316o1BZjWJuacJxkr+LbHAxakhLXUkCJeliydWMOJzvrbY
	MdHgPr0ssXR+7IlXnR1as/fAe0xJ+en0xhH56ccmY67JXKu6IN/Ke8qfDtj+W0sVdlU1Jz0mXoPiw
	OWZ0E3iUSCjN9x2Iy6A1AgVzzpoRxZj2sRHa4hKk/CxqkW14+ANBjE0iAczwXPg6NLV3Nh3GNocLQ
	HW+lAotg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT02a-0000000ETku-0KEL;
	Tue, 09 Dec 2025 15:54:16 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT02W-0000000ETkW-3ZMI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 15:54:14 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so10082514a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 07:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765295650; x=1765900450; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SetV7Nogwo4Y6y/MdScUic+GOHg36F6B6GsXR0/bNHo=;
        b=SHTR5f7lE5UgsVRl6VjeXTCfrwvyhuMMPQDCUttMwBQvLguI34bJ/Mri7tJ8PzXvB0
         z8EsJBdsvwgE0zeCQWAoirJALCIiTlQ9cuQrUMw7I57+/iRDKniFW+iBaD/K0+H8ajQe
         BlzSp5LqfmdPMe+ix2a/dOSFZ1In4Or721q1Tm2JR/pIbJwNDB4FXjoUSQ09s3QBuLCW
         b9Iq1m9KeOJh2TmcWESsLah3PeU0GuSGqepsWyqADaWE14XOu/wvYEMZanRwKBbdezd2
         xSg11oLCWf3hMLMibDdx7it5XlCgACvenPQKERrSCibx1WlTj++lE/Hq/Aqmya+u69G/
         1QIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765295650; x=1765900450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SetV7Nogwo4Y6y/MdScUic+GOHg36F6B6GsXR0/bNHo=;
        b=STTrAiJmq+O9zi2IM952AiBVGNHmGXhAEc3tD3RZrxHXPvDGUmlswNjjXHoWySImjQ
         xIM//6r+AIp5Oyv6dppid/2KT7PNn0IZXHQqQ1dvIfpIo/Mp8p3N8fagitLDoDtccjNK
         SEE/1aKRUzRsTQTh+xzHJdSPiNMNn4pbkHrz7K6VslV2Wz/0LccIDngNYulBncXrgK2T
         abdi2z3sAj7noq+FSC4ttlb9X+bgz+oYJGNgefME44FmW75fF1XO0H9IF8Xy1SCOOEP1
         WgSxKwc6QRdFBco9MjOXA76LZ19m3F2nukZunraAAHhik8JWwgiAYQRQP4d4BaxF4pmc
         hO6w==
X-Forwarded-Encrypted: i=1; AJvYcCX9m1Tg8z5DvJAABpVTVxnCEICMm0GbgxE9hQvpNbm/DC8kzOo1dKtUxBr4fmxZxIZuFs+LNLGkKbTQKUyRyA4v@lists.infradead.org
X-Gm-Message-State: AOJu0YyL6o5iR3o/8+YuVNBAid7Ot1P7t5g7ydK7rnMzzZGee+CN/Q3Y
	EevjBk4oIUONZcYzAtZMbfew9iI/Pkc12LzdacVNlXv/RVN/WCqCurTMXmnvVnjotD189k+Omi4
	hNfWqqa3rdtNiQ2FeB3fezeNu1Ifw4ztx48kDbG8F
X-Gm-Gg: ASbGncsuTS+Zp2D0oig3n2WjoFJUNRsQP7DcdbifoJd53bRHqw4G1TQagfXL7+M8DJB
	X8CA4mx9lWMkvyUSAbnAbgZ2OQl+ggBetWMWraWn9eSnkJt+fEt1/yeOjZ5xU8Wq7sCXWiTxryV
	YeppZ6aNahLDk6rAYIqAzgGCIsmnnYrO+xB37ZB4N5rEhh5vmdzitWIqvmSqkFsP72v6UgYeQPO
	6XPjp0z8QXql1TW5V0HF/uN2vd9KdQ3WAevi0BTVoZm/YOTQGQKT1sCWDRlHfgBP4RMGf3dzfFD
	ACI6C14NBxnvVIJ6zCUNPOq8Yb4+b512Xk4a
X-Google-Smtp-Source: AGHT+IFyrSZwE+NEm2AZv924gTZmqft+TAVrQvPS2Dz4BBcFH5MviTKG++r8Bj61zdlRQuu6TirVeuubpGVSFTh7KvQ=
X-Received: by 2002:a17:907:d02:b0:b73:6b24:14b5 with SMTP id
 a640c23a62f3a-b7a2455d61amr1403446166b.31.1765295649816; Tue, 09 Dec 2025
 07:54:09 -0800 (PST)
MIME-Version: 1.0
References: <20251205215901.17772-1-james.morse@arm.com> <41bcd0d2-d5b8-4f3d-b0b3-132387f547ed@arm.com>
In-Reply-To: <41bcd0d2-d5b8-4f3d-b0b3-132387f547ed@arm.com>
From: Peter Newman <peternewman@google.com>
Date: Tue, 9 Dec 2025 16:53:58 +0100
X-Gm-Features: AQt7F2pJqMDmks-I7YiFF7Fb5cJXsrRor8BxaeGvlBNB5V6dc9qPEBXBou5g5Ps
Message-ID: <CALPaoCgDuA1D+ubUv3UJ0+LyUfjCFKOcrEhg6Q80rNK5idjEmA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/38] arm_mpam: Add KVM/arm64 and resctrl glue code
To: Ben Horgan <ben.horgan@arm.com>
Cc: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	D Scott Phillips OS <scott@os.amperecomputing.com>, carl@os.amperecomputing.com, 
	lcherian@marvell.com, bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com, 
	baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>, 
	Xin Hao <xhao@linux.alibaba.com>, dfustini@baylibre.com, amitsinght@marvell.com, 
	David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com, baisheng.gao@unisoc.com, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Gavin Shan <gshan@redhat.com>, rohit.mathew@arm.com, 
	reinette.chatre@intel.com, Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_075412_929134_C2507C49 
X-CRM114-Status: GOOD (  21.17  )
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

Hi Ben,

On Tue, Dec 9, 2025 at 3:40=E2=80=AFPM Ben Horgan <ben.horgan@arm.com> wrot=
e:
>
> Hi James and all,
>
> As James is otherwise occupied, I am planning to post a follow up
> version of this series once it's had time to be reviewed. I will be
> posting my own review comments; please give them extra scrutiny.
>
> On 12/5/25 21:58, James Morse wrote:
> > This is the missing piece to make MPAM usable resctrl in user-space. Th=
is has
> > shed its debugfs code and the read/write 'event configuration' for the =
monitors
> > to make the series smaller.
> >
> [...]
> >
> > This series is based on arm64/for-next/core, and can be retrieved from:
> > https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/gl=
ue/rfc
> >
> > There is no snapshot branch - this is it!
> > I'll push the extras branch once I've gotten a handle on the DT shaped =
mess in
> > there.
>
> One major departure from the previous snapshot branches referenced in
> the base driver series is that the same MPAM setting are used for
> kernel-space and user-space. That is, MPAM1_EL1 is set to the same value
> as MPAM0_EL1 rather than keeping the default value. The advantages of
> this are that it is closer to the x86 model where the closid is globally
> applicable, all partids are usable from user-space and user-space can't
> bypass MPAM controls by doing the work in the kernel. However, this
> causes some priority inversion where a high priority task waits to take
> a mutex held by another whose resources are restricted by MPAM.
> Thanks,

In our experience, the disadvantages of the x86 model were worse
because they triggered on hosts unintentionally, while making the
kernel do work unrestricted on behalf of the user at least requires
intentional abuse.

-Peter

