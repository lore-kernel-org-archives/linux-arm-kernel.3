Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A51E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 21:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHlppqM6gvLh+wGWzZMvi4bmlnS1UEsF/Gy7XASBKeY=; b=DOJd4STyjciOrvn7akW4CrowM9
	rUqbqUmymqwtrUgh49pwY2I4SeSmJvNU2iuE1GxJiiVNj7adCHkT3e8YSBvoPLDkrZ1UDTxEn1lm2
	TyN+9tC8PSJIfcFjQ43qfRn/VrjS8tPDQqijpFtmWNuD3vK0nfCvLxFLYa8EttJGuKgyRyX/ps0zx
	9avRuwqTnHJ1Sxad5MznJ+/y7XdSrQsBW93MJpCTZRVisB9Aw/HmjYxMSZFSz4m0vTJ4jmC/dpAbH
	oa/wrf+KePSWOkOxXI4sOE7xE5fxBlCDvvnYub7F1qsQ04I0iB8Qyxo0oQTS8XtJtUVls1P4vKeG4
	E2QHxT2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUuEf-00000002fy8-2KgC;
	Mon, 06 Jan 2025 21:02:05 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUuCW-00000002fY5-2AMA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 20:59:53 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-844e6d1283aso555222939f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 12:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736197191; x=1736801991; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHlppqM6gvLh+wGWzZMvi4bmlnS1UEsF/Gy7XASBKeY=;
        b=TgnvRF7ttNvXBVFgbChWWZoXH+91dJi/4/hUSniH+ZdD3oJ/giV0fmbOs+kSwNZYt1
         Ngbg5gLDhBWV0+PX6hZyz2rmdELaLPLgmC7dNAkY5j7THT+kcXm3/+BlhtFJhQkn9Lrj
         yDCSqVXK1h6tUXhET/Pw/RJbZtKxT9Ciu0s2urNgt9LhDO55BndZ4UlFm5aA8/8BNoGX
         tOkr8BOU9Md5zAsbksu/Z8r9YzcUxMKptrQnV9RsSAaiysqOIQLraLcYDphg4s1/oDTR
         /Blxrqa2+jkDh/LpnOQVmGdbtBeovr7pUI2ycrrzc6ru0fVs/PNVoTnbcpBzAKk7iNNe
         xjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736197191; x=1736801991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHlppqM6gvLh+wGWzZMvi4bmlnS1UEsF/Gy7XASBKeY=;
        b=UbntIthW6zjka+uoMgIh/UyMAddYvzwIW0K5XoVGkQd8mhTQCMyy0FGByLp0wEZtzk
         7pum910rGMqxo9h8IQiF7ClM1r1rS9DI+x3HBd+h8NzA5oHW3D4BaW03whZKAo6ITcG7
         ZO3PUmIzDl0VRfb6OMbaHQvWfIrfmMnpLQK97QWJcY+PAIOHjSYNGPsX+qqRBDS/AdZI
         1ACDTRR+LPKqnKiX6f6RE81wgC6uF+IR3hqtx5RRcdkKu2nGs/8hM5TELH8GaVOqxthf
         iWK/zYkQ5U+bidkDVLZTcieHYDhoiThlToWvGLqJaXDqVx5A2exwctp92dsZC4h2df9p
         HAKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwnhraS1LtpQtqaXfAUOv8o/vdqg1AGpWQuMmYXhkGXPHP6DRJ411pBM/+i8Wm5xJHKznZ50H0cEDYKcQ1fSbb@lists.infradead.org
X-Gm-Message-State: AOJu0YxoiWsv8XET0mw6LU0jAxSQ/MTdpGR99MQRpx8cRXXBNh6/Tg+Q
	pt7v6906OJCU5i6rnq5OZ6cZ1VtYDl1P08+29Zud5BFjpijrG9t/Udpn149pF/lMrHIGuDpEycV
	Onw5d7IymSCKu823fIaL6GmWjFe8=
X-Gm-Gg: ASbGnctqc+9uREy+cTzRI1Vy7iLsiCYw1G0qIfeq2zfI6s3mNGYZ1fIZLY5ju1KD4Bg
	ublBA7r1/nNF9XFVVGQ/EId38utjFp65ygbvsXyzKiSjFLBHLcYRsNFU0STOKEdsphLmv
X-Google-Smtp-Source: AGHT+IFsoTqFksRVcj1Uq3xa18RTL4eR+t+8QWVvILYJNxKFRhJkMed879iGVSYCfUIJr246vFnKVIb3m+mEWzm/jDc=
X-Received: by 2002:a05:6e02:3385:b0:3cd:d14c:be69 with SMTP id
 e9e14a558f8ab-3ce31d7b353mr6421065ab.11.1736197190870; Mon, 06 Jan 2025
 12:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20250102183232.115279-1-robdclark@gmail.com> <76b822f0-c4c5-4d47-8e0b-c1eee513e228@quicinc.com>
 <48373519-2867-419d-9f51-e7bd330b311c@quicinc.com>
In-Reply-To: <48373519-2867-419d-9f51-e7bd330b311c@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 6 Jan 2025 12:59:38 -0800
Message-ID: <CAF6AEGvDGtP_AAwDYnv5C3Bdg5dJk2muNUpT+yGYe8bn97OSwA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250106_125952_551215_872DC2CD 
X-CRM114-Status: GOOD (  15.57  )
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
>
> -Akhil.
>
> > -Akhil
> >

