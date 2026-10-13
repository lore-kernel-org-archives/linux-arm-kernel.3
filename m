Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB48CC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OtHpmGKrg2BE9xI0hOUoPVHguAoJPwSTIJj7uW32WVI=; b=Tx4h2a7tx3DbdbbXy5i0oLII87
	kPHMcF4m14XV7p8zfYEO45LgzoICuk+JbldiWpKpzKmEe8uQVi04DnO4qXy0sE5dE0afoqJnqoBD+
	buw6Pd7poRDA7LstR42F2eE9gKoqt2P8CvuEYg13IbgSbeXWJDKXdCH4mg6RO++0V7tzvLOJJPerZ
	4+FS4DPNc9r4z5QEOgRJvbW0PkRy2mTnjJx2Wogvd6EeWUlIISQvGUeZvUvt92HtWt2oP7aLW18jN
	YqZdEiiZVzr6eykFONYqT7jlPnnNk2zj3B6al+dvsU5HMMAHlN9Nsm8/5gTQ/RUNCGvWUapBVbubn
	G4amauPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZGy-0000000CUT0-2mX7;
	Tue, 13 Oct 2026 09:58:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZGt-0000000CUPX-31B2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:58:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OauS015566
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OtHpmGKrg2BE9xI0hOUoPVHguAoJPwSTIJj7uW32WVI=; b=StkXkT5j8AxukhgJ
	ZanTdktwyuynQxlViCCmjXKve+gKrMmF9AIoGabvbzHrsa1sA642EbKqIHtmt2Xm
	bGJDXA66qJtVk6WQ6f9H3H5cqtrrRF4CHaQ8alb2rJT/U7PPc5PX3v37HNO4RWu+
	GUgCto5YJu4QSqd0iJ/RFF73+RnLkmh1b/V7QfUhuJYB4o4n18KgpnlUKW2IeDaD
	8IMksU+KNMIQiotMUZR4E6QAqFvPUNGPg68l9F8CXBbZzmbJiDdCLaB+OaAwdyrI
	kgy8ffboTmUe1Xj9qpSQ5SvxNzoobBnRkWobVcGegF2M0yCp/vKQj5XafV3CchwC
	XKfiPw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7ugmk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5339739b343so60415521cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 02:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885490; x=1792490290; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtHpmGKrg2BE9xI0hOUoPVHguAoJPwSTIJj7uW32WVI=;
        b=LTopRkmFmwSGE4dT6cep2sSNmvBHB/bJ1xkVWsH/iIZcbDHqHaczvaUCV6G7S+yagI
         nrprJNdSCBIW/ejaAyc8J+lZ2taUjZq6vmGN2OS+Srw1HzJMIs3pHW01nr1CgQ+UwTCK
         LeSpt7YuMOU7mywQEZv/j6lpk7N1SyL9Jummd9RHWDNA+VkbHk7q5Mn9JP6rdteQ3bi7
         P327gfPq81gT9jzMFkqEu6I712o1d24gMR4+jGQ1vJ/j493nwmfhyfHjALZW2Q2uo4Nk
         eAphrdjmtycHvirC/5cVod1ZGsn+F/Fx5Vs9YSz3Lqd/14WZMEqP0TP4/QzdMawCZqN4
         kIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885490; x=1792490290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OtHpmGKrg2BE9xI0hOUoPVHguAoJPwSTIJj7uW32WVI=;
        b=b9c1RS1Aysqm7w1OWCh3wgg/voJqTWwv5841oYezvtezmw4V2bAp8+wqYZ8pBRdwmN
         ISY+XX6fCh8fB3NDRl5Dv3AaBJ+ladvIXotIp0+djpe8Vy30GjRvgFQ8/fSx16esK6kd
         KFTZiyq+TZioIa1sFovSVEbvBmDrzkl/0TVndA9r5uDnSku0qY3xn9BUdB12t1LwAMAr
         c4Ne34XsnyVR5501rv9qb+y98CvTwDufU2aWTTQunnKKrffnLf2fq8uvKv/nL0LF3hSS
         dLB0iuVnYxe5MfhTZlrmuagP6KMUEAdPdZbgp2SbcmDgK9ToUqk1dFuRMo7RppIesT2T
         D6vQ==
