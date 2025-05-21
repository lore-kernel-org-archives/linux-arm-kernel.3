Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A263C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 05:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EHxwybSUUWqWZkmGzW4LoBuZlYYgTXkmblF+vx8sHE8=; b=BlU9A4JcLOK3d6DALYnCK9RY+Y
	08S6JooMVo/U5WfhSEMgYwNEolmnXNPLxp4RyMsQHosFjFVsQaCpFTN9a3sVSAnHYH1K+aCa7oIV/
	xheRh0mDnMySDkdcn8Uz/0V2YCAKjAwSrFg3Lu4tdnlmJxsF6rDYIhgechh6YfHVU6bhBSfQG9kfv
	OZtk+drL6FvcPMXOWpgLPn33KHO1nM/QAvxJp0GIT+4ZVfwPeECsUJlieoBFkR/LDuVtO/k0+oaxR
	PdbFXudBjPbsDMEJb+ls3fcdcyeTeYD3yFOi1DObRZUfN5XDQt2+LGWXF/DnV3vcmeXq1YoI4dOYY
	yDOi9Cqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHbiD-0000000EpIP-0gWj;
	Wed, 21 May 2025 05:09:53 +0000
Received: from mail-24420.protonmail.ch ([109.224.244.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHbg8-0000000Ep6k-1oKv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 05:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=urja.dev;
	s=protonmail; t=1747804060; x=1748063260;
	bh=EHxwybSUUWqWZkmGzW4LoBuZlYYgTXkmblF+vx8sHE8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=4Xq574aWdnHwt9sC49d6+zrJn3m8rufK3gzf9q1131XQH5eXxpkqsKvgM9Uu4wNs/
	 WIzEzrxSof5Kf7YhpMDOhnNoaXIOCJxwNsdy2D5a2CatXvqNlvOH7J2LrCYbskTcV2
	 8ptXlT2fCAYGStfvTuBwvo1ypENOD+ArtktUUWDIUVjrAycSZcT09T20tYfxodNKr7
	 maaqT6CCOkQbgWzJyzMWlqBBDOfH6Phvo0SWuRY0XYQc52aLY6tGNAaE3njFmTtBz+
	 nNVGoITaINvADL7SdwzveJqRmoUIzPsvLaEjjpW4zJufXpUtPkAAZ6CyhwxTG4QbpM
	 PKT/A8hPeK5oQ==
Date: Wed, 21 May 2025 05:07:33 +0000
To: Robin Murphy <robin.murphy@arm.com>
From: Urja <urja@urja.dev>
Cc: ulf.hansson@linaro.org, heiko@sntech.de, mark.rutland@arm.com, lpieralisi@kernel.org, sudeep.holla@arm.com, linux-pm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] pmdomain: rockchip: Relax SMCCC dependency
Message-ID: <shEYjcWUZ7485Ciik1zpXjOB8tWrdsemjjp3iOtj_OY54peVvLcRI6-AVZARFoQxjUb0QcwFfYcHGiCrPSX-589ZistaFvVfVEG1M73a3is=@urja.dev>
In-Reply-To: <6f0a38e596c0727d0de13a29c9224f71bc7d30f1.1747760015.git.robin.murphy@arm.com>
References: <ab0476382e3342161beda94a45ddadb49b026dcd.1747760015.git.robin.murphy@arm.com> <6f0a38e596c0727d0de13a29c9224f71bc7d30f1.1747760015.git.robin.murphy@arm.com>
Feedback-ID: 82529409:user:proton
X-Pm-Message-ID: 23b511119bb5f75ff22627dfce245ca18591df6c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_220745_215488_63E3089F 
X-CRM114-Status: UNSURE (   3.40  )
X-CRM114-Notice: Please train this message.
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

Hi,

Applied these, disabled PSCI, built it, ran it, the system works, so:

This patchset is
Tested-by: Urja Rannikko <urja@urja.dev>

