Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FACC982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skjmTwe/2/9vsGC6HLJTSQTIY2ObikwZKwuHsPTlEzE=; b=XQ4vL8xgBhypVHKZ28/vpA54Gw
	3rA4QfkGi+MomUX8oq8cKs7WWt2NsRmHGzalzfHKvxyTSsMpCooVokywMYsD462j/T4c+qHqdkmKC
	UXlFgmAvfhDw7oHtJiv0/OArhdT2O0TNxaV8TxavBd1GvCahh+WbDXajwULhGb33V15M/JOk8Q3PI
	lrKP9erCCL3PELVEDuveEhWbauJZpJStJZmtDSBmocYQhZZVx3JsXbfD4crP2MIYzQ5nnMQR60f+b
	Wc83Mthaqx0boAiVKEps/wRfKFCR7oWaH17zIG/+0TLZsOJq3rVARII9iTVNEXCaFX4o5UXv0JwcF
	zNPSimZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dbj-00000002AEr-33zB;
	Mon, 21 Sep 2026 12:58:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dbV-00000002A7m-3v55
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:58:43 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeOe3838159
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	skjmTwe/2/9vsGC6HLJTSQTIY2ObikwZKwuHsPTlEzE=; b=VlRpau30bHj0O0af
	bMiAMhzBP3oJ3f+PCA+Omm47zjxSPgeHoVPCynbxfHgavLE3pwCdR3fDszGGfCmB
	dMJevFWloWqUGqD6PSvaDak2BQdUAYY304Y+tZv33JcoF1iZMVAgDTx+sRv4eM+N
	QQ0+oKKdBl7Hq754yQno04gyFP3Ok9io4LuKBmvTO9knR0b8T44gIiI6yVtW0LnI
	DhUpmAkLhqEBESm4DnmaKPuu8saAm/qECqoV+VWoJaR7XPgrxUIKQHX2bugZUqxS
	D/wfgf2hti5DWeOcczvMHLc3uItPCTlyxNgXcL5SiWF1IAPBpun/CCG6J8YJfDQY
	tpWdqA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5hwh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:58:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bfb2da664so393592585a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 05:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789995520; x=1790600320; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=skjmTwe/2/9vsGC6HLJTSQTIY2ObikwZKwuHsPTlEzE=;
        b=MRTjN7ZGEZG7qEKUdBQb0Qu3TZRPFQK8rpTUyHw6wN+d8tYsw5e3H/Nh9r9iDrHghg
         9mRSJtv7RjlZia9uIRcKFoQy4lkzlUsoK58J/YuKUEWwG3HhRhm+RU5Sk8oxNHD2QxSb
         xbnh/gG+6ggVYz4IP4hKYZUhTtkmNsQacxPjs1zuC0nkE0Je4WV4vkNWl/7a4iUmcf1u
         8dr+D+ddnSVYydxukhECjbM+gn6S1hLXONEAhfSAjc0DFOwef+T6dskec8q7K5HbwL6P
         TpUH0k1WGohddul00Os69FHm53WnptH/XmhtNkD62+dJBFbsC9MisB/p0vQOkWu6n3NA
         NcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995520; x=1790600320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=skjmTwe/2/9vsGC6HLJTSQTIY2ObikwZKwuHsPTlEzE=;
        b=NII8trrAiJiSFkzmAFJ1X6qwXkTKsn4DDmwquwtpTGczngW7BKlONP9mVIPyVo76FY
         1VfnVWmJekGs3m28bGhh4bp4XzzwQ4BY7g9IdfaAbRTTpD5Dch0yJU67qs8AQ0Zi775g
         v4ZhG7GUBt9g95abIpJYBqbeFRQP/2sfrNbXez8FZCn0xXn57kFuMLhWFiGs/i693Nuz
         AgdPG34/s4Q6T2PL57mVoH3qcJ6VCCw2xma3Ryx0X+prl+znA0Df9CSWunAryZUyozmV
         Bv+HeRJiGm6oxSQUtc64MxpsBj4NMYjAeDdNXImNU0Uj08c0PrygMiSF4zxK2qrU2XLg
         9dbw==
