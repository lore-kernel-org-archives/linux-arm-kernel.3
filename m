Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A51C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 08:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ul3iVroMFe8qrm8FbvVkT98nKEMOhIID1sGLRlIk0SE=; b=j3sV2p7t0PEtLyNJokb8pDMsKK
	CgcuOU5jGCPw8KyJ6JQFieLIbaFZi37iihv3Vd9OSX74xNZMSrcaI8GL4sl5Qn8HrDv/14C24yAIJ
	U5h4O6LGIWwuSwJrAJuXcgCoQmqu0KhA3oIJuOypYHE9tYp9GbeCmGhliuoVx/I0LyD2eEMLhaqxf
	EwzXRkxZL/OQN7V0VpBhKILF9TpA5oW0Nyhq6I1a++0Y143mOd36iCmNd+BIPPhKlWAt58X/guG4J
	eLar+8Ew9aqMZ7Vno580yzYw8xOYYPtRJ9HMN/rrFLaOYfiZRFooTyuEYpWZmwKIyoczjxCXk0+8Q
	oeEgP6YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77DS-0000000ArKw-3aUP;
	Thu, 17 Sep 2026 08:11:34 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77DP-0000000ArJp-0eDh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 08:11:33 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254f560398so91973366b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 01:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789632688; x=1790237488; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ul3iVroMFe8qrm8FbvVkT98nKEMOhIID1sGLRlIk0SE=;
        b=pSfbweizXBpcfGyzn+bfBqyTqzWXRZWc+2dq7VXWlxEuam+mABfUO6k6RNeyvumqZh
         Se9b2M1WEaqi2B2IIXMLCucC+15gKegKFitIf0aHA5GaGMnPt6eLzkr87RTkX7ayz+KD
         631ZvXkEEfGLOIqlx2Fiz/VGZK4z+EpE+ciAIeqIiCz4avNse8Zo6rUUv6fPH14dX4zh
         b9zErwOQM/o5e2ZiMZdTSZR4WdevJJSU1B1Lk8CF6q7WFDBwfaVCr8UbBeUrpi8x/1MO
         0F7yaHdiCrJgDAnhYxg5ciPxpWxeduMBpOjQ1C6vZSEAeg8cADIiJk9l16H7bjWImYeI
         7cKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632688; x=1790237488;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ul3iVroMFe8qrm8FbvVkT98nKEMOhIID1sGLRlIk0SE=;
        b=fQyqKxjWa3EdgyvOhhFlPbR2AOxAOsirI5Pvbb6zsRxEOus8uUqW/J3Oto0ak82gmR
         jKeMR8V5XPgzvoV4Q09Sd00mM0k8Zt7tyj2GF5K52kBGp1aW9+vU5IA/vZ7XCOSzP+mF
         sjoqrAwWFLZaENLnlZQz5jJnX3dAKmZ2AhjGtMwtSjXbuWeIlVzkO7Pas4vFiwZN+vyh
         znpXKmAf99MZlYm5XdEzQBmG8+l1HHsW/XsTe+mXZruoNiqFk6A8hxACffTnKW/vUH6+
         dwbcRZ9eYpXvqvQiek4/nPmrwJoeHcDBPF1LvKTuw0APkCtTN0iThKYeMtcBvEBHspzO
         mvZA==
X-Forwarded-Encrypted: i=1; AKwUvBwWxfVkgJjIujO4345RBaL9a6c2RoiC6omLAn0quE5gKC/5o2xZlqu80pYDJFiCm8FL6OgUAaoUFiyznZAElYQM@lists.infradead.org
X-Gm-Message-State: AFuF++mRcKU0jpJvHnDODAk8Lns6o8nts3gPPqwHJKz79zeY4jrB8Q5u
	3Gyjn0H0AvQpEM5Re+QLgqX0CN6URRu9Jf16RSUkw8q0NltuIA7IHzLYLGdnROYPNYQ=
