Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB827CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 17:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMF8ozn9ZW6fxlEoYIFtmrl5gAuD46WkyHLX4zSJAzg=; b=F0wxDzI/rXChyZdOrxc40hkFF8
	lnwzZOkZH7DGyBQDpRvBH4yQ0DzMUUeyOhKVun/aTfqkxISJWBrIexHSJlecI2mSr+pA8A0nKkZsm
	Rh1lSzxOVGm7fjPbTi4i+sCAG618WqYFo/SV3Twg5av5AJ+dt6kpWnBVb0Pk+RlL7Ssu5OoVkKXd2
	qAeFByrnL1hEGKF+Qez0cEfT/yiOx+l5+461cyqRm349X7+YBj9gNDsoEZmaP0C4o1lxJ42/beLbi
	+HRWIZcRxw6UcYu7Vz2jQLzLMeZRf/Iz32HHbmEEnR+Fv3COv1fiwiXMJyHxxzKFcABX/53qS75ib
	ywTNJEtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJwf-0000000B7dV-0HZc;
	Mon, 12 Oct 2026 17:36:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJwd-0000000B7dL-2d8p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 17:36:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E25D43BDA
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 17:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E6B1F008BE
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 17:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791826575;
	bh=PMF8ozn9ZW6fxlEoYIFtmrl5gAuD46WkyHLX4zSJAzg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gr4VmeSNCELsZHNUSKW9h4/c3LL+hILyi7SZ5wfxoVe/CGgt0q/WxQRlY0Ynbmg7W
	 cIJvv0TT/Wxoj+/7Ecb35vxqsXNgJcM0FUZZS0DO8eqYe6GDYaZAbViCwvYVsPd0pJ
	 CD4m75yf4zQWytsst9Z5AhKP7fNYr4gXYRahTlcaULpoRO7kT+GuHaD/DfwUk4nFYI
	 qjQDUsSNX3o07SIMhED/Bupe26vx4ZRwWoZ9pERi3+EN6GN1lBJ8DAUiGXFj+xv5Xe
	 zFuhHxQDpBPNHIig+pT6ShP28SWC5B94rwOovP2YthGwWx2yHFr5rQVlk+pbBhfVqR
	 bSf7gZOZGxy6A==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ba35c0df4fso1687828e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 10:36:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxVNhmLE2NKT2hn3s/QY5iqJo3zyIH+LiNc+asVPl72k3xOg54wzOKBhXkBf6AJ/SJc8qF33yF0DhMeAXE8LQKF@lists.infradead.org
X-Gm-Message-State: AFq9FYIy3cEidldSDTU6qMOzgF9SvPMgA8ewgGcq6I5pVmUs4f77OKnj
	5Qir2T+yrQqBIp7jATYRWMTnnK25UoPZVfKp9/J7tdP35E8bejOQ9juzWItv0eoV20yK1PIsEYD
	hwZ6xQ/XM/Uz0gU5IuEgp02sYEZ12Ry4=
X-Received: by 2002:a05:6512:33c9:b0:5b8:ec96:3bea with SMTP id
 2adb3069b0e04-5bcde6bf74bmr3610495e87.20.1791826573195; Mon, 12 Oct 2026
 10:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <20261008212832.354382-1-christian.loehle@arm.com>
In-Reply-To: <20261008212832.354382-1-christian.loehle@arm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 12 Oct 2026 19:34:07 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iW==OmyA=ZbJNS0jXrCYRaSRS2at2twnW0gBV-rsnW0A@mail.gmail.com>
X-Gm-Features: AclHuK9WGyJH3mzjeL_bNNS33d3gzQtOOUEtys8LIhYn5vd7zFcJlEqZH0fmeoY
Message-ID: <CAJZ5v0iW==OmyA=ZbJNS0jXrCYRaSRS2at2twnW0gBV-rsnW0A@mail.gmail.com>
Subject: Re: [PATCH 0/2] MAINTAINERS: Update CPPC responsibilities
To: Christian Loehle <christian.loehle@arm.com>
Cc: rafael@kernel.org, zhenglifeng1@huawei.com, zhongqiu.han@oss.qualcomm.com, 
	viresh.kumar@linaro.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Mario Limonciello <mario.limonciello@amd.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Huang Rui <ray.huang@amd.com>, Perry Yuan <perry.yuan@amd.com>, 
	Vanshidhar Konda <vanshikonda@os.amperecomputing.com>, Shubhang Kaushik <sh@gentwo.org>, 
	Pierre Gondois <pierre.gondois@arm.com>, Beata Michalska <beata.michalska@arm.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ionela Voinescu <ionela.voinescu@arm.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>, 
	Jeremy Linton <jeremy.linton@arm.com>, jonathanh@nvidia.com, zhanjie9@hisilicon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Christian,

On Thu, Oct 8, 2026 at 11:28=E2=80=AFPM Christian Loehle
<christian.loehle@arm.com> wrote:
>
> Hi Rafael,
>
> This series replaces Pierre with me as a reviewer for cppc_cpufreq and
> adds a dedicated ACPI CPPC entry with you and me as maintainers.
>
> The separate entry should help direct CPPC changes to people familiar
> with its performance control semantics, register access mechanisms and
> the platforms implementing it.
>
> Thanks to Pierre for his work on CPPC.

Thanks for stepping up!

> Christian Loehle (2):
>   MAINTAINERS: cpufreq: Replace CPPC reviewer
>   MAINTAINERS: ACPI: Add a separate CPPC entry
>
>  MAINTAINERS | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)

Both patches applied as 7.4 material, thanks!

