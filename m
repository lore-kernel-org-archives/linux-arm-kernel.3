Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD429C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 00:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wm38srSWvKn2bZKU8bOM9GSw2Dzk+DbCISm+8uNzNSs=; b=eR9PrEjQ5YvyrLh9VR/q5PBfR9
	3qEX8/1AMeuYGjgdqNZi8INoXcBMqA06amm7Tr9p+4f9bZhgqBYE37J1ayJiybSbFvXSusR9bhsAO
	k7S2/4rzaLqCjgArGP7SeX/fG1n1+yftpMrNNo1ioRJFy41SkKAit+/zSTCJOKKCnHEhKLu+bxome
	/D3SUVihkOSDRt9+fo64sZYCvYBT14CB7qM/v2/2Z8kRyPVjVfXhNRofgWCEfhcJq7rhXRxzyZedC
	/49X++EMUkL6l4h+i5Ios/xP3gFqFegD63oHRS/asojLj0oTji5KpI9HvrU6T/T+xNV/Edh15cVPb
	NdvrJCcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv1u4-00000003KKD-1esU;
	Sat, 15 Aug 2026 00:05:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv1u1-00000003KJm-3Rvi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 00:05:35 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ENCJlc3031545
	for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 00:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wm38srSWvKn2bZKU8bOM9GSw2Dzk+DbCISm+8uNzNSs=; b=nuFpVb8CQWDeyhlA
	pAP2xpJr1+3+OjI7sIeieVMfYiJS+3Ocqf+IGGwKmeDd3xXDfvLnG7ObH0+XRnjz
	AOq7WGSmj/ueMbJDFJJJqxPD/CQXZ4WfdcKt/xfgIYoicBF5PYKFUmKxAXcEhAOZ
	GLzY89HnwSdHNYZjHdxPX75iObP06fXDayZASjhikV8SkJ1eqqyI1rDw3rJtwQLT
	WwMPDMzZq2MRZaoaMlAC4BAKdBLaiYCSNLOcP7HLcPXFhKQPTMAfjFvZ57C2KsrV
	e1ik3K9NRhdF3DRa2r6dHepGkkMuu3yNpQ1+w3iVZgRk/20F5wizrog3aUDNVWZT
	Dc62xw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g29k48vj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 00:05:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so2693240a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 17:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786752330; x=1787357130; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wm38srSWvKn2bZKU8bOM9GSw2Dzk+DbCISm+8uNzNSs=;
        b=c5Ns7NLogTM6GdGN8XT6iS2RkPhOuay+LgtCV0Vg27Qumjau91rXkX867b3l6yKJz8
         HOM0Hic+Bdr9zQAhihz9VsYDhe7Fqmpdhovto62Hm5BsDW37UdvwgvuJrvXQqqo2BKQK
         L6OmLc9UcStTLOJ+laCUG9rXJGurAydkdqpWta9kBGy7a4q9f2wX7E10YK5ugzvdHtHT
         JYgg1+4tb2mWTn2oHWl1J+PJFEq65ODccb40LWq1b8QkHFMmWFhj0IaCOKQySmeyExlK
         hzFgCNTLsqNBIL2Np4owWNh17WXaap6LrVU6u/jDCm9nK4Mo+0ONRxHFIeSaUiF7RsUr
         L6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786752330; x=1787357130;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wm38srSWvKn2bZKU8bOM9GSw2Dzk+DbCISm+8uNzNSs=;
        b=GArFSBQao60VhEJaG3BgvvyKYLyWLVN6CGIMxt2cZ6zXU5PhMVZAZRS6WFedyJVVcW
         xtXBfqMEn9eAueEhDVVYtSL/kK6yd+MnMvJp6Ms0BspZ45IBHr4sKwfmmQ5KEZ04e/Xl
         TE1cymm305wQLzg+xq4w+MEP9AG3QG+YWJPPe13ZlDd3oril2l8tgfcaP5RzysO23pAT
         ckVzqApIlnSmqA1a5omFvvDSCykpN4IyXH9ADhh6IE7rmhT2cPJljXl+m6A8JUi3T5XO
         UN98ww6xncUssMK6udwf2Bna/unPiUTo1awpBwOqtOy5MbF3JP5ReLahjvxMW1UuQX1N
         l1ZQ==
X-Forwarded-Encrypted: i=1; AHgh+RrA1MD7H+BOgLw3gciLGb216wLeCDlEmqar755mnSJJF4cOvHzWL/ouwLXZGYFRp5J9/ytqrW6xMGxTFVvnuGmf@lists.infradead.org
X-Gm-Message-State: AOJu0YzTdRPwYk/UZRbEugFqHxiMPvr47hJTwcv41h5CPYc1GSwgqCeC
	fi3hW1miItv6C51i/m0U9U4pLoRHz9ui2CjqImciH0fsalm8pwx2xkNlQ/83blkso9yRyyiIjYC
	wy+8/T1vGxxMFNowGbWX3SoSfAGtXC4XNPNYbvIYrulsUr5XQpMrIrZcgDsDJavLe3IQ48m0CB+
	13nQ==
