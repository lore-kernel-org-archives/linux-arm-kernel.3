Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B93EF48C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 12:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DdU4gywYj5DC4KjU9lCH12o4Dt8Gt7lIyXAijkg2BZo=; b=DWFQh2stkHHZxmF8iW+IRO0Y+1
	iC1VP0xbnJwOG+JAnwuZYQtuLsXQpQDkFtZMAANR156o/e4TE4uGM7Gdjzgba5FjcB0LcJLjswa9c
	Sq56lNK+6N2lXPrKxNnSQJNX0ZyirJYCg5ksc8kgHe/cbte0m0grNVtxtulc2y3es1GhipYzRIBV9
	/jWHcOTOyrLGj14WMDpmfhS1MmPxpIWqqnXijh8gr7eJTdHtV0Ymdj61D4nlZ3EEJnFJx0Fg4aIsm
	UOYKHWEEesb0LxnXT615NhCT07v22n5j5doE7qXtBg1r6vupbSng79h1nJGGK42EgaLt/F8r+X15G
	HYIWfMow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrEwO-00000004Xtu-2w9N;
	Sat, 14 Feb 2026 12:40:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrEwM-00000004Xsu-1T6j
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 12:40:03 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61EAhtle1571588
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 12:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DdU4gywYj5DC4KjU9lCH12o4Dt8Gt7lIyXAijkg2BZo=; b=SSc4FFvdVoziifDe
	uTvMLMdo5irHvi+JR/jOUaVgrHNb/xvZX84LaiCbwDjXNINRkxADhS4yQMzubt/Q
	pI7+cT3gM9k03Gv1M87FKDCIzODxUJJgw5zUFXMvScg9rloDdcr9sWlx6S7/V1K5
	MKQtutL5RuQ67RVo3r9JU4+hdxi9vYNrx5BR/Y2G5fbajbINuwvOvqbBb3Fh1yAD
	6Ow/xW8LEQ8cQwUJdrAFOB0U9JjyYefkDa23n5MBYkq/N7TMSKCFyWSLmv+w5mch
	9fbV47h7GtF1GYcLBVU+MN+6aC0wKu+5tTIGgBwEhMySHvxIZJJ1LllWpOZxPnkK
	+VfP8w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4caedp90f5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 12:40:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb5359e9d3so47536485a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 04:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771072801; x=1771677601; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DdU4gywYj5DC4KjU9lCH12o4Dt8Gt7lIyXAijkg2BZo=;
        b=FDZ/PWp4y74NAIqf8XmvT8T+UXlv1+MXXPIsJPqcaNBFv5xDywdUn9J99sCPu6K1/E
         Zfp0bt+kLu04zgP6HH1tk4dSWJ6hv1YTbYvyKObMffVqddThxCh6tPxKxYAsCeDuGMFo
         v6Aeq4tcwmvPjPeaI8vjZ2q3Apfnp/ehp+sceMlzny9uza0Ycx2104w0poyqM4t45B4H
         NNL/ZnaMOUqeK52sAtnSm5USwQgF0Bvt/Hqdw0D4srgFgyZWGqn+ryqWVjO5NGiFAnaC
         ga6DR/EaXFQ0SUvZSDR682E46LcoaM//5mXCehZtcX1INZS1xcGSOrnCFhEdMZhd34l6
         oSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771072801; x=1771677601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DdU4gywYj5DC4KjU9lCH12o4Dt8Gt7lIyXAijkg2BZo=;
        b=e6uYaIF+647aiTfCurhqAfqdtDquhOo2z0gRkUAvbaimYwYmo1vp8ScZQQqsyQY8Zl
         ZUGDt3GV+4LhQt2OoO7jLTr2R0rmb5Q6gyMWr8zMfmToUWxhXLoaknDXXYKEo62KQ3pU
         TYnd8mWN3uZtoLZCdscRbm+NFh63Fx1eAz6Jfaf+fN6r6Wrurc0yVTF+USzrTd1pTgrv
         VzQTlrFdo0PUBSyAsDPQYiiyBTViH3MJLj7wJjCubNqfceovjvM2zKI/o5UmzGxUWpsV
         T509CVwwH5ZDJ+fuqS7JaQGz5dLYQ2qenxJzT5cm+YzAQPpbi/tJDqmnnkEh2RBt/yE4
         Wqog==
