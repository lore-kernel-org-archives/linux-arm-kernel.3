Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99606EB1070
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 15:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MyOnaJJ8QbAg8YMfYIrbc4PAHqMJrfe8o2CXqXyXxU8=; b=h9NA1cYzTwrv7K
	KqFrmJuCbB0TIp0h4fW7/6/68GIjOVGUOPfI3Ksfag3VO7LXaxM5Lzgd51ETXX372bCWBv6yx/luA
	LO5+f/62yLfXpaeBdDe6fuPPYzGdAgJNxMQ/A4RDWSGGEJBOsan6SeiMjtEhiz1Wty1GFWMrPrU5U
	mVAsKuv6IEHHIh25UQcQ4t5PwNYheZERg4LT0h4Qh8b2fg2QNLZiMEDiHXCn0bGDaEqngsjswFyeh
	GcF4JotIMbqh/YFMiLX2qEtF/mRhjq5Pehcv4wqfjtzEOxvWPn2qP1ByCGuGu1gEAe5v2kaKb60e6
	yVwZMjtQz8gVjQSjjuzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzGN-00000009pt0-1jcp;
	Tue, 10 Mar 2026 15:44:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzGK-00000009psJ-1s2C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 15:44:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaoZT790189
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MyOnaJJ8QbAg8YMfYIrbc4
	PAHqMJrfe8o2CXqXyXxU8=; b=IhDaT/SkON9pVvS+tlbktPav9Drz5I1ms3RCji
	gCoyPhUeU4D9IqBFJJDNjqUWZ6HnYD/4z0/8F8SmCjWbhZvfre2LZJQtKNCODGlz
	/OFDtEoft5WjDuwlNZ5KtpJLy180f11fnFbom/KyRdhidqZxOChI1MS4OtTaPbSx
	jc90CW4MUjv3fe4OYfdtB4y9b5+F208gCesnrERIMfgB/gtBvBQl1uleqpwpwene
	L9J7Ch+ZajQHJ3F6EmEbLo2H1I/2qBwlbON1cg+SOgwSrcOlYdaaZwm/2tPpdglN
	5QIZlE+tHKdZ62fMMyh1I8y92gDFCrnGj6aX5bMT43DyUHkw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ekvkmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:44:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7ea0bb20so1510768385a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 08:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773157486; x=1773762286; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MyOnaJJ8QbAg8YMfYIrbc4PAHqMJrfe8o2CXqXyXxU8=;
        b=ExvD+r1nAkdzgZ3FUHIn/5u4zcuLhtIuk0zyjlhBHLz0E7B/WxVgJ1Cfc+xInP3eHO
         IDCnZNl4dqOdZGGKF6GgqSY5U7TQtRp7owITeSljDjgC82SPTFpS1d4E8D89eKXcsVFp
         rhM3+Zn+71nPd7LxS3pe5fHplAFLZPyrO2bPGmpL1evEZFgTMR45gmRbpCuP88r0jFRc
         Tf4KN25a19jLyA63aHsb0rGtRnMCd5lxLma6uN0FlNrI+Iouy9o6jwCxZq71lr9wrpNj
         Pf4GDKH3P+ouJpETkVbFxh2kgA/lvdxacB6XOJ9ccT2ybOT77N5LOd6lGuhbs6txiWkl
         KaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773157486; x=1773762286;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyOnaJJ8QbAg8YMfYIrbc4PAHqMJrfe8o2CXqXyXxU8=;
        b=Sm6jhXF6tIIKcdArXiQWmXQlMYP1OX6OEO+QrkjDICwkJpREOqgn7efS2fSjjZCXDV
         6Mbe6+DYNNN9c6nfuwuSVnGWNj2nllewqDwR3Q4jsw5nZhqPbTY2GuCkEoLaYS1Tbq3F
         PoaMo2ILoTpryhkW+lO+K8x3aqky9oWJiL2jfiOg4zakWb8tyZlJCdZ7v8KjYUdDsZwi
         PhtM3O1MRW6mG2LHTlGfYY5JN2pt5/P1F5HIsAyiOfITuxa/uRDb7t8S9ePfzPkzvnQ8
         tGdwSzGjn/oSnmTDj+LcXns+CqeiKz7GepBevFg41ZCdfQ/GjWEhQb14g5J/XcOZdSq/
         Zgaw==
