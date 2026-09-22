Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C9FC98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MIEadUHz6VYfh8CAPIjr93K/GWIq3ryVLs8Yl2c6YI=; b=flJUPYHz0UIIP5sjlHlCKmElKW
	EIMso8HJl+iB1YeQAD2k+PnIVGxeKUQ3bOHTohNS+dgiyZKpbm5yFZa7gbKPnDATHXzcC/kMMiVH2
	bG/pvBlDZ0uG29FnmS1voGvac8zBOdhmHqKB6YlO8MEGhxVaZvYAXOW2hs5jR9qRkU3byrktaJ+OA
	A+688P0yS7W14KEMBuT90GFiNW6fHN4zHfrdZ0Ilv2YWXQeBV4uScrnh25QTg3ftFEL/uWmgsBZKp
	hAB5vZRdDkrWUCiLf1I7GuErQyiCd9+QnPebiZMFPHKm6S/qBMYXzJYhuo2or7I7Hod36xpXJiSi6
	jSQNsduQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x904r-00000005ODw-1Ecx;
	Tue, 22 Sep 2026 12:58:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x904R-00000005Nwl-08UV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:58:04 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPYtN3671747
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:58:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/MIEadUHz6VYfh8CAPIjr93K/GWIq3ryVLs8Yl2c6YI=; b=chTdvJa59d54BeGt
	WHVvdpJKKeOWEpI0Q+WQWmZzNDsl8Gjb3cBrl9MNlyCyVPc7cQKO2IbUfHywsIi8
	4Nnr3u5+g9eLLhtLJ25mwP9u2OxQWTyk4ZdMcpJ2QHFqBeO7yHbgIfzwOqoz6roK
	Lm5zft4YYZ053/wwUYV1Wv2Q0aXDdyKj8FMjtrMXGH0gc/gO6NBLkw67T0AUjiO7
	th4/W7KPPZZWLS3Kc8/DVpiO5WjZqRYC72mnVKGkFGxviM+3GLy6mSrPNrPnEVnw
	cFZquudFgZO5VtZ/CL4Fa+FvUTc6EAdpAp5O3FZupFa33tmXuD7ufORCq1DqCPXH
	JilFDw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurnt8dc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:58:02 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c82c2e9761so935641e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 05:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081881; x=1790686681; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/MIEadUHz6VYfh8CAPIjr93K/GWIq3ryVLs8Yl2c6YI=;
        b=CaT7Hr9Fcj4jMXSMNXG1X+TOwpGr5mOp3bcgusQUUYmuHzfC4c4keVPGpFH7IP3AAe
         Ey1JapUsq5UWXWG8gHcSzr8KT85juyqc4ukKaE/S+ZAu0adt1JYZWUZ2/X3TAJD58HGs
         T4Rma0GRbnlIgBcImckPDQSURQDOE33ken2mq0G+hfQHo/wfr9OjIA/gjEZjs+b3/v5q
         IZxNx65MedHk51vjPQF3MkOk6mg6PvPAVC9IqDhlq8nFIIPdUoZwOf2ltioea3NCUM26
         TcNjqzV2K/hy987XRqF18lLfgpJVMyADkJYpWPxW9VxqHg0El1HwE5RZ5blfpyCv7dk+
         yMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081881; x=1790686681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MIEadUHz6VYfh8CAPIjr93K/GWIq3ryVLs8Yl2c6YI=;
        b=NsjPfTlTIEc38qGoxGf0zeVzXZWi1xYidnqS6g0qlX2niFgQepGjxBk17A+I/PStkQ
         D16le0Klzlq3amhjTItCyEqQGj5GqhsDYplAg1mqubspgsmhL+dQYXyPWa1Tnikn9h2Y
         ESGhDwBDVU/SWG72Hze262WcQGIxAgLw8fwmOaedkugAGpm0Xughn9er8fGj+4yKiwM0
         iJGEYshtQgMaMKyGWgeMuBVTe+WgxLVxiMFX87S7z7gWej7mXZiQ4/zGIodgRuj8Y4II
         unWg5XaA9jmoB4BkJN0+wmHKlRS9e8RDh0jiO8ARh+Emma6rcgY+YAXt/DmT+MS/Tg4l
         ffZw==
X-Forwarded-Encrypted: i=1; AKwUvBwUwZHZiUk2Td3bT7BkoW3rVaxYHNMJngyGnpJVD3U9FBh5sU3iIvyrce4MMVh0JfDUbzffDg3/vu2DHNslEQHz@lists.infradead.org
X-Gm-Message-State: AFuF++lRYZBHiXad4vrBLFNT8UH9d7EhA2pmGQutvdJ3tOhiGLsFVuDV
	tv7VVRQCRnTJFg+JC2jmmTYzJ6DJ0e+lk4c6jbstgw0DtTAI64HdOk6Pi0SpeSyBkips52VlBXE
	yosLz7rMx6R8zpasEQ5NhByH5kMweJczboZjPfjVT0lZ+MeYDIKuMxYZnaDYFAaUgCot7Fi2TyP
	kfaw==
