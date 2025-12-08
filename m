Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA11FD1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 02:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIxJHveJ43ORw/a2qSJOZSHCa20m7AbfTGH30DPRWSY=; b=yabRMiajx85MibWPTQRFNEuTGi
	7HQRsOqyOVGuUwnv+2HzFpLQh+dFLlZKOhuvMlLZmvDZ2+frrsXX75htREmA0iQGOnP+sYoR2XDkp
	N+O27L33jYdNPYvit3Rq0EV02GNJu0YbWdafIU8VcNOZ5S7OJ1FPWalzlAzEf2Q3bp6xLSFqLHJV1
	zZl13iB7e2tIY+Xylgb3TzxsN03XJYPkZoNDkZP6gj4M6TfzVsenw8unkwAZPiPFX/Ahj+Qhrycc5
	K6FomTfsybIFDCO9aayg4apWKAvZJoKF1DNX/naGfD7yEjELBndCGX1jwK375DDD78mbh54ynNQlA
	yo9JDD9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQgj-0000000CSUt-329b;
	Mon, 08 Dec 2025 02:09:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQgg-0000000CSU3-345n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 02:09:19 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7GvSVT1679722
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Dec 2025 02:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kIxJHveJ43O
	Rw/a2qSJOZSHCa20m7AbfTGH30DPRWSY=; b=nRe4253X+m9PPH61/hZsdvJAxjW
	Ux6GcQpwt/rbmNEpWYyNclztFmysY0MS9x9s4mEaLS3S+fNktF8zC0qFYSf3RTm3
	GKIhhOPT8fDWr1w19gEoAo/sfGrAc8w1S309WhvKfVNUQMsSvNw+eLX4s8Rzk0z4
	8bAKWMtXnoHoGXLh6LJcvOjWitFrj4zRnpYBwoa68tavIABesNFLBkaVbId4EprR
	znY8RQyRerkrUBn0d3mZwfuNLEPQIcnwNtHIwsVzrodkSJ64cn+El4hAPcwCp6J4
	I/XEnLjMbgRyYNJ0OXHnq3t7wXXGTrsZ51jCO4RzG4dEiqD0e8DRX7we81g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avdnju6yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 02:09:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297df52c960so81213625ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Dec 2025 18:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765159757; x=1765764557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIxJHveJ43ORw/a2qSJOZSHCa20m7AbfTGH30DPRWSY=;
        b=KTA1o6hp6yoPVZCH32uPRpu11rsZjAjhbz6h6zZv/ckWy5Je5BBRs1usmHMgccpeS1
         fm96rQ9WReslOfKwl29vUtCTNJljNlmL/2bXxw3tejTXNo4hxZwJfnf7WCI5VhY2UTFH
         NIhLZWOkBxgALV7nmy+RbuKC+nM8ZEQMmM0Gxrhtgb+O07BO1Q9rXYzi9FY4d3hQ2M3j
         ta5gDA9vnwxDH3Qqvllqtt2qFQbFUz/x6oUnHY8zApwE8Sltfj3me922/VRwVg4WAt1G
         F95l3im0923nW+eZ0M2j6XY4HauA+7f7sDfUpLSTPv0sPJTNRtIIh8Wwly17OMrqGBjS
         0B1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765159758; x=1765764558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kIxJHveJ43ORw/a2qSJOZSHCa20m7AbfTGH30DPRWSY=;
        b=lvACVRF+IOCmcMjsZ5K2tkqXaSZ0gmBRLlyw4BawPYiwYS2ebP8ytX82HBoaPfv5uY
         LEU2OILMxL240YvtkX3J5W4yVQaP7Oaq9Ebmi6RPZcbPfhZpNu2Xq13RgtO6j57q4om8
         ZU1kyafPKctsKhHbJprW1uJ+XrxLzumfgYua2u4cZiM3n4l9o9jcwgecZpv6O/JrTjEx
         24LzOu+M+q564Zbzd78kyF4yB48rkhxXR8/TJpqQS1mDHmBMa578VbCuTlsWdEhTYpyA
         lBtJgEpJZJzlJ+XzV2mAZDQjn5ELW6tVejLprzVPaRgfeSvm8V2NTMflX216cLygxXBd
         UHYw==
