Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8B5CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 10:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2+raViPP3oUUTbnRuWemU8HTLd1odDXtpq6Z53azs4=; b=12tkxP3WhqjK7L2RV8hR3frOZJ
	aA7A8NycC/zsVMXT1+ITA8Q/C9Nt4NHDEgu8drSY9yzZTvtbsTLc27+BSpeatP5bbtL47VMBkZ05v
	nNXDBqVdQ50Nn2nw+AgbpKM0hETKjEIuV5C/KbohxM4qsKd42FbVJT4Oytt1xQkLfgDbdlT43m0rs
	Du7cBtsgXSeztDLiNLP+9nRCpvYKqonQ5ztUJMfFkidfoPp1kMFtNF1hygNfMnCCoCWE4LhJhiot4
	7T/QwJnmE1oSV5OAXi+ykbMYr1eX/NkQXi3ExzhmP9vwP2hVmqed5SvsmavUTLbQbH7pFwfam7W+d
	47sByLnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZHA-0000000CUdJ-3Sh1;
	Tue, 13 Oct 2026 09:58:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZH6-0000000CUZ4-37Fj
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 09:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=j2+raViPP3oUUTbnRuWemU8HTLd1odDXtpq6Z53azs4=; b=L4DYc7U20Jaepe4uudNLU0qSj6
	IsXZY92tMxz9wmQJLVBaebPOBR+Ofw9hwftjRVqK0sOdBmlZrzlg7ZParGbR5XjY6/HQdLb0oxLR1
	z98xn+nPjzFOzqSKl67zExqD24N0ikQUaSTUUYJ/STQTkZpawWCdDnozY2fb9gkDjjLuqR6pjkNz7
	fAtjKQRacRyq8n4SUciDh6A6voK/vXQmQL2UGRU3O4aAngthh6RKKKIoAgaHE60g1cZ0NArfDUfRf
	tFFinNwUfNxypisLp7Ug4rKNPRbSuPNkPNQ74IDnJeOWi2Pr98BRnZDgV7AGJx1SETkNAquLF/Q2v
	03RiILiQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGZH3-0000000FNaG-24p8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:58:23 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8MFo2924262
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2+raViPP3oUUTbnRuWemU8HTLd1odDXtpq6Z53azs4=; b=ScbbaKlY/WJbg9al
	3HGeZHZNGMsO75eoEsVbaN+zvHRLiSaQcgtV+pKSxStmt4C5pHr0SECbPYotpKsi
	siB1jS+zIiJJ71n4y39ArZpKbyahZuebdM158o1aAfeuXq4P+idtxawnvNBuNm7Z
	QUF2JLVKYrlIsYcs0MhQNzACOm54x6LhZlDj7qPfSO+w5F3BgRwJhV8gTMw2Trbu
	KhujpEmZ4HGe3BemZnm666YYKsN6NettgjdsAJkpgwsEF7tfN2DtC9OxQS4IcCYj
	qirpl+xW469/FVrhN+b2yS1K06D2VuKzHIyyh9kaIxNmurzN3yrbeErYZLHyoSvJ
	L/ZigA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1taq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf6c528aso487334885a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 02:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885499; x=1792490299; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2+raViPP3oUUTbnRuWemU8HTLd1odDXtpq6Z53azs4=;
        b=Li/YXv2sMgUh5sGu8NieE+RD9OGt/ocPqlVl7sz3GwhNj7YxE6M6iLjkuNeRn2D2th
         t6N3fzYnIHXguGsqtTYufIqpySkh4Se2LPLcOWqN+BPhdmi8XVnnjP90X+K2+5WU6yWP
         DrzIkk51aOiVHJ4TI4ewQkmXekznpwaKlupMde5IQnhYUH7hwPeAJK75nI+7vaUtJnKL
         CBomAVU7aLIkDoCnCxzxtliFiU2LMVvJr5EpSeorI3sS3SY6R4iocUz04Wv5YQyFIo8Y
         XMdSY9DMu7G6qbb2nj0ircWeIdD7D/kN1V7QFNDSDihRajEuf9At0qcjTQVKq3RiqrvH
         twOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885499; x=1792490299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j2+raViPP3oUUTbnRuWemU8HTLd1odDXtpq6Z53azs4=;
        b=nDO6TaoWx9bBRR/6nW46Prwd6/P9DRs5LX0yYtyLx62LIyQ25bHjWw1emAbx1jFBJI
         Dcn1L5R3RitJHp5gdJ66+TDbJUJUgBIEkxoML8S2wC5loMRgvsRLMtRuLjcQfogkY52E
         zlZs57IjJ1Wc1b+8jKut+eG/xKjmMC+QRvvqyV7W501/f+LWuRb6Z6W/SOZ6fYSGnhqg
         MBb2gs0zFJ8wZjB1i1OclHa0W2LCsY+C9Z7JGOC8APK53Kqx1UX3K7W38Bvgd7NiPt74
         QSZnIq/nHfz6sn+VALNfXFFfXiY4oPKTebkPCa2jZyOaG+t0Z+wwq/fRkU/mZvH+pvgP
         e4VA==
