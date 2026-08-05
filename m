Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A2DC55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 05:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7nS9ySE0V+JoTUsf6Q5P/ff+IkWVITjMMU83WN7jTg=; b=OQyBwS1auAEXpLMrA1xYtk1fP3
	QmeiGzXySIOT0JZ6jFo8nsNzUQqb2r6CcuXDspJe8nKSOQYnA034dMwGwGHoBkxxSc+bSh2A6MzIE
	fK6M6+2qOf+K1tFXl2Sy53RY61J4iNnzlDgcELdSKwI1+TXNvd8mpBYBdkV1jRd9FGV7y+KwX9mqO
	vuWwYKlbHHM1Mzoh2I2XntnV2e6EEcALVqQhOwETm8m8Apt7lnB14qu8HMCvrWfhUjXCpF2VSp2TT
	mRozQutrk9xJQC/qGpO/7NDHhtB7xTqgdUOxTG0QSdNxnadBfCkXaKwCNEYfxkiZHLImYin34eT4A
	ZJpX9QBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrU4w-00000003Fpg-340z;
	Wed, 05 Aug 2026 05:22:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrU4s-00000003FpL-39Oj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 05:22:09 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6752ad7p1255612
	for <linux-arm-kernel@lists.infradead.org>; Wed, 5 Aug 2026 05:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e7nS9ySE0V+JoTUsf6Q5P/ff+IkWVITjMMU83WN7jTg=; b=pPgN49SfebMmllw5
	reL9acnGkt7r+k6vgZBRUOVIm2WXZKZCadKoGvI6rsTvtcKp60Ky14Dp9kJDXFMU
	L0GkOLPb6VtcUUMV+mqF5bDuGdv3OIEq9K1ZB48Tewm89fXy6BaPG6K4W5FTGnLT
	EVAnsaAqE9XF3AZvWCNg9e8Glkbl8VpjzF+kfsRww3Af75CUCtiHnYnE/Q6bHyZ0
	jqZXLu1b0G+tbCFC3r/IJ2eakcjb/v8WDxlA5XxmKbnRDGpEsGK2TL9WSa9d2viK
	uOOaW3tEqooZpqUXxWzMhPnCc6gtoO8S4kZHow9B+agxXJthmlW/XQRhQOXGF3ho
	Tr1j0w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuk9u31kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 05:22:05 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-756fd28d906so9744137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 22:22:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785907324; cv=none;
        d=google.com; s=arc-20260327;
        b=oFTbW3vuWHRGCRW/fdNZmeRvkx6tPyw3Z8Wlb+OzEXg5XMEMy3lLc6idnk5GfNWHTg
         mtADyumMO9N/7Ldy682cJAV2pIvjZfeNU+Z3nRH1oA3K8BCGkuQ59puo7VAXrfiTIE/K
         tbncX1xlFvQQVnJ4yUjSUi9y3OWojCg1M7VRZ2Qd8wsWasbl4oIWj8Yp77G907FCMhj5
         jpfLydt03ibtIIwnKj/kcvgWQYbTQjS9IT7O4EeNYhRJ/L4FqvEbg2POGpikTd0rRvmh
         8mWq/XGi5xpb9lFO8wFhDOAIbQ5X0IM7oYFz2zf43iFIM6pDU2+HtruN1j5YCuEVi5Ym
         g0IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e7nS9ySE0V+JoTUsf6Q5P/ff+IkWVITjMMU83WN7jTg=;
        fh=wckXwjuGUnxaJfGkvEc9I4FBQj4gQwXgAsM2QvOH/14=;
        b=sNM8mLrGTjsW5QCGEql8KW1Nwo0XTvkN5kEkH0/IjQ0NyihzpxCztN1nrlDn1MaCeJ
         5tVLk0VfJbjszCwl91NqW4y8rge0WcPCcs6V7kNw13q7PFYP+Zk4pi+ZZL0jJjQlF4lb
         Nz49k7W21jXOyyvxjjCc76XbIZf6oxe9+ilcHSgb3NgTpqMAc7C4wyAsAKa39xM6/MiS
         IjXM1T0rV7AxtFRwgfPo10u87eDmqUSxfD6nBt53w6LVnpZRNuQGpa21EPvRhMeMnQvY
         QP9YVPMKgoqyHrHYLffrycrMZXxZbcxmFZBmFyEIPQY2Yz5S1TfuxKLAUbntpp01WBBv
         QbyA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785907324; x=1786512124; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e7nS9ySE0V+JoTUsf6Q5P/ff+IkWVITjMMU83WN7jTg=;
        b=j8rLvVHyfQHFguMvWRGpAhdU/NcPdEusnvX+NfGShsvc/nf0bb29o2PXALHHwtvToq
         NiVgmgAmdF3RWdOPtE2I9XVo0oG8mDFt9LqicQBYifzW2XGl0cZsUXtJXvZ8uPihCGrL
         jIA75VsEcOuiAq0+Zj1Dux1sx17x6ilM8ZYI4U8GBjcGD4yXt9XZ1zoCc5KuO1Fuo8mX
         v9GKDteDoDuS1dMNoJRxh1fNSgabYr0PjVBdZayXQz/K3KixYZfUsq66sRknlXOBgNdT
         fwJO/6VhIodYf9zCdg9ke3LM4doBDk7Rr6zW/INUOqsvdBhTn5Z04xa2l+18TOfyKdGa
         mC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785907324; x=1786512124;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e7nS9ySE0V+JoTUsf6Q5P/ff+IkWVITjMMU83WN7jTg=;
        b=VKbfL0kbuGwA2GIE77sR3fkpIT9RO2diIEk7ofISgs7Zi4u1gsJQnR9xwdk+sikUMd
         YJhmpVfYk3nrDvwmjWxFkDtxRRbo5eq3EwsUBtFkIwKhDfLFNynDoN9Ae20b5NPxsiP9
         r7WXq/ghm89z8FUGugZZkkoFJdDN4SKTSsLKnNIYNgS1Hbr6Ielkl0Hfkjz+1Coc1s9b
         GO2wvVKcYc1a2ofiFYybjpHozIhJ6xGJgr2vb//v+zS1kEn0ALFDTJ1Wh4mX3aIRf2DG
         Uiyz66p0ucB8j2m6CciEOKKshcVspWuZ3iea2TA8EC+Vy3CHsJlHJfcJgIJDish/Sxwb
         eK9A==
