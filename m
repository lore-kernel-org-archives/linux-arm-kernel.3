Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA230CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 09:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdTr0sANZg3YvkZ81UCoQHkeuI5x7ADGpEJKdXOD4QY=; b=4axZA1v2Pfo9xwZwI5H7WR3uaz
	Dzse/q/cUgWo6M2iyJHWCxMkg1IwB1H/aZHlC2gAGWzhuSlz/cf9cuE61r5i/ixm/42BZShdTrkd8
	ERbKTVTxGBQcpQZ/q0S4iYuVPka2uWxY8vSraQK76Zd9E7di6lgw4CBwSb5nmhjGRbpFtenmSrIh/
	YyeFPLhb6Y5Mwwcht790yVpQasw1k6qKMJrVQZV36/nf81a6vVrOg9ADRY3+jWDXWyAo8igGAF1ox
	yHWpxljNl2KFxaswsErMxzXMkerh4OzCCTo+LOGSY5IAiSdFxDQG8ulLBr52zJx9O3VBoKLLGaBAz
	gfHUm4vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSJg-00000000ZBb-2nTG;
	Fri, 05 Sep 2025 09:01:08 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuR8D-00000000759-2y28
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 07:45:15 +0000
X-UUID: 397b25d28a2c11f0b29709d653e92f7d-20250905
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:f87db68f-3c30-403e-8904-d7166b6f16d2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:07aa7fe718078e46c5eacd4bb0c408a3,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 397b25d28a2c11f0b29709d653e92f7d-20250905
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 541260558; Fri, 05 Sep 2025 15:44:59 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 29A5AE008FA4;
	Fri,  5 Sep 2025 15:44:59 +0800 (CST)
X-ns-mid: postfix-68BA94FA-497226507
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 27E5DE008FA3;
	Fri,  5 Sep 2025 15:44:40 +0800 (CST)
Message-ID: <11bcb7cb-2169-479f-9247-a48e48e9c54e@kylinos.cn>
Date: Fri, 5 Sep 2025 15:44:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] powercap: dtpm_cpu: Use scope-based cleanup
 helper
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Alim Akhtar
 <alim.akhtar@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
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
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
 <20250903131733.57637-8-zhangzihuan@kylinos.cn>
 <CAJZ5v0hirWzWZiLbAXPWB58SQv3CAW95iHLnsqs=i2twVCcmwg@mail.gmail.com>
 <52e322e5-2dd4-488c-a98e-3a4018f0c323@kylinos.cn>
 <CAJZ5v0g__9g_dfA3=4GVi351f4CKBegKkW9nU81j+Qu=2Hfg1Q@mail.gmail.com>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <CAJZ5v0g__9g_dfA3=4GVi351f4CKBegKkW9nU81j+Qu=2Hfg1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_004514_040716_A4CE3194 
X-CRM114-Status: GOOD (  23.28  )
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


