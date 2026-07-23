Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D10C531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 17:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GJxCO74foxEAJs+D0TWefMRnGQQSy52PZ9443j42Fg4=; b=RIJMY7y3/WUtHW
	cieSo4xfFItS7Zdi1Fio38dCRGD9Jds8YxBAyyQma/gKmzok6cyvOWtvveD4x0LZKVDLuiSE4pdxX
	C+Qaxq5oajWNH0z+8UCVjF80avdU/rWAgplH1v+XzrourWqDuyspFDO5OGIyBUBB+Vzvd4N5BFfaB
	zHiXzuQoEcZ3tSEThVFQgap4e8GPgMbItMSU2ybRt16iEywg8apNDfZwBOEMGT+NKjoscl3xk/dZg
	DqU9cv4m6J0lN2XVnhYBw12dSHfSIEpL57YXPUKvNjSlFl8PpE5A1olGiF4FFUG5UfBfcygzjb/X5
	v/wjtUaEK6GxHciF6tvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwvW-0000000Elv3-0isL;
	Thu, 23 Jul 2026 17:09:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwvS-0000000EluL-3fVC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 17:09:40 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvjSE4173023
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GJxCO74foxEAJs+D0TWefM
	RnGQQSy52PZ9443j42Fg4=; b=YhPxcIgIdtNzWRN1Z1KPt1YWHEI23vXsYgY3yS
	Qd/c4E7KaMmG+aSRXklYLuchlgPK7P8WVl6XrDe7/kuN/9lPek0bjb+rzs4LCJLp
	uK4plpBD64QTpJNnX3AgDpNbTxBZOqQdCrPfZYN9M9j4QleeeWKNHPlLMWwH6IOs
	RJSmEb8yT0pGrOCfTRBv1ZeXYGagn7u/YCraqFz1MJAiT7kCv8NEn0AEDH2bF8BK
	CPs0Bq7L365Gd4jfVpVY7vXpE5XGQx02oEtRyie5hDiMKGULiGQs2LOFb2VCBNtQ
	NsfbfFx2cF1WlDRRWQporPn5Z6QKeLu10ZOFuT+bwE3/H/jw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke7qjnc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:09:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52769fc3f2eso17773731cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 10:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826576; x=1785431376; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GJxCO74foxEAJs+D0TWefMRnGQQSy52PZ9443j42Fg4=;
        b=BN839fwJvgfGCYBxXdYFGh+VtFYQtot60oVzTXM49qqjbNQnMxdFQsQD9Ecocd60tQ
         ieuNfkvEJv+6KoWtrY1pg1wRx7fQlfybNMlbdMia3bymfAI7h+eKmcBtCSHr/b4pJrJs
         dUaBW0JZHDZ+A/H93WvvA4NcQQsB1D1gDkIRo2LLr3OWc3oWfN/1b0ZKLHzyaHFAa0SP
         A86ayDSMNUGgS4YzN8PlSbBTIZappnSNSdoxMuGswBM4zH0TtkmyGXN255889kkHVkaU
         920xfjxZIblDgG0b3bQSTxjUqLgNeVTetjWDXDK5JWwqVtTTKcME6hjbBGdID5y/OT0S
         AJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826576; x=1785431376;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GJxCO74foxEAJs+D0TWefMRnGQQSy52PZ9443j42Fg4=;
        b=dXuO2A8HOsnWsHVaAhi2PyqPQ8YdRmPQMKZicODPy/8ig1T1vLLIqsppk2IsCV1w7I
         VMrICmrwnb1vTShr+EeXIWR+xni5setQlbHlsMZFQiJg6QIQKcxSowGd9Y4Sh2/t5HEm
         ilW56fuzzXwWHCAQbRhRBg5x686OkNWpGw9S3veD7QL9hpNnpfBxH2rLvN57lZT4RHaR
         4i3xl6XFggZXD7oyRbHfB6pmLggqzV8bqClp1aBB0NpOs9tpr0FLxubR1xKXj8pIQOWr
         CGPN3NfXaCdcDvPdg74zy7ZbkzSfp49i8RthBKdr2vWfWHjZCZ1zUt3MnV2rmCmrdeoF
         DtIw==
