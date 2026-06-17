Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591D4CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 23:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6WkFCTGJr0q5T3+bKGuph/E2sDRdxEhdBmqEmxPyINU=; b=Y+OAVN9bIGDPWTsRcO4zJjQ1DO
	W/uJ95mXbZb9X5cSNovmvaIcq9KFw/0TkBtTqKwDVLugV+tfvFhowPT9YK7iegtmLIfrkwmT187aO
	kyGXGGY0LoE9+tqXIUtJOsFNguPrbeJPL95nh73O2ZdjFD7SZH9N85MQx1SzhEbih+GzgUkmaR17j
	N2q88N4hxL250geFePWf1ShWC5bsvkHP+5o5uoSH9haQIbPusnWrjbEx7xuy6SBpCGfcY4eCdnWxQ
	Mt9wLHsW1WwJt9keNd78iPoEstqS+eiRbiHC9xTHMOQv6gR5wA3lYy/6WKumWbQ1v+5dAKBgByP1I
	BaZlF+Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZzn5-00000000Qkh-0j1T;
	Wed, 17 Jun 2026 23:35:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZzn0-00000000QkK-2tDZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 23:35:24 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HHd7np329894
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 23:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6WkFCTGJr0q5T3+bKGuph/
	E2sDRdxEhdBmqEmxPyINU=; b=OlDLAru6SZveBuA9axIjtY2LenL33ZV6JKxqCo
	0PN2QfOqwQQt864ifE28TE8WuzT1nGM0Zge8y0wGLwpe7Tr12QK7aHwDI3exIfLe
	vupJz4j7yLtK1DiRyRtd0GuFiXyzOCIGY+sccZkDKdu4y1QNgP/i73P3IH2ch3gz
	snR0XsAIKzxv3ppK+5Or33zUs22yChyldlFPqm57NoUkmi226PSJ6qS3TKzjq2x9
	/EW74y+oIglVrg9jdXMEhGDlwlgUEnPjeex8JJsI0LNPhouAMdqK8oyaoqiARr/i
	i/IESx5v2SKbZOw1L3oiD9ilCtMNQBQ/N05Ij4Vg/ru+hujA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euw9vjf1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 23:35:20 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1384427c3efso1492192c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 16:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781739320; x=1782344120; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6WkFCTGJr0q5T3+bKGuph/E2sDRdxEhdBmqEmxPyINU=;
        b=FryYQmY5srk2fjREygQp9D78DCaeU6N6JrGyZQVJwBPUSZ1hWlqwi2EYV1RnBoiRs1
         /QsK7A7F5oduRARt5W16CtYb6VnpGiK3LdI38IKD9rsB5f0yr/p7bIeW5A7HXf3apjH6
         ar418jM/2pFWkK0A1wYxrdDkRhD5Uw19Tz+TFJezyKa2FOfUK/KOVzX/3WIxAW6zryAR
         MkaJA1ycbOOGa41fPT31NHnSCCXdB6JVf6MYuqJMc6ETVCZlOP6eFntINBMNCZQAUS+H
         tUmbHyGbUFHd9E60AdX07foB/UgyJZ8X9U1YBREoiUW5o5ELqJBc7AIYSZ8U1RgtwiPd
         xY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781739320; x=1782344120;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WkFCTGJr0q5T3+bKGuph/E2sDRdxEhdBmqEmxPyINU=;
        b=doF8u8XN5mIZyB8/fHDnGM/ctcbpbrp0riYN5H+CaZLX8t4YY06toQTyWkOh1sDAsJ
         OMqE8F8UfvQexnTIOgpNX63+ADeqOckfG3BxcSImbDOFtaiDVakgDhMbIGI5LKmPvdKF
         ZdPSMu+AP5aLAtoScCgYtT3TjQXutOl1m2OQm0P0vaAL4uzIm7AMyhYG71aHTXkzR1sM
         1kwzPVN9xvl1KReKomDahSvvYUnCGq/w5fIaBafnL+aRQTL2hU/rM+nXM6kys/PnJwR9
         DVj6duTqgEypz0+J3f8aKz1lN7TMFWoZiHAeVgZCVCHwYY5JhHtoyhPWlIEmJaSTaWmc
         L4kA==
