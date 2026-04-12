Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EDCE937E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 16:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WM5Y2BrqOQO2urIYmN2piaihqbZbQWaalKFb742+YMs=; b=Gt/rCpCg/RxjCXeroecD5N5d9v
	t3WAfRSxCsoNs8A6lr55QWMDO5FuSGiC+h+Sq4iqaSNKSr28Dh1Og/jQDQ0E52o76xgY/MKx+7A7B
	PsJLzwazBJarFlY9Kh8Psb2V5SQ8yPvTdqrxOpwPY6aUuRJ47KmxqGpNA33VtZWTa8p5Fk8OgLWMi
	GPbZEWWqWYz1VknQfjXYofisuuVx4FSEHFp+h9TFFuC8vQgu3yLyLqQrSFe8N1D7rANDOcWSpPcEs
	F7DTk197kRyTxo8qjQGzE9Iq+y0rwy9XBV1VLmCKceshuR2OQrNebz2J2CWBBn/P1khhlkH7jAqMf
	qo19aMRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBxYz-0000000ETgS-20sf;
	Sun, 12 Apr 2026 16:21:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBxYs-0000000ETdE-3KOO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 16:21:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE53bW1121311
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 16:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WM5Y2BrqOQO2urIYmN2piaihqbZbQWaalKFb742+YMs=; b=fG0yk3iwSgx932Fq
	IGX7+EU1de5Af46wTCQITKmJuiMXe3afNXlCwDxdbtccOJbtkbiXkMG5lcI8G7O8
	7b/lnF0dJbOhO3TgzUl2I82rX7JyYDolU92kxEzUJ4SqnxR40Wc7emJnAGi9Bt/a
	3O4Hn10FmFcPN2GwcS80T3dwds4XJtKktxLoXZKxWKWuYXbMk70tr+j++nz77VPl
	VV9ikJqKcs4sBlCImk+WsJx6fkuG+qejq4/Hgtq6nKrrGl324uGozJqV8RUIbSPK
	kPQSRMv2LY9X0ea1MwYh5Jrag+IPlx536KZjn0uh1JHxd46YogSiRiWS8pxgE6AQ
	HMd+xw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jtkv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 16:21:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d812c898cso95261291cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 09:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776010885; x=1776615685; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WM5Y2BrqOQO2urIYmN2piaihqbZbQWaalKFb742+YMs=;
        b=jfuPRdVJxXV8CvrvZv1aOac612XVQDJO0XHjTBGTT5zONhHgy7P/y12NWujsfPk+9+
         7X6J/XpOtv7e33B+g0QnKbs8PgFMpE8h5BZxoe/KZZkyhbdWLjHKf0oA7ZGPXvqGnbcX
         34PU5wfF+1xNa+q+6g6ubTlfP/P0fu7z5kC8nkk2FYVus9FdgVa5CSQ+0Qr3+6llxr5f
         c51LeyCYvMnSgFPabPaiWeX1WDa3nSQiVoQ0HplStZmxE1/F0SuALBZWVsrxk75elpuP
         2RpDOqczXwWAqqoGhJeBfJ/AGNUkszswq1fhbE4ORqzhboYuNEpRGLqRaBJni8c5jCLs
         YsTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776010885; x=1776615685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WM5Y2BrqOQO2urIYmN2piaihqbZbQWaalKFb742+YMs=;
        b=euPHyp1b5AOSwtc7jZeb00iLW2LXT97MGS7e4zBN5uJUT1QSxXJAYeOnl7l3VVHmq1
         ojCmpguYRo2WNBYGj819YEe3nGMmqkdEsoDrZsxCZryOmgwunne9YJ5jVvuH4EyJ67GH
         a04Y8jbiF1FzuArFGDEe0fq6DyZ/BBUPYie8MBMDsuQPfaqzNVLSi8Or3fAt2xfKTHyy
         kITYDBhJoO0WiBh6K5yy5TMyinmfNk42AKibJyvPfwArRAZvd87UEU8bCLLBfuVO4MKV
         /jCv7uFjjSI2lqvsL04HPaZIm35m4wbEZd9428hIv2qEag8xjgz36g5ged362orGofDY
         t9fw==
X-Forwarded-Encrypted: i=1; AJvYcCXuDzLEcY4MzyMPwSiLRMCWEXKUJPtBctkLZ8lMwNIXRS2mPeIa0/EAwRHCmYO5b8LAGCxKDbT2gfepSvrQDymg@lists.infradead.org
X-Gm-Message-State: AOJu0YzE88MCu+17FQEAdqv+miTFvTdVb787XUPhvxQLo76BqQyR8pMB
	ytl6O8/Ld3x/mfmfd2zp6BxFOUA/3OpR56tMNsFcDw/H2bikhqIQnvPS8hYaFf/xfwav1zNaIOi
	a8ZFODtIzuSft7AGC8B3qFIZ5OyyavHM2Geh6p+BzTd8bdZ2HJr6iXvlPTAV9HqjrBDdNFiokD+
	0WTA==
X-Gm-Gg: AeBDietfWU/Ykm3JjBqmJ3zdSdEAtoTX/bgWq206elAhmpZLmWTuh6IZ3md/ywdeyiW
	u6b4UbjxyH927M3oLfSRiSt7tGASPWirKp8A5MuW9zvXTEl5ogQZs2mRvT1tB5ab6aiuTOOUMvy
	Gi4l65HAuilS9yPBXPTovUwzMbbjI34DpP0w7uPBprGQKFg1QjsSxqPmU1FsNMMVi35QE8Skq0L
	tHRRqv1Toh+F/zN/hPS4f+pvQnViUR9+OT3M120Hxx5AQjAobJRYJ+/arMcw1XO1URPX/jz+X83
	grn0j4JYHREIbzkCnHFCSkjY7nrd7bbsBmYe0wt+vZv37J0UyUfBwnMFB9RBJmvfyEZvPhbCs1K
	x01niBmD0E+IcLMLvbpR+/Ij9S5DqEdLCczkEo8jxqEn4