X-Forwarded-Encrypted: i=1; AHgh+Rozpr1bdsW6UeErQMGbPWK3yhhlYWn+tyqCK6ebXKz+m81zQXrUPGk8t/gOASEp3euJuNo+hRAYIosY6bhRb1C9@lists.infradead.org
X-Gm-Message-State: AOJu0YzqnoUaN2NHGhFsosbbo4SqL3eaaW8dq3ao7bgtTcjhSy3ybOs9
	wzI7XXKlw2Pk3HKEsNeOSttQ2Tsxy/hHNcQ17thPMRKrSpLSNFUbKrixAAzUyqBl6X7ieHP/4CC
	qnfM90wb8rIYm8sY+YENCxd1YxNYAgDhMoSAbyD4zea+VtmlCMqJt3Mp2qmMyGI1BUMVGUGb6u2
	GGyHffkEoowcBy/+EXQ0XhPDYekLgJxn9oIdpjYrWLIQ9dPbrcqn8y
X-Gm-Gg: AR+sD11alqMNAhgYOkaybMeFF8IwN5hzB7wWCRcy9KY2JxM7aICXtjfVdySc28wFoxP
	ouR5LK3bmjLXh+S2x5yRpROMG9yOL7IRX8EXNouJFYX3N/yFuAH55+yvSDqBU59Nxaw14Uo0Bn4
	EZPDWUdZpGKggT3lyoD7/sQrwVQ5ezi2QGwYEkJseg0H07kVnUNFZGKAWllg==
X-Received: by 2002:a05:6102:440a:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-760ea954b62mr409765137.1.1785907324150;
        Tue, 04 Aug 2026 22:22:04 -0700 (PDT)
X-Received: by 2002:a05:6102:440a:b0:6d1:8f7:18a5 with SMTP id
 ada2fe7eead31-760ea954b62mr409745137.1.1785907323551; Tue, 04 Aug 2026
 22:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260802145618.1952804-1-cristian.marussi@arm.com>
