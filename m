Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E1BCC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0eAsNUcYBlnueBVIZsmD55eeC21n4pLWK53FWNyWHAI=; b=uBFqPjvnnS0HD9Gj7N3nkpIR12
	rBwnKzianLyU6JKhD0iU9ASaZyHqnjyZSPaHJ2yC8fNGuq/4RiWw9YEt2tdvY46iWVqVVAY6dVov5
	wcGZkEzks940RC5ROvhUYiC0fz8lwknmYsfZN3dDNO43jSt4bjhWhiWs1cPjHF46a2ebwA+PvkgDQ
	zfwzaGibx3W7ycpFGI91xFyv9uIpJZE4c0lr748WNYMEGjFB4FjjhrievuiaJZi80IDkAKTYfHK83
	jcoA0QKKJqLYn4XyJr87pYVLLn8HI5J5r0otnKxFuFfdo3Bddv+bZzITAZfA2SdiKMaxQx9x+vSXV
	CxtlW2BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZHu-0000000CVMO-3tCa;
	Tue, 13 Oct 2026 09:59:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZHR-0000000CUy2-1XQU
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 09:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0eAsNUcYBlnueBVIZsmD55eeC21n4pLWK53FWNyWHAI=; b=A77iSB482cOHBDSbLtRO4BmH4R
	EtYGaWRk5JPocG9SQSc4fpUhtGrRw11XSALZZpObBwslGUppgpfYuAjd9ZUUYEwEXDYx05xGebcvh
	SzNbC5tZwl5zED/LufQgs5Yu0Hw7QQqP1AJTfjCMi0oEkOr8um77tSc9AMvqZlCG2TRHDx4Su3PLH
	k57U5EZpHl9Gqrk/pS7PmuzC66JDsoibTdtBt5lgwSxueuutMqc5xysHjTupTSLshaUZjY5nODry/
	/WUqiwhz9n9s0q7Om2jcwXEj2mc/cf+eTWJVhe2K662IVqyeWbF1ioY6gtAUn4wiEFyQ0inmOq6zJ
	/u7zrc6A==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGZHO-0000000FNfK-09JO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:58:44 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8Z5vF989732
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0eAsNUcYBlnueBVIZsmD55eeC21n4pLWK53FWNyWHAI=; b=hoWNrP8Qrro4vjAy
	D42R+iPg9d9TYtbC1gV7p1dfbfgD82DSfB4y6Bh7fjpJkkeLxLvJF6IJS7vTI1Zx
	Y/mh4ft1dvhtImbHiHgqNCZYgwvxEnPlfpf/2jCj/brRvGHaUBRcutPmsFb6uaco
	KKZvhDoxrL1n0ZycClYcR8V1iyew42+9WegB3jbLUszA7RN/WgOt6K6LCSANZjcb
	z4kRxivrfYZ//zMctarzoo/6MkgMfkK8OQfev1cuU/UfOBOc6UGRd8jTcEtfJNB4
	nr22oI4vPZ/VJBxU53vFFBWTh5FwRTsZ2DC2ZEnsvfGyfi2sIXcDObAJI0B5Qce3
	Ukqmdg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hcaad0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:58:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cbacbb996so453941185a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 02:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885519; x=1792490319; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eAsNUcYBlnueBVIZsmD55eeC21n4pLWK53FWNyWHAI=;
        b=QUvICe5iOSfcxn4tCIXCgjZ4N5PrumkwsGHdQ6LOYJy5EDfOwRTfQieFwKEMeKBUQm
         NI+vpGJj84KLUawtOd51Kt89YXrQLEeDAAwW7f3nqYGH/G1qTZkv/TZF1MmBOLiksSBD
         oBmHumb3vwDokPhHla5c7jCVzKoBEuN2fGoLrt0MXoLI6dQRIMceIB8rACqcHMIr1Tf0
         7FeTj0jPuQDpqMDfHf7KzFY8vct/mG8Sy8rzxuhkLMVuVJmp2cyq5QID2njpnGv4raEr
         2bZ/xNwpy/7ObHDe58Y07GEB955e96nqblwN8hoVOoA6YMSN1+IUb0NrFdRAYdv/xijn
         FEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885519; x=1792490319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eAsNUcYBlnueBVIZsmD55eeC21n4pLWK53FWNyWHAI=;
        b=L/CgLso/CdU+ORMsxBTMDaI//YY1Nhf5/TVDSilu+BQk6ToFCndk4oIEVGDA0iDOlJ
         crAi5L94BCAuLEp1D9fL1EfVlFp2o5aJ8PgiyBzBjcKeBsez7BFtWsvoBZJeLXgOLdZM
         XpAo1zAQau/BWN2FmZ7CbO8Dqjy2q3cUbbNVVy2RTxkIHSWEiv0coQCPxmqJ63xkv4EC
         y8jl5wsFmhU6/N6AFOsDGwhhQoACNFlOkB9Skr2B7akVALPnKyVH0v6XxuzhaAELZhYU
         /qhxLNy9kZa0gUNxvKntdAuxKxcskAs52oWCe9U5APkFgOl0SQSnZfHtkZBztsmKjoxn
         VJPw==
