Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B69C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 03:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QrztbhIzhEGt6f3MGaPx3+gUNHg1v0QODEPxhGsrfR4=; b=EjI25o3kdCMe3sYUxfI/EZUZyl
	wdUamQJ1sRMFZduiuy8vT8uag7GJF+Mqf+Clswu2MvILpH0/TuFOu0H1ozIWigp15vpyRYKqOgViq
	8J0YpCpiYDg8rX24zaXMj7Ym2eqll/L0eLmDEsd2rwxTsHS3OuZlkgDy0Tfi/rWLxyHVysBP2Jo+Z
	iHyy02Ktp5UnQDzUAxZdao+0C3Y3WSzLmmWP8tigKYw8vI7GtccD77GytaYpaaYeS8Rq+C2PAnFc5
	iWkopcC8p9VYbTzj3ezpwk881P8SpUZC4x9oUqeINoBpzry7kUkNYgCb0Deg9HIvXusf8IKx2ymYk
	KZz4PSuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkxPO-0000000GbLx-1Gcc;
	Thu, 20 Feb 2025 03:39:30 +0000
Received: from out162-62-57-252.mail.qq.com ([162.62.57.252])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkxNq-0000000Gb4E-2jry
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 03:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1740022663; bh=QrztbhIzhEGt6f3MGaPx3+gUNHg1v0QODEPxhGsrfR4=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=Jmux3xhHpiWhhxGFY2yykB2gNrlZWrcjz8P2lBKHeTcyN0ExnhtfdD3xnNHGyx+gR
	 m4gTLaOd/CQh1EDG++xyvGA05uyJqTgTbKMjZqciFR3PoLlXJK/YCwcpDUinWrBko9
	 LZPJxj3lP2w15VWvahIxGZcuMGzDXEQVosgVRj2g=
Received: from smtpclient.apple ([2408:8207:18a0:b53f:e516:fb34:5948:11a1])
	by newxmesmtplogicsvrszc11-0.qq.com (NewEsmtp) with SMTP
	id 966A72EB; Thu, 20 Feb 2025 11:37:38 +0800
X-QQ-mid: xmsmtpt1740022658t0dl3oa06
Message-ID: <tencent_F70BEE494C40C8752302DF97608DF680E306@qq.com>
X-QQ-XMAILINFO: NY3HYYTs4gYSd8sfm6LPIWrV+Z0MsMT1ELpP2j1ne2+F7AJakzc5o2w+7Ea9/L
	 r1plFCfFbwppqIwvN68tO2uPPWIqp/qMqXbJANZAvRVJEdPpD70OXwegSNuVJJ/zQjgaaXpu85j0
	 aS+2JjqONPqm61y5sc/kd90nJ2o7mUg8msNuGfR6DXnRbZ8UWNXo15cs07pmlHKCEKdXaDjE1Bhp
	 IaQRdSW/jcF68mst7X1gIjAayzETZoOq2nnCTtdXI4Kcejo9wxfkRA0eJhTGYRpp7gUtbtM3kZSE
	 qFmttZiIp9Aylbb2yLhabRykQsh3Hz1Lf8NXE0NKs+3TRME938r6ttXmMFMw7QtnTlRI0/D4u4au
	 qbdL8Hfac9nUSU/C/Pw2cju+C/HsjpZZNTLz3cOR3SpuImGUdn87YdAbd/+KzlWR1tRMHywqbLGQ
	 Dgpg5XO3sWXCTNyiMuDUN6AdRABY77lCIQ3UePEmnDv7GWq+59BJwLQEaG3cqAw2sCbpS3SLScHv
	 jdjAK/rczEfjRxEyDPNV/Zi9UJPDcfzm4eb/2RskNBpgR8NmJ6mVfTgXMc+LJxupS4szuMtuRVBf
	 NxKcmGGJz48c3F+nNk2fhXTnSXVfizzOMyFscU5syfcbzGSEfUYNhplX71l6n4/Dg3gqzTg7QIwv
	 yXAlNdnDrdygvmq0Z9pjUUjXw5rm3VKor1R2IFEbp5AY5c6fGEejLjEcKo+35XOgZnVE9nxRQJYb
	 +hNuB23jGA8WQcR2Ukwjd8PtdozrCqiDkQ07SYsL3zXDQM95wIm8Uxav1sL1PO18+5c7+yzQig8N
	 SfGwRXaTQpkwcDI3MF0xPlEwX7eM4saLuAcqahO7A3tKEOTCwDRM9kY0snAePzWStq3b3N1djRpb
	 /aGn81KIa1YKhw1Gvrjh8tZ8KoUIbRi3MIZjhto66G7Phf6qr5FGg4newHxdX4KCtEh2/ywtMwK3
	 XyWxGwPJdrto8K43jVl+uYlrnpkfEFXZ8uqt9w1DrIA8clrGaSdQ==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH 0/2] perf vendor events arm64: Add A720/A520
 events/metrics
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <CAP-5=fWXmNoFLyWv+vo7hhLSqTDy7hf+-huKRD9OUWnO-GESRw@mail.gmail.com>
Date: Thu, 20 Feb 2025 11:37:28 +0800
Cc: Namhyung Kim <namhyung@kernel.org>,
 James Clark <james.clark@linaro.org>,
 linux-perf-users@vger.kernel.org,
 John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>,
 Leo Yan <leo.yan@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Liang Kan <kan.liang@linux.intel.com>,
 Yoshihiro Furudera <fj5100bi@fujitsu.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
