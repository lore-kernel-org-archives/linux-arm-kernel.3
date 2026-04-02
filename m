Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5E5D3942D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwshQwGEYEPB4ewYumRkBFMYexYVpzxnnKi7Qlm1u/c=; b=Ft43Ajj7nDzYRPq7prc0hm/MEe
	QryIozhfHJ6ScFCAvvw0oedQltdEXdRU6Lejx+zpQIgbhBrrqPOTQ9s3cAXtT9lOl1cPUMEiT21i4
	Tpp4PeTtm8QUkRTjWGo0VIFvzDHEu3gRjCNablUKBAWCB41f9gY6Ay4E61E0jDfRwqR3R5AfQEpi6
	bN47YsqGUfml7GNQ6aq0zL7ExpqYVeLVAWTLzNsWapxP80s2a+Szn+Fwq+0VUmSUQCvceJRGdrwum
	/ETkaDIKBoiEyNx37Oa0BESK3Z7eZhYKjmaOtXRUTlGtuUSopYCv5xqCxzJTBxjqDfrja0VfzAMCT
	aUpl5nkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Ipf-00000000Hj9-0Kkm;
	Thu, 02 Apr 2026 14:15:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Ipb-00000000Hcw-1ksn
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 14:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=HwshQwGEYEPB4ewYumRkBFMYexYVpzxnnKi7Qlm1u/c=; b=Ye0jCBma8q5nVyvgug5V32qUHf
	OUBS8f6pws13+1E7i9cdReOCMhl2ELZrvDg/Iw0i43FJJr/r3xQm/rld4OyDtR+q0aZjkkyxBIDVp
	0QphJ6qQm4b9ZwelcLra8inKDQZiMtjlIsd/MTOpHmKUHrgyKdAElRnL3YcZwZcVf5SkF0bf3wDIU
	0JxSBvcBHn0T3L0owLKIMQ0A3V7tHvVJen+cMz7z3Iz1jiyFQd1NAFsQXqGGbXw3rHVRVKYG0nWRs
	EZf6wqCvgHdjemPoTqXfjNbeg7Jnn91FeulI/zhbF6sxgzbqEMDNFtVA6c3h3sAcs5qpoEJK8W5t1
	nC6IzZyw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IpU-0000000CPoa-053q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:15:34 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632CgZMF4009488
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 14:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HwshQwGEYEPB4ewYumRkBFMYexYVpzxnnKi7Qlm1u/c=; b=JK9y2rzy2T82T4od
	hlXEty4Z194J87BnMHPKV1Xm0zaIdOavDzvHIjzVTkZJFpmq8LtbZt2PyzyqSERt
	iQX1gQmPRsOF76azXI88JRtsbXsDXgT3NT4yFV8RsE5IKvIONKrLNac/yXF6ME4D
	gDkbIdvlcTi5EApn7Kn/UnAaLdseqaPM0fRI08GakZ1U01PNuGh/VdaqIHkOEtpp
	qOyzEzFHQO90FjRnF4aiJ0asS4jiHtmmcVR7beSN2+xHn5rR6csNXKG5Zshk+Vj/
	SiHkOmaPKwcq6vdGdmkMFZOWXvebEdUC75QaCSfonmbkt4Gcg3l2ovpOUTPiktRC
	nCZxUQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d97e04erc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 14:15:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89ce2a7fef6so35298766d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 07:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775139325; x=1775744125; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwshQwGEYEPB4ewYumRkBFMYexYVpzxnnKi7Qlm1u/c=;
        b=NsGr0aDX3FIrZXJEuQI7yCQfnVHPH1o37gnfvO8T2et6jk4YiajS9feiZflUvzhNFW
         cwn/5H4R+q8KtSEB7v58N7Edw6lbBmNlst+sV52fejpFvON0YdiAjuTlVpLuo1+kvU9Y
         CcQ1Leh7FpIHCSXoWay9LWQ5a9cJxOTwwhO1oLAGQbd67XeK5BnCcHFlYcex+hLIX5Wj
         fMQQczUk6vuiExAHD1RzlK2fVH4DC17KbQedsPsGu2Kg5D3qed1zqIU+v6S+5s/L3Tmz
         dZrVKL+mVjSr16+EFn+jqZzurOyQkp2DIbkRGBnUkq5LJ3H4m3S2266IceRJ0EvJ7LoP
         AvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775139325; x=1775744125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HwshQwGEYEPB4ewYumRkBFMYexYVpzxnnKi7Qlm1u/c=;
        b=QC6nLmpxDujzHw2cBv8stn49ax50BNQG/aMeOFyZuxfTHgVyl/Ok0MG6VP9uoaNuPE
         RNL1UK7y5rmvvsh0dVGNFWyKMgWGouzku4vwUoYEvvqXVMXGSY/wlYP+ww84xV78GY5R
         lGWGvFarF/RLeb5aKyC8AFft17WbU6kQL80Jx3JpOaPXzkEOR+M06/XitZ3B5vqweZQL
         xoqz8/+Px0VtMLtAEJOscg29zmiWE6aXbMO1KpGRUWQrwkFyX8kAG/3U9qM34ILvjKgx
         YRQ0KuqHgGZMEVBzB8H+lEPzuPqUsQkvvd/b4YvJLKrm9wkStH8KmLKbZKeBylcRf80v
         9HFA==
