Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6023CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 00:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxqA4w29q+rwRyQ2/Ht97x0u7kuCwxko6jKzWp02gGI=; b=0n9hsHS+6BRJxE1jUPF8lYlTA6
	iQgkzh/PS1rwo+Qz6fqN+0K7dp1//WHY+s4ytLSJVFQWM50axr2U3Rpvw1d6epQ4KGmQMAZVVfKzE
	/vFWYkw6ue46g3a0fLUDpKeGNls3JWMxUuHXYOG/xOZg1Yxa1SUw4qdRDjrjavOZb8q6hoLRNZJAa
	wXN9CsbFJdxk4cgbOOjZ7sFN9A8kBYXRdXbkE1qnumzY5Jus+KDih1iIhLtvPodwWKtmmuBtSE3JZ
	5I4BOvZkO9qH/u9FqUbgGw2s8z6S2Q0f3w9NXGRmwgsUYelTXB1eAyLz7z9d5Hndl16AQCST3oBTW
	rIJ4Wlqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbnR-00000002wlH-2cNW;
	Wed, 03 Sep 2025 00:56:21 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbig-00000002vkV-42Pd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 00:51:28 +0000
X-UUID: 1864b9c6886011f0b29709d653e92f7d-20250903
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:149e317a-1aff-43d6-90c9-1a5d04dd57b0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:461f970947de3929c2a541614ce8e229,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1864b9c6886011f0b29709d653e92f7d-20250903
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1164660955; Wed, 03 Sep 2025 08:51:15 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 22D4BE008FA3;
	Wed,  3 Sep 2025 08:51:15 +0800 (CST)
X-ns-mid: postfix-68B79102-9412696
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 28EDFE008FA2;
	Wed,  3 Sep 2025 08:51:07 +0800 (CST)
Message-ID: <40706b1f-e23c-417b-b3e1-2dc839828588@kylinos.cn>
Date: Wed, 3 Sep 2025 08:51:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/12] cpufreq: intel_pstate: Use scope-based cleanup
 helper
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Ben Horgan <ben.horgan@arm.com>, zhenglifeng <zhenglifeng1@huawei.com>,
 Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Beata Michalska <beata.michalska@arm.com>, Fabio Estevam
 <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Sumit Gupta <sumitg@nvidia.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Yicong Yang <yangyicong@hisilicon.com>,
 linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250901085748.36795-1-zhangzihuan@kylinos.cn>
 <20250901085748.36795-4-zhangzihuan@kylinos.cn>
 <CAJZ5v0hu48NrMr6Vkjn_UyHywJMx7F5N6yWf2LiXxykZF79EKA@mail.gmail.com>
 <29890791-4ddf-49c7-a4f2-0ac83e6d53c6@kylinos.cn>
 <CAJZ5v0jvOKeLRkjWoKR5eVKZ-hib7c8D-VOBvtCvs1+HGfPUiQ@mail.gmail.com>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <CAJZ5v0jvOKeLRkjWoKR5eVKZ-hib7c8D-VOBvtCvs1+HGfPUiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_175127_296351_0A7A9CDC 
X-CRM114-Status: GOOD (  17.66  )
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


=E5=9C=A8 2025/9/2 19:47, Rafael J. Wysocki =E5=86=99=E9=81=93:
> On Tue, Sep 2, 2025 at 12:33=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylin=
os.cn> wrote:
>>
>> =E5=9C=A8 2025/9/1 23:17, Rafael J. Wysocki =E5=86=99=E9=81=93:
>>> On Mon, Sep 1, 2025 at 10:58=E2=80=AFAM Zihuan Zhang <zhangzihuan@kyl=
inos.cn> wrote:
>>>> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
>>>> annotation for policy references. This reduces the risk of reference
>>>> counting mistakes and aligns the code with the latest kernel style.
>>>>
>>>> No functional change intended.
>>>>
>>>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
>>>> ---
>>>>    drivers/cpufreq/intel_pstate.c | 8 +++-----
>>>>    1 file changed, 3 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_=
pstate.c
>>>> index f366d35c5840..4abc1ef2d2b0 100644
>>>> --- a/drivers/cpufreq/intel_pstate.c
>>>> +++ b/drivers/cpufreq/intel_pstate.c
>>>> @@ -1502,9 +1502,8 @@ static void __intel_pstate_update_max_freq(str=
uct cpufreq_policy *policy,
>>>>
>>>>    static bool intel_pstate_update_max_freq(struct cpudata *cpudata)
>>>>    {
>>>> -       struct cpufreq_policy *policy __free(put_cpufreq_policy);
>>>> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D=
 cpufreq_cpu_get(cpudata->cpu);
>>>>
>>>> -       policy =3D cpufreq_cpu_get(cpudata->cpu);
>>>>           if (!policy)
>>>>                   return false;
>>> The structure of the code is intentional here and there's no reason t=
o
>>> change it.
>>
>> Got it. Thanks for clarifying.
>>
>> So for this case the current structure is intentional -
> Note that I'm talking about this particular change only.  The other
> change in the $subject patch is fine.
>
>> should I also avoid similar changes in other drivers?
> That depends on who maintains them, which is why I wanted you to split
> the patch into smaller changes in the first place.
>
> My personal view is that code formatting changes, which effectively is
> what this particular one is, are pointless unless they make the code
> much easier to follow.


UnderStood, Thanks!