X-Forwarded-Encrypted: i=1; AHgh+RoWZFvkb9CUEVZWdxeN5KjQWu1Af//agFUkYFuK6AxTcfFvQDctarsU7MhwwP3U/UN30/RE3M/mFq12MzhyUFp8@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj3Gc8j70Sv2rY3dMz1RdHQcWGFNkt+k0n3pc+dStbbUi50W4S
	JSBmyJX7ut445BBotIZ8DwStyjKXCZrDX7AO4e4m4zfaEBGajZqEjnkl03f7JD2MsJcNt7qq1nD
	xzdtukw3/5+ySrBjQKOlTweffGMRObdqE3MhXJjNkicfKOwRPT6HHu1VJc001A95gPb79/gTP0V
	st4g==
X-Gm-Gg: AR+sD132Jr+JzChRv7orJHP6CBBEfT5tVAFTGdpdV6aBhb5dNouSUmFqdogywW11bsg
	gXjvKgjKNN4tSFIhhk5gWBDIxy6AABsK9WMGQRsL/d8LKKfK/wQttMwP5lV2Daac57aJa2swO5B
	AMjqqDcLgTuKXzyLCm8v0UgdQ1c73FItMwYybE+dxEOu9bkxN4w2AFym1XEyjOzPklgYPe09aXx
	AIdCEP8AZxuJ4RgOhrB9NkYMnHGJxRMSL+/ECehR5OsvksvEbvbjsoQiZ3zlNZDkFyDmKlhpbfj
	aFMvjMQTI8ac5kSHveGe9rAeB/Go/XwT0qygRLDpLuT5FUzYiLZkLARschCq4BBxaKJSQRhdbEg
	/wahrs0Zv6sWQ69cTKDMKev1IkE5p
X-Received: by 2002:a05:622a:4d0c:b0:51c:dc:18dd with SMTP id d75a77b69052e-5283df0f942mr42057381cf.46.1784826575732;
        Thu, 23 Jul 2026 10:09:35 -0700 (PDT)
X-Received: by 2002:a05:622a:4d0c:b0:51c:dc:18dd with SMTP id d75a77b69052e-5283df0f942mr42056651cf.46.1784826575101;
        Thu, 23 Jul 2026 10:09:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:09:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v24 00/14] crypto/dmaengine: qce: introduce BAM locking and
 use DMA for register I/O
Date: Thu, 23 Jul 2026 19:09:06 +0200
Message-Id: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALJKYmoC/3XTS27bMBAG4KsEWlcGZ/juKvcIsuBrEgGx1UiJ0
 cLw3Ts0aphAyYUIiJI+DTk/L9NetqXs08+ny7SV87Iv64lvUP14mtJ7OL2Veck8MaFADSDk/Jn
 WIw9lTsc857KnbU66+AhAxQg/8Ye/tkLL75v68sr378v+tW5/bj85uzp750yPO7tZzCXlnAJKv
 szzx3IK23pYt7epemffGOi6hmfDB00Wo/MW8T8DxANB8F0EBCtEtqhINoesntd9P3x+hw9++Xj
 g4Z8Fd8sIKbBvAVvsAOkclRM4srCxuICuhWxJ70haQlNIjCzZWrZvSbaEN65ERS6poaUaC2XfU
 nW/+GkgxZ2xw/3SD0uN9kvXDrqopQHuQLYjyzQWDtZoqqU0ZUiBYkwjyz4sPcqEZUvLoL1WoKL
 1I8s1Fg7WWJPuPR8rjyYGGtblW6t/aKAmXjhlkXKKpMLAQvGwDPbXiDX32pDh0DuVhB5ZTe4t9
 DOBNfcxoXayAJc3tLC1+n1EvJ1HkcFFtKjMyGpyb7mArlVzD7EIzIUoh14fr9frXy19iEQiBQA
 A
