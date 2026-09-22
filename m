Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22987C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tmpneQVB4OWcXyv0z/2Bcq0vGeEFiuJNYvYu0fNYIg=; b=PihoGYYeZRAJH5v2nHe6ppzkIl
	iwYaVBa+ep/qjePDW0zs8GH6VX38HmDsf5OBfEzidRV9PFsRfnxJGg3lCSIIzwaO0ELZDsOXZ1WJz
	nU6nAGIdnEA2RUePr7BnVpB4iD6Mb6JC2dPjOhLPFV1T2rdecIXGqr0QB6gPwoo0tvGno6otsQu76
	dTNEYgXOJSOfLk00EZeoptRYkFR2eFDanZPmVFy2sDBA5tCwmLfbSOAwaJNVQH+Eteyje5zIcWgC4
	yhJIBnY5VDFmzmMpLKeG5mRnQHrHVoZ6ZW4aLS5ni/eoyMNUapAbs8QzdcdiAb5Q8u6c3fxtXYUrf
	AG6Zugqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x904R-00000005Nx9-1zCK;
	Tue, 22 Sep 2026 12:58:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x904F-00000005NqM-1val
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:57:52 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPYtH3671747
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+tmpneQVB4OWcXyv0z/2Bcq0vGeEFiuJNYvYu0fNYIg=; b=n3CofNf69AX7BkI+
	d001WuCFTC6oShrxBmBYIvCrI4mBHQss8e2doTs9nDRdHgCG3VX4KD7RgxfLIB7n
	QJLAKEDcm0Z0KtlnNgdbhgNQ0mAbP7zJMDGhFCoqm9uzDJiST/ETr1p/T2d9DrX6
	dJWW7WoBiZcSGqTnMg0jkQFIo8L/ST731k8P3dZL2H47PxeH5f/epCixjSBjCg1E
	lwcihGoyP2t1/oUy7OTt3OIhMQaHmZRdj6czwahYmmlMyAU6CuAuXx7XtYJ5SlBS
	O0xf1UDF51roc9SSSZanyBtVjFpUoFGvw2OUpW0c6tg3e3Dm1O5lXYVqgnE1bXif
	9aOEPg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurnt8db8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:57:50 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c9c4d303caso2931693e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 05:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081870; x=1790686670; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+tmpneQVB4OWcXyv0z/2Bcq0vGeEFiuJNYvYu0fNYIg=;
        b=OtbkDtIwEuJ565BDqsRxwLScc+I9bTPARkjbbcTeJAsWE1Y/u8F4VUp9HKttmNnJAq
         skpKkcSuDeMB58JOI0MEbXOBdB3UYrTrnbN8LMFwbRlqpABHP3/2Ogjvz4Lnes8CuqjE
         xBbavhNm29kjMkvg9QrNjWQOmdRpnZYmDDdJoYdiBxIsbUX1durnHtbN261PCoOvKNpf
         eoC0vOKr1PV72uTPBhFC2DidqD5xvnghphmcswysAJ/DupL94y170PoS9pDLZpLQik/R
         IUS1SYnxTzerWaycigUd+0Boeg7kqZA+CH+k/kmfc1Ecqo2XvY4kgBCYAuoeBm9d/YBH
         NHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081870; x=1790686670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+tmpneQVB4OWcXyv0z/2Bcq0vGeEFiuJNYvYu0fNYIg=;
        b=q5ENzPp5mF+uHJcER/KWWPnX9rrEpvN2pq1UmbmQWkEooA5YrE13ndioWL1zjVkqLH
         EC7fOf+vkVm/v5N5ZL1nWhtB8VIuXmype8Kwl6aPTfsNvPv0x/zSbkt/zoHNxYE+O5nH
         Ety6IHuGcIbDPKPkXq0II3OCIxKWLtwrkypL7IgLxly2ztzhuoZA69AnsxjWm4cTilHZ
         rbh4OMc8hJKqMVhu6N0eMU8Rvz9W5rGpGamc8EPPEXYdUAC4VQydPF0MQ74ZJjh7AEzP
         6ckgxyUyEWGC8PMrj5QavgSETvSTOzrxxWtYlaHIFuj0a52imDQriotQPqwAbPg+BLQQ
         R82A==
