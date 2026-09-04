Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E603C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 07:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LB6s0B651lSSZ12Sdfk1hENNUEaAaUZ9od/XOsIo4uY=; b=vT6YuSDV+AxwLnYIMt49BsTx+P
	LUj4EdUZMXtTVmFXM7OGTlpU9rmUkfnAHfZXFySQZOQ4O30sp8HHEUxEhspxh2g+D4bccAjj1rt+g
	J8yL32RBoPZ3264HqvT4PKfytIox2faMe3qDohmp2uE88A5HcukRvseFwL8CVC+f+vSXwZOyWA/CS
	IIpQZsatdHVOEs+hxyGlwPJfRfwfzVjicdfQXP99qJTwIOMKof7kmH0rSuckGgGjJYH/zacLVdJ4Q
	k/v5zSCNdDcExdPfOFp8RJmekEKYlS/YLzNW2vMhN1nSxQqEjPvZvLSvJxRap7KhAMD3j3Pb65li+
	obfdpv2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2OBD-00000001EXl-2iQS;
	Fri, 04 Sep 2026 07:17:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2OBA-00000001EXO-46qf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 07:17:42 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68462gm32203427
	for <linux-arm-kernel@lists.infradead.org>; Fri, 4 Sep 2026 07:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LB6s0B651lSSZ12Sdfk1hENNUEaAaUZ9od/XOsIo4uY=; b=OI8FT8WhAfwVk+ZZ
	8T5wxyqpe708tolnXc/VTkesfR67qqX1vGQ9RxJyEyTCl2T5XFfW8RIeogaCL5Zt
	4E/omkikXWrxxm+RLQRXjGY0OlJQ2lKWJX0g7LtAZgVjohNaB92hYZsfdUHcte/P
	SBndiqT6076Ry6JMFdRQyA+2Yf7A2Xx9N0ugFAnnXxcUTJ91+wZlVx8as/ZggFZl
	TmagoMORfsZZj+pAc6bU0p25PSM7HrrM0tq/Hyx/iBXiNcsc5oY0K9+La/nYnu39
	XHaTGr8kOkiuMF9F3RftxWTB2ENwvtQAqCyEA0/kgNGd5Ouwb+M10AzzU4CyC56j
	k3HbZQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfk9215s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 07:17:39 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1b8088203so979437a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 00:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788506259; cv=none;
        d=google.com; s=arc-20260327;
        b=HVDFtuzxSMHZRjqLj1hovBs8Rnz1qBLtUtv5eafxAbhLePnTCyjOhhj9hnG3bfll2v
         v6RsDu9Zt54HjCJHcFZJrrX7IR8MODupLsrFmzopjQ1imqM3n0yrVlSDu0sXVSVQ+6R8
         06IlIQAXYDQHHp5h9iG93hgB8EzEdOP7nMbf4vD8+kJk2wW528MPQs+hKrowlD3pLNmJ
         oeN3v5wf9Ya0jOXSBM7d5zyrnzTLhbuO0C17ddRbDZW8L7rMmagAaIIf4wZ6yjlQZ2rX
         U9KITlXw1kYmPOlUNYBQuMXqUZy96ez5o0Xbf1GbE9eIWu+ugI8jCSU5ajJ0Eg2bwIPq
         qZng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LB6s0B651lSSZ12Sdfk1hENNUEaAaUZ9od/XOsIo4uY=;
        fh=stV0bM7jqbJ0GmSmGwRo4mQvpeaQgKrfuYEvkrUQYsM=;
        b=J0Ac9wi08TzVCCeS0EC7pQdFDSGaTIPHputk/xxsfD6CFJknlbqmOqu2e6bU6K3JTy
         blZX7LlOa08JJmD/s0xu24azKtsqoCuTMXIWhcPuaRlLcw2ORE1MA2KryJC6RIdOPpBx
         YIYjvUT7Fs7s8Qm8LPEH2q+ez9hUB8hfprNcBhTfs64oF13muR5UXx8kPQAnr37xV7GS
         a8jsyMfEpTaBFwrnXt2SqoPO2560d82F5Bu+9JMr2woAeXsoPyDC7ce4VpxHeNJ66fWC
         AIQuJv2W8UVCc+IldymntNU9n2EJH0+hb7xuwdJRZnBCJ9qaZ8i3o+H7hwIU8MgYKZCB
         HH+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788506259; x=1789111059; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LB6s0B651lSSZ12Sdfk1hENNUEaAaUZ9od/XOsIo4uY=;
        b=ZbmyKgOBeEb7i1UYwMsBPycYir3gzj37iMc5stXoPbz/rmKHu9gvMk9bLQzTQIj1k+
         rTKbRZU8V1qtryWegag9iora3WOcvH/hJwRpV8RsoOBX5aAaaJjYn6rygGjL/MfCYByL
         Zx5Gwl/68zUo4VfzllKf4xylcI1EEJIrRg+9VkdZvTz5B5dRn7JS8E0S8/CQq5meH1+N
         u8Mv1tP9v8RrHdIASJ3Kv0T6ZYbCCl3LidDbQ33dCU7Kd/gQlN/e32dgoxIqZBxy9gQP
         X3U/iE0OVIGkkMl0bXT0mJeVjB+hH+f0MpXane6NYelTdt5do3VieYtGz02znrj+Q2Gv
         7T/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788506259; x=1789111059;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LB6s0B651lSSZ12Sdfk1hENNUEaAaUZ9od/XOsIo4uY=;
        b=jIG7zy3hUufgW1JHY1IfHIBF8Irp3KX3rOQOqnAXgB2GzsPY3fU7rA8bELQYxYoHra
         VHsAYBvrAgMYQOJ5wT6oDwaSIbHMjlMI6fCNNwGZMTuLtXogdOnTw0CgeNPF6N4GubdW
         6iL8VCpTDfhh8nPcP7/ctHPP5bjKY5vp7MvrkbVwRTVGd0oQsc4xvsSnCMrd/JlA+WhB
         jRZiRhL7We7h1RtnV+HJrrm3MgSGyx8SAJR3g1dXnrYUy4oTBrDTyG+ncYDVzQH8pr8r
         OYo1zftSTxxL1XDR9wH7YX9mwXBfhG5K/CLae6WvWbZ2ycGRBw1CqLKM5My7H4O68SlG
         g6Vg==