X-Change-ID: 20251103-qcom-qce-cmd-descr-c5e9b11fe609
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14829;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=nj5m9ijTg01Sv7G5xlvZpgjtZ3XQgHNQrjjJQhNgYzY=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGpiSrmjAPLE0lKw/U4Qk/m0KseoFHtkyHyNFhPDWZRLtrP1c
 okCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJqYkq5AAoJEAWdLsv/NoTDFiAP/if2
 wo8dFpr/Z+xElsDaWUwp9zsrFNLkw09jsnE7Sg19O78hprTmLNpqw/cHT6k7/lamzgR6gj9wFJl
 i0kr8HDStTHdpzg2O5fbJSj6tU7lz9/3seNjOK0ILR63B9VzL/cQ0tJx2o1hLOBXHmedncJEU98
 Lz8Ow2GpKD0IT0dSfYiRWPIboASlgI3tTW10Nlk7pCSs7jG6MEbiOPOKwdfBTs0QCuturkTiAQU
 coPszhXGmAhB70yY819cdqNqWZAJz/Wu7bZSxNQfPlzrVGFyaoNeu+wYu6H1BbaDp5RFthXcnfm
 RDhY7OOCPnneMk2lYs4U8fXqnXZg8R3p35CPEKsOuxP4FYtgeqn+FbhWyps4k08C74InIxfpfc4
 Rz+5U2DpGtmM/hl0wu0UiYQsn0cO2bw3gNCkCT7ag3CMKo4xhATfjlPtVyBSsu6wixKSoHp9yjy
 D7X2ujiIx5orgKLHfaq6r+ACxcpPrGdXql/ANJwCPOKdFCMjPAYytvyRKj3Qw9902BUKVigmhu/
 2piysPI9q1rurtdblW40mzb8vcu3j7+LeCHvkh969CyuG+rjskBL3nbI13OW0pc7vVCouoVY/r8
 WITxyg1BdxcCCXfl31d4+QDISB/QhIU1yVPbgPLfLyjmXwsxEnwOjbWsin1H0UgXzQKISeKZT8y
 x5J5Y
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfXw28L0ZlIQW14
 ApcmuW+KX48Fb5LiO2uuMldUoWsk0XE9b4VDO+z5bWSdvFGjs5Xx4d75OIG8UUJdKhHaKXkOqMQ
 OOzDdEJfaKJnMjLZA5LRBY9ew9Owrp0=
X-Authority-Analysis: v=2.4 cv=aYxRWxot c=1 sm=1 tr=0 ts=6a624ad0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=rl9B2ycCaUGxRu6LYUgA:9 a=AVDerk9WHGFWEF5L:21 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: DqXQHDNkPQVRhUb3vZeOiRtcDUteQbE7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfXwi9JSumZ5zd1
 yEuR4jqQiPKQuCm1Dhjvg6r1euT7wU7qPGqitFEGdwzaEZSmQhhgJhFa3XFyPHyWb0SrCnI39w4
 Y0j/T9fRD/FnHSfcCbGCVKxqMC+83SV5Ep+k+tkPG6MBkScTRozlKDuxkPytE9XySuGqAz/2jt5
 O4vn2Xp+EjkEDgtrYJpsUGy80WaT0WDvDlP/ZokQ6hHNi6kNTlcY719isbygpKx3esui+uYDP7j
 0sKVme0z5MaGQPK8ktFzEIMNTxO+lgfvpWWBxy3IiW7cOrw1O+keUGBno+jAPNWIpSJ7C1VbwvR
 znmRpyaRg6Lc09+VE8mM7RQ08F6DrRLymMh11ObmlqwEIhpVeJ8MfcW5sxAl+pg3Vx42PKPCZry
 01TXfusQEFoWKqJQK/X6aqxtmkDgt6SZjndInuBcn+M+yU5SGPbKtPc8cuy9K5x3TTh9Agtf1c6
 i5g5EAQRJC7ZaijogfA==
X-Proofpoint-ORIG-GUID: DqXQHDNkPQVRhUb3vZeOiRtcDUteQbE7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_100939_062693_5F6597CC 
X-CRM114-Status: GOOD (  28.86  )
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

Hi Stephan! I took your proposed approach and modified it somewhat,
thanks! Please take a look at this iteration and - as always - R-b and
T-b tags will be appreciated.

Merging strategy: there are build-time dependencies between the crypto
and DMA patches so the best approach is for Vinod to create an immutable
branch with the DMA part pulled in by the crypto tree.

Currently the QCE crypto driver accesses the crypto engine registers
directly via CPU. Trust Zone may perform crypto operations simultaneously
resulting in a race condition. To remedy that, let's introduce support
for BAM locking/unlocking to the driver. The BAM driver will now wrap
any existing issued descriptor chains with additional descriptors
performing the locking when the client starts the transaction
(dmaengine_issue_pending()). The client wanting to profit from locking
needs to switch to performing register I/O over DMA and communicate the
address to which to perform the dummy writes via a call to
dmaengine_desc_attach_metadata().

