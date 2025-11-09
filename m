Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8C6CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 00:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFNsIex1fh6kZSaHLL9twDxgk4m3gMntkS9npVxY98Y=; b=4BX+4My5KiOxAUYlo2uBWpj6O1
	QqROmLigQuuTL0jMkEOHNDg5ow6dsjM12fDQWj50oUvc33W7sXeZ3cM9uW1uuZtx+ul+RZIFzWd9R
	Sk7kbC4NyJKw5t0Wor4xYrJLGC7vJWwXjbTVi42PgNKdsh/XQCoodEJOg6NSjQNh/iz9g5fv837q4
	5+KCi6/kvDM02XrebjC2igJ4eorAtSLWiGEkL4nGo+lthQk2HoIoR7BFI6zzovJLdO1QmkhlTc4fC
	vWPxLOUSPKCyWrF9cXz+HX77VKNLdzF0VDcGavcbF6uKKXhSxmPYv5h48modpDxDbBeOQko2d+gPE
	kT7FQFxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHtVh-00000003c4W-3NBy;
	Sun, 09 Nov 2025 00:42:25 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHtVf-00000003c4D-2ZUf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 00:42:25 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A8LQFXl026160;
	Sun, 9 Nov 2025 00:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=HFNsIex1fh6kZSaHL
	L9twDxgk4m3gMntkS9npVxY98Y=; b=Rx5Gf1LFqD5kBh6sFDpa3fmaPrNNEPTtc
	TlGlwvdMRE51/J0/1Yp+oG6zDTvVQYFonFjzWFMf+H+5KmzbSat76GngADRbPhXL
	LpjtuWDJsgvzQht8f0SMcPWZnv//ORD6L8/OPpTPHMmBl/nAErCo7Vkchq4OP4wg
	5HFkEvKj7Q9HAcBWDNyazHwRz5lmSrLbVOvue/ioV9r1nW3THkqtlExFW8jI52tH
	2i/ZUjTe55uaEu4VlSpCsb0VaTE5cIkM+/ABUSzfMcvbq2XMp2OUAtidqrtxJd88
	O75qx3wH/OhBvnx95raMoO+oGc5/QmLXgDPOAzJfQ+dz0Xyzllt0g==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa5chsqwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Nov 2025 00:42:15 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A90PvqO021463;
	Sun, 9 Nov 2025 00:42:14 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5xrk8rak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Nov 2025 00:42:14 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A90gCfG43516394
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 9 Nov 2025 00:42:12 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 61F8E20043;
	Sun,  9 Nov 2025 00:42:12 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 377B820040;
	Sun,  9 Nov 2025 00:42:12 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  9 Nov 2025 00:42:12 +0000 (GMT)
From: Jan Polensky <japo@linux.ibm.com>
To: japo@linux.ibm.com
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, david@redhat.com,
        linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
        will@kernel.org
Subject: [PATCH] Clarification: please ignore earlier submission
Date: Sun,  9 Nov 2025 01:42:06 +0100
Message-ID: <20251109004206.2512906-1-japo@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251108191948.684586-1-japo@linux.ibm.com>
References: <20251108191948.684586-1-japo@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Ss+dKfO0 c=1 sm=1 tr=0 ts=690fe367 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=lbAZmC-vrXcGRvqt0UMA:9 a=UzISIztuOb4A:10 a=Qzt0FRFQUfIA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDA5NSBTYWx0ZWRfX+dU+fNcX3JOy
 FlOcXdOf3X+m7jaMaQ+6JErw5I9SoecVoJqcBfrN5d+gHNQuyoF9V0z/oxHTq/1ui+SLBbfNsyq
 dE6duGmDs5/OhoFMnXUcejbba7++1wZPOUlVBHqHEvd3UT641A1bXJ3mdA3m0iOnrp5WIANakql
 48hdMqSN7wgd8VWasuGukxwluFOYRmvxcKRALlwRXfoMEunVEAFOo9Ik7+Cmr+W/BViUarBspLj
 dQmSgw1yVu1o0Ra/zK7gKfX5W54y7bbeyuT2RAwqlA0zUhkMIKmhpr9sCfFaloeadwehc9eJ5wP
 GXY8sp+WCe5UMF1JKEQY++r5yLrLobrsfPfrgm8FGd6R56oePehMm0I88Uj/WA9Hx2WeZc7SFpg
 cwDdcsZMIQh7rbryuImM5UJpYi2l5g==
X-Proofpoint-GUID: 7xameQgooeoHv2wocrW2MeVNFc86s5eu
X-Proofpoint-ORIG-GUID: 7xameQgooeoHv2wocrW2MeVNFc86s5eu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_07,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511080095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_164223_657016_C219D989 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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

Hi all,

Apologies for the confusion, the patch titled
"[PATCH] mm/huge_memory: initialise the tags of the huge zero folio"
was accidentally sent.

The correct version is:
https://lore.kernel.org/all/20251109003613.1461433-1-japo@linux.ibm.com/

Thanks,
Jan