X-Forwarded-Encrypted: i=1; AJvYcCU9kViRzAV+BI8dHJJJIXr9GVsu30fOxmT3g2D4SjOwPgjyZptK7F4CNvQ7bMUKe3WwMN+QwCfoxEtjAYefkVKu@lists.infradead.org
X-Gm-Message-State: AOJu0YwXv8uEQMyYVtBUzxrfl9rS3xEYjVWoOADULfNMB/PGgrPEPoNA
	ziG41JBNagkCDh2g9XgoHh9/L0LmX73kfbymuk4jCVZynZHUo/ejd04tPhPrcMosrdRdNIlF+gC
	JHTAGsI4ZV5G7cek0yRrRFi28/oJSRUm3R0xdCQfEBbV6A965numNLBaI3SAY6cTn6oUZ81LUeC
	sgbQ==
X-Gm-Gg: ASbGncvtMjkmyfyER4403yi/js4DewhJkHLEDZEqRoNAx16smZbEiPqgP8CUyMa3NWk
	o+5ZtLQN5wJ4RtLfmKPQ4DM9FzGV8PRinb5Faa0uUl/Dvq0waBf2Svg6fTCV7nKwf+wEhV5C6ya
	CCNd101FcYMh96K6z8BEhf+87xnObLAde8xrGoO/gyUbRkaHLSeVgrHsoXp6ah0L+2rneYI81L9
	WnvufhAT0N15dtJ7vMLcRnSRH6UMh5ndtsY+TsK88ofsJfkRS9FGaz6bo+fNRM+odjjXo9kpCcC
	QjInbrOzptzqa2MqVo51oLeBjBRwzY+c72QFLYh2Si4AUaBMlDpNu2eVjh1gYmOYh3gJXEhnV9z
	Q5E8HmhnT2ud7FglX9I33zInjYuXH/K0CF76o11eVFi34Jh6mFCRO2HiV
X-Received: by 2002:a17:903:2f91:b0:295:745a:8016 with SMTP id d9443c01a7336-29df5676d56mr54513815ad.11.1765159757642;
        Sun, 07 Dec 2025 18:09:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENSDeJBY4zviQImrpnarZvkPxNzeZekd06zEmZ+O5Ue8s5qwUKtOx7iGg12/FzdgPwxpsKBQ==
X-Received: by 2002:a17:903:2f91:b0:295:745a:8016 with SMTP id d9443c01a7336-29df5676d56mr54513565ad.11.1765159757194;
        Sun, 07 Dec 2025 18:09:17 -0800 (PST)