X-Forwarded-Encrypted: i=1; AJvYcCXiYTEk4wY+hklv6bdklcOKC/X8GcGUSG1AlspWv+iPW2+ssQ+DquGIiHJAj8H94h1y3WZ7ZcHylubALH7542yh@lists.infradead.org
X-Gm-Message-State: AOJu0YyJxUPGvv/uVKIG9DguP+xrRpvsT9t7UpSfdX786oEA7UpxQOhe
	pDDq/RZmjEnCRBfk2/mZN7t5S1LPLQVcAcv9pQbwAJaTjIVoyIjXuO+b7KMgErE/iDn1xCoARgc
	1VJ2oMgZHNOIos2jR04PVlIvZBM29Q0wl2/wuGZV0NK5HFbfDvXZzzWjHLpIeMKw40b5bVYqEb1
	LJLQ==
X-Gm-Gg: ATEYQzz9RA9HZk9pBk9nxOdGVVdvtbLaYxUbeE63AX2nVQqD9CBN4F479SvowTS3/HP
	JZ9eV3O7FZH3kj1+9/PruLl+0EubXeGYfs/JLidyabs8sqYNCJqoSxCNZmhkC0AlCMGmS3dnD5A
	G3fClMm8SQihQBFaTgrv6CCnhgv1knDdhsPeMIEIUQ8SnxEFI7cAKa5mXj3gANms2Ojx6R65qjI
	khYIfSZq0907dkQqzBawVWjCCSi3IOxuID/eQsc1+BPJb01AYWthqNB68fvhDgq3qYZEUK/veLj
	dH9ySy9tnmc7ZeR43Pb8Q6eWeZ9RDJZ1O83NcH2AMD0CuKiAwM8REWTuyWiTe7LRpLLAsA3WXaM
	/g/cOK165u0yt4Qvxn4glDbJEX/oIREf6aXE2LgW6O2Kq3HC8TadM
X-Received: by 2002:a05:620a:2847:b0:8ca:2086:a148 with SMTP id af79cd13be357-8cd6d453d81mr2011383785a.28.1773157485438;
        Tue, 10 Mar 2026 08:44:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2847:b0:8ca:2086:a148 with SMTP id af79cd13be357-8cd6d453d81mr2011378085a.28.1773157484859;
        Tue, 10 Mar 2026 08:44:44 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:47e6:5a62:7ef7:9a28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm35991600f8f.6.2026.03.10.08.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:44:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v12 00/12] crypto/dmaengine: qce: introduce BAM locking and
 use DMA for register I/O
Date: Tue, 10 Mar 2026 16:44:14 +0100
Message-Id: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE48sGkC/23NzWrDMAwH8FcpPs/BUr7snfoeowfHlltDE6/2G
 jZK3n1qWdlgPugPEtJPN1EoRyridXcTmdZYYlq4AXzZCXeyy5Fk9DwQqLAHUK28uDRzkHSzl56
 Ky9L1ZCaAQIMygg/fM4X4+VDfDtyfYvlI+evxZNX36ZMbatyqpZLkvHcWW65hf46LzalJ+Sju3
 mr+GKirhmHD2D6MOGkzIv4zQP0iCKaKgGIlhJG6KYze+m6fSmkuV3vm5bnh+LHgaQ2qVVi3gC1
 2IPR+6rTCirVt2zf6jJDPkgEAAA==
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
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8518;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=d1hyAHUUcqyB7IkT5KjmHj9Rq9weHpZ5lWj/4KGSRXc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsDxaxGupGDaKmiMX2u3AVu10n6cJO/iBppcYs
 Z95NL4YpL+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabA8WgAKCRAFnS7L/zaE
 w6/SD/9lv7a91ID7P61UE7WM3sAD0AyeyEPCIQmSalhgA/UPeD24631xEVSwYB1FKs7GqWTaOlx
 BXsFI4BcId6dn7TuAU0BErckXaKKoIcPqTlVTuxdVQ5eJSncsB/d4kpW1qWZKd9jp/Y3Y9URgh7
 4h49upd9uqlYzHcriTX75PtV2kJxOIiq93skqYk9P3e3PLm0ge53yxQfReHclSI2OrbJBuaH7tI
 GuhFu3VAh4WyzRQQtgZyrNNb5Ah81/nJCvVBXE4wiuC2BwUK3rBypT4TiopXFRctIKk+jeswRij
 EGTWSxPwA2zx1C/3A4T+AZri+xQBMVpBjIMmImj2Xu6nXPoVVXkRyOAIzi0E3fEBwmyyklcPSgj
 RnfBnAoYvjgtT0NSuE0xMRW8/HF0nqNP+mdBqNCVZccgxvVnXlJIPmGIZk+TWcO6r4Uj/5xpogu
 z8fH7IQT568t6+9H/JzrI4jjBiOp1pSewAyfLI6FOAdIG34FKqwGHK/y3BehjS0r3svhgT0jT4C
 Jz5CMt7nXYMTT36jGu3Q1VwgdggyAL/BLV120c0ZPHywSUCho4IVk47CXyh3weMiSG2QLw37JYD
 Wz5d3mIs6CY7VvunVC8uTSiNM7fPQfpoPc4JE4VshX4UjIH9+SvnbEdBQfOzhQnCnwCo4yGnb0T
 GHfZXcc5c4IoS3Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 0f8RuTzbAakonAljLKxcR851b4PIMxOd
