Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87413C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 13:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=95X0xGDH/htI+O0+SsmKnC7glJi3n4umuMsOUsqLvKg=; b=hFEIsz0o93aioOd7ZmeNTRKkAv
	eL51Knl7IFuM6IqeDR8Z43XWE4RZMtHM8ChV1a1qWxrX0R3Pp0dqN/XbsyEfhLtTm5mlDBJ0asvOQ
	0v+/KRCL/LA/DZwHSiH1DxoVzeOtLNLDNMkiwIaH0aJmjBGKhREa+HNq1mxYrjGeKwmevge4ZN2Dt
	GiB9h0bMXZcNkWKoEEc26M/j8IP/Y5c+B8urI6lMng6MQtr+AERkk9UemgahaYL/1ZWHkW2jzdTYY
	A7pp/4lOoAHtxTufFiWpn68F+NEQQbzDJ/ehTiXyYHVVWI56UnPJhT0A4K/+iFDtzSItFUhJyr4Oc
	OH938DrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVnO-00000000mf8-0m5M;
	Thu, 13 Aug 2026 13:48:34 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVnL-00000000meP-3Dy5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 13:48:33 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-51c15a5b265so239481cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 06:48:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786628910; cv=none;
        d=google.com; s=arc-20260327;
        b=hIWtZLcLBo5HklrQ+GGmbFc2dTdXSF7MARgAgHwWI3r4GLWUTU6S3EUe9iLWOUxxA+
         Se0F5Oae61Y3wgQh3nt72hJ6ewFhgQJzV79x0LxwTPQiW0ff5VG4oyGlYy35Og2SO+54
         WREEezMUTlZU7V+gMX3Xf8myw4faZJ+cOLznDpXxOS+3JPGoNZdQw/uA2R+biBq8oE8c
         2GSGpNLzHI3yyuun1laRhfxCw0s3680TA/Pz7m3+p6O16bbZ0xKsaWnI6O+1vRTLCCM+
         KBu4GWDROjEiVabWsdJ9sq1bAirLguigVzidqI/RPmRiOKuNvAs0WBco5jgzwWtwJJ+7
         n9Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=95X0xGDH/htI+O0+SsmKnC7glJi3n4umuMsOUsqLvKg=;
        fh=8o1ynluZdXDjG+r6rbmR5uBv0bytYkfTkx4Qatp/0BQ=;
        b=JJNu9ZjsoL9IR+4EbqIMLTV/tbwYfih61COV5TAmxCfDr4ZHVdHwl0nA2+/JHCMTv3
         jragqffcn2vwpM6waSbzQw3nnRR9UHQ4S1CXQeVQgbth2tQMp2q7Y7Vx0FClvgZBSCLJ
         g2cVvkN8J74ty1NbHBFxl2uDaC3yQ3ftkfavnJXDaRqwpxrS04Qr4idvCn3MEggEl8vt
         KlD4w9t8NzQe+0YB6RP2g0u8BS02VLedMd/ru9qji6rVh7EW/1CtU5r5gMC8vuXJXvyH
         QCIhoYpv8banIM3iLtTjvE7pISTYJCl08jRF1KMLEY2GWYRHlHaaxT1AiHFcJmDDZQOv
         ewSg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786628910; x=1787233710; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=95X0xGDH/htI+O0+SsmKnC7glJi3n4umuMsOUsqLvKg=;
        b=wnPCz9DeeTz/SlDr7Rj19sWqTaEfvFqiaVoE3e1WI+qy5XeZAZzjcDLAi3VCB0t4FN
         iWb32AJU4Cp19bOmpQsXZ1sMj8j8AJDkoUE5ocumKQUKsqnWUu10auYBfx3JRb4oORLB
         YjQoWw+MPWeCbTpnYtk95fwlKxJYtKFLtS2+ps4mqbbas4Weya2KaztTFxayxmzD6vVP
         IU/6yM1BQ+CsIHRfjNThiihUxTPIvybPuHN/F1EN1WUhf51q4++rTDDjR7OdU/YdtSCU
         /yBFka2n/VABAtferAttLptC383gmR55TJ2vRvnJKgzIJDpp3y5iDLKwH3gkl37FzJ0W
         tN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786628910; x=1787233710;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=95X0xGDH/htI+O0+SsmKnC7glJi3n4umuMsOUsqLvKg=;
        b=AKVZZSDAorUuWPeZkwmHcvrwwVdTjeS26T/Y94SueM6jMaF6ax8PQIpkVnYk2K5ccS
         RRkmV0fesw/CLPebFVvfN6msJIE2+/3EBK8fuZJHxZ3EXKzJPB40C4lOZmIYHpshtdqr
         NJxw4fylGH/Hb4dTXDaXXlW42mvVOy69XooBwdxcMzsGsYxeEdcqh0AZ2CADvGyIDUSl
         ENfeA8Lm2GiFIUkziqJ7EVaLHYCIKa0WQbhAfQmRYVu7DE9om4+SdLmVyBGJBZWlqxhX
         75inTbB+9etFxoJCR6y9rcTwuVigN0lB13uXqblckJT/9CuyAERZED1SlDhWn+Y9MVy5
         8d7A==
