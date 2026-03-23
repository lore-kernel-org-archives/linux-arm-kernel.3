Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248B2F4613C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 15:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=boUl6xUGZvv5vJNkbwAOVKNUiG4zdXWr1MeFDFuAI1k=; b=LsQq0JE+Icu5dh
	qORIKoeGjQplJ6LVZ7N/MVE8In8rLdn2DVUDaTJfZkRjKyuyrA2/r4y8/6gxgLP9hVwYnBJ+iCIQR
	ZULChaC6Co0EoxeHCT+Zs3qAnVXuf7gYoHU4d3ydLKe30H9/rxw65AsrvpcMVBfcVaS/et+j63cL8
	YwQV0jSLea4alW6Tzwsfa6lATWlJIVj6Zt3t+uSmhaylVwFaSPxbgtQK/L0EIlbENWHEFG1bhVoom
	VlpCFVh3Zks3MGIHVoBu3o8IS0q4V1VKofNAYJvCaTtnUU8nk8Txt7UZ7C9yKEnkXzTK7p3xELAcJ
	hd07fyMA7u/1s6s77PGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h24-0000000Gzym-2kV5;
	Mon, 23 Mar 2026 15:17:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h22-0000000Gzxm-1oEF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 15:17:31 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGWNi600271
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=boUl6xUGZvv5vJNkbwAOVK
	NUiG4zdXWr1MeFDFuAI1k=; b=hLJzJ2momSIqGceOnnHJ1gqgvkGa5BLJ8qLJa0
	i4BWkAnWYpRUruNoE5IYD18r84J+Va6ViWz2Q7a3d5SshWtDb5Pm3avWn1XEx+x6
	iZHrLq65N2KAlIkXY7citVNJ1kn6nkjTJ89+4Hf9uGYOZmuqJU7IT4aAdv7eM3/e
	bpc7Xf4MZ58tCVugJuErwJc4WnfiXVcII8Sa2KMUdKu+aUlZTQtnZbz9cdUyioEX
	c8mFf4SmxYH1Td0oTXC22hsGMDPttEBkT1bxDgby5NB6dZBLiKkNGNLU2SPaZK2H
	3PQrfLKI+Ncl04B3VUGUVxx09vxcBm4cdx6NdwHtzffltqIQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vkrs67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:17:29 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56ce9a926bfso246140e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 08:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774279048; x=1774883848; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=boUl6xUGZvv5vJNkbwAOVKNUiG4zdXWr1MeFDFuAI1k=;
        b=RPzn0XylMfs4B495Io5zFML1ouZfOr1RhXgSIAsuZkMIAFzCWgQyMjr+vVsqwY+kDE
         tifX0y3DVVK8YFRAPaww9Up+l9OSjNP9ILD9z5+Ow2915T9DgLZCnoo8YKrtEjqG6buz
         gDz4ixyJCdtK0QSAbnUfX/NiUqZG2B8IBN8vxQ2U4IZukY4EW2QfFjg9PUynKQaAh+lp
         Ub5utGcBbmsnxA+VEiaa89ZOXPPKlnusXC4sabxVeOnBLTDl8NyVzDqVmpAleFj99hXm
         VRrAVf+ePiKSCEhoxKL+St3EqwnqM5FdyvJkxkVBuKLpjshnWm7/qt6yeStc0Hd2va/I
         j8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279048; x=1774883848;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=boUl6xUGZvv5vJNkbwAOVKNUiG4zdXWr1MeFDFuAI1k=;
        b=a/lf9vp4UWmeNF21pRIa5L2AdkPqkf0SyoOcIkNXDsCmJ4cmDLf9K0T7E4rwKyzx8/
         L5F7zqhq4a7r6pPngh3IZayqRoP7jA6Z/5hex/KcwSCiwbzblKd+gBrqx4rUlyFlIqVA
         HFSy8VroqyppOmxm2cc4vAiT09P1K4Uliep0g0fk1SzpUTQbvztvWOYNWkWPJfGQdJRP
         IhxvpS7tAVffxOTvcH263N40HjIpllaCA65RIibODtH7/J1eam+B3ms37FFM3krEgO+o
         2SNPy0Qq1/QOqAXglNEtN2tbTgeRBL3SWNzdFGhOU3nFf8Cv3zxHGWh+hZiYO4nYwBnR
         Ia2g==
