Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56844FD877B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2ux4cjLGAHyb8qfNLkf5TP+0nTrSK+UTuTiz6cAxiMM=; b=kpX1g1Oq3oT70n
	ZgiJ8xRUCWAV2wldqcIQUE8G//uir6Yo/LySR2hrjIQO/uB2wC4WNEpY8Fl7+WlEX5ye+lil2gTel
	/4qEGJn3RGiujKniJBetOLwwkBu7dL+sQfALUpKO12QKoaRN9COzl8ViCvky/ZusV6VU2S38Pr4BZ
	fwh02eV4BeMuz0QgfdUDGS4lKQOQCOepumNi0PA/cQR1wsbyaJYjeQOOgQ6gxj109JYIDA49S+Rlr
	+t9jRT+c/xTnG4n8ml6p2Q/Gx99HaHJnuuKLSG6vY8AfFElnnCWUzk9K5CRIPPFBGAOP+CMRvFk5P
	z3pw3W4TipNYEoiYZT/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V0P-00000006Uhu-0nPc;
	Tue, 17 Mar 2026 14:02:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V0M-00000006UgY-0zyC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:02:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H8N2bw1534032
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2ux4cjLGAHyb8qfNLkf5TP
	+0nTrSK+UTuTiz6cAxiMM=; b=W7imo8XzMHXgcYaVY5hor9HlBbNz50eyP0bE1w
	itTPVA+SSKb3Qin6VZE2ut1C4ZpZl1yxC+KAgErE76Zxk2eFxE/vVbdBm7vBNHF/
	2kkUIFgZbyb6PvKC8QO1+S3Te7S5QUnOkheIx8bEXlBVGMnvT1/bzwNXskw5ZtIQ
	Nr6oyJx24YEH6/liD7bStQAKWcMlAZRIbpmcDpi/gNWKgP8P8PBeVlE463iUgtgO
	HG8a2aEwRcNMGb7RrBYj5XEzmyUNzqx9+T+CC2B8NgxjewmU4eszi8S+eBWp4HG2
	81R53Yme3Uz2EEbsOaByAhZ7QpkhsXk9Mc83C/7dBm2OrBtA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxm5k4bjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:02:40 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94ad0d8eff8so6073873241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773756159; x=1774360959; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ux4cjLGAHyb8qfNLkf5TP+0nTrSK+UTuTiz6cAxiMM=;
        b=V+2J52RtCEabWiderW07EIoRyj9EFpP+fG9zvRGvbtpmMOjBZG+h4x29dvCzk4D+GH
         PxyqPm2Dx9un1ZrsbufFXxqQ5xNpy8jx4JX/VhlRlSYITli9r8Gk9VrVKMY2yplIV1SJ
         djiW6yoVURJCyCRRAJv1UlRuhYp2htQ/gmznOOjODBOiB3HUNVcsS7AfehyUzPDsumjx
         MhNp7+e0o26xV3FnK/KSW48eTkaz0d52kPX0DL6DPCPWlkmTlWx7qjRHUX6lP8cwRhYz
         mW8pJOyPiSWJoaqx0dmmS5ka9LDWPRCWlHQrRtZWMxDzoKXSw2zomFsfi4mkwiU00JqA
         ylwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756159; x=1774360959;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ux4cjLGAHyb8qfNLkf5TP+0nTrSK+UTuTiz6cAxiMM=;
        b=DNbwpPEL+3iZFMim7F0u/dbtVz2xhn2gUD2+U1bofm2/Q4UgD08y/qSKlGtViNe/8j
         UGQ4zSFMVvs+ZD6YIwbNGd1Tqakx6RkL8b4CtJfU5deSkbur2SGULAo0hTC8ZDtlWjCx
         rmtfbNoaN6Zh/G6jAEVpel5hIrAwud+sKmmUdbxLYA5YfCF+ycYVdIaRc7Hkw3J+qMop
         ul05OADB8XejuNY5lRis6FTkLiX7LBJvLIir9oGL/cZ9Zme3dX+JBXfD8wmd4YXBd5J9
         4bYPkiB7qLfI7czoAlfkZufBXWp4QMH2RQaMseXOvA7yDmGTHZqLZmhmRzLPiZWHAcAM
         YA2w==