X-OQ-MSGID: <4EC06A50-E35D-42EF-8219-E6CAF007A620@cyyself.name>
References: <tencent_5360DA048EE5B8CF3104213F8D037C698208@qq.com>
 <Z66YjGvjD_yzEHUg@google.com>
 <tencent_45B4E91CA370C563D6420A1A25F992056D09@qq.com>
 <1b8b234f-6435-45cf-83e7-8e86c84f075f@linaro.org>
 <CAP-5=fVAhLLH-a0_wLo8dPoMLOb6rOJiTgGh-OFZJJoaLFE-8Q@mail.gmail.com>
 <fe46069e-c52e-45ee-b4b3-8b929fb83b31@linaro.org>
 <Z7UHieRRnvRb5_oU@google.com>
 <CAP-5=fWXmNoFLyWv+vo7hhLSqTDy7hf+-huKRD9OUWnO-GESRw@mail.gmail.com>
To: Ian Rogers <irogers@google.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_193755_214929_49E462EC 
X-CRM114-Status: GOOD (  30.21  )
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



> On 19 Feb 2025, at 06:33, Ian Rogers <irogers@google.com> wrote:
>=20
> On Tue, Feb 18, 2025 at 2:19=E2=80=AFPM Namhyung Kim =
<namhyung@kernel.org> wrote:
>>=20
>> On Tue, Feb 18, 2025 at 09:30:23AM +0000, James Clark wrote:
>>>=20
>>>=20
>>> On 18/02/2025 12:41 am, Ian Rogers wrote:
>>>> On Fri, Feb 14, 2025 at 2:02=E2=80=AFAM James Clark =
<james.clark@linaro.org> wrote:
>>>>>=20
>>>>>=20
>>>>>=20
>>>>> On 14/02/2025 5:49 am, Yangyu Chen wrote:
>>>>>>=20
>>>>>>=20
>>>>>>> On 14 Feb 2025, at 09:12, Namhyung Kim <namhyung@kernel.org> =
wrote:
>>>>>>>=20
>>>>>>> Hello,
>>>>>>>=20
>>>>>>> On Thu, Feb 13, 2025 at 11:11:01PM +0800, Yangyu Chen wrote:
>>>>>>>> This patchset adds the perf JSON files for the Cortex-A720 and =
Cortex-A520
>>>>>>>> processors. Some events have been tested on Raxda Orion 6 with =
Cix P1 SoC
>>>>>>>> (8xA720 + 4xA520) running mainline Kernel with ACPI mode.
>>>>>>>=20
>>>>>>> I'm curious how the name of PMUs look like.  It is cortex_a720 =
(or a520)?
>>>>>>=20
>>>>>> The name of PMUs comes from Arm's documentation. I have included =
these
>>>>>> links in each patch.
>>>>>>=20
>>>>>>> I remember there's a logic to check the length of hex digits at =
the end.
>>>>>>>=20
>>>>>>=20
>>>>>> Could you provide more details about this?
>>>>>>=20
>>>>>>> Ian, are you ok with this?
>>>>>>>=20
>>>>>=20
>>>>> I think they wouldn't be merged because they're core PMUs, so =
should be
>>>>> fine? Even though they would otherwise be merged because they're =
more
>>>>> than 3 hex digits.
>>>>=20
>>>> Do we know the PMU names? If they are cortex_a520 and cortex_a720 =
then
>>>=20
>>> It will be "armv9_cortex_a720" from this line:
>>>=20
>>>  PMUV3_INIT_SIMPLE(armv9_cortex_a720)
>>=20
>> I see, thanks!
>>=20
>>>=20
>>>> this comment at least reads a little stale:
>>>> =
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/t=
ree/tools/perf/util/pmus.c?h=3Dperf-tools-next#n76
>>>> ```
>>>> /*
>>>> * There is a '_{num}' suffix. For decimal suffixes any length
>>>> * will do, for hexadecimal ensure more than 2 hex digits so
>>>> * that S390's cpum_cf PMU doesn't match.
>>>> */
>>>> ```
>>>> James is right that core PMUs aren't put on the same list as =
uncore/other PMUs.
>>=20
>> Ok, then I guess we're good.
>=20
> I think you may be able to do things that look odd, like today the
> "i915" PMU can be called just "i", I think the a520/a720 naming will
> allow "armv9_cortex/cycles/" as an event name, then open it on two
> PMUs if they are present. We may only show one PMU in perf list as
> that code I think assumes they're the same PMU as they only differ by
> suffix:
> =
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/t=
ree/tools/perf/util/pmus.c?h=3Dperf-tools-next#n384
> I can imagine aggregation possibly being broken, but I think that
> works off the number of PMUs not the names of the PMUs, so it should
> be okay. Probably the only thing broken that matter is perf list when
> you have a BIG.little system with a520 and a720, this may be broken
> with say a a53 and a72 today as both of those suffix lengths are >2,
> but maybe they use the "armv8._pmuv3_0", "armv8._pmuv3_1", etc. naming
> convention. I suspect the >2 here:
> =
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/t=
ree/tools/perf/util/pmus.c?h=3Dperf-tools-next#n80
> would still work and be correct if it were >4. If that changes then
> this will also need to change:
> =
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/t=
ree/Documentation/ABI/testing/sysfs-bus-event_source-devices?h=3Dperf-tool=
s-next#n12
>=20
> Thanks,
> Ian
>=20

On my system, the names of PMUs are `armv8_pmuv3_0` and
`armv8_pmuv3_1`:

```
$ ls /sys/bus/event_source/devices/
armv8_pmuv3_0  armv8_pmuv3_1  breakpoint  kprobe  software  tracepoint  =
uprobe
```

I searched for ACPI DSDT on my platform, but there's no mention of
a720 or a520. I haven't delved into the PMU kernel driver yet.

Additionally, there's a more significant problem for aarch64
BIG.little platforms when two or more types of cores don't have the
same PMUs. The perf list can only display the core PMUs on core0
unless we use the PERF_CPUID env to override it. This is because
perf will only probe the first MIDR here:
=
https://github.com/torvalds/linux/blob/87a132e73910e8689902aed7f2fc229d690=
8383b/tools/perf/arch/arm64/util/header.c#L60

However, I think this doesn't block this patch for adding events and =
metrics?


Thanks,
Yangyu Chen

>>=20
>> Thanks,
>> Namhyung