X-Forwarded-Encrypted: i=1; AJvYcCXs+KPGdJjLkJiI2c67qVZ5gsX4Sg5MqjaOqiB/jpfjoxag7SgoOeGDEQia4Edq1/eHaF2NkXdFpOxoRaftmqY5@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1kdbEzBKSg/7SszwB6HnYg0QdOKyUTSCJtZZWc/CAgvd8a/4S
	glrcjOq3H81RJLEeqTRUeLX8OqsE2OcHCSt/XfHhcqnKyEL3ycG4s4VJcME2eCBENk9DIUZX84W
	wZ0LLygw3PbSjL/bq+CNiKrs6cO6K4Zl9NIVpL7lJwsPMYhkSz0QlNIRP7LjEfYHfOrNtk/6c0F
	0gqA==
X-Gm-Gg: ATEYQzwLgcKi/mBetbQRagbDtYVU8ZJ9mvaqcYQ7Aa38kOoBxnmuGmTbFESf1AnWJ/V
	3imqF6VbRSQgIIDZp47lmyML1jmkQfbWNts3se+UKK7q34Xtp5MlzwZkENj14uWP8VPdGoz4PhO
	Ab6cBCc/Y3kn2JXkhE4D2hwof+8JvKY6GQzSlgah2TO/91ZC0mbME5NJg89wIFFX6jSPHYp8D3K
	GcBHWI5xzAJyu2RymRyLObQC4MRUYlCXndnuiUldETEu3IpKJhi9h7HofwnvpJ5+M6Z0l7zCqFd
	ADVaqnvihulV0zcTZej0b/ScbnK+f7h2SgJuqzJq31Z6z/D6XbW4YpzbPjUWOSMO4zmQNPs3laX
	USU8mZ0CkvA/O+ZmI0fvMJjluZdhK7Vg+uB2zP1fkAYJ29p6yMI9P
X-Received: by 2002:a05:6122:e1ae:b0:56b:da56:b261 with SMTP id 71dfb90a1353d-56cde33f1f3mr5510024e0c.5.1774279048253;
        Mon, 23 Mar 2026 08:17:28 -0700 (PDT)
X-Received: by 2002:a05:6122:e1ae:b0:56b:da56:b261 with SMTP id 71dfb90a1353d-56cde33f1f3mr5509994e0c.5.1774279047655;
        Mon, 23 Mar 2026 08:17:27 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd923sm35936993f8f.12.2026.03.23.08.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:17:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v14 00/12] crypto/dmaengine: qce: introduce BAM locking and
 use DMA for register I/O
