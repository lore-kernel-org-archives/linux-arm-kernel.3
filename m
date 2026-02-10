Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2A8EB26FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 19:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cg+vuppKBi/qxtrhYUyuaUGpFRMcTtpWku11sjQybv0=; b=1a7MYnJcwLoIHEHPleZFDAqTHo
	OrA4XXdBSKYQqgKA9yq/AqfFgslRTObvxq9ntkKoF47GVC51t1A70OvTqVA0DyOIgg/OUSJBF2Lts
	EoopU6uZZ2V5xaRVJ/AlnCzjSfzzwBX9rwpTXANBapEtySf/3oFdhAWozY1T+86KItOGASFWIcWCZ
	KAOQW5Jm5l0v8frx6ERrMtWcHkYInU8ye8cKsFG/zdJnnjn2nVGEiIfyNotkjjh6/fOa7HAncfF0M
	Br7MrIA4v/pO+vSH4QT+P7G6rMK1GNjlXt0tPwCmmRtmJEfWEXJd5JAhZSNJ0/jyoR7UzCUFmi6Bj
	wu/iESVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpt29-0000000HPoa-3Iie;
	Tue, 10 Feb 2026 19:04:25 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpt27-0000000HPoD-3zvm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 19:04:25 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-5014b5d8551so54071cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 11:04:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770750261; cv=none;
        d=google.com; s=arc-20240605;
        b=AY9aKqb91/apOz8C8w68UQ0g9lqhPs4kxuFk/A5lpxPgWSQKGGuAj5Pu7HrYEWCQ/c
         4hZZT3mdZ0+GNRCexOcPiVg3AKXRg70/rdvdf+pLNRIl1aEzfHmPT9bdXU56Zu3P/IL+
         BdHknsfh9hLayAK2+e6GXJmhG6a+i6uMfD1Gr1oGiFSa1nRtzyVHnEZqn7WvZXjyLdtM
         fIvgPZESVhKrjJoueKI7XLN3KL2ATiNMIVY7m3k8L7bVWdKKWyoo90Jn83YZ9RgWGq2U
         FY6ukDZpStqboevk3RfzP4iyhwNAVKEQyl3Gg0JLzIeFi9ZHqExPONtyS3cNcfoLGKhH
         XdBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Cg+vuppKBi/qxtrhYUyuaUGpFRMcTtpWku11sjQybv0=;
        fh=XL+YSJqFtjIdQ+1eP8BqtvG//FhomN2Yh0Z0M5v7wS4=;
        b=CprD5+3L2y3uFPSvlRQ9MIPcGuMSBa3ey2EstadNwUtMrAeghICPkCan8w6t5poEz0
         nxoBf+/DapNcdL2UQwC2ab3qUxKq5712zr+ggtUM57u0eBZ/LIhsBwM9zvL8/4njZFUG
         SGrS5sBDrcWTIugubXVPWaEICVA6M2ZOeyBnUIVyGe2KHCfd4Kugsl+UKo8cc6hy0RKY
         OXt/LcNodIQp4S9YeCiRZeTeFEimN8Vpaa/Pmqe4vNVj13/0Ndf8X2dbSEowF1AwDHI2
         n2tryOv+R4MrmTAU0DjDpVkeycIIgxJhS/AsgpbW6WJmgbu5qXSTaLDG4mjayDBkEMNz
         xMYg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770750261; x=1771355061; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cg+vuppKBi/qxtrhYUyuaUGpFRMcTtpWku11sjQybv0=;
        b=G/p6meGssW9AyPHwg7pW1Ugvk+Jr4x2cOxEVOcpXoi0g1KcZNFYhuihWTDq8CQ0kib
         e1YFr9OzzEokcXPzWTMKwysm+As0eZYb8bEYFr2t1h8+Bro94OQ89T8HYzjUh8emX5m6
         xj+BmBU3olTqc4IaKERoF5f4P6J+ws0j1el+cnaUDUM2qWxIDFonN1bwof8O7ig5euZT
         1BZP65OW6EWz1Ds8/gOjiL0eIyvbVUjM/I8iJQIQdn5QD63RoCXORQH4qmj8QruHAtXY
         UXtHvmm3Dj1wYTnhaZPTNrTHxeVzPKtawx6mEP9E1kUSvICrDVYAQ4fRF0O/mY/BCRVj
         l+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770750261; x=1771355061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cg+vuppKBi/qxtrhYUyuaUGpFRMcTtpWku11sjQybv0=;
        b=EBzVEZgegVjYZS3js9vT3s4e2favHKrd+tbfRJ3/qMh5EsdVrdl+DjRxLjwUvApfhP
         ElY6ZefUNFntBLdkvwRaYvHhMvuRqYSzjjWLU1yc74sbxGa7TRiqzdjjEDFxNTGAW5YR
         bV8rS+Ro0TiMNJDZFBYx+GIAqRwXrorpJAN4nYP1bCft271nB3qjyn8PUvAh1JjMiGQG
         8t30pkZebpVMkrWzlQoamzsKLqyOuHNUJIk2Zf880jsAKfjs8RMquiZGQlNrUi5JTYX5
         NaM+oDSbHpHCt8atEw5lsB9tcAOV6Dn4flPlelPJ1LnRZB/jjoNfmj+2T45HYpG38lVD
         n5jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHhDtgxrYfHofQSWqLkfIkxj/g9No7MX74p46ciCA0OtIeOV0ZB9n8Lyxj3n/BVaJRrysX+c/84DdLUqDT4M0z@lists.infradead.org
