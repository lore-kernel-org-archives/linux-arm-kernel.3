Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80328CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 18:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QAVeQUNR8QlKT88CvPGnIFfod1jue+dHBAvLJtDcBos=; b=4elF7HQvMFzCujlsaxHl0zZOzm
	vHBgGi4+OrPaxX1Udxe63CRYyF8eI1s69xHZMfh4u9BeoYH6NTWYQ6rHQuZrznm3fZxSha1OWdi6r
	u055Voa7bnckqyhn1tQwWuGHybLTvlX6o8fpgTcV+YcW308vvomlQL8WEZ4+u1JFxrL3yqDt5rBdH
	MoIkiEV3ehJYOjwGVmR9MPMzy/s2niUDKowdI0oB6Zfs5WnvIEQMSfrm2q+ICm87KNmAa5NE7jGKf
	C2mCVv8Un6DrZopbTXG1WyB+L9KlgKxXa7tMVt6kz7PHycxrhBxZ1aoOv5wymugZ2doEHfRcLzEVT
	aHrs541A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1Hu-00000006CgP-3Rpi;
	Tue, 09 Jun 2026 18:34:58 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1Hs-00000006Cg3-45Pw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 18:34:58 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-68d22476e88so47874a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 11:34:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781030095; cv=none;
        d=google.com; s=arc-20240605;
        b=iJ832IRg8EjTBSMu/QNnydeLn95UbLPE5D5JcOL3l04ABcLgp48/Moa0Zx4g8lfXtq
         NU+mANjhuQE907hD2/5UVOFotfD+ECVyBsJiAugd5OLd8j+k0lK6AODTi6Bpm9NcM9ds
         zniGyzcT06HF8D9mDRLkzI976egHPVCsnu1SwTVAcYo3Iy/MIogtM4ulyQf2Sa86L15H
         8tay7kRmMssbxeOocpObNdLG+e4wIt/MY8JsK5H8MX8IrciFLeXqGeOdm0Wt4bS3Af85
         WlRaI6Px0QWVHOEuBz1CdPFSkFmMkudd0XWo8YJWM5p2xSCHVr+Jn9kAakjlo8gjXQbO
         eO2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QAVeQUNR8QlKT88CvPGnIFfod1jue+dHBAvLJtDcBos=;
        fh=I9x9URCs4iNPgrNS87/LvIorEIa47mASVtcMYf6bhZc=;
        b=Ldf4zrP913mG6S1NdFn8q+Cc2V7LkeRrN3PYehrJiCDMN3gxS0gFild0b7gwtyqMi3
         vU8GMKPE3mI3evxsNcSAGmBzDgZvIbxJfuHeKqFFQKN0ciz2LX3lbreEys7HqXyj2X2N
         i7bb7GjtGXlzQXC1d3SuAKun71YB37MC7fkYu+tiEJl3mRafMfwnSPbUGbmepvUkkGb7
         nbrIB4Ku66/aVF1OXAe01s19MfJ9v1c2cLszulTMXzpvrTL0fXUwt1IYTpFcTDs6nopX
         GksDxObgvFcyjdShjQQPriICRU5fPrwYlhnB4a1YedJVptg9/0TrjmStp6msgubw23Br
         yEfQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781030095; x=1781634895; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAVeQUNR8QlKT88CvPGnIFfod1jue+dHBAvLJtDcBos=;
        b=f0eQDsPc3GnU9hJMWPJsyPxV27y7I3IgR7Ex4IIVHRMorNfJ2vQU+6n/eJWgoBRCNS
         HgaPvpIeVOIQEiAgvYitnDogcUkIleyvRWQRFt4nYCj7lDITtZPVu4hXDpZRiCxatQe6
         q8H9ey6HFV/Om6jDEnT1OLNJ7ROVTkowCi9r8VtxTaZqD3h4QfHqjNI7NrraY7m0ZeGT
         I1zkgAah7IXOZUPL/UYN5qVT8KBIc0fcsoXXa/PudlWQmKrDuuD6DyYbByeJ8Q5kTz5A
         LD9fMmONddmNCH8I5/mdUiFUsRIgjWIJ6yjFGjw3Zwop5wX6BoQhNu/t8R1kH4+xLziI
         +UPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781030095; x=1781634895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QAVeQUNR8QlKT88CvPGnIFfod1jue+dHBAvLJtDcBos=;
        b=YdoxDEHniJ0nRs0VBYlaR+vUFBMoFZ+QVtBNG9fg82SFhAeRVO/UqrZPQtOyCU8vT7
         XseIbMXd2OGFGjIaQeQNNKqRZ6ophsgeDZitnblK7kSwysev74yO6wv4o/M8Y6aXyhR2
         58HGj5MSgEB6K21Zl7bNELaXaw765CVmLdFW4e/slvTAJjISWXo6hTVri2+FITdjrZYz
         mH/dK0nFoAhlNxbvDfKN9tAzprLMpDU0XGbpGKQjBT9FASq5QJtAuACGE10jEHLQo2za
         MtJMEaVNyICpLXQ8eInqQa0qwLew8WvDg5srLQ+r7BuTOUxQ2+qSIwOzwKrDHot2mQlP
         hjug==