X-Gm-Gg: AYBFou0ctoDxz6bgH5mmAZ494DqSesrbn20e6U1L7R64jHFr3YDUYlI4/qNygymCxon
	ShgZEvnyseJaGXhZFhelm+FebmqaGT8VE8iFQl5lLBdnaAqRN9zdIhkxqzIKtPlAcadg4a8zHFQ
	uPDy2Q5GbcxoVJSQPfn7Iy7AQTj59YnLjpC4Hwds/nODx/wDppElwylstyNqBxSAGKBdKBRZait
	yg3t1hYgvfc+PFXfovRIgkvpsd87MMDdqqQob72qfN5X9JKklrUMKdZGJ3FxvRMevdFj4V+qIsB
	76g+E4cJWYSJlJAmTEGNW5vxMOCrc4YnMbf18ho3BIr+D+VbZP19gT3N7Lvf9Jo1xtkqNPVUBdB
	OQAuPd5HFg686aKhLMF18Bswu9ued5j5PnjCySxG3yVoFN2jskMWfR+LQ2nCax9yOwBtCMXV66A
	TXYRp3Sw2FaUY188geUT/oNoJkdUVlnFvWD2tw9SzlvIviihyCoXvXN/rYzf7Us4L2qThaxXAIu
	/KB9P/U7JiQuUFUJMyBsGUD0Rm65FruHKY6B1871WM=
X-Received: by 2002:a17:906:478a:b0:c29:1133:e17b with SMTP id a640c23a62f3a-c29e523e769mr435122166b.19.1789632688364;
        Thu, 17 Sep 2026 01:11:28 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de63c5e7sm238690466b.53.2026.09.17.01.11.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 01:11:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 10:11:27 +0200
Message-Id: <DLHFUAOHVWN7.1K596C038662Y@fairphone.com>
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
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com> <DKL6P7G0WTM7.UJ6KZERQZDFK@fairphone.com> <iv5radfllym2bjvkrdu4ffs25bqixyos7k3ymncpcdtc2uobn2@zlhsybrj3pwz> <DKX384NK76OS.3NNOMAH72PV2P@fairphone.com> <ssleznoahzs4wgf5irjiagss2rjwl2s2jjnqrrnlpp74rdkgfs@au6x63ykyjfs> <DLBKL8SJL58R.2XQ76X6JILZ8E@fairphone.com> <CAO9ioeUEQ+kzBLj3KTv+uayaE-5aw-aL49-0pJ-x_Vwq4nu9JA@mail.gmail.com>
In-Reply-To: <CAO9ioeUEQ+kzBLj3KTv+uayaE-5aw-aL49-0pJ-x_Vwq4nu9JA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_011131_273579_AECDA429 
X-CRM114-Status: GOOD (  29.56  )
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