X-Forwarded-Encrypted: i=1; AJvYcCXctTcmsHxom+oum7Bn5p7awzjZ/Z+jnmC5aYgaYcqL5RA5cU1MWlydDHP4RLY3Rguc9EI3yM4otpj+hV+NVpk0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1S+h6DdcPmeIU00zWaUid5LRTRqQnSjW+muicqMRveU2GswNu
	WBy32QAXTIJo/L5LtY/dM2YR+cZR4HuxZ4PW5H8rD+Ovehq+IwhjdSfk0a7qX34d5GCeWhBfzAG
	hmMG+Dhr3mXTv7tasZ7+k7Sh9i8g3K3je0EHdNGoTSdYwNyUwUxkHy8m4BzH3y5NvtTFYlKzBar
	gdGg==
X-Gm-Gg: ATEYQzwFvm90HCcR8FVfBlR8UCaJ3QMMMPF0WMFmMH6ZT36SaABuDmoCB6ST+HJezwd
	2xO29lkZMLPyXwesdfW17NjZAGlBB315lKP/hY/EX7LjWuNoeoT6pAd9c+OU4iMrXVA0JV/ss9e
	Gz3lsjv6hgZ3hXFpis9O5mybVMM8b8gErqZP34Ms7HaZI8YustRHcYrDJ4/gOY960wwbld0/MMT
	iJbaOMQvcR2vnS/UECk0Y9ClzbenHlBZ1ZIwfxiuAGbWyXVqDfCsKyCsvdn+0WrYVYT+tNQ73SH
	hJ7ltt9VYprhygPsRcqkuMCDAJtwtBsiNNH6Xj9f2aDwjVjLCgco4NXFVbXTRoU+RgH+8r2P6iK
	ARhICGxUXfZvGX6smQUDPw0+xzvI0UXI5Dd4mxyIS61tkqhsfe8S9
X-Received: by 2002:a05:6102:c46:b0:601:f6ef:af8 with SMTP id ada2fe7eead31-60263f20317mr1644325137.10.1773756159081;
        Tue, 17 Mar 2026 07:02:39 -0700 (PDT)
X-Received: by 2002:a05:6102:c46:b0:601:f6ef:af8 with SMTP id ada2fe7eead31-60263f20317mr1644234137.10.1773756158287;
        Tue, 17 Mar 2026 07:02:38 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6aa2:dd35:4d6d:8eec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4938854csm9359709f8f.34.2026.03.17.07.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:02:37 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v13 00/12] crypto/dmaengine: qce: introduce BAM locking and
 use DMA for register I/O