X-Forwarded-Encrypted: i=1; AJvYcCUfPYosFvFaFbzmRYv4MwyURPcNz3N2YoFRKsa5KksRgJPGzzeo9C9Yo1JYXchBT5HVqPQLp/oJSujH7gRMl2/2@lists.infradead.org
X-Gm-Message-State: AOJu0YzXY2tRQ58X56DPvefxkargbSaqEIdrpDn4VGUODY/aXfX1DFyk
	Gael+c3FkVa5L8WZDjy5+pHQazrGwHvzcr6x2Bl+pQj281MoYgUHbcK6cG7pJvpTKuHTTUkbhvn
	815sS4Y3NFNYgkJOQelPLFg+rFUOAhEw8qc+o9LSTa/xQaoLnV3xyeFT6RRw39Bw/hM8kjWqhZQ
	6kFg==
X-Gm-Gg: ATEYQzz6kCYB7OQeDc+Ye47FZsiXMijqcF9u3MFOGydggMv/SUCrfmoHQ1wjYmLAKdu
	vzPOrG9mlE+3jSrNooyyEJpnIpi3OCdkGtuIy0L5PUSDZbpQJa/JUa1JIAw76bYnM5Bd+z3ajjl
	Bn4UUOY67Li4pDywow88SO9IZZykLLbxPzf+sdRAVHW+ZxGhH7pblrAsglBO1pf+uCY8itlxZ9B
	DvhFo3dcdhYJndA1LzthLZ4phruemh1LsqAwxJH6nWstpHkHatogC7bedJZMFiXPZup7pcMl5hi
	XJFNeMFiDN7oNt+Ik4VjebNgibI+2aHMPJodlKTw94shmpLyghZFuq3Ea2YrR954E2B66ogfUXC
	7FH5cXhpFR/iO6du3SMGO+qoxvBIZuDz4fm55i+5dy9ntqYocTCBl
X-Received: by 2002:ac8:5fd0:0:b0:509:2822:670d with SMTP id d75a77b69052e-50d3bc2a2f8mr109665981cf.27.1775139322503;
        Thu, 02 Apr 2026 07:15:22 -0700 (PDT)
X-Received: by 2002:ac8:5fd0:0:b0:509:2822:670d with SMTP id d75a77b69052e-50d3bc2a2f8mr109662421cf.27.1775139320358;
        Thu, 02 Apr 2026 07:15:20 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a5e2sm192824885e9.1.2026.04.02.07.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:15:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 16:15:03 +0200