X-Forwarded-Encrypted: i=1; AKwUvBxlpI5JavVMCrZeNpNnp25v4juFSHf4+ylzc1FWZfL3dFqXvSOqsqZLSFTQ7E0xDny0SR/l7iqUB7YZEjp4VYtX@lists.infradead.org
X-Gm-Message-State: AFq9FYKktfF/dzxOLOt0aZ1rkPihL0uUTs0kZwgojBxWBz/ljkGXcogI
	NYOn8tDPMpKplWNmQ/rgE1sd1UgTCFoJAKh+vfIhifWdyym7ovnc2KpA4BzkBjV2+1i2XtbPvM/
	y4Hi6+NQ7aGpbKc4CdUdTZRBmCtW95yukyGrM/B3rT3+cSOY/5Vak56nM30fjRFeLlZh7KShznb
	ygFw==
X-Gm-Gg: AYBFou1F3aG1t+L3/Yt9qVk3IzB2+wAYfErpDGyhRO2FvlnFa8xru4dLTY9OD36a6UG
	oTIxoDnwUXnoBQuXzzM9DvPGOlVH5nrcWf5F/MKuDoZs8zerFTmW1OmLLxawNzhSGdNg8+qUBqb
	W1kkwVscHaZ+Le1hUKUpNPPVnTwDRfIZnmNYKEe9/R6rLsmpon78eHcZVX/rSFwhFsH4cisclq/
	n1Zh+EOwUTyhJQjfqF6+pFkgeRXIr8tNIXsMqC4y77wBq1nMi57O8J8hzDj77kKhlY+n/Uxpk+i
	6uA2+ie4FNHkQnOATYw8fwToABItfZ4Z8nfx0w9gYp6sIVhgh6g9OUrozetvFTelcw9SjIRL0DE
	ETyydDEZOg+/QbdqmYX3zGeIBL5vT
X-Received: by 2002:a05:620a:170d:b0:93c:7f48:8f46 with SMTP id af79cd13be357-93ebd0cbba3mr2035745285a.4.1791885519060;
        Tue, 13 Oct 2026 02:58:39 -0700 (PDT)
X-Received: by 2002:a05:620a:170d:b0:93c:7f48:8f46 with SMTP id af79cd13be357-93ebd0cbba3mr2035735485a.4.1791885516739;
        Tue, 13 Oct 2026 02:58:36 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:42 +0200