X-Forwarded-Encrypted: i=1; AKwUvByB6vzFOyWxxuyqRBMK/d/TJfsjuKh66wH+G+YWu7z9wjIkM0teQDb1YX6yNc7dBNqklfp9LP5SfytPr1M8FNNg@lists.infradead.org
X-Gm-Message-State: AFq9FYLpIIcyil01El/lE0c+YrHWDoH2PQUv2BYke/d3VT6mvPcth9ys
	xj8c96ZBK9+dNBuJnT1eC8GDgr81Z7iexkY0G151MvT/UXDZopTxUahvHoH9LNm2f7RqM6ZAvHu
	U+6fLnRGI3ULQBkbHtVKFfgzmBmjI3TT6fWTvZDhmKCCXL/DfiCbKDyuJNjBBKT80yUS1E2gu67
	7zKw==
X-Gm-Gg: AYBFou2sBSCmR/XcZlCG39GoTl9NzSfTGDXdLJfHc66DlmKQXCi6o8qUaFAqZKK/sH1
	k+0uBcYLWkhHydJTqJGIj4yqPmcMtuY8VJiSzDobujIlyNk6bcWLzZT0hq9HYM8sSf0WoBCk7tu
	95yLJ4PY6Pp3w6aZA+NuCZZ/Ihx3aC3U7k3Iz5rj+TaT858+7p12YMC5c5JGwMFqtc0SJ68NmC4
	LSui3jZ3+Z0n2BD2YxCMwOfnNLFPRkJjJIHnRAuReOtM0rj1f2NQ3nLxdBjCUK95jr8K1JD2Ned
	RG36awW1n4zxpRT1QEu5O3PLkfRmDV+8o//GCPxOlyK6oD/eSoCRR1Gjtv1Hex14I2+CBrb8eZI
	KCtR7ziXm0+puju40WHScEusRbxMO
X-Received: by 2002:a05:620a:3956:b0:93e:9792:fd47 with SMTP id af79cd13be357-93ebd0c2423mr1851232685a.4.1791885489961;
        Tue, 13 Oct 2026 02:58:09 -0700 (PDT)
X-Received: by 2002:a05:620a:3956:b0:93e:9792:fd47 with SMTP id af79cd13be357-93ebd0c2423mr1851229185a.4.1791885489454;
        Tue, 13 Oct 2026 02:58:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:32 +0200
Subject: [PATCH v10 03/14] crypto: qce - Fix CTR-AES for partial block
 requests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-3-57162a38a554@oss.qualcomm.com>
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
In-Reply-To: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org, Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2934;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=AHcm2z2kVXAcha0bgo99T4rtQad4LJa2JNe/bUUBrP8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgCcEQMHEtCWQDQPma4fD58ybalytD9wKQ4PX
 FjKqsxoioGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4AnAAKCRAFnS7L/zaE
 w4ifD/4iXDDtlX4vBwZCFJjsF7kwY6R/A8EHMcnTpM0VwM6TkByDByL3lofHJVStc+/Pf0ofp77
 iskEBqCyG5Mlk5t6Nrxuui6Sw/70hVBd4suzGcnf476FxPSgfFUXypk7iU2FxxI2JjlLRSfg1vy
 TF5XdeIimSr/ANs6pNWD8PwujzwWm8Fcl2NuHPRWvB1MxKj+A/4c92w50qLSWryau+Uk26Mj8Kp
 NYP3hZyFem7e26ij76CVi/DypgiS6RFi3aMNhqKK2CSjmPsCmr31f3KCj6lu7jOAjowfT/T96ah
 iHrtIwOcJkkDzOq21LE72F6HtrA78B1j4HSxt2+TRJ/Z67H04wPCidbcLhhmyEfXD0QoGmhY91k
 WD4E1YI5qNiiHbSYJwaVw5LK8ZOVEQp2Yun5c2kLGAUYzEF4euEqbBCMaFoiKShzX3XgdUYkcvL
 msc77H18pnhb+0pb32BoDd68hObVGjxF2R4o+BIvwMJRyzc4GnOMZYWfcazIP+9FseB5MDUPtBw
 CTE5kKDNV64CCPOwYtv2/AmxWdS31c9dQTmrq3vJyt1ZR/ZpA05ftrVquAjAvt/xou+oDVFrGLH
 Faaw6V1tVuu/CfiGAv5Nsv/NK/l+LmGpBRzlgjOyQE5Zw6dbOuHcJWH8khKY5sPIDZ9wi2ynTmN
 9l0RNtyifdeXMeA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfXwRLBAStUDNcR
 Kw8dZHXlcMk5UIAzj8tEp8POs71d4NJKqz9GIECv1RjEnDcn3gFrxShPoDj1yJrZ549Fse5gipx
 E66m+sGehEV9rA9QUqoEIz8iHnpvERIQDTsk35f9LeSMyYDPD3GRn0nybQMGbySyMX74vclzlue
 bEnXw+7stUCTMt1Tqd0hrnd0gotWXmRQ86i3tqodrrBNrWo0+K6DxKWdLE53MqwIP1dTSvVX0Ji
 t03sNH5nS+AffFsu+iyGRVQhWy5DgT5AbAxl0bRNw+0tei/YBSDwoQ9SnRyQIkiTHxLyBomuODM
 /WqqK0iAxpDPuKiHWjvdTc9kiG5d317i/o1ggu/nnvgrQd32H5pAOSW+whe0kAm6zlSLA4Z0NJI
 sazjg7xXo3f5LUGK+4S9QaoVPaxPYFElpx94pUAvZn7d0l1P0tl797SOixjg+aRoYwC72E43jtW
 +UKkrv0aykPwVN4IIGg==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace00b3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Ida2_KdOZ2FwM6MSgQEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: bELNJ0rXI7LC2V481bbxSCM467lPo-Vj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX4TFmv45Dc/fb
 oCNpAmXotp2wYSOdy+UlNuN9b0bze3f1v2OSYqSrJ+1sOSqN9JKmdwSoHpecVv5VJz3XjEYbOzj
 W1BufZit571a4rKuZuu85ehERsiO+C4=