On Thu Sep 10, 2026 at 4:20 PM CEST, Dmitry Baryshkov wrote:
> On Thu, 10 Sept 2026 at 13:38, Luca Weiss <luca.weiss@fairphone.com> wrot=
e:
>>
>> Hi Dmitry,
>>
>> On Tue Sep 8, 2026 at 3:28 PM CEST, Dmitry Baryshkov wrote:
>> > On Mon, Aug 24, 2026 at 12:04:57PM +0200, Luca Weiss wrote:
>> >> Hi Dmitry,
>> >>
>> >> On Tue Aug 11, 2026 at 2:43 PM CEST, Dmitry Baryshkov wrote:
>> >> > On Mon, Aug 10, 2026 at 12:16:19PM +0200, Luca Weiss wrote:
>> >> >> Hi Dmitry,
>> >> >>
>> >> >> Many thanks for working on this and sending this patch series!
>> >> >>
>> >> >> On Sun Aug 9, 2026 at 10:15 PM CEST, Dmitry Baryshkov wrote:
>> >> >> > Qualcomm MSM8974 platform has five SMMU instances, used by displ=
ay, GPU,
>> >> >> > Venus, VFE (camera) and JPEG encoder. Each of them follows ARM S=
MMU v1
>> >> >> > spec, however they differ from other Qualcomm platforms in the
>> >> >> > implementation-specific registers and also in interaction with T=
Z.
>> >> >> > Venus, MDP and VFE SMMUs are secured and require programming onl=
y of
>> >> >> > CBs, while GPU and JPEG require full programming.
>> >> >> >
>> >> >> > This series skips IOMMUs which can't be tested right now (VFE an=
d JPEG),
>> >> >> > and adds only MDP, GPU and Venus (although untested, it is requi=
red for
>> >> >> > display to work) SMMU instances.
>> >> >>
>> >> >> I do have a patch series (sent years ago to the mailing lists as w=
ell)
>> >> >> for CAMSS so I can definitely test this in the future.
>> >> >
>> >> > Ok, let's land these first, unless VFE IOMMU blocks display on your
>> >> > platform (Venus was blocking display on APQ8074 DragonBoard).
>> >> >
>> >> >> > Note, to get display to work properly one fix is necessary, [1]
>> >> >> >
>> >> >> > [1] https://patch.msgid.link/20260809-msm8974-mmcc-fix-v1-1-50f2=
dcf18d2e@oss.qualcomm.com
>> >> >>
>> >> >> I've applied this series on v7.2-rc7, with the extra commits betwe=
en
>> >> >> that and linux-next for qcom_iommu.c backported so that your serie=
s
>> >> >> applies without conflicts.
>> >> >>
>> >> >> So far I'm stuck with the GPU not being able to probe, adding some
>> >> >> printk's shows that in msm_iommu_new() the call for
>> >> >> iommu_attach_device() is failing.
>> >> >>
>> >> >> [    5.971154] msm_mdp fd900100.display-controller: failed to load=
 adreno gpu
>> >> >> [    5.972991] msm_mdp fd900100.display-controller: failed to bind=
 fdb00000.gpu (ops a3xx_ops [msm]): -16
>> >> >> [    5.974073] msm_mdp fd900100.display-controller: adev bind fail=
ed: -16
>> >> >> [    5.974152] panel-s6d6fa1 fd922800.dsi.0: error -EBUSY: Failed =
to attach to DSI host
>> >> >> [    5.974230] panel-s6d6fa1 fd922800.dsi.0: probe with driver pan=
el-s6d6fa1 failed with error -16
>> >> >
>> >> > See the patch [1], it's picked up for 7.3
>> >>
>> >> I missed replying to you, with this patch the display lights up again=
!
>> >>
>> >> Unfortunately the GPU still seems to have issues, I don't have a log
>> >> right now (I think even SSH was dropping then with a bunch of log lin=
es
>> >> appearing in kernel log on screen). I assume kmscube + more complex
>> >> workloads worked fine for you?
>> >
>> > I was mostly using kmscube, but I can try running the CTS once I get
>> > back to it, sorry for the delays.
>>
>> Yeah, kmscube doesn't even work for me.
>>
>> Bootup works to a tty with screen on (mdss doesn't seem to have any
>> problems for me), but then as soon as I run kmscube the device shows a
>> few errors on the tty0 on the screen (USB stops working apparently since
>> my "dmesg -w" doesn't show anything) and a few seconds later the device
>> reboots.
>
> Interesting. I wonder if it's TZ tripping on the VFE IOMMU.

Do you have any suggestions for me to try?

>
>>
>> dmesg: https://public.lucaweiss.eu/tmp/fp2-iommu-dmesg.txt
>>
>> The SoC in my device should be MSM8974PRO-AA (a.k.a. MSM8974AB-AA).
>>
>> I know there are some differences for some bits between MSM8974
>> (Snapdragon 800) and MSM8974PRO (Snapdragon 801), which variant do you
>> have? Maybe that's relevant, also since downstream splits devicetree
>> based on 8974 and 8974pro.
>
> Mine is APQ8074, not sure if there were revisions.

Maybe /sys/devices/soc0/* or /sys/kernel/debug/qcom_socinfo/* has info
about the revision? But maybe it's also not useful. I checked a bit more
before and all msm8974-v2 downstream seem to have the same IOMMU config,
just msm8974-v1 (which was barely shipped?) has different configs. So
hopefully the SoC revisions shouldn't make a difference here.

Regards
Luca