X-Proofpoint-ORIG-GUID: 0f8RuTzbAakonAljLKxcR851b4PIMxOd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzNyBTYWx0ZWRfX5SP3muytorDz
 mdG7zSpb71iiqWdbEE3jxF+hTdz9iSvLKZjpKcbGDYoyIoJm1m4NSDKYWBCI88o3Aq2gNKg95Hr
 SD5pJv1OIFCaqC8vS8UIQSyEa29FO6Ml7K/7NHVvENbvDKY/3cGGDHFaVDUepU9cD0b39hIXIiU
 rx3W4Kwkkk2hjuzJ14siZoh45mP17fiNlL51fBuy8xQW8p8D8cu5AjToLKy7XE4/K7WMo8oXVrx
 0p7XFC+jjLPmLCPYE6unFIgQrQxE7LoTF4pKgL7qRgQ9Gbw1d1Y53NOhAiWwo1PtEGzpx1n97+O
 nWFP3D11Ghlwb15Cp7trhPZ+lMj02n53Bejzn1tUQWmxH3pzm8L9XmHRVTPwvX9b+cjUctjcBje
 3CWeFnIsRvkiYjNQNTFanoXiev2IEuM1DvcvMMvF8whQBpqxA29kUVSlcGlFoUVtifM6H/oxXBk
 lzdnQAdm5FEH3GCWL2w==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69b03c6e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=_nVz3S4ZhEqO8F-4z8UA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_084448_524316_09483B55 
X-CRM114-Status: GOOD (  33.97  )
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

This iteration is built on top of the v11 RFC with remaining issues
fixed and the mechanism for communicating the scratchpad address from
clients to the BAM driver changed from slave config to descriptor
metadata.

However: during stress-testing I noticed that sometimes a transaction
would end with an error. The engine was indicating that a write/read to
the config registers was performed while the engine was busy (bit 17 of
the STATUS register was set). It turns out that we must not just
unconditionally append the UNLOCK descriptor to the "issued" queue, we
must wait for the transaction to end before we queue it so this version
takes this into account and queues the UNLOCK descriptor from the
workqueue.

With this all stress tests and benchmarks from cryptsetup work fine.

==

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

Shout out to Daniel and Udit from Qualcomm for helping me out with some
DMA issues we encountered.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
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
Bartosz Golaszewski (12):
      dmaengine: constify struct dma_descriptor_metadata_ops
      dmaengine: qcom: bam_dma: convert tasklet to a BH workqueue
      dmaengine: qcom: bam_dma: Extend the driver's device match data
      dmaengine: qcom: bam_dma: Add pipe_lock_supported flag support
      dmaengine: qcom: bam_dma: add support for BAM locking
      crypto: qce - Include algapi.h in the core.h header
      crypto: qce - Remove unused ignore_buf
      crypto: qce - Simplify arguments of devm_qce_dma_request()
      crypto: qce - Use existing devres APIs in devm_qce_dma_request()
      crypto: qce - Map crypto memory for DMA
      crypto: qce - Add BAM DMA support for crypto register I/O
      crypto: qce - Communicate the base physical address to the dmaengine

 drivers/crypto/qce/aead.c        |   2 -
 drivers/crypto/qce/common.c      |  20 ++--
 drivers/crypto/qce/core.c        |  28 ++++-
 drivers/crypto/qce/core.h        |  11 ++
 drivers/crypto/qce/dma.c         | 158 +++++++++++++++++++++-----
 drivers/crypto/qce/dma.h         |  11 +-
 drivers/crypto/qce/sha.c         |   2 -
 drivers/crypto/qce/skcipher.c    |   2 -
 drivers/dma/qcom/bam_dma.c       | 238 +++++++++++++++++++++++++++++++++++----
 drivers/dma/ti/k3-udma.c         |   2 +-
 drivers/dma/xilinx/xilinx_dma.c  |   2 +-
 include/linux/dma/qcom_bam_dma.h |   4 +
 include/linux/dmaengine.h        |   2 +-
 13 files changed, 404 insertions(+), 78 deletions(-)
---
base-commit: c488f26cda5d9db5db9383551adc7d7b2abc97e7
change-id: 20251103-qcom-qce-cmd-descr-c5e9b11fe609

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


