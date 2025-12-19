Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA428D74970
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xD2qZ5eGHejDzcQiX7ZQ9804UwbeJt/zT2Xf9ky8FoM=; b=JT7HvFS/rsAYzs
	pWhxgGObJ5z1zJ4x2wETLCwoYZ+pGj/RuGx2jX4H9K03Y5S7KKFEIP4QNMKiuYw5OprHQLmjZVRAM
	h7kAhihKLNvH7TrWweXUaHWyVgxshwFCDrGANjgq26CmSLDPfGoVnc6xXaSl1oGQTmk/u/f1ZkXv8
	oJv8L17oPKbY7Fq3thgSRfgkEImq0KquMSSrySjaak9QfsVpao8QRkTlBTrcFRBlDOIEEtA/T+QB2
	vNSxp4wFd7WJAAyqe8KV0wbrAsPdXZy8MFnrPagFqk2fEEGYToxVr80ZIPIZjEeTOD3Bjn8mSjysz
	ZioihkKS85gr2RMdTqkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPS-0000000A1Gv-2kWw;
	Fri, 19 Dec 2025 10:08:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPQ-0000000A1GY-2NB8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:08:29 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c68D3999336
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xD2qZ5eGHejDzcQiX7ZQ98
	04UwbeJt/zT2Xf9ky8FoM=; b=SiRtDDHf2IjCn8rOrV/YgvUQb2v7layTSlXMRw
	65KFc7qWt4Pe5R6se4uz+GaOQPinShqqJBonacT+I7uDvlS0cZzuZEZ5+z4n4aTo
	nNojBR7XAI1ivljSzKprRa8n2MWB5nTtR5vT3n9/vrFYEguzrCA5161g0YGKKFsm
	NZvG3O1kCHVw0883//Dm4HdrgySdstVCvADYjNIj8nFgygDOWnESXdXTLpTBOgXm
	vDxEpCQ+WZL8AZDavgKJKEAsao2ITdwzptrLrbuwSCWAnEq8WYTvnqEsLodYJ3QQ
	oto9/ORgITxkd/rWPuhFqBwlcSXQTCjOPsCzsmXlxDauwB9g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r29j9j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1b39d7ed2so33736861cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138906; x=1766743706; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xD2qZ5eGHejDzcQiX7ZQ9804UwbeJt/zT2Xf9ky8FoM=;
        b=AMLPfDxqH5gYjr7YTfBPGGCrz2IvbT4xAXpEwza3hVg+XyX2BsxBJ63ddqEUtoRvL0
         KSw8ufcRs3SE1g32Befr/LOyucH0oUsu2BwBv0CyC5gMYL/+mpHTo+v3mqy1ct2pTSWn
         y1POYi64oOW8k5SkMPPGPUaebbFzliI9aBhpkkBvyv4TD6/ijldLCQu1K8sNdzUrP3bI
         cIhsg1LifKERdW85uK0eDoWT7IkC9tgNRUHoFaJRGPmH6WLHFuixCP4wM8ODZouBa0lB
         W0fZ5FBrLu6pHA8m0Mi02DqDa1XrBFsKHGArtkKR1WY6xr8pCfVLpZ+ICNcJ3Arhkm2Z
         Dhsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138906; x=1766743706;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xD2qZ5eGHejDzcQiX7ZQ9804UwbeJt/zT2Xf9ky8FoM=;
        b=OnA7mIGtzt07Ky8qknmSW3wEffTe02oymlyg1tyCnDElQluakn8bHOLAtCYeis6mHJ
         rLMdox+avf9bT9Pc16QaGIvbqWxnf1r5l0POdo3dLfPF0wCtg1iFign+Htw2n9efGiyo
         BDrUyWrJonUlvQeX2Se0oBtjtqLd1sKAXjIq+0e4eHJBlvMobcq3PCWJy0UmzQSpD+2Z
         NCR4etPAU+fxtS7RIaF2mechgSqJG71xkSw4v5jeHFtWUjHwJnZFvIfVAOuczPsiFXJJ
         A1A2ifbE6vpD+lSHNTLAWO1tF29kqhSwMB3lW2K3FGpaz+qb26dHmqF+t83xIrAG1gJS
         6V0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXEQaech0jhEeeuUNE7xFcAkbMvlpMNpJNtxp5L1v0WpYtJS0GmgFENoeRmWDz/OJYH2Te8CLgZVngcxGmiJUq/@lists.infradead.org
