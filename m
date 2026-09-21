Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5BEC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AEL9cOLkbb0sELjP3bPIpNHAEuCYXD2Bf0vsGddneIo=; b=Ca52QmLDje1hAfYkbYD7JWCRa8
	vSdUWzR04WVlgGACLqQeHAjI/VnADc6uf0EPEx4/5LSw4fJmqQJZB28FhWwaGniPv4xxFYtGgcyWY
	t2gSrUXUgAixdhqNIf3URGiMHEUERwzFDkP+mdYHTvc4kWm/oWyMrwbVGlTerMYQlIjZc87Xdcpjy
	eQ2stPvA/ipCDc6Y//qZB9UGxceljVWS4FARPheUl9jfF3hQJhVnv0rVKzLAW7cMUuDzqho2vCOzW
	5Fx1ulkLqmEjbWOOixKNiH69G14UocWLvJISLgk1eAcuuUGG383M9v8VQHZrMs6gYAX767Fh4ao8I
	7Tc5YVjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dcK-00000002Adn-1poJ;
	Mon, 21 Sep 2026 12:59:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dbx-00000002AQo-0vPk
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 12:59:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AEL9cOLkbb0sELjP3bPIpNHAEuCYXD2Bf0vsGddneIo=; b=KQYyG5J6fJlr07Cf9joPH2Jjpq
	As24D/5aCoechbvKXaglZMkJk7xSBYjObGKJT6jns4eVOZ92qZqEpJ90CYr1lRYAnH5SNuqQSgPNY
	Kz8sv7wqmZ1AumGucGjAlW619GApaQJk75JW1uwSBlsoScoGbZiJCf57qoTTCRka0l0ne0l8ps7GP
	yZkl5dFlK2mATvCk7rTbzvQp5R8Sme9y73xLxUfoluoyIigbCD2ASVp0zS+FkuCb2PPBjbCpkj8Dj
	DI1db8z87CEt/VelMUyAZ17D4Azh8THq2nf9blE2Vnn63R11dEDvtTvfAOxKKSFjeN8L1tjLf7N0D
	pqlDCk9A==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8dbn-0000000CJBB-1Fsx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:59:07 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdpJo1217743
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AEL9cOLkbb0sELjP3bPIpNHAEuCYXD2Bf0vsGddneIo=; b=Ag5dRETs4yzbd/I3
	muOajTYWnmgVr0KNplJrjVPfcqw6dqgFhdrJDO8ZlDHGv4UfeBm1B8E+9jF7JjJu
	98ne9cw1CXAad1bmU282PFRxGkTBmYJv91mJ705h47lCVUTHYkW0lWrhjf0MmWSH
	x2TZwgS7m5GtBLiixnfCi/V+AqhnJWT7kk39ZLxQQN6o2R4XWtn8Ux6c46LcyQwp
	RjLcWvAsuwk5Ah6hzBEt+BNGYws3p4FKHQzVrS7rtoq1j+jyM9KfVaaBFvYSicSG
	kSdAQGFhrLx4IIjir/ODkk8RPWALZDdXKcQNfN83tmftznPIMhl0zsyv0wjfWRnW
	zXC3Xw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0119bbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:58:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so458453685a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 05:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789995537; x=1790600337; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AEL9cOLkbb0sELjP3bPIpNHAEuCYXD2Bf0vsGddneIo=;
        b=YlajeUKcou4tYKSvn7UtSzcbj6OhiubstHAFiQwT06kTPlJEi3Kk+Au+zbHT27g1Fk
         MT1/mF6HYyQMuH6NAu7sO2BttckuKw4I0jT4VfRoBm8zvnyWh39YTOTrP5dSlUjnTiDf
         eRhiNkhYFRPxUaZT8eMUQKkPkdSLXE46nxxplWZBwfIJFY8gbJ50cVzqZnlDj3CoAOs/
         Y9SkIb8taZQY+I+EhTv6ubuShcjS/jDWO1t4BCbDoX7ixghZt1gasfZo1lbLQpU+lj+a
         hAJKNU+khAJkG7SVfuulEgoMpItljoPE17SBs9d2iGikcn8LnR35eJ7UF5SchZCqC31A
         Zr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995537; x=1790600337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AEL9cOLkbb0sELjP3bPIpNHAEuCYXD2Bf0vsGddneIo=;
        b=tyzqLdOa0DUSxIYBDC+N5y/03tpcFROEtI7MCu3bpt+rU97UGpLmDwPAvrH5fRE+o6
         4//dvmplupl3uYQxh8SxfXzISp8mZNsbMdaSP51d+Kmso/KeU9JnhdIR598jUbCqu5TO
         crcaNFNrAfFGjTSxG7Cy7Z7xKRTJYXT/OKCbzvSbp2WhhkIfZWF43DwfmZokGuYpyhKp
         akQ6Pamlcc/u9YTU3ZKU6umTC1GMecMxb28ml5WmcGA83zD3nbGeIMeuqWfIgdUL4f7C
         jOd3J0ezGd7pspiX7PT1MFkipFyEgoiRb5Ir8p8LCd7eK1Elm2Vbung+N5jJTZrQa6cd
         5tWw==