In the specific case of the BAM DMA this translates to sending command
descriptors performing dummy writes with the relevant flags set. The BAM
will then lock all other pipes not related to the current pipe group, and
keep handling the current pipe only until it sees the the unlock bit.

In order for the locking to work correctly, we also need to switch to
using DMA for all register I/O.

On top of this, the series contains some additional tweaks and
refactoring.

The goal of this is not to improve the performance but to prepare the
driver for supporting decryption into secure buffers in the future.

Tested with tcrypt.ko, kcapi and cryptsetup.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v24:
- Take the approach suggested by Stephan Gerhold where we don't
  pre-allocate lock/unlock descriptors but write them directly into the
  FIFO as needed
- Verify the peripheral config before setting the bchan->reconfigure
  flag
- Reset scratchpad address if no peripheral config was passed to
  dmaengine_slave_config()
- Verify the size of the peripheral address struct
- Remove unused local variable
- Link to v23: https://patch.msgid.link/20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com

Changes in v23:
- Use the same struct device that was used for mapping the scatter list
  to unmap it
- Change the type of lock_scratchpad_addr to u32 as it's a IP-local
  register offset, not a physical address
- Queue the work to retry the transfer if setting up pipe lock fails
- Fix missing argument in dev_err()
- Fix commit message wording for DMA direction
- Validate DMA direction in bam_slave_config() instead of storing it and
  rechecking later
- Link to v22: https://patch.msgid.link/20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com

Changes in v22:
- Switch back to passing the QCE scratchpad register address to the BAM
  DMA driver using the slave config structure but this time provide a
  dedicated peripheral config structure
- Rename the scratchpad_addr field to lock_scratchpad_addr
- Remove leftover local variables
- Use the BAM struct device for DMA mapping instead of the QCE device
- Use cpu_to_le32() where needed
- Don't silently queue data if setting up the locks failed, defer
  transfer and emit an error message
- Remove redundant is_lock_desc check in bam_start_dma()
- Link to v21: https://patch.msgid.link/20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com

Changes in v21:
- Fix a potential race with new descriptors submitted while hardware is
  processing a locked sequence by clearing the bam_locked state right
  after queueing the UNLOCK descriptor
- Link to v20: https://patch.msgid.link/20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com

Changes in v20:
- Don't use DMA cookies for LOCK/UNLOCK descriptors as this leads to
  dmaengine state corruption
- Handle re-scheduling of a DMA transaction on full FIFO
- Fix DMA descriptor leak in qce_submit_cmd_desc()
- Link to v19: https://patch.msgid.link/20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com

Changes in v19:
- Fix more potential issues in remove path (sashiko)
- Remove unneeded return value check for vchan_tx_prep() as it can never
  fail
- Link to v18: https://patch.msgid.link/20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com

Changes in v18:
- Free the BAM interrupt before disabling the clock in remove() path too
- convert the size assigned to command descriptors to little endian
- don't pass DMA mapping attributes to dma_map_sg() in bam_dma when
  setting up command descriptors
- Cancel the QCE workqueue *after* any outstanding DMA transfer
  completes
- When mapping the scatterlist for command descriptors: use the actual
  number of mapped segments for dmaengine_prep_slave_sg()
- Drop the leftover read_buf field from struct qce_device
- Unmap command descriptors only after terminating the RX transfer
- Pass the actual size of the metadata struct to
  dmaengine_desc_attach_metadata(), this is not really required for our
  use-case but let's do this for correctness and make sashiko happy
- Drop double assignment of bam_ce_idx in qce_clear_bam_transaction()
- Remove unused QCE_MAX_REG_READ
- Link to v17: https://patch.msgid.link/20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com

Changes in v17:
- New patch: free the interrupt before disabling the clock in error path
  in probe()
- New patch: cancel the QCE work on device detach
- Hold the channel lock when attaching the metadata
- Reorder the operations in devm_qce_dma_request() to avoid freeing
  memory that may still be used by the DMA channel
- Register algorithms as the last step in QCE's probe() to avoid making
  the resources available to the system before the DMA is fully set up
