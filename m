Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D5ACD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 13:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iguqntH0XAVATIYTkYE5lY3ju0GJcUk/uklTpcBYCfU=; b=ktRYtyPH0s/CX3
	q5Wnwy6UCPuOl0VsZaOjylii+OEsXvZK7mkTmP80zUTEUYTM+Ma3dSn1jXeFL+A94+2tsuwzi9sw9
	9wg4lBg5rkLSwFdcOPLhou8qxttGJnkAMFAGRD2ZuP3Xk5i2QiYREzaYP1+in1iCrhxMkVlGJ8TAX
	R0TKDUnyrH2GWb0evNQ+0X7ZYGwKFfz0DqXObIO49AGLorf0Sw6znmNAFZ5yoVYGhey4UqXozEUKt
	Dy7qJwzk0mnlRwjIAlHw5CrdTS4GHG4LiTmCS4OPxKSyuOim/n8mVh3sTiXmDfqX6WAvSpR2X0Yoj
	oiN3v7DaPCYg1fvFhG8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZ6-000000020oS-34oF;
	Tue, 26 May 2026 13:11:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZ3-000000020nN-1i10
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 13:11:23 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsC0U2554555
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iguqntH0XAVATIYTkYE5lY
	3ju0GJcUk/uklTpcBYCfU=; b=oVUH4puryldQH3ThO3DWrt7bypSSoI1NKGuxbM
	XXD27NERJx4w5R6MXvTBjuYwTt6/DfzgRN9b8/d3Y891DdYcoKrS2W1zhtuu5KDx
	+6OXWhLhoKqS6vgwwwu2hH5yHr6lhvVSL4SI1h11R1l0JDO2OAwRvWtUP6uxUb0S
	w9+PpX9GP9e5TSi402+3O5yMjQfeICPcjS4ru6xzOqgt/5J9MeFN7zASF2z/imBd
	O+Tq67N6ZPhBG3uwfHyt3LGcWI6g7deev4b4P7glH5BKDorRimJ8lMzxAQJ4o99n
	Z3noYGg1M7hc1saKCgROVFaFimAjb3Ss2egaKCQVm5XT0gSA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3svvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:19 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4854350c0afso7132350b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 06:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779801079; x=1780405879; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iguqntH0XAVATIYTkYE5lY3ju0GJcUk/uklTpcBYCfU=;
        b=iXu7/D+iEP+XwugSZ727PxlUVs8a/aYKbZAU1lDKTUduc1P5Kg7StX4170GLDMlm/W
         8zEb9DW/cm0YcRCAEJ8dnLHqwRiExMvW0C1lmkT0tostWSaAoLiN99VPCYCvte+WOjih
         67QxUoSyFk0MBUnaD4UX5j4YW+dO6CG3qg+ZCGzGqWVmRR+mqG57ZZYLXWcabgPU2Jzj
         Tp4GGFlhUHvD34SDN26U15g87rbVMQwlOqifp/BSuPtz4XWQ84CUIynDrtTQIx3hAGzl
         J6rl26rwk9hzyZuvred6NMWduD4SL53sV5RSRjj0ub5SRgRTzIpcj92xof0fB9WA3bJY
         bn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801079; x=1780405879;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iguqntH0XAVATIYTkYE5lY3ju0GJcUk/uklTpcBYCfU=;
        b=ZEICrL4iLA5izlwOLHXsn7Zv0c9ECVrY7/9vgNE5POh1U70T9+5JaR1xZyGMitwxko
         6vUeUW+Lq2yZYh3cg/iGp1f1yEekOASAe5vkBGIwGPKcGvBA+dGQYusgjGOeUioc+ji3
         kYOQqO2E3r5hiFL/tIcYlw86e9zf6Uga40bRLdIOMP/77U1GNcLdDmgd4kxBvMx4C3rW
         vYRg6r6Wpb7wne7WhPL14zkTOYwSM458g+ESfLuVJxQNt69hNKVRZDXfFPTmkQkCL7Is
         eWE/QuXOfKJ1FGWloGfVqzggHFObgNLbRz8DgaxPUT/1JFw3cvmIEXD7ZWFjPQylNCZx
         13ng==