X-Forwarded-Encrypted: i=1; AKwUvBw/bkfAwZCksYdw7v6KZC9PkJR673kGjmN1lZcHnPz+KO1/SOEm+4DTwkJKwEzewtX29fA7PXtuaUxp1bUT5I8R@lists.infradead.org
X-Gm-Message-State: AFuF++kjfbjct+lZNxgV96wAn+PnRpr9PV381OZjyDaq61zY9ohA28vb
	LBowkVsgZ82Sa7bWB92/uIAUI6M5k7FX9DtKIlK79C/yRYQX60BcDrXT1byx/l8+6f6PPYmWzx2
	lvon3XMaVphURtjsl0cwmILZAzIr4WmLQGpHbJUQ8nKzBArX6guWstqXFbTZvqEQWy8Gr17XNsL
	QOpg==
X-Gm-Gg: AYBFou1kEoT4FcJEkzt2teoi+Dz3LHyk7swJZW7abiUx1Cv+1YCVltvSmjZOlniNzkX
	Tv2s2Om25hAVP4VS3yoDrBMiB1J/huSogV2OMyhNko14Qi70e/HAXsIlZpgptZWf2rN3e9YdT7w
	/Kb0s/7p3TEIXHz4fG7EpCb5ImVFwA1yOT5Y8XqGVeC/FmDONG1Vavut67Q0WH2UAJT9pwOTrXC
	UcQem31ezcqN4f3j8opDn+ryVkZtucX4G5Pq+GtF8LuIg2KZuIOcfFpsmOeHk4oxsmlD5mjDUtl
	8weiKcKXIm4QvJLNgc3ca+4Fvt5PfwNGuT/22T68hYxNE/xm7exABlxQ1VAlhRceSJFXaNiIVFJ
	QxD5yb+hQEy79ur/l4oJ15KEhjOw=
X-Received: by 2002:a05:620a:701a:b0:939:6a:a71e with SMTP id af79cd13be357-93c15d9198cmr51642885a.21.1789995537213;
        Mon, 21 Sep 2026 05:58:57 -0700 (PDT)
X-Received: by 2002:a05:620a:701a:b0:939:6a:a71e with SMTP id af79cd13be357-93c15d9198cmr51637985a.21.1789995536815;
        Mon, 21 Sep 2026 05:58:56 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm320278766b.63.2026.09.21.05.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:58:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:58:17 +0200
Subject: [PATCH v8 08/14] crypto: qce - Use fallback for CCM with a
 fragmented payload
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-qce-fix-self-tests-v8-8-107537869a72@oss.qualcomm.com>
References: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
In-Reply-To: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2908;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=IJdDm4DV2stdnBPHtaq11uqEmO9kKVnIjpfyisSRYII=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsSnxUdKIQbn30Wr6jm9HbMHDt5xoh1FVftHXo
 OfD/ESCrnmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEp8QAKCRAFnS7L/zaE
 wx/rD/9/w5RK7R3qv59uB5ZKSYkJD4KfqaUj4FguyKfvfNwrZ7hPt7lF829dTNBYolnwWM+4zH0
 AYD+6nNRJu0UnE4r6nhKIyOVIQZZRPfv6Gx6hMLCACsK5slCgjetxmVRmu2+tnSb0q2Mq34nNF0
 kgj+90QvbVXngW2BYbHa961jyJ+dOz/eb858t0IpkszPk4WRKMvUMmOlWuPVyR8IkmF9digEaSx
 xLIo2naQcomCCdOxxK1AWsr0IpAj9m8mTHYQMd4hL4MfrZXW/ReqFLKU/lCJM+Q6A0mGg3pmLHT
 3cZssHxkVJI8RiaBWWEhctMRZzIvr5YbfC4QLlKrzGVnijy1SPwcz7d3szbDVIe5hbIbXikYFVV
 HRthcl4vVr7TEafu352fxhSdFtbT5/Q0zyprhnWglmOze57el0rF83P6k6JZsN5TK++P+Vc5x8l
 oRMwqaMyiQNCg/1qFD7lWr2lzOyW6/8ANfCnxBhR4PyMuLKu2c0JgP7cFLmiFAcu+4stOV0riIk
 HK0lDuHz7gH9jsK5qdKYeSYOSzX56erTdlubEG3UDg1I16X1DvfA3P3oJj+A+R7y6F1L/uH8VLQ
 m6JyiIiXVNz8eg4htzF7kkQh1uGic06qkCCQ2v0SikyvTVy1u2KLvQfS45icl0OLt/2q+rtnFb/
 ADUJHxCBUOHemvg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Miz0Hu39Mfy2dIMrTJEMVnaCii5HQL7g
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab12a11 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=phyxH6jkQibGXiXynFEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfX2uZ0600HkWrF
 uQpo5CwOrvXWn9c3FkWOv+SKixw6YyjWUCRFEtxTco5VQska430kwQBYGPOG+h9SSy2aLEe/JS/
 IrD60rOTKDEHY04qYvzCjZaCOifVKFGTgtfbXJdRE20tKwKdIFLJ5/UwDeoJ1DvCk49FqRAg0lQ
 4d87Qp88hrMeCflqbTx/TsoxvsCIODsu4AtbdiCiEXBPB24v720yyczPq5QQt92Dq04bLhdauEQ
 V2J3gjl5+HlNrt0r8paa4X1SfJeiBdqC/LdzbR9+d18QrRCRp7b0kuxU4hAbIMa+rK5Gz+G1Bbr
 W9uSygoVtCky8JF8WbcgozYlNhBqfGFyTwj5LpclK4SEDyw93o7zmkEyuHXzK4stuz6b+JdSVNP
 J0YhbYrZ++l/58nQw1IuBBFITpvDZBG8dDbnLAqkBYDHNeA3psSvRyP5RLuR1NdyY2eaAnr4D0n
 Z1di1lU3uNgRDXKy7XA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfX5wl0fM5GZJ7P
 0DsY4V4F7X8Y86ccTTJkSzC8k2WgQ+zCn1akI8fEPHJVznWtGSG8uEPnvQMtulTBoSNtWm0NhqZ
 O/WO4Oih7VhIZ9tpcH+obrP3Y8NYS9M=