X-Forwarded-Encrypted: i=1; AKwUvBwEu/l5Gr9y+7m7M5pwOC7l5EuLlURxXvm8KbnLkwogIoKJCZ+EXQyOYctV64qZu8dhn81D7FrZG9gM0jzG5vdl@lists.infradead.org
X-Gm-Message-State: AFq9FYL9lO4VxLTqfIdIwN2qGpTBpcMHcrwLqe899Kv9vjsR/NBmgN+D
	9SqR3q5AKyeHBTBmRNnNKjB5nfyT/KiuBKOTL56rVr/Oh6cksy93tREdKKsZb0DhU9CKSly1UBA
	h5RuYFQQ0nn2L6QYQc9gZKMCF0Xs+Hx6zMAEh2CbIhDxDCCoJ04sQaLyr2G2Sr2fLu6HEqZ/W0I
	aAQQ==
X-Gm-Gg: AYBFou0DB2jLbHUFhQxjhFEbsqEhd5vKqMJ17KGMc7a8ZBy5uLq+qlmEvnqGRrCnw8r
	vIOP5w+TUtinh+vb0S8RaoSEw0X/ByJJhEgtewYeGafMsyeUZ5KDpBamOZrIKWH4uXMYZNXFRrC
	yVh7VJPyD1pD+97Y50X9cMX4p4NtXmIjVxT5frNuckZHddrucVaYwEbWs0GoAUe5tE/UniF0A36
	nwC7RrupLYxrak0RlyM3POy8ViBrYgWZYT8UTnyO312anKGWg+K5exOOOjC8W2gkrTM8aR/smqv
	QoViODwD5rXbH/JXCrpIWK75lo60yiNCtHkUx3LoqIshE1OEvZ/41Jm7chEB44tRQWKpL8YrkA8
	I/NRu3F/e/PADCQPjj5BpqTW0N93p
X-Received: by 2002:a05:620a:890d:b0:93e:9627:533c with SMTP id af79cd13be357-93ebd265157mr1839630585a.50.1791885498623;
        Tue, 13 Oct 2026 02:58:18 -0700 (PDT)
X-Received: by 2002:a05:620a:890d:b0:93e:9627:533c with SMTP id af79cd13be357-93ebd265157mr1839627285a.50.1791885498138;
        Tue, 13 Oct 2026 02:58:18 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:36 +0200