X-Gm-Message-State: AOJu0YwcQHG6bpw9o20VSvEAFjF9+wp6nyPSHIFoVNwPvD+DEWa6SddT
	+orJlWgq0DwZevXTvX0Ep5P61w3kKtdbtmxtGH93Szvyo8/Fkv8TaHgbGuOcPg1gNeut1H43ztA
	W45gHCR5t4i8CcjS2iXgpdxzS5LX6M71Mnw+4BwXKDO8YjoFHiYp1Gu0fOKhfmaH66Mxbu1cxhX
	DSWA==
X-Gm-Gg: AY/fxX5cQXwnXvEn3K7QjyVJ+u86UBXg1KF81eEgxWzvIk94tsHzOD3Lb7dXmtcKPdZ
	CHy9Wf3ZgjmesBZMbTajnShVs0TBdaFiRDZHV1BlKIIZaTj5y/hi+mpsSTdIrSp7x39pIqRJIkr
	pKZS3htCpVOtOxMjmO1/w14lZznR98E4Bi4Vfs4rAPzhCScL9Y191KfOVaIGdfXOIMCDim8Xmcs
	BOss1Dj3X0+nB42Zu+OCm6JD2HHb1Sa89K/IYOLRthFEMt8MPCYCg4l1LLWDgQWcUpIkE2qkAOR
	1jJ4t1MJn1ZewXxWaWYaD0YgIsj/t4BWDhppkH2qicL3gPkJFJNqoXM66370xWX4dSJl+84ZNUO
	1fB6Qv2QmmdN25Uq5QzFKInJsxsKnuFvzSKX2FQ==
X-Received: by 2002:a05:622a:8c4:b0:4ee:483:3123 with SMTP id d75a77b69052e-4f4abdc55e8mr30832211cf.67.1766138905947;
        Fri, 19 Dec 2025 02:08:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1lSARFgw2k7/5yVB5YJJtsVUFd7EpYxRoWeNvNaY/TnhcoAmvVi0n/bZVZf2aF1n+1jZlFw==
X-Received: by 2002:a05:622a:8c4:b0:4ee:483:3123 with SMTP id d75a77b69052e-4f4abdc55e8mr30831891cf.67.1766138905490;
        Fri, 19 Dec 2025 02:08:25 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a48:678b:dad2:b2eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm4209571f8f.27.2025.12.19.02.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:08:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v10 00/12] crypto/dmaengine: qce: introduce BAM locking and
 use DMA for register I/O
Date: Fri, 19 Dec 2025 11:07:39 +0100
Message-Id: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOsjRWkC/23NwQrCMAwG4FcZPVtpM7a1nnwP8dC12VZwq7ZSl
 LF3NxsICjsk8P+QLzNLGD0mdipmFjH75MNEQYpDwexgph65d1QwEFBJKUr+sGGkhdyOjjtMNnJ
 boW6l7LAWmtHhPWLnX5t6uVIefHqG+N6eZLW2X67e47LigqN1zhooaerzzU8mhmOIPVu9rH8MU
 LuGJkObqmugVboB+DOWZfkAEM/sxPoAAAA=
X-Change-ID: 20251103-qcom-qce-cmd-descr-c5e9b11fe609
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7119;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Moojw8zULGqZxqvHldQJMOLyqF7pHfwabUZ38Z5bdHc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRSQHGMaBv8/nJ9OZfGxnrUDaflhzLle7FqLiv
 ZGXbsfvWGyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUUkBwAKCRAFnS7L/zaE
 w/NaD/9Zw7r7N9iwpMsE6uL5N0ucLXUSBHYWocXx91v+nn9TuIgunEieWERdx+mLOj7HwaGxMEz
 I7bR/hZclDlJz6RfdOZl2/TzXPr9BqEpBw0jYve3iUz/yzB76MehsLc4rVH2XdmTWNGeKb4nOAy
 mdkf38l20k3hvD5+J0PC2erUaRF157ZKhAFGpQXwiLxmga6S5mdlmm7HmlY/o/dyfYjM5Wqx2Yj
 GasUMkicRbMSEthSw1Fo2BeoMUPbTPxoEH0NEeIj+tQCanCoOaD0bbZx98HA4s6beZcAJZ05+ZF
 pTuOt6VnEMqGcaYPY/vWedOHVud6wu+THbeh/L5d2q9ajey85oLUPBgvndcmmtptqK00IgYY8Kl
 5qAewYZ6+McWkP3BgSB/5s0qPHTLyTc3MWuTjFwtLLNLcsirXs+PZgySE0Y8DjQf8z7aFbTg9e4
 OogTpIOjqoryt3uqjZDgT+1IbVHkxgzSA70AgIrL4Kdh6M3wTjoZo4eOOsoLI+KnuMf8KSiAwXL
 nRMft9ofaS+9YYUfIRvATiXXS+h1cOXJvoxHLt39FEOsYeqju6aWQYgJWj/CnH1T7EOTc6Pxrin
 OwsDjulRZKNBfnj3+aLCJ6b2PQs5MgEheu2D2YJk9ctAYmn7e0+ANuOsrm6nifEs7XRQsOHobuv
 NJYs1OfpJ3ov8SA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=P6c3RyAu c=1 sm=1 tr=0 ts=6945241b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=38Kejeklm29e0db6wA4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: E9vODN3J1X6wEOR4PMCsYJ5_hEgGDFQN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MyBTYWx0ZWRfX4e6O0V5Vl7iP
 HRcDDzcGasrPfhJTjQBgq5IoE9KqeiZS+8UfF/TeWjVnWOUQ7H8dHTcGg8aVdMKd5t6bkgIHlh3
 I0yUX+e8VPR9YrSjkoAhnLXXfOJ6ieviR+oeEU2OzsgMM9ShAMRcS92oCOvz51alNmLPI4HKuUh
 IxRGxzce2HqDwTTuHtA50QPmxpbQNJqRIk7TtC5Gd57dpdFEVSIavTeySbsE3RMGA93QdaX96XQ
 gClj1yLPXRYKPoXQWjyOboxg6YiOLlTW9Ae0+EFjgrSf8iiauifGOUF1VIap5IuL4260TZ7n4f4
 sdIbnSJnSYT2Q8wR66/fIlaqwF0HIKUfwg2/WDE8fjao1bVjWrMeafzpIMmRd/GM6GprqsyQ1vH
 m5aNGnWI7nQyndmkOLzk5wiQ4hRJRFMjr7Kg0nUq8rxAkf2oXfPDsZYWOrNr/owVy+o5ocaoCzh
 2xmxbpm1+P4cRe8XTaw==
