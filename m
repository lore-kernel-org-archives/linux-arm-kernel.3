Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F07C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 13:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5BkK/9+vx6s2eotlu7sP1AhcqapoAxZTN2ZPUj5+Rc=; b=kLdmhrrojtnHBPPLy2fDzufoqJ
	o/xaSbyRH7Ah9xAmss2SBAcFhx9jJQ1s6fJaO24/T79z5gtKLeKDghVfQ4CyOdghRe3r+4L43B39J
	rdtdu/u6REbzbW9C4PBEuPPvONH5y/0+YJtR90XX1Rf6O96AKVE35e52qSw3ODCOBO/SlCYz2wESh
	dUOeRk4+MrhSi2MMCrYJgmVqQs5tsQKSF/PK0JcDE3jaJXW0qokbE0ALswrpQ/NOY5ZeU7tgvSEX0
	tVRFmBEIhyiNrYqZh89zyst1+ibmN4SoOMu6gQL0SGknHcvCfW35cMEyyw8OwBU+WIG5q/lTvQb4B
	VGwlSbKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCZ6-0000000FJM8-0pqM;
	Wed, 14 May 2025 13:54:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFBfK-0000000F8wg-44J2;
	Wed, 14 May 2025 12:56:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=L5BkK/9+vx6s2eotlu7sP1AhcqapoAxZTN2ZPUj5+Rc=; b=oNAX9K/fhMw3OIpN8mSdGiFouV
	P8XLbvPjE2eD6Kv4OMR40euVIEaXzuVnu4ZpZpd04CyeiC6Dp4lXMjPyT6uFQy8jle4bvJeUYpXoV
	+b6Ywg73VJ8uyKD5M4MU4eGYNIcRQ1POWZr+O0aOnmyY/ih84VoCBjNIIQltDdnwf5PULDSv91WIj
	9QFt6AG/ox42llOOz169YEHMQHJdHCi9WKnVuTmbd1bAJNIQKFf4SQ9wzmtWmDDAPu3Kf5f4NTiRx
	bFzda5UFyW8XC/lJUpA55sLQ8oL8Zjgy82eXrEDDHSc375DZWb5xZC4pK+Eg4IUN/biX34ZemnfTF
	227cj5aQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFBfH-0000000H9yR-32Kl;
	Wed, 14 May 2025 12:56:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6A18DA4DABB;
	Wed, 14 May 2025 12:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13358C4CEEF;
	Wed, 14 May 2025 12:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747227408;
	bh=L5BkK/9+vx6s2eotlu7sP1AhcqapoAxZTN2ZPUj5+Rc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=q4pHremCCGtY/K88PxXXE2zElcPhPW8QC9ke0b0hfixqqaTfTDBPepN6yI5TcRehG
	 iVvpVkDF0e2HBoWfC6ng8oADLFCYDaxlCKyHN3GpfQQYqjNrPKFuohGzv95VPZZRF8
	 tPat4VVm8k1BKomELw3FsZZrF/uyH86O78tW0RkCh6twW2DVhyZiRLkw3t9tfbu7ej
	 MW6+z3eKWCZQki6FqoPhiOMvZeEAAaROyJjyHgersRO2cZceUlPiw1vvmrYEJZrBDW
	 VHSDoW1oaNzLtgB72Ws1zV4bDD50lOPSS7w6v6tt7kHLkghX2GapInrhFr4Ocii7f5
	 jPS/KglAN+rDQ==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5fbf52aad74so1799188a12.1;
        Wed, 14 May 2025 05:56:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXS08ps+oiqbE9qZtG3vzPj2QrgdxY69n0OYijbncMAxDT592dPSucDLfTml097aWIUOzDC8Om/JeDZhyn1qcQC@lists.infradead.org, AJvYcCXp+vwWPA99Qty/1fLeE8pgdPKTr6hlx848JZfQiKMmtYKBfS7N1sPx/X51OwpMloAoV/+QXwQjzkTRKTYLcs8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwMBxRxgrFcxn4iMTrxWqMRQaZQ1dvxv0XQmOpdDBNsqSWGLw8G
	VWIwjLau8PdHFDBajo2cWIXXEwP/0Ieg2dMsqE0oyEgFpvYJVYJzWfLCihSa3xh5lQhIE7SacY1
	JF2lj/7vLOmIQDluUcM3ZDf37lA==
X-Google-Smtp-Source: AGHT+IELhqd55PbVIK/fh9d9i36btbbo6ITEwEb2MGkOGa83e9SO6cYkeWuJWJU73KbPHDZHvvCElKYOidvz0QmAzl8=
X-Received: by 2002:a17:907:3f89:b0:aca:d29e:53f1 with SMTP id
 a640c23a62f3a-ad4f71df611mr370014666b.12.1747227406681; Wed, 14 May 2025
 05:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250514092259.47035-1-angelogioacchino.delregno@collabora.com>
 <20250514092259.47035-3-angelogioacchino.delregno@collabora.com> <439db3ea-4fb7-4944-b182-222663c09b3d@collabora.com>
In-Reply-To: <439db3ea-4fb7-4944-b182-222663c09b3d@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 14 May 2025 07:56:34 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLwXwmt5Smutvv+V-HfLzgYCqb-YRVx9ydD7rfmkiWoeA@mail.gmail.com>
X-Gm-Features: AX0GCFtnPmpM9IU37owWuZIV0h2y0QbqRqJW_C41vIQEFK-1OTfvM_nf1ApA1kA
Message-ID: <CAL_JsqLwXwmt5Smutvv+V-HfLzgYCqb-YRVx9ydD7rfmkiWoeA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: mediatek: mt8188: Add all Multimedia
 Data Path 3 nodes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@mediatek.com>, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_135652_033460_4C45BA78 
X-CRM114-Status: GOOD (  15.72  )
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

On Wed, May 14, 2025 at 4:26=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 14/05/25 11:22, AngeloGioacchino Del Regno ha scritto:
> > Add all of the Multimedia Data Path 3 (MDP3) related nodes
> > including its Mutex instances, one for each VPPSYS block, and
> > all of its DMA controllers, Film Grain (FG), HDR, Adaptive Ambient
> > Light (AAL), Frame Resizer (RSZ), Tone Curve Conversion (TCC),
> > Two-Dimensional Sharpness (TDSHP), and others, enabling the entire
> > MDP3 macro-block.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>

Acked-by: Rob Herring (Arm) <robh@kernel.org>

> Rob, sorry again for missing your previous email about the warnings
> generated by this commit.
>
> I ran a dtbs_check on this and I didn't see any warning - can you please =
urgently
> check and confirm that I didn't miss anything on this one so that I can p=
ull it in
> the MediaTek trees for a fixed up PR?
>
> If anything else is wrong with this one, I'll have to just drop it and de=
lay this
> for the next cycle as it's really too late (my bad, though).

Thanks for fixing. FYI, Linus' and next trees are tested daily here:

https://gitlab.com/robherring/linux-dt/-/jobs

platform-warnings.log has the top warnings and undocumented
compatibles by platform family.

Rob

