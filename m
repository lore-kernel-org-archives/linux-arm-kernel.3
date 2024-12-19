Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF6DE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 15:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGSpD3+3yxS9yz0CYWixS3C/FoBfovGzSM7W4jlHvCA=; b=S/6NJFtz1SqX+RoPhA8IqhmMqy
	IpcNyLsjY0Ddm1BrhOY1pFVauSX4+eU7ppTz8PMYa0gtVexAJpzSJxC+rsnIHlszV+yjF+09Q01iA
	vxLV/Ootx/8BC52/niRJQM4YliUmlKvwbapf/DW7kGdcRX+r+vTpgICnNFK5EI1lHia7DoO7Ocd4f
	68fKIz3lrnKXCqwBXSrhZbhQ4TDO7LvrooSyK2OV/9FjgTG1QRSI22FiaQ2S/by6eFBnIRojqyOOg
	qvdDfe9h+5Do+xpd1w5n60CWP5ABcOJQE4BiA45P2pXDOiSNUgrIog6yJ8Os1ZpmuNflkIgcabIlO
	vMBzlfMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOI2V-000000027E7-3KKA;
	Thu, 19 Dec 2024 15:02:11 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOI1O-0000000275N-3jDI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 15:01:04 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3a77980fe3aso3158925ab.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 07:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734620461; x=1735225261; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGSpD3+3yxS9yz0CYWixS3C/FoBfovGzSM7W4jlHvCA=;
        b=AHT9eB3AY/AtPef18enw0hH3z2IwBtpGsoBfRX9GyI1uxKoI22qTR3VpWXgZyfUl9T
         m2lbLJkciE4H6vsZrpV4PWwkkTAxZ5ooKmlOSkdF9e6U708BHYRkIEt0xB5PTn13Enc/
         jBtfGNxX8WNAyMDSYsvArGiFy2DPl3MJGpdHbThJ8/TsWNLtnG0AKKrbhvTbj0634rks
         fmUs9FyU+L/Y4csTk3t+hFN1Kj/vioCHPNOmRCm+vFi0VH7JdxniwbkNPjjwAcDUSfIu
         okRD961+uOIY1R6pQo2MTeOB/qPlc5DaV6cQubUzwCPlzgKIgjBt9GLBKoRHsJ6py8wu
         O8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734620461; x=1735225261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGSpD3+3yxS9yz0CYWixS3C/FoBfovGzSM7W4jlHvCA=;
        b=YLOCfgXaSodU5p/RQ65ZnscMdTQROZJ2tTR2oIh8VvwrKoxw1NFk75TvTywUuuXYhl
         oXUol8T0tfS1NWXd/umnNxYFrMUp5GbAitcUSfUuo7OJqwiwDiEbe5Q83ci3BiBYdjFi
         aPFwCsJoaesr7MpYQjdhdxu9siL9ZDT3qRREbDKCWZ8ZNuMmcqjMlQ+RboolvDH/3qb9
         HuY+e34+Vf/+XuCQJwp/erUdH3G6wTLX14UgcAjbrIEjA/DvTiOObasQuFfAmpx6fqDD
         GrctfdIQo+AowzvvovbGMvhXSvq9q2uDMIznYNuLmO1UiRSDbnSiuLZbFyOLHowgeLpM
         5fEw==
X-Forwarded-Encrypted: i=1; AJvYcCVRrv/CW0PmEgtdG7Q7F/lRiGtPCNWleooebySzbeGKmHDTrkE41F+Umf2iYViHI8iNUrQAF4T+wCCZgFVikLhw@lists.infradead.org
X-Gm-Message-State: AOJu0YzMHywpng4aHJs1Gzv3LQlDqCeJgu9vZQA54UKoFJfHnuUHhwm2
	cadJWPBmFz3UMuINeWqX8PezE86PjzK7KbcR2J3yD2Y6dTyFWBiYzHHXDmihFEPZCjuPD25ywaO
	MyxPuxiwDvRdP2qD5qGVb6Uqe5ZY=
X-Gm-Gg: ASbGncujlUS31/cqIRRiN2E9MyuD8l4HGvWbZMiEC/rWYVu6MXQjFZOMpL/pC/J0U43
	5Ca4cR0XBysXDWyjx0tmV3hQSFt1SPMp1CZ2RaQ==
X-Google-Smtp-Source: AGHT+IHp8ABABtvQh+2yyPlFSULZ37QjpTpYXLauYn/rtYNis49Ni4sKHQpdMdeMDdPO+HGJ2/oxRYIljcvIQuXYhZ4=
X-Received: by 2002:a05:6e02:1649:b0:3a7:c81e:825f with SMTP id
 e9e14a558f8ab-3c02e1e9aa7mr36636045ab.9.1734620460446; Thu, 19 Dec 2024
 07:01:00 -0800 (PST)
MIME-Version: 1.0
References: <20241216171017.4881-1-robdclark@gmail.com> <20241219113019.GA23640@willie-the-truck>
 <41d93dac-4ef1-4cc7-a7b2-24c8289f905f@arm.com>
In-Reply-To: <41d93dac-4ef1-4cc7-a7b2-24c8289f905f@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 19 Dec 2024 07:00:48 -0800
Message-ID: <CAF6AEGshSjOr1DE63WiXwAyH39-Tz9B3MEkKUo6sg1jpQPYZcA@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
To: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>, 
	Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_070102_928770_A6CF2CEB 
X-CRM114-Status: GOOD (  20.04  )
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

On Thu, Dec 19, 2024 at 4:08=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 2024-12-19 11:30 am, Will Deacon wrote:
> > On Mon, Dec 16, 2024 at 09:10:17AM -0800, Rob Clark wrote:
> >> From: Rob Clark <robdclark@chromium.org>
> >>
> >> On mmu-500, stall-on-fault seems to stall all context banks, causing t=
he
> >> GMU to misbehave.  So limit this feature to smmu-v2 for now.
> >
> > MMU-500 has public documentation so please can you dig up what the
> > actual behaviour is rather than guess?
>
> Yeah, I'm pretty sure that's not true as stated, especially with
> SCTLR.HUPCF set as qcom_adreno_smmu_write_sctlr() does. However it is
> plausible that at the system interconnect level, a sufficient number of
> stalled transactions might backpressure other transactions from entering
> the same TBU, even if they are destined for a different context. That's
> more about the configuration and integration of individual SoCs than the
> SMMU IP used.

I am aware of the docs and I've spent most of the last couple days
going thru them, as well as the errata, since it would be unfortunate
for debugging to disable this ;-)

The scenario where things lock up involves at least a few thousand
faults in rapid succession.  Disabling CFIE in the irq handler and
re-enabling when I resume translation does stop the flood of irq's but
not the lockup.  It might well be something about how the smmu is
integrated with the interconnect.

BR,
-R

> Robin.
>
> >> This fixes an issue with an older mesa bug taking outo the system
> >> because of GMU going off into the year.
> >
> > Sorry, but I don't understand this sentence.
> >
> > Will
>

