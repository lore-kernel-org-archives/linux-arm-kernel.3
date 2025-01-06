Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A22AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 21:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOzmxccnce1E7CXNiUs8eoUX3tWPwgiUu+2R9Zn1q5U=; b=jJZ1M0TDzDjxDb0rJUOvVBcUIB
	jhjRhomGrle0L1pK2qqSGgfLnZ6pDfmUAoJoCZTapNhsYT11Q4Pvjk2TWGxmEHyb0w31tTXljjjJI
	wXqCT6n2LEGruLFgbZEqTVDASG28eiB3zgxTtOns8uYCPjHSkiQKa4y1cECT0W0wW+rJ6nesH1eg1
	du54LfbMJpWFozL2rPqerHPmKMRi8SfYWS3+AqlwsESC+cupW71n9tK72WZwX5ykUKfeoKal7zku6
	d3SljripLn70Ur76eeu9hDT8986jfzPu/LpfYBMtjYHcG6lOPXB/92NI/NYJXR7yFJwwXjsDpTunS
	3fXYf6sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUuFr-00000002gCn-1DPR;
	Mon, 06 Jan 2025 21:03:19 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUuDg-00000002fnt-310Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 21:01:05 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-844e9b83aaaso1260166539f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 13:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736197263; x=1736802063; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOzmxccnce1E7CXNiUs8eoUX3tWPwgiUu+2R9Zn1q5U=;
        b=DJp724S61p67EXtF5Xw4gmdGN278/rt+hlswvlx+9hnU6hn1l+XOOVXO7zezOgaCwF
         kTl1HDpXjwH6kgtF89XVGBEm6ZcMt7q8Bd8at87bNgBipR5xemM4c28F/0uU2MBA27gC
         sNLpKPgiEixs+JZ/f+qAg5G9Kwu4MfJQRgGeqmJ13egaQiW1K3s+2gpHZIKV3iCFmNgO
         +gPnRtDtIYY4EQT3KuC0XIdeWn6gNYo5hIFaCMYKQLYSTKDvmIQfbk7WOn9cy7or5nSK
         T8yVCNJv9GzbdVfoodYwco2B0NAfNs3xjCki+QKg/9Pyet8uTysSE36H0s+2sqj62XP1
         cExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736197263; x=1736802063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOzmxccnce1E7CXNiUs8eoUX3tWPwgiUu+2R9Zn1q5U=;
        b=sOVSIoZEN8XE4Ei2x5Zq069Yuzbh/zyly9Pnem88eVLYF6E1OSq2Bm6p0BSUu7sV5j
         Q3RtcT9lhc9EN2hOaBGVNpQvaixvrqfp7Aq8OG6PWHYadrNT/piTd4qdtTM8FqA50E/1
         sBaRbiipVXeWhXmNRjEZOnbPuPgTsRQ3vQF0/4E0fu6xQtbpk7JOe7SR0WEIF3CRK8n0
         Hj7YEkiCOTbfb7iFaHrdYTugYq32WPQAUu4QIrDBV3KqxeB3v2XyZQ/tVlM4ulSCG2ou
         OX9qcz47Rx735wywZ79X5Xmv659C5YkEcsaem9QGUN758u/VuIDE8ctTU+LO9ceHvsYF
         U8ww==
X-Forwarded-Encrypted: i=1; AJvYcCV9Agpifn0lxQbryXQV1mNCJ51yU1FHK6j+cS8gqpdTWMDg01BPVxnJb88oIJ3vlCIEMjfI1J/cltZgkawg4P1f@lists.infradead.org
X-Gm-Message-State: AOJu0YziA+Xbh9gKuqG7J5SySBv9KHwX5dyI1RUlOce1r6ftCnSCL5yu
	aYqine1lNgl0S5cmsmcDmIBtrjgZUKcba37EX/EdPdFRj347dm56feypFmC2WGpVZ8pAaML1RXy
	pLZyL/hRMdc4uJhw9kW84g2nQYP8=
X-Gm-Gg: ASbGncsrxJpx5c6YNxajsdBAxwG9eAX+0b2eCQtP3y0p0SAkpqbVjs0/qrG9P7Mtr/s
	HrdxZ42feDVZadhOw7YDdKOwjzNQlvAgRZpHb2sHGrzuvfrKes+c05NymbgByv8/7eOc0
X-Google-Smtp-Source: AGHT+IHqQnod+WLMTaza+oYE9/HZ2z8HLcXB/MzbtBLsKVq4Jqi09Mbkpt4Wcf/3+HNCWqrXskcu8GZwWbHmP3/D/R8=
X-Received: by 2002:a05:6e02:18cd:b0:3a7:81a4:a557 with SMTP id
 e9e14a558f8ab-3c2d65e508dmr468450635ab.24.1736197263407; Mon, 06 Jan 2025
 13:01:03 -0800 (PST)
MIME-Version: 1.0
References: <20250102183232.115279-1-robdclark@gmail.com> <76b822f0-c4c5-4d47-8e0b-c1eee513e228@quicinc.com>
 <48373519-2867-419d-9f51-e7bd330b311c@quicinc.com>
In-Reply-To: <48373519-2867-419d-9f51-e7bd330b311c@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 6 Jan 2025 13:00:51 -0800
Message-ID: <CAF6AEGtNBoWnLA_dBBC-4U7DrWLO+hM_-9iraXgc45Aj885nCQ@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>, 
	Will Deacon <will@kernel.org>, Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_130104_756891_E17D11EA 
X-CRM114-Status: GOOD (  16.37  )
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

On Mon, Jan 6, 2025 at 12:11=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On 1/3/2025 1:00 AM, Akhil P Oommen wrote:
> > On 1/3/2025 12:02 AM, Rob Clark wrote:
> >> From: Rob Clark <robdclark@chromium.org>
> >>
> >> On mmu-500, stall-on-fault seems to stall all context banks, causing t=
he
> >> GMU to misbehave.  So limit this feature to smmu-v2 for now.
> >>
> >> This fixes an issue with an older mesa bug taking outo the system
> >> because of GMU going off into the weeds.
> >>
> >> What we _think_ is happening is that, if the GPU generates 1000's of
> >> faults at ~once (which is something that GPUs can be good at), it can
> >> result in a sufficient number of stalled translations preventing other
> >> transactions from entering the same TBU.
> >>
> >> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >
> > Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >
>
> Btw, if stall is not enabled, I think there is no point in capturing
> coredump from adreno pagefault handler. By the time we start coredump,
> gpu might have switched context.

Hmm, we do at least capture ttbr0 both in fault info and from the
current submit, so it would at least be possible to tell if you are
looking at the wrong context.

BR,
-R