X-Forwarded-Encrypted: i=1; AHgh+RoHGjfD59Pg+HXSe4nLm/pd/Uj+NrWORNXZZnUD7VCaiZc73a3NoKalmPJOJ/WufHQuK93WdZ3U8BQ/dvjUhdls@lists.infradead.org
X-Gm-Message-State: AOJu0YzxtACMnYNs/J85ulmuskNLH1ReiSdPXIu+A0ZRigqPBJBpRd/y
	Fkbf0++pyCiWJrdUB5ZZAlVUJWskGqtJI4awxEShVQPfXFzGP2KUzVBwmhiwvt2zRMFCEQ1vks2
	7jqTCJs6SU+5/PbZU/Brqv6qblB48EYzvjWUWH+Zk
X-Gm-Gg: AR+sD11ogte/Asxx5dvS64eqbA3t7FbO5Ac72HuK2LX8i3BHUWCG2ywKXGdlF1mSvjF
	6hQIxiQ0eZSgJly5rWu/nXkR3CGK74S4w3WISiO8MH6QPtyT+9o+FhnMPfMNiDMRqNGz8kRU/k4
	z9Dsbs/HPQ2FzAe2s5o/YZSuU7cswPIHG7MbEd1wixPOvbmwXTLSK+j2SQ5z0+KPPqDcovpnBSr
	PNIcmc0TpvVEoScYwWmBDYPeZIVjM/68qzT0Q1mmjK+1Ufdw0ptd4OjvG719WvLUK7mZG8+ncSQ
	CalSYED5Av/gVwIU+mjKDh+PRDgVvKAADlFSubQ1wHzofw==
X-Received: by 2002:a05:622a:1910:b0:528:3186:5799 with SMTP id
 d75a77b69052e-52d768d5d2cmr2627311cf.10.1786628909923; Thu, 13 Aug 2026
 06:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260812002728.2283079-1-irogers@google.com> <20260812052417.2361040-1-irogers@google.com>
 <anwuYYxLFbtDmmHx@willie-the-truck> <CALeDE9P1xZonVnZDExR_hMafd4mxahkjBVTDLJenQ6DKW5MSHA@mail.gmail.com>
In-Reply-To: <CALeDE9P1xZonVnZDExR_hMafd4mxahkjBVTDLJenQ6DKW5MSHA@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 13 Aug 2026 06:48:16 -0700
X-Gm-Features: AUfX_mxpNk_3iJtiE0EeIVhw8BTBZeCO2omT6q3DILEf19QXO8fjDxzqZ9-wBrQ
Message-ID: <CAP-5=fXd2HETe-484Pe5wMTGPiXbLheMaW6ZDpdD+YCtKoBHVg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] perf: Add Raspberry Pi AXI PMU driver
To: Peter Robinson <pbrobinson@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-perf-users@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_064831_809559_049631B3 
X-CRM114-Status: GOOD (  17.62  )
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

On Thu, Aug 13, 2026 at 2:08=E2=80=AFAM Peter Robinson <pbrobinson@gmail.co=
m> wrote:
>
> On Wed, 12 Aug 2026 at 09:28, Will Deacon <will@kernel.org> wrote:
> >
> > On Tue, Aug 11, 2026 at 10:24:15PM -0700, Ian Rogers wrote:
> > > This patch series adds an uncore Performance Monitoring Unit (PMU) dr=
iver
> > > for Broadcom AXI system and VideoCore VPU performance monitors found =
on
> > > Raspberry Pi SoCs (BCM2835 through BCM2712 / Raspberry Pi 1 through 5=
).
> >
> > Why are you sending four versions of this patch series, at -rc7, each i=
n
> > reply to the previous one? Nobody is going to review that.
>
> I'm also wondering why this is called rpi_axi_pmu where it very much
> looks like Broadcom IP, and is possibly used in other Broadcom SoCs,
> Florian can you confirm what this driver should be called?

I'm somewhat agnostic regarding the naming, and having a more general
driver strikes me as a good thing. Fwiw, I based the name on a
somewhat similarly named non-perf-compliant driver:
https://github.com/raspberrypi/linux/blob/rpi-6.18.y/drivers/perf/raspberry=
pi_axi_monitor.c

Thanks,
Ian

> Peter