- Fix error paths in algo request handlers
- Don't pass dmaengine attributes to map_sg_attrs() as it expects
  dma-mapping attribute flags
- Fix a dma mapping leak for command descriptors
- Rebase on top of v7.1-rc4
- Link to v16: https://patch.msgid.link/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com

Changes in v16:
- Fix a reported race between dma_map_sg() called with spinlock taken
  and the corresponding dma_unmap_sg() called without it by moving the
  descriptor locking data into the descriptor struct
- Also queue the TX data descriptors before the command descriptors to
  match what downstream is doing
- Tweak commit messages
- Rebase on top of v7.1-rc1
- Link to v15: https://patch.msgid.link/20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com

Changes in v15:
- Extend the descriptor metadata struct to also carry the channel's
  transfer direction and stop using dmaengine_slave_config() for that
- Link to v14: https://patch.msgid.link/20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com

Changes in v14:
- Don't return an error to a client which wants to use locking on BAM
  that doesn't support it
- Add a comment describing the DMA descriptor metadata structure
- Fix memory leaks
- Remove leftovers from previous iterations
- Propagate errors from dma_cookie_assign() when setting up lock
  descriptors
- Link to v13: https://patch.msgid.link/20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com

Changes in v13:
- As part of the DMA changes in the QCE driver: reverse the order of
  queueing the descriptors in the QCE driver: queue command descriptors
  with all the register writes first, followed by all the data descriptors,
  this is in line with the recommandations from the BAM HPG
- Set the NWD (notify-when-done) bit (DMA_PREP_FENCE in dmaengine
  parlance) on the data descriptors to ensure that the UNLOCK descriptor
  will not be processed until after they have been processed by the
  engine. While technically the NWD bit is only needed on the final data
  descriptor, it's hard to tell which one *will* be the last from the
  driver's point-of-view and both the downstream driver as well as
  the Qualcomm TZ against which we want to synchronize sets NWD on every
  data descriptor,
- Revert to creating the LOCK/UNLOCK command descriptor pair in one
  place now that the NWD bit is in place,
- Link to v12: https://patch.msgid.link/20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com

Changes in v12:
- Wait until the transaction is done before queueing the UNLOCK command
  descriptor
- Use descriptor metadata for communicating the scratchpad address to
  the BAM driver
- To that end: reverse the order of the series (first BAM, then QCE) to
  maintain bisectability
- Unmap buffers used for dummy writes after the transaction
- Link to v11: https://patch.msgid.link/20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com

Changes in v11:
- Use new approach, not requiring the client to be involved in locking.
- Add a patch constifying dma_descriptor_metadata_ops
- Rebase on top of v7.0-rc1
- Link to v10: https://lore.kernel.org/r/20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com

Changes in v10:
- Move DESC_FLAG_(UN)LOCK BIT definitions from patch 2 to 3
- Add a patch constifying the dma engine metadata as the first in the
  series
- Use the VERSION register for dummy lock/unlock writes
- Link to v9: https://lore.kernel.org/r/20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org

Changes in v9:
- Drop the global, generic LOCK/UNLOCK flags and instead use DMA
  descriptor metadata ops to pass BAM-specific information from the QCE
  to the DMA engine
- Link to v8: https://lore.kernel.org/r/20251106-qcom-qce-cmd-descr-v8-0-ecddca23ca26@linaro.org

Changes in v8:
- Rework the command descriptor logic and drop a lot of unneeded code
- Use the physical address for BAM command descriptor access, not the
  mapped DMA address
- Fix the problems with iommu faults on newer platforms
- Generalize the LOCK/UNLOCK flags in dmaengine and reword the docs and
  commit messages
- Make the BAM locking logic stricter in the DMA engine driver
- Add some additional minor QCE driver refactoring changes to the series
- Lots of small reworks and tweaks to rebase on current mainline and fix
  previous issues
- Link to v7: https://lore.kernel.org/all/20250311-qce-cmd-descr-v7-0-db613f5d9c9f@linaro.org/

Changes in v7:
- remove unused code: writing to multiple registers was not used in v6,
  neither were the functions for reading registers over BAM DMA-
- remove
- don't read the SW_VERSION register needlessly in the BAM driver,
  instead: encode the information on whether the IP supports BAM locking
  in device match data