X-Received: by 2002:ac8:588a:0:b0:50d:9c1f:bbe3 with SMTP id d75a77b69052e-50dd5b673f6mr152015601cf.16.1776010885177;
        Sun, 12 Apr 2026 09:21:25 -0700 (PDT)
X-Received: by 2002:ac8:588a:0:b0:50d:9c1f:bbe3 with SMTP id d75a77b69052e-50dd5b673f6mr152015211cf.16.1776010884699;
        Sun, 12 Apr 2026 09:21:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d531f229sm301286585e9.3.2026.04.12.09.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 09:21:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 18:21:04 +0200
Subject: [PATCH 2/6] arm64: defconfig: Drop unused legacy netfilter options
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-defconfig-v1-2-a46918286451@oss.qualcomm.com>
References: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com>
In-Reply-To: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1049;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=2lDhMUOj2eRpKYIvCqYIbaGo/wqjQ8ioCOIKFwS2wdA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp28Z3LBbbVOzBWtwkiL974rkN1/lJesx/tq0CR
 pPzAvMJCa2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadvGdwAKCRDBN2bmhouD
 1w6hD/93gYyt7hPSTpworLH/Xgg0H6slKPjrH8K8gLwlvZ4fenJbolJcaIQok2Flqvbt8F7jIZz
 C9X9cHtW5D7Z9saFij9D5y85xFKuBmcJmBhb3ed3aMQW7UUQVbQ+FwqN+KSsfRezhW5bgfpHlIM
 lwOibyCS5WFgTL98PzlaxWhpx17FWnQcvXsCXw74Vv3hrouxC1VCS6y2Bz9gtcVWX5x0SPh8T+W
 V1IghlSfPetYYAy7+eNWfeVK/lxeHQh07YEYPKX0fO2QChpPaS8SY3TXyOBUruoGvrqqU1cOMn1
 EectPGAycjVMqk+NuWz4+WoCwYR2y9SbnAb722W9UEZjeF8fZZNOF9QoaJBrbrbVsO1fknTEj/E
 Tx2kQxQKkWgTKN3AFn91VJW33sKvR8Q2ZQvcQNZ8I0hynW5uKP+7mXgjC12q96w0sWLkXFTTtc4
 qlhs4ZNnQCB49CHG0oepa1aUWVQiDeNBzzWhqcltg2KU/77VGV/rVX2sdhHzwJY1nycYzPSnAyw
 oOw4vrv6tx2p07O2iFEwKWIhLpoz6/us0fye4QFII3K8ghnze9jbcCYOTT+J7gjFpmTqPTif7qx
 +bcHiPtIw12aYetHsek79IAcTQn9C7aKWWYBi25lYKiNLx7nY0SgRswZEM7+hqTokXgbHZbu1ei
 jUFjHno2qMT2l7g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE1OSBTYWx0ZWRfX/DnDI7/IoS6W
 GiHvLND902ellwSCe1BDtRuXxlZoS3iIcjKAf2+potNFdcxMbtskLFw+1pzOvcAbcPuICXJo3kF
 ySx85BaxvXZB6NghHiG7E7fN1fBVMG9WeA/wWJzLO+NOSI83iMKzYTmwoEILmOwf8YB4/Y/NvaG
 uGRjezif8ouQ903hCOgA5XoVQion/uIc3KZ0nDea8aGIYAleUkqrbpPrW2y10H3cyH0dL1WVdoQ
 JBhi1DmSSH6aufHuLA7zWkbVYJdpY2pSg1+ls/1BkeAHuHNYjZrJ9K7RZw6uqcOEMBWXoh8zd4i
 GiweoB0tsxoJKKMl6jSpFzbKPTCv7/KwNQ5EqMxy+48dxs9Oz7RxhMK2RNE6//kzJXKmuc07Eb7
 yJlR5FrBvI4C5TtgQf3qKkr3Lk9ATcHR6gkxRlOXj45e0cPU2Nnw2nvsqnoe55BIPxgqiKGmth1
 oT5IKBKLyREkexR/ikw==
X-Proofpoint-ORIG-GUID: dbb7GzM313h4J4BWNLp-oqTARLWSVteF
X-Proofpoint-GUID: dbb7GzM313h4J4BWNLp-oqTARLWSVteF
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69dbc685 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=k-PMdL3Rd_3TYoQcjAcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_092128_509218_1B32EA80 
X-CRM114-Status: GOOD (  11.69  )
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

Drop all options which are ineffective now, because they depend on
disabled IP_NF_IPTABLES_LEGACY or IP6_NF_IPTABLES_LEGACY.  No impact on
include/generated/autoconf.h.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c03ae2c767e..9a31b258a56e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -155,17 +155,7 @@ CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
 CONFIG_NETFILTER_XT_MATCH_IPVS=m
 CONFIG_IP_VS=m
 CONFIG_IP_NF_IPTABLES=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_NAT=m
-CONFIG_IP_NF_TARGET_MASQUERADE=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_IP6_NF_IPTABLES=m
-CONFIG_IP6_NF_FILTER=m
-CONFIG_IP6_NF_TARGET_REJECT=m
-CONFIG_IP6_NF_MANGLE=m
-CONFIG_IP6_NF_NAT=m
-CONFIG_IP6_NF_TARGET_MASQUERADE=m
 CONFIG_BRIDGE=m
 CONFIG_BRIDGE_VLAN_FILTERING=y
 CONFIG_NET_DSA=m

-- 
2.51.0