In-Reply-To: <20260802145618.1952804-1-cristian.marussi@arm.com>
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 10:51:51 +0530
X-Gm-Features: AUfX_mzRGx5dw9aYwcYhXBsDImEFKOI9rADQzfxh9iY3_FvlM3uSNteDxmBmOLg
Message-ID: <CAPxK-6eoSguQXkQyhoKkxos89BL4Y5f43ntv8MAY7xoiNmMeYQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/23] Introduce SCMI Telemetry support
To: Cristian Marussi <cristian.marussi@arm.com>, david@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, jic23@kernel.org, elif.topuz@arm.com,
        lukasz.luba@arm.com, philip.radford@arm.com,
        souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
        puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=NInlPU6g c=1 sm=1 tr=0 ts=6a72c87d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8
 a=mde1ADDzGYFTShqxZZEA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: IYXazJBQhZilR5kpitWKCYqSKu_zFHR4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDAzOSBTYWx0ZWRfX0n+20BwWEqjC
 /mIqjnLMsMzglxcQfzuRF7l6qxaFT2hVtvOxOoRD/9Xvrgg5VlTSq7r8y1EwwaPheekFC6Pn6t4
 S9nQ0T1pvrpj/loAvMAnJXKJpNMm/+o=
X-Proofpoint-ORIG-GUID: IYXazJBQhZilR5kpitWKCYqSKu_zFHR4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDAzOSBTYWx0ZWRfXzBGINQVg+cee
 96N6Est1OAWFy5mtaD60PaVK9T9AdiRLamKwXHsmclRtYk8zBejBjC0SbYqpAHqvqkQLskfMjEx
 2goqG/dbVvP37eCFjpnO7Axx3H7z62GItfKEL0sNfm+KgYjf7CXzitj5qdRWWtHqwNeil9ugDFg
 N1DP0AEhV8w6mXxhdvjqVz0K8FCu5tmfG1oKuqXIYyMvZZN0rkNeoD+bRpDuYDvEoZ1wioAUgdk
 Jz9bGJ5v3dZQa3dnpriOG8fzR7slJunlaTi/43VQNoeEE+dtbYT9mgp0njS3KQrHHjf+oRv4Ynp
 dmGtjBVsBQfLbUkfyMJb7dTDL5EolVWKZdCH6xZbarqsygPkAma+waU6Sl78IyJmNz31zTTPOe7
 KqrZUqmqXfTc3aZ71v9aiD9tbkM9TR7olIEdyUNh8rQoh1b/MfPZSKOZQJXlVKrFMPwjj+Ryq2+
 vp+6OMC/1B8AvmquIYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_01,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_222206_808385_8B565709 
X-CRM114-Status: GOOD (  43.49  )
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

Cristian and David,

