Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4DECD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 22:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEnl0CjbpYzEzr2ANZLBuMg/VY55F7qyhRm6Ui2g+y8=; b=m87ml+gc6xI75qXdSwiz5jXxoL
	y79bfUDyi8rAkYSM4AVz9KgDUNq9E6SM97gadFjvCrbPWdXPZpCQKGcbI7e9Fnl7xDFUzJzG34T0/
	dLwA5bVLAtUmuPqxULdBxIqhqJkmespjEq/1+jhJ/UCHOuXgJAF24dBZlCNkIUQXr11EOzIw8IkLK
	4KvNQ51EqoknUVImqbzhtcVlyEnuUKg68nVF3DT+ptMNgxn8RCnFt7eDaEp+0RS/MON+kwUgs6jG4
	HKRCAs9Iiv31ocH0+P126jTqMHtJgPxndOuBYT/Gl9WTDDbODqADqDk3zqQXeACDye+6rVgimR1pL
	EjQ3EBXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUtvD-0000000FsyU-3ELM;
	Wed, 03 Jun 2026 22:18:47 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUtvB-0000000Fsy6-1cu0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 22:18:46 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-5175d339e8bso203091cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 15:18:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780525124; cv=none;
        d=google.com; s=arc-20240605;
        b=j12tm6sq0cvtRr9jREHYQbXlVoqbElnMJww1n5BXHLyGNpeGKQw903DfbET6h8AHmh
         q0QHE7pHmWXBWCxCU4Oo3/ceLzZ30HNSIxPEuQwn/p19Kh+elPOzRYO4hN479DIz0a8m
         DHwacgGKtStlCe+MwH301Bg851oVgVNC66zR3tmDAH7BnjBvpQsaOUoPBW1qZKSgq2dZ
         kB1O7xyAie7OQTEvIOCxKV7DhXAv8vjVsWq7tkJ78na6wPV7NH4/zk3F7ByeYnY/t90t
         KHUbt7eEuHLv+IqUJPLwj4e/T4IR4WOjJflxMSasxlBGGKl9rMQBtBcWxBlGLAgDTsuT
         iNSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YEnl0CjbpYzEzr2ANZLBuMg/VY55F7qyhRm6Ui2g+y8=;
        fh=9FK5NKaaYm08xvv+DLSKyLnTN9RzPMTKGRndCiTqr24=;
        b=TwdAwc/Wc8jxTTwtJXJVVr2DJ8llwrzqqOAC6Kp/2ff4Z4R9Zz97ohcwXVvc0Z/Bj6
         4gjXVJhiJ6ZcEEwPbJsaKvSs88oZKRK5t9w3Ky1ynCncb6UBuCbERInf9p0nSkkbKzR5
         uZerYEHwDnwvy2StUIIkPNTNXEzOTFxXyV31BNp9rFhj7WVtn04JQ1u5jwsS2y73FCJq
         tD+1isv8uycz4gM2MR/mhS8fbeYzhd+XxV3NXLRF9GrSWolvwsqLVr2wSglo8gq8R2tF
         fSsPFiIJGUelrTWd3Ktig2Bnh5i/o8zLEb5qLdcHeocLzZjOE8SAEdncDJYhTUUdp4DL
         BDGg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780525124; x=1781129924; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEnl0CjbpYzEzr2ANZLBuMg/VY55F7qyhRm6Ui2g+y8=;
        b=hYsKbsvpWuv31Kr7aY0w5bmlB2KgyK4LP0QqMRQDU1qO0uFGTo3d8Aedt7kEn8EQTg
         3Wrj2l6uduLm39mJwK1/zrJ3yv/uxipaJY+m5BtxQsWsawnDb6RlvsHd15/ZXh5GRptn
         oJ/0ZJAtKydgPKXypmCdDsCtySs9XQ5wHur228a6qOwfWt1eq5fn4ClA7gl5AdEd1ZYt
         8oOtM0Kf1vYWevBNUymGWqrEoTN8UOGcc3vqfYt4gMSYefZ/1S1dKx1BkTIoxzaI5Yfe
         3gh19tuQhGnt2UUFsI1FZj9wPQuRRuOrIj7TipRitWKarAjqwRSeH0JjhIIUZoWRdGoa
         Az5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780525124; x=1781129924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YEnl0CjbpYzEzr2ANZLBuMg/VY55F7qyhRm6Ui2g+y8=;
        b=L7bnMF4T5IiMmOKcmn1Q6MvKibF7dEBLJPIE5VED8ofg6Sy63QRE2MtlnkUgncOwTT
         tgfuC2O/fA/eIwcmM/1+U6uZ8F6Q2bNThREM0dFe6/07dekqj4eEdqkF9EmNNoNPgZWC
         4nGLp3B4DKYY4/kJahE2HjIultylmZHtb9guDhKhp84ZVOUOBWWgUwnDaZCl/V9v5ucO
         ZhehZMRH3meoHmgKqKWi+U279UQCrgeHAobj8qJoku9TQF1GnyePKXhU+3CV2nW0KExc
         qwQ3s91zh7CqRvA75bh360tnQTh+vRwvdf7MU16Ace/o0+moXve4G0aXKt0X+BA4gBZ2
         aBIw==
