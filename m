Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890B4EBFD10
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 07:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y3r+aQYgMBEMT6ku800XCoTGo0hyxDK8cY28YsHhpYU=; b=mTFZRDAvwucKw+MIZhwlUI63s/
	W5S6zY5Jxs3MN3VEYd0VOA+C0FS9K+jixWfSDtYQ8Z6weGnzFCkXUBwmK22nuHKf8d2k/EJXQ2lC4
	ud+6xWzDqPHtu2QHgkZ7D7FWixnvc2Rkbnwga62ZCRHpHmRMNslMwfLiAshUI24ToyXxcTCtTcbP5
	gMg0jntjkvu/6FjKE0PZB9hgpOprh5Xj6jKSp1Z84U/p42oH3C3Z2tQwx2ChIvJcinPAUUvb3+CMl
	7YbKgsnbP5jmGIlVkkVVclrs7fPSX0wVPMtLYczWRODdkVt50z2d2WRWDsHu87iBrxokPEKC+vI79
	gdR5ds3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBy0-0000000FAnT-3ArV;
	Mon, 13 Apr 2026 07:44:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBxx-0000000FAlt-25ny
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 07:44:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7R2FA117582
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 07:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Y3r+aQYgMBEMT6ku800XCoTGo0hyxDK8cY2
	8YsHhpYU=; b=AyBXHeuncUj2SlqQHimyEvSr0VpXT1UnTu9I57tHajzg+BhsxqB
	VT+gFyGFZ6IAVYuM2rASS0xVuwiB1TwPF6ezaIq083U1qmx3AY6hMxfDD0DNbvuI
	JYF7icxAQ379i5wVBy2uxql/gKmxvbnWroewB6HKTJn1AO4VSc/yaSUm4PIVmloP
	Ly4sGB+gbbmGSRXEu+feMu7hnVOJJ8H/tINfcfzEZcelsmKko831AjK1h/i9Bqi9
	hWSKVAGapE8mDpzb/pv9Ql5UOZprHaHSYbNLFWayjLRn56ZkexKZr+eOwUB8JESZ
	/r9DrowfD9yUIteloRcd7K/mTSNSDzQlZRA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfewkvayk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 07:44:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8dac6233so74681071cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 00:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776066256; x=1776671056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3r+aQYgMBEMT6ku800XCoTGo0hyxDK8cY28YsHhpYU=;
        b=C049FbtF2TuXGoGoXfqDgxguyZRxSMMPKDz3VVBw1KSQHUEnmyNH5jWsBW7I8W2knn
         ZCw2Fnm6E2fKgMwIvnynV4iUHLJEld6t9bMWRe7PVxg5e9d+SYp7Pht4Bk5ver9UteQY
         uG7I6ypnCk980sjluQaEV0NEnELddJIGH+pbZG0jqrcBJGGNJu9kSyS/fXEYzLoIZCu9
         k0NRtn1yVHrTC4MZBLtPw/YGgICzyCJAvSqDAp1EVcRXEpO/MEDKd4uZwqDT3dmb0wwg
         0mSjQwlsse0MfQfWiyuSd6psBN0TgyK/n12rrlKnOTOMuT/WPS8EV9BG5Ooo6QSiWwoE
         f2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066256; x=1776671056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3r+aQYgMBEMT6ku800XCoTGo0hyxDK8cY28YsHhpYU=;
        b=PNimlGyj9c4j3mtaiEACCFKY6Q7oswrAr5BHqA/AbLDT00bkD8SbUPgZDZOLuLCIgr
         ceFNZo1gDLZm9CmPGJ157qb+VtlIOaHYZRkV/8W5CoJGPONZwxgJiIZhXqKkzayvaU/N
         qL6veScucFrq1RbHF7y3WpqtinPpqJU5n+gdyErhNRoOsVPUhKBLxkhEV+cCkBTL9p6B
         ayQtjkHIwm9fYzAKP1xmR+zY64r/avov+eBpOOIzGnWf9EX7HyxIto8bL37maJYlI6Kz
         +ampEVvKpYTXZcRTTsFSqsqnO2Z7BMAuLMJaI8s46Cm5Q/OT45PoVZUosuemkKi+QNKx
         hARQ==
X-Forwarded-Encrypted: i=1; AFNElJ/eQpyg4apKNMKH5FeQ/hxF3JIM69j417cQO3G7HULIvminNkB5SwzUc/tFmcq4rQac19oeaO7foMmctsAYL77e@lists.infradead.org
X-Gm-Message-State: AOJu0YyA+57CLGox4530N0nQnMXRmOSEsFuL4tg+DncgF2JjSUCImSde
	qvUyBv5SnbKqVK6U8+ByRD5N6OZGD/LXd2KJXIrz7q8pvJG/iC1NNG1XOvYb+vLc9+ZNJMcZ89P
	mDBjuj47I7z1pAyQ10jth5Dys3R8Wwy3lGHZNbHSmieGE6lwr7dQ5FBR0wbEiA0fKr3gAF7wrbs
	U+7w==
X-Gm-Gg: AeBDievsiAbfJ7Xc3CyskR++HTnycM6y1THBRIAyGIScstKHMmGTHN+HzRGilzvQ1pv
	LPljrDchYWLePcGVQQ6l2nKIL4nxV2uqvxAe0K8opDTa323gh3iz2US724ZyrU6HT7fzOOr6yEr
	W9BJPSGfEdK0bbws4QUdssSAwyf4ofjeHdskflCpTwnLI+be853hYx5irOqytApv80pphPq+mpm
	GpZnd27CYvHvP9kQJnZYgNYvSckQbBF0+es4R5tJ9akDx7H1s36RM8jvVUnzdbVUePwZgr6saeI
	bk/lXEsU8cFqniCBIuBB3d6ujTxRxWs6i5qnn3NgFsn9f46q4kIcLks5HPlZ8T/OWQ16Ps4F0Sk
	8B4V13/PcUTps+FohEVTuv7DF7cX7wZ4XmoRq