X-Proofpoint-ORIG-GUID: Miz0Hu39Mfy2dIMrTJEMVnaCii5HQL7g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_135904_940386_78DAA856 
X-CRM114-Status: GOOD (  22.30  )
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

The crypto engine reliably processes CCM only when the message payload
is a single contiguous buffer. The associated data is already linearized
into a bounce buffer before being submitted, but when the payload itself
is split across multiple scatterlist entries the engine stalls waiting
for input and the request fails with a hardware operation error. This
was uncovered by the crypto self-tests, which feed the algorithms
randomly fragmented buffers.

Detect a payload that spans more than one scatterlist entry (in either
the source or the destination, skipping past the associated data) and
route the request to the software fallback.

Cc: stable@vger.kernel.org
Fixes: 9363efb4181c ("crypto: qce - Add support for AEAD algorithms")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index dad2478bae0e2aa70d31c5f3c7b37003e9e15e2b..a38f7f9854437a923b8fffb3dbddbfc0e3b44b97 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -498,7 +498,8 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	struct qce_aead_reqctx *rctx = aead_request_ctx_dma(req);
 	struct qce_aead_ctx *ctx = crypto_aead_ctx(tfm);
 	struct qce_alg_template *tmpl = to_aead_tmpl(tfm);
-	unsigned int blocksize = crypto_aead_blocksize(tfm);
+	unsigned int blocksize = crypto_aead_blocksize(tfm), authsize;
+	struct scatterlist __sg[2], *msg_sg;
 
 	rctx->flags  = tmpl->alg_flags;
 	rctx->flags |= encrypt ? QCE_ENCRYPT : QCE_DECRYPT;
@@ -522,6 +523,27 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	if (IS_CCM(rctx->flags) && !IS_ALIGNED(rctx->cryptlen, AES_BLOCK_SIZE))
 		ctx->need_fallback = true;
 
+	/*
+	 * The CE reliably processes CCM only when the message payload is a
+	 * single contiguous buffer. The associated data is linearized into a
+	 * bounce buffer before being handed to the engine, but a fragmented
+	 * payload makes the engine stall waiting for input, so route those
+	 * requests to the fallback.
+	 */
+	if (IS_CCM(rctx->flags) && rctx->cryptlen) {
+		authsize = ctx->authsize;
+
+		msg_sg = scatterwalk_ffwd(__sg, req->src, req->assoclen);
+		if (sg_nents_for_len(msg_sg, rctx->cryptlen +
+				     (encrypt ? 0 : authsize)) > 1)
+			ctx->need_fallback = true;
+
+		msg_sg = scatterwalk_ffwd(__sg, req->dst, req->assoclen);
+		if (sg_nents_for_len(msg_sg, rctx->cryptlen +
+				     (encrypt ? authsize : 0)) > 1)
+			ctx->need_fallback = true;
+	}
+
 	/* If fallback is needed, schedule and exit */
 	if (ctx->need_fallback) {
 		/* Reset need_fallback in case the same ctx is used for another transaction */

-- 
2.47.3