X-Forwarded-Encrypted: i=1; AFNElJ/SEr4M97q5Qu21mPgZh31d9LyLMn/QJp00Kq34NqhrFMxF83XHLpwixEegaWxTWIzJWJ54akffkn6/EYG6V2E0@lists.infradead.org
X-Gm-Message-State: AOJu0YwV7zFto9dYYlbUoa8ln0I7CTnk6zf0qZT9Vt1vBl/9MnzX1WHf
	y7TtOJqVUpupRotPOQIsYFC0IFpJgkLVgtYQAlKucMC4ufH/qdX30/Ljsmfeyt5Sli51hT+pHgr
	HGRzbTGO9zFrWeXSXwWC1SkevB5tbkmpu8HyTAun9V2hbi/DPDcrTsSWs7eX5DHAb7nTRepfTlT
	pzQA==
X-Gm-Gg: Acq92OHj2FhYp8zSba57RcxTAsF8vM19SQ+fNbSgEqmZMAVf/MTgpRh/LyGQu5sMefR
	LafffxZ+WyAPs6L0LQKrtRub4UM57AeCR9tRVUFKMTvRpTEV3JuS8W97ntTB8SrkzRzEgkdp0y9
	zkct//+JRl4qIvt+RVr2DQQ5yG/NnDmz3ycPHh1bXf6Gx4t3jxRJO9zh53m4Tgpsb6Py+VYckgp
	/LGn/GFmg9UO3HSN5O2x1TqVaNgPrsjL2jGbR+/QV6A93yfuCvb4vawyzaif3fp5K0j8jqpPNeq
	a3FFGvATL8/S/4YuHZdIh5c99ylPdeYmYE5YKTyl5p8sSwisr9U6fiAZ4Y+0n0eynGqdx82W72k
	Wh1XXa3cxbmx/IXXe9pyy94cISRehOfgKTwakPypmGu62ePyPQPY=
X-Received: by 2002:a05:6808:238c:b0:474:28c1:4877 with SMTP id 5614622812f47-4854a243accmr10250753b6e.39.1779801079072;
        Tue, 26 May 2026 06:11:19 -0700 (PDT)
X-Received: by 2002:a05:6808:238c:b0:474:28c1:4877 with SMTP id 5614622812f47-4854a243accmr10250725b6e.39.1779801078573;
        Tue, 26 May 2026 06:11:18 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm34259426f8f.30.2026.05.26.06.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:11:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v19 00/14] crypto/dmaengine: qce: introduce BAM locking and
 use DMA for register I/O