X-Forwarded-Encrypted: i=1; AFNElJ/gklO2KJUIZOaKzQvUHnW614HklDVv2GVc6rvjFdUVFg8fIc53OVH0WDfOHbfI22Cop/djtTKKyKHEHQ59wUz7@lists.infradead.org
X-Gm-Message-State: AOJu0YygrfaktLuklpz7VgxRboHktlKZ6kEHE12C3urdtsCkpaTS5Bdw
	xhsbG8B6K4cNSD4vkNasYtO9fTAH59GD2RcSoyu0/7gewKxJHCTR/zLWM/IrB7aBt9z0gTxLMdf
	+oIyNUJtNJ74fXjDBq6VxVfMy+4V9V6bOjve1r7cQ
X-Gm-Gg: Acq92OFu5QtziHi33N9MvWaxyWPts0rITitCVcjKwWRlHL0oMKIzUOmfepN6mpZe2+B
	5iFuY2t5b1krJIvfRsb3FOnUYNvfsCM4YK435AU05U/C/rVSDNff0ZJ8xvdY7o/uLrbT8GzaVdk
	oyEhWq7fd7OnaW9BI0LsJ5nCLz/DDsCrVNarns5iwBeZtxhyu7twPV9n0HNJJ6I8KYyt7L8Ii58
	rqqPITaKDaKSd23rqR4urtnVtJOuKESqUXciwkMuDNmrVw9h3axnCWTGCARCJdO4+U6BqEfXxqa
	qGEtIjDjmA/rF/zmcXYIjZ5nKx90+1n2mVmZr1WfTSSxDOcI
X-Received: by 2002:aa7:d848:0:b0:68f:d41d:ca5d with SMTP id
 4fb4d7f45d1cf-68fe907ab8amr241229a12.11.1781030094610; Tue, 09 Jun 2026
 11:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com> <20260601215909.3958732-12-praan@google.com>
 <CAE2F3rCPgnFU=d5At1zrOLhsuVEbsweogOHGz9gDddRx73zRtw@mail.gmail.com>
 <aiEawEFsnG-LIahW@google.com> <CAE2F3rAWZ4Ac23D8eyAHfmaVVkHv8pz45+_dpMO1M4D7+RVCoA@mail.gmail.com>
 <aifsSxEXX64J1Etq@google.com>
In-Reply-To: <aifsSxEXX64J1Etq@google.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Tue, 9 Jun 2026 11:34:42 -0700
X-Gm-Features: AVVi8CeNBnG-Q0YRCS6Oc41AOhRgRaeDmNuOgUCDOQbTwPVqXo8DCJDnwgsr21s
Message-ID: <CAE2F3rAGLH7si2S4aYhSUWyL-zZL7B_uo+WLE4zKY9SqKVi8zQ@mail.gmail.com>
Subject: Re: [PATCH v8 11/12] iommu/arm-smmu-v3: Invoke pm_runtime before hw access
To: Pranjal Shrivastava <praan@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Ashish Mhetre <amhetre@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_113457_028586_ADC11EA4 
X-CRM114-Status: GOOD (  15.48  )
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

On Tue, Jun 9, 2026 at 3:34=E2=80=AFAM Pranjal Shrivastava <praan@google.co=
m> wrote:
> > I'm not sure if I have a good suggestion here. Have you considered the
> > following: Do not call arm_smmu_handle_gerror() from
> > arm_smmu_runtime_suspend(). Instead, call disable_irq() at the end of
> > the suspend handler (and enable_irq() at the beginning of the resume
> > handler)?
>
> I thought about using disable_irq(), but I think doing it at the
> hardware level (IRQ_CTRL) is better.
>
> By disabling in IRQ_CTRL and keeping the manual arm_smmu_handle_gerror()
> call at the end of suspend, we ensure that we don't lose any gerror info
> We catch and handle any errors that occurred during the drain/quiesce
> phase right before the power-down.

I think the beauty of disable_irq() is that it synchronizes any
potentially running hard IRQ handler, which helps avoid races.