X-Received: by 2002:a05:622a:2485:b0:50b:50bf:5bbe with SMTP id d75a77b69052e-50dd5adbf6fmr172964071cf.22.1776066255660;
        Mon, 13 Apr 2026 00:44:15 -0700 (PDT)
X-Received: by 2002:a05:622a:2485:b0:50b:50bf:5bbe with SMTP id d75a77b69052e-50dd5adbf6fmr172963821cf.22.1776066255250;
        Mon, 13 Apr 2026 00:44:15 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67a46bdsm137465635e9.3.2026.04.13.00.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:44:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] Documentation/process: maintainer-soc: Trim from trivial ask-DT
Date: Mon, 13 Apr 2026 09:44:02 +0200
Message-ID: <20260413074401.27282-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1043; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=emAvh6toXGOd5B6fz9M/oSRBGye5L4QrB2xQSA35mQk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp3J7B9CNNwKiSkBiaBvTBEt7nJ0+9KfR4CI6jJ
 ReGlcqSceeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadyewQAKCRDBN2bmhouD
 1/2wD/9L24BCH+anyswyq/Pmf9FjSqqRahmQhA3Etm/mZhIjFMkR7SmeIS94BhUgJ1CTNj5Nzrz
 GulTVM6c0ublpzeEtJJJvQ0IOxUWo1d7U1yaSxWdplLOdXNMTkJNso4LcT7ImlPimc9wIzbJbAz
 QgFHg/4XqpKgRqY2MfWixigQ6K3Qr5VtakXiJ8FX9QN0TnTCWhDtadNIEHwtdgVpDd3cL86VDXO
 5VXHTfuGiY6WhqwU1cDx2apqEciWxE+8EnQ2alx/ndl5+sXsGmnNSG1usVNKAN3kaSxsGdQPUI3
 0yEgACJPWScLQoecEZ+F9E0VQezmfyDO8eGY4Q4wMDWigvvXK4c1a1J/Mrhgt6K2QcNMi4roudX
 E6eLr+JJtZ68hmfkXyFcrjzmYNloQ0Wnh1Z92i6KSxCzRZJLMvCwC/pvdBgpvD/iNDBEk8l/E9J
 IptP1feZNdAcY1jJ7JyoxxTNrKP9qewZYrUvs8DcyGCoyOJ6a3JwQT8EdPcw4cN0UvgIfdNxAQv
 KOclVDo+A7WIc8z3kA+dW8AZzEDyn7kg3lHooWQO1D04bnlqlK+YfrplJJJN2t9ZLBC9BicXvBD
 DCClGh127H4DYZsDyTAgqzbkiwTy7UGVsr08momrz7NrSfZIXKNS5hjgqcd/yjCnUZ71MQaWS4d q6mSGtE0n8TVtrA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bcFbluPB c=1 sm=1 tr=0 ts=69dc9ed0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=gmrGOGr7E6VI24hohNgA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA3MyBTYWx0ZWRfX94E1xQuqUv1R
 Obm2unriFgf/UAKDvEpy9JPWZCYTeg6gVMak+RqEW5GdzCVOJF7KJamg0neVuPam3UK8U1u++S9
 rRil+CKgxLWtaz6KdWD3JeoYe5sR7oAm+b8PFhDMiy6ypjbm9suTcMC4pCQ7WqumyOlnnxMweCP
 6BZP/YdagRVOMIpVjEWOLa3kosnavEWvZlY112NfnYJ5CGM5O3o2bcUP3RUurNjmvKazslpPcNy
 TrztC/NNBbfgK8jVyRYijltPGrlJlldI1At6vS9roGipOwTp6K+6lFAnnm1CN8UjSMWKIOrJ+Wl
 ljils2R/ZPxlSAXeUPs2pj1E0Qj0DFiVWZdpHjD8LqcQ47SKjrG4Ohqqj3QRg/GiEojWsgaewDZ
 YCRge4FupaztXvwxQVyWdKwDYSiP2UHf5L7In3NPxUez9pCZQQVcKvYVrf3QIZSGczaNiMqF7Lv
 QEM3wgsiX5kHDZWYRZw==
X-Proofpoint-ORIG-GUID: YNJfLktWlArvqBGyiS9KRxV0e0Xrd27c
X-Proofpoint-GUID: YNJfLktWlArvqBGyiS9KRxV0e0Xrd27c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_004417_660133_E6A621D5 
X-CRM114-Status: GOOD (  11.79  )
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

It is obvious that one can ask DT maintainers of something, just like
one can ask anyone, so just drop the sentence.  Concise documents with
rules have bigger chances of actually being read by people.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/process/maintainer-soc.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
index 7d6bad989ad8..4029dc6938d8 100644
--- a/Documentation/process/maintainer-soc.rst
+++ b/Documentation/process/maintainer-soc.rst
@@ -169,8 +169,6 @@ more information on the validation of devicetrees.
 For new platforms, or additions to existing ones, ``make dtbs_check`` should not
 add any new warnings.  For RISC-V and Samsung SoC, ``make dtbs_check W=1`` is
 required to not add any new warnings.
-If in any doubt about a devicetree change, reach out to the devicetree
-maintainers.
 
 Branches and Pull Requests
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.51.0