X-Forwarded-Encrypted: i=1; AKwUvBz1aQlazIlvua1W3ICfGiiSwnXegWKT/5UuI21md2ZAumC+0MOwqylFe8aJlUyCRV5ip9mY4iSFzgtU3rOpwZao@lists.infradead.org
X-Gm-Message-State: AFuF++n7J/G+bTJfn0fMRAuEsI8Ghs3Oxc+Hrnl1M2jM0+0JP/kE923Z
	6xd12ylliLD2edLB9cufoIChVIgt/wXHBhiVw0TuDBi3ielg7+xjmThK2oFQQxN26tlsZME8RRN
	E7DKSH2aYp+iLKmDQH/NdxGDhoUp+x1HRBSnzjDqZEu9E2lpVIrpxTS8tn9LyPhlM/qUJwouTl+
	4pwHxCN0HAEvE3hrwl2lSb7/JMLfF7qsXecpSwAPCxUXIRXyfNwJmp
X-Gm-Gg: AYBFou0nccPxjPm6UqRylvoMkzEnPVz5dWGzN6f0u3o3QOSBRy6KaRqbKmNrqY1pPwH
	WXuNwlYsyK0cJp2LGRJiR2NplyuHOb5eGP+dp65kFO6VdHspYy3jvtOkS60r4Km4ADXvCsuQUPA
	b0R2ty3CMeyAC7cM5sEBr3LJlUncqWZko6nwUM5pGePacHu1hES9vDM1TE4w==