X-Forwarded-Encrypted: i=1; AJvYcCXlNDeaMQRTV0t498JMERziQzHPxqJ/p7GSB5SmU9R/AokfsUOK4nC6xdEb0KpXd1emSMKSOFbT2gyD233o07lo@lists.infradead.org
X-Gm-Message-State: AOJu0YzxNM+rqims9zY9rN49O4gr3ba8zINzTs3Bm1T840FSbE9mhFCp
	r0k4wFQlIg9Q//Vr3H4mVtld1obcPqyDhPWedzenqicIU0If7G5vap+YPpTkb6KUwC5olImue4r
	6XNtNmnlWm4WvN2+XOILOnHUYCc0Mtj7RNOnCAuM6QQDG3C0K5bldABu3HdXF72YCcuYGTSb8b6
	NJnw==
X-Gm-Gg: AZuq6aJNEDKfQ1PPvwl1YvhosOvOvX5FM0dc6c1Ro41Hdk7B1e2LB5hjCTX/bR79XzP
	cVccNCzqCBN4ZAnsIz/yLMsv0QRbO+YMi+lkJP69m9pZ6OXhgIzY3rfpQNddxwomFYGxdPii6iF
	ak/OwkIDZlSTzxPsp0/feD2IMSCYUPYXzsXrEQ2af4rKXAn+R0Zz6bKyK1NtLcL4eJFHwumYT8A
	Qs94u5WmXXFheyODUU1Iw/V8qcjBYG6M0spFjQZmxpcgWZ+gylnb+Srx07YRoKQTCGdM2UptKBc
	JSLZ2JrCYKtC5HzNNvEB0/e1gbggHYFAVGxBaE8b5LsBmxpb/i46CAJwgSluOP1aE7bkgZ+HN2M
	HyFml3PpkTnPm/xB/4RRlD8AoAUc9kMx+ZHX0kczkaxwnVA==
X-Received: by 2002:a05:620a:458f:b0:8ca:2cf9:8198 with SMTP id af79cd13be357-8cb42292883mr566294385a.40.1771072800706;
        Sat, 14 Feb 2026 04:40:00 -0800 (PST)
X-Received: by 2002:a05:620a:458f:b0:8ca:2cf9:8198 with SMTP id af79cd13be357-8cb42292883mr566292085a.40.1771072800313;
        Sat, 14 Feb 2026 04:40:00 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5ac87sm13644215f8f.3.2026.02.14.04.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 04:39:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 14 Feb 2026 13:39:40 +0100