X-Gm-Message-State: AOJu0YwY9ZImRGoYnNtezWGz08PFxIfrgXy8FR10WcrDEmfGqVLCpS5C
	32xzAdAKWS8JT/xHIwYSylfhc9fPbm2YJo6gi93HIeIawkMWeAOYrjOOe93YxW/TUCDcrIAyscD
	OaZM7sGKVlsHCP6rmb54TqYisSx00BbK8s/yjI/Avd06I6emIs0CEsMl9MC6mIRqwOp+oK9bBIj
	OtlOC4Iy5OvQ==
X-Gm-Gg: Acq92OHNV88bsm8lciE0S3022kXflZ/Zq3j5v6y+pq/ZxE8ZdHg/pn8s1wOYBXZm7SL
	1urwB1rRbnIuq7ZC1OkMzmOSO7OtV5VDAvMpMyI8uRX3W37Vspe8gHZ6CuvQLnb9iJg1fQBvNys
	JV9FIBBQ9YKlHI5bXpn0UbyDjt3ifX0jeOgAt9GiRacy+hbz/ewVSI2F0KOF/sBOCOpUu88Yf7S
	faKLWHjIMhc36pBMN30nVPwPiSng9F+kfh3eEMF0KeJaACgPA0CADhc2q+E2tpyXtk9fccWFZzp
	3jOwryoPzMN/T/QLtfjcmWs32MoOomJELNj2ofrbTT4Jq2f5bkUndCB/K6JyZdKHxslovwNt3Ts
	VXRIXIdNKbIKBAJhCpRJAn5UFKCBV0OPB6Lx05VXf8pv58+Uc018CAzd5nnEShjxHgtPovCyIXH
	dSIA==
X-Received: by 2002:a05:7023:b06:b0:138:33cc:d87f with SMTP id a92af1059eb24-1398f66af6amr2858154c88.5.1781739319575;
        Wed, 17 Jun 2026 16:35:19 -0700 (PDT)
X-Received: by 2002:a05:7023:b06:b0:138:33cc:d87f with SMTP id a92af1059eb24-1398f66af6amr2858135c88.5.1781739319064;
        Wed, 17 Jun 2026 16:35:19 -0700 (PDT)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b9110d3sm18273923c88.5.2026.06.17.16.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 16:35:18 -0700 (PDT)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 16:35:00 -0700
Subject: [PATCH v2] firmware: arm_ffa: Fix NULL dereference in
 ffa_partition_info_get()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-ffa_partition_nullptr_fix-v2-1-bc801b4ce34c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACMvM2oC/32NQQ6CMBBFr2JmbUlbTElceQ9DSFunMgYotoVoC
 He3oGs3k7zJ+/8vEDEQRjgfFgg4UyQ/ZJDHA9hWD3dkdMsMkkvFFT8x53Qz6pAoZbMZpq4bU2g
 cvZhSrqyMkarkBnJ+DJjfe/e1/nKczANt2go3o6WYfHjv47PYvN+OEH92ZsEEQytNha5CUfKLj
 7F4Trqzvu+LfKBe1/UD97FqnNsAAAA=