X-Forwarded-Encrypted: i=1; AKwUvBzca0GbkfVmn+DrJlC3ZofMYrHhGaKPI0XRWiSLKh8V93bMI1YqW2SsSHMEtwBc1zhei8qV7+ps2qTCOuraShuH@lists.infradead.org
X-Gm-Message-State: AFuF++muPIE5/WIXoAjzOJsyJY3HX3ztscpB+73+5qmG4BEWdVu8H77E
	wYPOUwfZn8nPgTbkN+UIIUDxsO/YnddDGt+q3oacusKbHeH+3t/Nzc9qWp6HHD7u2hcimtAX9r/
	oV8LRC1o3zjbeN2odk0v+RwYQ8Z8trOlPdk7M4mKHo03H6WNbfI6VE74CkRiHHyVdmnl2mVuaxh
	zJjQ==
X-Gm-Gg: AYBFou10NPxGbXkYDHZuW1UCkpeZcSgefr5j4M5LZF+hBYOAyJySgooa/2WM1cYzrnl
	cZVBYWV9a12V68I39hr5yr6hltlQE8pms3kTrQ3XYJiS/JMR9O2Rwgni6uGRptEEU5239KnHKvv
	jAhj6cuJbsGmlQwSGTfADYsu8ztim0Q7O2cqw462iVXIHge9tqMzC4rOunkQjW1dpdoYWROu4vY
	zdke0TC+wa0RlVlSUAZ4fJ5ae4vr2P8VEsr8UhwdzjZ0v+18BQP2dN3Im2ZYD9m+LbDaDMPeFjH
	NbvaYiRWfWY7uZXIlipwj4ySxPhH75DSPmX/GfwLOtsLNLUwNDLGKv4Tu7lOmeDU3sVlPfYGdvb
	p2j8woGmv4dzVoU2J58OEILmiIS4=
X-Received: by 2002:a05:620a:711a:b0:939:6de8:43dd with SMTP id af79cd13be357-93c15e99f46mr46326685a.49.1789995520092;
        Mon, 21 Sep 2026 05:58:40 -0700 (PDT)
X-Received: by 2002:a05:620a:711a:b0:939:6de8:43dd with SMTP id af79cd13be357-93c15e99f46mr46321585a.49.1789995519625;
        Mon, 21 Sep 2026 05:58:39 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm320278766b.63.2026.09.21.05.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:58:38 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:58:11 +0200
Subject: [PATCH v8 02/14] crypto: qce - Reject empty messages for AES-XTS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-qce-fix-self-tests-v8-2-107537869a72@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fiubGOpznSBlWjS81EhUbY8+Jvg8mdIEbz8sZifJeJk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsSnq7SZtnuJ3gKn76T2Cx+kF+kAxPiEDzJeO3
 touwhyuOyiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEp6gAKCRAFnS7L/zaE
 w+B1D/9BQnIoyDi5SScYSIHdGc7bLgsPn4vN+50qIfkwN8ShCn7wuBF/r10UFpbpv79rp1kKs+y
 mL4qBlu4S4FUE9viYPuBAaIqmKY+N3+AjtL9a8mhQYlynycI0UxiGH+b7cgKPes6M9sSJkhr+9Y
 BMekYaS9+278rJDDmGEpkoQSVSOIH9lm1DR/McGD2YR2zhCBmPaT4vVA9mNevX6B/yEMSoan6he
 A/ZwZPtGlhimDROaIY0tz7eUJ4HWnK83FrE9JRu7N7N/di8gRBwaZ4xe+63DUGU05Qc9WNmD9p7
 7BEetO5JtnDxQ+WqEdyfxls8v5oGiRZ8F9ZxAGAF+tiwYvY5+/YhihcOml14oj3cEHQlkzdj62a
 /QIOVdtmXDiFpJP6/3y5qsCwLRagVaYE8NXTfZtDCaoZeiEtdDNYAJpxPA0dKlP3fu48BXl4JYJ
 M+kdYY9KeavSzzclGlOfhbDo/SEDRXunAslSwus271IMIgFIQ+L2fcd6zB3hmREtIyAxAgLf16t
 ULmY9J64DZiAU3FisagvSDLX5Ne0cGPUn7t2RpQTee1P6gL9FN3VAJRUvXs6b/+b15uyiy93H+v
 F9hhxFFojcpp286Gbi6Anb/sD8NxVQwM8CNCbUAKap1yPw77Ina52qCAeZilBlDccYCdA8Qem25
 cwPGQGTqnUzVFhA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab12a00 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=kiYxeA6Iecqc4QeK3QQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: KBI62eIUh0kqOb_YYdjJs8ZrUb5oq2EL