X-Proofpoint-GUID: E9vODN3J1X6wEOR4PMCsYJ5_hEgGDFQN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_020828_619960_6552A1E0 
X-CRM114-Status: GOOD (  35.78  )
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

Vinod: I'm sending a v10 with some additional changes and a new patch
constifying the DMA descr metatada ops struct. This series has been on
the list for quite some time and has been positively reviewed by
a couple people. Unless you have a concrete suggestion on how to do it
better, I'd like to ask you to consider picking up patches 1-4 into an
immutable branch provided to the crypto maintainers. I would appreciate
if this series could make v6.20.

Currently the QCE crypto driver accesses the crypto engine registers
directly via CPU. Trust Zone may perform crypto operations simultaneously
resulting in a race condition. To remedy that, let's introduce support
for BAM locking/unlocking using DMA descriptor metadata as medium for
passing the relevant information from the QCE engine driver to the BAM
driver.

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

Shout out to Daniel and Udit from Qualcomm for helping me out with some
DMA issues we encountered.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
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
Bartosz Golaszewski (12):
      dmaengine: constify struct dma_descriptor_metadata_ops
      dmaengine: qcom: bam_dma: Extend the driver's device match data
      dmaengine: qcom: bam_dma: Add bam_pipe_lock flag support
      dmaengine: qcom: bam_dma: implement support for BAM locking
      crypto: qce - Include algapi.h in the core.h header
      crypto: qce - Remove unused ignore_buf
      crypto: qce - Simplify arguments of devm_qce_dma_request()
      crypto: qce - Use existing devres APIs in devm_qce_dma_request()
      crypto: qce - Map crypto memory for DMA
      crypto: qce - Add BAM DMA support for crypto register I/O
      crypto: qce - Add support for BAM locking
      crypto: qce - Switch to using BAM DMA for crypto I/O

 drivers/crypto/qce/aead.c        |  10 +++
 drivers/crypto/qce/common.c      |  39 ++++++---
 drivers/crypto/qce/core.c        |  28 ++++++-
 drivers/crypto/qce/core.h        |  11 +++
 drivers/crypto/qce/dma.c         | 174 +++++++++++++++++++++++++++++++++------
 drivers/crypto/qce/dma.h         |  15 +++-
 drivers/crypto/qce/sha.c         |   8 ++
 drivers/crypto/qce/skcipher.c    |   7 ++
 drivers/dma/qcom/bam_dma.c       |  92 +++++++++++++++++++--
 drivers/dma/ti/k3-udma.c         |   2 +-
 drivers/dma/xilinx/xilinx_dma.c  |   2 +-
 include/linux/dma/qcom_bam_dma.h |  12 +++
 include/linux/dmaengine.h        |   2 +-
 13 files changed, 347 insertions(+), 55 deletions(-)
---
base-commit: c138e425266a3f8fc801c82793a7084dfbc069b6
change-id: 20251103-qcom-qce-cmd-descr-c5e9b11fe609

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