X-Proofpoint-GUID: bELNJ0rXI7LC2V481bbxSCM467lPo-Vj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_025811_773760_E383B7E9 
X-CRM114-Status: GOOD (  19.96  )
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

From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

In CTR mode, the IV acts as the initial counter block.
APer NIST SP 800-38A, after a CTR mode operation the next unused counter
value is:

IV_next = IV_in + ceil(cryptlen / AES_BLOCK_SIZE)

The skcipher requires req->iv to hold this updated counter on
completion, ensuring chained requests produce correct results.

Referring to Crypto6.0 documentation, Section 2.2.5 says:
"The count value increments automatically once per block of data (in
AES, a block is 16 bytes) based on the value in the
CRYPTO_ENCR_CNTR_MASK registers."

QCE increments internal counter register once per full 16-byte block(for
ctr-aes) is processed. In case of partial request length, the hardware
uses the current counter to generate keystreams but does not increment
the counter register afterwards. So the counter value written in
CRYPTO_ENCR_CNTRn_IVn later once read by software is one less than the
expected value.

Crypto selftest framework capture this scenario with test vector
4 comprising of a 499-byte payload (31 full blocks + 3 partial bytes).
Error:
[    5.606169] alg: skcipher: ctr-aes-qce encryption test failed (wrong output IV) on test vector 4, cfg="in-place (one sglist)"
[    5.606176] 00000000: e7 82 1d b8 53 11 ac 47 e2 7d 18 d6 71 0c a7 61
[    5.606192] alg: self-tests for ctr(aes) using ctr-aes-qce failed (rc=-22)
Expected iv_out: 0x62 (iv_in + 32)
Obtained iv_out: 0x61 (iv_in + 31, partial block not counted)

To fix this, just increase the counter value for partial block requests
by 1 and for the full block size requests, don't take any action as
expected value is already returned by the hardware.

Cc: stable@vger.kernel.org
Fixes: 3e806a12d10a ("crypto: qce - update the skcipher IV")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index f177062eb735148561f798d0d3e65265f3235da8..86e3184812e061943822928a805d542004347ca4 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -57,6 +57,14 @@ static void qce_skcipher_done(void *data)
 		dev_dbg(qce->dev, "skcipher operation error (%x)\n", status);
 
 	memcpy(rctx->iv, result_buf->encr_cntr_iv, rctx->ivsize);
+
+	/*
+	 * QCE hardware does not count a partial final block, so the counter it
+	 * reports is one short of the value CTR mode expects for iv_out.
+	 */
+	if (IS_CTR(rctx->flags) && !IS_ALIGNED(rctx->cryptlen, AES_BLOCK_SIZE))
+		crypto_inc(rctx->iv, rctx->ivsize);
+
 	qce->async_req_done(tmpl->qce, error);
 }
 

-- 
2.47.3


