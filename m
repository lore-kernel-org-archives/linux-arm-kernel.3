Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1436C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 10:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+EXhzdCNyL7BX1v534o+kUhKJJy7+6exCGtwlOH/1M=; b=COzyYYTtsl+zukWHTLsXBN2kZT
	yYG0j/KoZtdvz4xXRy2ebXXBWxtB9J7emRMfBjrykjw9TJRzINeuIihRupNSfNnPaK4J8ygagnvWD
	qISGaThM11AA46FQgwstIlP6YhEAl/9jcDPixNvZi1YA0+PKyCzu06Rxnqq1vh65gyGjzXMzh6ccP
	Q8M+jOP62MLPCQr4F1mbeAuWkRg9MNe7HoI2L7Eun2UksaiywRuw8kCnVelIJmJNxwgU1993Mu2nU
	i/fv2YUcJRgkNhd33gBS6trj3CccubsqPq4ODYkSdD1md3ytbQsI6i2JNYXRX5CxvN624vQDZDpgo
	i8XfHLmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyRYJ-0000000GMGD-1Poz;
	Mon, 24 Aug 2026 10:05:15 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyRYF-0000000GMEw-0exp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 10:05:13 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so4876868a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 03:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1787565908; x=1788170708; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z+EXhzdCNyL7BX1v534o+kUhKJJy7+6exCGtwlOH/1M=;
        b=e6VmSVvSYU7M1/InRLLLHYI3D//0K6EiRzIVCps1ikxtjczfn9lczvmzO7P8cCWxDH
         6gCwoiJFwlPBHVHnEKKmCVc0U8JAiHljplW3DCNTzxnbj4QeM0BLBpL1GnLTtDo0VaIG
         weKu4fzs9iRLb04xWHyS4vay94yghoAs0qBocXRrrLOxM2FPMRIgEtacvVraGzxI4OiX
         EQaLuxbO3LRGZY+m+emTGEakuAs8gorGsFV8MMuDj3kqSGUCdKKzlWjcTjYqW+V9aS7P
         nD5czgC7egsgawW/XuYykRNxFmDSNhslp5GxNw7gJ9yeluLCQJ33ZLfESXDawQYgnDkb
         naew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787565908; x=1788170708;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+EXhzdCNyL7BX1v534o+kUhKJJy7+6exCGtwlOH/1M=;
        b=UmWxwuFyWeTMqVs7yZtfBjdfMrHWRNh0Z4cJjVWSwdm41RJkpHrmoa+PA+FaNqxEuy
         5UlmA8iQH35dOQzPtrwWxRDjoOpxvbHz2HVQr+Cn3RxkKikQUXzieQoLP9u59KpKaf1f
         g280BEH05BxTLDsJs6CdXYYnfES8VBCZLOb+LBDUO6Fo4f+L2P3cqIyl39LucVX1xjEt
         0MtLDvUNB3Tm3t+ur7lAIbx89gG8owWfnYyqzBSeno7GjLLZDBDOBjLtVESV3L55fKEh
         4ppNy5BN+y/X89mK3bF6oVNWaccd3cgNXkJocPJxYPIEav+hY4+1hSEbKUg6h/ZhfrTT
         TJLw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/sh7oE8LHUCyNJpXOKoAgV9AX8PWaC+y1QwGJT01XfNO66+5tIFf1UQsij2LgBjCgm9Z9Y04QhNv8XCH7oE4y@lists.infradead.org
X-Gm-Message-State: AFuF++ljuDam4lgwDlsgmGmNeOeT4tu8kyf/hj/uZvQBJMetOWmtKL3N
	WqeYwFPRguv+w/BYsBtwfgWBcljH6Vf895de4gA/qalRpUom6+nAU9nGU/l7otZ/KX8=
X-Gm-Gg: AR+sD12ogkdDYTNdRZiw+K3uk/xdK0KyPwm7ELT1nVMrodYfR2bvDxdyFr6vGzC5Mk/
	ZxCInb67IF3KrTJJ0awKfRnWclugy0t7wkzD46uIPHhsT4BRFGa1HkTJ6HXIt/vgjyYyVjNucPB
	UPJcYdQPJDoeQnwX4hpyhYJ67Xuc9PUyrvr9gBUBzqRS0WcJ1kq9/rpoFocghBNVRxNn6gGvruj
	WqEeAiG7JKAuJSvSt+SyWlDJwTlurb8OMdy5McTBk56XrcUoAbx84YhSibhD7LozuOhFwfHg5fD
	jm1uybOqTpm5rhxewfehyNhJng2ZPcyNRtvrpEwDjuMltWYgjTszfNRiZooLtienvS9VQrjBDLq
	86gR2iOLyliARPFEtz1hooTJfDR0uzFPHEXAUfHaVNh+TX1/yQ5kb6zqgjESMEx7v1kYu3E49Mh
	cOKc0GOS/XOMsfgVsU4hPvWI+yA53iY3gFS/eK73IIwnNJnN9nhtTSBWhn/28Zmf9VGX8/Ae0Zt
	pOQ7QSygNQFg/xYB4cPqPWlDWvo9u0Lkw==