X-Change-ID: 20260604-ffa_partition_nullptr_fix-66f37bb2630b
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        Trilok Soni <trilok.soni@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781739318; l=1895;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240202;
 h=from:subject:message-id; bh=sxCJ9JaHTFlAf88jTHeT7bHfpfuZdDYM4bC7eUPd658=;
 b=Wo/uNJjQaEXM7mqbhOxqL7nAfVNSfuVaxC+KNCaSKKVBcN05Atx7t/8GsoFVTvepDq8OM0atQ
 HNpwpZEnzziAW0OdoNLE6ToQKi6BUslfXVK2hMDJhw+HrSH7MZq1kh5
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=8n+IFmsCDcEIg91sUP/julv9kf7kmyIKT2sR+1yFd4A=
X-Proofpoint-ORIG-GUID: eBSXeXXIjum7vWq9ndv2osZIVAgZmVFg
X-Proofpoint-GUID: eBSXeXXIjum7vWq9ndv2osZIVAgZmVFg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDIyNSBTYWx0ZWRfX5e/g+crfKtuG
 1oWKpbMjjBF5qcuVCMv6gPtY6IyL1BzV+NGRFu2MUdoemUEv29FrkuHI90qqksOF+sAQdn2H0Hc
 CIxymoX7yuDRsjo7f6N0tm0AhdsMNF6yT5U8lrsgi1dltFexlGe8jfFXC4//xqVW30w7/VCwSDs
 GlQlEsQDDGjXikaHsTsUXEW3rict+HjxQAh/QlPo6yoDPtNnc70U77hHrkCOOWbQfyEaDr6WUrW
 Qj5+HJ8DHnKl4bKMIQ4u0u1UaEVoRXfefiRcyMdokzmzjU4amSQnSW7JUuTn3482WmnWQ+MqegB
 isOWhV7ePVAYkksBcNHkNc1nzermWQKGFuBcY5GK7fwW+O2kudkU3uJGkLWKm/nrZc+miX+KM1r
 TvEcfgWtsOy/9v5scx/rg1Ewth6k85NPC3XlofN+WI9ZtxqWXslAptaKi1hHfdqomLPljvFwc0b
 pixZdtJUHlgN9hxoZVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDIyNSBTYWx0ZWRfX/vv/szNjK/tR
 JE0sKNspbfR8KY1LBluys7/qX3OzZBIfwVdOv1SD1DV6wNVspgodSOoYs3fzvXBFKh+Pw7a9Ncx
 sTcxVuE1P+3c2EOWN+iAcmLMFC7SuXY=
X-Authority-Analysis: v=2.4 cv=YJKvDxGx c=1 sm=1 tr=0 ts=6a332f38 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=jr3FWET45_D-OIZeFJkA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170225
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_163522_788291_00617E76 
X-CRM114-Status: GOOD (  15.55  )
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

ffa_partition_info_get() passes uuid_str directly to uuid_parse()
without a NULL check. When a caller passes NULL, uuid_parse() ->
__uuid_parse() -> uuid_is_valid() dereferences the pointer, causing
a kernel panic:

Unable to handle kernel NULL pointer dereference at virtual address
0000000000000040
pc : uuid_parse+0x40/0xac
lr : ffa_partition_info_get+0x1c/0x94 [arm_ffa]

Add a NULL guard before uuid_parse() so a NULL argument returns
-ENODEV instead of crashing. Callers are expected to always supply
a valid partition UUID, so NULL is not a supported input.

Fixes: d0c0bce83122 ("firmware: arm_ffa: Setup in-kernel users of FFA partitions")
Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
---
Changes in v2:
- Drop special-casing of NULL/empty string to uuid_null; treat NULL as
  an error instead - as pointed out by Sudeep in v1.
- Simplify to a single NULL guard before uuid_parse() rather than a
  separate branch
- Link to v1: https://patch.msgid.link/20260611-ffa_partition_nullptr_fix-v1-1-ec2b7ef7e130@oss.qualcomm.com
---
 drivers/firmware/arm_ffa/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index b9f17fda7243..4090be782329 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1129,7 +1129,7 @@ static int ffa_partition_info_get(const char *uuid_str,
 	uuid_t uuid;
 	struct ffa_partition_info *pbuf;
 
-	if (uuid_parse(uuid_str, &uuid)) {
+	if (!uuid_str || uuid_parse(uuid_str, &uuid)) {
 		pr_err("invalid uuid (%s)\n", uuid_str);
 		return -ENODEV;
 	}

---
base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
change-id: 20260604-ffa_partition_nullptr_fix-66f37bb2630b

Best regards,
--  
Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>