Subject: [PATCH v10 13/14] arm64: defconfig: enable the Qualcomm Crypto
 Engine core driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-13-57162a38a554@oss.qualcomm.com>
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
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Zej6tEVXY3XS8Ou3kHT610dqMJ17NrWOQ8e38Rvr3SU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgCll+EhDulWQ9W02Um2eDa39pLKRIykk64ph
 aTz7hktzNKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4ApQAKCRAFnS7L/zaE
 w8pLD/9hCBxRLV50KkpLeMAITMx8dGDibLyEG097kwDGhfxQlV23KclhNzYiItO/lr8jVCjSwr+
 MQYDa245NgGOr5FVSFtBno9ifIohiUETJExmq/id+drO4MqcLBWT3MB1t/X1RPZTEaK6aNjLH6f
 u7do+pA8jgZI1vhRNteveR5Ba3DvUv+PvYugpwVCzSTzl59g1c6yai0PdCMixYPoWNllIOWZnCH
 fYIlmQp1WtqWjdMNBde8pIC86ppgFpklpzG/23wNmAHKE92ETqBroL8fxlf/j4niz/RvkpAwPXs
 FDJxmX7/qmSyqkf9WRIatqDzKcrfMos7cA2otaiWV/H6eLOJwfZbzckwbqC2//+1fNY4KgaKwpI
 n/vEElQihitwhME69GTu+ffO5lvuqIPlRSMIvBe2ffkdXM4/NSiEf7P/yZuSgpHEdeIGXzVKhv0
 aKbmK4fI5b6JzjLX5vMXQrfTsyuIUmmRavsqjaeDHQtMLB450+7Hz2wKJ+TEpgjc6ymw5/CJ7iy
 AcGqVis3WjJdU5sweCbWbDfl9MsgTQC8JeahCcu6yDpy6xwYv/1GNpPBEj9pTvvr5Uue0z9oAvb
 cC2oTHnJ6bB/V1aoZHrr1s5qeBSEG+xdhgj912MdWCs0sR4QscI1kk8l97hjurQcRBNHltMruIj
 +WEle0qHgQqgTvw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX6HaVAsCF+2Ow
 KFU2LFfU/UL1EnYfEoPSS+yxOEGlqyO1jYW0y9hVpOtmxtG8NI8CgItiJkLES+JppHO57i4f/b3
 1hTp/Gui40RwWJlsvJp5EIqCwx3taUwUcNAlayIh739EfmbBs0ucyPKgYZThc+ymQcS/Cq0d3Ri
 3a05OhV3Upqev11et9TF7l90S2s9TEBm3o/794Bno+JwN12EH3Wc2WV3Xk4Roup+JUrs1h3MsLt
 CO/5rWUz6TX/iwMTAHklpw7LxCH59tD2ZTifH99ogJaAFYRrPfv/01ioLNrdRbJ7nd7U49Iwh6Q
 wjKIIp+3qan8vsQjVUXya48KeArjKts5UqZx+kSOe1Vzzgpf3eum+id3w2GpBvKz4I3GhSs2K6X
 v/kVH/Wi5ISqQknVEhQlE5znWs2busonaIPICGJmvVA3Ww1bwk982EZ6XC4jLodU6IIcOj9zlUE
 sNxWc1urDK7FPZ1Tz9w==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6ace00d0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=QftN5WpXeUmWSfsFEiEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: M6yTOOs72U7k6eYH1ZsbobthA4u1I3Tv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX6psZJc2ZdBkM
 rUPQ5YkfErWMpd9L9iqGybUaiwd61aTmiXeaWRwBkw2PFPe08VRInyuwUKrE1le7n9Wk38i10t2
 yQiVRz8Auk2VEN+3ivHXBkTOtwmdGEI=
X-Proofpoint-GUID: M6yTOOs72U7k6eYH1ZsbobthA4u1I3Tv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_105842_717745_6CE6796E 
X-CRM114-Status: GOOD (  16.62  )
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

The QCE core driver should be enabled by default as it binds to the qce
device node and scales down the interconnects if no child auxiliary
driver is using the IP. Add it to the arm64 defconfig. Disable the
crypto part of the driver by default.

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e80927f87ff26fe3f51db6409f509fb99ad614a0..760f9e9fb2ae13392563ade5de871a5e882d195d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1663,6 +1663,7 @@ CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
 CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_QCOM_SPM=m
 CONFIG_QCOM_STATS=m
 CONFIG_QCOM_WCNSS_CTRL=m
@@ -1949,7 +1950,6 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m

-- 
2.47.3


