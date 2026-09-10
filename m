Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67972C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 10:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpJbFL+rZz/M4vrqd8/z7ghAMgMKrwdsWiy44eS8/vo=; b=mGeJ7c6QIWXR06I/JmBGr4D9Bi
	qsRdUlmcpcN6zxuLs4ltYE+oCpwIkEvlaQJ6/mC4JMNMhKexbgKSypfy/iRLFWsgJitv7jXCFHmEc
	DderqTdp/nldz9IVmcxeWPOa2Top++14673H63St5GqEob+Bm5GrM2OvgMfFjfNeLfgbDfL4fY00W
	xG7BYaMi9biq2Q68A717CSgRjeTLup0oAJQ8TTeB12bNhDsvv29sB9MvIfcMm68WmDFOUfGuDGUvs
	Ll5OPWd98AukN6DYtG1ZAFSptoW0Wod/KsJvGn+XvK46PhMy12I+21fuFLj69GVeu0EFgVhlvWQgc
	D3i7U9zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cB8-0000000E5kr-1vrk;
	Thu, 10 Sep 2026 10:38:50 +0000
Received: from mail-ej1-f47.google.com ([209.85.218.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cB5-0000000E5jq-1zvr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 10:38:49 +0000
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c294183384fso228915866b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 03:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789036724; x=1789641524; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CpJbFL+rZz/M4vrqd8/z7ghAMgMKrwdsWiy44eS8/vo=;
        b=Di/zr03UUbGpOm1qoWMkzdLKvi+WAVvsYpoh0DSuJ5986ldsnwwxaf05QVWkeM4W+Q
         ZzEp1xrQTVTQTGgtMpirIBYwX8kz+1bDQqUoP+klxpZpGyhGUfVL+Ev3788WvQwKCihu
         vWbGcSHt4MW58h+1RtDSpZH90xfyEeSbViS/pXL+JGVb7OgDOLVc4nVW6WbxFDCe7/k6
         FbLBm2zf1aBtC0Kk39j87Ow5vuxtKDZlUctJ2rFISeevqR2GjK3cbaeCUS3ClMX+QjPH
         uRMIosvBq3bzaiFCWYvgYvgh/2aOuBOB0XlMNQb5QHIARQUOA+/db2P4i90DY/85eO3F
         H9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789036724; x=1789641524;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CpJbFL+rZz/M4vrqd8/z7ghAMgMKrwdsWiy44eS8/vo=;
        b=c+lZvqZ9i6dWOAD0yObG6nHJB0sB0w8whw5fuM3xwFD4ruWwQQmpAZxV9E5CtbcgoO
         n+Bj2Cnq23zq2lOTZnLJbzdL11Tltiq0znSxeTjs4+xkUkTX9VTGF8N51HUNaau2SLrs
         3GBzenTjtPWCH95bbqErFzuXplq+XE1YH8UyNNveEhUMx5VWL+Wci4tudGvMLDA36hwo
         YfpJMMNTVN3wCYPNW8QIpHW/HLpUWoqi3YIQfrCJYob86gKvbL72xk/oC6R28vmvj06b
         4g46+ImU5arI1uIPTfrGNPjjQKBJ2rohMZfXJdY2frjtBRpmQxLWP0N1/EFSR8zc4HHl
         T/6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzdvvHyUiIU2ATrquPTZajOaU9g+BiNnyylFccHF8G/8JQNliDZO9NjNrLvIGaDHkECrXY9RzFhAZ9aUNbY5H/7@lists.infradead.org
X-Gm-Message-State: AFuF++mftYew8dFb3RkpdganoDJjG72uLunU8S2PsK4u5nPZQovRN3G2
	/xTWtgm0aikCpPFlCRZCb0SaiOhO/MvxgaZdjpzZiIDAMlrm9QIRSNay66Vx9Mw25rA=
X-Gm-Gg: AYBFou0RROSGfU9H1qDz9rWZ2qmiVEGUHj2eQWNDKO6NKQ9lSiSl4vFx8fA9wNphNEL
	cfMNtL7VA2paVhhuC5Fm6S4xo4yq22QIPT3bbJlWdqQ1Mv3Y/F38oCT3x9GYr1PhIE799afWnAO
	Qp+DKwtbdOj4KSlxmzlj0l/7mcdEaziumr2TjYAFUdWoyBIP2C0LogRC2nPt3kRyl3ljXbAiCB/
	LNvzCaBVjZKnr07gVUCoaewRxwjfXMVbyScvZjYbVe0FCwGqJ1dTV5sPdG6zfW38HkcOYjsqkvN
	8oSpbnnZY0GsGc7WJ6X/LgPIZeh4+shC5cagWgDgG4Ti3o6kB9+QTgZYrY4nFHY7IDcDADpyqzU
	bhtmvYbYWVV6GUY5fX7SdpuR7UBYfjJdK9rEu27+D19zwuCChWaa00SVjbB7yozVzqYpmej/uFS
	+QaVsu9AKyJGufCu2/4AevumI3daTfpe+baTrWLr1FEgpVBtuF7vAVjjvJFHVvXMCESs7LGvcTt
	F8nn5bQE/6+zKcToHfY++lHBydp+aVViOveBOgIo3oUJBEelZ2dHEU=
X-Received: by 2002:a17:907:c0d:b0:c12:74af:51f3 with SMTP id a640c23a62f3a-c260c7ac988mr1629919366b.6.1789036724503;
        Thu, 10 Sep 2026 03:38:44 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d501662sm911270066b.23.2026.09.10.03.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 03:38:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Sep 2026 12:38:43 +0200
Message-Id: <DLBKL8SJL58R.2XQ76X6JILZ8E@fairphone.com>
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
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com> <DKL6P7G0WTM7.UJ6KZERQZDFK@fairphone.com> <iv5radfllym2bjvkrdu4ffs25bqixyos7k3ymncpcdtc2uobn2@zlhsybrj3pwz> <DKX384NK76OS.3NNOMAH72PV2P@fairphone.com> <ssleznoahzs4wgf5irjiagss2rjwl2s2jjnqrrnlpp74rdkgfs@au6x63ykyjfs>
In-Reply-To: <ssleznoahzs4wgf5irjiagss2rjwl2s2jjnqrrnlpp74rdkgfs@au6x63ykyjfs>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_033847_591296_97E798B7 
X-CRM114-Status: GOOD (  27.67  )
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

On Tue Sep 8, 2026 at 3:28 PM CEST, Dmitry Baryshkov wrote:
> On Mon, Aug 24, 2026 at 12:04:57PM +0200, Luca Weiss wrote:
>> Hi Dmitry,
>>=20
>> On Tue Aug 11, 2026 at 2:43 PM CEST, Dmitry Baryshkov wrote:
>> > On Mon, Aug 10, 2026 at 12:16:19PM +0200, Luca Weiss wrote:
>> >> Hi Dmitry,
>> >>=20
>> >> Many thanks for working on this and sending this patch series!
>> >>=20
>> >> On Sun Aug 9, 2026 at 10:15 PM CEST, Dmitry Baryshkov wrote:
>> >> > Qualcomm MSM8974 platform has five SMMU instances, used by display,=
 GPU,
>> >> > Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU=
 v1
>> >> > spec, however they differ from other Qualcomm platforms in the
>> >> > implementation-specific registers and also in interaction with TZ.
>> >> > Venus, MDP and VFE SMMUs are secured and require programming only o=
f
>> >> > CBs, while GPU and JPEG require full programming.
>> >> >
>> >> > This series skips IOMMUs which can't be tested right now (VFE and J=
PEG),
>> >> > and adds only MDP, GPU and Venus (although untested, it is required=
 for
>> >> > display to work) SMMU instances.
>> >>=20
>> >> I do have a patch series (sent years ago to the mailing lists as well=
)
>> >> for CAMSS so I can definitely test this in the future.
>> >
>> > Ok, let's land these first, unless VFE IOMMU blocks display on your
>> > platform (Venus was blocking display on APQ8074 DragonBoard).
>> >
>> >> > Note, to get display to work properly one fix is necessary, [1]
>> >> >
>> >> > [1] https://patch.msgid.link/20260809-msm8974-mmcc-fix-v1-1-50f2dcf=
18d2e@oss.qualcomm.com
>> >>=20
>> >> I've applied this series on v7.2-rc7, with the extra commits between
>> >> that and linux-next for qcom_iommu.c backported so that your series
>> >> applies without conflicts.
>> >>=20
>> >> So far I'm stuck with the GPU not being able to probe, adding some
>> >> printk's shows that in msm_iommu_new() the call for
>> >> iommu_attach_device() is failing.
>> >>=20
>> >> [    5.971154] msm_mdp fd900100.display-controller: failed to load ad=
reno gpu
>> >> [    5.972991] msm_mdp fd900100.display-controller: failed to bind fd=
b00000.gpu (ops a3xx_ops [msm]): -16
>> >> [    5.974073] msm_mdp fd900100.display-controller: adev bind failed:=
 -16
>> >> [    5.974152] panel-s6d6fa1 fd922800.dsi.0: error -EBUSY: Failed to =
attach to DSI host
>> >> [    5.974230] panel-s6d6fa1 fd922800.dsi.0: probe with driver panel-=
s6d6fa1 failed with error -16
>> >
>> > See the patch [1], it's picked up for 7.3
>>=20
>> I missed replying to you, with this patch the display lights up again!
>>=20
>> Unfortunately the GPU still seems to have issues, I don't have a log
>> right now (I think even SSH was dropping then with a bunch of log lines
>> appearing in kernel log on screen). I assume kmscube + more complex
>> workloads worked fine for you?
>
> I was mostly using kmscube, but I can try running the CTS once I get
> back to it, sorry for the delays.

Yeah, kmscube doesn't even work for me.

Bootup works to a tty with screen on (mdss doesn't seem to have any
problems for me), but then as soon as I run kmscube the device shows a
few errors on the tty0 on the screen (USB stops working apparently since
my "dmesg -w" doesn't show anything) and a few seconds later the device
reboots.

dmesg: https://public.lucaweiss.eu/tmp/fp2-iommu-dmesg.txt

The SoC in my device should be MSM8974PRO-AA (a.k.a. MSM8974AB-AA).

I know there are some differences for some bits between MSM8974
(Snapdragon 800) and MSM8974PRO (Snapdragon 801), which variant do you
have? Maybe that's relevant, also since downstream splits devicetree
based on 8974 and 8974pro.

Regards
Luca