Received: from quoll (fs98a57d9d.tkyc007.ap.nuro.jp. [152.165.125.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeae2552sm105933945ad.88.2025.12.07.18.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 18:09:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] firmware: cirrus: Fix confusing cleanup.h syntax
Date: Mon,  8 Dec 2025 03:09:09 +0100
Message-ID: <20251208020907.5476-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251208020907.5476-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251208020907.5476-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1484; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=6yRJxC7IlUvXmP61EM44dgOk28FMi/N4dd0IPIqh/gI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpNjNEAr7khnPipEGOjI2elkT/JnWui7m5ssgr9
 TeFAq3fDW6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaTYzRAAKCRDBN2bmhouD
 16nmD/oCYgq1qa5I1ugGeS4GNxewBc32IfFr1Eb0nzgK5U6WUwWoqOm7ZwjNShAa1AZmSS3ns+b
 8Kn6RWcT7rbma/f4La1T4dzPyaGIVcFvS1hjL1wGW3VEw713q1ilnO2Lf1+hbnPMVRhCAwknYS/
 9GIoZY2sb5CL9NDKbxoF+iupux9evaxpLVSjk4a4Qo2fs7PnCz8lG36G3GxgKWJxEK7Rqw+hizi
 4lwWzyTf2IgQ/2mGNdRRNQLyrQ82BL/MacHYHqtGV9+uxXCfNMYvXe2FgeQ+QKcEIgenzuxE4Q5
 QkWfbjUO//8f3Y7wD6aODLbFYafFZ4jyOUq2KqDgdBMFu2Yqx4WSnTmXhDp+UwTh6SCkMzhjbkl
 7R7hIQp5L8tvgWGXmrAYpJCLA8VV53VsvnB/X+kcycpH65aXpHf3KKoLmjxjNTmD+poxqsnHROe
 JhxBTT0K8s5clCEi29uds8eLiXDP4YYs/KHymootkEXkOlBAhKn2Jfp+yuavGFUiuIu6JlwcJCQ
 whMlYTxSr++Y0urUHWoIJ2TkDK6LSj9u4yldAu+tXawnx3b1OR4pZ2l2ycQWiu2CtFAikcXbtfS
 nHr9wg301kbV6R7Q8AyttLdRunKbyV5N0jGY1v/Ov6ReYu0n94sxrhjfhA7y5B1HPHDaTJ0VZMi j768YUd5L7aKZ2Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RSjCzwcAHdRCBjd0B2BfTv7gcM0UEttw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDAxNiBTYWx0ZWRfX4QMYrcB9UOKF
 U/VTOQ/byPHAtRQnHfQYmARVfayKxVupf5kEQzd58ArJegNHX2IjMRV1xiwBbRZ12zDO107Lqly
 TzPA/QIxQlOaL7qFNgRmPQUC9Bo+ETL/VCpxsKA0sd4azg7qgu3irebEbb0yg92d29VK13nDtKp
 p3J6SJShg+WZBCMGr83ELt9xor5+3F/okuUyuDRQidvRyPCLSCupXcOy12tuE+xm4vEgT6hE2nl
 iU2Wxu2SXFxYIwTBSY+7Pgcp7xmZZLlWEzN0vcGYnJXWEAtETvLyrP0pcr0bHiW2Bcyh91AZHJc
 blcX0vmSNmIWLT/3EP4mG+50S9IOp7sZ23FuLICDsNNE/B97Vhoi+LPJ/o4AnahvpowPzkMR66R
 ITI/pbsL2CD5mS7cLf8poKCEvfvpcA==
X-Authority-Analysis: v=2.4 cv=RvbI7SmK c=1 sm=1 tr=0 ts=6936334e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=vTE1kzb4AqIx7XBf0Bkr0A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=UT6wT1bYNktT3YwyLxwA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: RSjCzwcAHdRCBjd0B2BfTv7gcM0UEttw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_180918_817304_7D427DC9 
X-CRM114-Status: GOOD (  15.78  )
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

Initializing automatic __free variables to NULL without need (e.g.
branches with different allocations), followed by actual allocation is
in contrary to explicit coding rules guiding cleanup.h:

"Given that the "__free(...) = NULL" pattern for variables defined at
the top of the function poses this potential interdependency problem the
recommendation is to always define and assign variables in one statement
and not group variable definitions at the top of the function when
__free() is used."

Code does not have a bug, but is less readable and uses discouraged
coding practice, so fix that by moving declaration to the place of
assignment.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 525ac0f0a75d..86d49dbc6fa6 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -375,13 +375,11 @@ static ssize_t cs_dsp_debugfs_string_read(struct cs_dsp *dsp,
 					  size_t count, loff_t *ppos,
 					  const char **pstr)
 {
-	const char *str __free(kfree) = NULL;
-
 	scoped_guard(mutex, &dsp->pwr_lock) {
 		if (!*pstr)
 			return 0;
 
-		str = kasprintf(GFP_KERNEL, "%s\n", *pstr);
+		const char *str __free(kfree) = kasprintf(GFP_KERNEL, "%s\n", *pstr);
 		if (!str)
 			return -ENOMEM;
 
-- 
2.51.0