Date: Tue, 26 May 2026 15:10:48 +0200
Message-Id: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANibFWoC/3XTyW7DIBAA0F+JfK4jGPae8h9VD2yTWEriBrdWq
 yj/3nHUKJYKB5DYHjAD127KZchT97q5diXPwzSMZ2pw97Lp4sGf97kfEnV0wEBxzkR/ieOJqtz
 HU+pTnmLpo8oucI5ZM9fRwo+Scfi+q2/v1D4M0+dYfu6bzHbpfXC6xs22Z32OKUUPgoreHYezL
 +N2LPtu8Wa3MsBWDUeG8woNBOsMwD+DsycC3FURzkhBNFkGNMknuRunaXv58keafNpS9Wfxh6W
 ZYFC3OFnkcFQpSMugZcHKogNULSBLOIvCIOiMrGWJtWXqliCLOW1zkGijbFpyZYGoW3KJF416l
 JQZ04yXelqyFS+1ZNAGJTSnDCTTsvTKgsYd9WJJhYlHjyHElmWelmq9CUOWEl45JbkMxrUsu7K
 gccflpTtH38qBDh5r57rdbr9mVqTfpgMAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12772;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sbAZ0uSKUaRdnyGLlPY1ufhZQffFEqw4Dc+bpCN2u5o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFZviwy+7CeUn2mWnnD2IfjRJa1qnTq2rTbi4l
 eHenVJt1bmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahWb4gAKCRAFnS7L/zaE
 wymGD/0fXUlBAs2rECINXxr3FfMDnEGRrWBA1MNGB60FWnC8yt+khqbF/yOMOXQTQh8m8rS0TN0
 oe13vgamN+gwcMSbR8ydHWrFW5LtPU/qD+JxMUYN79nyDaqH8moBgXKlOmC2WmFnHwsX1FX8iIy
 ID95N2K4fiiIC2SGdGJtbWLmDB8yV0qWwVXOrOlG/T9Qr6Mzd/t9j833GctJgNbYjcw/LDYXYXN
 XOqJFKMetV+DmdL98mG/D2QWcZ6cen+nfGzswfFW5F4df3i6FoBWRdwRJyKEq+u0ms6QkxyRN+v
 wjGIARVDtmBKj33nW3gkEFwFocPLIHLvE1UrPdyYG4Urk6H6AgHn1oxTdJw/dWYYgjvumoguL7M
 NqhhYglEE9hvRscqI/NCTX7861PqUFU2RHtSW+/b5+EmyUW5wApgfVXYn8a6F8Bzulkw+NHO/d0
 td03jOF1ZH98GY0VojjEq6V4TjnDsNx+3BMXXd9ASTlWyHVsYx3iPX7o75Wx25ZuA+RL6Q9du2m
 s45bM17YRIttiEeBv2Jefj/uXoJSO8bR0TaH5tGaXc26DrctYO/RPJn0CNJKlKeTNJtFPAqvl5v
 lraxwJ93PVxquimX3d+F895aqfEeWNljRRjQNHelRgOzmTflS3pAses/MruCtT5/Uo1QCEHJwxN
 DPLQeR9f0sBoKNQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExMyBTYWx0ZWRfXztjxRQvAGJaT
 TmNNcAPEwSSNIZM5AbBysAPOQ5LusoWFKAKiEjUokgwdQ9JAOcdiadh0gOW4uwK5qHKroFhZZFU
 4sMTSEPyllGNtqGNoMgQlYOSLN5VEjxMOMYw46Z8DT2GX59hJqGruGOoKv+sPKefVZQmL9ijzWL
 /2ILp4MMEuJiOAwhRQmFlCLmcWAQDmbrJDXXMzNZa0z9yODA0TuUaRM/VIFUJPCo8yD8hK+0Ttj
 Ta+zUjtN8c2L+2cCBUoo4pAzlTgAfRPbsv/qV79UK9zrguSvxZgsk0R99MvPBo/6FB213ztZmG6
 iytfdQtSySJNM9LFYvTMuG34cJe1oEfYYlf3+WLG9COLuRaYpntUvaWq7zalxeFaSRge40QnoTc
 wB+c6YZnnUWz4veWReeNZ2cFr0QVST2ZSwHVaDNJQF2geEExd+FwCihvhRtPotLe0B2R5YM0inQ
 /weI1WhfV3YBy7RrPuQ==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a159bf7 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=mYVGbHsXlysWdROdmYcA:9 a=jo0wICh4R9D0jo7k:21 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: A2vtS51ldIORbl6E8Qealnj-eIW6f5l-
X-Proofpoint-GUID: A2vtS51ldIORbl6E8Qealnj-eIW6f5l-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_061121_603994_78B61D9E 
X-CRM114-Status: GOOD (  34.84  )
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

I feel like I fell into the trap of trying to address pre-existing
issues reported by sashiko and in the process provoking more reports so
let this be the last iteration where I do this. Vinod can we get this
queued for v7.2 now and iron out any previously existing problems in
tree?

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
 drivers/crypto/qce/core.c        |  39 ++++++-
 drivers/crypto/qce/core.h        |   7 ++
 drivers/crypto/qce/dma.c         | 168 ++++++++++++++++++++++++-----
 drivers/crypto/qce/dma.h         |  11 +-
 drivers/crypto/qce/sha.c         |  10 +-
 drivers/crypto/qce/skcipher.c    |  10 +-
 drivers/dma/qcom/bam_dma.c       | 227 +++++++++++++++++++++++++++++++++------
 drivers/dma/ti/k3-udma.c         |   2 +-
 drivers/dma/xilinx/xilinx_dma.c  |   2 +-
 include/linux/dma/qcom_bam_dma.h |  14 +++
 include/linux/dmaengine.h        |   2 +-
 13 files changed, 427 insertions(+), 95 deletions(-)
---
base-commit: def113ae602a35ab7a1dc42a6c43188e180287be
change-id: 20251103-qcom-qce-cmd-descr-c5e9b11fe609

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