On Sun, Aug 2, 2026 at 8:27=E2=80=AFPM Cristian Marussi
<cristian.marussi@arm.com> wrote:
>
> Hi all,
>
> [TLDR Summary]
>  [V7 highlights]
>  - V7 focus was on making the ABI complete feature-wise by adding:
>    + UUID enumerations
>    + BATCHED DE_CFG
>    + BATCH ops with per-DE status
>    + Generic EVENT Subscription with GENERATION_COUNTER support
>    + Better UAPI Doxygen docs
>    + Reserved space to grow scattered all-over
>  - V7 cleans up all the residual known sparse issues
>  - While aiming for ABI-completeness, V7 addressed also a few reported
>    general driver/protocol issues BUT the bulk of remanining Sashiko-V6
>    complains are still to be tackled
>
>  [V8 TODO (getting merge-able)]
>   - Tackle outstanding Sashiko issues
>   - [ABI]: more DOCS and examples
>
> The upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
> dedicated to System Telemetry.
>
> In a nutshell, the SCMI Telemetry protocol allows an agent to discover at
> runtime the set of Telemetry Data Events (DEs) available on a specific
> platform and provides the means to configure the set of DEs that a user i=
s
> interested into, while reading them back using the collection method that
> is deeemed more suitable for the usecase at hand. (...amongst the various
> possible collection methods allowed by SCMI specification)
>
> Without delving into the gory details of the whole SCMI Telemetry protoco=
l
> let's just say that the SCMI platform/server firmware advertises a number
> of Telemetry Data Events, each one identified by a 32bit unique ID, and a=
n
> SCMI agent/client, like Linux, can discover them and read back at will th=
e
> associated data value in a number of ways.
>
> Data collection is mainly intended to happen on demand via shared memory
> areas exposed by the platform firmware, discovered dynamically via SCMI
> Telemetry and accessed by Linux on-demand, but some DE can also be report=
ed
> via SCMI Notifications asynchronous messages or via direct dedicated
> FastChannels (another kind of SCMI memory based access): all of this
> underlying mechanism is anyway hidden to the user since it is mediated by
> the kernel driver which will return the proper data value when queried.
>
> Anyway, the set of well-known architected DE IDs defined by the spec is
> limited to a dozen IDs, which means that the vast majority of DE IDs are
> customizable per-platform: as a consequence, though, the same ID, say
> '0x1234', could represent completely different things on different system=
s.
>
> Precise definitions and semantic of such custom Data Event IDs are out of
> the scope of the SCMI Telemetry specification and of this implementation:
> they are supposed to be provided using some kind of JSON-like description
> file that will have to be consumed by a userspace tool which would be
> finally in charge of making sense of the set of available DEs.
>
> IOW, in turn, this means that even though the DEs enumerated via SCMI com=
e
> with some sort of topological and qualitative description provided by the
> protocol (like unit of measurements, name, topology info etc), kernel-wis=
e
> we CANNOT be completely sure of "what is what" without being fed-back som=
e
> sort of information about the DEs by the afore mentioned userspace tool.
>
> For these reasons, currently this series does NOT attempt to register any
> of these DEs with any of the usual in-kernel subsystems (like HWMON, IIO,
> PERF etc), simply because we cannot be sure which DE is suitable, or even
> desirable, for a given subsystem. This also means there are NO in-kernel
> users of these Telemetry data events as of now.
>
> So, while we do not exclude, for the future, to feed/register some of the
> discovered DEs to/with some of the above mentioned Kernel subsystems, as
> of now we have ONLY modeled a custom userspace API to make SCMI Telemetry
> available to userspace tools.
>
> With V5 we adopted a pure chardev/IOCTL ABI approach, refining the IOCTL
> based interface already present with the previous FS-based ABI.
>
> INTERFACES
>
> For each discovered SCMI Instance a character device named tlm_<N> is
> created under /dev/scmi/ subtree.
>
> The IOCTL interface described at 'include/uapi/linux/scmi.h' is made
> available to enumerate and configure Telemetry resources: Telemetry data
> can be collected using a few different IOCTls, depending on the required
> granularity.
>
> Alternatively it is possible to obtain a list of the file descriptors
> referencing directly the underlying SCMI Telemetry SHMTI memory areas and
> implement in user space an SCMI Telemetry parser accessing directly the
> SHMTI, while staying in compliance with the SCMI TDCF format.
>
> NOTE THAT from v3 onwards the firmware interface level NOW supports ONLY
> the latest SCMI v4.0 specification [0].
>
> Based on V7.2-rc4, tested on an emulated setup.
>
> This series is available also at [1].
>
> If you still reading...any feedback welcome :P
>
> Thanks,
> Cristian
>
> ---
> v6 --> v7
>  - [ABI] IOCTL EVENTS support: GENERATION COUNTER (stlm monitor)
>  - [ABI] expose DE tracking: UUID/SHMTI/OFFS
>  - [ABI] IOCTL BATCHED DE_CFG
>  - [ABI] added per-DE IOCTL BATCH status
>  - [ABI] new ABI feats flags
>  - [ABI] improved description in Doxygen docs
>  - [ABI] added reserved space to grow
>  - [STLM] added new ABI feats support (generation, UUIDs, location...)
>  - [SYS/TLM] fixed module_init error path
>  - [SYS/TLM] fixed interval DISCRETE flags reporting
>  - [SYS/TLM] check open FMODE before executing a config change
>  - [SYS/TLM] fixing DEs data cleanup on RESET
>  - [SYS/TLM] added _RAW helpers to handle non-MMIO TDCF-like accesses
>    (like Notification payload)
>  - [SYS/TLM] added UUID rescan logic at DE enable, when DE/UUID associati=
on
>  - [TLM] reworked UUID internal handling (endianity) and use uuid_t type
>  - [TLM] added generic Telemetry protocol support for events subscription
>    unknown
>  - residual sparse fixes
> v5 --> v6
>  - rebased on v7.2-rc4
>  - fixed a lot of Sashiko complains
>  - fixed ABI issues reported by review (Fayssal)
>  - added IOCTL TLM_RESET
>  - added ABI versioning
>  - added compat_ioctl support
>  - use a new IOCTL magic name
>  - better handling of UUID endianity
>  - reworked all bounds checks in UAPI implementation
>  - reject oversized SHMTI mmap request
>  - refined 'stlm' testing tool to be more interactive and to
>    exercise the full spectrum of IOCTLs ('stlm -h' is your manual
>    for now :P)
>  - fully reworked per-protocol notification handling
>  - dropped the last bit of human readable data attached to the
>    chardev .read
> v4 --> v5
>  - rebased on v7.2-rc1
>  - dropped FileSystem based driver
>  - introduced a new simple chardev SCMI driver using Telemetry
>  - reworked/reviewed the v4 IOCTLs based UAPI
>  - UAPI: better struct alignment and comments
>  - UAI: Removed flexible array members
>  - UAPI: make SCMI Telemetry protocol stack completely independent from
>          uapi defs
>  - UAPI: new ioctls support to enable RAW mmap direct access to SCMI SHMT=
I
>          areas from userspace
>  - added new ABI Documentation
>  - added new SCMI core facility to lookup the current SCMI instance ID
> v3 --> v4
>  - rebased on v7.1-rc7
>  - updatded doc to detail Concurrency model
>  - bail out on FW_BUG errors
>  - make all_des_enable/all_des_tstamp_enable entry readable
>  - refactored access to TDE values
>  - refactored common accessors for tlm_priv (FIX WARN on kfree)
>  - make all files by default world readable and user writable (if needed)
>  - added uid/god/umask mount options (and docs)
>  - added generation counter to aid spotting config changes (and docs)
>  - added DebugFS configurable support to debug/dump SHMTI areas (and docs=
)
>  - hide FS entries when NOT supported (like des_simple_sample_read)
>  - fixed output format of des/<NNN>/value to -> <TS> <VALUE>
>  - renamed top-dir by_components to by-components
>  - add a .remove method to SCMI System Telemetry Driver
>  - use kzalloc_obj
> V2 --> V3
>  - rebased on v7.0-rc5
>  - ported the firmware interface to SCMI v4.0 BETA
>  - split the SCMI protocol layer in a lot of small patches
>  - completd filesystem and ABI documentation
>  - renamed components subtree to by_components
>  - fixed uninitialized var in scmi_telemetry_de_subdir_symlink
>  - renamd tstamp_exp to tstamp_rate
>  - swap logic in scmi_telemetry_initial_state_lookup
>  - use memcpy_from_le32 where required
>  - changed a dfew dev_err into Telemetry traces
>  - define and use new helper scmi_telemetry_de_unlink
>  - simplify a few assignments with ternary ops
>  - added a missing __mmust_check on the internal SCMI API
>  - reworked and clarified de_data_read returned errno:
>         ENODATA vs EINVAL vs ENODEV/ENOENT
>  - removed some risky/unneeded devres allocations
>  - various checkpatch fixes
>  - reworked and clarified usage of traces in Telemetry
>  - added the missing DT binding for protocol 0x1B
>  - split out unrelated change around notification from patch
>    adding support for protocol internal notifier
>  - more comments
>
> V1 --> V2
>  - rebased on v6.19-rc3
>  - harden TDCF shared memory areas accesses by using proper accessors
>  - reworked protocol resources lifecycle to allow lazy enumeration
>  - using NEW FS mount API
>  - reworked FS inode allocation to use a std kmem_cache
>  - fixed a few IOCTLs support routine to support lazy enumeration
>  - added (RFC) a new FS lazy mount option to support lazily population of
>    some subtrees of the FS (des/ groups/ components/)
>  - reworked implementation of components/ alternative FS view to use
>    symlinks instead of hardlinks
>  - added a basic simple (RFC) testing tool to exercise UAPI ioctls interf=
ace
>  - hardened Telmetry protocol and driver to support partial out-of-spec F=
W
>    lacking some cmds (best effort)
>  - reworked probing races handling
>  - reviewed behaviour on unmount/unload
>  - added support for Boot_ON Telemetry by supporting SCMI Telemetry cmds:
>    + DE_ENABLED_LIST
>    + CONFIG_GET
>  - added FS and ABI docs
>
> RFC --> V1
> ---
>  - moved from SysFS/chardev to a full fledged FS
>  - added support for SCMI Telemetry BLK timestamps
>
> [0]: https://developer.arm.com/documentation/den0056/f/?lang=3Den
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git/log/?=
h=3Dscmi_telemetry_ng_V7
>
> Cristian Marussi (23):
>   firmware: arm_scmi: Add new SCMIv4.0 error codes definitions
>   firmware: arm_scmi: Allow registration of unknown-size events/reports
>   firmware: arm_scmi: Introduce protocol instance notifiers
>   dt-bindings: firmware: arm,scmi: Add support for telemetry protocol
>   include: trace: Add Telemetry trace events
>   firmware: arm_scmi: Add basic Telemetry support
>   firmware: arm_scmi: Add support to parse SHMTIs areas
>   firmware: arm_scmi: Add Telemetry configuration operations
>   firmware: arm_scmi: Add Telemetry DataEvent read capabilities
>   firmware: arm_scmi: Add support for Telemetry reset
>   firmware: arm_scmi: Add Telemetry notification support
>   firmware: arm_scmi: Add support for boot-on Telemetry
>   firmware: arm-scmi: Add telemetry generic event support
>   firmware: arm_scmi: Add Telemetry generation counter event
>   firmware: arm_scmi: Add common per-protocol debugfs support
>   firmware: arm_scmi: Add Telemetry debugfs SHMTI dump support
>   firmware: arm_scmi: Add Telemetry debugfs ABI documentation
>   firmware: arm_scmi: Expose per-instance identifier
>   uapi: Add ARM SCMI Telemetry definitions
>   firmware: arm_scmi: Add System Telemetry driver
>   docs: ioctl-number: Add SCMI Ioctls
>   [RFC] Documentation: Add SCMI System Telemetry documentation
>   [RFC] tools/scmi: Add SCMI Telemetry testing tool
>
>  Documentation/ABI/testing/debugfs-scmi        |   22 +
>  .../bindings/firmware/arm,scmi.yaml           |    8 +
>  Documentation/userspace-api/index.rst         |    1 +
>  .../userspace-api/ioctl/ioctl-number.rst      |    1 +
>  Documentation/userspace-api/stlm.rst          |  148 +
>  MAINTAINERS                                   |    1 +
>  drivers/firmware/arm_scmi/Kconfig             |   24 +
>  drivers/firmware/arm_scmi/Makefile            |    3 +-
>  drivers/firmware/arm_scmi/common.h            |   18 +
>  drivers/firmware/arm_scmi/driver.c            |  119 +-
>  drivers/firmware/arm_scmi/notify.c            |   38 +-
>  drivers/firmware/arm_scmi/notify.h            |    8 +-
>  drivers/firmware/arm_scmi/protocols.h         |   17 +
>  .../firmware/arm_scmi/scmi_system_telemetry.c | 1515 +++++++
>  drivers/firmware/arm_scmi/telemetry.c         | 3762 +++++++++++++++++
>  include/linux/scmi_protocol.h                 |  261 +-
>  include/trace/events/scmi.h                   |   48 +-
>  include/uapi/linux/scmi.h                     |  517 +++
>  tools/testing/scmi/Makefile                   |   25 +
>  tools/testing/scmi/stlm.c                     | 1371 ++++++
>  20 files changed, 7877 insertions(+), 30 deletions(-)
>  create mode 100644 Documentation/userspace-api/stlm.rst
>  create mode 100644 drivers/firmware/arm_scmi/scmi_system_telemetry.c
>  create mode 100644 drivers/firmware/arm_scmi/telemetry.c
>  create mode 100644 include/uapi/linux/scmi.h
>  create mode 100644 tools/testing/scmi/Makefile
>  create mode 100644 tools/testing/scmi/stlm.c
>
> --
> 2.54.0
>
>

  Just to close the loop on my earlier comment: the second telemetry provid=
er
  I  had in mind is now public, RISC-V RPMI Specifications Telemetry
service group:

    https://github.com/riscv-non-isa/riscv-rpmi/pull/162

  V7 has already moved the SCMI ABI in a better direction: explicit ABI
  features,  reserved growth space, UUID tracking, batched operations,
per-item status
  and a  generation event make the interface less brittle than the
version I first
  commented on.

  So I am not asking to block SCMI Telemetry on a generic telemetry UAPI. T=
hat
  would still be premature. My remaining ask is smaller: please keep the
  chardev-facing descriptor/group/config/sample/mmap handling cleanly
  separated  from SCMI-private storage and TDCF parsing.

  The RPMI proposal has a similar kernel-side shape: telemetry elements,
  groups,  sampling rates, metadata, shared memory, timestamps and
sequence/freshness
  handling. The protocol details differ, but the Linux plumbing need not be
  entirely duplicated if a second provider appears later.

  With that boundary in place, SCMI can proceed with an SCMI-specific ABI n=
ow,
  while leaving a practical path to share internal telemetry plumbing later=
 if
  RPMI grows into a Linux provider.

  Thanks,
  Subrahmanya