Subject: [PATCH RFT 1/3] firmware: exynos-acpm: Use unsigned int for
 acpm_pmic_linux_errmap index
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260214-firmare-acpm-counted-v1-1-32af5735470e@oss.qualcomm.com>
References: <20260214-firmare-acpm-counted-v1-0-32af5735470e@oss.qualcomm.com>
In-Reply-To: <20260214-firmare-acpm-counted-v1-0-32af5735470e@oss.qualcomm.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
        llvm@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=983;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=w435g/GTAg/kMgq1giPwYvIojjRMpMrrnfqyw5prOlY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkG0auJjvWvtViwj+3URxBEvdS6l5B5NcdVtxv
 f+Z4/iY2h6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZBtGgAKCRDBN2bmhouD
 10r7D/wJqITFeImOTZQlvOwL27IQZS47P++ONtfI8h5qsE9Pp1HRktjJRqETP98wEorF31QPEcR
 oMhw0XVawmHexSktb5UlEYwCTh2j7wxnOuf3nrCCbSSbPn77dRIErJwFOY6s30txx1ptjxsyw3w
 F9klOwufj/mEEzAKcvVy8Ngn4fpyyh0aumuL27rSjq0t1bWlwNmU76Wfzv8A9sMwYB8ZqIqzF3Y
 84RiTNLmQMw13KF1ejQC4cwCC/d05bDMzNrKB6HfBuC+dmVdIW4JueGss5gTNAu+GfLbynIed61
 lF+D071KcR4zN8U7RJV1IBd0Wrfj5Qmbsm/cO/fGh4zhEhfbMck5VpKv9qUrpCSu0S6m+wgrfqR
 ycbgklph6fR6gw8OssuZnltif/VmlChgxMVyumhxocllux6CNxdp+nSkl3xGQ6ER32ifq4BNdWz
 Zaef6zUcaM77f/tEeUBo33hduoPaCI7F776hvFjDxJwFTtwCahabOTdwUy9xhZ8PCU6TdzezIEd
 YlnoQMsQZMxu6wnbHJt0VKg5EjKpr/CO/yH2m5CCRF0VyWgVglLlARPjjDU72c9R9F0/oJcrxrM
 0x7ev/F0qbnAyvYgLksvgEdCxYTqJVO6e/V4BM7m3d77AWW0kMajvN9WZ2npwdCJtJ/wi9w/JeV
 Egz2vz70AG/whEw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE0MDEwMiBTYWx0ZWRfX6jFjmj6Tzi0e
 nMBGD+lVHndOCAXyKcx+mvHBNwaXj9MU98Kxat9GnNPc6CLQflYquHi6EbzGCJq4aH4s9q8S02Y
 aF3OmGZ/+aB0s/9NW/O2McaNq42EnFpZy0om4oIh4RhCkyLHqrqfTDAco8T1142bHdelPLkIKMe
 lSapAqhDlbehr0gdblgzme42lrBOtwFFTzWfaax5e1FpWsLrmW90pohikeEf7cqSOc8fRyHFdf1
 Ghjlexv91VBjkn2PBAS+CrCRXL6k35aC/4MIPO8lJh0oeajuIASNgaGZ35ZDLcbCQrQy0Oh2PHA
 Qqu16EN1/IHgflCexCo3GIcYS3ysBX8vaQd8+tefAAyl79Qt3ei+RYzi5E8OWLNIiDjDgRmL7HW
 aKvn9eOLdN7iPJ7os+LQotm7oG3lPD6VUx4orYMRr0FNOCDETARdYoUFcxmj4gZLv4wqQh19o0H
 sHQ/oLK5Ksy9KAqfAwQ==
X-Authority-Analysis: v=2.4 cv=eK8eTXp1 c=1 sm=1 tr=0 ts=69906d21 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=sC1DaKbfRzUqm1tOYCAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: LOqpgP7K17a7t7k9UlH04eH2zdZJepju
X-Proofpoint-GUID: LOqpgP7K17a7t7k9UlH04eH2zdZJepju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-14_01,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602140102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_044002_511164_1D910CA8 
X-CRM114-Status: GOOD (  15.31  )
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

acpm_pmic_to_linux_err() uses an unsigned integer obtained from messages
as index of array to map them to error codes.  Array index cannot be
negative, so make that explicit.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/samsung/exynos-acpm-pmic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
index 961d7599e422..44265db34ae6 100644
--- a/drivers/firmware/samsung/exynos-acpm-pmic.c
+++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
@@ -41,7 +41,7 @@ static const int acpm_pmic_linux_errmap[] = {
 	[2] = -EACCES, /* Write register can't be accessed or issues to access it. */
 };
 
-static int acpm_pmic_to_linux_err(int err)
+static int acpm_pmic_to_linux_err(unsigned int err)
 {
 	if (err >= 0 && err < ARRAY_SIZE(acpm_pmic_linux_errmap))
 		return acpm_pmic_linux_errmap[err];

-- 
2.51.0