X-Received: by 2002:a05:6402:21dc:b0:6a3:fee5:adcf with SMTP id 4fb4d7f45d1cf-6a42f14d952mr27894029a12.1.1787565898379;
        Mon, 24 Aug 2026 03:04:58 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e2da49bsm8922721a12.29.2026.08.24.03.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 03:04:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 12:04:57 +0200
Message-Id: <DKX384NK76OS.3NNOMAH72PV2P@fairphone.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, "Will Deacon" <will@kernel.org>,
 "Robin Murphy" <robin.murphy@arm.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Clark" <robin.clark@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <iommu@lists.linux.dev>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 00/12] iommu: qcom_iommu: implement support for
 instances on MSM8974
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com> <DKL6P7G0WTM7.UJ6KZERQZDFK@fairphone.com> <iv5radfllym2bjvkrdu4ffs25bqixyos7k3ymncpcdtc2uobn2@zlhsybrj3pwz>
In-Reply-To: <iv5radfllym2bjvkrdu4ffs25bqixyos7k3ymncpcdtc2uobn2@zlhsybrj3pwz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_030511_308008_0F2663A6 
X-CRM114-Status: GOOD (  21.41  )
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

Hi Dmitry,

On Tue Aug 11, 2026 at 2:43 PM CEST, Dmitry Baryshkov wrote:
> On Mon, Aug 10, 2026 at 12:16:19PM +0200, Luca Weiss wrote:
>> Hi Dmitry,
>>=20
>> Many thanks for working on this and sending this patch series!
>>=20
>> On Sun Aug 9, 2026 at 10:15 PM CEST, Dmitry Baryshkov wrote:
>> > Qualcomm MSM8974 platform has five SMMU instances, used by display, GP=
U,
>> > Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1
>> > spec, however they differ from other Qualcomm platforms in the
>> > implementation-specific registers and also in interaction with TZ.
>> > Venus, MDP and VFE SMMUs are secured and require programming only of
>> > CBs, while GPU and JPEG require full programming.
>> >
>> > This series skips IOMMUs which can't be tested right now (VFE and JPEG=
),
>> > and adds only MDP, GPU and Venus (although untested, it is required fo=
r
>> > display to work) SMMU instances.
>>=20
>> I do have a patch series (sent years ago to the mailing lists as well)
>> for CAMSS so I can definitely test this in the future.
>
> Ok, let's land these first, unless VFE IOMMU blocks display on your
> platform (Venus was blocking display on APQ8074 DragonBoard).
>
>> > Note, to get display to work properly one fix is necessary, [1]
>> >
>> > [1] https://patch.msgid.link/20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d=
2e@oss.qualcomm.com
>>=20
>> I've applied this series on v7.2-rc7, with the extra commits between
>> that and linux-next for qcom_iommu.c backported so that your series
>> applies without conflicts.
>>=20
>> So far I'm stuck with the GPU not being able to probe, adding some
>> printk's shows that in msm_iommu_new() the call for
>> iommu_attach_device() is failing.
>>=20
>> [    5.971154] msm_mdp fd900100.display-controller: failed to load adren=
o gpu
>> [    5.972991] msm_mdp fd900100.display-controller: failed to bind fdb00=
000.gpu (ops a3xx_ops [msm]): -16
>> [    5.974073] msm_mdp fd900100.display-controller: adev bind failed: -1=
6
>> [    5.974152] panel-s6d6fa1 fd922800.dsi.0: error -EBUSY: Failed to att=
ach to DSI host
>> [    5.974230] panel-s6d6fa1 fd922800.dsi.0: probe with driver panel-s6d=
6fa1 failed with error -16
>
> See the patch [1], it's picked up for 7.3

I missed replying to you, with this patch the display lights up again!

Unfortunately the GPU still seems to have issues, I don't have a log
right now (I think even SSH was dropping then with a bunch of log lines
appearing in kernel log on screen). I assume kmscube + more complex
workloads worked fine for you?

Regards
Luca

>
>
> [1] https://lore.kernel.org/r/20260730-fix-qcom-smmu-v2-3-18e0daf2d836@os=
s.qualcomm.com
>
>>=20
>> ~ # dmesg | grep iommu
>> [    0.127014] iommu: Default domain type: Translated
>> [    0.127052] iommu: DMA domain TLB invalidation policy: strict mode
>> [    0.739899] platform fdb00000.gpu: Adding to iommu group 0
>> [    0.741358] qcom-iommu fdc84000.iommu: iommu sec: pgtable size: 90112
>> [    6.006877] platform fd900100.display-controller: Adding to iommu gro=
up 1
>>=20
>> Have you seen any issues like this?


