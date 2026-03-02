Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8A5EA4E2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UBPVifjsKpJfcJOnzKb3B9AUl4kCX8yoGo6L+5eqGYw=; b=m8WxaYgagzjR5J
	MzIiVQdVaWE/+oqiIuTbprV5MgLZidhEoxKsaUS3Ez5PM7loDIPO28IXxubSkMRYjGaHYWUdxtKEl
	23aac/PzC2H40MkmmDxqpABpKnbIB2rKdbzqxKJNfxQhas6rYF1h96iJNkhkLERuMOdc0oVdiEbyH
	1y7ENmbg9rEKrFOFlg9/8E0jnEPXgZJFYu4Q0SCexvKz4OcQjQQE+j9bGitU2m5V52QnkolezDjTw
	rijh5ncCmz8WuZqJkZLbR4PTZ73lAcU/xwUVLkxb957lFW9lPTr/yzGsCGVnE6jpZGvinGkeVUER2
	AYrrJYEnlub3h7xd2Vhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5eQ-0000000DPtl-1HUV;
	Mon, 02 Mar 2026 15:57:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5eN-0000000DPt3-2yPN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:57:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622A91Jt860810
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Mar 2026 15:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UBPVifjsKpJfcJOnzKb3B9
	AUl4kCX8yoGo6L+5eqGYw=; b=VfNmIN5RgI2qWvg19okagiH0V3Bf9JU7swDZxG
	zIzlSQKmBsUFxZFI3ScqgBSpZu76DLsZ+B/24a3Xm+oI0PIksXXToLoyI56iHwE1
	i4CeiMALgItibO/NepcNymXwbml5nj8wWoiCYVg/QsmAChs/vPJC8ZeG+R+VHi2U
	J3YA4j01b5yLMrcmDtlAKC3GLPdDBzHaTeoZAAuIlsQGAZgcO/HzztQQe2fRj7tE
	eD3sn/jy10etmnlaGDu/TuBIPFDvyFMg++F1i+ChPwp1zWQ4OO2NupHJwZHrEujq
	P6kORvl8fy0KvKzalVMTM/Illq4CkYyfDkJSwNXOwNGIyZrw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbav2fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 15:57:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4817f3c8so3080152085a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 07:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772467058; x=1773071858; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UBPVifjsKpJfcJOnzKb3B9AUl4kCX8yoGo6L+5eqGYw=;
        b=N80dAyMc0WkQMTGuhbk2UEbAHmfRGA905DiCpbSQrTuD8YJHlOVNP+3sVgH/X2WqHq
         JfvVPpDv5KbU1kVX4V0MduzZPXuFu90xt4wzbJ7dcCo4Na3scz06J1IWWU4WehUyUcKY
         J/P7h3HDS3Mg9APcCbl/OtjFUUwbjwTjeQl8Fs5CXcaaBDMPJQQI2hRcIi4yVFjXG6dU
         G8MD3fNXaRuPb1sxxgzqw0nVNX96Mxc4NVewpMnt0YTxHqY3MAnj/XOjwABb6b+PqlnL
         2PCx7XFLIHwce/9bFhHWE2Q2+q9ab0INtwcUEZn4DS3CprQ3FePNrVkLNnHGEijmV8at
         ULlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467058; x=1773071858;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBPVifjsKpJfcJOnzKb3B9AUl4kCX8yoGo6L+5eqGYw=;
        b=XBie8BN5X7lWjNVsSk0YBMzbFeRq3tNu/NKtBbtcT45vruXgqrj8mpiCqKDbG+inv8
         9jAf2+tw7prmGWVnH4bIyuVk/5b+iDNdYZ2ptrdMEP56jblKPRPj4SF5vPqDoBJa8t4z
         zXx6blOiRUvCggwbbP812CMYM5Aoy2yI7UpqR5mlh4ulmEmtCnUpwhnMUW7OXLM6laBe
         PXRhCcRTZQnilfyQNV7vW5VWJ4MTc8Y77w9JzOZZty0uYV72klUZyeKfSFPzel1Yhc6n
         ukfue33+wtgH9FOujNHPKmy8t3x2QIq2A8NPHfeddM/2KULiqnWbuYA5fw/Q3Si1SeLq
         zGpw==
X-Forwarded-Encrypted: i=1; AJvYcCUSbZfT24GOmCk1N56DhEGw9OIm5aE8hzA7n2ytT2vd3EAvZEEc9ihlR+AHhv2bCLCzTAqPaDlbc0BiB2R4311M@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4EDT4xN6+RQc/41xSyS1FpqkxaKqz8y6jpBycw/udhTwUaZhG
	+lifrMgPFcBeOJPowpEFJiutoaaZ2gAVVADbTyOnoH4NT0oz7pza2dMf2qWG/KhiXn5IEmfP32R
	VmAetaMjJE8sExLYI/j7cmyPgTm18Vj9Sl705qDHW7MhXPohvHe/BPy3kBF5wTuRb+C2WtLmF4P
	AIjQ==