Date: Mon, 23 Mar 2026 16:17:06 +0100
Message-Id: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHJZwWkC/3XOzW7DIAwA4FepOI8ITH5gp77HtAMB0yI1oYUt2
 lTl3edWqxZp9GBLtuzPvrKCOWJhr7sry7jEEtNMhWxfdswd7XxAHj01GAjopBSKX1yaKCF3k+c
 ei8vcdWhGKQP2wjBaPGcM8euuvr1TfYzlI+Xv+5FF37oPrq9xi+aCo/PeWVAU/f4UZ5tTk/KB3
 bzFbAzQVcOQYWwXBhi1GQD+GVL8ISBNFZGClBAGbMcweOvbfSqluXzaEw1PDaVfSz6sXigBdUu
 SRY4MnR9bLeCZBRuLHqhaQJYyOqghQI9BPLPU1hrqliJLmF7j2Abt2pq1rusPQk3CnioCAAA=
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
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9427;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ger4mNU2MAah45zM6NpYL8nqSB2Qy7tzko5/ZSj1Zrw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwVl1/BLG4u96LfXnmrPgYQmC3YAXpMABtgvmV
 aLOz3nWSiiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacFZdQAKCRAFnS7L/zaE
 w2zdD/9mwjAM7FvXSM4mwE/n64G1Z+YMhsbOenHnxWu4xuaUd53FiHfHACIrWHiDT2uJS1u66kt
 Qar0zC7eKCZ02a0K5JocgRmknCgl3isB1KoPpsrGk+qoaR5+6IkLuDJ0jsN+0MT/5xr/TuNrPKE
 MzkzFNVA5XyTmyscqUhiMMABDYOpomvvuqJnorm5ZxJ9hO0z9VzxCt+z7gSHcKM2AmypCPBFJHB
 IEAGfW3R+xBao/uoEQYe40b1d8JCpHX34Dy2hvaYbiRF7bNWU4qQUtT8TkSOFDCX7We/lSbAH0K
 rhfiZoMnLUoVBVNHTznNbZRlrYj5uAPk9BZ4/iPpDcnby2zG57RyPsVWI2lUeu823w4+H+RnDrB
 5YHpVterie24Z/IDUhAotLJQwCAZjsBaIh2CwqiKJoMQuJJ0Acuy5sq6iaYNpy710d7JUAHNada
 y1JUaS8FV5UfLEP6U0eGKLvkqvb5Zemh3eIqAEWDswDV/XBE1/EJTJsrvRG75VQmGS0k4WXYGd4
 mH+59WdfUj6o9kuR+ESlimkUJdZEXWrtjoG4/12uNo2VppiA7oH7/5c6EQPVK7nBLfZ3/YbJA+U
 Bc6hF5WUY1bNixrQgy7OZL+g4P4cY2XQPdmG6NJEXLyc67J/rOZl5d+0MzsqvmD1FV4rsqmdLXr
 3J7lGDbqaBbZfCA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExOCBTYWx0ZWRfX2FGOQbEawZ5R
 7+x04h3Qkk9GoCL7RFrc9W/ovQkLc894xNLOR+jVlHhfBK5P7YROXWXif9V/l8JKJPgoELY1W07
 99IJdIzlrAfzm/diBOPCyQLczAdDy+aRMjfMuPf44lNyjnmtax4Vu/ZB0wIQSCVwnQ+zbbH3+SE
 7ivZA7XTxDIjvxnJ2x4DCWjHFaEf5M6u7XmCab55SldZFbhpzP2LKvQU+FCtg+ZQFsCQQi/dPIl
 85RBLZ9V77jcCpRwdupWq23T+o7ni6eYTSVfU4F0lZNnW6TziGJ3J2P2qoIoc1kvOhgkyD7aIMh
 ZP9Eafvc8ws8vojOIPI1agmvEo9vU9BoaP+4a01Ne1vwYgnEQZetzzY9OVa4tRPXtQwhWzvem+K
 tmRYOR0bSz8UwhW2Oiigtp/JcciMdzkCEvaYXuqNcJ/yS+GuErsxdu3HRd8KUNBp33wHp8TCDbb
 uQrCYA05xD9I2F5jJrQ==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c15989 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=uGVhH4IIQU4n5J_wZqUA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dmXGsjiWYslUL3nmUPIUDMOBADnWx-w-
X-Proofpoint-ORIG-GUID: dmXGsjiWYslUL3nmUPIUDMOBADnWx-w-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_081730_605331_205FAEEB 
X-CRM114-Status: GOOD (  35.61  )
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

This iteration is quite similar to v12 but uses the BAM's NWD bit on
data descriptors as suggested by Stephan. To that end, there are some
more changes like reversing the order of command and data descriptors
queuedy by the QCE driver.

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

 drivers/crypto/qce/aead.c        |   8 +-
 drivers/crypto/qce/common.c      |  20 ++--
 drivers/crypto/qce/core.c        |  28 ++++-
 drivers/crypto/qce/core.h        |  11 ++
 drivers/crypto/qce/dma.c         | 163 +++++++++++++++++++++++-----
 drivers/crypto/qce/dma.h         |  11 +-
 drivers/crypto/qce/sha.c         |   8 +-
 drivers/crypto/qce/skcipher.c    |   8 +-
 drivers/dma/qcom/bam_dma.c       | 228 ++++++++++++++++++++++++++++++++++-----
 drivers/dma/ti/k3-udma.c         |   2 +-
 drivers/dma/xilinx/xilinx_dma.c  |   2 +-
 include/linux/dma/qcom_bam_dma.h |  10 ++
 include/linux/dmaengine.h        |   2 +-
 13 files changed, 413 insertions(+), 88 deletions(-)
---
base-commit: 38fb1b38c3086065ace8fd72471c452cfdb61d36
change-id: 20251103-qcom-qce-cmd-descr-c5e9b11fe609

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