X-Received: by 2002:a05:6a20:7290:b0:3cd:9f99:3381 with SMTP id adf61e73a8af0-3da39878551mr5927933637.0.1788506258726;
        Fri, 04 Sep 2026 00:17:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:7290:b0:3cd:9f99:3381 with SMTP id
 adf61e73a8af0-3da39878551mr5927876637.0.1788506258295; Fri, 04 Sep 2026
 00:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260903160401.GV2133376@google.com>
In-Reply-To: <20260903160401.GV2133376@google.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 09:17:25 +0200
X-Gm-Features: AcwNN1XLgC_UnHcC1VgAAx4Zjez2ZZ2qUdiBHVeX_BYEXGU9Ghy4hb4yt4Luazs
Message-ID: <CAPx+jO9Hi2R_UnCEhsXLwf74c3RTb+RodaJ6SOVXbQX_eHt++A@mail.gmail.com>
Subject: Re: [PATCH v24 00/12] Implement PSCI reboot mode driver for PSCI resets
To: Lee Jones <lee@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA2NiBTYWx0ZWRfX6l+xrdkXAhOd
 01uTCtN4EGCMm54DbNPCjCczK11Urd6RbRZUxAiN0bFLdaZPBXcO8pDgZ3EjQ6Pm+5VcRFdRmd3
 LHp88wLzYDzmIavIsglyguaxjWBA+yuIEyKpBqkufFczOM+cvS4kD3MgiSq/iB3RO0rfBLfq3RK
 r4Pxq0P6ysHaZvcxvP10FMUqul/xXOxRp/9TQtiXiImpQM27qdzroJCN8qGK95ktvDCgTpPDZ/j
 5npNhis3rmByB08eFURy7Lsmmc1B1qzear6/sZYnYcmhP2z28ZgTTl1JY1I7YqRrZoxLQd60b2u
 lP+Sr5vHZqmd2KzvR6Rc6srqxwzS0aHJRAMuBFOryv3cewkNltL1nxaYTmrtRAiue4R83/0XbNZ
 wWfUjt55WFYjqwA+RKOtX7S5g46xWfInsXVU6vUCTpH/e3QDC4u8Z56Bo0zaUPF80zRs0gib+1L
 Je1GDtxKVZH7o796xlQ==
X-Authority-Analysis: v=2.4 cv=Oc2oyBTY c=1 sm=1 tr=0 ts=6a9a7093 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=RfyTg-q-OfOJAL476ygA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: S2HHydBju7Ql4PCo721-NoPWYPTxl57M
X-Proofpoint-GUID: S2HHydBju7Ql4PCo721-NoPWYPTxl57M
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA2NiBTYWx0ZWRfX8j4ZVKPn3hJQ
 1JJ35uULU2EtSxT6Uc1P9oGi5mSxftlGKtvmxvyI1aKkQ+iii7zfEReDmqqjLMl6BM5Bvigl2dG
 9UHPmJgXn6rUQeHL49K6x3+0WAF8/IY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_001741_071347_A63A3286 
X-CRM114-Status: GOOD (  23.77  )
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

On Thu, Sep 3, 2026 at 6:04=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Mon, 03 Aug 2026, Shivendra Pratap wrote:
>
> > Userspace should be able to initiate device reboots using the various
> > PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
> > patch series introduces psci-reboot-mode driver that will induce
> > command-based resets to psci driver for executing the device reset.
>
> The more I read through this submission, the more convinced I get that
> it does not belong in MFD.  This is a potentially nice "architectural
> workaround" if it a) didn't break some of MFD's fundamental "real
> devices only" rules, of which cpuidle and reboot-mode certainly are not
> and b) didn't require a massive expansion of what the MFD core is
> designed to do.  I am more that a little uncomfortable with the 150
> lines being added to MFD core support this workaround.
>
> My best suggestion so far would be to base these changes inside
> drivers/firmware/psci and use the aux bus to communicate with the
> various components.

We had some off list discussions about this as well and it seems like
we are in agreement. What you are suggesting makes perfect sense to
me.

Kind regards
Uffe