X-Gm-Gg: AR+sD11HJqYbbkeWSTdMKquyZ6Kcn1gcA5tnWJ2HFOya9m28I6q8eAmm6eDQ+BlrpIN
	Sc7d9MSeW0pbCxfWFn7Ej6ciLbaHI38gM+Ai0BiHmcvUkgX9L6f+OxTCBNJsbH11W4+q4VXtuX8
	darRMwdGhynZtL7trgl+ulg8C29dd8EZs/iyRlhbMSBR3CMoHC9mqaXXduThdzUUhd2NIkZY/q/
	Mdgl6TEBDrPd5PGGsqEvicLx6CTO2as8PmtXPtw3WMVaPx+MCZ7sr6tqX1yrS4+0seEmFBmMUQi
	z0ZmEqbCReWnplPtWLtr0v/Iv6bpFh3oyEr07OT0H1wunNw+2JcUrCxJLBEO1nCuvCIlJd+hi01
	6d2zQxeJmeMf80J8QMtcE03KGChZV9RYk
X-Received: by 2002:a17:90b:4f:b0:38e:ad9d:1161 with SMTP id 98e67ed59e1d1-3933b833613mr11780605a91.0.1786752329672;
        Fri, 14 Aug 2026 17:05:29 -0700 (PDT)
X-Received: by 2002:a17:90b:4f:b0:38e:ad9d:1161 with SMTP id 98e67ed59e1d1-3933b833613mr11780507a91.0.1786752329180;
        Fri, 14 Aug 2026 17:05:29 -0700 (PDT)
Received: from [192.168.4.152] ([172.59.161.148])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ed5b1sm21430800c88.8.2026.08.14.17.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 17:05:28 -0700 (PDT)
Message-ID: <56107a6d-962d-4508-a1d3-7a6e9e2af887@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 17:05:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] pinctrl: scmi: Replace get function and group info
 with generic callbacks
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260731-scmi-pinctrl-generics-v1-0-8affd2b79a6b@oss.qualcomm.com>
 <an7RL_mTsznZjeIQ@pluto>
Content-Language: en-US
From: Alex Tran <alex.tran@oss.qualcomm.com>
In-Reply-To: <an7RL_mTsznZjeIQ@pluto>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDE4NSBTYWx0ZWRfX5PM3g/kAmJ4j
 wNI06Xu1IKUwub2Jh/3BUHF7t3H/UjBLM0HkFgymemYg7M70/WzjAxSEm0dRKnDL2w2hIhO3yKe
 ZeGhOkJx+lADHQwvvSteZAyRwlbyevY=
X-Authority-Analysis: v=2.4 cv=R6Mz39RX c=1 sm=1 tr=0 ts=6a7fad4a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=QQ+fG4gAsU/2tVdSCsf/ug==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=2icmqZXXVlfet6DyCXwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: sNrvho9YLNyvBK1UYfp6F7VX-JetsVNA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDE4NSBTYWx0ZWRfX9Tf2ZnfZdiVn
 7gXLKInhxZSrJ4hdXP+o0R2d60diZiWfIJb6uuoP0ovsY6snccFRagk1k71CucpVeuYQr15qGzv
 i1hTgEL9BIonQlCxbCHnhd7BZTNEZ7nOJXhGQZ/t5GnwYkasZlVRFMtfWpdkpm9JhvVsAazPyvb
 NjDWm+97UDw7APWeGlc477pUfm1nFLkzqd1ebMdHJBEhO35uU3qzUzVfFvC6TDAkX2CObFdiztp
 WJfEnIV71KQY03uwLbT8mdoLxSQk2mhkU3e6VX/AB0mzsJ5hXA8OgjOEX0MLqtHI9sHftFTJFmq
 Pv/9CgzAIm38o9YT05FjIm0Gxnlg5GapKmNnrdJBYq3tdydWfrTC7V4jAMrRJnXW2EGvhCwysZy
 sgK3L6zLeBW6hCb9iM/38lBU0KtUKnufc9EygwEHnZ4oNiLUw428/Np5CQK3eENRHQX3yAWIFPA
 mcNNEG3+nfKCM5ZCbOw==
X-Proofpoint-ORIG-GUID: sNrvho9YLNyvBK1UYfp6F7VX-JetsVNA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_08,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_170533_989072_CA81DFED 
X-CRM114-Status: GOOD (  12.12  )
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

> Hi Alex,
>
> I gave it a go at this series on an emulated setup and with these
> changes I get:
>
> root@deb-guest:~# modprobe pinctrl-scmi
> [   15.329932] scmi-pinctrl scmi_dev.4: error -EINVAL: Failed to register functions
> [   15.330259] scmi-pinctrl scmi_dev.4: probe with driver scmi-pinctrl failed with error -22
>
> ...not debugged any further.
>
> Thanks,
> Cristian
Hi Cristian,

I've tested this series on sa8797p hardware and did not experience any issues

with registering functions during probe. Can you provide me with the pin

topology of your emulated setup? I have a hunch that the topology may

contain a function with 0 groups which is why -EINVAL is being returned.

The previous pinctrl_scmi_get_function_groups callback considered a function

with no groups invalid.

Best,
Alex