X-Forwarded-Encrypted: i=1; AKwUvBzKVkR5WzGl4jINXjjlGsxAY74rRoN09mGdwk+OrURo36mkXOmpFEb8dBZgzt+d+et+A6hFpbxf6K5CyvZQ2nnN@lists.infradead.org
X-Gm-Message-State: AFuF++l6AdwBbE4gTUt9d8/JY9TmXGYM82dJH9cgUVwVzNdc4YrRf6MJ
	x3iCOY+cPExPgvwS3bjQF8RBKnIuwlBKPdEyI1I1IcIffXuGJKHQguHVfMjWabpcWDbwtOa8ZSp
	SVxgea0pZ3e7sPDVcjTlM6JrrcwG3lbDr9Gxu//qi22SU4ILMV6q/RA8zbsV5B5Pvn7jtWHpWHA
	HJug==
X-Gm-Gg: AYBFou3XMv5lO0/nmeYEBIY6bvgTmiyTCezHA2WthJbJYHAg7EuDJ6LJzeCdLckLhcO
	xOC9LfBB7vxVgRm2zGK18vpMiGMexCZMgqVfrNFMTt0gGShphnyfv5GXq/GiFny4sDHPOxVly/T
	lhPouU9V+s04H5aEnbGJabrwNKFHoKCMkUpW4au37gZMWH4uF93qWT8eltdKtCzPvHcwPH5ttHI
	T9ZOMbhvRloCcJ19FyjpPF2Py07QhGf6jI46QK1hWptTfKMzaqBGozPGbx77domZscqvhE5kxx1
	8fMsOTSnf/ng+np35HVvmeMWDCbhhSBBbFJMZlfrNWsdv11dJNUkxrAD33goLb05Dh9+QwXanx+
	ushYsSbwT7NSfxVOIJUNJ1X6o0Ao=
X-Received: by 2002:a05:6122:1c02:b0:5bd:71cf:e97e with SMTP id 71dfb90a1353d-5c9b58caf66mr7590747e0c.5.1790081869850;
        Tue, 22 Sep 2026 05:57:49 -0700 (PDT)
X-Received: by 2002:a05:6122:1c02:b0:5bd:71cf:e97e with SMTP id 71dfb90a1353d-5c9b58caf66mr7590713e0c.5.1790081869390;
        Tue, 22 Sep 2026 05:57:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4537b5dsm1097669a12.30.2026.09.22.05.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:57:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:57:18 +0200
Subject: [PATCH v9 03/14] crypto: qce - Fix CTR-AES for partial block
 requests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qce-fix-self-tests-v9-3-b1aa742e79af@oss.qualcomm.com>