- shrink code where possible with logic modifications (for instance:
  change the implementation of qce_write() instead of replacing it
  everywhere with a new symbol)
- remove duplicated error messages
- rework commit messages
- a lot of shuffling code around for easier review and a more
  streamlined series
- Link to v6: https://lore.kernel.org/all/20250115103004.3350561-1-quic_mdalam@quicinc.com/

Changes in v6:
- change "BAM" to "DMA"
- Ensured this series is compilable with the current Linux-next tip of
  the tree (TOT).

Changes in v5:
- Added DMA_PREP_LOCK and DMA_PREP_UNLOCK flag support in separate patch
- Removed DMA_PREP_LOCK & DMA_PREP_UNLOCK flag
- Added FIELD_GET and GENMASK macro to extract major and minor version

Changes in v4:
- Added feature description and test hardware
  with test command
- Fixed patch version numbering
- Dropped dt-binding patch
- Dropped device tree changes
- Added BAM_SW_VERSION register read
- Handled the error path for the api dma_map_resource()
  in probe
- updated the commit messages for batter redability
- Squash the change where qce_bam_acquire_lock() and
  qce_bam_release_lock() api got introduce to the change where
  the lock/unlock flag get introced
- changed cover letter subject heading to
  "dmaengine: qcom: bam_dma: add cmd descriptor support"
- Added the very initial post for BAM lock/unlock patch link
  as v1 to track this feature

Changes in v3:
- https://lore.kernel.org/lkml/183d4f5e-e00a-8ef6-a589-f5704bc83d4a@quicinc.com/
- Addressed all the comments from v2
- Added the dt-binding
- Fix alignment issue
- Removed type casting from qce_write_reg_dma()
  and qce_read_reg_dma()
- Removed qce_bam_txn = dma->qce_bam_txn; line from
  qce_alloc_bam_txn() api and directly returning
  dma->qce_bam_txn

Changes in v2:
- https://lore.kernel.org/lkml/20231214114239.2635325-1-quic_mdalam@quicinc.com/
- Initial set of patches for cmd descriptor support
- Add client driver to use BAM lock/unlock feature
- Added register read/write via BAM in QCE Crypto driver
  to use BAM lock/unlock feature

---
Bartosz Golaszewski (14):
      dmaengine: constify struct dma_descriptor_metadata_ops
      dmaengine: qcom: bam_dma: free interrupt before the clock in error path
      dmaengine: qcom: bam_dma: convert tasklet to a BH workqueue
      dmaengine: qcom: bam_dma: Extend the driver's device match data
      dmaengine: qcom: bam_dma: Add pipe_lock_supported flag support
      dmaengine: qcom: bam_dma: add support for BAM locking
      crypto: qce - Cancel work on device detach
      crypto: qce - Include algapi.h in the core.h header
      crypto: qce - Remove unused ignore_buf
      crypto: qce - Simplify arguments of devm_qce_dma_request()
      crypto: qce - Use existing devres APIs in devm_qce_dma_request()
      crypto: qce - Map crypto memory for DMA
      crypto: qce - Add BAM DMA support for crypto register I/O
      crypto: qce - Communicate the base physical address to the dmaengine

 drivers/crypto/qce/aead.c        |  10 +-
 drivers/crypto/qce/common.c      |  20 ++--
 drivers/crypto/qce/core.c        |  41 ++++++-
 drivers/crypto/qce/core.h        |   7 ++
 drivers/crypto/qce/dma.c         | 176 ++++++++++++++++++++++++------
 drivers/crypto/qce/dma.h         |  11 +-
 drivers/crypto/qce/sha.c         |  10 +-
 drivers/crypto/qce/skcipher.c    |  10 +-
 drivers/dma/qcom/bam_dma.c       | 227 +++++++++++++++++++++++++++++++--------
 drivers/dma/ti/k3-udma.c         |   2 +-
 drivers/dma/xilinx/xilinx_dma.c  |   2 +-
 include/linux/dma/qcom_bam_dma.h |  13 +++
 include/linux/dmaengine.h        |   2 +-
 13 files changed, 420 insertions(+), 111 deletions(-)
---
base-commit: bf706f42e3a457792f476fac78521b33a66aee74
change-id: 20251103-qcom-qce-cmd-descr-c5e9b11fe609

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