Subject: [PATCH v5 2/4] software node: remove software_node_exit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-nokia770-gpio-swnodes-v5-2-d730db3dd299@oss.qualcomm.com>
References: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com>
In-Reply-To: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=776;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yBKrNw7YytejW291mPySbI6LGBLYwN1ehugPvNfrHLM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpznnvGSCWONe5TLbuQtSrY72fMOoZXTKRAcb0s
 mqhmDG1RZuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac557wAKCRAFnS7L/zaE
 w1OUD/9OSD86XkGc+sAjVkMGHKvcn39N4RTc5O0XXVLyLfKn8tE4xyjvFcPy+smX4mZyqyxcO9v
 QE0Y54slQVt6egHK85JFznO6nDzDzrYEI4wJnsTzUyRS/cE23bZdQm8DFkgyYgP8SulxVAS3F+e
 d+SBdsaUs6fkx/LqtPKOc1XoUXMTM7FD9IhjioyMDVXHUHCGcx0x8d42mPmg1PiaQLThQCwguoy
 sncbcYKbq7W+1u5FKq0JmITwHq57JrwfABCNQI0X1hVrQlwTi9AXAto2/4SHQww+mzBIse1gNU8
 gjo5XvNYp5r0dqhHoq6mXrJ0+kOV6ElLlHCw6n+vrXNjmMzdcz5Vccwh0z7vqIkRJvZwoRaBhHm
 0xKIF6wX+eB1TQyioX01Sn/QUuJ1WgrEdOnx2t0/EQgEJVzp2gqeJLymBvCvoxDroUsRPyF1WdB
 P5fB2uoHdxlEid8l7NJPUtghQ94mOdP9pf16fIt+hn53sovq4v/O3tkDlVDcDL75pxTWYHkk+UK
 KmasIyRWS9Slo0MnNObblidd2xrrH5qjDmYLxjMyAdowUPByvMTuTwsvG+2F6WNzAF4gWsc87h+
 og8McoR/tx9in0Wch9REdNGOErbElO7/2aTCUayieZjXfpgNFbzdYNUbZibB/Y/2s/wiEhPOAVW
 oB7blfpwAAyLd1g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=fdGgCkQF c=1 sm=1 tr=0 ts=69ce79fd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=mhlm9Ems92mV8WSaVUEA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 4AtcfatFtwtg-rTtImWhoZpEGWWK6zaU
X-Proofpoint-GUID: 4AtcfatFtwtg-rTtImWhoZpEGWWK6zaU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEyOCBTYWx0ZWRfX4VLfBU0Wap4J
 hQfQSIynXW56zPnb95jGBJNcIkIlYp0TYF6tiB9SA0YF9HgWA5SlMvd9eX1k448Gx0MTLQpDzN2
 bxIXemylFwDV6V5H9mGqgH6dDMIg4RAxvkethM0XOI0QtV2DgZyGTQGfU5BvvcZ1As+6zdvSJuo
 edMY9e6xRDFIgisSTCMHAd5MXk75/EeC4ld52msGzXr3X7/5IGvlEMEqSizjgWeqC6NWlGtgPY6
 V1eKwFLubgOrMHWLNfFAa28wyqhyHS3nhV235LwV5sJVP6Q3pu8CtBWkPGaxt5+HQnMJDnU9HCe
 lK+tfQUPaTdEG7rGqL0FfKU75mesZJe/RlAHB8ujrqWGneyC0hb7vYimuL7wunHujVcIo8zsBRd
 H0ajbeFCa3nA8R/6Pp1CQpb+tFMDwpzA2o31OAWSBehO19KTlEoplijdz+NtKxEsGLiK42uSUBV
 Fov0JyYZc4yV2McIMCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_151528_562768_D4BE6582 
X-CRM114-Status: GOOD (  12.34  )
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

software_node_exit() is an __exitcall() in a built-in compilation unit
so effectively dead code. Remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/swnode.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 51320837f3a9f1bf4f65aa161d9b941affc74936..26cbe1c2a2e043a2315764085207561069c23ccd 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -1135,10 +1135,3 @@ static int __init software_node_init(void)
 	return 0;
 }
 postcore_initcall(software_node_init);
-
-static void __exit software_node_exit(void)
-{
-	ida_destroy(&swnode_root_ids);
-	kset_unregister(swnode_kset);
-}
-__exitcall(software_node_exit);

-- 
2.47.3