Subject: [PATCH v10 07/14] crypto: qce - Use a fallback for CCM with a
 partial final block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-7-57162a38a554@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1679;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EKtM1ReDBXz0qFhsomvF2hYpsKSPwG7AL+SgEjlwr4o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgChmTz5vlTcgTqMWYmz8l/ZOHfRBfagEfhK8
 5WgIF/kvZiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4AoQAKCRAFnS7L/zaE
 wxLrEACJEdhFtig+pc/1kwrh2cYoM+tGC4xjnIIVhtJ1BRUIgolI1fmJUrI3jPQlA1j+KaK5C9h
 +CRsDSDIwVCAHNHIp9nh7SeJpHAVQJ8c9AQhwUZzT12/csduaZe2/z2UDiuHkjMe31VYQFwXGjv
 tqUZQ5cqpK2WKeVK7xukJ/k41c1rUXHYYWeLxxDjyP7pDHzhZl5OUmsGR+cP7VvK3ITpS4STf2y
 dwXGGng7VyEiifRwkI1N1uVeThcNBa+YMy/KmZ0XLc0XuQ0L69BVtgttaqw3+BLGHEJzFGC82fn
 B71Kn38fefC4NItCG1YVHLLPrfiSxNV8QdZACN18blHjc1j0hEP1Xs3dwhl+SkSsLXvGtvozp6c
 PID1UYyK1wofzaWY16Taw4EIHtrxowLCXL7s+kqfYixx57iSwa9c+a1pLZGD0KBC3nsWuBA0a0X
 IwS+A2DmKIwS0IqFQs+0KzIFyv08sW3jPMXtwxTVUDpa9HwfiJvrxkxbPyxdBKD6HstbySHaPlm
 8NyD+esHywIFTNn7JN3z0eXTNY4i+N/B/ZRJ07BjQYXd5Xigk9ZlA+fMo3akY9W7GMkGox4Btsf
 NkKt5OTOaCkvNhbklgTytloYHk7QtNfAKJSn2vbskvT8G8aggK9HtWwhcDja0P+u5e5jKQJB8p1
 UVLiDmVBvOaxDeA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6ace00bb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dx2SfONCXZg6tt9xEGkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: _Z4Wc_C1jThFuIdgabXSslesVbRl9Hz0
X-Proofpoint-ORIG-GUID: _Z4Wc_C1jThFuIdgabXSslesVbRl9Hz0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX5EDIiCSlB3fo
 C1gy8lVsyMbvLKISApA16nAy53GdPC9P+HS4412JAByxLjGZNccvesCqanvJYqi3XSLgaOJ9/ux
 l5ghzAoUsOqiAr6SyzjkXwOkay3V2nM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX5CECofTddDxR
 oc4qSNHYCFfuJZNi0eEYi7AoE5OWXCMiV6Q7b4KFgh3ORmMfDbl8ju/aAgytjLvVMTxBeiM6Xrv
 GfNPmzE9OzHizWU0qkF6jIB68SR83Ljr/AUVMkd4S9IVFSNgciWhRDP4L67E/KALodrMG0sSb8d
 m7j/PSIOUyzxidY/sNVAPZfJjLjGPx5MSzeHmlGtsZvoQN/FDSE7+X9Va9+5OKQEi25yOvJADGS
 uRB4qAJ+ewUpjHZ1YiaAkZwxl3ErMHdmLprR2UFQH6JW8xG4S9UcDK9NtwQNn+QViMexG3AwtMU
 oD5Oxi9hVNm+uAj9X5nbal/Aq86g9DwLikEfscuQqIaRmBnwNbEXue9Zb02tXvqmY7aub+h9TQg
 FrcWyoj+05kc3oDOU7A+7QdUDPTjiQ+tKeggwXRhYVEzuKo7kMLlY6FF45LIPqA68fpFrwL8xX2
 IiCd6Fl0bO32pq4LKEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_105822_050197_0C0D78C0 
X-CRM114-Status: GOOD (  19.16  )
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

CCM builds on AES-CTR for encryption, and the crypto engine stalls on a
partial final block just as it does for plain ctr(aes): a payload whose
length is not a multiple of the AES block size leaves the operation
incomplete and fails with a hardware operation error. This was caught by
the ccm(aes) crypto self-tests.

Force the software fallback for CCM requests whose message length is not
block aligned, reusing the driver's existing need_fallback mechanism.

Cc: stable@vger.kernel.org
Fixes: 9363efb4181c ("crypto: qce - Add support for AEAD algorithms")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index e0061bfab216861444e36700d6530e7a3cd347e7..02e1a7684a7e51ea7ccba0660eea97a17589c3f2 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -514,6 +514,14 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 			ctx->need_fallback = true;
 	}
 
+	/*
+	 * CCM uses AES-CTR internally and the CE stalls on a partial final
+	 * block, so a payload that is not a multiple of the block size has to
+	 * be handled by the fallback.
+	 */
+	if (IS_CCM(rctx->flags) && !IS_ALIGNED(rctx->cryptlen, AES_BLOCK_SIZE))
+		ctx->need_fallback = true;
+
 	/* If fallback is needed, schedule and exit */
 	if (ctx->need_fallback) {
 		/* Reset need_fallback in case the same ctx is used for another transaction */

-- 
2.47.3