X-Gm-Gg: AYBFou21vReHLyXnuCYs7oajhjVQAqI46YrRR4LozaOjeG90ohvWAkHUvqnkoK7asAP
	c/p1FoA4w0k5+V0epMNWZJ0vLqsgOqZGFgI0t/CFVKU57UDSCJ1hoOjpDV6YkSejDxSTlW70aHK
	TK6dzgf5vPSz0LAPT8wbFNN3y90IRVMquyPzc1ewJrZZBncSqEkBayyC4r2SpuP7rMwtvOWdGQB
	Q9hjNMEAJZHvLCGfbWOxQdpmhMDsDKBVtrRfCsQysenYuRO/t05Ij1OFDi1Lo4m0sXYgSQl8miv
	v0Do2o4mwq6WkyEhC5lBjVAyDDGhfm8vrxjkdCelR0GcKuZPDjAGhy7+b73EOjljbGhYKuikxmO
	kLiHSDBBoVpRcJDtNi+AM3uhBGWs=
X-Received: by 2002:a05:6122:17a2:b0:5c7:a814:b987 with SMTP id 71dfb90a1353d-5c9b8a6c1e0mr7412267e0c.2.1790081881584;
        Tue, 22 Sep 2026 05:58:01 -0700 (PDT)
X-Received: by 2002:a05:6122:17a2:b0:5c7:a814:b987 with SMTP id 71dfb90a1353d-5c9b8a6c1e0mr7412232e0c.2.1790081881084;
        Tue, 22 Sep 2026 05:58:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4537b5dsm1097669a12.30.2026.09.22.05.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:57:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:57:22 +0200
Subject: [PATCH v9 07/14] crypto: qce - Use a fallback for CCM with a
 partial final block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qce-fix-self-tests-v9-7-b1aa742e79af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bj9lX9c4+OC8dVs8JmPGc4UfJVDkKWl/nVNsAYzA+XU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsns8hv63zSBtiXYbUTGccvk1xP2mkvo1BVVCt
 yxLjs7/kjqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarJ7PAAKCRAFnS7L/zaE
 w7bFD/9Kth36eGZBIVEX800vPqzyl9ccVlbjzHLpgw9p41gcpsdUO/y1PCbrtzgGxVe3nXy8b39
 K6lvPIGz1pP7NJR5uugWdMeFouuhSHIgQnBEiTEANpTSuR2xdAbZA/sCQhv2Ol1IJmpXQnjQXqD
 pDiTSHTVOEPLFF/59RnGbTmP2u5sjVLns0ABiT7NwyWBlATOo2n5dTaZt+mlmcSV4YuLazFqfym
 RE7XWqXTxZl9rYW8amIehXm53GDlftRqYvXeQTxayswNQvJB6+qJyuvyh3GlpmLCu3HBM+la5RE
 eiyq6XyeE8mS9L7nEqZBd8YhLHEpC+AzNQ2tEd82lm1quGeKbVci3NBDbC7lsa2q++JMQwp8Yka
 LVaIRfAylSlZJ+ivGZ0RVXBESyHK+okQf5CD9FDcof7hY6cTNiC7rlIX5rpMPeUUbzQH27EBa+K
 TYdN4lrpVAscBnNFdlFEG0xnZoR6nAoh03VufvdvhVdos4W6MORxU0u+HWIJnhpVVq6Ih6cPdWC
 GI5eAyD5BydUVjmGK55CZubxwNkbSejZCH9ygAbJ8j2h1rAPW6/rbiblywD7iub4lnltMTnT7Pl
 OuI7dg4J1TvQ0LUkQCzS5qRwmcnFeyBXpyeEwB8rFkuNFCy2PbRAK6QstkH344ndMpTPfJRqAWl
 h/2sTB+scr4lNrQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: wDpVuVdgFEmHoT_p3ImiFVACcIKpx8bY
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab27b5a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dx2SfONCXZg6tt9xEGkA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX925V37UtgCvU
 TvSy6fk3IXcJMbnY4teziwSKC/JDMBbQwnTL1rtUN3ROQ6GV54MRXEZK+pjVC5cztGhPj21Rqi/
 LmzKdK120odXvJbFoSWES5ncXsI7q/CCJ4ENktQrmzUmFiZ7zZSS9tXn2twilYbVWDemnLx/Uaz
 wEToBduanjiGWCeY1r4Nkabmfl+pp1KnOmELiz8XEmM2LJZEvlC4zDLlHcM4/DZGOpRB5tgi1ut
 M/gf6pQ3cT57HhqTOenoy0D6jn0+ihj4r1VCmxB5TjdrhNTS100Nf3TA10aSA/K7KC1PZKj9Q+q
 XR80KCDsuhSG2hkxWzUpslKPQixSLR0BO4w1Ch2FhW5G53Co03WUyzPKUrnRpEcDp5lfCNHiJQg
 P3BP09fNSS4Jm55ejnfAVrE+1VP9XQ8jp9+KBe9U8yBLjK70Lzm05pSBwVsUyiuTU3YLTCsCBcs
 wp4J9xeRPCt5SkcyVPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX2oVcnxs4aYqB
 5CN1QDyHHk+d3OfvW5iy08DO4PjUusZy4OLL3Mr2P+7MkhjBHwewiTqW+pyvHghYiP/kmDCz6HJ
 b9OFgzuv3c5jFlQmqWGc30u83TUft+A=
X-Proofpoint-GUID: wDpVuVdgFEmHoT_p3ImiFVACcIKpx8bY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_055803_095468_3F9C2BFE 
X-CRM114-Status: GOOD (  19.07  )
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