X-Forwarded-Encrypted: i=1; AFNElJ+QugIl/lacZoak33uQ4sRqhJHqj5zY4Avzi68au4g749LvDLmURkNxr7FW9UKErXmrNEgvy5QfIPOcPh0cBCei@lists.infradead.org
X-Gm-Message-State: AOJu0YxxXcWn7atPkkhrJqPzh9KrUisuJ53O2G0CGnM7kZ1mH3OV6zNo
	z91+izPBV0kMf21e+7WVlrTwr07TBi2OJwnVit9FqQoAUQBcndyUHHLxMzIPV/I0c3tor80guFk
	RqE85cd5brOsp8EAVzq1S1/QGocBgnfFo5UD/IuUb
X-Gm-Gg: Acq92OHbbKgKbyRO0F7liNNExtNzh1+TeveS2IuSZpHAkRtyZw7Z/JHpPtHykf/a5Sx
	qS7UxLApvevOAsRSzu4RKxTSD7IseNTRZvxEE2k/1tguGtYFbL1QjIlJmh/f2YXIftyySwhGjp5
	5esy104pyzTihwGU35gqcPL3ZbkJ/tr28cj1+xDHckQ22qkJ2Eqn2O+ELkurh/RsH43D65CVCoF
	SG70ch9dAbxAC5yiN5QF3Jn8O4PhzH+oCuszn/vftqlCM/nwMZNDF/ljh9NZdR2LjU0cToim7E7
	wl+G9ae2oXIyx9m2cDSMRMZ5FGyaZPLdziFcxU5Tvcpr5QtqbphF5wr0H5w=
X-Received: by 2002:a05:622a:1801:b0:516:4f62:85f1 with SMTP id
 d75a77b69052e-51787ab8be4mr3489001cf.22.1780525123437; Wed, 03 Jun 2026
 15:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260527221407.1756491-1-praan@google.com> <20260527221407.1756491-11-praan@google.com>
 <ahilX8Za1NRCH3ik@Asurada-Nvidia> <ahi3uY9YZZtR1Lq5@google.com>
In-Reply-To: <ahi3uY9YZZtR1Lq5@google.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Wed, 3 Jun 2026 15:18:32 -0700
X-Gm-Features: AVHnY4ILrsvBe4oXAMQWWdFEm4mbOUJGKXcyXE1-JTxXk1zIsDS0pKvD5RiQwxo
Message-ID: <CAE2F3rDeZe+w7-V6hyJtSOwCj619E5SNtjJjZ1-yu1sVdf=35A@mail.gmail.com>
Subject: Re: [PATCH v7 10/11] iommu/arm-smmu-v3: Invoke pm_runtime before hw access
To: Pranjal Shrivastava <praan@google.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, iommu@lists.linux.dev, 
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Ashish Mhetre <amhetre@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_151845_462279_2E246268 
X-CRM114-Status: GOOD (  17.88  )
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

On Thu, May 28, 2026 at 2:46=E2=80=AFPM Pranjal Shrivastava <praan@google.c=
om> wrote:
>
> On Thu, May 28, 2026 at 01:28:15PM -0700, Nicolin Chen wrote:
> > On Wed, May 27, 2026 at 10:14:06PM +0000, Pranjal Shrivastava wrote:
> > > TLB and CFG invalidations are
> > > elided if the SMMU is suspended by observing the CMDQ_PROD_STOP_FLAG =
via
> > > the arm_smmu_can_elide() helper.
> >
> > All the arm_smmu_can_elide() call sites here would eventually elide
> > the commands in arm_smmu_cmdq_issue_cmdlist() that is already gated
> > by CMDQ_PROD_STOP_FLAG? It doesn't seem necessary to gate again?
>
> While issue_cmdlist() would eventually elide these commands, the
> can_elide() check is necessary to return early during suspension.
>
> This avoids unnecessary stack allocation, cmd building, and spinlock
> contention on the cmdq->lock for threads that are anyway about to be
> elided.
>
> By dropping these requests immediately, we significantly reduce cacheline
> bouncing and contention during unmap storms. Furthermore, the early check
> also allows us to specifically trigger the WARN_ON_ONCE() for broken
> devlinks.

Hi Pranjal,

Have you observed unmap storms in a real-world use case, or is this a
preemptive optimization? I would not expect a high rate of map/unmap
operations while the SMMU is suspended. If a client device calls
iommu_map/iommu_unmap (directly or indirectly), it suggests the client
device is RPM_ACTIVE, meaning the SMMU should be active as well.

I am in favor of removing arm_smmu_can_elide().

