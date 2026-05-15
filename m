Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9072CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 16:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KTyLvnc7a30FszlNQUw0zOTJPAtRhnN7+363lZhWLlo=; b=o4a5DGcvDsNW/hBccrU4ojIQCA
	x4g2JMAY9cIthYJUfzsE3JX/l/niHOfPb78ZS/ffiHkuBZRuxQSuWr1P8iBNAwvlTM+mIaLL7EqKV
	AmrswkphpWW8wQ6/M7gqQV2TmMJtZ0nKrk+J3oEIE2nbQU2iqFWMJTf/rNOlApHogRD01qbgY3HuP
	Ms1q7fSsOJ5YyYb8P0+M7xziTWs4KbyvU2+BUxd6pFXm1K0+nzhRA9pyj7jvQa9DEotbdDyxUgJoh
	AU5ArQzLAGpH82rMoDfNYQnP5xXBwHF7GtkPdTmdrIMa5KjgCxPqtfb5iYUdGh3/h7Z//tlWNTdSp
	qOlKD/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvOl-00000008rsX-03qZ;
	Fri, 15 May 2026 16:28:27 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvOi-00000008rry-2yvt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 16:28:25 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB1cdK393522;
	Fri, 15 May 2026 16:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=KTyLvnc7a30FszlNQUw0zOTJPAtRhn
	N7+363lZhWLlo=; b=bb5l1PMMf1FqFX/tGLriLbIQYiV3VDSmjo2EeMd7AMmWmA
	2hkRp9aSfAlz2TuwuzAO3ZTYJzdZudXarFhbC6OfaZwRNYXW5Pw3LGqDlKx6AD7J
	gADfjG2KvEJsvIywoL9w5Sf9Thb4JazFU37onU4rdhP0IKOxiwlbncQ/rREqqrxM
	HuUDHyArrPr4Geffrsen0UaUKv1edTusKu46giaAGf8SITOY6VBfKxCb0kaPFZkQ
	49zIJbpyLP0t2iQ3PmHfJa9Q/6zR4PRULDay8PZE6JKZjO1B8UqMIZaxJsm4fcMI
	dL8lHjxRkvT1MoiPqX+OQififOg3Z14wTzSXwRWQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e5m8vc539-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 May 2026 16:28:11 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64FGO7K1026003;
	Fri, 15 May 2026 16:28:10 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4e5m3am8wb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 May 2026 16:28:10 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64FGS7R451970304
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 May 2026 16:28:07 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0A9320040;
	Fri, 15 May 2026 16:28:06 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5351E20043;
	Fri, 15 May 2026 16:28:06 +0000 (GMT)
Received: from osiris (unknown [9.87.152.91])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 15 May 2026 16:28:06 +0000 (GMT)
Date: Fri, 15 May 2026 18:28:04 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, cl@gentwo.org,
        dennis@kernel.org, tj@kernel.org, urezki@gmail.com,
        catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com,
        akpm@linux-foundation.org, gor@linux.ibm.com, agordeev@linux.ibm.com,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC v1 PATCH 0/11] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
Message-ID: <20260515162804.10935A18-hca@linux.ibm.com>
References: <20260429170758.3018959-1-yang@os.amperecomputing.com>
 <d16893b5-3a21-4595-b4ce-e34a7e8a199c@kernel.org>
 <583d5984-fc21-4204-9845-8ceabacf823f@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <583d5984-fc21-4204-9845-8ceabacf823f@os.amperecomputing.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: wqAuYEqpyC0PwdB9XTu9vOodcN-WAZSN
X-Authority-Analysis: v=2.4 cv=duXrzVg4 c=1 sm=1 tr=0 ts=6a07499c cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=Ilrfog-IFM-LmiIkkiEA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: Ep4EDxbuyWSfO4E6e2i8hUChjCMZkeqE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE2NCBTYWx0ZWRfX9QwzjTNjAdg8
 zvaaTNbk7r8YnJhAfC4qzFf+enpfMiIs7SYxiwu3DMBBqBGH0HiNNZYunznOi4KY56xMf7NIqVG
 nXBsIwP+a0lHialoCZBVoZ6B0GzN54eafdP/8K0lgA/d1ckJHWKBnE7lcuGBibul+pQVHhhpXOJ
 AQ6BLt9FgcMdBzPP7o/CGcVexl+YW1Kc9uRXyf67j0gdJKE/cd1DOK8H0qKqW1i+TzRU1SY2KBZ
 B4IUn5DCyIHE9R1SaS8rWspYke+SDb+8fvmpuJGJTd7Kvd9KHgtKMJ8zLZ4ndyrJBLvCPIg7XfN
 4C/s0dcQnw2okOJU+kymeT7U5RM8sabO0TXiTHPzzOqPU3KDr34RfIv/QgNkZAKsNUWYAOlKjV3
 7IhpOz8OzrE2bthGyY7RvHK5gEDeM7/srz53S5v86y5jKY7PhuIKPn2dAk51DUtHGQOX5mBiVSf
 1AF+e1H5nADyY2v6RxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_092824_758805_7BE0DEEC 
X-CRM114-Status: GOOD (  15.67  )
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

On Wed, May 13, 2026 at 05:00:19PM -0700, Yang Shi wrote:
> On 5/12/26 2:02 AM, David Hildenbrand (Arm) wrote:
> > There was quite some feedback during the LSF/MM session, what's the current plan?
...
> I'm not sure whether S390 folks will implement this on S390 or not, anyway
> they are cc'ed.

I'm not sure yet, however after I had a look at the architecture documentation
a couple of weeks ago, I think it shouldn't be too hard to get this working on
s390 as well. I was a bit concerned about TLB flushing, if changes to the
kernel mapping happen with per-cpu page tables, but as of now I believe this
shouldn't cause any harm (famous last words...).