X-Gm-Gg: ATEYQzybYb4v1RK+xrA0gPff2zccMTsnpbgD8hJ16e2MbKYCEFzsTUA4qRAVdue2uJx
	k/DrM4LPtD4Le+iyr1YuBIPdssWXnsVwTrLj5BUPaFkuwJ+agXp8ZeMbYIYr1FGse0GfL/cVFF+
	IOUktsppky1FBXtWG17nTUr3bcIliw5CEaNTQV23JGUUu/JeLejTAkZ4PVe+scCdtFJoa7vHi9G
	m6MbrMQnH285xTO9WaKas2Qyeb8UvbQzTstZhSYBbvf851AcJn+ohjg9D9cuJjim43abAujk7b+
	qJOR67m8eRUuGF8HgIysP94ltfVYiegBrNmQFuWakwsCmUYuWWFsex5bDr6BYE5BqJug13NCIWa
	lI+P1elWPx0CWkzOzHmZcp/qoOhUWNWPTtFom+VmS5wAZep/kHJVj
X-Received: by 2002:a05:620a:7106:b0:8ca:2baa:76e with SMTP id af79cd13be357-8cbc8d84a1dmr1792019085a.19.1772467057621;
        Mon, 02 Mar 2026 07:57:37 -0800 (PST)
X-Received: by 2002:a05:620a:7106:b0:8ca:2baa:76e with SMTP id af79cd13be357-8cbc8d84a1dmr1792009285a.19.1772467056961;
        Mon, 02 Mar 2026 07:57:36 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:87af:7e67:1864:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b41831easm11282438f8f.12.2026.03.02.07.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:57:36 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH RFC v11 00/12] crypto/dmaengine: qce: introduce BAM locking
 and use DMA for register I/O
Date: Mon, 02 Mar 2026 16:57:13 +0100
Message-Id: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFmzpWkC/23NzYrCMBAA4FeROZuSifYnexIEH8CreEiTiQZss
 yZaFOm7OxRhF+xhBubvmxdkSoEy/CxekGgIOcSeC8TlAuzZ9CcSwXEDlFQlolyJq40dJxK2c8J
 RtknYknSL6KmSGvjwN5EPj0k9wH63hSM3zyHfYnpOn4ZmGn3Mas4cGiEFWeesUSuOanMJvUmxi
 Ok0eYP+Z6hm1tBsaFP6WrWNrpX6MlD+IQr1LIKSFe9rWre+dsatNzHn4no3F17uCk5wHMfxDdy
 J6jVLAQAA
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7682;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+rsIHYxr7aRb0VlKhLNY3E/THaFUhgQFWmdMPoaFtxA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBppbNfhxvb7V4LiRoa46xtDOqp1t+K3Nkby1Hgg
 9DfJ2DR0NqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaWzXwAKCRAFnS7L/zaE
 w/koD/95Ne6UkZ2nK94on9Ak6+otLdbGHdGyyh+AT7awy1PWhSA9r0idPbeldvJCfxz7SecA8Es
 WEt8SJoGQWLVp/9xEOuZPvOvXyuZXE66PjJWVaXG6/nfRE3hoB8zPxBO0uSrAHqM2r94Y4oQ4iO
 xcmXnkjTyK5xSpgkHGCDoE9faDnO/JQ90kE/LLODoqlmKNGO/+RoHE9dr9/yjqzGUYmHV8O44fR
 Ee5x+y3dpwdP9lZ5GVdsCqHjGA4TBkSWOPpbXLSYDU4ViHOFKJBHDtirqhNe58zJbe/HGBncbKp
 XhAHi/vCj/7ohvt/HkyaZrNeblN9vEXk3oCicNcikonCFYb6Kss80ij2D7fMzFJwvnveMjF2YQJ
 xQe3ByDQDOC1SzSkf5cB7Z8OVRRAAYE7+B3oyGl0sFdNFBEzsLCKJvyQtY33Rw80U4Zcdow5fiI
 oGWMLqXGi2JLF8hioRbcwxKANeqfYTHu0DwNf9M6Dfin5LQHLU+2IUbPUGnrAj05nr4ZMwC4ZtI
 KazJXPSOk7BqIsy+VDk2drK5CEP9OIUzHudt7PhRH6UbFCox2b4S1PJ13EZwzwQKql7DZiJ4R9H
 M0HF7e9Pccp/iIAowMy3BFfNcRvKgmEuJQ2Hbz/MaiDHXmu/puXOJr46aPvhgxSDIl9miJQwnCO
 LtK1T45Owd9jRRQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMyBTYWx0ZWRfXyxZ9U6xTGCbE
 2um+0xiwgpGSRsOe2Vyok1k1dJrN2XNrJFnejdy4BO3KQvitcCNkaDe4mok/3OzCqkzML31vLem
 O7/8H3wzgH35fz550K8iPiCgytdkmBF2vFMX0TaqCjJ3DW+m+PNgG4NntD3rJC64L9VkOdBqax3
 5Lwna0z4HCwZHm6GgXuI97sZ+rVLGCLS973DuD1NaMO9RJc1rMzQzb0EDA0+hvcXZ0dSw8VGdhS
 6djws8+wXbjLc72yYoGbbRxcPiWWb7Ap+71EgFfw99DSi7tImJGa1Ae0McpEj0rC1Y6x91wR2Ci
 lbEIbdtGTQ+x5idQ7xppblbuog9E/B++z7dNo8F0AjjghV44BVbQZn8OSbTYB44DkEjQsTKAHEU
 ks/jU1xhjiNr8U4NcylPeCP1dl29WFwZCNnOB35omCOq7pbu8PR+CcYfRubAhI8V/5qSo2JdC8D
 s7K1cWeJy5/wmsG8vEg==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a5b372 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=Ic074KEQ1cGD3t8WRRcA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Ep1MhfFr437JYBVFeg1Okk3bwX7-ekQm
