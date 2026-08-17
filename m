Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0692EC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 06:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yeI5MCV3/YEvQ/g6wzqsSCMXaseFn+RX0ROFnasM4K8=; b=J/x5sqH9G8UU2sfX3MYzarJ1Kp
	6reDY847zVgidcHxCdUB808ix+iez2zJLEkQM/uAs60opFgiZDwYoV0IGE7rvLrzo3cczVBZ3lKzP
	CAjA1rnTzRVmeICAvSZGWf3yeS7bs+JUiq2z5kbkMmCJmRXzihmfX0z8y3MML+9cU4nOHUsYh38jD
	mA3oIB9rpZxLO40nJsr48MrykifHGpbH/W0Rf5JpW/KovfhJZkvcgb6YzTvq/Ev6W8TiA3rpZyUtg
	749ONahfxCktfIBX1VwK5MiHHpHlcIMO3AYHeZqYPSscm0ZFxJskVD9r6dEViskXrfc2CqtYSN4ss
	nRsypmFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvrIG-00000005VUG-2PrM;
	Mon, 17 Aug 2026 06:58:00 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvrID-00000005VTT-2Bms
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 06:57:59 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-51c10ed63c0so559431cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 23:57:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786949876; cv=none;
        d=google.com; s=arc-20260327;
        b=hfWGj3BvnUCLuWTkjaMmI1H+IANGhyCh3Qbvi/QS0WlETGOU+fYsZ/3JooeSAxJ7ob
         7JEn1+dx61iafZ6RhLuCgNnHLtZayJ+Jlfj82qTTydsa/4OCd+VWLjMxd0b0YDVR6qWT
         Gd4VEBDFfV2Bkmy4V13d7CoTFEZRJbd4+Cz0hL+QlOoPEilp6f+5JKPnypns4/tRkwgM
         rN7MraTTp/Vfrjykpyvoe5fsNMbnZ13n5zXGSh/fpkGuHouWr+L3Ol8RwmNNFXuv79++
         1VT043dQU/SLElvoP5vIETkpX0E4ohDzotV07QSB7ieEcHxmMMiwsj5mWXTUbDpXSl4a
         eiOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yeI5MCV3/YEvQ/g6wzqsSCMXaseFn+RX0ROFnasM4K8=;
        fh=TL154UKaRK4X65HT25XSFNeFT+c6eztYVd1OLqnjm0k=;
        b=JJxskrSFaRniDidCTYzGhwxJte+LY4Wh7M64m28CBCbUMwgtKQ7jVVS8Bhm/j30567
         hXVfgGndhK5wqEHWcJHpAOmQSQyk2S8ewt8VROC3iJZ1wx9IMZPz+8rkqdHe6+wQ5Az+
         ExICbnbxFE1bZHKdX0NSqXcWc8sXeU7xj3CigLxDo5SW3Gg2hU4Qt7CScVyi7WQgnN6s
         I7sybwERZZq3e0K5j24aZVEWSasaq5qjnTHKRbqcXOfECMOaaBkeGj8BrnBW18TcWmew
         0H80xst5tr2C8MhKUpNxm1hLam2DTZvLYHxeS4RkuGWCyZb7Yau7t9QKItGfbebJOens
         Tsmg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786949876; x=1787554676; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yeI5MCV3/YEvQ/g6wzqsSCMXaseFn+RX0ROFnasM4K8=;
        b=bsAEaQ72AczXecWEKSc7b6+MKT6hj0D1f7sFTq65AkNMDeDZiDI4bvDyjuVVTxY930
         113DGiONu9EF5mJ0m5Rbv4eUNIId7quuf3xuRn75aWVXLrfGJvMSPLbJJGL43cdT4qOQ
         cuMApKeQBz8gIhOGoxYZZCuyYW5OfulmcogfSw9Uz4TWj5G11UoXOnSvzPI7Vn/SsF7f
         RdQMKpFTsjkroUwiiAff+WAlxnZjv9zIe2riz7Rc1N6ai55Ab4UpkfSdPsB+STrRcmet
         0ncRlexfmxa0ntrsEhg7Ti9XTfXC6/Co77uGo2eIoPHy3yl0EizIApoEsCvAXqYGdtjZ
         yvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786949876; x=1787554676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yeI5MCV3/YEvQ/g6wzqsSCMXaseFn+RX0ROFnasM4K8=;
        b=rnimmg9pnHynV/bLKbIFu3dMmZRlgpoNhnGK4/f+HrFtfO2stnijYAmrnYwviDO1ej
         qA0O+2Nx/bbN6LBzpDuPvNcWha+bNuaQ/yOhtkaSh5/ZW50BD5ay6Mbki+vAxh2ugFZ1
         TdabTeisEBMv499gEOEnYYG7+KY9G49EuAvatG74EwhO91O3wuHjn8uotxLX9DTDxhs3
         rczLL5soAIoX3Uarr+LOj9PLUF6TKJkWDKWXHVCn4CIRgDFvzfQIc382NR8OUxzNbOOL
         uvao9yUSHkJD8EyRStUfgDfZXqvUM7Ahz0RM2paXqhPxU7PcoxkpdzAXw+tYdcJNtEt/
         4eUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4u4swTJcgH/Vb2YJqcyC7N8vrFid+PAQ6CawvM5teogGG8KkOHUOoBwYKRCSdeeYnMbLYYnUdUAe5OQ2JwTFy@lists.infradead.org
