Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7FCCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nzx+RFwGJBLfXRvMdulLZfm1VO9C3GXrOju9FRXVr1U=; b=L//mgOLKlXvGJR
	GCsJXj6Dl8etPW4NJcjHO1qNPskMnycEVbprx+HXEcsL8yDKxwT6clkdW8kis+1uAIOVNUStE1sPm
	X31BGpklG6MM6R2+tzdCWKgJBLsffjcH9wfxq7QJoZ6bEQLgvsY1TV8o60gHquJxup7BYyZbf7CYX
	BcdRiQf24jdmCdxV6JChu7XCcr1E0e+i/kZaBlugSdNY6LsyuNYfb1vcgTmEhxzFXud1t5mel6qCb
	KoODn1jc/mNZ8CuZsc0G1viQhbr6oZFuQrIHxJrb7NFxBoj7iIUGFG9C31W3HhXVX1gDsn25sYm1K
	0ZxVJSnOh4miQC77DdIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ6y-0000000B0bg-1ISE;
	Fri, 22 May 2026 13:40:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ6u-0000000B0al-0j7n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:40:22 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9Bn3O3005110
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Nzx+RFwGJBLfXRvMdulLZf
	m1VO9C3GXrOju9FRXVr1U=; b=LDZnuOy9n/+Yll0n9bRE8V3N+znTyMtCnMZhv4
	xXk9FJT0Oi9grAZqHy+UDsUb8tHwa9Fj1lMUhvHa1IBt0Jxby25zAdhxY3T3zG+o
	DifXDwJgOvucx5TTxASk440BV94hCO5ftDLR6I1qYxnvZXbbsEv89A//pMt6PiGz
	BieQJXJGtRDvskp93U1gN/d3OZUlNQIhXpFMVLJgHXTkVbRaTxprq8K7BmoSe4TJ
	RAaolTiwkSuIprxuCJ+K+MqV4d6N30cnDhYS71mXyQHmxkAPxpd8hEdhdTmzrcMh
	CHdv/bIE44+wFm4GF0+V69UFVVp1yecKZqqUkPgZ9UUJ2U2A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrta67v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8b4bebd2b2aso193614366d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457218; x=1780062018; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nzx+RFwGJBLfXRvMdulLZfm1VO9C3GXrOju9FRXVr1U=;
        b=MtiYWNmq1YBwarJBhgXVzztSIkwEQo9rey/ky96a2d2jJkIBQA7mRSTUGnE5EGUAAl
         p+C6Cen3Fq6coJf+guIY6EXyx3lP46FCnazNiK3DkpXn97v/IEG/487o7ZSObGdMblDo
         fLRzR9a5udZCT53OTt9xC1eZTL6aHUxcY1UZN3Jgc/2sR8SmCe8JPJ8J26hD8w+iv6a7
         +oVy0HnSe1d6aowsSfsUVcP+Zj7bi2Q2G0/GNeqJWp2HasfDONJMxaYRinAV1remIE/G
         Ft+EuTxeWCSE2c6y4guh+Gqb08TX5MpwtbR6sCi0OvUAKNNUxYVda9E5dEM1+NtnTSA8
         Y1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457218; x=1780062018;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nzx+RFwGJBLfXRvMdulLZfm1VO9C3GXrOju9FRXVr1U=;
        b=fD2pftcwfpYAVENN4HH9vWN9+n+oWPvoAc2sw5S7S5QtfaywfkKC/Xg+u+hwuKG8my
         94jaJCBppsl1pD8lP+tp4tBzWcPmgC1LDY4nhY8O9GXqpL+1ra6cMUnivCt+rWtzUgd7
         nJpzpmaN/WR6FYgZgko7b/mLwcol4K1ImVot35yUZ7kaW9kRHvoXqe3X6FuVCprVlzbQ
         sEo+UyCF6aSsBhLZSgiVif96NPQzPqjiYaIH9tNwOHB+TmpddbJnlb1IlXnCVQ1F0n8v
         6fiqF+G3HuWTz85XAp7omJ4vAFQkTICzFfTo+/95SAWIwx2ymGAAF19zZW38+J7VgDWe
         nTTw==