Date: Tue, 17 Mar 2026 15:02:07 +0100
Message-Id: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOBeuWkC/3XOwW7DIAwA0F+pOI8ITBJgp/7HtAMB0yI1YYUt2
 lTl3+dWq1Zp7GBLtuxnX1jFkrCy592FFVxTTXmhQqqnHfNHtxyQp0ANBgIGKYXiZ59nSsj9HHj
 A6gv3A9pJyoijsIwW3wrG9HlTX16pPqb6nsvX7chqrt07N7a41XDB0YfgHSiKcX9Kiyu5y+XAr
 t5qHwwwTcOSYd0QNUzGaoA/hhS/CEjbRKQgJUaN/RR1cKHf51q784c70fDcUfqx5N0ahRLQtiR
 Z5Mg4hKk3Av6z4MGiB5oWkKWsiUpHGDGKhrVt2zcPZJ9J3gEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8992;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=n9QmEUx2k+Xw5vQlxuhVJtgHskQc4Z8JEF4CUt+KmJU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpuV7qLy5l6tr1UR4kURPLEzoCfhd+cG1mKezrM
 xr85OwW8HaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCable6gAKCRAFnS7L/zaE
 w3ojD/9PL4cZEgdCxe08TvXlNVNrQFpMS/F6pjgg2kc3q461h4h6SN57M/Osl7Inze8QeoKeD6X
 xTyonz0jRmcvvx7CDXiTVCEk633rF9j+rOkgGMb7ZyR1JVHCD5Y/6gk3h0S/EAY9t+VppRhv6Dv
 8nIA29FBStDhDVRmo/st3tzD8b9OlS26J3gaj27SIT0f9O94vuOR5lYTpKltUtuiqzU2gH6Jy6+
 q2p7z4w+TgBrmt61Z6ZWeHrKhpVaVugdIuKewdDEVnsHeq3Q5rPnjJ2Zdwjh77ArmL0qzYO/28O
 OXbYD4r5VrQDpJFI4VNijPw5HeuTd9XDYmqb/cFchkqUYHzwgqo8xYa0lVFH0WT27IYVSEJwak0
 8dbYMpP09IWi9DzI41zq2Xh52QPl2w8W+APRjHdr8Enp1Sa2UfAR4IUQXm6qEL+VubxlrFMcldm
 vNDyb94Jhy8zyyikuqdhHQx/ViJKhqdwrZm9f6g4k/v3gjTOLd/djkNsZ8rMX/qBfs6lAjuMqd5
 lKVNMQF0AZ+obFSevqedoo29V2JBFdYeHioZrf8XGTsQS7vZIjxyUKeimlVQrTdIQO2JAf2u4ES
 zUtf6T99R2xPexms8OJRQxrMb7lrpLvMJeVRwxbvkzbRCKxcX+XlIuIze7sxra1ZtUw9EJlmUqb
 jDZ6o2S+GNo4T0g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=fJ00HJae c=1 sm=1 tr=0 ts=69b95f00 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=3F_D-PAzLxqp5o1pZYoA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNCBTYWx0ZWRfX9ViQlPqFLzzO
 Lans1uy+BRWRy1zOjsHYJEK1zZxdjLBxHqlg5xTahtmBC6D4LTbeRFPkErJJyQr+P0xtRSrU0uw
 VUb3Q6Ib4xXMosQ0YKzApOZD6uHio8DdmrdfdEX8Vng04/5coUJ+TlwvQ538kmjL73nQzMn7xrw
 atXfapg+LbR5+T97v2WmOkCpIiZnpAi8Ggf87tZNLhRNUDHZ6+vT4mXJ8RqpIQnm2iMU7zLZxoJ
 k4+gZuHSeKfTneunFxaY9O687jkus7AYD98D7cd0GELetdaouHaNsbeBZCi0N/UNgz7571qzdUN
 IBm+hXkAymOOAHJ/SGYIAoqvYAsM7JkqjnpuOOjietIp85Mhzp3mvxY3QBeSi8JZUqb3n5soUmo
 W0/VM9uIcIX/em7Cn7LZn1Q9AYdmpO2K9DNO/T2tnpEqP8IqAwD/wli4qCORKsmLBggZjpODROD
 6tmld2U7pFpCoLM1FDQ==
X-Proofpoint-GUID: YQnNyRs7Cn4X118zPe5wLIUjL-Mz1U2l
X-Proofpoint-ORIG-GUID: YQnNyRs7Cn4X118zPe5wLIUjL-Mz1U2l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_070242_412491_507C2991 
X-CRM114-Status: GOOD (  33.17  )
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
 drivers/dma/qcom/bam_dma.c       | 223 ++++++++++++++++++++++++++++++++++-----
 drivers/dma/ti/k3-udma.c         |   2 +-
 drivers/dma/xilinx/xilinx_dma.c  |   2 +-
 include/linux/dma/qcom_bam_dma.h |   4 +
 include/linux/dmaengine.h        |   2 +-
 13 files changed, 402 insertions(+), 88 deletions(-)
---
base-commit: a770d984685255ef0e29fc2c8fc91735f94b4432
change-id: 20251103-qcom-qce-cmd-descr-c5e9b11fe609

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