X-Proofpoint-GUID: Ep1MhfFr437JYBVFeg1Okk3bwX7-ekQm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_075739_900143_703B066C 
X-CRM114-Status: GOOD (  33.41  )
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

NOTE: Please note that even though this is version 11, I changed the
prefix to RFC as this is an entirely new approach resulting from
discussions under v9. I AM AWARE of the existing memory leaks in the
last patch of this series - I'm sending it because I want to first
discuss the approach and get a green light from Vinod as well as Mani
and Bjorn. Especially when it comes to communicating the address for the
dummy rights from the client to the BAM driver.
/NOTE

Currently the QCE crypto driver accesses the crypto engine registers
directly via CPU. Trust Zone may perform crypto operations simultaneously
resulting in a race condition. To remedy that, let's introduce support
for BAM locking/unlocking to the driver. The BAM driver will now wrap
any existing issued descriptor chains with additional descriptors
performing the locking when the client starts the transaction
(dmaengine_issue_pending()). The client wanting to profit from locking
needs to switch to performing register I/O over DMA and communicate the
address to which to perform the dummy writes via a call to
dmaengine_slave_config().

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
      crypto: qce - Include algapi.h in the core.h header
      crypto: qce - Remove unused ignore_buf
      crypto: qce - Simplify arguments of devm_qce_dma_request()
      crypto: qce - Use existing devres APIs in devm_qce_dma_request()
      crypto: qce - Map crypto memory for DMA
      crypto: qce - Add BAM DMA support for crypto register I/O
      crypto: qce - Communicate the base physical address to the dmaengine
      dmaengine: constify struct dma_descriptor_metadata_ops
      dmaengine: qcom: bam_dma: convert tasklet to a BH workqueue
      dmaengine: qcom: bam_dma: Extend the driver's device match data
      dmaengine: qcom: bam_dma: Add pipe_lock_supported flag support
      dmaengine: qcom: bam_dma: add support for BAM locking

 drivers/crypto/qce/aead.c       |   2 -
 drivers/crypto/qce/common.c     |  20 +++--
 drivers/crypto/qce/core.c       |  29 ++++++-
 drivers/crypto/qce/core.h       |  11 +++
 drivers/crypto/qce/dma.c        | 151 ++++++++++++++++++++++++++++++-------
 drivers/crypto/qce/dma.h        |  11 ++-
 drivers/crypto/qce/sha.c        |   2 -
 drivers/crypto/qce/skcipher.c   |   2 -
 drivers/dma/qcom/bam_dma.c      | 163 ++++++++++++++++++++++++++++++++++------
 drivers/dma/ti/k3-udma.c        |   2 +-
 drivers/dma/xilinx/xilinx_dma.c |   2 +-
 include/linux/dmaengine.h       |   2 +-
 12 files changed, 321 insertions(+), 76 deletions(-)
---
base-commit: d8cfb11ffd167a413269993d7e24d307ad47aa49
change-id: 20251103-qcom-qce-cmd-descr-c5e9b11fe609

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