X-Forwarded-Encrypted: i=1; AFNElJ+BjiMYQYAdZm70hBkaxLlXDqzpQu+2idFvDEDue0/OrvyI0tEVcrFqb+dz9JBh98OKfFtiqTnVNatDZnOFrhB2@lists.infradead.org
X-Gm-Message-State: AOJu0YxDHLxld5T9hg+U1WlF7t69g8RXqcSYcSMxDFr+GoD4OorpwtR3
	b7aan3iBUSXEUoU6K921Q5O2+pQoRIh4mJMAWGTqUXtqigXX/jupaICjwRwgpGq5BNngalQ2K+4
	w3gk1GoYBAdU7bBdLxmJSpu7wF/GCHr+S7lE43OIPUz5G3j6nq+bVP6Ozv8gPKdvR04myDVFtJk
	K8dA==
X-Gm-Gg: Acq92OFL/Lp8h9D6A1u2YWiNgVFzn6Tz1vZyfTCiFAF1XaSFHlrBOgJxg7F0TiiZyUU
	yfdQXP2N7eDVypYKzKQnyVEhMVlfSE4/X6FNPB1KrDqmmUx0jbLLivwBkFX+wuawJEm36QHWxV3
	/gsx7g28RZmXwBBn1Y+qsulRWGoEmVoWWJ9oAzd0DZhAxHz43Xs+k5/CtrdTvLsc31jqZT1UQ7Z
	3czdH5PZFXTozTd2IWRNckHkhFLZRbpl1vk5lZMwvSUS6Glhtjkrwm/tXM3nwVVxX+VVPIOLT9v
	A8I8aK9LuNmP9CjsBheW/qZMN4pxZ6UcNausIlJKSQsrG6t6qwTlDrN0kyT93AJqZlrVbQSLpDV
	XTlODdbATOZhJE/BrLe6U41onuF4pdzC5L35IZ0ujlO87daI9Ow==
X-Received: by 2002:ac8:5f4c:0:b0:516:df09:b1ec with SMTP id d75a77b69052e-516df09b57cmr6504751cf.37.1779457217619;
        Fri, 22 May 2026 06:40:17 -0700 (PDT)
X-Received: by 2002:ac8:5f4c:0:b0:516:df09:b1ec with SMTP id d75a77b69052e-516df09b57cmr6504101cf.37.1779457217042;
        Fri, 22 May 2026 06:40:17 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm44912825e9.3.2026.05.22.06.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:40:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v18 00/14] crypto/dmaengine: qce: introduce BAM locking and
 use DMA for register I/O