X-Gm-Message-State: AOJu0YyI5hD24BqXbvOPKIk1ZSIgbcoGxTcqjw7X27+f6Fwy6tACi+av
	KKP22FuERVkRcTNtAuWnERDUihBYfwUqVbyb39byinE5MbZnUpHxToUVKKxi9YVC6PmvmxQ2Af2
	gPp4v2aTPeGibLCX2YChiD1Ir78L6CiYn/JrJzEWW
X-Gm-Gg: AR+sD134zdXIZ0bRSLQU/ku7PQUa5hRfMOPsWiwsUUhdlCdzhFTS8BYE+C24xsJ2GF3
	mfFs674qW8crk6NwRr+EdntrY2cnTH2slMinB2F3Cc1tXNhphfsEPhNlE2yqcE8JatvjDXgLjc/
	1jx2a1WQYH9Vzbyn5OTCkmtXiqWmgjwlDap1+KY8ecT1wU1bBdITQZPCudTeooRFzm19yUHGhA/
	JDjOACgSwQQQa1xIbJb29hAUMCSdHGOdcRQk9s8h4EMIrI2nMqkX3G+vYWCUrzAH38E8uOBZvCf
	bVujh3wIothrZrmTQWxjwVBPcdnKRDzSK+NtAKI+Kkp3CSVbYJm+2AFA
X-Received: by 2002:a05:622a:1b1e:b0:517:5ac7:332e with SMTP id
 d75a77b69052e-52db08d8f71mr7532771cf.6.1786949875662; Sun, 16 Aug 2026
 23:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260815082048.4043217-1-irogers@google.com> <20260815172712.50119-1-irogers@google.com>
 <4998d0ca-eeb0-4b04-b3ac-a1f97c1829f2@kernel.org>
In-Reply-To: <4998d0ca-eeb0-4b04-b3ac-a1f97c1829f2@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Sun, 16 Aug 2026 23:57:44 -0700
X-Gm-Features: AcwNN1WIDwcRG9rKkdw20Ao8jDTswAL0Iln7nq_5f4EldOGZnTb7gA-VYM25BGg
Message-ID: <CAP-5=fVffrRgO4OM6u=JTEUwBY0np+fUExqOpbiYU1JgyMr7Rw@mail.gmail.com>
Subject: Re: [PATCH v13 0/3] perf: Add Raspberry Pi AXI PMU driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: florian.fainelli@broadcom.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, pbrobinson@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_235757_629922_310028C9 
X-CRM114-Status: GOOD (  18.43  )
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

On Sun, Aug 16, 2026 at 11:20=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 15/08/2026 19:27, Ian Rogers wrote:
> > Motivation & Background
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > Currently, Linux lacks a standard perf-API compatible driver for the
> > Broadcom AXI performance counter blocks on Raspberry Pi platforms. Prio=
r
> > out-of-tree vendor solutions relied on custom debugfs nodes and ad-hoc
> > kthreads, preventing integration with standard Linux perf tooling (`per=
f stat`,
> > `perf list`, etc.).
> >
>
> Slow down!
>
> One version per 24h in normal cycle, not 13 patchsets in two days! (and
> even rarer during the merge window)

I'm familiar with perf-tools which was set up to follow BPF's example,
both have -next repos. The -next repos merge into linux-next for
testing. I agree that cherry-picking shouldn't be done straight into a
pull request to Linus. Is there a principle against using -next and
linux-next?

13 patch sets resulted from Sashiko reviews and subsequent addressing
of those comments. Yes, Sashiko was run internally before mailing the
changes. No, waiting a week between versions (a proposal on this
thread) doesn't make sense as addressing the feedback would take 3+
months. As already mentioned, the current churn simply reflects where
we are with the tooling. I apologize; I did what I could to reduce it
and you can see in the changes per version in the cover letter that
this addresses more than just the mailing list Sashiko review. Fwiw,
if you're not familiar with Sashiko's reviews it seems you should get
it enabled for your mailing list - Linus is positive on it and it
generally improves reviews and reduces reviewer/maintainer burden.

b4 handles reply-to git send-emails with `b4 am`, each reply-to gets a
fresh message-id and that's all the tools care about. I forgot to run
get-maintainers.pl for the Documentation change, sorry. Since more
important drivers (in particular Apple M1) are currently unaddressed
in drivers/perf, I don't hold out much hope of this driver landing or
receiving maintainer attention. I sent the patches merely to help the
ecosystem and encourage vendors to interface with perf. So far the
only constructive human review feedback I've addressed is from
Florian.

Thanks,
Ian

> Best regards,
> Krzysztof

