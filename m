Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22FDC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 02:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzUbwZIB4F19T72AKaCGQM/30jhxW1JXzj8DiQnDWoc=; b=D4BR1NBSR5yAwcgeIlyn1P6G+3
	sXEouN9df5X7+3aDdEktTbXcyUOTZpdHmaAdKdc0KztzI+6jnO6R4xRrRlrWfGwTFVDdNviRxD/Ic
	9cpqPFkhDIM1xVXmNWR6xbAYaSP1WOhQVTQKxH5wiEaz0971FUM0CwZ4tDqijJobtDefm6yOPJiSF
	t+sXnixu6IZO8KB72RE4PNEOiJrGQStrTQ7G2s9Qqbsoki1BnOAr8snJPInERwqRKxlv11FaJHnCK
	HQTs6m2r7mMqfdZV+BDUkROmznvCkq5YQJq2bNf8Mdir9baHF8rBoQGW36wT4089xNOXLpGxwRhTT
	OezCcmgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsYl0-00000009ybq-2mtl;
	Thu, 13 Mar 2025 02:57:14 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsYim-00000009yNW-2btj;
	Thu, 13 Mar 2025 02:54:57 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CKdMuS010776;
	Thu, 13 Mar 2025 02:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=QzUbwZ
	IB4F19T72AKaCGQM/30jhxW1JXzj8DiQnDWoc=; b=toCLS3F1c2VK7uPr8BdLxJ
	F6MTKgHyGbxZJVsVuKazNR8vel0Qlv7RglTPLYYO1nsgEGyAnoa9UpyddJN6/1Vh
	l7Qtw0efh870r8qXauSWW67eXW+vMyW0RQA20ioUX88uatik22Nuurbr93Ayhih0
	jqaSmKJ63brpLkJHuzbC3FgKfc04WZ/EM4xEgHXifXQHjEiQX0dGWeg1Afkq82vL
	jxFHAO7PjhFRvPwhOT67wbprC8FbjphZVIzQ/zU8LBjzO4qLY1LvwU0yaz1z9WvR
	wvWRljR2Jlq6i1f5VCJusy3qbYGcaKv+YnRKSclcox1KmHfjEOZPex/L1Vs/jWeQ
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45bhg098ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 02:54:46 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52D0uGkg026021;
	Thu, 13 Mar 2025 02:54:46 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45atspfhd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 02:54:46 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52D2siVG19792278
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 02:54:44 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E99420043;
	Thu, 13 Mar 2025 02:54:44 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E4F4320040;
	Thu, 13 Mar 2025 02:54:43 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 13 Mar 2025 02:54:43 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0DB40602DC;
	Thu, 13 Mar 2025 13:54:40 +1100 (AEDT)
Message-ID: <006ac081cf0e130426bcf0ef777bed346f6df002.camel@linux.ibm.com>
Subject: Re: [PATCH v13 00/11] Support page table check on PowerPC
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
        pasha.tatashin@soleen.com, akpm@linux-foundation.org,
        maddy@linux.ibm.com
Cc: x86@kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        sweettea-kernel@dorminy.me
Date: Thu, 13 Mar 2025 13:54:39 +1100
In-Reply-To: <20250211161404.850215-1-ajd@linux.ibm.com>
References: <20250211161404.850215-1-ajd@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jFxsMj_j4znHUDzGj8WLKmOskt7bM7Fc
X-Proofpoint-ORIG-GUID: jFxsMj_j4znHUDzGj8WLKmOskt7bM7Fc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=845 lowpriorityscore=0 spamscore=0 impostorscore=0 bulkscore=0
 clxscore=1011 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_195456_772730_1CCBAB03 
X-CRM114-Status: GOOD (  15.09  )
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

On Wed, 2025-02-12 at 03:13 +1100, Andrew Donnellan wrote:
> Support page table check on all PowerPC platforms. This works by
> serialising assignments, reassignments and clears of page table
> entries at each level in order to ensure that anonymous mappings
> have at most one writable consumer, and likewise that file-backed
> mappings are not simultaneously also anonymous mappings.
>=20
> In order to support this infrastructure, a number of stubs must be
> defined for all powerpc platforms. Additionally, seperate
> set_pte_at()
> and set_pte_at_unchecked(), to allow for internal, uninstrumented
> mappings.

Talking to Maddy about this off-list - given that this series touches
on generic code and several architectures, would it be best to take it
through the mm tree rather than powerpc?

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