References: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
In-Reply-To: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
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
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3299;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zIbsmodNrd/Ar66AXytQCbkfJGL7e12+q42vj5mvYqA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsns4BI9SE0NByBue052dzl+vj4VvGjDm4HHUK
 CU+HjvXlyKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarJ7OAAKCRAFnS7L/zaE
 w5kFD/0VsuEoiaC+N2wsBqm5UDVtvpVOuSrdrdXVx0OD8PhHo2mjCPynJjtPyvYR724NyKG9ZC0
 nHCKXBKZcnI1WP0OT0Hai7Msx5MSajxZfmyhz4zgJVcmiruJEBihSXBSrGQuomUbH7/GNgXMmxq
 EiEk0q/ycBwdVTt8Qpw2zhtNIbYqXvmGVNqx5ahYETbYx/CJTqxU1lcsw4Ncqq706pU/Hq9ZRwM
 Pu1I0fm2oTenvqTQe7xsPZ6h4fhnNxYPth8FUPaL2KmczCWYD1QILmdLeAkocJL0tecVnw3RxfL
 b5L7Up3XiS53TF1/tUB3VBHK8caV3mLd9YAym/Y5LaRM6lvPWHoAHFkbW2I33+keeOZh/CH5rhj
 88y7ZIhmtSoTpKmD4+dwZGHBEdbBjb0k0M8tU0X8ZVdVgTowmn08BWfGzFog8Q6yLB2LhLzfHNO
 qL2wOOHUhnsq6uzSySRu/OrE4STKvu0S0J3xcLjmVT2c64SwwojTFF365Z3Qn5lyRYKfC1YEN9K
 s7V2j3dMRcCQnTKLv6ELSmMF0VbRzD1oHhkvY0whrxDHeylnQ2FdhjDu3uZh7tJlmoz6KHoa3os
 PzBXHn6Kzn1EJVchRV33LdaMBRM+PTgvdO+pzND9e9OVjUd/rULDxa32K2QwmHCoDTOQk50OmFP
 hOCsqqymY0gX1Fw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: YvTqzc2vi8Q6KhQZn49jjY6LBSB21pMU
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab27b4e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Y2NcAOke46LZopEJyX0A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX4lgdCL0sU01r
 VJ6m5qdnJWVjZ4evTs6HTY5MnpwNaALSVIFl2WDdq10b8mmaBfvODE1qd4GJPf+kEJlyKYanFZS
 qzHgRrN1v+9uB/pubDK+WX7uMDS7vYxSJ+rwwwVT8kM5CYL7L82RvuKSNZbnUUaM8/8Sa/x//g7
 8PMUaLgtZDWYX4JXEMoXeH9RSHSI+urgTFXMTDSTii4cTNSEKvAcCMv5Tt4DGzKWnyETkFj6MtO
 qqwGrcSYlpCtuoCt+ftmhU7CeSngdAY4YzVsDAZDXqUTvqDfIqzzvFtSTSLwcbNo8v/MIoPDQO2
 N69/2vdnw4Npg8UwOwy6X4BFg+AWdK6haIkhtVnbPEPBJBBAAj6slh+nUxUSBd22f1AC6zvfecg
 o2zdS21wfaHgfv9uNPvyW88LtdnuhYPwMuAUnqN032HdKC5xNHRnv7jM2kxy2Je5LMAq9gorRyt
 aVNUJd1MyFZZZLQshPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX47od27RLhjcb
 HC+t2ypj62E8UfeP0eXu3RBk/IlPq/PtrJc977iBcdJC71mlc+TAl+SJBF0K7tzk5JY6xfT0taN
 l3yjVyiqKdMosi2Jsy2sDPCXsmK8Nk4=
X-Proofpoint-GUID: YvTqzc2vi8Q6KhQZn49jjY6LBSB21pMU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_055751_855009_D623574D 
X-CRM114-Status: GOOD (  22.42  )
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
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index f177062eb735148561f798d0d3e65265f3235da8..ec2f21446cee9dd4a5e3a73879925ebbcafe0548 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -33,6 +33,7 @@ static void qce_skcipher_done(void *data)
 	struct qce_device *qce = tmpl->qce;
 	struct qce_result_dump *result_buf = qce->dma.result_buf;
 	enum dma_data_direction dir_src, dir_dst;
+	unsigned int blocks;
 	u32 status;
 	int error;
 	bool diff_dst;
@@ -56,7 +57,21 @@ static void qce_skcipher_done(void *data)
 	if (error < 0)
 		dev_dbg(qce->dev, "skcipher operation error (%x)\n", status);
 
-	memcpy(rctx->iv, result_buf->encr_cntr_iv, rctx->ivsize);
+	if (IS_CTR(rctx->flags)) {
+		/*
+		 * QCE hardware does not increment the counter for a partial
+		 * final block. Increment it in software so that iv_out
+		 * reflects the correct next counter value expected by the CTR
+		 * mode.
+		 */
+		blocks = DIV_ROUND_UP(rctx->cryptlen, AES_BLOCK_SIZE);
+
+		while (blocks--)
+			crypto_inc(rctx->iv, rctx->ivsize);
+	} else {
+		memcpy(rctx->iv, result_buf->encr_cntr_iv, rctx->ivsize);
+	}
+
 	qce->async_req_done(tmpl->qce, error);
 }
 

-- 
2.47.3