X-Gm-Message-State: AOJu0YxZhvdReoFUulPuIiulUYZN3NlXZYRRFumyhv+XO1XYgyRxBrJf
	GuifnMzvQRCRyPDlJd2chLzY4AHNRx3H6z5VRDojYKN55wBNqWVpS1g6lZPHiFHJfHTBaPjKIKt
	KRpHelUVsHJE4n2UDXENGYWItHVpBVmohtkySaiKa
X-Gm-Gg: AZuq6aIRjeWdtlYGDGWsTpwoXh1vM98VPpgXesZM7sXS71fH+B4oQfFp9d0H4AyOElU
	3pt8xeKJLjbns6ZpT8+C6SGQLNQM6JhmFVXKV+hFx+2XJ3sYkdGr86664aH0uvFmLztp1on0KKh
	YVhXF8D0XCvw16RRKWHff3sJG0yLk2pw7rQ8QxY7IdQKCueRua7N4f2k0CICoykQ0RN0olcW8Cf
	DcpDmFSG/PwksCB7gyFH2gFQLUmTDmPfIWWysNj4vadw/nHZ5cChya8+b6j7Peo2aHxH4fFgNEQ
	eSAK+ZMJ
X-Received: by 2002:ac8:57d4:0:b0:4f3:5474:3cb9 with SMTP id
 d75a77b69052e-50681649998mr676271cf.14.1770750260223; Tue, 10 Feb 2026
 11:04:20 -0800 (PST)
MIME-Version: 1.0
References: <20260119124629.2563-1-will@kernel.org> <f151a8ba-b76c-4037-b1aa-b6b52e92b7e1@oss.qualcomm.com>
In-Reply-To: <f151a8ba-b76c-4037-b1aa-b6b52e92b7e1@oss.qualcomm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 10 Feb 2026 19:03:43 +0000
X-Gm-Features: AZwV_Qg7DEwIPIYYUoq3HN6VEITAaYrvLGvacgWieQ6FB2D3Scit4MG1Lwsu5qQ
Message-ID: <CA+EHjTyDy_fw3Vhj+kf9e50He2W_zj=sdmTRhBy0GAx=8HQ0yg@mail.gmail.com>
Subject: Re: [PATCH v2 00/35] KVM: arm64: Add support for protected guest
 memory with pKVM
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_110424_033326_623449C5 
X-CRM114-Status: GOOD (  16.23  )
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

Hi Trilok,

On Tue, 10 Feb 2026 at 18:58, Trilok Soni
<trilokkumar.soni@oss.qualcomm.com> wrote:
>
> On 1/19/2026 4:45 AM, Will Deacon wrote:
> > Hi folks,
> >
> > It's back and it's even bigger than before!
> >
> > Although the first patch has been picked up as a fix (thanks, Oliver),
> > review feedback has resulted in some additional patches being included
> > in the series. If you'd like to see the first version, it's available
> > here:
>
> Is it possible to test this patch series w/ the QEMU or it will require
> real SOC platform?

QEMU works just fine. Just make sure you use the kvmtool patches [1]
Will mentioned in v1, and to book the kernel with
`kvm-arm.mode=protected`.

Cheers,
/fuad

[1] https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/log/?h=pkvm

>
> ---Trilok Soni