X-Proofpoint-ORIG-GUID: KBI62eIUh0kqOb_YYdjJs8ZrUb5oq2EL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfX1RJp5HLzNmVE
 /vNIuN1QWYN3umUtlNURYNJJQyw5uiQxounn26Kqz+pmHlFJmzW14PxWwyqQkyi3BtCFbfKpJYz
 YEO0UDxBSPlopLIDuuScKVSYs5hcvUM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfX7XjS/yWrY/Bv
 zgkcdKqty2LAOmWFR3930VQLIiEhMu5apn24G0YeUqALEAd6R+oS79p9H0b/vAkB0yTkaISU/0Q
 brCCgidXYQ3yoXfsAunuS/vho9ggXr9mDG3dQ7VtuBqJBWKLo3Sx3KKrqBMP3z/46f3Pg1SmNvG
 ljFpiVnWeoMdS4ObPyevbs+fIGL6smJ6mx0S1Qc+vAfAs5Mkfwfqn6MitJK4utdillWJ9XbZ8KM
 YNlUzspSd/ERQkl6N6Xq9AH7ccmbneZi17k210PeM8o8No71I6O33LDskqm0J9EOxlzELum7Wac
 xBV84RPWZIZPaUH3K5IHOLyv5dxr9UY0ev0qBfyPSPEoZNyAsk0WP1vOUHKfDVlirbVi9GBeub2
 AQyDKNh1cEqDAwxP1WJ3n3CwSQi/ERIk4iETj3UURGhrV2vRG2SKUhM1lsJ+1bL6Zwd4ns1NU5t
 9WPDInblTJtpuhRWfHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_055842_092169_377917EE 
X-CRM114-Status: GOOD (  16.98  )
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

XTS is not defined for an empty plaintext: it requires at least one full
block of data. The driver treated a zero-length request as a successful
no-op, so the crypto self-tests "unexpectedly succeeded" when -EINVAL
was expected.

Return -EINVAL for empty XTS requests while keeping the no-op behavior
for the other ciphers, which the crypto engine simply cannot process due
to its DMA not supporting zero-length transfers.

Cc: stable@vger.kernel.org
Fixes: f08789462255 ("crypto: qce - Return error for zero length messages")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 84263ddbd62733f4d1ed42a2b94ae9f4d0d5c6df..b49c1aeb0d27d4798e3e3d0b30299f48ef8ae453 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -222,8 +222,12 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	keylen = IS_XTS(rctx->flags) ? ctx->enc_keylen >> 1 : ctx->enc_keylen;
 
 	/* CE does not handle 0 length messages */
-	if (!req->cryptlen)
+	if (!req->cryptlen) {
+		/* XTS requires at least one full block of data */
+		if (IS_XTS(rctx->flags))
+			return -EINVAL;
 		return 0;
+	}
 
 	/*
 	 * ECB and CBC algorithms require message lengths to be

-- 
2.47.3