=E5=9C=A8 2025/9/4 21:17, Rafael J. Wysocki =E5=86=99=E9=81=93:
> On Thu, Sep 4, 2025 at 12:38=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylin=
os.cn> wrote:
>>
>> =E5=9C=A8 2025/9/3 21:45, Rafael J. Wysocki =E5=86=99=E9=81=93:
>>> On Wed, Sep 3, 2025 at 3:18=E2=80=AFPM Zihuan Zhang <zhangzihuan@kyli=
nos.cn> wrote:
>>>> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
>>>> annotation for policy references. This reduces the risk of reference
>>>> counting mistakes and aligns the code with the latest kernel style.
>>>>
>>>> No functional change intended.
>>>>
>>>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
>>>> ---
>>>>    drivers/powercap/dtpm_cpu.c | 30 +++++++++++-------------------
>>>>    1 file changed, 11 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/drivers/powercap/dtpm_cpu.c b/drivers/powercap/dtpm_cpu=
.c
>>>> index 99390ec1481f..f76594185fa2 100644
>>>> --- a/drivers/powercap/dtpm_cpu.c
>>>> +++ b/drivers/powercap/dtpm_cpu.c
>>>> @@ -144,19 +144,17 @@ static int update_pd_power_uw(struct dtpm *dtp=
m)
>>>>    static void pd_release(struct dtpm *dtpm)
>>>>    {
>>>>           struct dtpm_cpu *dtpm_cpu =3D to_dtpm_cpu(dtpm);
>>>> -       struct cpufreq_policy *policy;
>>>>
>>>>           if (freq_qos_request_active(&dtpm_cpu->qos_req))
>>>>                   freq_qos_remove_request(&dtpm_cpu->qos_req);
>>>>
>>>> -       policy =3D cpufreq_cpu_get(dtpm_cpu->cpu);
>>>> -       if (policy) {
>>>> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
>>>> +               cpufreq_cpu_get(dtpm_cpu->cpu);
>>>> +
>>>> +       if (policy)
>>>>                   for_each_cpu(dtpm_cpu->cpu, policy->related_cpus)
>>>>                           per_cpu(dtpm_per_cpu, dtpm_cpu->cpu) =3D N=
ULL;
>>>>
>>>> -               cpufreq_cpu_put(policy);
>>>> -       }
>>>> -
>>>>           kfree(dtpm_cpu);
>>>>    }
>>>>
>>>> @@ -192,7 +190,6 @@ static int cpuhp_dtpm_cpu_online(unsigned int cp=
u)
>>>>    static int __dtpm_cpu_setup(int cpu, struct dtpm *parent)
>>>>    {
>>>>           struct dtpm_cpu *dtpm_cpu;
>>>> -       struct cpufreq_policy *policy;
>>>>           struct em_perf_state *table;
>>>>           struct em_perf_domain *pd;
>>>>           char name[CPUFREQ_NAME_LEN];
>>>> @@ -202,21 +199,19 @@ static int __dtpm_cpu_setup(int cpu, struct dt=
pm *parent)
>>>>           if (dtpm_cpu)
>>>>                   return 0;
>>>>
>>>> -       policy =3D cpufreq_cpu_get(cpu);
>>>> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
>>>> +               cpufreq_cpu_get(cpu);
>>>> +
>>>>           if (!policy)
>>>>                   return 0;
>>>>
>>>>           pd =3D em_cpu_get(cpu);
>>>> -       if (!pd || em_is_artificial(pd)) {
>>>> -               ret =3D -EINVAL;
>>>> -               goto release_policy;
>>>> -       }
>>>> +       if (!pd || em_is_artificial(pd))
>>>> +               return -EINVAL;
>>>>
>>>>           dtpm_cpu =3D kzalloc(sizeof(*dtpm_cpu), GFP_KERNEL);
>>>> -       if (!dtpm_cpu) {
>>>> -               ret =3D -ENOMEM;
>>>> -               goto release_policy;
>>>> -       }
>>>> +       if (!dtpm_cpu)
>>>> +               return -ENOMEM;
>>>>
>>>>           dtpm_init(&dtpm_cpu->dtpm, &dtpm_ops);
>>>>           dtpm_cpu->cpu =3D cpu;
>>>> @@ -239,7 +234,6 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm=
 *parent)
>>>>           if (ret < 0)
>>>>                   goto out_dtpm_unregister;
>>> So this change kind of goes against another recommendation given in c=
leanup.h:
>>>
>>>    * Lastly, given that the benefit of cleanup helpers is removal of
>>>    * "goto", and that the "goto" statement can jump between scopes, t=
he
>>>    * expectation is that usage of "goto" and cleanup helpers is never
>>>    * mixed in the same function. I.e. for a given routine, convert al=
l
>>>    * resources that need a "goto" cleanup to scope-based cleanup, or
>>>    * convert none of them.
>>
>> Should I replace all the memory allocation cleanups here with `__free`=
?
>> That would allow us to drop all the `goto`s, but since this function h=
as
>> quite a few of them, I=E2=80=99m concerned it might introduce new issu=
es. What=E2=80=99s
>> your recommendation?
> Frankly, don't use __free() in this code at all, at least for the time =
being.
>
> There is a problem with dropping the reference to policy at the end of
> __dtpm_cpu_setup() because that policy may be subsequently indirectly
> used in set_pd_power_limit() which calls
> freq_qos_update_request(&dtpm_cpu->qos_req, freq) and
> dtpm_cpu->qos_req->qos is policy->constraints, so using it will cause
> policy->constraints to be dereferenced in freq_qos_apply() which will
> crash and burn if the policy goes away in the meantime.  So AFAICS
> __dtpm_cpu_setup() shouldn't call cpufreq_cpu_put() at all and the
> policy should be released in pd_release() without acquiring a new
> reference to it.
>

Thanks a lot for the detailed explanation!