Date: Fri, 22 May 2026 15:39:53 +0200
Message-Id: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKlcEGoC/3XSzWoDIRAA4FcJnrtBx/+e8h6lB38TIck2bru0h
 Lx7Z0NDFqoHBUf91BmvZEq1pIm8bq6kprlMZTzjgJmXDQkHd96noUQMEKAgGaN8uITxhF0awik
 OMU2hDkEm6xnLSVFLcONHTbl839W3dxwfyvQ51p/7IbNZog9OtbjZDHRIIcbggGNTu2M5uzpux
 7onizfblQGmaVg0rJNZgzdWA/wzGH0iwGwTYRSVnHUSPuvootiN07S9fLkjLj5tsfuz2MNSlFN
 oWwwtdFiW0QtDoWfBysILNC1Ai1uTuc6gUqY9i68t3bY4WtQqk7zIJoiuJVYW8LYllnzhrMsCK
 6O7+ZJPS/TyJZcKGi+5YliBqHuWWlnQeaNaLCFzZMFl70PP0k9L9v6ERktyJ60UTHhtG9btdvs
 FXoFDU1oDAAA=
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
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12274;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=V5TaHcay+ffQHNcEXKwi/ZBYhKP8pQ6TVeVwEy/241Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEFyuLpEoVOQZDDD6/ND3ua6YpRjQdH2B9Ni5C
 Hp+VG1b45WJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahBcrgAKCRAFnS7L/zaE
 wxS+D/4jcLDACqrHzHF2jx7us0O7hKmuLu610y8Yt0CB8mPqScbEgy1s7Pf3RXaKwa1KSJC8HDM
 RH+2C7S8wu/Om7c5ZJgEg6XIyTNYbipjsiRbt1lScaziVd1IF3oLZPwVZ/U9CKm69m+tPMbnTJn
 eUADBXIkrdKZOw3/n4eVHnwVv5eNhz047TLNAZafdyYxiu77Cymer7ELdLlWfg2v7WdSUx2mMba
 oZagkDslKIVwm6Kx3ICc/XHB+rHfc154rWG/xDHdrb2KHE8mHYzn8ZjNVX7GNahBNjzrtxFb86z
 f3v2WpihVy1vJ66RlTDm0C/8TcResoRQeXmXFiZiUfX0knP8oVs8WsBCgpoWf+Ez4sLcdzPHQ/7
 ZYITyYGMMuxxdHy5m0TD6adAnh8tS95uMu/xi1GgRH+HlNdEvGHW9KWtrTuMMN2Z1MQs7Y3bZZj
 LdfpxAZZtJeDx+ATyP6mROYdEaTZAdZZOmtvxqxsdPO0QcZ7DoxNWOpdFThKhfLurRQzH0mgLRg
 ehRSdwfX/hNDvbzlbgRcRjDGobucNwSKiAapwskwLBjzfeIVEPnFZyTwccjmGCRXOQjpPHxk1eT
 uHV9kizst8bqIWPyVfvMFNSvutm0oeCzNIxF0yk8HrHL1osA+Zzfei0Okp2SPPk4XJia0qwU1Hb
 Ct3BgIOt+4/CWUA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a105cc2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=mYVGbHsXlysWdROdmYcA:9 a=aGUmJFkMoD6nLW8d:21 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfX9Q04ta39Hx70
 Kz8h5/DhMMqhnGr4tl2AjE6pb1CeQDuKhSMpjG5QBKVOc2YoC7SgNcDFCiFcJH19viMzFqsD9Cq
 B3R+Wm878jtrCLRYMAAfF2LYHzNMYEy1hyB6yW/6KzvxH6cE5b9D8OdpEkGoDvgrq+bM169MGbk
 X7h6UFM9lgxOERD42W8+s3bDMc1XpHFX3+DtEO2F6hgWqILMP1XJACNShk5mpgU3wP/8Dtg+7d7
 dbhjdc23eQ0s2WCp8MZK3Nt0YW1uJLOxTtGGlWnSHeoRjfgKD6zh5YCBX/uyHpUEC7NieYR2hz3
 awCGrie0FF4gH4xCRr5Ua2lvD7Azcw5czWZJwLAmoUWRsdn9WS5ncbh0qbUxX3QBX1SWAcD/EDO
 NlwICX8amh5ZkV3WUYPxq1p71bBeP9Mf9VQLeprIZewziNfL2EostmUSqffPLxHJ6gvZin5Qo27
 SPfcjOlV8O9lLm3EWGQ==
X-Proofpoint-GUID: ptE2TRyJOuOkPLSawgdXlMEVc6mWqAHO
X-Proofpoint-ORIG-GUID: ptE2TRyJOuOkPLSawgdXlMEVc6mWqAHO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_064020_233361_98200DA9 
X-CRM114-Status: GOOD (  32.71  )
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

Some more fixes for issues pointed out by sashiko.

Merging strategy: there are build-time dependencies between the crypto
and DMA patches so the best approach is for Vinod to create an immutable
branch with the DMA part pulled in by the crypto tree.

This iteration continues to build on top of v12 but uses the BAM's NWD
bit on data descriptors as suggested by Stephan. To that end, there are
some more changes like reversing the order of command and data
descriptors queuedy by the QCE driver.

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
 drivers/crypto/qce/core.c        |  39 ++++++-
 drivers/crypto/qce/core.h        |   7 ++
 drivers/crypto/qce/dma.c         | 165 ++++++++++++++++++++++------
 drivers/crypto/qce/dma.h         |  11 +-
 drivers/crypto/qce/sha.c         |  10 +-
 drivers/crypto/qce/skcipher.c    |  10 +-
 drivers/dma/qcom/bam_dma.c       | 229 +++++++++++++++++++++++++++++++++------
 drivers/dma/ti/k3-udma.c         |   2 +-
 drivers/dma/xilinx/xilinx_dma.c  |   2 +-
 include/linux/dma/qcom_bam_dma.h |  14 +++
 include/linux/dmaengine.h        |   2 +-
 13 files changed, 422 insertions(+), 99 deletions(-)
---
base-commit: b4a253871ac29e454a62b6746b0385d52cfe7b24
change-id: 20251103-qcom-qce-cmd-descr-c5e9b11fe609

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


